
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

#' @title LitterDuff
#'
#' @description
#' Estimates duff and litter fuel loads. See \href{https://github.com/kearutherford/BerkeleyForestsAnalytics/tree/main}{README} for details.
#'
#' @param tree_data A dataframe or tibble with the following columns: time, site, plot, exp_factor, species, and dbh. Each row must be an observation of an individual tree.
#' @param fuel_data A dataframe or tibble. If the measurement parameter is set to "separate" the following columns are required: time, site, plot, transect, litter_depth, and duff_depth. If the measurement parameter is set to "combined" the following columns are required: time, site, plot, transect, and lit_duff_depth.
#' @param sp_codes Specifies whether the species column in tree_data follows the four-letter code or FIA naming convention. Must be set to either “4letter” or “fia”. The default is set to “4letter”.
#' @param units Specifies whether the input data are in metric (centimeters, meters, and trees per hectare) or imperial (inches, feet, and trees per acre) units. Inputs must be all metric or all imperial (do not mix-and-match units). The output units will match the input units (i.e., if inputs are in metric then outputs will be in metric). Must be set to either “metric” or “imperial”. The default is set to “metric”.
#' @param measurement Specifies whether duff and litter were measured together or separately. Must be set to "combined" or "separate". The default is set to "separate".
#'
#' @return A dataframe with the following columns:
#' \itemize{
#'  \item If measurement is set to "separate"
#'    \itemize{
#'      \item time: as described above
#'      \item site: as described above
#'      \item plot: as described above
#'      \item litter_Mg_ha (or litter_ton_ac): litter load in megagrams per hectare (or US tons per acre)
#'      \item duff_Mg_ha (or duff_ton_ac): duff load in megagrams per hectare (or US tons per acre)
#'    }
#'  \item If measurement is set to "combined"
#'    \itemize{
#'      \item time: as described above
#'      \item site: as described above
#'      \item plot: as described above
#'      \item lit_duff_Mg_ha (or lit_duff_ton_ac): combined litter and duff load in megagrams per hectare (or US tons per acre)
#'    }
#' }
#'
#' @examples
#' LitterDuff(tree_data = overstory_demo,
#'            fuel_data = lit_duff_demo)
#'
#' @export

LitterDuff <- function(fuel_data, tree_data, sp_codes = "4letter", units = "metric", measurement = "separate") {

  # check and prep input fuel data
  step1 <- ValidateLitDuff(fuel_data_val = fuel_data,
                           units_val = units,
                           meas_val = measurement)

  # check and prep input tree data
  step2 <- ValidateOverstory(tree_data_val = tree_data,
                             sp_codes_val = sp_codes)

  # check for time:site:plot matches for tree and fuel data
  step3 <- ValidateMatches(fuel_match = step1,
                           tree_match = step2)

  # calculate duff/litter loads at the plot level
  step4 <- LitDuffLoad(ld_fuel_data = step1,
                       ld_tree_data = step2,
                       ld_units = units,
                       ld_sp_codes = sp_codes,
                       ld_measurement = measurement)

  return(step4)

}


################################################################################
################################################################################
# ValidateLitDuff function
################################################################################
################################################################################

ValidateLitDuff <- function(fuel_data_val, units_val, meas_val) {

  # coerce tibble inputs into data.frame
  fuel_data_val <- as.data.frame(fuel_data_val)


  ###########################################################
  # Check that options are set appropriately
  ###########################################################

  if(units_val == "metric" || units_val == "imperial") {
    # do nothing
  } else {
    stop('The "units" parameter must be set to either "metric" or "imperial".')
  }

  if(meas_val == "separate" || meas_val == "combined") {
    # do nothing
  } else {
    stop('The "measurement" parameter must be set to either "separate" or "combined".')
  }


  ###########################################################
  # Check that all columns are in the provided dataframe
  ###########################################################

  if(meas_val == "separate") {

    necessary_columns = c("time", "site", "plot", "transect",
                          "litter_depth", "duff_depth")

    if(!all(is.element(necessary_columns, names(fuel_data_val)))) {

      stop('fuel_data is missing necessary columns!\n',
           'fuel_data must include: time, site, plot, transect, litter_depth and duff_depth\n',
           'when measurement is set to "separate".\n',
           ' \n')

    }

  } else {

    necessary_columns = c("time", "site", "plot", "transect", "lit_duff_depth")

    if(!all(is.element(necessary_columns, names(fuel_data_val)))) {

      stop('fuel_data is missing necessary columns!\n',
           'fuel_data must include: time, site, plot, transect, and lit_duff_depth\n',
           'when measurement is set to "combined".\n',
           ' \n')

    }

  }


  ###########################################################
  # Check for missing time:site:plot:transect information
  ###########################################################

  if ('TRUE' %in% is.na(fuel_data_val$time)) {
    stop('For fuel_data, there are missing values in the time column.')
  }

  if ('TRUE' %in% is.na(fuel_data_val$site)) {
    stop('For fuel_data, there are missing values in the site column.')
  }

  if ('TRUE' %in% is.na(fuel_data_val$plot)) {
    stop('For fuel_data, there are missing values in the plot column.')
  }

  if ('TRUE' %in% is.na(fuel_data_val$transect)) {
    stop('For fuel_data, there are missing values in the transect column.')
  }


  ############################################################
  # Check that time/site/plot/transect classes are as expected
  ############################################################

  if(!is.character(fuel_data_val$time)) {
    stop('For fuel_data, the parameter time requires a character variable.\n',
         'You have input a variable of class: ', class(fuel_data_val$time))
  }

  if(!is.character(fuel_data_val$site)) {
    stop('For fuel_data, the parameter site requires a character variable.\n',
         'You have input a variable of class: ', class(fuel_data_val$site))
  }

  if(!is.character(fuel_data_val$plot)) {
    stop('For fuel_data, the parameter plot requires a character variable.\n',
         'You have input a variable of class: ', class(fuel_data_val$plot))
  }

  if(!is.character(fuel_data_val$transect)) {
    stop('For fuel_data, the parameter transect requires a character variable.\n',
         'You have input a variable of class: ', class(fuel_data_val$transect))
  }


  ###########################################################
  # Check that depth measurements are as expected
  ###########################################################

  if(meas_val == "separate") {

    # Check for numeric ----------------------------------------------------------
    if(!is.numeric(fuel_data_val$duff_depth)) {
      stop('For fuel_data, the parameter duff_depth requires a numerical variable.\n',
           'You have input a variable of class: ', class(fuel_data_val$duff_depth))
    }

    if(!is.numeric(fuel_data_val$litter_depth)) {
      stop('For fuel_data, the parameter litter_depth requires a numerical variable.\n',
           'You have input a variable of class: ', class(fuel_data_val$litter_depth))
    }

    # Check that depths are positive ---------------------------------------------
    if(any(fuel_data_val$duff_depth < 0, na.rm = TRUE)) {
      stop('In fuel_data there are observations with negative duff_depth values.\n',
           'Duff depth cannot be negative.')
    }

    if(any(fuel_data_val$litter_depth < 0, na.rm = TRUE)) {
      stop('In fuel_data there are observations with negative litter_depth values.\n',
           'Litter depth cannot be negative.')
    }

    # check for NAs --------------------------------------------------------------
    if ('TRUE' %in% is.na(fuel_data_val$duff_depth)) {
      warning('For fuel_data, there are missing values in the duff_depth column.\n',
              ' \n')
    }

    if ('TRUE' %in% is.na(fuel_data_val$litter_depth)) {
      warning('For fuel_data, there are missing values in the litter_depth column.\n',
              ' \n')
    }

  } else {

    # Check for numeric ----------------------------------------------------------
    if(!is.numeric(fuel_data_val$lit_duff_depth)) {
      stop('For fuel_data, the parameter lit_duff_depth requires a numerical variable.\n',
           'You have input a variable of class: ', class(fuel_data_val$lit_duff_depth))
    }

    # Check that depths are positive ---------------------------------------------
    if(any(fuel_data_val$lit_duff_depth < 0, na.rm = TRUE)) {
      stop('In fuel_data there are observations with negative lit_duff_depth values.\n',
           'Litter and duff depth cannot be negative.')
    }

    # check for NAs --------------------------------------------------------------
    if ('TRUE' %in% is.na(fuel_data_val$lit_duff_depth)) {
      warning('For fuel_data, there are missing values in the lit_duff_depth column.\n',
              ' \n')
    }

  }


  ###########################################################
  # Unit conversion (in to cm)
  ###########################################################

  if(units_val == "imperial") {

    fuel_data_val$duff_depth <- fuel_data_val$duff_depth*2.54
    fuel_data_val$litter_depth <- fuel_data_val$litter_depth*2.54

  }


  ###########################################################
  # Compile at the time:site:plot:transect level
  ###########################################################

  if(meas_val == "separate") {

    fuel_data_sub <- subset(fuel_data_val, select = c(time, site, plot, transect,
                                                      duff_depth, litter_depth))
  } else {

    fuel_data_sub <- subset(fuel_data_val, select = c(time, site, plot, transect,
                                                      lit_duff_depth))
  }

    fuel_data_ag <- aggregate(data = fuel_data_sub,
                              . ~ time + site + plot + transect,
                              FUN = mean, na.rm = TRUE, na.action = na.pass)

  return(fuel_data_ag)

}


################################################################################
################################################################################
# LitDuffCoef function
################################################################################
################################################################################

LitDuffCoef <- function(coef_tree_data, coef_units, coef_sp_codes) {

  # calculate proportion of time:site:plot basal area occupied by each species
  tree_dom <- TreeDom(data = coef_tree_data,
                      tree_units = coef_units)

  # create columns to fill
  tree_dom$litter <- NA
  tree_dom$duff <- NA
  tree_dom$litter_duff <- NA

  n <- nrow(tree_dom)

  # loop through each row
  for(i in 1:n) {

    sp <- tree_dom$species[i]

    if(coef_sp_codes == "4letter") {

      tree_dom$litter[i] <- DL_table[DL_table$letter == sp, "litter_coef"]
      tree_dom$duff[i] <- DL_table[DL_table$letter == sp, "duff_coef"]
      tree_dom$litter_duff[i] <- DL_table[DL_table$letter == sp, "litterduff_coef"]

    } else {

      tree_dom$litter[i] <- DL_table[DL_table$fia == sp, "litter_coef"]
      tree_dom$duff[i] <- DL_table[DL_table$fia == sp, "duff_coef"]
      tree_dom$litter_duff[i] <- DL_table[DL_table$fia == sp, "litterduff_coef"]

    }

  }

  tree_dom$coef_litter <- tree_dom$litter*tree_dom$perc_BA
  tree_dom$coef_duff <- tree_dom$duff*tree_dom$perc_BA
  tree_dom$coef_litterduff <- tree_dom$litter_duff*tree_dom$perc_BA

  tree_subset <- subset(tree_dom, select = c(time, site, plot,
                                             coef_litter, coef_duff, coef_litterduff))

  tree_ag <- aggregate(data = tree_subset,
                       . ~ time + site + plot,
                       FUN = sum)

  return(tree_ag)

}


################################################################################
################################################################################
# LitDuffLoad function
################################################################################
################################################################################

LitDuffLoad <- function(ld_fuel_data, ld_tree_data, ld_units, ld_sp_codes, ld_measurement) {

  # get BA-weighted duff and litter coefficients
  coef_calcs <- LitDuffCoef(coef_tree_data = ld_tree_data, coef_units = ld_units, coef_sp_codes = ld_sp_codes)

  # loop through each row (a transect in a time:site:plot)
  # and assign the BA-weighted coefficient value

  n <- nrow(ld_fuel_data)

  ld_fuel_data$coef_litter <- NA
  ld_fuel_data$coef_duff <- NA
  ld_fuel_data$coef_litterduff <- NA

  for(i in 1:n) {

    ld_fuel_data$coef_litter[i] <- coef_calcs[coef_calcs$time == ld_fuel_data$time[i] & coef_calcs$site == ld_fuel_data$site[i] & coef_calcs$plot == ld_fuel_data$plot[i], "coef_litter"]
    ld_fuel_data$coef_duff[i] <- coef_calcs[coef_calcs$time == ld_fuel_data$time[i] & coef_calcs$site == ld_fuel_data$site[i] & coef_calcs$plot == ld_fuel_data$plot[i], "coef_duff"]
    ld_fuel_data$coef_litterduff[i] <- coef_calcs[coef_calcs$time == ld_fuel_data$time[i] & coef_calcs$site == ld_fuel_data$site[i] & coef_calcs$plot == ld_fuel_data$plot[i], "coef_litterduff"]

  }

  # fuel load calculations
  if(ld_measurement == "separate") {

    ld_fuel_data$litter_Mg_ha <- ld_fuel_data$coef_litter*ld_fuel_data$litter_depth*10
    ld_fuel_data$duff_Mg_ha <- ld_fuel_data$coef_duff*ld_fuel_data$duff_depth*10
    ld_subset <- subset(ld_fuel_data, select = c(time, site, plot, litter_Mg_ha, duff_Mg_ha))

  } else {

    ld_fuel_data$lit_duff_Mg_ha <- ld_fuel_data$coef_litterduff*ld_fuel_data$lit_duff_depth*10
    ld_subset <- subset(ld_fuel_data, select = c(time, site, plot, lit_duff_Mg_ha))

  }

  ld_ag <- aggregate(data = ld_subset,
                     . ~ time + site + plot,
                     FUN = mean, na.rm = TRUE, na.action = na.pass)

  ld_ag[ld_ag == "NaN"] <- NA

  if(ld_units == "metric") {

    return(ld_ag)

  } else if (ld_units == "imperial" & ld_measurement == "separate") {

    ld_ag$litter_ton_ac <- ld_ag$litter_Mg_ha*0.44609
    ld_ag$duff_ton_ac <- ld_ag$duff_Mg_ha*0.44609
    ld_imperial <- subset(ld_ag, select = c(time, site, plot, litter_ton_ac, duff_ton_ac))
    return(ld_imperial)

  } else if (ld_units == "imperial" & ld_measurement == "combined") {

    ld_ag$lit_duff_ton_ac <- ld_ag$lit_duff_Mg_ha*0.44609
    ld_imperial <- subset(ld_ag, select = c(time, site, plot, lit_duff_ton_ac))
    return(ld_imperial)

  }

}

globalVariables(c("duff_depth", "litter_depth", "lit_duff_depth", "coef_litter", "coef_duff",
                  "coef_litterduff", "duff_Mg_ha", "lit_duff_Mg_ha", "litter_ton_ac", "duff_ton_ac",
                  "lit_duff_ton_ac", "litter_Mg_ha"))
