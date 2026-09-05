
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

#' @title ForestComp
#'
#' @description
#' Compiles forest composition at the plot level. Measured as relative basal area or relative density for live trees.
#'
#' @param data A dataframe or tibble with the following columns: site, plot, exp_factor, status, species, and dbh. Each row must be an observation of an individual tree.
#' @param relative Not a variable (column) in the provided dataframe or tibble. Specifies whether forest composition should be measured as relative basal area or relative density. Must be set to either "BA" or "density". The default is set to "BA".
#' @param units Not a variable (column) in the provided dataframe or tibble. Specifies whether the dbh variable was measured using metric (centimeters) or imperial (inches) units. Must be set to either "metric" or "imperial". The default is set to "metric".
#'
#' @return A dataframe with the following columns:
#' \itemize{
#' \item site
#' \item plot
#' \item species
#' \item dominance: relative basal area (or relative density) in percent (%)
#' }
#'
#' @examples
#' ForestComp(data = for_demo_data,
#'            relative = "BA",
#'            units = "metric")
#'
#' @export

ForestComp <- function(data, relative = "BA", units = "metric") {

  # coerce tibble inputs into data.frame
  step0 <- as.data.frame(data)

  # Check and prep input data
  ValidateCompData(data_val = step0, rel_val = relative, units_val = units)

  # assign NA species as "other"
  step1 <- NaSp(sp_data = step0)

  # Calculate composition
  if (relative == "BA") {

    step2 <- CompCalcBA(comp_data = step1, comp_units = units)

  } else if (relative == "density") {

    step2 <- CompCalcDensity(comp_data = step1)

  }

  return(step2)

}


################################################################################
################################################################################
# ValidateCompData function
################################################################################
################################################################################

ValidateCompData <- function(data_val, rel_val, units_val) {

  ###########################################################
  # Check that options are set appropriately
  ###########################################################

  if(rel_val == "BA" || rel_val == "density") {
    # do nothing
  } else {
    stop('The "relative" parameter must be set to either "BA" or "density".')
  }

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

  if(!("status" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "status" column.')
  }

  if(!("species" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "species" column.')
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

  if(!is.character(data_val$status)) {
    stop('"status" must be a character variable.\n',
         'You have input a variable of class: ', class(data_val$status))
  }

  if(!is.character(data_val$species)) {
    stop('"species" must be a character variable.\n',
         'You have input a variable of class: ', class(data_val$species))
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

  plots_wo_trees <- subset(data_val, exp_factor == 0,
                           select = c(status, species, dbh))

  if('FALSE' %in% is.na(plots_wo_trees)) {

    stop('There are plots with a recorded expansion factor of 0, but with non-NA status, species, and/or dbh.\n',
         'Plots with no trees should be represented by a single row with site and plot filled in as appropriate, an exp_factor of 0,\n',
         'and NA status, species, and dbh.')

  }


  ###########################################################
  # Check that status is as expected
  ###########################################################

  # Check for unrecognized status codes ----------------------------------------
  if(!all(is.element(data_val$status,
                     c("0","1", NA)))) {

    unrecognized_status <- sort(paste0(unique(data_val[!is.element(data_val$status,
                                                                   c("0", "1", NA)), "status"]),
                                       sep = " "))

    stop('Status must be 0 or 1!\n',
         'Unrecognized status codes: ', unrecognized_status)
  }

  # Check for NA ---------------------------------------------------------------
  plots_w_trees <- subset(data_val, exp_factor > 0)

  if ('TRUE' %in% is.na(plots_w_trees$status)) {

    warning('There are trees with missing status codes in the provided dataframe.\n',
            'Trees with NA status codes will not be included in the composition calculations.\n',
            'Consider addressing these missing values in your data.\n',
            ' \n')

  }


  ###########################################################
  # Check that species is as expected
  ###########################################################

  if ('TRUE' %in% is.na(plots_w_trees$species)) {

    warning('There are trees with missing species codes in the provided dataframe.\n',
            'Trees with NA species codes will be assigned "UNTR" for unknown tree.\n',
            ' \n')

  }


  ###########################################################
  # Check that DBH is as expected (if using relative BA)
  ###########################################################

  if (rel_val == "BA") {

    # Check for negative dbh ---------------------------------------------------
    if (min(data_val$dbh, na.rm = TRUE) < 0) {
      stop('There are negative DBH values in the provided dataframe. All DBH values must be >= 0.')
    }

    # Check for NA -------------------------------------------------------------
    if ('TRUE' %in% is.na(plots_w_trees$dbh)) {

      warning('There are trees with missing DBH values in the provided dataframe.\n',
              'Trees with NA DBH will not be included in the composition calculations.\n',
              'Consider addressing these missing values in your data.\n',
              ' \n')

    }

  }

}


################################################################################
################################################################################
# CompCalc function
################################################################################
################################################################################

NaSp <- function(sp_data) {

  n <- nrow(sp_data)

  for (i in 1:n) {

    if(sp_data$exp_factor[i] > 0 & is.na(sp_data$species[i])) {

      sp_data$species[i] <- "UNTR"

    }

  }

  return(sp_data)

}


################################################################################
################################################################################
# CompCalc functions
################################################################################
################################################################################

CompCalcBA <- function(comp_data, comp_units) {

  # create empty dataframe to fill
  fill_df <- data.frame(matrix(nrow = 0, ncol = 4))
  colnames(fill_df) <- c("site", "plot", "species", "dominance")

  # get tree species list
  sp_list_trees <- subset(comp_data, !is.na(status) & !is.na(dbh) & status == 1)
  sp_list <- unique(sp_list_trees$species)

  # loop through each site, plot, and species
  forests <- unique(comp_data$site)

  for(f in forests) {

    all_plots <- subset(comp_data, site == f)
    plot_ids <- unique(all_plots$plot)

    for(p in plot_ids) {

      all_trees <- subset(all_plots, plot == p)
      live_trees <- subset(all_trees, !is.na(status) & !is.na(dbh) & status == 1)

      if (nrow(live_trees) > 0) {

        if (comp_units == "metric") {
          live_trees$ba_tree <- (pi*((live_trees$dbh^2)/40000))
        } else if (comp_units == "imperial") {
          live_trees$ba_tree <- (pi*((live_trees$dbh^2)/576))
        }

        live_trees$ba_area <- live_trees$ba_tree*live_trees$exp_factor
        total_ba <- sum(live_trees$ba_area)
        species_ids <- unique(live_trees$species)

        temp_df <- data.frame(site = f,
                              plot = p,
                              species = sp_list,
                              dominance = 0)

        for(sp in species_ids) {

          single_sp <- subset(live_trees, species == sp)
          sum_sp_ba <- sum(single_sp$ba_area)
          temp_df[temp_df$species == sp, "dominance"] <- round((sum_sp_ba/total_ba)*100,1)

        }

      } else {

        temp_df <- data.frame(site = f,
                              plot = p,
                              species = sp_list,
                              dominance = NA)

      }

      fill_df <- rbind(fill_df, temp_df)

    }

  }

  recognized_sp <- sort(paste0(sp_list, sep = " "))

  message('The following species were present: ', recognized_sp)

  return(fill_df)

}


CompCalcDensity <- function(comp_data) {

  # create empty dataframe to fill
  fill_df <- data.frame(matrix(nrow = 0, ncol = 4))
  colnames(fill_df) <- c("site", "plot", "species", "dominance")

  # get tree species list
  sp_list_trees <- subset(comp_data, !is.na(status) & status == 1)
  sp_list <- unique(sp_list_trees$species)

  # loop through each site, plot, and species
  forests <- unique(comp_data$site)

  for(f in forests) {

    all_plots <- subset(comp_data, site == f)
    plot_ids <- unique(all_plots$plot)

    for(p in plot_ids) {

      all_trees <- subset(all_plots, plot == p)
      live_trees <- subset(all_trees, !is.na(status) & status == 1)

      if (nrow(live_trees) > 0) {

        total_stems <- sum(live_trees$exp_factor)
        species_ids <- unique(live_trees$species)

        temp_df <- data.frame(site = f,
                              plot = p,
                              species = sp_list,
                              dominance = 0)

        for(sp in species_ids) {

          single_sp <- subset(live_trees, species == sp)
          sum_sp_stems <- sum(single_sp$exp_factor)
          temp_df[temp_df$species == sp, "dominance"] <- round((sum_sp_stems/total_stems)*100,1)

        }

      } else {

        temp_df <- data.frame(site = f,
                              plot = p,
                              species = sp_list,
                              dominance = NA)

      }

      fill_df <- rbind(fill_df, temp_df)

    }

  }

  recognized_sp <- sort(paste0(sp_list, sep = " "))

  message('The following species were present: ', recognized_sp)

  return(fill_df)

}

