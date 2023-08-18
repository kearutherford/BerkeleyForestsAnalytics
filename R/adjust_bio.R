
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

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

    stop('decay_class must be 0-5!\n',
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

    warning('There are dead trees with NA and/or ',0,' decay class codes.\n',
            'The biomass of these dead trees will NOT be adjusted.\n',
            'Consider investigating these trees with mismatched status/decay class.\n')

  }

  if (nrow(live_miss) > 0) {

    warning('There are live trees with 1-5 decay class codes.\n',
            'Live trees should have decay class codes of NA or ',0,'.\n',
            'The biomass of these live trees will NOT be adjusted.\n',
            'But you should consider investigating these trees with mismatched status/decay class.\n')

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
