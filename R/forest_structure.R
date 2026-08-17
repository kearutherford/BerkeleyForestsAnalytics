
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

#' @title ForestStr
#'
#' @description
#' Compiles forest structure at the plot level.
#'
#' @param data A dataframe or tibble with the following columns: site, plot, exp_factor, dbh, and ht (optional). Each row must be an observation of an individual tree.
#' @param units Not a variable (column) in the provided dataframe or tibble. Specifies (1) whether the dbh and ht variables were measured using metric (centimeters and meters) or imperial (inches and feet) units; (2) whether the expansion factor is in metric (stems per hectare) or imperial (stems per acre) units; and (3) whether results will be given in metric or imperial units. Must be set to either "metric" or "imperial". The default is set to "metric".
#'
#' @return A dataframe with the following columns:
#' \itemize{
#' \item site
#' \item plot
#' \item sph (or spa): stems per hectare (or stems per acre)
#' \item ba_m2_ha (or ba_ft2_ac): basal area in meters squared per hectare (or feet squared per acre).
#' \item qmd_cm (or qmd_in): quadratic mean diameter in centimeters (or inches). Weighted by the expansion factor.
#' \item dbh_cm (or dbh_in): average diameter at breast height in centimeters (or inches). Weighted by the expansion factor.
#' \item ht_m (or ht_ft): average height in meters (or feet) if ht argument was set. Weighted by the expansion factor.
#' }
#'
#' @examples
#' ForestStr(data = for_demo_data,
#'           units = "metric")
#'
#' @export

ForestStr <- function(data, units = "metric") {

  # Check and prep input data
  ValidateStrData(data_val = data, units_val = units)

  # Calculate composition
  step1 <- StrCalc(str_data = data, str_units = units)

  return(step1)

}


################################################################################
################################################################################
# ValidateCompData function
################################################################################
################################################################################

ValidateStrData <- function(data_val, units_val) {

  # coerce tibble inputs into data.frame
  data_val <- as.data.frame(data_val)


  ###########################################################
  # Check that options are set appropriately
  ###########################################################

  if(units_val == "metric" || units_val == "imperial") {
    # do nothing
  } else {
    stop('The "units" parameter must be set to either "metric" or "imperial".')
  }


  ###########################################################
  # Check that all columns are in the provided dataframe
  ###########################################################

  if(!("site" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "site" column.')
  }

  if(!("plot" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "plot" column.')
  }

  if(!("exp_factor" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "exp_factor" column.')
  }

  if(!("dbh" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "dbh" column.')
  }


  ###########################################################
  # Check that column classes are as expected
  ###########################################################

  # Categorical variables ------------------------------------------------------
  if(!is.character(data_val$site)) {
    stop('"site" must be a character variable.\n',
         'You have input a variable of class: ', class(data_val$site))
  }

  if(!is.character(data_val$plot)) {
    stop('"plot" must be a character variable.\n',
         'You have input a variable of class: ', class(data_val$plot))
  }

  # Numeric variables ----------------------------------------------------------
  if(!is.numeric(data_val$exp_factor)) {
    stop('"exp_factor" must be a numerical variable.\n',
         'You have input a variable of class: ', class(data_val$exp_factor))
  }

  if(!is.numeric(data_val$dbh)) {
    stop('"dbh" must be a numerical variable.\n',
         'You have input a variable of class: ', class(data_val$dbh))
  }

  if("ht" %in% names(data_val) && !is.numeric(data_val$ht)) {
    stop('"ht" must be a numerical variable.\n',
         'You have input a variable of class: ', class(data_val$ht))
  }


  ###########################################################
  # Check that site and plot are as expected
  ###########################################################

  if ('TRUE' %in% is.na(data_val$site)) {
    stop('There are missing site names in the provided dataframe.')
  }

  if ('TRUE' %in% is.na(data_val$plot)) {
    stop('There are missing plot names in the provided dataframe.')
  }


  ##########################################################
  # check that expansion factor is as expected
  ##########################################################

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(data_val$exp_factor)) {

    stop('There are missing expansion factors in the provided dataframe.\n',
         'For plots with no trees, put 0 for the exp_factor.')

  }

  # Check for negative ef ------------------------------------------------------
  if (min(data_val$exp_factor) < 0) {
    stop('There are negative expansion factors in the provided dataframe. All expansion factors must be >= 0.')
  }

  # Check for proper use of 0 ef -----------------------------------------------
  forests <- unique(data_val$site)

  for(f in forests) {

    all_plots <- subset(data_val, site == f)
    plot_ids <- unique(all_plots$plot)

    for(p in plot_ids) {

      all_trees <- subset(all_plots, plot == p)

      if('TRUE' %in% is.element(all_trees$exp_factor, 0)) {

        n <- nrow(all_trees)

        if(n > 1) {

          stop('There are plots with a recorded expansion factor of 0, but with more than one row.\n',
               'Plots with no trees should be represented by a single row with site and plot filled in as appropriate and an exp_factor of 0.')

        }

      }

    }

  }

  if('ht' %in% names(data_val)) {
    plots_wo_trees <- subset(data_val, exp_factor == 0, select = c(dbh))
  } else {
    plots_wo_trees <- subset(data_val, exp_factor == 0, select = c(dbh, ht))
  }

  if('FALSE' %in% is.na(plots_wo_trees)) {

    stop('There are plots with a recorded expansion factor of 0, but with non-NA dbh or ht.\n',
         'Plots with no trees should be represented by a single row with site and plot filled in as appropriate, an exp_factor of 0,\n',
         'NA dbh and, if applicatable, NA ht.')

  }


  ###########################################################
  # Check that dbh is as expected
  ###########################################################

  plots_w_trees <- subset(data_val, exp_factor > 0) # pull out plots that have trees

  # Check for negative dbh -----------------------------------------------------
  if (min(data_val$dbh, na.rm = TRUE) < 0) {
    stop('There are negative DBH values in the provided dataframe. All DBH values must be >= 0.')
  }

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(plots_w_trees$dbh)) {

    warning('There are trees with missing DBH values in the provided dataframe.\n',
            'Consider addressing these missing values in your data.\n',
            ' \n')

  }


  ###########################################################
  # Check that ht is as expected
  ###########################################################

  if ('ht' %in% names(data_val)) {

    # Check for negative ht ----------------------------------------------------
    if (min(data_val$ht, na.rm = TRUE) < 0) {
      stop('There are negative heights in the provided dataframe. All heights must be >= 0.')
    }

    # Check for NA -------------------------------------------------------------
    if ('TRUE' %in% is.na(plots_w_trees$ht)) {

      warning('There are trees with missing height values in the provided dataframe.\n',
              'Consider addressing these missing values in your data.\n',
              ' \n')

    }

  }

}


################################################################################
################################################################################
# StrCalc function
################################################################################
################################################################################

StrCalc <- function(str_data, str_units) {

  # calculate BA
  if (str_units == "metric") {

    str_data$ba_tree <- (pi*((str_data$dbh^2)/40000))

  } else if (str_units == "imperial") {

    str_data$ba_tree <- (pi*((str_data$dbh^2)/576))

  }

  str_data$ba_area <- str_data$ba_tree*str_data$exp_factor
  str_data$dbh_ef <- str_data$dbh*str_data$exp_factor

  if ("ht" %in% colnames(str_data)) {

    str_data$ht_ef <- str_data$ht*str_data$exp_factor

  }

  # create empty dataframe to fill
  if (str_units == "metric" & "ht" %in% colnames(str_data)) {

    fill_df <- data.frame(matrix(nrow = 0, ncol = 7))
    colnames(fill_df) <- c("site", "plot", "sph", "ba_m2_ha", "qmd_cm", "dbh_cm", "ht_m")

  } else if (str_units == "metric" & !("ht" %in% colnames(str_data))) {

    fill_df <- data.frame(matrix(nrow = 0, ncol = 6))
    colnames(fill_df) <- c("site", "plot", "sph", "ba_m2_ha", "qmd_cm", "dbh_cm")

  } else if (str_units == "imperial" & "ht" %in% colnames(str_data)) {

    fill_df <- data.frame(matrix(nrow = 0, ncol = 7))
    colnames(fill_df) <- c("site", "plot", "spa", "ba_ft2_ac", "qmd_in", "dbh_in", "ht_ft")

  } else if (str_units == "imperial" & !("ht" %in% colnames(str_data))) {

    fill_df <- data.frame(matrix(nrow = 0, ncol = 6))
    colnames(fill_df) <-  c("site", "plot", "spa", "ba_ft2_ac", "qmd_in", "dbh_in")

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

      ba_area_plot <- round(sum(all_trees$ba_area, na.rm = TRUE),2)
      den_plot <- sum(all_trees$exp_factor)

      if (den_plot > 0) {

        ba_tree_plot <- sum(all_trees$ba_area, na.rm = TRUE)/den_plot
        dbh_plot <- round(sum(all_trees$dbh_ef, na.rm = TRUE)/den_plot,1)

      } else {

        ba_tree_plot <- NA
        dbh_plot <- NA

      }

      if ("ht" %in% colnames(str_data) & den_plot > 0) {

        ht_plot <- round(sum(all_trees$ht_ef, na.rm = TRUE)/den_plot,1)

      } else if ("ht" %in% colnames(str_data) & den_plot == 0){

        ht_plot <- NA

      }

        if (str_units == "metric") {

          qmd_plot <- round(sqrt((ba_tree_plot*40000)/pi),1)

          fill_df$site[k] <- f
          fill_df$plot[k] <- p
          fill_df$sph[k] <- round(den_plot,0)
          fill_df$ba_m2_ha[k] <- ba_area_plot
          fill_df$qmd_cm[k] <- qmd_plot
          fill_df$dbh_cm[k] <- dbh_plot

          if ("ht" %in% colnames(str_data)) {
            fill_df$ht_m[k] <- ht_plot
          }

        } else if (str_units == "imperial") {

          qmd_plot <- round(sqrt((ba_tree_plot*576)/pi),1)

          fill_df$site[k] <- f
          fill_df$plot[k] <- p
          fill_df$spa[k] <- round(den_plot,0)
          fill_df$ba_ft2_ac[k] <- ba_area_plot
          fill_df$qmd_in[k] <- qmd_plot
          fill_df$dbh_in[k] <- dbh_plot

          if ("ht" %in% colnames(str_data)) {
            fill_df$ht_ft[k] <- ht_plot
          }

        }

    }

  }

  return(fill_df)

}
