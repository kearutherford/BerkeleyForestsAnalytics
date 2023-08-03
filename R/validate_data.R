ValidateData <- function(data_val, site_val, plot_val, sp_val, dbh_val, ht_val, sp_codes_val, units_val) {

  # coerce tibble inputs into data.frame
  data_val <- as.data.frame(data_val)


  ###########################################################
  # Check that all columns are in the provided dataframe
  ###########################################################

  if(!(site_val %in% colnames(data_val))) {
    stop('There is no column named "', site_val, '" in the provided dataframe.')
  }

  if(!(plot_val %in% colnames(data_val))) {
    stop('There is no column named "', plot_val, '" in the provided dataframe.')
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
  # Check that species codes are as expected
  ###########################################################

  data_val[[sp_val]] <- as.character(data_val[[sp_val]]) # coerce sp_val into character

  if ('TRUE' %in% is.na(data_val[[sp_val]])) {

    warning('There are missing (NA) species codes in the provided data frame.\n',
            'Trees with NA species codes will have NA biomass estimates.\n',
            'Consider assigning unknown conifer (UNCO) or unknown hardwood (UNHA), as appropriate.\n',
            ' \n')
  }

  if (sp_codes_val == "4letter") {

    if(!('TRUE' %in% (data_val[[sp_val]] %in% sp_code_names$letter))) {

      stop('No species codes recognized!\n',
           'Check how you set the "sp_codes" parameter.')
    }

    if(!all(is.element(data_val[[sp_val]],
                       sp_code_names$letter))) {

      unrecognized <- paste0(unique(data_val[!is.element(data_val[[sp_val]],
                                                  sp_code_names$letter), sp_val]),
                             sep = " ")

      stop('Not all species codes were recognized!\n',
           'Unrecognized codes: ', unrecognized)
    }

  } else if (sp_codes_val == "fia") {

    if(!('TRUE' %in% (data_val[[sp_val]] %in% sp_code_names$fia))) {

      stop('No species codes recognized!\n',
           'Check how you set the "sp_codes" parameter.')
    }

    if(!all(is.element(data_val[[sp_val]],
                       sp_code_names$fia))) {

      unrecognized <- paste0(unique(data_val[!is.element(data_val[[sp_val]],
                                                         sp_code_names$fia), sp_val]),
                             sep = " ")

      stop('Not all species codes were recognized!\n',
           'Unrecognized codes: ', unrecognized)
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
  if (units_val == "metric") {

    if (min(data_val[[dbh_val]], na.rm = TRUE) < 2.5) {
      warning('The allometric equations are for trees with DBH >= 2.5cm.\n',
              'You inputted trees with DBH < 2.5cm. These trees were filtered out.\n',
              ' \n')
    }

    if (min(data_val[[ht_val]], na.rm = TRUE) < 1.37) {
      warning('The allometric equations are for trees with height >= 1.37m.\n',
              'You inputted trees with height < 1.37m. These trees were filtered out.\n',
              ' \n')
    }

    data_filter_dbh <- subset(data_val, data_val[[dbh_val]] >= 2.5 | is.na(data_val[[dbh_val]]))
    data_filter <- subset(data_filter_dbh, data_filter_dbh[[ht_val]] >= 1.37 | is.na(data_filter_dbh[[ht_val]]))

  } else if (units_val == "imperial") {

    if (min(data_val[[dbh_val]], na.rm = TRUE) < 1.0) {
      warning('The allometric equations are for trees with DBH >= 1.0in.\n',
              'You inputted trees with DBH < 1.0in. These trees were filtered out.\n',
              ' \n')
    }

    if (min(data_val[[ht_val]], na.rm = TRUE) < 4.5) {
      warning('The allometric equations are for trees with height >= 4.5ft.\n',
              'You inputted trees with height < 4.5ft. These trees were filtered out.\n',
              ' \n')
    }

    data_filter_dbh <- subset(data_val, data_val[[dbh_val]] >= 1.0 | is.na(data_val[[dbh_val]]))
    data_filter <- subset(data_filter_dbh, data_filter_dbh[[ht_val]] >= 4.5 | is.na(data_filter_dbh[[ht_val]]))

  }


  ###########################################################
  # Ensure that metric and imperial units both exist
  ###########################################################

  if (units_val == "metric") {

    data_filter$dbh_in <- data_filter[[dbh_val]]/2.54
    data_filter$ht_ft <- data_filter[[ht_val]]*3.281

    colnames(data_filter)[which(names(data_filter) == colnames(data_filter[dbh_val]))] <- "dbh_cm"
    colnames(data_filter)[which(names(data_filter) == colnames(data_filter[ht_val]))] <- "ht_m"

  } else if (units_val == "imperial") {

    data_filter$dbh_cm <- data_filter[[dbh_val]]*2.54
    data_filter$ht_m <- data_filter[[ht_val]]/3.281

    colnames(data_filter)[which(names(data_filter) == colnames(data_filter[dbh_val]))] <- "dbh_in"
    colnames(data_filter)[which(names(data_filter) == colnames(data_filter[ht_val]))] <- "ht_ft"

  }


  ###########################################################
  # Final dataframe prep
  ###########################################################

  # coerce site and plot into characters ---------------------------------------
  data_filter[[site_val]] <- as.character(data_filter[[site_val]])
  data_filter[[plot_val]] <- as.character(data_filter[[plot_val]])

  # rename other columns to use moving forward ---------------------------------
  colnames(data_filter)[which(names(data_filter) == colnames(data_filter[site_val]))] <- "site"
  colnames(data_filter)[which(names(data_filter) == colnames(data_filter[plot_val]))] <- "plot"
  colnames(data_filter)[which(names(data_filter) == colnames(data_filter[sp_val]))] <- "species"

  return(data_filter)

}
