
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

#' @title CoarseFuels
#'
#' @description
#' Estimates coarse woody (1000-hour) fuel loads from line-intercept transects. See \href{https://github.com/kearutherford/UCBForestAnalytics/blob/main/README.md}{README} for details.
#'
#' @param tree_data A dataframe or tibble with the following columns: time, site, plot, exp_factor, species, and dbh. Each row must be an observation of an individual tree.
#' @param fuel_data A dataframe or tibble. If the summed parameter is set to "no" the following columns are required: time, site, plot, transect, length_1000h, diameter, and status. If the summed parameter is set to "yes" the following columns are required: time, site, plot, transect, length_1000h, ssd_R, and ssd_S.
#' @param sp_codes Specifies whether the species column in tree_data follows the four-letter code or FIA naming convention.
#' @param units Specifies whether the input data are in metric (centimeters and meters) or imperial (inches and feet) units. Inputs must be all metric or all imperial (do not mix-and-match units). Must be set to either "metric" or "imperial". The default is set to "metric".
#' @param summed Specifies whether the sum-of-squared-diameters for sound and rotten 1000-hour fuels has already been calculated by the user. Must be set to either "yes" or "no". The default is set to "no".
#'
#' @return A dataframe with the following columns:
#' \itemize{
#' \item time
#' \item site
#' \item plot
#' \item load_1000s_Mg_ha (or load_1000s_ton_ac): fuel load of sound 1000-hour fuels in megagrams per hectare (or US tons per acre)
#' \item load_1000r_Mg_ha (or load_1000r_ton_ac): fuel load of rotten 1000-hour fuels in megagrams per hectare (or US tons per acre)
#' \item load_cwd_Mg_ha (or load_cwd_ton_ac): total coarse woody debris fuel load (1000-hour sound + 1000-hour rotten) in megagrams per hectare (or US tons per acre)
#' }
#'
#' @export

CoarseFuels <- function(tree_data, fuel_data, sp_codes = "4letter", units = "metric", summed = "no") {

  # check and prep input fuel data
  step1 <- ValidateCWD(fuel_data_val = fuel_data,
                       units_val = units,
                       sum_val = summed)

  # check and prep input tree data
  step2 <- ValidateOverstory(tree_data_val = tree_data,
                             sp_codes_val = sp_codes)

  # check for time:site:plot matches for tree and fuel data
  step3 <- ValidateMatches(fuel_match = step1,
                           tree_match = step2)

  # calculate fine fuel loads at the plot level
  step4 <- CWDLoad(cwd_fuel_data = step1,
                   cwd_tree_data = step2,
                   cwd_units = units,
                   cwd_sp_codes = sp_codes)

  return(step4)

}


################################################################################
################################################################################
# ValidateCWD function
################################################################################
################################################################################

ValidateCWD <- function(fuel_data_val, units_val, sum_val) {

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

  if(sum_val == "no" || sum_val == "yes") {
    # do nothing
  } else {
    stop('The "summed" parameter must be set to either "no" or "yes".')
  }


  ###########################################################
  # Check that all columns are in the provided dataframe
  ###########################################################

  if(sum_val == "no") {

    necessary_columns = c("time", "site", "plot", "transect", "length_1000h",
                          "diameter", "status")

    if(!all(is.element(necessary_columns, names(fuel_data_val)))) {

      stop('fuel_data is missing necessary columns!\n',
           'When the "summed" parameter is set to "no" fuel_data must include:\n',
           'time, site, plot, transect, length_1000h, diameter, and status.')

    }

  } else {

    necessary_columns = c("time", "site", "plot", "transect", "length_1000h",
                          "ssd_S", "ssd_R")

    if(!all(is.element(necessary_columns, names(fuel_data_val)))) {

      stop('fuel_data is missing necessary columns!\n',
           'When the "summed" parameter is set to "yes" fuel_data must include:\n',
           'time, site, plot, transect, length_1000h, ssd_S, and ssd_R.')

    }

  }

  # Check for slope ------------------------------------------------------------
  if(!is.element("slope", names(fuel_data_val))) {

    warning('slope was not provided. The slope correction factor will be set to 1, indicating no slope.\n',
            ' \n')

    fuel_data_val$slope <- 0

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

  # coerce to character
  fuel_data_val$time <- as.character(fuel_data_val$time)
  fuel_data_val$site <- as.character(fuel_data_val$site)
  fuel_data_val$plot <- as.character(fuel_data_val$plot)
  fuel_data_val$transect <- as.character(fuel_data_val$transect)


  ###########################################################
  # Check that transect length is as expected
  ###########################################################

  # Check for numeric ----------------------------------------------------------
  if(!is.numeric(fuel_data_val$length_1000h)) {
    stop('For fuel_data, the parameter length_1000h requires a numerical variable.\n',
         'You have input a variable of class: ', class(fuel_data_val$length_1000h))
  }

  # check for NAs --------------------------------------------------------------
  if ('TRUE' %in% is.na(fuel_data_val$length_1000h)) {
    stop('For fuel_data, there are missing values in the length_1000h column.')
  }

  # Check for positive values --------------------------------------------------
  if(any(fuel_data_val$length_1000h <= 0, na.rm = TRUE)) {
    stop('For fuel_data, length_1000h must be greater than 0.')
  }

  # Unit conversion (ft to meters) ---------------------------------------------
  if(units_val == "imperial") {
    fuel_data_val$length_1000h <- fuel_data_val$length_1000h*0.3048
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
  # If summed = "no"
  ###########################################################

  if(sum_val == "no") {

    # --------------------------------------------------------------------------
    # check that diameter is as expected
    # --------------------------------------------------------------------------

    # check for numeric
    if(!is.numeric(fuel_data_val$diameter)) {
      stop('For fuel_data, the parameter diameter requires a numerical variable.\n',
           'You have input a variable of class: ', class(fuel_data_val$diameter))
    }

    # unit conversion (in to cm)
    if(units_val == "imperial") {
      fuel_data_val$diameter <- fuel_data_val$diameter*2.54
    }

    # pull out transects with cwd
    obs_w_cwd <- subset(fuel_data_val, fuel_data_val$diameter > 0)

    # check for diameter range
    if(any(obs_w_cwd$diameter <= 7.62, na.rm = TRUE)) {
      stop('1000-hr fuels are defined as having a diameter > 7.62 cm, or > 3 in.\n',
           'There are diameters below this threshold in the provided fuel_data.\n',
           'Note: diameters of exactly 0 are allowed, indicating a transect without coarse woody debris.\n',
           'This warning is for diameters > 0 and <= 7.62.')
    }

    # check for NAs
    if ('TRUE' %in% is.na(fuel_data_val$diameter)) {
      warning('For fuel_data, there are missing values in the diameter column.\n',
              'Consider investigating these missing diameters.\n',
              ' \n')
    }


    # --------------------------------------------------------------------------
    # check that status is as expected
    # --------------------------------------------------------------------------
    fuel_data_val$status <- as.character(fuel_data_val$status)

    # Check for unrecognized status codes
    if(!all(is.element(fuel_data_val$status,
                       c("R","S", NA)))) {

      unrecognized_status <- sort(paste0(unique(fuel_data_val[!is.element(fuel_data_val$status,
                                                                     c("R", "S", NA)), "status"]),
                                         sep = " "))

      stop('Status must be R or S!\n',
           'Unrecognized status codes: ', unrecognized_status)
    }

    # check for NA
    if ('TRUE' %in% is.na(obs_w_cwd$status)) {

      warning('There are coarse woody debris pieces with missing status codes in the provided fuel_data.\n',
              'Pieces with NA status codes will be assumed to be rotten.\n',
              'Consider investigating these missing values in your data.\n',
              ' \n')
    }

    # map missing status to R (rotten)
    fuel_data_val[is.na(fuel_data_val$status), "status"] = "R"


    # --------------------------------------------------------------------------
    # calculate sum-of-squared-diameters
    # --------------------------------------------------------------------------

    # Square diameters (cm^2)
    fuel_data_val$sq_diam <- fuel_data_val$diameter^2

    # create id column to reduce looping
    fuel_data_val$obs_id <- NA
    n <- nrow(fuel_data_val)

    for(i in 1:n) {

      tm <- fuel_data_val$time[i]
      s <- fuel_data_val$site[i]
      p <- fuel_data_val$plot[i]
      tr <- fuel_data_val$transect[i]

      fuel_data_val$obs_id[i] <- paste0(tm,'-',s,'-',p,'-',tr)

    }

    # create empty dataframe to fill
    return_df <- data.frame(matrix(nrow = 0, ncol = 8))
    colnames(return_df) <- c("time", "site", "plot", "transect", "length_1000h", "slope", "ssd_S", "ssd_R")

    # loop through each unique id
    unq_id <- unique(fuel_data_val$obs_id)

    for(id in unq_id) {

      all_cwd <- subset(fuel_data_val, obs_id == id)

      # check that all transect lengths are the same within a
      # unique time:site:plot:transect combination
      lng <- unique(all_cwd$length_1000h)

      if(length(lng) > 1) {
        stop('Each time:site:plot:transect combination should have the same "length_1000h" value.\n',
             'The following time:site:plot:transect combination has multiple "length_1000h" values recorded: ', id)
      }

      # check that all slopes are the same within a
      # unique time:site:plot:transect combination
      slp <- unique(all_cwd$slope)

      if(length(slp) > 1) {
        stop('Each time:site:plot:transect combination should have the same "slope" value.\n',
             'The following time:site:plot:transect combination has multiple "slope" values recorded: ', id)
      }

      # Check for proper use of 0 diameter
      if('TRUE' %in% is.element(all_cwd$diameter, 0)) {

        n <- nrow(all_cwd)

        if(n > 1) {

          stop('For fuel_data, there are transects with a recorded diameter of 0, but with more than one row.\n',
               'Transects with no coarse woody debris should be represented by a single row with time, site, plot, transect,\n',
               'length_1000h, and slope filled in as appropriate and a diameter of 0. Status can be "R", "S", or NA.')

        }

      }

      # get sum-of-squared-diameters for rotten and sound fuels
      sound <- subset(all_cwd, status == "S")
      rotten <- subset(all_cwd, status == "R")

      if(nrow(sound) > 0 & all(is.na(sound$diameter))) {
        ssd_sound <- NA
      } else if (nrow(sound) == 0) {
        ssd_sound <- 0
      } else {
        ssd_sound <- sum(sound$sq_diam, na.rm = TRUE)
      }

      if(nrow(rotten) > 0 & all(is.na(rotten$diameter))) {
        ssd_rotten <- NA
      } else if (nrow(rotten) == 0) {
        ssd_rotten <- 0
      } else {
        ssd_rotten <- sum(rotten$sq_diam, na.rm = TRUE)
      }


      # fill in dataframe
      return_df[nrow(return_df) + 1, ] <- NA
      k <- nrow(return_df)

      return_df$time[k] <- all_cwd$time[1]
      return_df$site[k] <- all_cwd$site[1]
      return_df$plot[k] <- all_cwd$plot[1]
      return_df$transect[k] <- all_cwd$transect[1]
      return_df$length_1000h[k] <- all_cwd$length_1000h[1]
      return_df$slope[k] <- all_cwd$slope[1]
      return_df$ssd_S[k] <- ssd_sound
      return_df$ssd_R[k] <- ssd_rotten

    }

  }


  ###########################################################
  # If summed = "yes"
  ###########################################################

  if(sum_val == "yes") {

    # --------------------------------------------------------------------------
    # check for only one time:site:plot:transect obs.
    # --------------------------------------------------------------------------

    fuel_data_val$count <- 1
    fuel_sub <- subset(fuel_data_val, select = c(time, site, plot, transect, count))

    fuel_ag <- aggregate(data = fuel_sub,
                         . ~ time + site + plot + transect,
                         FUN = sum)

    if(any(fuel_ag$count > 1)) {

      count_sub <- subset(fuel_ag, fuel_ag$count > 1)
      count_sub$obs_id <- NA

      n <- nrow(count_sub)

      for(i in 1:n) {

        tm <- count_sub$time[i]
        s <- count_sub$site[i]
        p <- count_sub$plot[i]
        tr <- count_sub$transect[i]

        count_sub$obs_id[i] <- paste0(tm,'-',s,'-',p,'-',tr)

      }

      all_id <- paste0(unique(count_sub$obs_id), sep = "   ")

      stop('For fuel_data, there are repeat time:site:plot:transect observations.\n',
           'There should only be one observation/row for an individual transect at a specific time:site:plot.\n',
           'Investigate the following time:site:plot:transect combinations: ', all_id)

    }

    # --------------------------------------------------------------------------
    # check that ssd_S is as expected
    # --------------------------------------------------------------------------
    # Check for numeric
    if(!is.numeric(fuel_data_val$ssd_S)) {
      stop('For fuel_data, the parameter ssd_S requires a numerical variable.\n',
           'You have input a variable of class: ', class(fuel_data_val$ssd_S))
    }

    # Check for positive values
    if(any(fuel_data_val$ssd_S < 0, na.rm = TRUE)) {
      stop('For fuel_data, ssd_S must be greater than or equal to 0.')
    }

    # check for NAs
    if ('TRUE' %in% is.na(fuel_data_val$ssd_S)) {
      warning('For fuel_data, there are missing values in the ssd_S column.\n',
              'Consider investigating these missing values in your data.\n',
              ' \n')
    }

    # Unit conversion (in^2 to cm^2)
    if(units_val == "imperial") {
      fuel_data_val$ssd_S <- fuel_data_val$ssd_S*6.4516
    }

    # --------------------------------------------------------------------------
    # check that ssd_R is as expected
    # --------------------------------------------------------------------------
    # Check for numeric
    if(!is.numeric(fuel_data_val$ssd_R)) {
      stop('For fuel_data, the parameter ssd_R requires a numerical variable.\n',
           'You have input a variable of class: ', class(fuel_data_val$ssd_R))
    }

    # Check for positive values
    if(any(fuel_data_val$ssd_R < 0, na.rm = TRUE)) {
      stop('For fuel_data, ssd_R must be greater than or equal to 0.')
    }

    # check for NAs
    if ('TRUE' %in% is.na(fuel_data_val$ssd_R)) {
      warning('For fuel_data, there are missing values in the ssd_R column.\n',
              'Consider investigating these missing values in your data.\n',
              ' \n')
    }

    # Unit conversion (in^2 to cm^2)
    if(units_val == "imperial") {
      fuel_data_val$ssd_R <- fuel_data_val$ssd_R*6.4516
    }

    # --------------------------------------------------------------------------
    # subset dataframe
    # --------------------------------------------------------------------------
    return_df <- subset(fuel_data_val, select = c(time, site, plot, transect,
                                                  length_1000h, slope, ssd_S, ssd_R))

  }

  return(return_df)

}


################################################################################
################################################################################
# CWDCoef function
################################################################################
################################################################################

CWDCoef <- function(coef_tree_data, coef_units, coef_sp_codes) {

  # calculate proportion of time:site:plot basal area occupied by each species
  tree_dom <- TreeDom(data = coef_tree_data,
                      tree_units = coef_units)

  # create columns to fill
  tree_dom$sec_1000h <- NA
  tree_dom$sg_1000s <- NA

  n <- nrow(tree_dom)

  # loop through each row
  for(i in 1:n) {

    sp <- tree_dom$species[i]

    if(coef_sp_codes == "4letter") {

      tree_dom$sec_1000h[i] <- SEC_table[SEC_table$letter == sp, "sec_1000h"]
      tree_dom$sg_1000s[i] <- SG_table[SG_table$letter == sp, "sg_1000s"]

    } else {

      tree_dom$sec_1000h[i] <- SEC_table[SEC_table$fia == sp, "sec_1000h"]
      tree_dom$sg_1000s[i] <- SG_table[SG_table$fia == sp, "sg_1000s"]

    }

  }

  tree_dom$sec_1000h_wt <- tree_dom$sec_1000h*tree_dom$perc_BA
  tree_dom$sg_1000s_wt <- tree_dom$sg_1000s*tree_dom$perc_BA

  tree_subset <- subset(tree_dom, select = c(time, site, plot, sec_1000h_wt, sg_1000s_wt))

  tree_ag <- aggregate(data = tree_subset,
                       . ~ time + site + plot,
                       FUN = sum)

  tree_ag$coef_1000s <- tree_ag$sec_1000h_wt*tree_ag$sg_1000s_wt
  tree_ag$coef_1000r <- tree_ag$sec_1000h_wt*0.36

  tree_return <- subset(tree_ag, select = c(time, site, plot, coef_1000s, coef_1000r))

  return(tree_return)

}


################################################################################
################################################################################
# CWDLoad function
################################################################################
################################################################################

CWDLoad <- function(cwd_fuel_data, cwd_tree_data, cwd_units, cwd_sp_codes) {

  # get BA-weighted SEC and SG
  coef_calcs <- CWDCoef(coef_tree_data = cwd_tree_data, coef_units = cwd_units, coef_sp_codes = cwd_sp_codes)

  # loop through each row (a transect in a time:site:plot)
  # and assign the BA-weighted SEC*SG value

  n <- nrow(cwd_fuel_data)

  cwd_fuel_data$coef_1000s <- NA
  cwd_fuel_data$coef_1000r <- NA

  for(i in 1:n) {

    cwd_fuel_data$coef_1000s[i] <- coef_calcs[coef_calcs$time == cwd_fuel_data$time[i] & coef_calcs$site == cwd_fuel_data$site[i] & coef_calcs$plot == cwd_fuel_data$plot[i], "coef_1000s"]
    cwd_fuel_data$coef_1000r[i] <- coef_calcs[coef_calcs$time == cwd_fuel_data$time[i] & coef_calcs$site == cwd_fuel_data$site[i] & coef_calcs$plot == cwd_fuel_data$plot[i], "coef_1000r"]

  }

  # slope correction factor
  cwd_fuel_data$slp_c <- sqrt(1 + ((cwd_fuel_data$slope/100)^2))

      # calculate horizontal length of transects
      # cos(degrees) = adjacent/hypotenuse --> adjacent = cos(deg)*hypotenuse
      # here hypotenuse = transect length and adjacent = slope corrected transect length
      cwd_fuel_data$slope_deg <- atan(cwd_fuel_data$slope/100) # convert % to degrees
      cwd_fuel_data$slope_cos <- cos(cwd_fuel_data$slope_deg) # take the cosine
      cwd_fuel_data$sc_length_1000h <- cwd_fuel_data$slope_cos*cwd_fuel_data$length_1000h # 1000h transect length corrected

  # constant k
  k <- 1.234

  # fuel load calculations
  cwd_fuel_data$load_1000s_Mg_ha <- (cwd_fuel_data$coef_1000s*cwd_fuel_data$slp_c*cwd_fuel_data$ssd_S*k)/cwd_fuel_data$length_1000h
  cwd_fuel_data$load_1000r_Mg_ha <- (cwd_fuel_data$coef_1000r*cwd_fuel_data$slp_c*cwd_fuel_data$ssd_R*k)/cwd_fuel_data$length_1000h

  cwd_subset <- subset(cwd_fuel_data, select = c(time, site, plot, load_1000s_Mg_ha, load_1000r_Mg_ha))

  cwd_ag <- aggregate(data = cwd_subset,
                      . ~ time + site + plot,
                      FUN = mean, na.rm = TRUE, na.action = na.pass)

  cwd_ag$load_cwd_Mg_ha <- cwd_ag$load_1000s_Mg_ha + cwd_ag$load_1000r_Mg_ha
  cwd_ag[cwd_ag == "NaN"] <- NA

  # horizontal transect length calculations
  trn_subset <- subset(cwd_fuel_data, select = c(time, site, plot, sc_length_1000h))

  trn_ag <- aggregate(data = trn_subset,
                      . ~ time + site + plot,
                      FUN = sum) # NA tran lengths are not allowed, NA handling here is not super important

  # loop through each row (a plot in a time:site)
  # and assign the horizontal transect length

  k <- nrow(cwd_ag)

  cwd_ag$sc_length_1000h <- NA

  for(i in 1:k) {

    cwd_ag$sc_length_1000h[i] <- trn_ag[trn_ag$time == cwd_ag$time[i] & trn_ag$site == cwd_ag$site[i] & trn_ag$plot == cwd_ag$plot[i], "sc_length_1000h"]

  }


  if(cwd_units == "metric") {

    return(cwd_ag)

  } else {

    cwd_ag$load_1000s_ton_ac <- cwd_ag$load_1000s_Mg_ha*0.44609
    cwd_ag$load_1000r_ton_ac <- cwd_ag$load_1000r_Mg_ha*0.44609
    cwd_ag$load_cwd_ton_ac <- cwd_ag$load_cwd_Mg_ha*0.44609
    cwd_ag$sc_length_1000h <- cwd_ag$sc_length_1000h*3.28084

    cwd_imperial <- subset(cwd_ag, select = c(time, site, plot, load_1000s_ton_ac, load_1000r_ton_ac, load_cwd_ton_ac, sc_length_1000h))

    return(cwd_imperial)

  }

}

globalVariables(c("time", "sec_1000h_wt", "sg_1000s_wt", "aggregate", "coef_1000s", "coef_1000r", "load_1000s_Mg_ha",
                  "load_1000r_Mg_ha", "na.pass", "load_1000s_ton_ac", "load_1000r_ton_ac", "load_cwd_ton_ac", "obs_id",
                  "transect", "length_1000h", "slope", "ssd_S", "ssd_R"))

