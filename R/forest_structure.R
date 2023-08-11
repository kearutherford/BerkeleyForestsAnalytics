
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
#' @param data A dataframe or tibble. Each row must be an observation of an individual tree.
#' @param site Must be a variable (column) in the provided dataframe or tibble. Describes the broader location or forest where the data were collected. The class of this variable will be coerced to character.
#' @param plot Must be a variable (column) in the provided dataframe or tibble. Identifies the plot in which the individual tree was measured. The class of this variable will be coerced to character.
#' @param exp_factor Must be a numeric variable (column) in the provided dataframe or tibble. The expansion factor specifies the number of trees per hectare (or per acre) that a given plot tree represents.
#' @param dbh Must be a numeric variable (column) in the provided dataframe or tibble. Provides the diameter at breast height (DBH) of the individual tree in either centimeters or inches.
#' @param ht Default is set to "ignore", which indicates that tree heights were not taken. If heights were taken, it can be set to a numeric variable (column) in the provided dataframe or tibble, providing the height of the individual tree in either meters or feet.
#' @param units Not a variable (column) in the provided dataframe or tibble. Specifies (1) whether the dbh and ht variables were measured using metric (centimeters and meters) or imperial (inches and feet) units; (2) whether the expansion factor is in metric (stems per hectare) or imperial (stems per acre) units; and (3) whether results will be given in metric or imperial units. Must be set to either "metric" or "imperial". The default is set to "metric".
#'
#' @return A dataframe with the following columns:
#' \itemize{
#' \item site: as described above
#' \item plot: as described above
#' \item sph (or spa): stems per hectare (or stems per acre)
#' \item ba_m2_ha (or ba_ft2_ac): basal area in meters squared per hectare (or feet squared per acre).
#' \item qmd_cm (or qmd_in): quadratic mean diameter in centimeters (or inches). Weighted by the expansion factor.
#' \item dbh_cm (or dbh_in): average diameter at breast height in centimeters (or inches). Weighted by the expansion factor.
#' \item ht_m (or ht_ft): average height in meters (or feet) if ht argument was set. Weighted by the expansion factor.
#' }
#'
#'@examples
#'ForestStr(data = demo_data,
#'          site = "Forest",
#'          plot = "Plot_id",
#'          exp_factor = "SPH",
#'          dbh = "DBH_CM",
#'          ht = "HT_M",
#'          units = "metric")
#'
#' @export

ForestStr <- function(data, site, plot, exp_factor, dbh, ht = "ignore", units = "metric") {

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

  if(ht_val == "ignore") {
    # do nothing
  } else {

    if(!(ht_val %in% colnames(data_val))) {
       stop('There is no column named "', ht_val, '" in the provided dataframe.')
    }

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

  if(ht_val == "ignore") {
    # do nothing
  } else {

    if(!is.numeric(data_val[[ht_val]])) {
       stop('The parameter ht requires a numerical variable.\n',
            'You have input a variable of class: ', class(data_val[[ht_val]]))
    }

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
            'Consider addressing these missing values in your data.\n',
            ' \n')

  }

  if(ht_val == "ignore") {
    # do nothing
  } else {

    if ('TRUE' %in% is.na(data_val[[ht_val]])) {

      warning('There are trees with missing height values in the provided dataframe.\n',
              'Consider addressing these missing values in your data.\n',
              ' \n')

    }

}


  ###########################################################
  # Final dataframe prep
  ###########################################################

  # rename other columns to use moving forward ---------------------------------
  colnames(data_val)[which(names(data_val) == colnames(data_val[site_val]))] <- "site"
  colnames(data_val)[which(names(data_val) == colnames(data_val[plot_val]))] <- "plot"
  colnames(data_val)[which(names(data_val) == colnames(data_val[ef_val]))] <- "ef"
  colnames(data_val)[which(names(data_val) == colnames(data_val[dbh_val]))] <- "dbh"

  if(ht_val == "ignore") {

    data_val <- subset(data_val, select = c(site, plot, ef, dbh))

  } else {

    colnames(data_val)[which(names(data_val) == colnames(data_val[ht_val]))] <- "ht"
    data_val <- subset(data_val, select = c(site, plot, ef, dbh, ht))

  }

  return(data_val)

}


################################################################################
################################################################################
# CompCalc function
################################################################################
################################################################################

StrCalc <- function(str_data, str_units) {

  # calculate BA
  if (str_units == "metric") {

    str_data$ba_tree <- (pi*((str_data$dbh^2)/40000))

  } else if (str_units == "imperial") {

    str_data$ba_tree <- (pi*((str_data$dbh^2)/576))

  }

  str_data$ba_area <- str_data$ba_tree*str_data$ef
  str_data$dbh_ef <- str_data$dbh*str_data$ef

  if ("ht" %in% colnames(str_data)) {

    str_data$ht_ef <- str_data$ht*str_data$ef

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
      den_plot <- sum(all_trees$ef)
      ba_tree_plot <- sum(all_trees$ba_area, na.rm = TRUE)/den_plot
      dbh_plot <- round(sum(all_trees$dbh_ef, na.rm = TRUE)/den_plot,1)

      if ("ht" %in% colnames(str_data)) {
        ht_plot <- round(sum(all_trees$ht_ef, na.rm = TRUE)/den_plot,1)
      }

        if (str_units == "metric") {

          qmd_plot <- round(sqrt((ba_tree_plot*40000)/pi),1)

          fill_df$site[k] <- f
          fill_df$plot[k] <- p
          fill_df$sph[k] <- den_plot
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
          fill_df$spa[k] <- den_plot
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
