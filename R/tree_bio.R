
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

#' @title TreeBiomass
#'
#' @description
#' Uses Forest Inventory and Analysis (FIA) Regional Biomass Equations to estimate above-ground stem, bark, and branch tree biomass. The package uses the California equation set and should not be used for data from other regions.
#'
#' @param data A dataframe or tibble. Each row must be an observation of an individual tree.
#' @param status Must be a variable (column) in the provided dataframe or tibble. Specifies whether the individual tree is alive (1) or dead (0). The class of this variable will be coerced to factor.
#' @param species Must be a variable (column) in the provided dataframe or tibble. Specifies the species of the individual tree. Must follow four-letter species code or FIA naming conventions (see README file for more detail). The class of this variable will be coerced to character.
#' @param dbh Must be a numeric variable (column) in the provided dataframe or tibble. Provides the diameter at breast height (DBH) of the individual tree in either centimeters or inches.
#' @param ht Must be a numeric variable (column) in the provided dataframe or tibble. Provides the height of the individual tree in either meters or feet.
#' @param sp_codes Not a variable (column) in the provided dataframe or tibble. Specifies whether the species variable follows the four-letter code or FIA naming convention (see README file for more detail). Must be set to either "4letter" or "fia". The default is set to "4letter".
#' @param units Not a variable (column) in the provided dataframe or tibble. Specifies whether the dbh and ht variables were measured using metric (centimeters and meters) or imperial (inches and feet) units. Also specifies whether the results will be given in metric (kilograms) or imperial (US tons) units. Must be set to either "metric" or "imperial". The default is set to "metric".
#'
#' @return The original dataframe, with four new columns:
#' \itemize{
#' \item stem_bio_kg (or stem_bio_tons): biomass of stem in kilograms (or tons)
#' \item bark_bio_kg (or bark_bio_tons): biomass of bark in kilograms (or tons)
#' \item branch_bio_kg (or branch_bio_tons): biomass of branches in kilograms (or tons)
#' \item total_bio_kg (or total_bio_kg): biomass of tree (stem + bark + branches) in kilograms (or tons)
#' }
#'
#'@examples
#'TreeBiomass(data = demo_data,
#'            status = "Live",
#'            species = "SPP",
#'            dbh = "DBH_CM",
#'            ht = "HT_M",
#'            sp_codes = "4letter",
#'            units = "metric")
#'
#' @export

TreeBiomass <- function(data, status, species, dbh, ht, sp_codes = "4letter", units = "metric") {

  # Check and prep input data
  step1 <- ValidateTreeData(data_val = data,
                            status_val = status,
                            sp_val = species,
                            dbh_val = dbh,
                            ht_val = ht,
                            sp_codes_val = sp_codes,
                            units_val = units)

  # Calculate stem biomass
  step2 <- StemBiomass(tree_data = step1)

  # Calculate bark biomass
  step3 <- BarkBiomass(tree_data = step2)

  # Calculate branch biomass
  step4 <- BranchBiomass(tree_data = step3)

  # Format output dataframe
  step5 <- FinalTreeDF(data_1 = data,
                       data_2 = step4,
                       status_orig = status,
                       sp_orig = species,
                       dbh_orig = dbh,
                       ht_orig = ht,
                       units_orig = units)

  return(step5)
}


################################################################################
################################################################################
# ValidateTreeData function
################################################################################
################################################################################

ValidateTreeData <- function(data_val, status_val, sp_val, dbh_val, ht_val, sp_codes_val, units_val) {

  # coerce tibble inputs into data.frame
  data_val <- as.data.frame(data_val)


  ###########################################################
  # Check that all columns are in the provided dataframe
  ###########################################################

  if(!(status_val %in% colnames(data_val))) {
    stop('There is no column named "', status_val, '" in the provided dataframe.')
  }

  if(!(sp_val %in% colnames(data_val))) {
    stop('There is no column named "', sp_val, '" in the provided dataframe.')
  }

  if(!(dbh_val %in% colnames(data_val))) {
    stop('There is no column named "', dbh_val, '" in the provided dataframe.')
  }

  if(!(ht_val %in% colnames(data_val))) {
    stop('There is no column named "', ht_val, '" in the provided dataframe.')
  }


  ###########################################################
  # Check that column classes are as expected
  ###########################################################

  if(!is.numeric(data_val[[dbh_val]])) {
    stop('The parameter dbh requires a numerical variable.\n',
         'You have input a variable of class: ', class(data_val[[dbh_val]]))
  }

  if(!is.numeric(data_val[[ht_val]])) {
    stop('The parameter ht requires a numerical variable.\n',
         'You have input a variable of class: ', class(data_val[[ht_val]]))
  }


  ###########################################################
  # Check that options are set appropriately
  ###########################################################

  if(sp_codes_val == "4letter" || sp_codes_val == "fia") {
    # do nothing
  } else {
    stop('The "sp_codes" parameter must be set to either "4letter" or "fia."')
  }

  if(units_val == "metric" || units_val == "imperial") {
    # do nothing
  } else {
    stop('The "units" parameter must be set to either "metric" or "imperial."')
  }


  ###########################################################
  # Check that status is as expected
  ###########################################################

  data_val[[status_val]] <- as.factor(data_val[[status_val]]) # coerce status_val into factor

  if ('TRUE' %in% is.na(data_val[[status_val]])) {

    warning('There are missing status codes in the provided dataframe.\n',
            'Trees with NA status codes will have NA biomass estimates.\n',
            ' \n')
  }

  if(!all(is.element(data_val[[status_val]],
                     c("0","1", NA)))) {

    unrecognized_status <- sort(paste0(unique(data_val[!is.element(data_val[[status_val]],
                                                  c("0", "1", NA)), status_val]),
                                sep = " "))

    stop('Status must be 0 or 1!\n',
         'Unrecognized status codes: ', unrecognized_status)
  }


  ###########################################################
  # Check that species codes are as expected
  ###########################################################

  data_val[[sp_val]] <- as.character(data_val[[sp_val]]) # coerce sp_val into character

  if ('TRUE' %in% is.na(data_val[[sp_val]])) {

    warning('There are missing species codes in the provided dataframe.\n',
            'Trees with NA species codes will have NA biomass estimates.\n',
            'Consider assigning unknown conifer, unknown hardwood, or unknown tree, as appropriate.\n',
            ' \n')
  }

  if (sp_codes_val == "4letter") {

    if(!('TRUE' %in% (data_val[[sp_val]] %in% sp_code_names$letter))) {

      stop('No species codes recognized!\n',
           'Check how you set the "sp_codes" parameter.')
    }

    if(!all(is.element(data_val[[sp_val]],
                       sp_code_names$letter))) {

      unrecognized_sp <- sort(paste0(unique(data_val[!is.element(data_val[[sp_val]],
                                            sp_code_names$letter), sp_val]),
                              sep = " "))

      stop('Not all species codes were recognized!\n',
           'Unrecognized codes: ', unrecognized_sp)
    }

  } else if (sp_codes_val == "fia") {

    if(!('TRUE' %in% (data_val[[sp_val]] %in% sp_code_names$fia))) {

      stop('No species codes recognized!\n',
           'Check how you set the "sp_codes" parameter.')
    }

    if(!all(is.element(data_val[[sp_val]],
                       sp_code_names$fia))) {

      unrecognized_sp <- sort(paste0(unique(data_val[!is.element(data_val[[sp_val]],
                                                sp_code_names$fia), sp_val]),
                              sep = " "))

      stop('Not all species codes were recognized!\n',
           'Unrecognized codes: ', unrecognized_sp)
    }
  }


  ###########################################################
  # Check that DBH and height are within range
  ###########################################################

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(data_val[[dbh_val]])) {

    warning('There are missing DBH values in the provided dataframe.\n',
            'Trees with NA DBH will have NA biomass estimates.\n',
            ' \n')
  }

  if ('TRUE' %in% is.na(data_val[[ht_val]])) {

    warning('There are missing tree height values in the provided dataframe.\n',
            'Trees with NA height will have NA biomass estimates.\n',
            ' \n')
  }

  # Check for allometric equation cutoffs --------------------------------------

  live_trees <- subset(data_val, data_val[[status_val]] == 1)
  dead_trees <- subset(data_val, data_val[[status_val]] == 0)

  if (units_val == "metric") {

    if(nrow(live_trees) > 0) {

      if (min(live_trees[[dbh_val]], na.rm = TRUE) < 2.5) {
          warning('The allometric equations are for live trees with DBH >= 2.5cm and dead trees with DBH >= 12.7cm.\n',
                  'You inputted live trees with DBH < 2.5cm. These trees will have NA biomass estimates.\n',
                  ' \n')
      }
    }

    if(nrow(dead_trees) > 0) {

      if (min(dead_trees[[dbh_val]], na.rm = TRUE) < 12.7) {
          warning('The allometric equations are for live trees with DBH >= 2.5cm and dead trees with DBH >= 12.7cm.\n',
                  'You inputted dead trees with DBH < 12.7cm. These trees will have NA biomass estimates.\n',
                  ' \n')
      }
    }

    if (min(data_val[[ht_val]], na.rm = TRUE) < 1.37) {
        warning('The allometric equations are for trees with height >= 1.37m.\n',
                'You inputted trees with height < 1.37m. These trees will have NA biomass estimates.\n',
                ' \n')
    }

  } else if (units_val == "imperial") {

    if(nrow(live_trees) > 0) {

      if (min(live_trees[[dbh_val]], na.rm = TRUE) < 1.0) {
          warning('The allometric equations are for live trees with DBH >= 1.0in and dead trees with DBH >= 5.0in.\n',
                  'You inputted live trees with DBH < 1.0in. These trees will have NA biomass estimates.\n',
                  ' \n')
      }
    }

    if(nrow(dead_trees) > 0) {

      if (min(dead_trees[[dbh_val]], na.rm = TRUE) < 5.0) {
        warning('The allometric equations are for live trees with DBH >= 1.0in and dead trees with DBH >= 5.0in.\n',
                'You inputted dead trees with DBH < 5.0in. These trees will have NA biomass estimates.\n',
                ' \n')
      }
    }

    if (min(data_val[[ht_val]], na.rm = TRUE) < 4.5) {
      warning('The allometric equations are for trees with height >= 4.5ft.\n',
              'You inputted trees with height < 4.5ft. These trees will have NA biomass estimates.\n',
              ' \n')
    }

  }


  ###########################################################
  # Ensure that metric and imperial units both exist
  ###########################################################

  if (units_val == "metric") {

    data_val$dbh_in <- data_val[[dbh_val]]/2.54
    data_val$ht_ft <- data_val[[ht_val]]*3.281

    colnames(data_val)[which(names(data_val) == colnames(data_val[dbh_val]))] <- "dbh_cm"
    colnames(data_val)[which(names(data_val) == colnames(data_val[ht_val]))] <- "ht_m"

  } else if (units_val == "imperial") {

    data_val$dbh_cm <- data_val[[dbh_val]]*2.54
    data_val$ht_m <- data_val[[ht_val]]/3.281

    colnames(data_val)[which(names(data_val) == colnames(data_val[dbh_val]))] <- "dbh_in"
    colnames(data_val)[which(names(data_val) == colnames(data_val[ht_val]))] <- "ht_ft"

  }


  ###########################################################
  # Final dataframe prep
  ###########################################################

  # rename other columns to use moving forward ---------------------------------
  colnames(data_val)[which(names(data_val) == colnames(data_val[status_val]))] <- "status"
  colnames(data_val)[which(names(data_val) == colnames(data_val[sp_val]))] <- "species"

  return(data_val)

}


################################################################################
################################################################################
# FinalTreeDF function
################################################################################
################################################################################

FinalTreeDF <- function(data_1, data_2, status_orig, sp_orig, dbh_orig, ht_orig, units_orig) {

  if (units_orig == "metric") {

    final_df <- subset(data_2, select = -c(dbh_in, ht_ft, stem_bio_tons, bark_bio_tons, branch_bio_tons, total_bio_tons))
    names(final_df)[names(final_df) == "dbh_cm"] <- colnames(data_1[dbh_orig])
    names(final_df)[names(final_df) == "ht_m"] <- colnames(data_1[ht_orig])

  } else if (units_orig == "imperial") {

    final_df <- subset(data_2, select = -c(dbh_cm, ht_m, stem_bio_kg, bark_bio_kg, branch_bio_kg, total_bio_kg))
    names(final_df)[names(final_df) == "dbh_in"] <- colnames(data_1[dbh_orig])
    names(final_df)[names(final_df) == "ht_ft"] <- colnames(data_1[ht_orig])

  }

  names(final_df)[names(final_df) == "status"] <- colnames(data_1[status_orig])
  names(final_df)[names(final_df) == "species"] <- colnames(data_1[sp_orig])

  rownames(final_df) <- NULL

  return(final_df)

}

utils::globalVariables(c("bark_eq", "branch_eq", "density", "dbh_in", "ht_ft", "dbh_cm", "ht_m", "vol_eq", "eq_group", "CVTS",
                         "stem_bio_tons", "bark_bio_tons", "branch_bio_tons", "total_bio_tons", "stem_bio_kg", "bark_bio_kg", "branch_bio_kg", "total_bio_kg"))
