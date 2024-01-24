
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

#' @title CompilePlots
#'
#' @description
#' Compiles data beyond the plot level. Recognizes simple random sampling and stratified random sampling designs. Also recognizes the design of the Fire and Fire Surrogate. See \href{https://github.com/kearutherford/BerkeleyForestsAnalytics/tree/main}{README} for details.
#'
#' @param data A dataframe or tibble. Data must already be summarized to the plot-level. Required columns depend on the sampling design:
#' \itemize{
#' \item Simple random sampling: must have time, site, and plot columns. A species column is optional. Other columns can be any numerical variables of interest (any column names, any number of variables).
#' \item Stratified random sampling: must have time, site, stratum, and plot columns. A species column is optional. Other columns can be any numerical variables of interest (any column names, any number of variables).
#' \item Fire and Fire Surrogate: must have time, trt_type, site, and plot columns. A species column is optional. Other columns can be any numerical variables of interest (any column names, any number of variables).
#' }
#' @param design Specifies the sampling design. Must be set to "SRS" (simple random sample), "STRS" (stratified random sample), or "FFS" (Fire and Fire Surrogate). There is no default.
#' @param wt_data Only required for stratified random sampling designs. A dataframe or tibble with the following columns: time (optional), site, stratum, and wh (stratum weight). The default is set to "not_needed", and should be left as such for design = "SRS" or design = "FFS".
#'
#' @return Depends on the sampling design:
#' \itemize{
#' \item Simple random sampling: a dataframe with site-level summaries.
#' \item Stratified random sampling: a list with two components: (1) a dataframe with stratum-level summaries and (2) a dataframe with site-level summaries.
#' \item Fire and Fire Surrogate: a list with two components: (1) a dataframe with site-level (i.e., compartment-level) summaries and (2) a dataframe with treatment-level summaries.
#' }
#'
#' @examples
#' CompilePlots(data = compilation_srs_demo,
#'              design = "SRS",
#'              wt_data = "not_needed")
#'
#' CompilePlots(data = compilation_strs_demo,
#'              design = "STRS",
#'              wt_data = compilation_wt_demo)
#'
#' @export

CompilePlots <- function(data, design, wt_data = "not_needed", fpc_data = "not_needed") {

  # coerce tibble inputs into data.frame
  data <- as.data.frame(data)

  if(all(wt_data != "not_needed")) {
    wt_data <- as.data.frame(wt_data)
  }

  if(all(fpc_data != "not_needed")) {
    fpc_data <- as.data.frame(fpc_data)
  }

  # check and prep input data
  step1 <- ValidatePlotData(data_check = data,
                            design_check = design,
                            wt_data_check = wt_data,
                            fpc_data_check = fpc_data)

  # get finite population correction factor data prepped
  if(all(fpc_data != "not_needed")) {
    step2 <- FPC(fpc_data, design)
  } else {
    step2 <- fpc_data
  }

  # summarize data
  if(design == "SRS") {

    step3 <- SRS_calcs(data = step1, fpc = step2)

  } else if (design == "STRS") {

    step3 <- STRS_calcs(data = step1, wh_data = wt_data, fpc = step2)

  } else if (design == "FFS") {

    step3 <- FFS_calcs(data = step1, fpc = step2)

  }

  return(step3)

}


################################################################################
################################################################################
# Data validation functions
################################################################################
################################################################################

################################################################
# overarching data validation function
################################################################

ValidatePlotData <- function(data_check, design_check, wt_data_check, fpc_data_check) {

  # check that options are set appropriately
  ValidateOptions(design_val = design_check, wt_data_val = wt_data_check)

  # check that all necessary ID columns are present
  ValidateIDColumns(data_val = data_check, design_val = design_check)

  # check that all non-ID columns are numeric
  ValidateNumeric(data_val = data_check, design_val = design_check)

  # check that each observation is a unique plot
  ValidateObs(data_val = data_check, design_val = design_check, data_name = "data")

  # check that each species is present in each plot
  if("species" %in% colnames(data_check)) {
    ValidateSpecies(data_val = data_check, design_val = design_check)
  }

  # check weights dataframe
  if(design_check == "STRS") {
    ValidateWeights(data_val = data_check, wt_data_val = wt_data_check, data_name = "data")
  }
  # check fpc dataframe
  if(all(fpc_data_check != "not_needed")) {
    ValidateFPC(data_val = data_check, fpc_data_val = fpc_data_check, design_val = design_check, data_name = "data")
  }

  # coerce ID columns to be character
  return_df <- ValidateColClass(data_val = data_check, design_val = design_check)

  return(return_df)

}

################################################################
# function to check that options are set appropriately
################################################################

ValidateOptions <- function(design_val, wt_data_val) {

  if(design_val == "SRS" || design_val == "STRS" || design_val == "FFS") {
    # do nothing
  } else {
    stop('The "design" parameter must be set to "SRS", "STRS", or "FFS".')
  }

  if(design_val == "STRS" && all(wt_data_val == "not_needed")) {
    stop('For a stratified random sampling - STRS - design, you must supply wt_data.\n',
         'You left wt_data as the default "not_needed".')
  }

  if(design_val == "SRS" && all(wt_data_val != "not_needed")) {
    stop('For a simple random sampling - SRS - design, you do not need to supply wt_data.\n',
         'For SRS, you should leave wt_data as the default "not_needed".')
  }

  if(design_val == "FFS" && all(wt_data_val != "not_needed")) {
    stop('For a Fire and Fire Surrogate - FFS - design, you do not need to supply wt_data.\n',
         'For FFS, you should leave wt_data as the default "not_needed".')
  }

}

###################################################################
# function to check that all columns are in the provided dataframe
###################################################################

ValidateIDColumns <- function(data_val, design_val) {

  # check that necessary columns exist
  if(!("time" %in% colnames(data_val))) {
    stop('The data input is missing the required "time" column.')
  }

  if(!("site" %in% colnames(data_val))) {
    stop('The data input is missing the required "site" column.')
  }

  if(!("plot" %in% colnames(data_val))) {
    stop('The data input is missing the required "plot" column.')
  }

  if(design_val == "STRS" && !("stratum" %in% colnames(data_val))) {
    stop('The data input is missing the required "stratum" column.')
  }

  if(design_val == "FFS" && !("trt_type" %in% colnames(data_val))) {
    stop('The data input is missing the required "trt_type" column.')
  }

  # Check for missing values
  if('TRUE' %in% is.na(data_val$time)) {
    stop('For data, there are missing values in the time column.')
  }

  if('TRUE' %in% is.na(data_val$site)) {
    stop('For data, there are missing values in the site column.')
  }

  if('TRUE' %in% is.na(data_val$plot)) {
    stop('For data, there are missing values in the plot column.')
  }

  if(design_val == "STRS" && 'TRUE' %in% is.na(data_val$stratum)) {
    stop('For data, there are missing values in the stratum column.')
  }

  if(design_val == "FFS" && 'TRUE' %in% is.na(data_val$trt_type)) {
    stop('For data, there are missing values in the trt_type column.')
  }

}

###################################################################
# function to check column class
###################################################################

ValidateNumeric <- function(data_val, design_val) {

  if(design_val == "STRS" && !("species" %in% colnames(data_val))) {
    num_variables <- subset(data_val, select = -c(time, site, stratum, plot))
  } else if (design_val == "STRS" && ("species" %in% colnames(data_val))) {
    num_variables <- subset(data_val, select = -c(time, site, stratum, plot, species))
  } else if (design_val == "SRS" && !("species" %in% colnames(data_val))) {
    num_variables <- subset(data_val, select = -c(time, site, plot))
  } else if (design_val == "SRS" && ("species" %in% colnames(data_val))) {
    num_variables <- subset(data_val, select = -c(time, site, plot, species))
  } else if (design_val == "FFS" && !("species" %in% colnames(data_val))) {
    num_variables <- subset(data_val, select = -c(time, trt_type, site, plot))
  } else if (design_val == "FFS" && ("species" %in% colnames(data_val))) {
    num_variables <- subset(data_val, select = -c(time, trt_type, site, plot, species))
  }

  n_cols <- ncol(num_variables)

  for(i in 1:n_cols) {

    if(!is.numeric(num_variables[,i])) {

      stop('Other than the necessary ID columns - such as time, site, plot -\n',
           'all other columns must be numeric. Check the columns in your data input.')

    }

  }

}

###################################################################
# function to check that each observation is a plot
###################################################################

ValidateObs <- function(data_val, design_val, data_name) {

  if(design_val == "STRS" && !("species" %in% colnames(data_val))) {
    data_val$unq_id <- paste0(data_val$time,'_',data_val$site,'_',data_val$stratum,'_',data_val$plot)
  } else if (design_val == "STRS" && ("species" %in% colnames(data_val))) {
    data_val$unq_id <- paste0(data_val$time,'_',data_val$site,'_',data_val$stratum,'_',data_val$plot,'_',data_val$species)
  } else if (design_val == "SRS" && !("species" %in% colnames(data_val))) {
    data_val$unq_id <- paste0(data_val$time,'_',data_val$site,'_',data_val$plot)
  } else if (design_val == "SRS" && ("species" %in% colnames(data_val))) {
    data_val$unq_id <- paste0(data_val$time,'_',data_val$site,'_',data_val$plot,'_',data_val$species)
  } else if (design_val == "FFS" && !("species" %in% colnames(data_val))) {
    data_val$unq_id <- paste0(data_val$time,'_',data_val$trt_type,'_',data_val$site,'_',data_val$plot)
  } else if (design_val == "FFS" && ("species" %in% colnames(data_val))) {
    data_val$unq_id <- paste0(data_val$time,'_',data_val$trt_type,'_',data_val$site,'_',data_val$plot,'_',data_val$species)
  }

  data_val$count <- 1
  obs_ag <- aggregate(data = data_val, count ~ unq_id, FUN = sum)

  if(any(obs_ag$count > 1)) {

    count_sub <- subset(obs_ag, obs_ag$count > 1)
    all_id <- paste0(count_sub$unq_id, sep = "   ")

    if(design_val == "STRS" && !("species" %in% colnames(data_val))) {

      stop('For ',data_name,', there are repeat time:site:stratum:plot observations.\n',
           'There should only be one observation/row for an individual plot at a specific time:site:stratum.\n',
           'Investigate the following time:site:stratum:plot combinations: ', all_id)

    } else if (design_val == "STRS" && ("species" %in% colnames(data_val))) {

      stop('For ',data_name,', there are repeat time:site:stratum:plot:species observations.\n',
           'There should only be one observation/row for an individual species at a specific time:site:stratum:plot.\n',
           'Investigate the following time:site:stratum:plot:species combinations: ', all_id)

    } else if (design_val == "SRS" && !("species" %in% colnames(data_val))) {

      stop('For ',data_name,', there are repeat time:site:plot observations.\n',
           'There should only be one observation/row for an individual plot at a specific time:site.\n',
           'Investigate the following time:site:plot combinations: ', all_id)

    } else if (design_val == "SRS" && ("species" %in% colnames(data_val))) {

      stop('For ',data_name,', there are repeat time:site:plot:species observations.\n',
           'There should only be one observation/row for an individual species at a specific time:site:plot.\n',
           'Investigate the following time:site:plot:species combinations: ', all_id)

    } else if (design_val == "FFS" && !("species" %in% colnames(data_val))) {

      stop('For ',data_name,', there are repeat time:trt_type:site:plot observations.\n',
           'There should only be one observation/row for an individual plot at a specific time:trt_type:site.\n',
           'Investigate the following time:trt_type:site:plot combinations: ', all_id)

    } else if (design_val == "FFS" && ("species" %in% colnames(data_val))) {

      stop('For ',data_name,', there are repeat time:trt_type:site:plot:species observations.\n',
           'There should only be one observation/row for an individual species at a specific time:trt_type:site:plot.\n',
           'Investigate the following time:trt_type:site:plot:species combinations: ', all_id)

    }

  }

}

###################################################################
# function to check that each species is present in each plot
###################################################################

ValidateSpecies <- function(data_val, design_val) {

  if(design_val == "STRS") {
    data_val$unq_id <- paste0(data_val$time,'_',data_val$site,'_',data_val$stratum,'_',data_val$plot)
  } else if (design_val == "SRS") {
    data_val$unq_id <- paste0(data_val$time,'_',data_val$site,'_',data_val$plot)
  } else if (design_val == "FFS") {
    data_val$unq_id <- paste0(data_val$time,'_',data_val$trt_type,'_',data_val$site,'_',data_val$plot)
  }

  all_sp <- unique(data_val$species)
  all_obs <- unique(data_val$unq_id)
  issues <- c()

  for(k in all_obs) {

    unq_ob <- subset(data_val, unq_id == k)
    obs_sp <- unique(unq_ob$species)

    if(!all(is.element(all_sp, obs_sp))) {

      issues <- c(issues, k)

    }

  }

  if(length(issues) > 0) {

    all_sp_return <- sort(paste0(all_sp, sep = "   "))
    issues_return <- paste0(issues, sep = "   ")

    stop('All species must be represented in each plot.\n',
         'Unique species: ', all_sp_return,'\n',
         'Plots that do not have all unique species represented: ', issues_return)

  }

}

###################################################################
# function to check weights dataframe
###################################################################

ValidateWeights <- function(data_val, wt_data_val, data_name) {

  # check that all required columns exist
  if(!("site" %in% colnames(wt_data_val))) {
    stop('The wt_data input is missing the required "site" column.')
  }

  if(!("stratum" %in% colnames(wt_data_val))) {
    stop('The wt_data input is missing the required "stratum" column.')
  }

  if(!("wh" %in% colnames(wt_data_val))) {
    stop('The wt_data input is missing the required "wh" column.')
  }

  # check wh column class
  if(!is.numeric(wt_data_val$wh)) {
    stop('For wt_data, the wh column must be numeric.\n',
         'The wh column is currently class: ', class(wt_data_val$wh))
  }

  # Check for missing values
  if("time" %in% colnames(wt_data_val)) {

    if('TRUE' %in% is.na(wt_data_val$time)) {
      stop('For wt_data, there are missing values in the time column.')
    }

  }

  if('TRUE' %in% is.na(wt_data_val$site)) {
    stop('For wt_data, there are missing values in the site column.')
  }

  if('TRUE' %in% is.na(wt_data_val$stratum)) {
    stop('For wt_data, there are missing values in the stratum column.')
  }

  if('TRUE' %in% is.na(wt_data_val$wh)) {
    stop('For wt_data, there are missing values in the wh column.')
  }

  # Check for site:stratum matches for data and wt_data
  if("time" %in% colnames(wt_data_val)) {

    data_val$unq_id <- paste0(data_val$time,'_',data_val$site,'_',data_val$stratum)
    wt_data_val$unq_id <- paste0(wt_data_val$time,'_',wt_data_val$site,'_',wt_data_val$stratum)
    wt_data_val$sum_id <- paste0(wt_data_val$time,'_',wt_data_val$site)

  } else {

    data_val$unq_id <- paste0(data_val$site,'_',data_val$stratum)
    wt_data_val$unq_id <- paste0(wt_data_val$site,'_',wt_data_val$stratum)
    wt_data_val$sum_id <- wt_data_val$site

  }

  if(!all(is.element(data_val$unq_id,wt_data_val$unq_id)) ||
     !all(is.element(wt_data_val$unq_id,data_val$unq_id))) {

    plots_wo_wts <- paste0(unique(data_val[!is.element(data_val$unq_id,wt_data_val$unq_id), "unq_id"]), sep = " ")
    wts_wo_plots <- paste0(unique(wt_data_val[!is.element(wt_data_val$unq_id,data_val$unq_id), "unq_id"]), sep = " ")

    stop(data_name,' and wt_data did not completely match!\n',
         'These strata are in ',data_name,' but do not have a match in wt_data: ', plots_wo_wts, '\n',
         'These strata are in wt_data but do not have a match in ',data_name,': ', wts_wo_plots)

  }

  # Check that there are no repeat site:stratum
  wt_data_val$count <- 1
  wh_ag <- aggregate(data = wt_data_val, count ~ unq_id, FUN = sum)

  if(any(wh_ag$count > 1)) {

    count_sub <- subset(wh_ag, wh_ag$count > 1)
    all_id <- paste0(count_sub$unq_id, sep = "   ")

    if("time" %in% colnames(wt_data_val)) {

      stop('For wt_data, there are repeat time:site:stratum values.\n',
           'Each row should correspond to a unique time:site:stratum.\n',
           'Investigate the following time:site:stratum combinations: ', all_id)

    } else {

      stop('For wt_data, there are repeat site:stratum values.\n',
           'Each row should correspond to a unique site:stratum.\n',
           'Investigate the following site:stratum combinations: ', all_id)

    }

  }

  # check that stratum weights sum to 1
  wh_ids <- unique(wt_data_val$sum_id)
  wh_issues <- c()

  for(k in wh_ids) {

    all_whs <- subset(wt_data_val, wt_data_val$sum_id == k)
    sum_wh <- sum(all_whs$wh)

    if(sum_wh != 1) {

      wh_issues <- c(wh_issues, k)

    }

  }

  if(length(wh_issues) > 0) {

    issues_return <- paste0(wh_issues, sep = "   ")

    stop('For each site, or time:site, the stratum weights must add to 1.\n',
         'Sites, or time:sites, with stratum weights that do not sum to 1: ', issues_return)

  }

}

###################################################################
# function to check fpc dataframe
###################################################################

ValidateFPC <- function(data_val, fpc_data_val, design_val, data_name) {

  # check that all required columns exist
  if(!("site" %in% colnames(fpc_data_val))) {
    stop('The fpc_data input is missing the required "site" column.')
  }

  if(!("N" %in% colnames(fpc_data_val))) {
    stop('The fpc_data input is missing the required "N" column.')
  }

  if(!("n" %in% colnames(fpc_data_val))) {
    stop('The fpc_data input is missing the required "n" column.')
  }

  if(design_val == "STRS" && !("stratum" %in% colnames(data_val))) {
    stop('The fpc_data input is missing the required "stratum" column.\n',
         'This column is required because you set design to "STRS".')
  }

  if(design_val == "FFS" && !("trt_type" %in% colnames(data_val))) {
    stop('The fpc_data input is missing the required "trt_type" column.\n',
         'This column is required because you set design to "FFS".')
  }

  # check column classes
  if(!is.numeric(fpc_data_val$N)) {
    stop('For fpc_data, the N column must be numeric.\n',
         'The N column is currently class: ', class(fpc_data_val$N))
  }

  if(!is.numeric(fpc_data_val$n)) {
    stop('For fpc_data, the n column must be numeric.\n',
         'The n column is currently class: ', class(fpc_data_val$n))
  }

  # Check for missing values
  if("time" %in% colnames(fpc_data_val)) {

    if('TRUE' %in% is.na(fpc_data_val$time)) {
      stop('For fpc_data, there are missing values in the time column.')
    }

  }

  if('TRUE' %in% is.na(fpc_data_val$site)) {
    stop('For fpc_data, there are missing values in the site column.')
  }

  if('TRUE' %in% is.na(fpc_data_val$N)) {
    stop('For fpc_data, there are missing values in the N column.')
  }

  if('TRUE' %in% is.na(fpc_data_val$n)) {
    stop('For fpc_data, there are missing values in the n column.')
  }

  if(design_val == "STRS") {

    if('TRUE' %in% is.na(fpc_data_val$stratum)) {
      stop('For fpc_data, there are missing values in the stratum column.')
    }

  }

  if(design_val == "FFS") {

    if('TRUE' %in% is.na(fpc_data_val$trt_type)) {
      stop('For fpc_data, there are missing values in the trt_type column.')
    }

  }

  # Check for matches between data and fpc_data
  if(design_val == "STRS" && ("time" %in% colnames(fpc_data_val))) {

    data_val$unq_id <- paste0(data_val$time,'_',data_val$site,'_',data_val$stratum)
    fpc_data_val$unq_id <- paste0(fpc_data_val$time,'_',fpc_data_val$site,'_',fpc_data_val$stratum)

  } else if (design_val == "STRS" && !("time" %in% colnames(fpc_data_val))) {

    data_val$unq_id <- paste0(data_val$site,'_',data_val$stratum)
    fpc_data_val$unq_id <- paste0(fpc_data_val$site,'_',fpc_data_val$stratum)

  } else if (design_val == "SRS" && ("time" %in% colnames(fpc_data_val))) {

    data_val$unq_id  <- paste0(data_val$time,'_',data_val$site)
    fpc_data_val$unq_id  <- paste0(fpc_data_val$time,'_',fpc_data_val$site)

  } else if (design_val == "SRS" && !("time" %in% colnames(fpc_data_val))) {

    data_val$unq_id  <- paste0(data_val$site)
    fpc_data_val$unq_id  <- paste0(fpc_data_val$site)

  } else if (design_val == "FFS" && ("time" %in% colnames(fpc_data_val))) {

    data_val$unq_id  <- paste0(data_val$time,'_',data_val$trt_type,'_',data_val$site)
    fpc_data_val$unq_id  <- paste0(fpc_data_val$time,'_',fpc_data_val$trt_type,'_',fpc_data_val$site)

  } else if (design_val == "FFS" && !("time" %in% colnames(fpc_data_val))) {

    data_val$unq_id  <- paste0(data_val$trt_type,'_',data_val$site)
    fpc_data_val$unq_id  <- paste0(fpc_data_val$trt_type,'_',fpc_data_val$site)

  }

  if(!all(is.element(data_val$unq_id,fpc_data_val$unq_id)) ||
     !all(is.element(fpc_data_val$unq_id,data_val$unq_id))) {

    plots_wo_fpc <- paste0(unique(data_val[!is.element(data_val$unq_id,fpc_data_val$unq_id), "unq_id"]), sep = " ")
    fpc_wo_plots <- paste0(unique(fpc_data_val[!is.element(fpc_data_val$unq_id,data_val$unq_id), "unq_id"]), sep = " ")

    stop(data_name,' and fpc_data did not completely match!\n',
         'In ',data_name,' but does not have a match in fpc_data: ', plots_wo_fpc, '\n',
         'In fpc_data but does not have a match in ',data_name,': ', fpc_wo_plots)

  }

  # Check that there are no repeats
  fpc_data_val$count <- 1
  fpc_ag <- aggregate(data = fpc_data_val, count ~ unq_id, FUN = sum)

  if(any(fpc_ag$count > 1)) {

    count_sub <- subset(fpc_ag, fpc_ag$count > 1)
    all_id <- paste0(count_sub$unq_id, sep = "   ")

    if(design_val == "STRS" && ("time" %in% colnames(fpc_data_val))) {

      stop('For fpc_data, there are repeat time:site:stratum values.\n',
           'Each row should correspond to a unique time:site:stratum.\n',
           'Investigate the following time:site:stratum combinations: ', all_id)

    } else if (design_val == "STRS" && !("time" %in% colnames(fpc_data_val))) {

      stop('For fpc_data, there are repeat site:stratum values.\n',
           'Each row should correspond to a unique site:stratum.\n',
           'Investigate the following site:stratum combinations: ', all_id)

    } else if (design_val == "SRS" && ("time" %in% colnames(fpc_data_val))) {

      stop('For fpc_data, there are repeat time:site values.\n',
           'Each row should correspond to a unique time:site.\n',
           'Investigate the following time:site combinations: ', all_id)

    } else if (design_val == "SRS" && !("time" %in% colnames(fpc_data_val))) {

      stop('For fpc_data, there are repeat site values.\n',
           'Each row should correspond to a unique site.\n',
           'Investigate the following site combinations: ', all_id)

    } else if (design_val == "FFS" && ("time" %in% colnames(fpc_data_val))) {

      stop('For fpc_data, there are repeat time:trt_type:site values.\n',
           'Each row should correspond to a unique time:trt_type:site.\n',
           'Investigate the following time:trt_type:site combinations: ', all_id)

    } else if (design_val == "FFS" && !("time" %in% colnames(fpc_data_val))) {

      stop('For fpc_data, there are repeat trt_type:site values.\n',
           'Each row should correspond to a unique trt_type:site.\n',
           'Investigate the following trt_type:site combinations: ', all_id)

    }

  }

  # check that N >= n
  if(any(fpc_data_val$N < fpc_data_val$n)) {

    stop('For fpc_data, there are cases where N < n.\n',
         'N must be >= n.')

  }

}

###################################################################
# function to coerce column class
###################################################################

ValidateColClass <- function(data_val, design_val) {

  data_val$time <- as.character(data_val$time)
  data_val$site <- as.character(data_val$site)
  data_val$plot <- as.character(data_val$plot)

  if(design_val == "STRS") {
    data_val$stratum <- as.character(data_val$stratum)
  }

  if(design_val == "FFS") {
    data_val$trt_type <- as.character(data_val$trt_type)
  }

  if("species" %in% colnames(data_val)) {
    data_val$species <- as.character(data_val$species)
  }

  return(data_val)

}


################################################################################
################################################################################
# Summary functions
################################################################################
################################################################################

################################################################
# function for simple random sampling
################################################################
SRS_calcs <- function(data, fpc) {

  # create new columns to reduce looping
  if("species" %in% colnames(data)) {
    data$ts <- paste0(data$time,'_',data$site,'_',data$species)
  } else {
    data$ts <- paste0(data$time,'_',data$site)
  }

  # create an empty dataframe to fill and build on to
  if("species" %in% colnames(data)) {

    compiled_df <- data.frame(matrix(nrow = 0, ncol = 4))
    colnames(compiled_df) <- c("ts", "time", "site", "species")

  } else {

    compiled_df <- data.frame(matrix(nrow = 0, ncol = 3))
    colnames(compiled_df) <- c("ts", "time", "site")

  }

  # loop through each time:site
  sites <- unique(data$ts)

  for(m in sites) {

    all_plots <- subset(data, ts == m)

    compiled_df[nrow(compiled_df) + 1, ] <- NA
    l <- nrow(compiled_df)

    compiled_df$ts[l] <- all_plots$ts[1]
    compiled_df$time[l] <- all_plots$time[1]
    compiled_df$site[l] <- all_plots$site[1]

    if("species" %in% colnames(data)) {
      compiled_df$species[l] <- all_plots$species[1]
    }

  }

  # get number of continuous variable columns
  # aka the number of variables that will be summarized
  if("species" %in% colnames(data)) {
    variable_cols <- subset(data, select = -c(ts, time, site, plot, species))
  } else {
    variable_cols <- subset(data, select = -c(ts, time, site, plot))
  }

  n_cols <- ncol(variable_cols)

  for(i in 1:n_cols) {

    # pull out the variable name
    var_name <- colnames(variable_cols)[i]
    avg_name <- paste0('avg_',var_name)
    se_name <- paste0('se_',var_name)

    # add new columns (one for mean and one for SE)
    compiled_df[[avg_name]] <- NA
    compiled_df[[se_name]] <- NA

    # loop through each time:site
    for(m in sites) {

      all_plots_2 <- subset(data, ts == m)
      var_calcs <- StratumValues(all_plots_2, var_name, fpc, "SRS") # uses same formulas as stratum-level values in STRS
      compiled_df[[avg_name]] <- ifelse(compiled_df$ts == m, var_calcs[1], compiled_df[[avg_name]])
      compiled_df[[se_name]] <- ifelse(compiled_df$ts == m, var_calcs[2], compiled_df[[se_name]])

    }

  }

  # create output dataframes with correct columns
  return_df <- subset(compiled_df, select = -c(ts))
  return(return_df)

}

################################################################
# function for stratified random sampling
################################################################

STRS_calcs <- function(data, wh_data, fpc) {

  # create new columns to reduce looping
  if("species" %in% colnames(data)) {

    data$tss <- paste0(data$time,'_',data$site,'_',data$stratum,'_',data$species)
    data$ts <- paste0(data$time,'_',data$site,'_',data$species)

  } else {

    data$tss <- paste0(data$time,'_',data$site,'_',data$stratum)
    data$ts <- paste0(data$time,'_',data$site)

  }

  # stratum values ----------------------------------------
  # create an empty dataframe to fill and build on to
  if("species" %in% colnames(data)) {

    str_df <- data.frame(matrix(nrow = 0, ncol = 6))
    colnames(str_df) <- c("tss", "ts", "time", "site", "stratum", "species")

  } else {

    str_df <- data.frame(matrix(nrow = 0, ncol = 5))
    colnames(str_df) <- c("tss", "ts", "time", "site", "stratum")

  }

  # loop through each time:site:stratum
  strats <- unique(data$tss)

  for(k in strats) {

    all_plots <- subset(data, tss == k)

    str_df[nrow(str_df) + 1, ] <- NA
    j <- nrow(str_df)

    str_df$tss[j] <- all_plots$tss[1]
    str_df$ts[j] <- all_plots$ts[1]
    str_df$time[j] <- all_plots$time[1]
    str_df$site[j] <- all_plots$site[1]
    str_df$stratum[j] <- all_plots$stratum[1]

    if("species" %in% colnames(data)) {
      str_df$species[j] <- all_plots$species[1]
    }

  }

  # add column with stratum weights
  str_df_wh <- StratumWeights(str_df, wh_data)

  # overall values ----------------------------------------
  # create an empty dataframe to fill and build on to
  if("species" %in% colnames(data)) {

    overall_df <- data.frame(matrix(nrow = 0, ncol = 4))
    colnames(overall_df) <- c("ts", "time", "site", "species")

  } else {

    overall_df <- data.frame(matrix(nrow = 0, ncol = 3))
    colnames(overall_df) <- c("ts", "time", "site")

  }

  # loop through each time:site
  sites <- unique(str_df_wh$ts)

  for(m in sites) {

    all_strats <- subset(str_df_wh, ts == m)

    overall_df[nrow(overall_df) + 1, ] <- NA
    l <- nrow(overall_df)

    overall_df$ts[l] <- all_strats$ts[1]
    overall_df$time[l] <- all_strats$time[1]
    overall_df$site[l] <- all_strats$site[1]

    if("species" %in% colnames(data)) {
      overall_df$species[l] <- all_strats$species[1]
    }

  }

  # get number of continuous variable columns
  # aka the number of variables that will be summarized
  if("species" %in% colnames(data)) {
    variable_cols <- subset(data, select = -c(tss, ts, time, site, stratum, plot, species))
  } else {
    variable_cols <- subset(data, select = -c(tss, ts, time, site, stratum, plot))
  }

  n_cols <- ncol(variable_cols)

  for(i in 1:n_cols) {

    # pull out the variable name
    var_name <- colnames(variable_cols)[i]
    avg_name <- paste0('avg_',var_name)
    se_name <- paste0('se_',var_name)

    # stratum values ----------------------------------------
    # add new columns (one for mean and one for SE)
    str_df_wh[[avg_name]] <- NA
    str_df_wh[[se_name]] <- NA

    # loop through each time:site:stratum
    for(k in strats) {

      all_plots_2 <- subset(data, tss == k)
      var_calcs <- StratumValues(all_plots_2, var_name, fpc, "STRS")
      str_df_wh[[avg_name]] <- ifelse(str_df_wh$tss == k, var_calcs[1], str_df_wh[[avg_name]])
      str_df_wh[[se_name]] <- ifelse(str_df_wh$tss == k, var_calcs[2], str_df_wh[[se_name]])

    }

    # Overall values -----------------------------------------
    # add new columns (one for mean and one for SE)
    overall_df[[avg_name]] <- NA
    overall_df[[se_name]] <- NA

    # loop through each time:site
    for(m in sites) {

      all_strats_2 <- subset(str_df_wh, ts == m)
      var_calcs_st <- OverallValues(all_strats_2, avg_name, se_name)
      overall_df[[avg_name]] <- ifelse(overall_df$ts == m, var_calcs_st[1], overall_df[[avg_name]])
      overall_df[[se_name]] <- ifelse(overall_df$ts == m, var_calcs_st[2], overall_df[[se_name]])

    }

  }

  # create output dataframes with correct columns
  str_return_df <- subset(str_df_wh, select = -c(tss, ts, wh))
  overall_return_df <- subset(overall_df, select = -c(ts))

  # create return list & name list items
  return_list <- list(str_return_df, overall_return_df)
  names(return_list) <- c("stratum", "site")
  return(return_list)

}

################################################################
# function for FFS
################################################################

FFS_calcs <- function(data, fpc) {

  # create new columns to reduce looping
  if("species" %in% colnames(data)) {

    data$tts <- paste0(data$time,'_',data$trt_type,'_',data$site,'_',data$species)
    data$tt <- paste0(data$time,'_',data$trt_type,'_',data$species)

  } else {

    data$tts <- paste0(data$time,'_',data$trt_type,'_',data$site)
    data$tt <- paste0(data$time,'_',data$trt_type)

  }

  # compartment values ----------------------------------------
  # create an empty dataframe to fill and build on to
  if("species" %in% colnames(data)) {

    comp_df <- data.frame(matrix(nrow = 0, ncol = 6))
    colnames(comp_df) <- c("tts", "tt", "time", "trt_type", "site", "species")

  } else {

    comp_df <- data.frame(matrix(nrow = 0, ncol = 5))
    colnames(comp_df) <- c("tts", "tt", "time", "trt_type", "site")

  }

  # loop through each time:treatment:compartment
  comps <- unique(data$tts)

  for(k in comps) {

    all_plots <- subset(data, tts == k)

    comp_df[nrow(comp_df) + 1, ] <- NA
    j <- nrow(comp_df)

    comp_df$tts[j] <- all_plots$tts[1]
    comp_df$tt[j] <- all_plots$tt[1]
    comp_df$time[j] <- all_plots$time[1]
    comp_df$trt_type[j] <- all_plots$trt_type[1]
    comp_df$site[j] <- all_plots$site[1]

    if("species" %in% colnames(data)) {
      comp_df$species[j] <- all_plots$species[1]
    }

  }

  # treatment type values ----------------------------------------
  # create an empty dataframe to fill and build on to
  if("species" %in% colnames(data)) {

    type_df <- data.frame(matrix(nrow = 0, ncol = 4))
    colnames(type_df) <- c("tt", "time", "trt_type", "species")

  } else {

    type_df <- data.frame(matrix(nrow = 0, ncol = 3))
    colnames(type_df) <- c("tt", "time", "trt_type")

  }

  # loop through each time:treatment
  treats <- unique(comp_df$tt)

  for(m in treats) {

    all_comps <- subset(comp_df, tt == m)

    type_df[nrow(type_df) + 1, ] <- NA
    l <- nrow(type_df)

    type_df$tt[l] <- all_comps$tt[1]
    type_df$time[l] <- all_comps$time[1]
    type_df$trt_type[l] <- all_comps$trt_type[1]

    if("species" %in% colnames(data)) {
      type_df$species[l] <- all_comps$species[1]
    }

  }

  # get number of continuous variable columns
  # aka the number of variables that will be summarized
  if("species" %in% colnames(data)) {
    variable_cols <- subset(data, select = -c(tts, tt, time, trt_type, site, plot, species))
  } else {
    variable_cols <- subset(data, select = -c(tts, tt, time, trt_type, site, plot))
  }

  n_cols <- ncol(variable_cols)

  for(i in 1:n_cols) {

    # pull out the variable name
    var_name <- colnames(variable_cols)[i]
    avg_name <- paste0('avg_',var_name)
    se_name <- paste0('se_',var_name)

    # compartment values ----------------------------------------
    # add new columns (one for mean and one for SE)
    comp_df[[avg_name]] <- NA
    comp_df[[se_name]] <- NA

    # loop through each time:treatment:compartment
    for(k in comps) {

      all_plots_2 <- subset(data, tts == k)
      var_calcs <- StratumValues(all_plots_2, var_name, fpc, "FFS")
      comp_df[[avg_name]] <- ifelse(comp_df$tts == k, var_calcs[1], comp_df[[avg_name]])
      comp_df[[se_name]] <- ifelse(comp_df$tts == k, var_calcs[2], comp_df[[se_name]])

    }

    # treatment type values -----------------------------------------
    # add new columns (one for mean and one for SE)
    type_df[[avg_name]] <- NA
    type_df[[se_name]] <- NA

    # loop through each time:treatment
    for(m in treats) {

      all_comps_2 <- subset(comp_df, tt == m)
      var_calcs_2 <- StratumValues(all_comps_2, avg_name, "not_needed")
      type_df[[avg_name]] <- ifelse(type_df$tt == m, var_calcs_2[1], type_df[[avg_name]])
      type_df[[se_name]] <- ifelse(type_df$tt == m, var_calcs_2[2], type_df[[se_name]])

    }

  }

  # create output dataframes with correct columns
  comp_return_df <- subset(comp_df, select = -c(tts, tt))
  type_return_df <- subset(type_df, select = -c(tt))

  # create return list & name list items
  return_list <- list(comp_return_df, type_return_df)
  names(return_list) <- c("site", "trt_type")
  return(return_list)

}

################################################################
# function for calculating stratum-level values
################################################################

StratumValues <- function(df, variable, fpc_df, des = "not_needed") {

  df$n <- ifelse(is.na(df[[variable]]),0,1)
  n_h <- sum(df$n)

  if(n_h == 0) {

    # mean and standard error
    ybar_h <- NA
    s_ybar_h <- NA

  } else if(n_h == 1) {

    # mean
    sum_y_hi <- sum(df[[variable]], na.rm = TRUE)
    ybar_h <- sum_y_hi/n_h

    # standard error
    s_ybar_h <- NA

  } else {

    # mean
    sum_y_hi <- sum(df[[variable]], na.rm = TRUE)
    ybar_h <- sum_y_hi/n_h

    # standard error
    if(all(fpc_df != "not_needed")) {

      if(des == "STRS" && "time" %in% colnames(fpc_df)) {
        fpc_id_match <- paste0(df$time[1],'_',df$site[1],'_',df$stratum[1])
      } else if (des == "STRS" && !("time" %in% colnames(fpc_df))) {
        fpc_id_match <- paste0(df$site[1],'_',df$stratum[1])
      } else if (des == "SRS" && "time" %in% colnames(fpc_df)) {
        fpc_id_match <- paste0(df$time[1],'_',df$site[1])
      } else if (des == "SRS" && !("time" %in% colnames(fpc_df))) {
        fpc_id_match <- paste0(df$site[1])
      } else if (des == "FFS" && "time" %in% colnames(fpc_df)) {
        fpc_id_match <- paste0(df$time[1],'_',df$trt_type[1],'_',df$site[1])
      } else if (des == "FFS" && !("time" %in% colnames(fpc_df))) {
        fpc_id_match <- paste0(df$trt_type[1],'_',df$site[1])
      }

      fpc_info <- subset(fpc_df, fpc_id == fpc_id_match)
      fpc_h <- fpc_info$fpc_value

      df$yi_ybar <- (df[[variable]] - ybar_h)^2
      sum_yi_ybar <- sum(df$yi_ybar, na.rm = TRUE)
      s_yh_2 <- sum_yi_ybar/(n_h - 1)
      s_ybar_h <- sqrt((s_yh_2/n_h)*fpc_h)

    } else {

      df$yi_ybar <- (df[[variable]] - ybar_h)^2
      sum_yi_ybar <- sum(df$yi_ybar, na.rm = TRUE)
      s_yh_2 <- sum_yi_ybar/(n_h - 1)
      s_ybar_h <- sqrt(s_yh_2/n_h)

    }

  }

  # save values into a vector
  return_vec <- c(ybar_h, s_ybar_h)
  return(return_vec)

}

################################################################
# function for calculating FPC value
################################################################

FPC <- function(df, des) {

  # create id column
  if(des == "STRS" && "time" %in% colnames(df)) {
    df$fpc_id <- paste0(df$time,'_',df$site,'_',df$stratum)
  } else if (des == "STRS" && !("time" %in% colnames(df))) {
    df$fpc_id <- paste0(df$site,'_',df$stratum)
  } else if (des == "SRS" && "time" %in% colnames(df)) {
    df$fpc_id <- paste0(df$time,'_',df$site)
  } else if (des == "SRS" && !("time" %in% colnames(df))) {
    df$fpc_id <- paste0(df$site)
  } else if (des == "FFS" && "time" %in% colnames(df)) {
    df$fpc_id <- paste0(df$time,'_',df$trt_type,'_',df$site)
  } else if (des == "FFS" && !("time" %in% colnames(df))) {
    df$fpc_id <- paste0(df$trt_type,'_',df$site)
  }

  # create fpc column
  df$fpc_value <- (df$N - df$n)/df$N

  # return df with necessary columns
  return(df)

}

################################################################
# function for pulling out stratum weights
################################################################

StratumWeights <- function(df, wh_df) {

  # create columns to match
  if("time" %in% colnames(wh_df)) {

    wh_df$wh_id <- paste0(wh_df$time,'_',wh_df$site,'_',wh_df$stratum)
    df$wh_id <- paste0(df$time,'_',df$site,'_',df$stratum)

  } else {

    wh_df$wh_id <- paste0(wh_df$site,'_',wh_df$stratum)
    df$wh_id <- paste0(df$site,'_',df$stratum)

  }

  # loop through df and assign stratum weights
  df$wh <- NA
  n <- nrow(df)

  for(i in 1:n) {

    df$wh[i] <- wh_df[wh_df$wh_id == df$wh_id[i], "wh"]

  }

  # remove weight ID column
  return_df <- subset(df, select = -c(wh_id))
  return(return_df)

}

################################################################
# function for calculating overall values
################################################################

OverallValues <- function(df, variable, se) {

  # mean
  df$ybar_h_wh <- df[[variable]]*df$wh
  ybar_st <- sum(df$ybar_h_wh) # no na.rm = TRUE

  # standard error
  df$s_ybar_h_2_wh <- (df[[se]]^2)*(df$wh^2)
  s_ybar_st <- sqrt(sum(df$s_ybar_h_2_wh)) # no na.rm = TRUE

  # save values into a vector
  return_vec <- c(ybar_st, s_ybar_st)
  return(return_vec)

}


globalVariables(c("tt", "tts", "trt_type", "ts", "tss", "stratum", "wh", "wh_id", "unq_id"))

