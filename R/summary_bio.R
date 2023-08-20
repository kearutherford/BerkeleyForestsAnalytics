
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
#' @param site Must be a variable (column) in the provided dataframe or tibble. Describes the broader location or forest where the data were collected. The class of this variable will be coerced to character.
#' @param plot Must be a variable (column) in the provided dataframe or tibble. Identifies the plot in which the individual tree was measured. The class of this variable will be coerced to character.
#' @param exp_factor Must be a numeric variable (column) in the provided dataframe or tibble. The expansion factor specifies the number of trees per hectare (or per acre) that a given plot tree represents.
#' @param status Must be a variable (column) in the provided dataframe or tibble. Specifies whether the individual tree is alive (1) or dead (0). The class of this variable will be coerced to factor.
#' @param decay_class Must be a variable (column) in the provided dataframe or tibble. For standing dead trees, the decay class should be 1, 2, 3, 4, or 5 (see README file for more detail). For live trees, the decay class should be NA or 0. The class of this variable will be coerced to character.
#' @param species Must be a variable (column) in the provided dataframe or tibble. Specifies the species of the individual tree. Must follow four-letter species code or FIA naming conventions (see README file for more detail). The class of this variable will be coerced to character.
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
#'@examples
#'SummaryBiomass(data = bio_demo_data,
#'               site = "Forest",
#'               plot = "Plot_id",
#'               exp_factor = "SPH",
#'               status = "Live",
#'               decay_class = "Decay",
#'               species = "SPP",
#'               dbh = "DBH_CM",
#'               ht = "HT_M",
#'               results = "by_species")
#'
#' @export

SummaryBiomass <- function(data, site, plot, exp_factor, status, decay_class, species, dbh, ht, sp_codes = "4letter", units = "metric", results = "by_plot") {

  # Calculate tree-level biomass, adjusted for standing dead trees
  step1 <- AdjustBiomass(data = data,
                         status = status,
                         decay_class = decay_class,
                         species = species,
                         dbh = dbh,
                         ht = ht,
                         sp_codes = sp_codes,
                         units = units)

  # Check and prep input data
  step2 <- ValidateSumData(data_val = step1,
                           site_val = site,
                           plot_val = plot,
                           ef_val = exp_factor,
                           results_val = results,
                           status_val = status,
                           sp_val = species)

  # Summarize biomass at the plot level
  if(results == "by_plot") {

    step3 <- SumByPlot(bio_data = step2,
                       bio_units = units)

  } else if (results == "by_species") {

    step3 <- SumBySpecies(bio_data = step2,
                          bio_units = units)

  }

  return(step3)
}


################################################################################
################################################################################
# ValidateSumData function
################################################################################
################################################################################

ValidateSumData <- function(data_val, site_val, plot_val, ef_val, results_val, status_val, sp_val) {


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


  ###########################################################
  # Check that column classes are as expected
  ###########################################################

  if(!is.numeric(data_val[[ef_val]])) {
    stop('The parameter exp_factor requires a numerical variable.\n',
         'You have input a variable of class: ', class(data_val[[ef_val]]))
  }


  ###########################################################
  # Check that options are set appropriately
  ###########################################################

  if(results_val == "by_plot" || results_val == "by_species") {
    # do nothing
  } else {
    stop('The "results" parameter must be set to either "by_plot" or "by_species".')
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

    stop('There are missing expansion factors in the provided dataframe.\n',
         'For plots with no trees, put zero for the expansion factor.\n',
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

  return(data_val)

}

utils::globalVariables(c("stem_bio", "site", "status", "species"))
