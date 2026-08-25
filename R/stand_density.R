
tree_trial <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,1,1,1,2,2,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,0),
  status = c("0", "0", "0", "1", NA, "1", "1", "0", "0",NA),
  dbh = c(1.3, 44.7, 19.1, NA, 13.8, 2.2, 1.7, 13.1, 15.8,NA)
)

sub_trial <- data.frame(
  site = c("SEKI", "YOMI"),
  subsection = c("413Hr", "313Ga")
)

StandDensity(tree_trial, sub_trial)


################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

StandDensity <- function(tree_data, subsec_data, input_units = "metric", output_units = "metric") {

  # coerce tibble inputs into data.frame
  tree_step0 <- as.data.frame(tree_data)
  subsec_step0 <- as.data.frame(subsec_data)

  # check that options are set appropriately
  ValidateSDIOptions(in_units_val = input_units,
                     out_units_val = output_units)

  # Check input tree data
  ValidateSDITrees(tree_data_val = tree_step0)

  # check input subsection data
  #ValidateSDISubs(sub_data_val = subsec_step0)

  # check for site or site:plot matches for tree and subsection data
  #ValidateSDIMatches(tree_match = tree_step0,
  #                   sub_match = subsec_step0)

  # Calculate SDIs
  step1 <- CalcSDI(sdi_tree_data = tree_step0,
                   sdi_subsec_data = subsec_step0,
                   sdi_input = input_units,
                   sdi_output = output_units)

  return(step1)

}


################################################################################
################################################################################
# ValidateSDI functions
################################################################################
################################################################################

ValidateSDIOptions <- function(in_units_val, out_units_val) {

  if(!(in_units_val %in% c("metric", "imperial"))) {
    stop('The "input_units" parameter must be set to either "metric" or "imperial."')
  }

  if(!(out_units_val %in% c("metric", "imperial"))) {
    stop('The "output_units" parameter must be set to either "metric" or "imperial."')
  }

}


ValidateSDITrees <- function(tree_data_val) {

  ###########################################################
  # Check that all columns are in the provided dataframe
  ###########################################################

  necessary_columns = c("site", "plot", "exp_factor", "status", "dbh")

  if(!all(is.element(necessary_columns, names(tree_data_val)))) {

    stop('tree_data is missing necessary columns!\n',
         'tree_data must include: time, site, plot, exp_factor, status, dbh')

  }


  ###########################################################
  # Check that column classes are as expected
  ###########################################################

  # Categorical variables ------------------------------------------------------
  if(!is.character(tree_data_val$site)) {
    stop('"site" in tree_data must be a character variable.\n',
         'You have input a variable of class: ', class(tree_data_val$site))
  }

  if(!is.character(tree_data_val$plot)) {
    stop('"plot" in tree_data must be a character variable.\n',
         'You have input a variable of class: ', class(tree_data_val$plot))
  }

  if(!is.character(tree_data_val$status)) {
    stop('"status" in tree_data must be a character variable.\n',
         'You have input a variable of class: ', class(tree_data_val$status))
  }

  # Numeric variables ----------------------------------------------------------
  if(!is.numeric(tree_data_val$exp_factor)) {
    stop('"exp_factor" in tree_data must be a numerical variable.\n',
         'You have input a variable of class: ', class(tree_data_val$exp_factor))
  }

  if(!is.numeric(tree_data_val$dbh)) {
    stop('"dbh" in tree_data must be a numerical variable.\n',
         'You have input a variable of class: ', class(tree_data_val$dbh))
  }


  ###########################################################
  # Check that site and plot are as expected
  ###########################################################

  if ('TRUE' %in% is.na(tree_data_val$site)) {
    stop('"site" in tree_data has missing values.')
  }

  if ('TRUE' %in% is.na(tree_data_val$plot)) {
    stop('"plot" in tree_data has missing values.')
  }


  ##########################################################
  # check that expansion factor is as expected
  ##########################################################

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(tree_data_val$exp_factor)) {

    stop('"exp_factor" in tree_data has missing values.\n',
         'For plots with no trees, set "exp_factor" to 0.')

  }

  # Check for negative ef ------------------------------------------------------
  if (min(tree_data_val$exp_factor) < 0) {
    stop('"exp_factor" in tree_data has values < 0. All values must be >= 0.')
  }

  # Check for proper use of 0 ef -----------------------------------------------
  forests <- unique(tree_data_val$site)

  for(f in forests) {

    all_plots <- subset(tree_data_val, site == f)
    plot_ids <- unique(all_plots$plot)

    for(p in plot_ids) {

      all_trees <- subset(all_plots, plot == p)

      if(any(all_trees$exp_factor == 0)) {

        if(nrow(all_trees) > 1) {

          stop('There are plots with an "exp_factor" of 0 that have more than one row.\n',
               'Plots with no trees should be represented by a single row with "site" and "plot" filled in and "exp_factor" set to 0.')

        }

      }

    }

  }

  plots_wo_trees <- subset(tree_data_val, exp_factor == 0, select = c(status, dbh))

  if(any(!is.na(plots_wo_trees))) {

    stop('There are plots with an "exp_factor" of 0 that have non-NA values for "status" or "dbh".\n',
         'Plots with no trees should be represented by a single row with "site" and "plot" filled in,\n',
         '"exp_factor" set to 0, "status" set to NA, and "dbh" set to NA.')

  }


  ###########################################################
  # Check that status is as expected
  ###########################################################

  # Check for unrecognized status codes ----------------------------------------
  if(!all(tree_data_val$status %in% c("0","1", NA))) {

    unrecognized_status <- sort(unique(
      tree_data_val$status[!(tree_data_val$status %in% c("0", "1", NA))]
    ))

    stop('"status" in tree_data must be 0 or 1.\n',
         'Unrecognized status codes: ', paste(unrecognized_status, collapse = ", "))
  }

  # Check for NA ---------------------------------------------------------------
  plots_w_trees <- subset(tree_data_val, exp_factor > 0)

  if (any(is.na(plots_w_trees$status))) {

    warning('There are missing "status" values in tree_data outside of plots with an "exp_factor" of 0.\n',
            'Plots with an "exp_factor" of 0 represent plots with no trees and should have NA "status".\n',
            'Trees with NA "status" will be ignored in the SDI calculations. Consider investigating these trees.\n',
            ' \n')
  }


  ###########################################################
  # Check that dbh is as expected
  ###########################################################

  # Check for negative dbh -----------------------------------------------------
  if (min(tree_data_val$dbh, na.rm = TRUE) <= 0) {
    stop('"dbh" in tree_data has values <= 0. All values must be > 0.')
  }

  # Check for NA ---------------------------------------------------------------
  if (any(is.na(plots_w_trees$dbh))) {

    warning('There are missing "dbh" values in tree_data outside of plots with an "exp_factor" of 0.\n',
            'Plots with an "exp_factor" of 0 represent plots with no trees and should have NA "dbh".\n',
            'Trees with NA "dbh" will be ignored in the SDI calculations. Consider investigating these trees.\n',
            ' \n')
  }

}












ValidateSDISubs <- function(sub_data_val) {

  ###########################################################
  # Check that all columns are in the provided dataframe
  ###########################################################


  # CHANGE THIS STYLE TO MATCH NSVB

  necessary_columns = c("site", "plot", "exp_factor", "status", "dbh")

  if(!all(is.element(necessary_columns, names(tree_data_val)))) {

    stop('tree_data is missing necessary columns!\n',
         'tree_data must include: time, site, plot, exp_factor, status, dbh')

  }


  ###########################################################
  # Check that column classes are as expected
  ###########################################################

  # Categorical variables ------------------------------------------------------
  if(!is.character(tree_data_val$site)) {
    stop('"site" in tree_data must be a character variable.\n',
         'You have input a variable of class: ', class(tree_data_val$site))
  }

  if(!is.character(tree_data_val$plot)) {
    stop('"plot" in tree_data must be a character variable.\n',
         'You have input a variable of class: ', class(tree_data_val$plot))
  }

  if(!is.character(tree_data_val$status)) {
    stop('"status" in tree_data must be a character variable.\n',
         'You have input a variable of class: ', class(tree_data_val$status))
  }


  ###########################################################
  # Check that site and plot are as expected
  ###########################################################

  if ('TRUE' %in% is.na(tree_data_val$site)) {
    stop('"site" in tree_data has missing values.')
  }

  if ('TRUE' %in% is.na(tree_data_val$plot)) {
    stop('"plot" in tree_data has missing values.')
  }







}

















ValidateMatches <- function(tree_match, fuel_match) {

  tree_match$obs_id <- NA
  n <- nrow(tree_match)

  for(i in 1:n) {

    t <- tree_match$time[i]
    s <- tree_match$site[i]
    p <- tree_match$plot[i]

    tree_match$obs_id[i] <- paste0(t,'-',s,'-',p)

  }


  fuel_match$obs_id <- NA
  n <- nrow(fuel_match)

  for(i in 1:n) {

    t <- fuel_match$time[i]
    s <- fuel_match$site[i]
    p <- fuel_match$plot[i]

    fuel_match$obs_id[i] <- paste0(t,'-',s,'-',p)

  }

  if(!all(is.element(tree_match$obs_id,fuel_match$obs_id)) ||
     !all(is.element(fuel_match$obs_id,tree_match$obs_id))) {

    trees_wo_fuels <- paste0(unique(tree_match[!is.element(tree_match$obs_id,fuel_match$obs_id), "obs_id"]), sep = " ")
    fuels_wo_trees <- paste0(unique(fuel_match[!is.element(fuel_match$obs_id,tree_match$obs_id), "obs_id"]), sep = " ")

    stop('Tree and fuel data did not completely match!\n',
         'These time:site:plot combinations have tree data but no fuel data: ', trees_wo_fuels, '\n',
         'These time:site:plot combinations have fuel data but no tree data: ', fuels_wo_trees)

  }

}







################################################################################
################################################################################
# CalcSDI function
################################################################################
################################################################################

CalcSDI <- function(sdi_tree_data, sdi_subsec_data, sdi_input, sdi_output) {

  # unit conversion
  if(sdi_input == "imperial") {

    sdi_tree_data$exp_factor <- sdi_tree_data$exp_factor*2.47105
    sdi_tree_data$dbh <- sdi_tree_data$dbh*2.54

  }

  # calculate current SDI
  # create empty dataframe to fill
  fill_df <- data.frame(matrix(nrow = 0, ncol = 3))
  colnames(fill_df) <- c("site", "plot", "current_sdi")

  # loop through each site and plot
  forests <- unique(sdi_tree_data$site)

  for(f in forests) {

    all_plots <- subset(sdi_tree_data, site == f)
    plot_ids <- unique(all_plots$plot)

    for(p in plot_ids) {

      all_trees <- subset(all_plots, plot == p)

      complete <- complete.cases(all_trees[c("status", "dbh")])
      alert_na <- !any(complete)
      alert_all_dead <- any(complete) && all(all_trees$status[complete] == "0")

      live <- complete & all_trees$status != "0"
      alert_too_small <- any(live) && all(all_trees$dbh[live] < 2.54)

      # if there are no trees in the plot
      if(sum(all_trees$exp_factor) == 0) {
        temp_df <- data.frame(site = f, plot = p, current_sdi = 0)

      # if there are no complete cases of status and dbh
      } else if(alert_na) {
        temp_df <- data.frame(site = f, plot = p, current_sdi = NA)

      # if there are no live trees
      } else if(alert_all_dead) {
        temp_df <- data.frame(site = f, plot = p, current_sdi = 0)

      # if there are no live trees with dbh >= 2.54 cm
      } else if(alert_too_small) {
        temp_df <- data.frame(site = f, plot = p, current_sdi = 0)

      # if there are live trees with dbh >= 2.54 cm
      } else {

        live_large <- live & all_trees$dbh >= 2.54

        temp_df <- data.frame(site = f,
                              plot = p,
                              current_sdi = sum(all_trees$exp_factor[live_large]*(all_trees$dbh[live_large]/25.4)^1.6))
      }

      fill_df <- rbind(fill_df, temp_df)

    }

  }

  # pull median maxSDI
  max_sdi_data <- merge(sdi_subsec_data, subsec_max_sdi, by = "subsection", all.x = TRUE, all.y = FALSE)

  if("plot" %in% names(max_sdi_data)) {
    merged_sdi_data <- merge(fill_df, max_sdi_data, by = c("site", "plot"))
  } else {
    merged_sdi_data <- merge(fill_df, max_sdi_data, by = "site", all = TRUE)
  }

  # unit conversion and clean up
  if(sdi_output == "imperial") {

    merged_sdi_data$current_sdi_spa <- round(merged_sdi_data$current_sdi/2.47105,0)
    merged_sdi_data$max_sdi_spa <- round(merged_sdi_data$median_sdi_max/2.47105,0)
    merged_sdi_data$rel_density <- merged_sdi_data$current_sdi_spa/merged_sdi_data$max_sdi_spa
    return_sdi_df <- merged_sdi_data[c("site", "plot", "current_sdi_spa", "max_sdi_spa", "rel_density")]

  } else {

    merged_sdi_data$current_sdi_sph <- round(merged_sdi_data$current_sdi,0)
    merged_sdi_data$max_sdi_sph <- round(merged_sdi_data$median_sdi_max,0)
    merged_sdi_data$rel_density <- merged_sdi_data$current_sdi_sph/merged_sdi_data$max_sdi_sph
    return_sdi_df <- merged_sdi_data[c("site", "plot", "current_sdi_sph", "max_sdi_sph", "rel_density")]

  }

  return_sdi_df <- return_sdi_df[order(return_sdi_df$site, return_sdi_df$plot), ]
  return(return_sdi_df)

}
