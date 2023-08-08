ValidateData2 <- function(data_val, site_val, plot_val) {

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

    warning('There are missing (NA) status codes in the provided data frame.\n',
            'Trees with NA status codes will have NA biomass estimates.\n',
            ' \n')
  }

  if(!all(is.element(data_val[[status_val]],
                     c("0","1", NA)))) {

    unrecognized_status <- paste0(unique(data_val[!is.element(data_val[[status_val]],
                                                              c("0", "1", NA)), status_val]),
                                  sep = " ")

    stop('Status must be 0 or 1!\n',
         'Unrecognized status codes: ', unrecognized_status)
  }


  ###########################################################
  # Check that species codes are as expected
  ###########################################################

  data_val[[sp_val]] <- as.character(data_val[[sp_val]]) # coerce sp_val into character

  if ('TRUE' %in% is.na(data_val[[sp_val]])) {

    warning('There are missing (NA) species codes in the provided data frame.\n',
            'Trees with NA species codes will have NA biomass estimates.\n',
            'Consider assigning unknown conifer (UNCO), unknown hardwood (UNHA), or unknown tree (UNTR), as appropriate.\n',
            ' \n')
  }

  if (sp_codes_val == "4letter") {

    if(!('TRUE' %in% (data_val[[sp_val]] %in% sp_code_names$letter))) {

      stop('No species codes recognized!\n',
           'Check how you set the "sp_codes" parameter.')
    }

    if(!all(is.element(data_val[[sp_val]],
                       sp_code_names$letter))) {

      unrecognized_sp <- paste0(unique(data_val[!is.element(data_val[[sp_val]],
                                                            sp_code_names$letter), sp_val]),
                                sep = " ")

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

      unrecognized_sp <- paste0(unique(data_val[!is.element(data_val[[sp_val]],
                                                            sp_code_names$fia), sp_val]),
                                sep = " ")

      stop('Not all species codes were recognized!\n',
           'Unrecognized codes: ', unrecognized_sp)
    }
  }


  ###########################################################
  # Check that DBH and height are within range
  ###########################################################

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(data_val[[dbh_val]])) {

    warning('There are missing (NA) DBH values in the provided data frame.\n',
            'Trees with NA DBH will have NA biomass estimates.\n',
            ' \n')
  }

  if ('TRUE' %in% is.na(data_val[[ht_val]])) {

    warning('There are missing (NA) tree height values in the provided data frame.\n',
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
        warning('The allometric equations are for live trees with DBH >= 2.5cm and dead trees with DBH >= 12.7cm.',
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
