
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

#' @title AdjustBiomass
#'
#' @description
#' First, uses Forest Inventory and Analysis (FIA) Regional Biomass Equations to estimate above-ground stem, bark, and branch tree biomass (uses the California equation set and should not be used for data from other regions). Then, accounts for the loss of biomass in standing dead trees through structural decay.
#'
#' @param data A dataframe or tibble. Each row must be an observation of an individual tree.
#' @param status Must be a variable (column) in the provided dataframe or tibble. Specifies whether the individual tree is alive (1) or dead (0). The class of this variable will be coerced to factor.
#' @param decay_class Must be a variable (column) in the provided dataframe or tibble. For standing dead trees, the decay class should be 1, 2, 3, 4, or 5 (see README file for more detail). For live trees, the decay class should be NA or 0. The class of this variable will be coerced to character.
#' @param species Must be a variable (column) in the provided dataframe or tibble. Specifies the species of the individual tree. Must follow four-letter species code or FIA naming conventions (see README file for more detail). The class of this variable will be coerced to character.
#' @param dbh Must be a numeric variable (column) in the provided dataframe or tibble. Provides the diameter at breast height (DBH) of the individual tree in either centimeters or inches.
#' @param ht Must be a numeric variable (column) in the provided dataframe or tibble. Provides the height of the individual tree in either meters or feet.
#' @param sp_codes Not a variable (column) in the provided dataframe or tibble. Specifies whether the species variable follows the four-letter code or FIA naming convention (see README file for more detail). Must be set to either "4letter" or "fia". The default is set to "4letter".
#' @param units Not a variable (column) in the provided dataframe or tibble. Specifies whether the dbh and ht variables were measured using metric (centimeters and meters) or imperial (inches and feet) units. Also specifies whether the results will be given in metric (kilograms) or imperial (US tons) units. Must be set to either "metric" or "imperial". The default is set to "metric".
#'
#' @return The original dataframe, with four new columns. Biomass estimates for standing dead trees will be adjusted for structural decay.
#' \itemize{
#' \item stem_bio_kg (or stem_bio_tons): biomass of stem in kilograms (or tons)
#' \item bark_bio_kg (or bark_bio_tons): biomass of bark in kilograms (or tons)
#' \item branch_bio_kg (or branch_bio_tons): biomass of branches in kilograms (or tons)
#' \item total_bio_kg (or total_bio_kg): biomass of tree (stem + bark + branches) in kilograms (or tons)
#' }
#'
#'@examples
#'AdjustBiomass(data = bio_demo_data,
#'              status = "Live",
#'              decay_class = "Decay",
#'              species = "SPP",
#'              dbh = "DBH_CM",
#'              ht = "HT_M",
#'              sp_codes = "4letter",
#'              units = "metric")
#'
#' @export

AdjustBiomass <- function(data, status, decay_class, species, dbh, ht, sp_codes = "4letter", units = "metric") {

  # Calculate tree-level biomass
  step1 <- TreeBiomass(data = data,
                       status = status,
                       species = species,
                       dbh = dbh,
                       ht = ht,
                       sp_codes = sp_codes,
                       units = units)

  # Check and prep input data
  step2 <- ValidateAdjData(data_val = step1,
                           status_val = status,
                           decay_val = decay_class)

  # Discount dead tree biomass
  step3 <- Discount(tree_data = step1,
                    tree_status = status,
                    tree_decay = decay_class,
                    tree_sp = species,
                    tree_sp_codes = sp_codes,
                    tree_units = units)

  return(step3)

}


################################################################################
################################################################################
# ValidateTreeData function
################################################################################
################################################################################

ValidateAdjData <- function(data_val, status_val, decay_val) {

  ###########################################################
  # Check that all columns are in the provided dataframe
  ###########################################################

  if(!(decay_val %in% colnames(data_val))) {
    stop('There is no column named "', decay_val, '" in the provided dataframe.')
  }


  ###########################################################
  # Check for unrecognized decay codes
  ###########################################################

  data_val[[decay_val]] <- as.character(data_val[[decay_val]]) # coerce decay_val into character

  if(!all(is.element(data_val[[decay_val]],
                     c("0","1","2","3","4","5",NA)))) {

    unrecognized_decay <- sort(paste0(unique(data_val[!is.element(data_val[[decay_val]],
                                                                  c("0","1","2","3","4","5",NA)), decay_val]),
                                       sep = " "))

    stop('decay_class must be ',0,' through ',5,'!\n',
         'Unrecognized decay class codes: ', unrecognized_decay)
  }


  ###########################################################
  # Check that status and decay_class match
  ###########################################################

  dead_trees <- subset(data_val, !is.na(data_val[[status_val]]) & data_val[[status_val]] == 0)
  dead_miss <- subset(dead_trees, is.na(dead_trees[[decay_val]]) | dead_trees[[decay_val]] == 0)
  live_trees <- subset(data_val, !is.na(data_val[[status_val]]) & data_val[[status_val]] == 1)
  live_miss <- subset(live_trees, !is.na(live_trees[[decay_val]]) & live_trees[[decay_val]] != 0)

  if (nrow(dead_miss) > 0) {

    warning('There are dead trees with NA and/or zero decay class codes.\n',
            'The biomass of these dead trees will NOT be adjusted.\n',
            'Consider investigating these trees with mismatched status/decay class.\n',
            ' \n')

  }

  if (nrow(live_miss) > 0) {

    warning('There are live trees with 1-5 decay class codes.\n',
            'Live trees should have decay class codes of NA or zero.\n',
            'The biomass of these live trees will NOT be adjusted.\n',
            'But you should consider investigating these trees with mismatched status/decay class.\n',
            ' \n')

  }

}


################################################################################
################################################################################
# Discount function
################################################################################
################################################################################

Discount <- function(tree_data, tree_status, tree_decay, tree_sp, tree_sp_codes, tree_units) {

  # bring in live:dead ratio table
  discount <- read.csv(system.file('extdata', 'sd_ratios.csv', package = "UCBForestAnalytics"),
                       stringsAsFactors = FALSE)

  # make sure decay_class and fia_code are character columns
  discount$decay_class <- as.character(discount$decay_class)
  discount$fia_code <- as.character(discount$fia_code)
  tree_data[[tree_decay]] <- as.character(tree_data[[tree_decay]])

  # loop through each row
  n <- nrow(tree_data)

  for(i in 1:n) {

    if (!is.na(tree_data[[tree_status]][i]) & tree_data[[tree_status]][i] == 0 &
        !is.na(tree_data[[tree_decay]][i]) & tree_data[[tree_decay]][i] != 0) {

      sp <- tree_data[[tree_sp]][i]
      sd <- tree_data[[tree_decay]][i]

      # pull out live:dead ratio from table
      if (tree_sp_codes == "4letter") {

        ratio_val <- discount[discount$letter_code == sp & discount$decay_class == sd, "decay_ratio"]

      } else if (tree_sp_codes == "fia") {

        ratio_val <- discount[discount$fia_code == sp & discount$decay_class == sd, "decay_ratio"]

      }

      # discount biomass
      if (tree_units == "metric") {

        tree_data$stem_bio_kg[i] <- round(ratio_val*(tree_data$stem_bio_kg[i]),2)
        tree_data$bark_bio_kg[i] <- round(ratio_val*(tree_data$bark_bio_kg[i]),2)
        tree_data$branch_bio_kg[i] <- round(ratio_val*(tree_data$branch_bio_kg[i]),2)
        tree_data$total_bio_kg[i] <- tree_data$stem_bio_kg[i] + tree_data$bark_bio_kg[i] + tree_data$branch_bio_kg[i]

      } else if (tree_units == "imperial") {

        tree_data$stem_bio_tons[i] <- round(ratio_val*(tree_data$stem_bio_tons[i]),2)
        tree_data$bark_bio_tons[i] <- round(ratio_val*(tree_data$bark_bio_tons[i]),2)
        tree_data$branch_bio_tons[i] <- round(ratio_val*(tree_data$branch_bio_tons[i]),2)
        tree_data$total_bio_tons[i] <- tree_data$stem_bio_tons[i] + tree_data$bark_bio_tons[i] + tree_data$branch_bio_tons[i]

      }

    }

  }

  return(tree_data)

}
