
fuel_data_val <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "120", "90", "120", "90", "120", "20", "120"),
  count_1h = c(12, 30, 10, 2, 5, 14, 9, 6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(15,15,15,15,15,15,15,15),
  slope = c(10,20,15,5,10,20,15,5)
)


tree_test <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(3,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(0,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("UNTR", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(NA, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)


################################################################################
################################################################################
#
################################################################################
################################################################################

ValidateFWD <- function(fuel_data_val, units_val) {

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

FWD_coef <- function(fwd_tree_data, fwd_units, fwd_sp_codes) {

  # calculate proportion of time:site:plot basal area occupied by each species
  tree_dom <- TreeDom(data = fwd_tree_data,
                      tree_units = fwd_units)

  # create columns to fill
  tree_dom$qmd_1h <- NA
  tree_dom$qmd_10h <- NA
  tree_dom$qmd_100h <- NA

  tree_dom$sec_1h <- NA
  tree_dom$sec_10h <- NA
  tree_dom$sec_100h <- NA

  tree_dom$sg_1h <- NA
  tree_dom$sg_10h <- NA
  tree_dom$sg_100h <- NA

  n <- nrow(tree_dom)

  # loop through each row
  for(i in 1:n) {

    sp <- tree_dom$species[i]

    if(fwd_sp_codes == "4letter") {

      tree_dom$qmd_1h[i] <- QMD_table[QMD_table$letter == sp, "qmd_1h"]
      tree_dom$qmd_10h[i] <- QMD_table[QMD_table$letter == sp, "qmd_10h"]
      tree_dom$qmd_100h[i] <- QMD_table[QMD_table$letter == sp, "qmd_100h"]

      tree_dom$sec_1h[i] <- SEC_table[SEC_table$letter == sp, "sec_1h"]
      tree_dom$sec_10h[i] <- SEC_table[SEC_table$letter == sp, "sec_10h"]
      tree_dom$sec_100h[i] <- SEC_table[SEC_table$letter == sp, "sec_100h"]

      tree_dom$sg_1h[i] <- SG_table[SG_table$letter == sp, "sg_1h"]
      tree_dom$sg_10h[i] <- SG_table[SG_table$letter == sp, "sg_10h"]
      tree_dom$sg_100h[i] <- SG_table[SG_table$letter == sp, "sg_100h"]

    } else {

      tree_dom$qmd_1h[i] <- QMD_table[QMD_table$fia == sp, "qmd_1h"]
      tree_dom$qmd_10h[i] <- QMD_table[QMD_table$fia == sp, "qmd_10h"]
      tree_dom$qmd_100h[i] <- QMD_table[QMD_table$fia == sp, "qmd_100h"]

      tree_dom$sec_1h[i] <- SEC_table[SEC_table$fia == sp, "sec_1h"]
      tree_dom$sec_10h[i] <- SEC_table[SEC_table$fia == sp, "sec_10h"]
      tree_dom$sec_100h[i] <- SEC_table[SEC_table$fia == sp, "sec_100h"]

      tree_dom$sg_1h[i] <- SG_table[SG_table$fia == sp, "sg_1h"]
      tree_dom$sg_10h[i] <- SG_table[SG_table$fia == sp, "sg_10h"]
      tree_dom$sg_100h[i] <- SG_table[SG_table$fia == sp, "sg_100h"]

    }

  }

  tree_dom$qmd_1h_wt <- tree_dom$qmd_1h*tree_dom$perc_BA
  tree_dom$qmd_10h_wt <- tree_dom$qmd_10h*tree_dom$perc_BA
  tree_dom$qmd_100h_wt <- tree_dom$qmd_100h*tree_dom$perc_BA

  tree_dom$sec_1h_wt <- tree_dom$sec_1h*tree_dom$perc_BA
  tree_dom$sec_10h_wt <- tree_dom$sec_10h*tree_dom$perc_BA
  tree_dom$sec_100h_wt <- tree_dom$sec_100h*tree_dom$perc_BA

  tree_dom$sg_1h_wt <- tree_dom$sg_1h*tree_dom$perc_BA
  tree_dom$sg_10h_wt <- tree_dom$sg_10h*tree_dom$perc_BA
  tree_dom$sg_100h_wt <- tree_dom$sg_100h*tree_dom$perc_BA

  tree_subset <- subset(tree_dom, select = c(time, site, plot,
                                             qmd_1h_wt, qmd_10h_wt, qmd_100h_wt,
                                             sec_1h_wt, sec_10h_wt, sec_100h_wt,
                                             sg_1h_wt, sg_10h_wt, sg_100h_wt))

  tree_ag <- aggregate(data = tree_subset,
                       . ~ time + site + plot,
                       FUN = sum)

  tree_ag$coef_1h <- tree_ag$qmd_1h_wt*tree_ag$sec_1h_wt*tree_ag$sg_1h_wt
  tree_ag$coef_10h <- tree_ag$qmd_10h_wt*tree_ag$sec_10h_wt*tree_ag$sg_10h_wt
  tree_ag$coef_100h <- tree_ag$qmd_100h_wt*tree_ag$sec_100h_wt*tree_ag$sg_100h_wt

  tree_return <- subset(tree_ag, select = c(time, site, plot, coef_1h, coef_10h, coef_100h))

  return(tree_return)

}


################################################################################
################################################################################
#
################################################################################
################################################################################

FWD_loads <- function(fwd_fuel_data, fwd_tree_data, fwd_units, fwd_sp_codes) {

  # get BA-weighted QMD, SEC, and SG
  coef_calcs <- FWD_coef(fwd_tree_data = fwd_tree_data, fwd_units = fwd_units, fwd_sp_codes = fwd_sp_codes)

  # loop through each row (a transect in a time:site:plot)
  # and assign the BA-weighted QMD*SEC*SG value

  n <- nrow(fwd_fuel_data)

  fwd_fuel_data$coef_1h <- NA
  fwd_fuel_data$coef_10h <- NA
  fwd_fuel_data$coef_100h <- NA

  for(i in 1:n) {

    fwd_fuel_data$coef_1h[i] <- coef_calcs[coef_calcs$time == fwd_fuel_data$time[i] & coef_calcs$site == fwd_fuel_data$site[i] & coef_calcs$plot == fwd_fuel_data$plot[i], "coef_1h"]
    fwd_fuel_data$coef_10h[i] <- coef_calcs[coef_calcs$time == fwd_fuel_data$time[i] & coef_calcs$site == fwd_fuel_data$site[i] & coef_calcs$plot == fwd_fuel_data$plot[i], "coef_10h"]
    fwd_fuel_data$coef_100h[i] <- coef_calcs[coef_calcs$time == fwd_fuel_data$time[i] & coef_calcs$site == fwd_fuel_data$site[i] & coef_calcs$plot == fwd_fuel_data$plot[i], "coef_100h"]

  }

  # slope correction factor
  fwd_fuel_data$slp_c <- sqrt(1 + ((fwd_fuel_data$slope/100)^2))

  # constant k
  k <- 1.234

  # fuel load calculations
  fwd_fuel_data$load_1h_Mg_ha <- (fwd_fuel_data$coef_1h*fwd_fuel_data$slp_c*fwd_fuel_data$count_1h*k)/fwd_fuel_data$length_1h
  fwd_fuel_data$load_10h_Mg_ha <- (fwd_fuel_data$coef_10h*fwd_fuel_data$slp_c*fwd_fuel_data$count_10h*k)/fwd_fuel_data$length_10h
  fwd_fuel_data$load_100h_Mg_ha <- (fwd_fuel_data$coef_100h*fwd_fuel_data$slp_c*fwd_fuel_data$count_100h*k)/fwd_fuel_data$length_100h

  fwd_subset <- subset(fwd_fuel_data, select = c(time, site, plot, load_1h_Mg_ha, load_10h_Mg_ha, load_100h_Mg_ha))

  fwd_ag <- aggregate(data = fwd_subset,
                       . ~ time + site + plot,
                       FUN = mean, na.rm = TRUE, na.action = na.pass)

  fwd_ag$load_fwd_Mg_ha <- fwd_ag$load_1h_Mg_ha + fwd_ag$load_10h_Mg_ha + fwd_ag$load_100h_Mg_ha
  fwd_ag[fwd_ag == "NaN"] <- NA

  if(fwd_units == "metric") {

    return(fwd_ag)

  } else {

    fwd_ag$load_1h_ton_ac <- fwd_ag$load_1h_Mg_ha*0.44609
    fwd_ag$load_10h_ton_ac <- fwd_ag$load_10h_Mg_ha*0.44609
    fwd_ag$load_100h_ton_ac <- fwd_ag$load_100h_Mg_ha*0.44609
    fwd_ag$load_fwd_ton_ac <- fwd_ag$load_fwd_Mg_ha*0.44609

    fwd_imperial <- subset(fwd_ag, select = c(time, site, plot, load_1h_ton_ac, load_10h_ton_ac, load_100h_ton_ac, load_fwd_ton_ac))

    return(fwd_imperial)

  }

}

#FWD_loads(fuel_test, tree_test, "metric", "4letter")

