
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

#' @title SummaryBiomass
#'
#' @description
#' Uses Forest Inventory and Analysis (FIA) Regional Biomass Equations to estimate above-ground stem, bark, and branch tree biomass. The package will summarize by plot or by plot as well as species. The package uses the California equation set and should not be used for data from other regions.
#'
#' @param data A dataframe or tibble. Each row must be an observation of an individual tree.
#' @param site Must be a character variable (column) in the provided dataframe or tibble. Describes the broader location or forest where the data were collected.
#' @param plot Must be a character variable (column) in the provided dataframe or tibble. Identifies the plot in which the individual tree was measured.
#' @param exp_factor Must be a numeric variable (column) in the provided dataframe or tibble. The expansion factor specifies the number of trees per hectare (or per acre) that a given plot tree represents.
#' @param status Must be a character variable (column) in the provided dataframe or tibble. Specifies whether the individual tree is alive (1) or dead (0).
#' @param decay_class Must be a character variable (column) in the provided dataframe or tibble. For standing dead trees, the decay class should be 1, 2, 3, 4, or 5 (see README file for more detail). For live trees, the decay class should be NA or 0.
#' @param species Must be a character variable (column) in the provided dataframe or tibble. Specifies the species of the individual tree. Must follow four-letter species code or FIA naming conventions (see README file for more detail).
#' @param dbh Must be a numeric variable (column) in the provided dataframe or tibble. Provides the diameter at breast height (DBH) of the individual tree in either centimeters or inches.
#' @param ht Must be a numeric variable (column) in the provided dataframe or tibble. Provides the height of the individual tree in either meters or feet.
#' @param sp_codes Not a variable (column) in the provided dataframe or tibble. Specifies whether the species variable follows the four-letter code or FIA naming convention (see README file for more detail). Must be set to either "4letter" or "fia". The default is set to "4letter".
#' @param units Not a variable (column) in the provided dataframe or tibble. Specifies (1) whether the dbh and ht variables were measured using metric (centimeters and meters) or imperial (inches and feet) units; (2) whether the expansion factor is in metric (stems per hectare) or imperial (stems per acre) units; and (3) whether results will be given in metric (megagrams per hectare) or imperial (US tons per acre) units. Must be set to either "metric" or "imperial". The default is set to "metric".
#' @param results Not a variable (column) in the provided dataframe or tibble. Specifies whether the results will be summarized by plot or by plot as well as species. Must be set to either "by_plot" or "by_species." The default is set to "by_plot".
#'
#' @return A dataframe with the following columns:
#' \itemize{
#' \item site: as described above
#' \item plot: as described above
#' \item species: if results argument was set to "by_species"
#' \item live_Mg_ha (or live_ton_ac): above-ground live tree biomass in megagrams per hectare (or US tons per acre)
#' \item dead_Mg_ha (or dead_ton_ac): above-ground dead tree biomass in megagrams per hectare (or US tons per acre)
#' }
#'
#' @examples
#' SummaryBiomass(data = bio_demo_data,
#'                site = "Forest",
#'                plot = "Plot_id",
#'                exp_factor = "SPH",
#'                status = "Live",
#'                decay_class = "Decay",
#'                species = "SPP",
#'                dbh = "DBH_CM",
#'                ht = "HT_M",
#'                results = "by_species")
#'
#' @export

SummaryBiomass <- function(data, site, plot, exp_factor, status, decay_class, species, dbh, ht, sp_codes = "4letter", units = "metric", results = "by_plot") {

  # Check and prep input data
  step1 <- ValidateSumData(data_val = data,
                           site_val = site,
                           plot_val = plot,
                           ef_val = exp_factor,
                           status_val = status,
                           decay_val = decay_class,
                           sp_val = species,
                           dbh_val = dbh,
                           ht_val = ht,
                           sp_codes_val = sp_codes,
                           units_val = units,
                           results_val = results)

  # calculate stem, bark, and branch biomass
  # and discount dead tree biomass
  step2 <- StemBiomass(tree_data = step1)
  step3 <- BarkBiomass(tree_data = step2)
  step4 <- BranchBiomass(tree_data = step3)
  step5 <- Discount(tree_data = step4, tree_sp_codes = sp_codes)

  # Summarize biomass at the plot level
  if(results == "by_plot") {

    step5 <- SumByPlot(bio_data = step5,
                       bio_units = units)

  } else if (results == "by_species") {

    step5 <- SumBySpecies(bio_data = step5,
                          bio_units = units)

  }

  return(step5)
}


################################################################################
################################################################################
# ValidateSumData function
################################################################################
################################################################################

ValidateSumData <- function(data_val, site_val, plot_val, ef_val, status_val, decay_val, sp_val, dbh_val, ht_val, sp_codes_val, units_val, results_val) {

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

  if(!(ht_val %in% colnames(data_val))) {
    stop('There is no column named "', ht_val, '" in the provided dataframe.')
  }

  if(!(decay_val %in% colnames(data_val))) {
    stop('There is no column named "', decay_val, '" in the provided dataframe.')
  }


  ###########################################################
  # Check that column classes are as expected
  ###########################################################

  # Categorical variables ------------------------------------------------------
  if(!is.character(data_val[[site_val]])) {
    stop('The parameter site requires a character variable.\n',
         'You have input a variable of class: ', class(data_val[[site_val]]))
  }

  if(!is.character(data_val[[plot_val]])) {
    stop('The parameter plot requires a character variable.\n',
         'You have input a variable of class: ', class(data_val[[plot_val]]))
  }

  if(!is.character(data_val[[status_val]])) {
    stop('The parameter status requires a character variable.\n',
         'You have input a variable of class: ', class(data_val[[status_val]]))
  }

  if(!is.character(data_val[[sp_val]])) {
    stop('The parameter species requires a character variable.\n',
         'You have input a variable of class: ', class(data_val[[sp_val]]))
  }

  if(!is.character(data_val[[decay_val]])) {
    stop('The parameter decay_class requires a character variable.\n',
         'You have input a variable of class: ', class(data_val[[decay_val]]))
  }

  # Numeric variables ----------------------------------------------------------
  if(!is.numeric(data_val[[ef_val]])) {
    stop('The parameter exp_factor requires a numerical variable.\n',
         'You have input a variable of class: ', class(data_val[[ef_val]]))
  }

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

  if(results_val == "by_plot" || results_val == "by_species") {
    # do nothing
  } else {
    stop('The "results" parameter must be set to either "by_plot" or "by_species".')
  }


  #########################################################
  # check that site and plot are as expected
  #########################################################

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

    warning('There are missing status codes in the provided dataframe.\n',
            'Trees with NA status codes will have NA biomass estimates.\n',
            ' \n')
  }


  ###########################################################
  # Check that decay class is as expected
  ###########################################################

  # Check for unrecognized decay codes -----------------------------------------
  if(!all(is.element(data_val[[decay_val]],
                     c("0","1","2","3","4","5",NA)))) {

    unrecognized_decay <- sort(paste0(unique(data_val[!is.element(data_val[[decay_val]],
                                                                  c("0","1","2","3","4","5",NA)), decay_val]),
                                      sep = " "))

    stop('decay_class must be ',0,' through ',5,'!\n',
         'Unrecognized decay class codes: ', unrecognized_decay)
  }


  # Check that status and decay_class match ------------------------------------
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


  ###########################################################
  # Check that species codes are as expected
  ###########################################################

  # Check for unrecognized species codes ---------------------------------------
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

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(plots_w_trees[[sp_val]])) {

    warning('There are missing species codes in the provided dataframe.\n',
            'Trees with NA species codes will have NA biomass estimates.\n',
            'Consider assigning unknown conifer, unknown hardwood, or unknown tree, as appropriate.\n',
            ' \n')
  }


  ###########################################################
  # Check that DBH and height are within range
  ###########################################################

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(plots_w_trees[[dbh_val]])) {

    warning('There are missing DBH values in the provided dataframe.\n',
            'Trees with NA DBH will have NA biomass estimates.\n',
            ' \n')
  }

  if ('TRUE' %in% is.na(plots_w_trees[[ht_val]])) {

    warning('There are missing tree height values in the provided dataframe.\n',
            'Trees with NA height will have NA biomass estimates.\n',
            ' \n')
  }

  # Check for allometric equation cutoffs --------------------------------------
  live_trees <- subset(data_val, data_val[[status_val]] == 1)
  dead_trees <- subset(data_val, data_val[[status_val]] == 0)

  if (units_val == "metric") {

    if(nrow(live_trees) > 0) {

      if (min(live_trees[[dbh_val]], na.rm = TRUE) < 2.54) {
        warning('The allometric equations are for live trees with DBH >= 2.54cm and dead trees with DBH >= 12.7cm.\n',
                'You inputted live trees with DBH < 2.54cm. These trees will have NA biomass estimates.\n',
                ' \n')
      }
    }

    if(nrow(dead_trees) > 0) {

      if (min(dead_trees[[dbh_val]], na.rm = TRUE) < 12.7) {
        warning('The allometric equations are for live trees with DBH >= 2.54cm and dead trees with DBH >= 12.7cm.\n',
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
  colnames(data_val)[which(names(data_val) == colnames(data_val[site_val]))] <- "site"
  colnames(data_val)[which(names(data_val) == colnames(data_val[plot_val]))] <- "plot"
  colnames(data_val)[which(names(data_val) == colnames(data_val[ef_val]))] <- "ef"
  colnames(data_val)[which(names(data_val) == colnames(data_val[status_val]))] <- "status"
  colnames(data_val)[which(names(data_val) == colnames(data_val[decay_val]))] <- "decay"
  colnames(data_val)[which(names(data_val) == colnames(data_val[sp_val]))] <- "species"

  return(data_val)

}

globalVariables(c("stem_bio", "site", "status", "species"))
