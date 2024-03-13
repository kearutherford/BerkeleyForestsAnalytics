
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

#' @title BiomassNSVB
#'
#' @description
#' Uses the national-scale volume and biomass (NSVB) framework, from GTR-WO-104, to estimate above-ground tree biomass and carbon. The package will summarize to the tree or plot level, with options to additionally summarize by species and/or status. The package is specifically designed for use in California ecosystems, and, therefore, only covers the ecodivisions found in California (260, M260, 320, and 340).
#'
#' @param data A dataframe or tibble with the following columns: site, plot, exp_factor, division, status, decay_class, species, dbh, ht1, ht2, crown_ratio, top, and cull. Each row must be an observation of an individual tree.
#' @param sp_codes Not a variable (column) in the provided dataframe or tibble. Specifies whether the species variable follows the four-letter code or FIA naming convention (see README file for more detail). Must be set to either "4letter" or "fia". The default is set to "4letter".
#' @param input_units Not a variable (column) in the provided dataframe or tibble. Specifies (1) whether the input dbh, ht1, and ht2 variables were measured using metric (centimeters and meters) or imperial (inches and feet) units; and (2) whether the input expansion factor is in metric (stems per hectare) or imperial (stems per acre) units. Must be set to either "metric" or "imperial". The default is set to "metric".
#' @param output_units Not a variable (column) in the provided dataframe or tibble. Specifies whether results will be given in metric (kilograms or megagrams per hectare) or imperial (US tons or US tons per acre) units. Must be set to either "metric" or "imperial". The default is set to "metric".
#' @param results Not a variable (column) in the provided dataframe or tibble. Specifies whether the results will be summarized by tree, by plot, by plot as well as species, by plot as well as status (live/dead), or by plot as well as species and status. Must be set to either "by_tree", "by_plot", "by_species", "by_status", or "by_sp_st". The default is set to "by_plot".
#'
#' @return Depends on the results setting:
#' \itemize{
#' \item by_tree: a list with two components: (1) total run time for the function and (2) a dataframe with tree-level biomass and carbon estimates (reported in kilograms or US tons).
#' \item by_plot: a list with two components: (1) total run time for the function and (2) a dataframe with plot-level biomass and carbon estimates (reported in megagrams per hectare or US tons per acre).
#' \item by_species: a list with two components: (1) total run time for the function and (2) a dataframe with plot-level biomass and carbon estimates, further summarized by species (reported in megagrams per hectare or US tons per acre).
#' \item by_status: a list with two components: (1) total run time for the function and (2) a dataframe with plot-level biomass and carbon estimates, further summarized by status (live/dead; reported in megagrams per hectare or US tons per acre).
#' \item by_sp_st: a list with two components: (1) total run time for the function and (2) a dataframe with plot-level biomass and carbon estimates, further summarized by species as well as by status (reported in megagrams per hectare or US tons per acre).
#' }
#'
#' @export

BiomassNSVB <- function(data, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_plot") {

  # get start time
  start_time <- Sys.time()

  # coerce tibble inputs into data.frame
  step0 <- as.data.frame(data)

  # check input data
  ValidateNSVB(data_val = step0, sp_val = sp_codes, in_units_val = input_units, out_units_val = output_units, results_val = results)

  # prep input data
  step1 <- DataPrep(data = step0, in_units = input_units, sp = sp_codes)

  # calculate tree-level biomass & carbon
  step2 <- NSVBCalcs(data = step1)

  # format dataframe
  step3 <- CleanDF(data = step2, in_units = input_units, out_units = output_units, sp = sp_codes)

  # compile to the plot level, if desired
  if(results == "by_tree") {

    # get end time
    end_time <- Sys.time()
    time_taken <- round(end_time - start_time,2)

    # create return list
    return_list <- list(time_taken, step3)
    names(return_list) <- c("run_time", "dataframe")
    return(return_list)

  } else {

    step4 <- SumBy(sum_data = step3, sum_units = output_units, sum_by = results)

    # get end time
    end_time <- Sys.time()
    time_taken <- round(end_time - start_time, 2)

    # create return list
    return_list <- list(time_taken, step4)
    names(return_list) <- c("run_time", "dataframe")
    return(return_list)

  }

}


################################################################################
################################################################################
# ValidateNSVB function
################################################################################
################################################################################

ValidateNSVB <- function(data_val, sp_val, in_units_val, out_units_val, results_val) {

  ###########################################################
  # Check that options are set appropriately
  ###########################################################

  if(sp_val == "4letter" || sp_val == "fia") {
    # do nothing
  } else {
    stop('The "sp_codes" parameter must be set to either "4letter" or "fia."')
  }

  if(in_units_val == "metric" || in_units_val == "imperial") {
    # do nothing
  } else {
    stop('The "input_units" parameter must be set to either "metric" or "imperial."')
  }

  if(out_units_val == "metric" || out_units_val == "imperial") {
    # do nothing
  } else {
    stop('The "output_units" parameter must be set to either "metric" or "imperial."')
  }

  if(results_val == "by_tree" || results_val == "by_plot" || results_val == "by_status" || results_val == "by_species" || results_val == "by_sp_st") {
    # do nothing
  } else {
    stop('The "results" parameter must be set to "by_tree", "by_plot", "by_status", "by_species", or "by_sp_st".')
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

  if(!("division" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "division" column.')
  }

  if(!("status" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "status" column.')
  }

  if(!("decay_class" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "decay_class" column.')
  }

  if(!("species" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "species" column.')
  }

  if(!("dbh" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "dbh" column.')
  }

  if(!("ht1" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "ht1" column.')
  }

  if(!("ht2" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "ht2" column.')
  }

  if(!("crown_ratio" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "crown_ratio" column.')
  }

  if(!("top" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "top" column.')
  }

  if(!("cull" %in% colnames(data_val))) {
    stop('Input data is missing the necessary "cull" column.')
  }


  ###########################################################
  # Check that column classes are as expected
  ###########################################################

  if(!is.numeric(data_val$exp_factor)) {
    stop('"exp_factor" must be a numerical variable.\n',
         'You have input a variable of class: ', class(data_val$exp_factor))
  }

  if(!is.numeric(data_val$dbh)) {
    stop('"dbh" must be a numerical variable.\n',
         'You have input a variable of class: ', class(data_val$dbh))
  }

  if(!is.numeric(data_val$ht1)) {
    stop('"ht1" must be a numerical variable.\n',
         'You have input a variable of class: ', class(data_val$ht1))
  }

  if(!is.numeric(data_val$ht2)) {
    stop('"ht2" must be a numerical variable.\n',
         'You have input a variable of class: ', class(data_val$ht2))
  }

  if(!is.numeric(data_val$crown_ratio)) {
    stop('"crown_ratio" must be a numerical variable.\n',
         'You have input a variable of class: ', class(data_val$crown_ratio))
  }

  if(!is.numeric(data_val$cull)) {
    stop('"cull" must be a numerical variable.\n',
         'You have input a variable of class: ', class(data_val$cull))
  }


  #########################################################
  # check that site and plot are as expected
  #########################################################

  data_val$site <- as.character(data_val$site) # coerce into character
  data_val$plot <- as.character(data_val$plot) # coerce into character

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
                           select = c(status, decay_class, species, dbh, ht1, ht2, crown_ratio, top, cull))

  if('FALSE' %in% is.na(plots_wo_trees)) {

    stop('There are plots with a recorded expansion factor of 0, but with non-NA status, decay_class, species, dbh, ht1, ht2, crown_ratio, top and/or cull.\n',
         'Plots with no trees should be represented by a single row with site and plot filled in as appropriate, an exp_factor of 0,\n',
         'and NA status, decay_class, species, dbh, ht1, ht2, crown_ratio, top and/or cull.')

  }


  ###########################################################
  # Check that division is as expected
  ###########################################################

  data_val$division <- as.character(data_val$division) # coerce division into character

  if ('TRUE' %in% is.na(data_val$division)) {
    stop('There are missing division codes in the provided dataframe.')
  }

  # Check for unrecognized division codes --------------------------------------
  # note, some divisions that are not relevant to CA added to be able to run
  # the documented examples
  if(!all(is.element(data_val$division,
                     c("260", "M260", "320", "340", "240", "M210", "M220")))) {

    unrecognized_div <- sort(paste0(unique(data_val[!is.element(data_val$division,
                                                                c("260", "M260", "320", "340", "240", "M210", "M220")), "division"]),
                                    sep = " "))

    stop('division must be 260, M260, 320, or 340!\n',
         'Unrecognized division codes: ', unrecognized_div)
  }


  ###########################################################
  # Check that status is as expected
  ###########################################################

  data_val$status <- as.character(data_val$status) # coerce status into character

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

    warning('There are missing status codes in the provided dataframe - outside of plots with exp_factor of 0, signifying plots with no trees, which should have NA status.\n',
            'Trees with NA status codes will have NA biomass estimates. Consider investigating these trees.\n',
            ' \n')
  }


  ###########################################################
  # Check that decay class is as expected
  ###########################################################

  data_val$decay_class <- as.character(data_val$decay_class) # coerce decay_val into character

  # Check for unrecognized decay codes -----------------------------------------
  if(!all(is.element(data_val$decay_class,
                     c("0","1","2","3","4","5",NA)))) {

    unrecognized_decay <- sort(paste0(unique(data_val[!is.element(data_val$decay_class,
                                                                  c("0","1","2","3","4","5",NA)), "decay_class"]),
                                      sep = " "))

    stop('decay_class must be 0 through 5!\n',
         'Unrecognized decay class codes: ', unrecognized_decay)
  }


  # Check that status and decay_class match ------------------------------------
  dead_trees <- subset(data_val, !is.na(data_val$status) & data_val$status == "0")
  dead_miss <- subset(dead_trees, is.na(dead_trees$decay_class) | dead_trees$decay_class == "0")
  live_trees <- subset(data_val, !is.na(data_val$status) & data_val$status == "1")
  live_miss <- subset(live_trees, !is.na(live_trees$decay_class) & live_trees$decay_class != "0")

  if (nrow(dead_miss) > 0) {

    warning('There are dead trees with NA and/or 0 decay class codes.\n',
            'These trees will be assigned a decay class of 3.\n',
            'Consider investigating these trees with mismatched status/decay class.\n',
            ' \n')

  }

  if (nrow(live_miss) > 0) {

    warning('There are live trees with 1-5 decay class codes.\n',
            'Live trees should have decay class codes of NA or 0.\n',
            'These trees will still be considered live in the biomass/carbon calculations.\n',
            'But you should consider investigating these trees with mismatched status/decay class.\n',
            ' \n')

  }


  ###########################################################
  # Check that species codes are as expected
  ###########################################################

  data_val$species <- as.character(data_val$species) # coerce species into character
  plots_w_trees$species <- as.character(plots_w_trees$species)

  # Check for unrecognized species codes ---------------------------------------
  if (sp_val == "4letter") {

    if(!('TRUE' %in% (data_val$species %in% NSVB_sp_code_names$letter))) {

      stop('No species codes recognized!\n',
           'Check how you set the "sp_codes" parameter.')
    }

    if(!all(is.element(data_val$species,
                       NSVB_sp_code_names$letter))) {

      unrecognized_sp <- sort(paste0(unique(data_val[!is.element(data_val$species,
                                                                 NSVB_sp_code_names$letter), "species"]),
                                     sep = " "))

      stop('Not all species codes were recognized!\n',
           'Unrecognized codes: ', unrecognized_sp)
    }

    # Check that unknown species codes are correctly applied ---------------------
    UNHA_trees <- subset(data_val, !is.na(species) & species == "UNHA" & !is.na(status) & status == "1")

    if (nrow(UNHA_trees) > 0) {

      stop('There are live trees (status = 1) with a species code of "UNHA".\n',
           '"UNHA" is for unknown DEAD hardwoods. Consider using the species code "UNTR", which is for unknown trees (live or dead).\n')

    }

    UNCO_trees <- subset(data_val, !is.na(species) & species == "UNCO" & !is.na(status) & status == "1")

    if (nrow(UNCO_trees) > 0) {

      stop('There are live trees (status = 1) with a species code of "UNCO".\n',
           '"UNCO" is for unknown DEAD conifers. Consider using the species code "UNTR", which is for unknown trees (live or dead).\n')

    }

    # Check for unrecognized species codes ---------------------------------------
  } else if (sp_val == "fia") {

    if(!('TRUE' %in% (data_val$species %in% NSVB_sp_code_names$fia))) {

      stop('No species codes recognized!\n',
           'Check how you set the "sp_codes" parameter.')
    }

    if(!all(is.element(data_val$species,
                       NSVB_sp_code_names$fia))) {

      unrecognized_sp <- sort(paste0(unique(data_val[!is.element(data_val$species,
                                                                 NSVB_sp_code_names$fia), "species"]),
                                     sep = " "))

      stop('Not all species codes were recognized!\n',
           'Unrecognized codes: ', unrecognized_sp)
    }

    # Check that unknown species codes are correctly applied ---------------------
    UNHA_trees <- subset(data_val, !is.na(species) & species == "998" & !is.na(status) & status == "1")

    if (nrow(UNHA_trees) > 0) {

      stop('There are live trees (status = 1) with a species code of 998.\n',
           '998 is for unknown DEAD hardwoods. Consider using the species code 999, which is for unknown trees (live or dead).\n')

    }

    UNCO_trees <- subset(data_val, !is.na(species) & species == "299" & !is.na(status) & status == "1")

    if (nrow(UNCO_trees) > 0) {

      stop('There are live trees (status = 1) with a species code of 299.\n',
           '299 is for unknown DEAD conifers. Consider using the species code 999, which is for unknown trees (live or dead).\n')

    }

  }

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(plots_w_trees$species)) {

    warning('There are missing species codes in the provided dataframe.\n',
            'Trees with NA species codes will have NA biomass/carbon estimates.\n',
            'Consider assigning unknown dead conifer, unknown dead hardwood, or unknown tree (live or dead), as appropriate.\n',
            ' \n')
  }


  ###########################################################
  # Check that top is as expected
  ###########################################################

  data_val$top <- as.character(data_val$top) # coerce top into character

  # Check for unrecognized status codes ----------------------------------------
  if(!all(is.element(data_val$top,
                     c("Y","N", NA)))) {

    unrecognized_top <- sort(paste0(unique(data_val[!is.element(data_val$top,
                                                                c("Y", "N", NA)), "top"]),
                                    sep = " "))

    stop('top must be "Y" or "N"!\n',
         'Unrecognized top codes: ', unrecognized_top)
  }

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(plots_w_trees$top)) {

    warning('There are missing tree top codes in the provided dataframe (outside of plots with exp_factor of 0, signifying plots with no trees, which should have NA top).\n',
            'These trees will be assigned top = "Y". Consider investigating these trees.\n',
            ' \n')
  }


  ###########################################################
  # Check that DBH and height are within range
  ###########################################################

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(plots_w_trees$dbh)) {

    warning('There are missing DBH values in the provided dataframe (outside of plots with exp_factor of 0, signifying plots with no trees, which should have NA dbh).\n',
            'Trees with NA DBH will have NA biomass/carbon estimates. Consider investigating these trees.\n',
            ' \n')
  }

  if ('TRUE' %in% is.na(plots_w_trees$ht1)) {

    warning('There are missing ht1 values in the provided dataframe.\n',
            'Trees with NA ht1 will have NA biomass/carbon estimates.\n',
            ' \n')
  }

  trees_N_top <- subset(plots_w_trees, !is.na(top) & top == "N")

  if ('TRUE' %in% is.na(trees_N_top$ht2)) {

    warning('There are trees without tops (top = "N") with missing ht2 values in the provided dataframe.\n',
            'Trees without tops with NA ht2 will have NA biomass/carbon estimates.\n',
            ' \n')
  }

  # Check for allometric equation cutoffs --------------------------------------
  if (in_units_val == "metric") {

    if (!all(is.na(data_val$dbh))) {

      if (min(data_val$dbh, na.rm = TRUE) < 2.5) {
        warning('The allometric equations are for trees with DBH >= 2.5cm.\n',
                'You inputted trees with DBH < 2.5cm. These trees will have NA biomass/carbon estimates.\n',
                ' \n')
      }

    }

    if (!all(is.na(data_val$ht1))) {

      if (min(data_val$ht1, na.rm = TRUE) < 1.37) {
        warning('The allometric equations are for trees with height >= 1.37m.\n',
                'You inputted trees with ht1 < 1.37m. These trees will have NA biomass/carbon estimates.\n',
                ' \n')
      }

    }

    if (!all(is.na(data_val$ht2))) {

      if (min(data_val$ht2, na.rm = TRUE) < 1.37) {
        warning('The allometric equations are for trees with height >= 1.37m.\n',
                'You inputted trees with ht2 < 1.37m. These trees will have NA biomass/carbon estimates.\n',
                ' \n')
      }

    }

  } else if (in_units_val == "imperial") {

    if (!all(is.na(data_val$dbh))) {

      if (min(live_trees$dbh, na.rm = TRUE) < 1.0) {
        warning('The allometric equations are for trees with DBH >= 1.0in.\n',
                'You inputted trees with DBH < 1.0in. These trees will have NA biomass/carbon estimates.\n',
                ' \n')
      }

    }

    if (!all(is.na(data_val$ht1))) {

      if (min(data_val$ht1, na.rm = TRUE) < 4.5) {
        warning('The allometric equations are for trees with height >= 4.5ft.\n',
                'You inputted trees with ht1 < 4.5ft. These trees will have NA biomass/carbon estimates.\n',
                ' \n')
      }

    }

    if (!all(is.na(data_val$ht2))) {

      if (min(data_val$ht2, na.rm = TRUE) < 4.5) {
        warning('The allometric equations are for trees with height >= 4.5ft.\n',
                'You inputted trees with ht2 < 4.5ft. These trees will have NA biomass/carbon estimates.\n',
                ' \n')
      }

    }

  }

  # Check that ht1 and ht2 make sense together --------------------------------
  trees_w_hts <- subset(data_val, !is.na(ht1) & !is.na(ht2))

  if('TRUE' %in% (trees_w_hts$ht2 > trees_w_hts$ht1)) {
    stop('There are trees with ht2 > ht1. ht1 must be greater than ht2.\n')
  }

  # Check that ht1 and ht2 make sense together ---------------------------------
  trees_Y_top <- subset(plots_w_trees, !is.na(top) & top == "Y" & !is.na(ht2))

  if (nrow(trees_Y_top) > 0) {

    warning('There are trees with intact tops (top = "Y") with non-NA ht2 values in the provided dataframe.\n',
            'Trees with intact tops should not require ht2 values.\n',
            'These trees will still be treated as if they have intact tops in the biomass/carbon estimations.\n',
            'But you should consider investigating these trees with mismatched top/ht2.\n',
            ' \n')

  }


  ###########################################################
  # Check that crown ratios are as expected
  ###########################################################

  # Check for NA ---------------------------------------------------------------
  trees_live <- subset(plots_w_trees, !is.na(status) & status == "1")

  if ('TRUE' %in% is.na(trees_live$crown_ratio)) {

    warning('There are live trees with missing live crown ratio values in the provided dataframe (outside of plots with an exp_factor of 0, which should have NA crown_ratio).\n',
            'Live trees with NA crown_ratio will have mean crown ratios substituted in (from table S11). Consider investigating these trees.\n',
            ' \n')
  }

  # Check that crown_ratio is within range -------------------------------------
  if (!all(is.na(data_val$crown_ratio))) {

    if (min(data_val$crown_ratio, na.rm = TRUE) < 0 || max(data_val$crown_ratio, na.rm = TRUE) > 1) {
      stop('Crown ratio must be between 0 and 1! You inputted crown ratio values outside of this range.')
    }

  }

  # Check that crown_ratio is correctly applied to live trees only -------------
  trees_dead <- subset(plots_w_trees, !is.na(status) & status == "0")

  if ('FALSE' %in% is.na(trees_dead$crown_ratio)) {

    warning('There are dead trees with live crown ratio values in the provided dataframe.\n',
            'Dead trees should not have live crown ratios. Live crown ratios for dead trees will be overwritten to follow the NSVB framework.\n',
            ' \n')

  }


  ###########################################################
  # Check that culls are as expected
  ###########################################################

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(plots_w_trees$cull)) {

    warning('There are trees with missing cull values in the provided dataframe (outside of plots with exp_factor of 0, signifying plots with no trees, which should have NA cull).\n',
            'These trees will be assigned a cull of 0 (assuming no cull). Consider investigating these trees.\n',
            ' \n')
  }

  # Check that cull is within range --------------------------------------------
  if (!all(is.na(data_val$cull))) {

    if (min(data_val$cull, na.rm = TRUE) < 0 || max(data_val$cull, na.rm = TRUE) > 100) {
      stop('Cull must be between 0 and 100! You inputted cull values outside of this range.')
    }

  }

}


################################################################################
################################################################################
# DataPrep function
################################################################################
################################################################################

DataPrep <- function(data, in_units, sp) {

  # unit conversions
  if(in_units == "metric") {

    # preserve original columns
    data$dbh_cm <- data$dbh
    data$ht1_m <- data$ht1
    data$ht2_m <- data$ht2

    # create columns in imperial units
    data$dbh <- data$dbh/2.54
    data$ht1 <- data$ht1*3.28084
    data$ht2 <- data$ht2*3.28084

  }

  # FIA species codes
  if(sp == "4letter") {

    # preserve original column
    data$letter <- data$species

    # create column with FIA species codes
    data <- merge(data, NSVB_sp_code_names, by = "letter", all.x = TRUE, all.y = FALSE)
    data$species <- data$fia
    data <- subset(data, select = -fia)

  }

  # fill in some missing values
  data$decay_class <- as.character(ifelse(!is.na(data$status) & data$status == "0" & is.na(data$decay_class), "3", data$decay_class))
  data$top <- ifelse(is.na(data$top), "Y", data$top)
  data$cull <- ifelse(is.na(data$cull), 0, data$cull)

  # add columns for further calculations
  data <- merge(data, REF_SPECIES_BFA, by = "species", all.x = TRUE, all.y = FALSE)
  data <- merge(data, Table_1, by = c("type", "decay_class"), all.x = TRUE, all.y = FALSE)

  data$path <- paste0(data$top,'_',data$status)
  data$path[data$path == "Y_1"] <- "1" # live, with intact top
  data$path[data$path == "N_1"] <- "2" # live, with broken top
  data$path[data$path == "Y_0"] <- "3" # dead, with intact top
  data$path[data$path == "N_0"] <- "4" # dead, with broken top

  # fill in crown ratios
  data$Division <- ifelse(data$division %in% Table_S11$Division, data$division, "UNDEFINED")
  names(Table_S11)[names(Table_S11) == "HWD"] <- "type"
  Table_S11$cr <- Table_S11$Mean.CR/100
  Table_S11_CR <- subset(Table_S11, select = c(Division, type, cr))
  data <- merge(data, Table_S11_CR, by = c("Division", "type"), all.x = TRUE, all.y = FALSE)
  data$CR <- ifelse(is.na(data$crown_ratio) | data$status == "0", data$cr, data$crown_ratio)
  data <- subset(data, select = -c(Division, cr))

  # add column for trees that will have NA biomass estimates
  data$calc_bio <- "Y"
  data$calc_bio <- ifelse(is.na(data$status), "N", data$calc_bio)
  data$calc_bio <- ifelse(is.na(data$species), "N", data$calc_bio)
  data$calc_bio <- ifelse(is.na(data$dbh), "N", data$calc_bio)
  data$calc_bio <- ifelse(!is.na(data$dbh) & data$dbh < 1.0, "N", data$calc_bio)
  data$calc_bio <- ifelse(is.na(data$ht1), "N", data$calc_bio)
  data$calc_bio <- ifelse(!is.na(data$ht1) & data$ht1 < 4.5, "N", data$calc_bio)
  data$calc_bio <- ifelse(data$top == "N" & is.na(data$ht2), "N", data$calc_bio)
  data$calc_bio <- ifelse(!is.na(data$ht2) & data$ht2 < 4.5, "N", data$calc_bio)

  # make sure columns are the correct class
  data$status <- as.character(data$status)
  data$species <- as.character(data$species)
  data$division <- as.character(data$division)
  data$JENKINS_SPGRPCD <- as.character(data$JENKINS_SPGRPCD)

  return(data)

}


################################################################################
################################################################################
# CleanDF function
################################################################################
################################################################################

CleanDF <- function(data, in_units, out_units, sp) {

  # make sure DBH and HT outputs are in correct units
  if(in_units == "imperial" & out_units == "metric") {

    data$dbh_cm <- data$dbh*2.54
    data$ht1_m <- data$ht1/3.28084
    data$ht2_m <- data$ht2/3.28084
    data$exp_factor <- data$exp_factor*2.47105 # SPA to SPH

  } else if(in_units == "metric" & out_units == "imperial") {

    data$exp_factor <- data$exp_factor/2.47105 # SPH to SPA

  }

  # make sure species outputs are clearly labeled
  if(sp == "4letter") {

    data$species_fia <- data$species
    data$species <- data$letter
    data <- subset(data, select = -letter)

  }

  # make sure biomass/carbon outputs are in correct units
  if(out_units == "metric") {

    data$total_wood_kg <- data$total_wood_bio*0.45359
    data$total_bark_kg <- data$total_bark_bio*0.45359
    data$total_branch_kg <- data$total_branch_bio*0.45359
    data$total_ag_kg <- data$total_ag_bio*0.45359
    data$merch_wood_kg <- data$merch_wood_bio*0.45359
    data$merch_bark_kg <- data$merch_bark_bio*0.45359
    data$merch_total_kg <- data$merch_total_bio*0.45359
    data$merch_top_kg <- data$merch_top_bio*0.45359
    data$stump_wood_kg <- data$stump_wood_bio*0.45359
    data$stump_bark_kg <- data$stump_bark_bio*0.45359
    data$stump_total_kg <- data$stump_total_bio*0.45359
    data$foliage_kg <- data$foliage_bio*0.45359

    data$total_wood_c <- data$total_wood_kg*data$carbon_frac
    data$total_bark_c <- data$total_bark_kg*data$carbon_frac
    data$total_branch_c <- data$total_branch_kg*data$carbon_frac
    data$total_ag_c <- data$total_ag_kg*data$carbon_frac
    data$merch_wood_c <- data$merch_wood_kg*data$carbon_frac
    data$merch_bark_c <- data$merch_bark_kg*data$carbon_frac
    data$merch_total_c <- data$merch_total_kg*data$carbon_frac
    data$merch_top_c <- data$merch_top_kg*data$carbon_frac
    data$stump_wood_c <- data$stump_wood_kg*data$carbon_frac
    data$stump_bark_c <- data$stump_bark_kg*data$carbon_frac
    data$stump_total_c <- data$stump_total_kg*data$carbon_frac
    data$foliage_c <- data$foliage_kg*0.5 # kept at 0.5, not as the species-specific carbon value

  } else if(out_units == "imperial") {

    data$dbh_in <- data$dbh
    data$ht1_ft <- data$ht1
    data$ht2_ft <- data$ht2

    data$total_wood_tons <- data$total_wood_bio*0.0005
    data$total_bark_tons <- data$total_bark_bio*0.0005
    data$total_branch_tons <- data$total_branch_bio*0.0005
    data$total_ag_tons <- data$total_ag_bio*0.0005
    data$merch_wood_tons <- data$merch_wood_bio*0.0005
    data$merch_bark_tons <- data$merch_bark_bio*0.0005
    data$merch_total_tons <- data$merch_total_bio*0.0005
    data$merch_top_tons <- data$merch_top_bio*0.0005
    data$stump_wood_tons <- data$stump_wood_bio*0.0005
    data$stump_bark_tons <- data$stump_bark_bio*0.0005
    data$stump_total_tons <- data$stump_total_bio*0.0005
    data$foliage_tons <- data$foliage_bio*0.0005

    data$total_wood_c <- data$total_wood_tons*data$carbon_frac
    data$total_bark_c <- data$total_bark_tons*data$carbon_frac
    data$total_branch_c <- data$total_branch_tons*data$carbon_frac
    data$total_ag_c <- data$total_ag_tons*data$carbon_frac
    data$merch_wood_c <- data$merch_wood_tons*data$carbon_frac
    data$merch_bark_c <- data$merch_bark_tons*data$carbon_frac
    data$merch_total_c <- data$merch_total_tons*data$carbon_frac
    data$merch_top_c <- data$merch_top_tons*data$carbon_frac
    data$stump_wood_c <- data$stump_wood_tons*data$carbon_frac
    data$stump_bark_c <- data$stump_bark_tons*data$carbon_frac
    data$stump_total_c <- data$stump_total_tons*data$carbon_frac
    data$foliage_c <- data$foliage_tons*0.5 # kept at 0.5, not as the species-specific carbon value

  }

  # select final output columns
  data <- subset(data, select = -c(type, JENKINS_SPGRPCD, WDSG, k, DensProp, wood_prop, bark_prop, branch_prop,
                                   path, CR, dbh, ht1, ht2,
                                   total_wood_bio, total_bark_bio, total_branch_bio, total_ag_bio,
                                   merch_wood_bio, merch_bark_bio, merch_total_bio, merch_top_bio,
                                   stump_wood_bio, stump_bark_bio, stump_total_bio,
                                   foliage_bio, carbon_frac))

  all_cols <- colnames(data)

  if(out_units == "metric" & sp == "fia") {

    main_cols <- c("division", "status", "decay_class", "species", "dbh_cm", "ht1_m", "ht2_m", "crown_ratio", "top", "cull",
                   "total_wood_kg", "total_bark_kg", "total_branch_kg", "total_ag_kg",
                   "merch_wood_kg", "merch_bark_kg", "merch_total_kg", "merch_top_kg",
                   "stump_wood_kg", "stump_bark_kg", "stump_total_kg", "foliage_kg",
                   "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                   "merch_wood_c", "merch_bark_c", "merch_total_c", "merch_top_c",
                   "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio")

  } else if(out_units == "metric" & sp == "4letter") {

    main_cols <- c("division", "status", "decay_class", "species", "species_fia",
                   "dbh_cm", "ht1_m", "ht2_m", "crown_ratio", "top", "cull",
                   "total_wood_kg", "total_bark_kg", "total_branch_kg", "total_ag_kg",
                   "merch_wood_kg", "merch_bark_kg", "merch_total_kg", "merch_top_kg",
                   "stump_wood_kg", "stump_bark_kg", "stump_total_kg", "foliage_kg",
                   "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                   "merch_wood_c", "merch_bark_c", "merch_total_c", "merch_top_c",
                   "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio")

  } else if(out_units == "imperial" & sp == "fia") {

    main_cols <- c("division", "status", "decay_class", "species", "dbh_in", "ht1_ft", "ht2_ft", "crown_ratio", "top", "cull",
                   "total_wood_tons", "total_bark_tons", "total_branch_tons", "total_ag_tons",
                   "merch_wood_tons", "merch_bark_tons", "merch_total_tons", "merch_top_tons",
                   "stump_wood_tons", "stump_bark_tons", "stump_total_tons", "foliage_tons",
                   "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                   "merch_wood_c", "merch_bark_c", "merch_total_c", "merch_top_c",
                   "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio")

  } else if(out_units == "imperial" & sp == "4letter") {

    main_cols <- c("division", "status", "decay_class", "species", "species_fia", "dbh_in", "ht1_ft", "ht2_ft", "crown_ratio", "top", "cull",
                   "total_wood_tons", "total_bark_tons", "total_branch_tons", "total_ag_tons",
                   "merch_wood_tons", "merch_bark_tons", "merch_total_tons", "merch_top_tons",
                   "stump_wood_tons", "stump_bark_tons", "stump_total_tons", "foliage_tons",
                   "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                   "merch_wood_c", "merch_bark_c", "merch_total_c", "merch_top_c",
                   "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio")

  }

  extra_cols <- all_cols[!(all_cols %in% main_cols)]
  cols_ordered <- c(main_cols, extra_cols)
  data <- subset(data, select = cols_ordered)

  return(data)

}

