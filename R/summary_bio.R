
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

#' @title TreeBiomass
#'
#' @description
#' Uses Forest Inventory and Analysis (FIA) Regional Biomass Equations to estimate above-ground stem, bark, and branch tree biomass. The package uses the California equation set and should not be used for data from other regions.
#'
#' @param data A dataframe or tibble. Each row must be an observation of an individual tree.
#' @param status Must be a variable (column) in the provided dataframe or tibble. Specifies whether the individual tree is alive (1) or dead (0). The class of this variable will be coerced to factor.
#' @param species Must be a variable (column) in the provided dataframe or tibble. Specifies the species of the individual tree. Must follow four-letter species code or FIA naming conventions (see README file for more detail). The class of this variable will be coerced to character.
#' @param dbh Must be a numeric variable (column) in the provided dataframe or tibble. Provides the diameter at breast height (DBH) of the individual tree in either centimeters or inches.
#' @param ht Must be a numeric variable (column) in the provided dataframe or tibble. Provides the height of the individual tree in either meters or feet.
#' @param sp_codes Not a variable (column) in the provided dataframe or tibble. Specifies whether the species variable follows the four-letter code or FIA naming convention (see README file for more detail). Must be set to either "4letter" or "fia". The default is set to "4letter".
#' @param units Not a variable (column) in the provided dataframe or tibble. Specifies whether the dbh and ht variables were measured using metric (centimeters and meters) or imperial (inches and feet) units. Must be set to either "metric" or "imperial". The default is set to "metric".
#'
#' @return The original dataframe, with four new columns:
#' \itemize{
#' \item stem_bio_kg: biomass of stem (or bole) in kilograms
#' \item bark_bio_kg: biomass of bark in kilograms
#' \item branch_bio_kg: biomass of branches in kilograms
#' \item total_bio_kg: biomass of tree (stem + bark + branches) in kilograms
#' }
#'
#'@examples
#'TreeBiomass(data = demo_data,
#'            status = "Live",
#'            species = "SPP",
#'            dbh = "DBH_CM",
#'            ht = "HT_M",
#'            sp_codes = "4letter",
#'            units = "metric")
#'
#' @export


SummaryBiomass <- function(data, site, plot, exp_factor, status, species, dbh, ht, sp_codes = "4letter", units = "metric", results = "by_plot") {

  # Calculate tree-level biomass
  step1 <- TreeBiomass(data = data,
                       status = status,
                       species = species,
                       dbh = dbh,
                       ht = ht,
                       sp_codes = sp_codes,
                       units = units)



  return(step5)
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

  if(sp_codes_val == "by_plot" || sp_codes_val == "by_species") {
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

    stop('There are missing (NA) site names in the provided data frame.\n')

  }

  if ('TRUE' %in% is.na(data_val[[plot_val]])) {

    stop('There are missing (NA) plot names in the provided data frame.\n')

  }

  if ('TRUE' %in% is.na(data_val[[ef_val]])) {

    stop('There are missing (NA) expansion factors in the provided data frame.\n')

  }


  ###########################################################
  # Final dataframe prep
  ###########################################################

  # rename other columns to use moving forward ---------------------------------
  colnames(data_val)[which(names(data_val) == colnames(data_val[site_val]))] <- "site"
  colnames(data_val)[which(names(data_val) == colnames(data_val[plot_val]))] <- "plot"
  colnames(data_val)[which(names(data_val) == colnames(data_val[ef_val]))] <- "ef"
  colnames(data_val)[which(names(data_val) == colnames(data_val[status_val]))] <- "status"
  colnames(data_val)[which(names(data_val) == colnames(data_val[species_val]))] <- "species"

  return(data_val)

}
