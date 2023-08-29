
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
#' @param data A dataframe or tibble. Each row must be an observation of an individual tree.
#' @param site Must be a variable (column) in the provided dataframe or tibble. Describes the broader location or forest where the data were collected. The class of this variable will be coerced to character.
#' @param plot Must be a variable (column) in the provided dataframe or tibble. Identifies the plot in which the individual tree was measured. The class of this variable will be coerced to character.
#' @param exp_factor Must be a numeric variable (column) in the provided dataframe or tibble. The expansion factor specifies the number of trees per hectare (or per acre) that a given plot tree represents.
#' @param status Must be a variable (column) in the provided dataframe or tibble. Specifies whether the individual tree is alive (1) or dead (0). The class of this variable will be coerced to factor.
#' @param species Must be a variable (column) in the provided dataframe or tibble. Specifies the species of the individual tree. The class of this variable will be coerced to character.
#' @param dbh Must be a numeric variable (column) in the provided dataframe or tibble. Provides the diameter at breast height (DBH) of the individual tree in either centimeters or inches.
#' @param relative Not a variable (column) in the provided dataframe or tibble. Specifies whether forest composition should be measured as relative basal area or relative density. Must be set to either "BA" or "density". The default is set to "BA".
#' @param units Not a variable (column) in the provided dataframe or tibble. Specifies whether the dbh variable was measured using metric (centimeters) or imperial (inches) units. Must be set to either "metric" or "imperial". The default is set to "metric".
#'
#' @return A dataframe with the following columns:
#' \itemize{
#' \item site: as described above
#' \item plot: as described above
#' \item species: as described above
#' \item dominance: relative basal area (or relative density) in percent (%)
#' }
#'
#'@examples
#'ForestComp(data = for_demo_data,
#'           site = "Forest",
#'           plot = "Plot_id",
#'           exp_factor = "SPH",
#'           status = "Live",
#'           species = "SPP",
#'           dbh = "DBH_CM",
#'           relative = "BA",
#'           units = "metric")
#'
#' @export

ForestComp <- function(data, site, plot, exp_factor, status, species, dbh, relative = "BA", units = "metric") {

  # Check and prep input data
  step1 <- ValidateCompData(data_val = data,
                            site_val = site,
                            plot_val = plot,
                            ef_val = exp_factor,
                            status_val = status,
                            sp_val = species,
                            dbh_val = dbh,
                            rel_val = relative,
                            units_val = units)

  # assign NA species as "other"
  step2 <- NaSp(sp_data = step1)

  # Calculate composition
  if (relative == "BA") {

    step3 <- CompCalcBA(comp_data = step2,
                        comp_units = units)

  } else if (relative == "density") {

    step3 <- CompCalcDensity(comp_data = step2)

  }

  return(step3)

}


################################################################################
################################################################################
# ValidateCompData function
################################################################################
################################################################################

ValidateCompData <- function(data_val, site_val, plot_val, ef_val, status_val, sp_val, dbh_val, rel_val, units_val) {

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

  if(!(status_val %in% colnames(data_val))) {
    stop('There is no column named "', status_val, '" in the provided dataframe.')
  }

  if(!(sp_val %in% colnames(data_val))) {
    stop('There is no column named "', sp_val, '" in the provided dataframe.')
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
  # Check that site and plot are as expected
  ###########################################################

  data_val[[site_val]] <- as.character(data_val[[site_val]]) # coerce into character
  data_val[[plot_val]] <- as.character(data_val[[plot_val]]) # coerce into character

  if ('TRUE' %in% is.na(data_val[[site_val]])) {

    stop('There are missing site names in the provided dataframe.')

  }

  if ('TRUE' %in% is.na(data_val[[plot_val]])) {

    stop('There are missing plot names in the provided dataframe.')

  }


  ##########################################################
  # check that expansion factor is as expected
  ##########################################################

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(data_val[[ef_val]])) {

    stop('There are missing expansion factors in the provided dataframe.\n',
         'For plots with no trees, put zero for the expansion factor.')

  }

  # First check for proper use of 0 ef -----------------------------------------
  forests <- unique(data_val[[site_val]])

  for(f in forests) {

    all_plots <- subset(data_val, data_val[[site_val]] == f)
    plot_ids <- unique(all_plots[[plot_val]])

    for(p in plot_ids) {

      all_trees <- subset(all_plots, all_plots[[plot_val]] == p)

      if('TRUE' %in% is.element(all_trees[[ef_val]], 0)) {

        n <- nrow(all_trees)

        if(n > 1) {

          stop('There are plots with a recorded expansion factor of 0, but with more than one row.\n',
               'Plots with no trees should be represented by a single row with site and plot filled in as appropriate and an exp_factor of 0.')

        }

      }

    }

  }

  plots_wo_trees <- subset(data_val, data_val[[ef_val]] == 0,
                           select = c(status_val, sp_val, dbh_val, ht_val, decay_val))

  if('FALSE' %in% is.na(plots_wo_trees)) {

    stop('There are plots with a recorded expansion factor of 0, but with non-NA status, decay_class, species, dbh and/or ht.\n',
         'Plots with no trees should be represented by a single row with site and plot filled in as appropriate, an exp_factor of 0,\n',
         'and NA status, decay_class, species, dbh, and ht.')

  }


  ###########################################################
  # Check that status is as expected
  ###########################################################

  data_val[[status_val]] <- as.factor(data_val[[status_val]]) # coerce status_val into factor

  # Check for unrecognized status codes ----------------------------------------
  if(!all(is.element(data_val[[status_val]],
                     c("0","1", NA)))) {

    unrecognized_status <- sort(paste0(unique(data_val[!is.element(data_val[[status_val]],
                                       c("0", "1", NA)), status_val]),
                                       sep = " "))

    stop('Status must be 0 or 1!\n',
         'Unrecognized status codes: ', unrecognized_status)
  }

  # Check for NA ---------------------------------------------------------------
  plots_w_trees <- subset(data_val, data_val[[ef_val]] > 0)

  if ('TRUE' %in% is.na(plots_w_trees[[status_val]])) {

    warning('There are trees with missing status codes in the provided dataframe.\n',
            'Trees with NA status codes will not be included in the composition calculations.\n',
            'Consider addressing these missing values in your data.\n',
            ' \n')
  }


  ###########################################################
  # Check for other NAs
  ###########################################################

  data_val[[sp_val]] <- as.character(data_val[[sp_val]]) # coerce sp_val into character

  if ('TRUE' %in% is.na(plots_w_trees[[sp_val]])) {

    warning('There are trees with missing species codes in the provided dataframe.\n',
            'Trees with NA species codes will be assigned "UNTR" for unknown tree.\n',
            ' \n')
  }

  # NA DBH is only an issue for relative BA (not relative density)
  if ('TRUE' %in% is.na(plots_w_trees[[dbh_val]]) & rel_val == "BA") {

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
  colnames(data_val)[which(names(data_val) == colnames(data_val[status_val]))] <- "status"
  colnames(data_val)[which(names(data_val) == colnames(data_val[sp_val]))] <- "species"
  colnames(data_val)[which(names(data_val) == colnames(data_val[dbh_val]))] <- "dbh"

  data_val <- subset(data_val, select = c(site, plot, ef, status, species, dbh))

  return(data_val)

}


################################################################################
################################################################################
# CompCalc function
################################################################################
################################################################################

NaSp <- function(sp_data) {

  n <- nrow(sp_data)

  for (i in 1:n) {

    if(sp_data$ef[i] > 0 & is.na(sp_data$species[i])) {

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

        live_trees$ba_area <- live_trees$ba_tree*live_trees$ef
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

        total_stems <- sum(live_trees$ef)
        species_ids <- unique(live_trees$species)

        temp_df <- data.frame(site = f,
                              plot = p,
                              species = sp_list,
                              dominance = 0)

        for(sp in species_ids) {

          single_sp <- subset(live_trees, species == sp)
          sum_sp_stems <- sum(single_sp$ef)
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

