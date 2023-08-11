
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
#'ForestComp(data = demo_data,
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
  step3 <- CompCalc(comp_data = step2,
                    comp_rel = relative,
                    comp_units = units)

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
  # Check that status is as expected
  ###########################################################

  data_val[[status_val]] <- as.factor(data_val[[status_val]]) # coerce status_val into factor

  if ('TRUE' %in% is.na(data_val[[status_val]])) {

    warning('There are trees with missing status codes in the provided dataframe.\n',
            'Trees with NA status codes will not be included in the composition calculations.\n',
            'Consider addressing these missing values in your data.\n',
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
  # Check for NAs
  ###########################################################

  data_val[[site_val]] <- as.character(data_val[[site_val]]) # coerce into character
  data_val[[plot_val]] <- as.character(data_val[[plot_val]]) # coerce into character
  data_val[[sp_val]] <- as.character(data_val[[sp_val]]) # coerce sp_val into character

  if ('TRUE' %in% is.na(data_val[[site_val]])) {

    stop('There are missing site names in the provided dataframe.')

  }

  if ('TRUE' %in% is.na(data_val[[plot_val]])) {

    stop('There are missing plot names in the provided dataframe.\n')

  }

  if ('TRUE' %in% is.na(data_val[[ef_val]])) {

    stop('There are missing expansion factors in the provided dataframe.\n')

  }

  if ('TRUE' %in% is.na(data_val[[sp_val]])) {

    warning('There are trees with missing species codes in the provided dataframe.\n',
            'Trees with NA species codes will be assigned "UNTR" for unknown tree.\n',
            ' \n')
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
  colnames(data_val)[which(names(data_val) == colnames(data_val[status_val]))] <- "status"
  colnames(data_val)[which(names(data_val) == colnames(data_val[sp_val]))] <- "species"
  colnames(data_val)[which(names(data_val) == colnames(data_val[dbh_val]))] <- "dbh"

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

    if(is.na(sp_data$species[i])) {

      sp_data$species[i] <- "UNTR"

    }

  }

  return(sp_data)

}


################################################################################
################################################################################
# CompCalc function
################################################################################
################################################################################

CompCalc <- function(comp_data, comp_rel, comp_units) {

  if (comp_units == "metric") {

    live_trees <- subset(comp_data, !is.na(status) & !is.na(dbh) & status == 1)
    live_trees$ba_tree <- (pi*((live_trees$dbh^2)/40000)) # calculate BA

  } else if (comp_units == "imperial") {

    live_trees <- subset(comp_data, !is.na(status) & status == 1)
    live_trees$ba_tree <- (pi*((live_trees$dbh^2)/576)) # calculate BA

  }

  live_trees$ba_area <- live_trees$ba_tree*live_trees$ef

  # create empty dataframe to fill
  fill_df <- data.frame(matrix(nrow = 0, ncol = 4))
  colnames(fill_df) <- c("site", "plot", "species", "dominance")

  # loop through each site, plot, and species
  forests <- unique(live_trees$site)

  for(f in forests) {

    all_plots <- subset(live_trees, site == f)
    plot_ids <- unique(all_plots$plot)

    for(p in plot_ids) {

      all_trees <- subset(all_plots, plot == p)
      species_ids <- unique(all_trees$species)

      temp_df <- data.frame(site = f,
                            plot = p,
                            species = unique(live_trees$species),
                            dominance = 0)

      total_ba <- sum(all_trees$ba_area)
      total_stems <- sum(all_trees$ef)

      for(sp in species_ids) {

        single_sp <- subset(all_trees, species == sp)

        sum_sp_ba <- sum(single_sp$ba_area)
        sum_sp_stems <- sum(single_sp$ef)

        if (comp_rel == "BA"){

          temp_df[temp_df$species == sp, "dominance"] <- round((sum_sp_ba/total_ba)*100,1)

        } else if (comp_rel == "density") {

          temp_df[temp_df$species == sp, "dominance"] <- round((sum_sp_stems/total_stems)*100,1)

        }

      }

      fill_df <- rbind(fill_df, temp_df)

    }

  }

  recognized_sp <- paste0(unique(live_trees$species), sep = "  ")

  message('The following species were present: ', recognized_sp, ' \n',
          'Use this list to check for species code typos.')

  return(fill_df)

}
