#' @title TreeBiomass
#'
#' @description
#' Uses Forest Inventory and Analysis (FIA) Regional Biomass Equations to estimate above-ground stem, bark, and branch tree biomass. The package uses the California equation set and should not be used for data from other regions.
#'
#' @param data A dataframe or tibble. Each row must be an observation of an individual tree.
#' @param site Must be a variable (column) in the provided dataframe or tibble. Describes the broader location or forest where the data were collected. The class of this variable will be coerced to character.
#' @param plot Must be a variable (column) in the provided dataframe or tibble. Identifies the plot in which the individual tree was measured. The class of this variable will be coerced to character.
#' @param exp_factor Must be a numeric variable (column) in the provided dataframe or tibble. The expansion factor specifies the number of trees per hectare (or per acre) that a given plot tree represents.
#' @param status Must be a numeric variable (column) in the provided dataframe or tibble. Specifies whether the individual tree is alive (1) or dead (0). The class of this variable will be coerced to factor.
#' @param species Must be a variable (column) in the provided dataframe or tibble. Specifies the species of the individual tree. Must follow four-letter species code or FIA naming conventions (see README file for more detail). The class of this variable will be coerced to character.
#' @param dbh Must be a numeric variable (column) in the provided dataframe or tibble. Provides the diameter at breast height (DBH) of the individual tree in either centimeters or inches.
#' @param ht Must be a numeric variable (column) in the provided dataframe or tibble. Provides the height of the individual tree in either meters or feet.
#' @param sp_codes Not a variable (column) in the provided dataframe or tibble. Specifies whether the species variable follows the four-letter code or FIA naming convention (see README file for more detail). Must be set to either "4letter" or "fia". The default is set to "4letter".
#' @param units Not a variable (column) in the provided dataframe or tibble. Specifies whether the dbh and ht variables were measured using metric (centimeters and meters) or imperial (inches and feet) units. Must be set to either "metric" or "imperial". The default is set to "metric".
#' @param results NEED TO WRITE
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
#'            site = "Forest",
#'            plot = "Plot_id",
#'            species = "SPP",
#'            dbh = "DBH_CM",
#'            ht = "HT_M",
#'            sp_codes = "4letter",
#'            units = "metric")
#'
#' @export

TreeBiomass <- function(data, site, plot, exp_factor, status, species, dbh, ht, sp_codes = "4letter", units = "metric") {

  # Check and prep input data
  step1 <- ValidateData(data_val = data,
                        site_val = site,
                        plot_val = plot,
                        ef_val = exp_factor,
                        status_val = status,
                        sp_val = species,
                        dbh_val = dbh,
                        ht_val = ht,
                        sp_codes_val = sp_codes,
                        units_val = units)

  # Calculate stem biomass
  step2 <- StemBiomass(tree_data = step1)

  # Calculate bark biomass
  step3 <- BarkBiomass(tree_data = step2)

  # Calculate branch biomass
  step4 <- BranchBiomass(tree_data = step3)

  # Format output dataframe
  step5 <- Final(data_1 = data,
                 data_2 = step4,
                 site_orig = site,
                 plot_orig = plot,
                 ef_orig = exp_factor,
                 status_orig = status,
                 sp_orig = species,
                 dbh_orig = dbh,
                 ht_orig = ht,
                 units_orig = units)

  return(step5)
}
