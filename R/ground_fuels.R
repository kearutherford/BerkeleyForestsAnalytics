
################################################################################
################################################################################
#
################################################################################
################################################################################

GroundFuels <- function(fuel_data, tree_data, sp_codes = "4letter", units = "metric") {

  # check and prep input fuel data
  step1 <- ValidateFWD(fuel_data_val = fuel_data,
                       units_val = units)

  # check and prep input tree data
  step2 <- ValidateOverstory(tree_data_val = tree_data,
                             sp_codes_val = sp_codes)

  # check for time:site:plot matches for tree and fuel data
  step3 <- ValidateMatches(fuel_match = step1,
                           tree_match = step2)

  # calculate fine fuel loads at the plot level
  step4 <- FWDLoad(fwd_fuel_data = step1,
                   fwd_tree_data = step2,
                   fwd_units = units,
                   fwd_sp_codes = sp_codes)

  return(step4)

}


################################################################################
################################################################################
#
################################################################################
################################################################################

ValidateGround <- function(fuel_data_val, units_val) {

  # coerce tibble inputs into data.frame
  fuel_data_val <- as.data.frame(fuel_data_val)


  ###########################################################
  # Check that all columns are in the provided dataframe
  ###########################################################

  necessary_columns = c("time", "site", "plot", "transect",
                        "count_1h", "count_10h", "count_100h",
                        "length_1h", "length_10h", "length_100h")

  if(!all(is.element(necessary_columns, names(fuel_data_val)))) {

    stop('fuel_data is missing necessary columns!\n',
         'fuel_data must include: time, site, plot, transect, count_1h, count_10h, count_100h,\n',
         'length_1h, length_10h, and length_100h. slope is optional.')

  }

  # Check for slope ------------------------------------------------------------
  if(!is.element("slope", names(fuel_data_val))) {

    warning('slope was not provided. The slope correction factor will be set to 1 (no slope).\n',
            ' \n')

    fuel_data_val$slope <- 0

  }


  ###########################################################
  # Check that options are set appropriately
  ###########################################################

  if(units_val == "metric" || units_val == "imperial") {
    # do nothing
  } else {
    stop('The "units" parameter must be set to either "metric" or "imperial".')
  }


  ###########################################################
  # Check for missing time:site:plot information
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


  ###########################################################
  # Check that transect lengths are as expected
  ###########################################################

  # Check for numeric ----------------------------------------------------------
  if(!is.numeric(fuel_data_val$length_1h)) {
    stop('For fuel_data, the parameter length_1h requires a numerical variable.\n',
         'You have input a variable of class: ', class(fuel_data_val$length_1h))
  }

  if(!is.numeric(fuel_data_val$length_10h)) {
    stop('For fuel_data, the parameter length_10h requires a numerical variable.\n',
         'You have input a variable of class: ', class(fuel_data_val$length_10h))
  }

  if(!is.numeric(fuel_data_val$length_100h)) {
    stop('For fuel_data, the parameter length_100h requires a numerical variable.\n',
         'You have input a variable of class: ', class(fuel_data_val$length_100h))
  }

  # check for NAs --------------------------------------------------------------
  if ('TRUE' %in% is.na(fuel_data_val$length_1h)) {
    stop('For fuel_data, there are missing values in the length_1h column.')
  }

  if ('TRUE' %in% is.na(fuel_data_val$length_10h)) {
    stop('For fuel_data, there are missing values in the length_10h column.')
  }

  if ('TRUE' %in% is.na(fuel_data_val$length_100h)) {
    stop('For fuel_data, there are missing values in the length_100h column.')
  }

  # Check for positive values --------------------------------------------------
  if(any(fuel_data_val$length_1h <= 0, na.rm = TRUE)) {
    stop('For fuel_data, length_1h must be greater than 0.\n',
         'You have input a variable of class: ', class(fuel_data_val$length_1h))
  }

  if(any(fuel_data_val$length_10h <= 0, na.rm = TRUE)) {
    stop('For fuel_data, length_10h must be must be greater than 0.\n',
         'You have input a variable of class: ', class(fuel_data_val$length_10h))
  }

  if(any(fuel_data_val$length_100h <= 0, na.rm = TRUE)) {
    stop('For fuel_data, length_100h must be greater than 0.\n',
         'You have input a variable of class: ', class(fuel_data_val$length_100h))
  }


  ###########################################################
  # Check that slope is as expected
  ###########################################################

  # Check for numeric ----------------------------------------------------------
  if(!is.numeric(fuel_data_val$slope)) {
    stop('For fuel_data, the parameter slope requires a numerical variable.\n',
         'You have input a variable of class: ', class(fuel_data_val$slope))
  }

  # Check for positive values --------------------------------------------------
  if(any(fuel_data_val$slope < 0, na.rm = TRUE)) {
    stop('For fuel_data, slope must be positive.')
  }

  # check for NAs --------------------------------------------------------------
  if ('TRUE' %in% is.na(fuel_data_val$slope)) {
    warning('For fuel_data, there are missing values in the slope column.\n',
            'For tansects with NA slopes, slope will be taken to be 0.\n',
            ' \n')
  }

  # map missing slopes to 0
  fuel_data_val[is.na(fuel_data_val$slope), "slope"] = 0


  ###########################################################
  # Check that counts are as expected
  ###########################################################

  # Check for numeric ----------------------------------------------------------
  if(!is.numeric(fuel_data_val$count_1h)) {
    stop('For fuel_data, the parameter count_1h requires a numerical variable.\n',
         'You have input a variable of class: ', class(fuel_data_val$count_1h))
  }

  if(!is.numeric(fuel_data_val$count_10h)) {
    stop('For fuel_data, the parameter count_10h requires a numerical variable.\n',
         'You have input a variable of class: ', class(fuel_data_val$count_10h))
  }

  if(!is.numeric(fuel_data_val$count_100h)) {
    stop('For fuel_data, the parameter count_100h requires a numerical variable.\n',
         'You have input a variable of class: ', class(fuel_data_val$count_100h))
  }

  # Check that counts are positive, whole numbers ------------------------------
  if('FALSE' %in% (fuel_data_val$count_1h == abs(round(fuel_data_val$count_1h)))) {
    stop('For fuel_data, count_1h must be a positive, whole number.')
  }

  if('FALSE' %in% (fuel_data_val$count_10h == abs(round(fuel_data_val$count_10h)))) {
    stop('For fuel_data, count_10h must be a positive, whole number.')
  }

  if('FALSE' %in% (fuel_data_val$count_100h == abs(round(fuel_data_val$count_100h)))) {
    stop('For fuel_data, count_100h must be a positive, whole number.')
  }

  # check for NAs --------------------------------------------------------------
  if ('TRUE' %in% is.na(fuel_data_val$count_1h)) {
    warning('For fuel_data, there are missing values in the count_1h column.\n',
            'For tansects with NA 1h counts, 1h fuel load estimates will be NA.\n',
            ' \n')
  }

  if ('TRUE' %in% is.na(fuel_data_val$count_10h)) {
    warning('For fuel_data, there are missing values in the count_10h column.\n',
            'For tansects with NA 10h counts, 10h fuel load estimates will be NA.\n',
            ' \n')
  }

  if ('TRUE' %in% is.na(fuel_data_val$count_100h)) {
    warning('For fuel_data, there are missing values in the count_100h column.\n',
            'For tansects with NA 100h counts, 100h fuel load estimates will be NA.\n',
            ' \n')
  }


  ###########################################################
  # Unit conversion (ft to meters)
  ###########################################################

  if(units_val == "imperial") {

    fuel_data_val$length_1h <- fuel_data_val$length_1h*0.3048
    fuel_data_val$length_10h <- fuel_data_val$length_10h*0.3048
    fuel_data_val$length_100h <- fuel_data_val$length_100h*0.3048

  }


  ###########################################################
  # Final dataframe prep
  ###########################################################

  fuel_data_val$time <- as.character(fuel_data_val$time)
  fuel_data_val$site <- as.character(fuel_data_val$site)
  fuel_data_val$plot <- as.character(fuel_data_val$plot)
  fuel_data_val$transect <- as.character(fuel_data_val$transect)

  fuel_data_return <- subset(fuel_data_val, select = c(time, site, plot, transect,
                                                       count_1h, count_10h, count_100h,
                                                       length_1h, length_10h, length_100h,
                                                       slope))

  return(fuel_data_return)

}


################################################################################
################################################################################
#
################################################################################
################################################################################

GroundCoef <- function(coef_tree_data, coef_units, coef_sp_codes) {

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
#
################################################################################
################################################################################

GroundLoad <- function(gr_fuel_data, gr_tree_data, gr_units, gr_sp_codes, gr_measurements) {

  # get BA-weighted duff and litter coefficients
  coef_calcs <- GroundCoef(coef_tree_data = gr_tree_data, coef_units = gr_units, coef_sp_codes = gr_sp_codes)

  # loop through each row (a transect in a time:site:plot)
  # and assign the BA-weighted coefficient value

  n <- nrow(gr_fuel_data)

  gr_fuel_data$coef_litter <- NA
  gr_fuel_data$coef_duff <- NA
  gr_fuel_data$coef_litterduff <- NA

  for(i in 1:n) {

    gr_fuel_data$coef_litter[i] <- coef_calcs[coef_calcs$time == gr_fuel_data$time[i] & coef_calcs$site == gr_fuel_data$site[i] & coef_calcs$plot == gr_fuel_data$plot[i], "coef_litter"]
    gr_fuel_data$coef_duff[i] <- coef_calcs[coef_calcs$time == gr_fuel_data$time[i] & coef_calcs$site == gr_fuel_data$site[i] & coef_calcs$plot == gr_fuel_data$plot[i], "coef_duff"]
    gr_fuel_data$coef_litterduff[i] <- coef_calcs[coef_calcs$time == gr_fuel_data$time[i] & coef_calcs$site == gr_fuel_data$site[i] & coef_calcs$plot == gr_fuel_data$plot[i], "coef_litterduff"]

  }

  # fuel load calculations
  if(gr_measurements == "separate") {

    gr_fuel_data$litter_Mg_ha <- gr_fuel_data$coef_litter*gr_fuel_data$litter_depth*10
    gr_fuel_data$duff_Mg_ha <- gr_fuel_data$coef_duff*gr_fuel_data$duff_depth*10
    gr_subset <- subset(gr_fuel_data, select = c(time, site, plot, litter_Mg_ha, duff_Mg_ha))

  } else {

    gr_fuel_data$lit_duff_Mg_ha <- gr_fuel_data$coef_litterduff*gr_fuel_data$lit_duff_depth*10
    gr_subset <- subset(gr_fuel_data, select = c(time, site, plot, lit_duff_Mg_ha))

  }

  gr_ag <- aggregate(data = gr_subset,
                     . ~ time + site + plot,
                     FUN = mean, na.rm = TRUE, na.action = na.pass)

  gr_ag[gr_ag == "NaN"] <- NA

  if(gr_units == "metric") {

    return(gr_ag)

  } else if (gr_units == "imperial" & gr_measurements == "separate") {

    gr_ag$litter_ton_ac <- gr_ag$litter_Mg_ha*0.44609
    gr_ag$duff_ton_ac <- gr_ag$duff_Mg_ha*0.44609
    gr_imperial <- subset(gr_ag, select = c(time, site, plot, litter_ton_ac, duff_ton_ac))
    return(gr_imperial)

  } else if (gr_units == "imperial" & gr_measurements == "combined") {

    gr_ag$lit_duff_ton_ac <- gr_ag$lit_duff_Mg_ha*0.44609
    gr_imperial <- subset(gr_ag, select = c(time, site, plot, lit_duff_ton_ac))
    return(gr_imperial)

  }

}
