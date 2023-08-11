
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

ForestStr <- function(data, site, plot, exp_factor, ht, dbh, units = "metric") {

  # Check and prep input data
  step1 <- ValidateStrData(data_val = data,
                           site_val = site,
                           plot_val = plot,
                           ef_val = exp_factor,
                           ht_val = ht,
                           dbh_val = dbh,
                           units_val = units)

  # Calculate composition
  step2 <- StrCalc(str_data = step1,
                   str_units = units)

  return(step2)

}


################################################################################
################################################################################
# ValidateCompData function
################################################################################
################################################################################

ValidateStrData <- function(data_val, site_val, plot_val, ef_val, dbh_val, ht_val, units_val) {

  ###########################################################
  # Check that all columns are in the provided dataframe
  ###########################################################

  if(!(site_val %in% colnames(data_val))) {
    stop('There is no column named "', site_val, '" in the provided dataframe.')
  }

  if(!(plot_val %in% colnames(data_val))) {
    stop('There is no column named "', plot_val, '" in the provided dataframe.')
  }

  if(!(ef_val %in% colnames(data_val))) {
    stop('There is no column named "', ef_val, '" in the provided dataframe.')
  }

  if(!(dbh_val %in% colnames(data_val))) {
    stop('There is no column named "', dbh_val, '" in the provided dataframe.')
  }


  ###########################################################
  # Check that column classes are as expected
  ###########################################################

  if(!is.numeric(data_val[[ef_val]])) {
    stop('The parameter exp_factor requires a numerical variable.\n',
         'You have input a variable of class: ', class(data_val[[ef_val]]))
  }

  if(!is.numeric(data_val[[dbh_val]])) {
    stop('The parameter dbh requires a numerical variable.\n',
         'You have input a variable of class: ', class(data_val[[dbh_val]]))
  }


  ###########################################################
  # Check that options are set appropriately
  ###########################################################

  if(units_val == "metric" || units_val == "imperial") {
    # do nothing
  } else {
    stop('The "units" parameter must be set to either "metric" or "imperial".')
  }


  ###########################################################
  # Check for NAs
  ###########################################################

  data_val[[site_val]] <- as.character(data_val[[site_val]]) # coerce into character
  data_val[[plot_val]] <- as.character(data_val[[plot_val]]) # coerce into character

  if ('TRUE' %in% is.na(data_val[[site_val]])) {

    stop('There are missing site names in the provided dataframe.')

  }

  if ('TRUE' %in% is.na(data_val[[plot_val]])) {

    stop('There are missing plot names in the provided dataframe.\n')

  }

  if ('TRUE' %in% is.na(data_val[[ef_val]])) {

    stop('There are missing expansion factors in the provided dataframe.\n')

  }

  if ('TRUE' %in% is.na(data_val[[dbh_val]])) {

    warning('There are trees with missing DBH values in the provided dataframe.\n',
            'Trees with NA DBH will not be included in the composition calculations.\n',
            'Consider addressing these missing values in your data.\n',
            ' \n')

  }


  ###########################################################
  # Final dataframe prep
  ###########################################################

  # rename other columns to use moving forward ---------------------------------
  colnames(data_val)[which(names(data_val) == colnames(data_val[site_val]))] <- "site"
  colnames(data_val)[which(names(data_val) == colnames(data_val[plot_val]))] <- "plot"
  colnames(data_val)[which(names(data_val) == colnames(data_val[ef_val]))] <- "ef"
  colnames(data_val)[which(names(data_val) == colnames(data_val[ht_val]))] <- "ht"
  colnames(data_val)[which(names(data_val) == colnames(data_val[dbh_val]))] <- "dbh"

  return(data_val)

}


################################################################################
################################################################################
# CompCalc function
################################################################################
################################################################################

StrCalc <- function(str_data, str_units) {

  if (str_units == "metric") {

    str_data$ba_tree <- (pi*((str_data$dbh^2)/40000)) # calculate BA

  } else if (str_units == "imperial") {

    str_data$ba_tree <- (pi*((str_data$dbh^2)/576)) # calculate BA

  }

  str_data$ba_area <- str_data$ba_tree*str_data$ef
  str_data$ht_ef <- str_data$ht*str_data$ef
  str_data$dbh_ef <- str_data$dbh*str_data$ef

  # create empty dataframe to fill
  fill_df <- data.frame(matrix(nrow = 0, ncol = 6))

  if (str_units == "metric") {

    colnames(fill_df) <- c("site", "plot", "sph", "ba_m2_ha", "qmd_cm", "ht_m")

  } else if (str_units == "imperial") {

    colnames(fill_df) <- c("site", "plot", "sph", "ba_ft2_ac", "qmd_in", "ht_ft")

  }

  # loop through each site, plot, and species
  forests <- unique(str_data$site)

  for(f in forests) {

    all_plots <- subset(str_data, site == f)
    plot_ids <- unique(all_plots$plot)

    for(p in plot_ids) {

      all_trees <- subset(all_plots, plot == p)

      fill_df[nrow(fill_df) + 1, ] <- NA
      k <- nrow(fill_df)

      ba_area_plot <- round(sum(all_trees$ba_area),2)
      den_plot <- sum(all_trees$ef)
      ht_plot <- round(sum(all_trees$ht_ef, na.rm = TRUE)/den_plot,1)
      ba_tree_plot <- sum(all_trees$ba_area)/den_plot

        if (str_units == "metric") {

          qmd_plot <- round(sqrt((ba_tree_plot*40000)/pi),1)

          fill_df$site[k] <- f
          fill_df$plot[k] <- p
          fill_df$sph[k] <- den_plot
          fill_df$ba_m2_ha[k] <- ba_area_plot
          fill_df$qmd_cm[k] <- qmd_plot
          fill_df$ht_m[k] <- ht_plot

        } else if (str_units == "imperial") {

          qmd_plot <- round(sqrt((ba_tree_plot*576)/pi),1)

          fill_df$site[k] <- f
          fill_df$plot[k] <- p
          fill_df$sph[k] <- den_plot
          fill_df$ba_ft2_ac[k] <- ba_area_plot
          fill_df$qmd_in[k] <- qmd_plot
          fill_df$ht_ft[k] <- ht_plot

        }

      }

    }

  return(fill_df)

  }


