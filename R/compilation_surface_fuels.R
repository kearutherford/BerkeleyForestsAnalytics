
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

#' @title CompileSurfaceFuels
#'
#' @description
#' Compiles surface fuel data beyond the plot level. Specifically designed to further summarize outputs from the FineFuels and/or CoarseFuels functions. Recognizes simple random sampling and stratified random sampling designs. Also recognizes the design of the Fire and Fire Surrogate. See \href{https://github.com/kearutherford/BerkeleyForestsAnalytics/tree/main}{README} for details.
#'
#' @param fwd_data A dataframe or tibble. Fine woody debris (FWD) loads must already be calculated at the plot-level using the FineFuels function. Required columns depend on the sampling design:
#' \itemize{
#' \item Simple random sampling: must have time, site, plot, sc_length_1h, sc_length_10h, and sc_length_100h columns. Must also have load_1h_Mg_ha, load_10h_Mg_ha, and load_100h_Mg_ha (OR load_1h_ton_ac, load_10h_ton_ac, and load_100h_ton_ac).
#' \item Stratified random sampling: must have time, site, stratum, plot, sc_length_1h, sc_length_10h, and sc_length_100h columns. Must also have load_1h_Mg_ha, load_10h_Mg_ha, and load_100h_Mg_ha (OR load_1h_ton_ac, load_10h_ton_ac, and load_100h_ton_ac).
#' \item Fire and Fire Surrogate: must have time, trt_type, site, plot, sc_length_1h, sc_length_10h, and sc_length_100h columns. Must also have load_1h_Mg_ha, load_10h_Mg_ha, and load_100h_Mg_ha (OR load_1h_ton_ac, load_10h_ton_ac, and load_100h_ton_ac).
#' }
#' @param cwd_data A dataframe or tibble. Coarse woody debris (CWD) loads must already be calculated at the plot-level using the CoarseFuels function. Required columns depend on the sampling design:
#' \itemize{
#' \item Simple random sampling: must have time, site, plot, sc_length_1000s, and sc_length_1000r columns. Must also have load_1000s_Mg_ha, load_1000r_Mg_ha, and load_cwd_Mg_ha (OR load_1000s_Mg_ha, load_1000r_Mg_ha, and load_cwd_Mg_ha).
#' \item Stratified random sampling: must have time, site, stratum, plot, sc_length_1000s, and sc_length_1000r columns. Must also have load_1000s_Mg_ha, load_1000r_Mg_ha, and load_cwd_Mg_ha (OR load_1000s_Mg_ha, load_1000r_Mg_ha, and load_cwd_Mg_ha).
#' \item Fire and Fire Surrogate: must have time, trt_type, site, plot, sc_length_1000s, and sc_length_1000r columns. Must also have load_1000s_Mg_ha, load_1000r_Mg_ha, and load_cwd_Mg_ha (OR load_1000s_Mg_ha, load_1000r_Mg_ha, and load_cwd_Mg_ha).
#' }
#' @param design Specifies the sampling design. Must be set to "SRS" (simple random sample), "STRS" (stratified ransom sample), or "FFS" (Fire and Fire Surrogate). There is no default.
#' @param wt_data Only required for stratified random sampling designs. A dataframe or tibble with the following columns: time (optional), site, stratum, and wh (stratum weight). The default is set to "not_needed", and should be left as such for design = "SRS" or design = "FFS".
#' @param units Specifies whether the input data are in metric (megagrams per hectare) or imperial (US tons per acre) units. Inputs must be all metric or all imperial (do not mix-and-match units). The output units will match the input units (i.e., if inputs are in metric then outputs will be in metric). Must be set to either “metric” or “imperial”. The default is set to “metric”.
#'
#' @return Depends on the sampling design:
#' \itemize{
#' \item Simple random sampling: a dataframe with site-level summaries.
#' \item Stratified random sampling: a list with two components: (1) a dataframe with stratum-level summaries and (2) a dataframe with site-level summaries.
#' \item Fire and Fire Surrogate: a list with two components: (1) a dataframe with site-level (i.e., compartment-level) summaries and (2) a dataframe with treatment-level summaries.
#' }
#'
#' @export

CompileSurfaceFuels <- function(fwd_data = "none", cwd_data = "none", design, wt_data = "not_needed", units = "metric") {

  # coerce tibble inputs into data.frame
  if(all(fwd_data != "none")) {
    fwd_data <- as.data.frame(fwd_data)
  }

  if(all(cwd_data != "none")) {
    cwd_data <- as.data.frame(cwd_data)
  }

  if(all(wt_data != "not_needed")) {
    wt_data <- as.data.frame(wt_data)
  }

  # determine structure of inputs
  # type1 = FWD only, type2 = CWD only, type3 = FWD & CWD
  type <- GetType(fine = fwd_data, coarse = cwd_data)

  # check and prep input data
  step1 <- ValidateSurfaceData(fwd_data_check = fwd_data,
                               cwd_data_check = cwd_data,
                               design_check = design,
                               wt_data_check = wt_data,
                               unit_check = units,
                               type_check = type)

  # summarize data
  if(design == "SRS") {

    step2 <- SRS_CalcsSf(data = step1,
                         input_type = type)

  } else if (design == "STRS") {

    step2 <- STRS_CalcsSf(data = step1,
                          wh_data = wt_data,
                          input_type = type)

  } else if (design == "FFS") {

    step2 <- FFS_CalcsSf(data = step1,
                         input_type = type)

  }

  # rename columns
  step3 <- FinalSfDf(data = step2,
                     design_type = design,
                     input_type = type,
                     input_unit = units)

  return(step3)

}


################################################################################
################################################################################
# Supporting functions
################################################################################
################################################################################

###################################################################
# function for determining the structure of the input dataframes
###################################################################

GetType <- function(fine, coarse) {

  if(all(fine == "none") && all(coarse == "none")) {

    stop('You must input at least one dataframe - fwd_data and/or cwd_data.')

  } else if (all(fine != "none") && all(coarse == "none")) {

    type <- "type1" # ie fwd only

  } else if (all(fine == "none") && all(coarse != "none")) {

    type <- "type2" # ie cwd only

  } else if (all(fine != "none") && all(coarse != "none")) {

    type <- "type3" # ie both

  }

  return(type)

}

###################################################################
# function for renaming columns in the final/return dataframe
###################################################################

FinalSfDf <- function(data, design_type, input_type, input_unit) {

  # SRS ------------------------------------------------
  if(design_type == "SRS") {

    if(input_type == "type1" || input_type == "type3") {

      if(input_unit == "metric") {

        colnames(data)[colnames(data) == "avg_load_1h"] <- "avg_1h_Mg_ha"
        colnames(data)[colnames(data) == "se_load_1h"] <- "se_1h_Mg_ha"
        colnames(data)[colnames(data) == "avg_load_10h"] <- "avg_10h_Mg_ha"
        colnames(data)[colnames(data) == "se_load_10h"] <- "se_10h_Mg_ha"
        colnames(data)[colnames(data) == "avg_load_100h"] <- "avg_100h_Mg_ha"
        colnames(data)[colnames(data) == "se_load_100h"] <- "se_100h_Mg_ha"

      } else if(input_unit == "imperial") {

        colnames(data)[colnames(data) == "avg_load_1h"] <- "avg_1h_ton_ac"
        colnames(data)[colnames(data) == "se_load_1h"] <- "se_1h_ton_ac"
        colnames(data)[colnames(data) == "avg_load_10h"] <- "avg_10h_ton_ac"
        colnames(data)[colnames(data) == "se_load_10h"] <- "se_10h_ton_ac"
        colnames(data)[colnames(data) == "avg_load_100h"] <- "avg_100h_ton_ac"
        colnames(data)[colnames(data) == "se_load_100h"] <- "se_100h_ton_ac"

      }

    }


    if (input_type == "type2" || input_type == "type3") {

      if(input_unit == "metric") {

        colnames(data)[colnames(data) == "avg_load_1000h"] <- "avg_1000h_Mg_ha"
        colnames(data)[colnames(data) == "se_load_1000h"] <- "se_1000h_Mg_ha"

      } else if(input_unit == "imperial") {

        colnames(data)[colnames(data) == "avg_load_1000h"] <- "avg_1000h_ton_ac"
        colnames(data)[colnames(data) == "se_load_1000h"] <- "se_1000h_ton_ac"

      }

    }

  }

  # STRS ------------------------------------------------------
  if(design_type == "STRS") {

    if(input_type == "type1" || input_type == "type3") {

      if(input_unit == "metric") {

        colnames(data$stratum)[colnames(data$stratum) == "avg_load_1h"] <- "avg_1h_Mg_ha"
        colnames(data$stratum)[colnames(data$stratum) == "se_load_1h"] <- "se_1h_Mg_ha"
        colnames(data$stratum)[colnames(data$stratum) == "avg_load_10h"] <- "avg_10h_Mg_ha"
        colnames(data$stratum)[colnames(data$stratum) == "se_load_10h"] <- "se_10h_Mg_ha"
        colnames(data$stratum)[colnames(data$stratum) == "avg_load_100h"] <- "avg_100h_Mg_ha"
        colnames(data$stratum)[colnames(data$stratum) == "se_load_100h"] <- "se_100h_Mg_ha"

        colnames(data$site)[colnames(data$site) == "avg_load_1h"] <- "avg_1h_Mg_ha"
        colnames(data$site)[colnames(data$site) == "se_load_1h"] <- "se_1h_Mg_ha"
        colnames(data$site)[colnames(data$site) == "avg_load_10h"] <- "avg_10h_Mg_ha"
        colnames(data$site)[colnames(data$site) == "se_load_10h"] <- "se_10h_Mg_ha"
        colnames(data$site)[colnames(data$site) == "avg_load_100h"] <- "avg_100h_Mg_ha"
        colnames(data$site)[colnames(data$site) == "se_load_100h"] <- "se_100h_Mg_ha"

      } else if(input_unit == "imperial") {

        colnames(data$stratum)[colnames(data$stratum) == "avg_load_1h"] <- "avg_1h_ton_ac"
        colnames(data$stratum)[colnames(data$stratum) == "se_load_1h"] <- "se_1h_ton_ac"
        colnames(data$stratum)[colnames(data$stratum) == "avg_load_10h"] <- "avg_10h_ton_ac"
        colnames(data$stratum)[colnames(data$stratum) == "se_load_10h"] <- "se_10h_ton_ac"
        colnames(data$stratum)[colnames(data$stratum) == "avg_load_100h"] <- "avg_100h_ton_ac"
        colnames(data$stratum)[colnames(data$stratum) == "se_load_100h"] <- "se_100h_ton_ac"

        colnames(data$site)[colnames(data$site) == "avg_load_1h"] <- "avg_1h_ton_ac"
        colnames(data$site)[colnames(data$site) == "se_load_1h"] <- "se_1h_ton_ac"
        colnames(data$site)[colnames(data$site) == "avg_load_10h"] <- "avg_10h_ton_ac"
        colnames(data$site)[colnames(data$site) == "se_load_10h"] <- "se_10h_ton_ac"
        colnames(data$site)[colnames(data$site) == "avg_load_100h"] <- "avg_100h_ton_ac"
        colnames(data$site)[colnames(data$site) == "se_load_100h"] <- "se_100h_ton_ac"

      }

    }


    if (input_type == "type2" || input_type == "type3") {

      if(input_unit == "metric") {

        colnames(data$stratum)[colnames(data$stratum) == "avg_load_1000h"] <- "avg_1000h_Mg_ha"
        colnames(data$stratum)[colnames(data$stratum) == "se_load_1000h"] <- "se_1000h_Mg_ha"

        colnames(data$site)[colnames(data$site) == "avg_load_1000h"] <- "avg_1000h_Mg_ha"
        colnames(data$site)[colnames(data$site) == "se_load_1000h"] <- "se_1000h_Mg_ha"

      } else if(input_unit == "imperial") {

        colnames(data$stratum)[colnames(data$stratum) == "avg_load_1000h"] <- "avg_1000h_ton_ac"
        colnames(data$stratum)[colnames(data$stratum) == "se_load_1000h"] <- "se_1000h_ton_ac"

        colnames(data$site)[colnames(data$site) == "avg_load_1000h"] <- "avg_1000h_ton_ac"
        colnames(data$site)[colnames(data$site) == "se_load_1000h"] <- "se_1000h_ton_ac"

      }

    }

  }

  # FFS -------------------------------------------------------
  if(design_type == "FFS") {

    if(input_type == "type1" || input_type == "type3") {

      if(input_unit == "metric") {

        colnames(data$site)[colnames(data$site) == "avg_load_1h"] <- "avg_1h_Mg_ha"
        colnames(data$site)[colnames(data$site) == "se_load_1h"] <- "se_1h_Mg_ha"
        colnames(data$site)[colnames(data$site) == "avg_load_10h"] <- "avg_10h_Mg_ha"
        colnames(data$site)[colnames(data$site) == "se_load_10h"] <- "se_10h_Mg_ha"
        colnames(data$site)[colnames(data$site) == "avg_load_100h"] <- "avg_100h_Mg_ha"
        colnames(data$site)[colnames(data$site) == "se_load_100h"] <- "se_100h_Mg_ha"

        colnames(data$trt_type)[colnames(data$trt_type) == "avg_load_1h"] <- "avg_1h_Mg_ha"
        colnames(data$trt_type)[colnames(data$trt_type) == "se_load_1h"] <- "se_1h_Mg_ha"
        colnames(data$trt_type)[colnames(data$trt_type) == "avg_load_10h"] <- "avg_10h_Mg_ha"
        colnames(data$trt_type)[colnames(data$trt_type) == "se_load_10h"] <- "se_10h_Mg_ha"
        colnames(data$trt_type)[colnames(data$trt_type) == "avg_load_100h"] <- "avg_100h_Mg_ha"
        colnames(data$trt_type)[colnames(data$trt_type) == "se_load_100h"] <- "se_100h_Mg_ha"

      } else if(input_unit == "imperial") {

        colnames(data$site)[colnames(data$site) == "avg_load_1h"] <- "avg_1h_ton_ac"
        colnames(data$site)[colnames(data$site) == "se_load_1h"] <- "se_1h_ton_ac"
        colnames(data$site)[colnames(data$site) == "avg_load_10h"] <- "avg_10h_ton_ac"
        colnames(data$site)[colnames(data$site) == "se_load_10h"] <- "se_10h_ton_ac"
        colnames(data$site)[colnames(data$site) == "avg_load_100h"] <- "avg_100h_ton_ac"
        colnames(data$site)[colnames(data$site) == "se_load_100h"] <- "se_100h_ton_ac"

        colnames(data$trt_type)[colnames(data$trt_type) == "avg_load_1h"] <- "avg_1h_ton_ac"
        colnames(data$trt_type)[colnames(data$trt_type) == "se_load_1h"] <- "se_1h_ton_ac"
        colnames(data$trt_type)[colnames(data$trt_type) == "avg_load_10h"] <- "avg_10h_ton_ac"
        colnames(data$trt_type)[colnames(data$trt_type) == "se_load_10h"] <- "se_10h_ton_ac"
        colnames(data$trt_type)[colnames(data$trt_type) == "avg_load_100h"] <- "avg_100h_ton_ac"
        colnames(data$trt_type)[colnames(data$trt_type) == "se_load_100h"] <- "se_100h_ton_ac"

      }

    }


    if (input_type == "type2" || input_type == "type3") {

      if(input_unit == "metric") {

        colnames(data$site)[colnames(data$site) == "avg_load_1000h"] <- "avg_1000h_Mg_ha"
        colnames(data$site)[colnames(data$site) == "se_load_1000h"] <- "se_1000h_Mg_ha"

        colnames(data$trt_type)[colnames(data$trt_type) == "avg_load_1000h"] <- "avg_1000h_Mg_ha"
        colnames(data$trt_type)[colnames(data$trt_type) == "se_load_1000h"] <- "se_1000h_Mg_ha"

      } else if(input_unit == "imperial") {

        colnames(data$site)[colnames(data$site) == "avg_load_1000h"] <- "avg_1000h_ton_ac"
        colnames(data$site)[colnames(data$site) == "se_load_1000h"] <- "se_1000h_ton_ac"

        colnames(data$trt_type)[colnames(data$trt_type) == "avg_load_1000h"] <- "avg_1000h_ton_ac"
        colnames(data$trt_type)[colnames(data$trt_type) == "se_load_1000h"] <- "se_1000h_ton_ac"

      }

    }

  }

  return(data)

}


################################################################################
################################################################################
# Data validation functions
################################################################################
################################################################################

################################################################
# overarching data validation function
################################################################

ValidateSurfaceData <- function(fwd_data_check, cwd_data_check, design_check, wt_data_check, unit_check, type_check) {

  # check that options are set appropriately
  # function defined in compilation_general.R
  ValidateOptions(design_val = design_check, wt_data_val = wt_data_check)

      # additional option check
      if(unit_check == "metric" || unit_check == "imperial") {
        # do nothing
      } else {
        stop('The "units" parameter must be set to "metric" or "imperial".')
      }

  # check that all necessary columns are present and are formatted as expected
  ValidateColumns(fwd_data_val = fwd_data_check, cwd_data_val = cwd_data_check, design_val = design_check, type_val = type_check, unit_val = unit_check)

  # check that each observation is a unique plot, coerce ID columns to be character, and rename columns
  # functions defined in compilation_general.R
  if(type_check == "type1" || type_check == "type3") {

    ValidateObs(data_val = fwd_data_check, design_val = design_check, data_name = "fwd_data")
    return_fwd <- ValidateColClass(data_val = fwd_data_check, design_val = design_check)

    if(unit_check == "metric") {

      colnames(return_fwd)[which(names(return_fwd) == colnames(return_fwd["load_1h_Mg_ha"]))] <- "load_1h"
      colnames(return_fwd)[which(names(return_fwd) == colnames(return_fwd["load_10h_Mg_ha"]))] <- "load_10h"
      colnames(return_fwd)[which(names(return_fwd) == colnames(return_fwd["load_100h_Mg_ha"]))] <- "load_100h"

    } else if (unit_check == "imperial") {

      colnames(return_fwd)[which(names(return_fwd) == colnames(return_fwd["load_1h_ton_ac"]))] <- "load_1h"
      colnames(return_fwd)[which(names(return_fwd) == colnames(return_fwd["load_10h_ton_ac"]))] <- "load_10h"
      colnames(return_fwd)[which(names(return_fwd) == colnames(return_fwd["load_100h_ton_ac"]))] <- "load_100h"

    }

  }

  if(type_check == "type2" || type_check == "type3") {

    ValidateObs(data_val = cwd_data_check, design_val = design_check, data_name = "cwd_data")
    return_cwd <- ValidateColClass(data_val = cwd_data_check, design_val = design_check)
    return_cwd$sc_length_1000h <- return_cwd$sc_length_1000s + return_cwd$sc_length_1000r

    if(unit_check == "metric") {

      colnames(return_cwd)[which(names(return_cwd) == colnames(return_cwd["load_cwd_Mg_ha"]))] <- "load_1000h"

    } else if (unit_check == "imperial") {

      colnames(return_cwd)[which(names(return_cwd) == colnames(return_cwd["load_cwd_ton_ac"]))] <- "load_1000h"

    }

  }

  # merge fwd and cwd dataframes
  if(type_check == "type3") {
    return_merge <- MergeDfs(fwd_df = return_fwd, cwd_df = return_cwd, design_type = design_check)
  }

  # check weights dataframe
  # function defined in compilation_general.R
  if(design_check == "STRS" && type_check == "type1") {
    ValidateWeights(data_val = return_fwd, wt_data_val = wt_data_check, data_name = "fwd_data")
  } else if(design_check == "STRS" && type_check == "type2") {
    ValidateWeights(data_val = return_cwd, wt_data_val = wt_data_check, data_name = "cwd_data")
  } else if(design_check == "STRS" && type_check == "type3") {
    ValidateWeights(data_val = return_merge, wt_data_val = wt_data_check, data_name = "combined fwd_cwd_data")
  }

  # return appropriate dataframe
  if(type_check == "type1") {
    return(return_fwd)
  } else if (type_check == "type2") {
    return(return_cwd)
  } else if (type_check == "type3") {
    return(return_merge)
  }

}

###################################################################
# function to check that all columns are in the provided dataframe
###################################################################

ValidateColumns <- function(fwd_data_val, cwd_data_val, design_val, type_val, unit_val) {

  # fine woody debris checks ---------------------------------------------------
  if(type_val == "type1" || type_val == "type3") {

    # check that necessary columns exist
    if(design_val == "SRS" && unit_val == "metric") {

      necessary_columns = c("time", "site", "plot",
                            "load_1h_Mg_ha", "load_10h_Mg_ha", "load_100h_Mg_ha",
                            "sc_length_1h", "sc_length_10h", "sc_length_100h")

      if(!all(is.element(necessary_columns, names(fwd_data_val)))) {

        stop('fwd_data is missing necessary columns!\n',
             'For a SRS design and metric units, fwd_data must include: time, site, plot,\n',
             'load_1h_Mg_ha, load_10h_Mg_ha, load_100h_Mg_ha, sc_length_1h, sc_length_10h, and sc_length_100h')

      }

    } else if (design_val == "SRS" && unit_val == "imperial") {

      necessary_columns = c("time", "site", "plot",
                            "load_1h_ton_ac", "load_10h_ton_ac", "load_100h_ton_ac",
                            "sc_length_1h", "sc_length_10h", "sc_length_100h")

      if(!all(is.element(necessary_columns, names(fwd_data_val)))) {

        stop('fwd_data is missing necessary columns!\n',
             'For a SRS design and imperial units, fwd_data must include: time, site, plot,\n',
             'load_1h_ton_ac, load_10h_ton_ac, load_100h_ton_ac, sc_length_1h, sc_length_10h, and sc_length_100h')

      }

    } else if (design_val == "STRS" && unit_val == "metric") {

      necessary_columns = c("time", "site", "stratum", "plot",
                            "load_1h_Mg_ha", "load_10h_Mg_ha", "load_100h_Mg_ha",
                            "sc_length_1h", "sc_length_10h", "sc_length_100h")

      if(!all(is.element(necessary_columns, names(fwd_data_val)))) {

        stop('fwd_data is missing necessary columns!\n',
             'For a STRS design and metric units, fwd_data must include: time, site, stratum, plot,\n',
             'load_1h_Mg_ha, load_10h_Mg_ha, load_100h_Mg_ha, sc_length_1h, sc_length_10h, and sc_length_100h')

      }

    } else if (design_val == "STRS" && unit_val == "imperial") {

      necessary_columns = c("time", "site", "stratum", "plot",
                            "load_1h_ton_ac", "load_10h_ton_ac", "load_100h_ton_ac",
                            "sc_length_1h", "sc_length_10h", "sc_length_100h")

      if(!all(is.element(necessary_columns, names(fwd_data_val)))) {

        stop('fwd_data is missing necessary columns!\n',
             'For a STRS design and imperial units, fwd_data must include: time, site, stratum, plot,\n',
             'load_1h_ton_ac, load_10h_ton_ac, load_100h_ton_ac, sc_length_1h, sc_length_10h, and sc_length_100h')

      }

    } else if (design_val == "FFS" && unit_val == "metric") {

      necessary_columns = c("time", "trt_type", "site", "plot",
                            "load_1h_Mg_ha", "load_10h_Mg_ha", "load_100h_Mg_ha",
                            "sc_length_1h", "sc_length_10h", "sc_length_100h")

      if(!all(is.element(necessary_columns, names(fwd_data_val)))) {

        stop('fwd_data is missing necessary columns!\n',
             'For a FFS design and metric units, fwd_data must include: time, trt_type, site, plot,\n',
             'load_1h_Mg_ha, load_10h_Mg_ha, load_100h_Mg_ha, sc_length_1h, sc_length_10h, and sc_length_100h')

      }

    } else if (design_val == "FFS" && unit_val == "imperial") {

      necessary_columns = c("time", "trt_type", "site", "plot",
                            "load_1h_ton_ac", "load_10h_ton_ac", "load_100h_ton_ac",
                            "sc_length_1h", "sc_length_10h", "sc_length_100h")

      if(!all(is.element(necessary_columns, names(fwd_data_val)))) {

        stop('fwd_data is missing necessary columns!\n',
             'For a FFS design and imperial units, fwd_data must include: time, trt_type, site, plot,\n',
             'load_1h_ton_ac, load_10h_ton_ac, load_100h_ton_ac, sc_length_1h, sc_length_10h, and sc_length_100h')

      }

    }

    # Check for missing values
    if('TRUE' %in% is.na(fwd_data_val$time)) {
      stop('For fwd_data, there are missing values in the time column.')
    }

    if('TRUE' %in% is.na(fwd_data_val$site)) {
      stop('For fwd_data, there are missing values in the site column.')
    }

    if('TRUE' %in% is.na(fwd_data_val$plot)) {
      stop('For fwd_data, there are missing values in the plot column.')
    }

    if(design_val == "STRS" && 'TRUE' %in% is.na(fwd_data_val$stratum)) {
      stop('For fwd_data, there are missing values in the stratum column.')
    }

    if(design_val == "FFS" && 'TRUE' %in% is.na(fwd_data_val$trt_type)) {
      stop('For fwd_data, there are missing values in the trt_type column.')
    }

    # check column classes
    if(unit_val == "metric") {

      if(!is.numeric(fwd_data_val$load_1h_Mg_ha)) {
        stop('For fwd_data, the load_1h_Mg_ha column must be numeric.\n',
             'Currently, the column is class: ', class(fwd_data_val$load_1h_Mg_ha))
      }

      if(!is.numeric(fwd_data_val$load_10h_Mg_ha)) {
        stop('For fwd_data, the load_10h_Mg_ha column must be numeric.\n',
             'Currently, the column is class: ', class(fwd_data_val$load_10h_Mg_ha))
      }

      if(!is.numeric(fwd_data_val$load_100h_Mg_ha)) {
        stop('For fwd_data, the load_100h_Mg_ha column must be numeric.\n',
             'Currently, the column is class: ', class(fwd_data_val$load_100h_Mg_ha))
      }

    } else if (unit_val == "imperial") {

      if(!is.numeric(fwd_data_val$load_1h_ton_ac)) {
        stop('For fwd_data, the load_1h_ton_ac column must be numeric.\n',
             'Currently, the column is class: ', class(fwd_data_val$load_1h_ton_ac))
      }

      if(!is.numeric(fwd_data_val$load_10h_ton_ac)) {
        stop('For fwd_data, the load_10h_ton_ac column must be numeric.\n',
             'Currently, the column is class: ', class(fwd_data_val$load_10h_ton_ac))
      }

      if(!is.numeric(fwd_data_val$load_100h_ton_ac)) {
        stop('For fwd_data, the load_100h_ton_ac column must be numeric.\n',
             'Currently, the column is class: ', class(fwd_data_val$load_100h_ton_ac))
      }

    }

    if(!is.numeric(fwd_data_val$sc_length_1h)) {
      stop('For fwd_data, the sc_length_1h column must be numeric.\n',
           'Currently, the column is class: ', class(fwd_data_val$sc_length_1h))
    }

    if(!is.numeric(fwd_data_val$sc_length_10h)) {
      stop('For fwd_data, the sc_length_10h column must be numeric.\n',
           'Currently, the column is class: ', class(fwd_data_val$sc_length_10h))
    }

    if(!is.numeric(fwd_data_val$sc_length_100h)) {
      stop('For fwd_data, the sc_length_100h column must be numeric.\n',
           'Currently, the column is class: ', class(fwd_data_val$sc_length_100h))
    }

  }

  # coarse woody debris checks -------------------------------------------------
  # check that necessary columns exist
  if(type_val == "type2" || type_val == "type3") {

    if(design_val == "SRS" && unit_val == "metric") {

      necessary_columns = c("time", "site", "plot",
                            "load_1000s_Mg_ha", "load_1000r_Mg_ha", "load_cwd_Mg_ha",
                            "sc_length_1000s", "sc_length_1000r")

      if(!all(is.element(necessary_columns, names(cwd_data_val)))) {

        stop('cwd_data is missing necessary columns!\n',
             'For a SRS design and metric units, cwd_data must include: time, site, plot,\n',
             'load_1000s_Mg_ha, load_1000r_Mg_ha, load_cwd_Mg_ha, sc_length_1000s, and sc_length_1000r')

      }

    } else if (design_val == "SRS" && unit_val == "imperial") {

      necessary_columns = c("time", "site", "plot",
                            "load_1000s_ton_ac", "load_1000r_ton_ac", "load_cwd_ton_ac",
                            "sc_length_1000s", "sc_length_1000r")

      if(!all(is.element(necessary_columns, names(cwd_data_val)))) {

        stop('cwd_data is missing necessary columns!\n',
             'For a SRS design and imperial units, cwd_data must include: time, site, plot,\n',
             'load_1000s_ton_ac, load_1000r_ton_ac, load_cwd_ton_ac, sc_length_1000s, and sc_length_1000r')

      }

    } else if (design_val == "STRS" && unit_val == "metric") {

      necessary_columns = c("time", "site", "stratum", "plot",
                            "load_1000s_Mg_ha", "load_1000r_Mg_ha", "load_cwd_Mg_ha",
                            "sc_length_1000s", "sc_length_1000r")

      if(!all(is.element(necessary_columns, names(cwd_data_val)))) {

        stop('cwd_data is missing necessary columns!\n',
             'For a STRS design and metric units, cwd_data must include: time, site, stratum, plot,\n',
             'load_1000s_Mg_ha, load_1000r_Mg_ha, load_cwd_Mg_ha, sc_length_1000s, and sc_length_1000r')

      }

    } else if (design_val == "STRS" && unit_val == "imperial") {

      necessary_columns = c("time", "site", "stratum", "plot",
                            "load_1000s_ton_ac", "load_1000r_ton_ac", "load_cwd_ton_ac",
                            "sc_length_1000s", "sc_length_1000r")

      if(!all(is.element(necessary_columns, names(cwd_data_val)))) {

        stop('cwd_data is missing necessary columns!\n',
             'For a STRS design and imperial units, cwd_data must include: time, site, stratum, plot,\n',
             'load_1000s_ton_ac, load_1000r_ton_ac, load_cwd_ton_ac, sc_length_1000s, and sc_length_1000r')

      }

    } else if (design_val == "FFS" && unit_val == "metric") {

      necessary_columns = c("time", "trt_type", "site", "plot",
                            "load_1000s_Mg_ha", "load_1000r_Mg_ha", "load_cwd_Mg_ha",
                            "sc_length_1000s", "sc_length_1000r")

      if(!all(is.element(necessary_columns, names(cwd_data_val)))) {

        stop('cwd_data is missing necessary columns!\n',
             'For a FFS design and metric units, cwd_data must include: time, trt_type, site, plot,\n',
             'load_1000s_Mg_ha, load_1000r_Mg_ha, load_cwd_Mg_ha, sc_length_1000s, and sc_length_1000r')

      }

    } else if (design_val == "FFS" && unit_val == "imperial") {

      necessary_columns = c("time", "trt_type", "site", "plot",
                            "load_1000s_ton_ac", "load_1000r_ton_ac", "load_cwd_ton_ac",
                            "sc_length_1000s", "sc_length_1000r")

      if(!all(is.element(necessary_columns, names(cwd_data_val)))) {

        stop('cwd_data is missing necessary columns!\n',
             'For a FFS design and imperial units, cwd_data must include: time, trt_type, site, plot,\n',
             'load_1000s_ton_ac, load_1000r_ton_ac, load_cwd_ton_ac, sc_length_1000s, and sc_length_1000r')

      }

    }

    # Check for missing values
    if('TRUE' %in% is.na(cwd_data_val$time)) {
      stop('For cwd_data, there are missing values in the time column.')
    }

    if('TRUE' %in% is.na(cwd_data_val$site)) {
      stop('For cwd_data, there are missing values in the site column.')
    }

    if('TRUE' %in% is.na(cwd_data_val$plot)) {
      stop('For cwd_data, there are missing values in the plot column.')
    }

    if(design_val == "STRS" && 'TRUE' %in% is.na(cwd_data_val$stratum)) {
      stop('For cwd_data, there are missing values in the stratum column.')
    }

    if(design_val == "FFS" && 'TRUE' %in% is.na(cwd_data_val$trt_type)) {
      stop('For cwd_data, there are missing values in the trt_type column.')
    }

    # check column classes
    if(unit_val == "metric") {

      if(!is.numeric(cwd_data_val$load_1000s_Mg_ha)) {
        stop('For cwd_data, the load_1000s_Mg_ha column must be numeric.\n',
             'Currently, the column is class: ', class(cwd_data_val$load_1000s_Mg_ha))
      }

      if(!is.numeric(cwd_data_val$load_1000r_Mg_ha)) {
        stop('For cwd_data, the load_1000r_Mg_ha column must be numeric.\n',
             'Currently, the column is class: ', class(cwd_data_val$load_1000r_Mg_ha))
      }

      if(!is.numeric(cwd_data_val$load_cwd_Mg_ha)) {
        stop('For cwd_data, the load_cwd_Mg_ha column must be numeric.\n',
             'Currently, the column is class: ', class(cwd_data_val$load_cwd_Mg_ha))
      }

    } else if (unit_val == "imperial") {

      if(!is.numeric(cwd_data_val$load_1000s_ton_ac)) {
        stop('For cwd_data, the load_1000s_ton_ac column must be numeric.\n',
             'Currently, the column is class: ', class(cwd_data_val$load_1000s_ton_ac))
      }

      if(!is.numeric(cwd_data_val$load_1000r_ton_ac)) {
        stop('For cwd_data, the load_1000r_ton_ac column must be numeric.\n',
             'Currently, the column is class: ', class(cwd_data_val$load_1000r_ton_ac))
      }

      if(!is.numeric(cwd_data_val$load_cwd_ton_ac)) {
        stop('For cwd_data, the load_cwd_ton_ac column must be numeric.\n',
             'Currently, the column is class: ', class(cwd_data_val$load_cwd_ton_ac))
      }

    }

    if(!is.numeric(cwd_data_val$sc_length_1000s)) {
      stop('For cwd_data, the sc_length_1000s column must be numeric.\n',
           'Currently, the column is class: ', class(cwd_data_val$sc_length_1000s))
    }

    if(!is.numeric(cwd_data_val$sc_length_1000r)) {
      stop('For cwd_data, the sc_length_1000r column must be numeric.\n',
           'Currently, the column is class: ', class(cwd_data_val$sc_length_1000r))
    }

  }

}

################################################################
# function for merging the fwd and cwd dataframes
################################################################

MergeDfs <- function(fwd_df, cwd_df, design_type) {

  # Check for plot matches between fwd_data and cwd_data
  if(design_type == "SRS") {

    fwd_df$unq_id <- paste0(fwd_df$time,'_',fwd_df$site,'_',fwd_df$plot)
    cwd_df$unq_id <- paste0(cwd_df$time,'_',cwd_df$site,'_',cwd_df$plot)

  } else if (design_type == "STRS") {

    fwd_df$unq_id <- paste0(fwd_df$time,'_',fwd_df$site,'_',fwd_df$stratum,'_',fwd_df$plot)
    cwd_df$unq_id <- paste0(cwd_df$time,'_',cwd_df$site,'_',cwd_df$stratum,'_',cwd_df$plot)

  } else if (design_type == "FFS") {

    fwd_df$unq_id <- paste0(fwd_df$time,'_',fwd_df$trt_type,'_',fwd_df$site,'_',fwd_df$plot)
    cwd_df$unq_id <- paste0(cwd_df$time,'_',cwd_df$trt_type,'_',cwd_df$site,'_',cwd_df$plot)

  }

  if(!all(is.element(fwd_df$unq_id,cwd_df$unq_id)) ||
     !all(is.element(cwd_df$unq_id,fwd_df$unq_id))) {

    fwd_wo_cwd <- paste0(unique(fwd_df[!is.element(fwd_df$unq_id,cwd_df$unq_id), "unq_id"]), sep = " ")
    cwd_wo_fwd <- paste0(unique(cwd_df[!is.element(cwd_df$unq_id,fwd_df$unq_id), "unq_id"]), sep = " ")

    warning('fwd_data and cwd_data did not completely match!\n',
            'These plots are in "fwd_data" but do not have matches in "cwd_data": ', fwd_wo_cwd, '\n',
            'These plots are in "cwd_data" but do not have matches in "fwd_data": ', cwd_wo_fwd, '\n',
            'Plots without matches will NOT be dropped when the two dataframes are merged.\n',
            'NA values will be filled in as needed for a full merge.')

  }

  # merge fwd_data and cwd_data
  fwd_merge <- subset(fwd_df, select = -c(unq_id))
  cwd_merge <- subset(cwd_df, select = -c(unq_id))

  if(design_type == "SRS") {

    return_df <- merge(fwd_merge, cwd_merge, by = c("time", "site", "plot"), all = TRUE)

  } else if (design_type == "STRS") {

    return_df <- merge(fwd_merge, cwd_merge, by = c("time", "site", "stratum", "plot"), all = TRUE)

  } else if (design_type == "FFS") {

    return_df <- merge(fwd_merge, cwd_merge, by = c("time", "trt_type", "site", "plot"), all = TRUE)

  }

  return(return_df)

}


################################################################################
################################################################################
# Summary functions
################################################################################
################################################################################

################################################################
# function for simple random sampling
################################################################

SRS_CalcsSf <- function(data, input_type) {

  # create column to reduce looping
  data$ts <- paste0(data$time,'_',data$site)

  # create an empty dataframe to fill
  if(input_type == "type1") {

    compiled_df <- data.frame(matrix(nrow = 0, ncol = 8))
    colnames(compiled_df) <- c("time", "site", "avg_load_1h", "se_load_1h", "avg_load_10h", "se_load_10h", "avg_load_100h", "se_load_100h")

  } else if (input_type == "type2") {

    compiled_df <- data.frame(matrix(nrow = 0, ncol = 4))
    colnames(compiled_df) <- c("time", "site", "avg_load_1000h", "se_load_1000h")

  } else if (input_type == "type3") {

    compiled_df <- data.frame(matrix(nrow = 0, ncol = 10))
    colnames(compiled_df) <- c("time", "site", "avg_load_1h", "se_load_1h", "avg_load_10h", "se_load_10h", "avg_load_100h", "se_load_100h", "avg_load_1000h", "se_load_1000h")

  }

  # loop through each time:site
  sites <- unique(data$ts)

  for(m in sites) {

    all_plots <- subset(data, ts == m)

    compiled_df[nrow(compiled_df) + 1, ] <- NA
    l <- nrow(compiled_df)

    compiled_df$time[l] <- all_plots$time[1]
    compiled_df$site[l] <- all_plots$site[1]

    if(input_type == "type1" || input_type == "type3") {

      one <- WeightedValues(all_plots, "load_1h", "sc_length_1h")
      ten <- WeightedValues(all_plots, "load_10h", "sc_length_10h")
      hun <- WeightedValues(all_plots, "load_100h", "sc_length_100h")

      compiled_df$avg_load_1h[l] <- one[1]
      compiled_df$se_load_1h[l] <- one[2]
      compiled_df$avg_load_10h[l] <- ten[1]
      compiled_df$se_load_10h[l] <- ten[2]
      compiled_df$avg_load_100h[l] <- hun[1]
      compiled_df$se_load_100h[l] <- hun[2]

    }

    if(input_type == "type2" || input_type == "type3") {

      tho <- WeightedValues(all_plots, "load_1000h", "sc_length_1000h")

      compiled_df$avg_load_1000h[l] <- tho[1]
      compiled_df$se_load_1000h[l] <- tho[2]

    }

  }

  return(compiled_df)

}

################################################################
# function for stratified random sampling
################################################################

STRS_CalcsSf <- function(data, wh_data, input_type) {

  # create columns to reduce looping
  data$tss <- paste0(data$time,'_',data$site,'_',data$stratum)
  data$ts <- paste0(data$time,'_',data$site)

  # stratum values --------------------------------------------
  # create an empty dataframe to fill
  if(input_type == "type1") {

    str_df <- data.frame(matrix(nrow = 0, ncol = 10))
    colnames(str_df) <- c("ts", "time", "site", "stratum", "avg_load_1h", "se_load_1h", "avg_load_10h", "se_load_10h", "avg_load_100h", "se_load_100h")

  } else if (input_type == "type2") {

    str_df <- data.frame(matrix(nrow = 0, ncol = 6))
    colnames(str_df) <- c("ts", "time", "site", "stratum", "avg_load_1000h", "se_load_1000h")

  } else if (input_type == "type3") {

    str_df <- data.frame(matrix(nrow = 0, ncol = 12))
    colnames(str_df) <- c("ts", "time", "site", "stratum", "avg_load_1h", "se_load_1h", "avg_load_10h", "se_load_10h", "avg_load_100h", "se_load_100h", "avg_load_1000h", "se_load_1000h")

  }

  # loop through each time:site:stratum
  strats <- unique(data$tss)

  for(k in strats) {

    all_plots <- subset(data, tss == k)

    str_df[nrow(str_df) + 1, ] <- NA
    j <- nrow(str_df)

    str_df$ts[j] <- all_plots$ts[1]
    str_df$time[j] <- all_plots$time[1]
    str_df$site[j] <- all_plots$site[1]
    str_df$stratum[j] <- all_plots$stratum[1]

    if(input_type == "type1" || input_type == "type3") {

      one <- WeightedValues(all_plots, "load_1h", "sc_length_1h")
      ten <- WeightedValues(all_plots, "load_10h", "sc_length_10h")
      hun <- WeightedValues(all_plots, "load_100h", "sc_length_100h")

      str_df$avg_load_1h[j] <- one[1]
      str_df$se_load_1h[j] <- one[2]
      str_df$avg_load_10h[j] <- ten[1]
      str_df$se_load_10h[j] <- ten[2]
      str_df$avg_load_100h[j] <- hun[1]
      str_df$se_load_100h[j] <- hun[2]

    }

    if(input_type == "type2" || input_type == "type3") {

      tho <- WeightedValues(all_plots, "load_1000h", "sc_length_1000h")

      str_df$avg_load_1000h[j] <- tho[1]
      str_df$se_load_1000h[j] <- tho[2]

    }

  }

  # add column with stratum wights
  str_df_wh <- StratumWeights(str_df, wh_data)

  # overall values ----------------------------------------
  # create an empty dataframe to fill
  if(input_type == "type1") {

    overall_df <- data.frame(matrix(nrow = 0, ncol = 8))
    colnames(overall_df) <- c("time", "site", "avg_load_1h", "se_load_1h", "avg_load_10h", "se_load_10h", "avg_load_100h", "se_load_100h")

  } else if (input_type == "type2") {

    overall_df <- data.frame(matrix(nrow = 0, ncol = 4))
    colnames(overall_df) <- c("time", "site", "avg_load_1000h", "se_load_1000h")

  } else if (input_type == "type3") {

    overall_df <- data.frame(matrix(nrow = 0, ncol = 10))
    colnames(overall_df) <- c("time", "site", "avg_load_1h", "se_load_1h", "avg_load_10h", "se_load_10h", "avg_load_100h", "se_load_100h", "avg_load_1000h", "se_load_1000h")

  }

  # loop through each time:site
  sites <- unique(str_df_wh$ts)

  for(m in sites) {

    all_strats <- subset(str_df_wh, ts == m)

    overall_df[nrow(overall_df) + 1, ] <- NA
    l <- nrow(overall_df)

    overall_df$time[l] <- all_strats$time[1]
    overall_df$site[l] <- all_strats$site[1]

    if(input_type == "type1" || input_type == "type3") {

      one_st <- OverallValues(all_strats, "avg_load_1h", "se_load_1h")
      ten_st <- OverallValues(all_strats, "avg_load_10h", "se_load_10h")
      hun_st <- OverallValues(all_strats, "avg_load_100h", "se_load_100h")

      overall_df$avg_load_1h[l] <- one_st[1]
      overall_df$se_load_1h[l] <- one_st[2]
      overall_df$avg_load_10h[l] <- ten_st[1]
      overall_df$se_load_10h[l] <- ten_st[2]
      overall_df$avg_load_100h[l] <- hun_st[1]
      overall_df$se_load_100h[l] <- hun_st[2]

    }

    if(input_type == "type2" || input_type == "type3") {

      tho_st <- OverallValues(all_strats, "avg_load_1000h", "se_load_1000h")

      overall_df$avg_load_1000h[l] <- tho_st[1]
      overall_df$se_load_1000h[l] <- tho_st[2]

    }

  }

  # create output dataframe with correct columns
  str_return_df <- subset(str_df, select = -c(ts))

  # create return list & name list items
  return_list <- list(str_return_df, overall_df)
  names(return_list) <- c("stratum", "site")
  return(return_list)

}

################################################################
# function for FFS
################################################################

FFS_CalcsSf <- function(data, input_type) {

  # create columns to reduce looping
  data$tts <- paste0(data$time,'_',data$trt_type,'_',data$site)
  data$tt <- paste0(data$time,'_',data$trt_type)

  # compartment values --------------------------------------------
  # create an empty dataframe to fill
  if(input_type == "type1") {

    comp_df <- data.frame(matrix(nrow = 0, ncol = 10))
    colnames(comp_df) <- c("tt", "time", "trt_type", "site", "avg_load_1h", "se_load_1h", "avg_load_10h", "se_load_10h", "avg_load_100h", "se_load_100h")

  } else if (input_type == "type2") {

    comp_df <- data.frame(matrix(nrow = 0, ncol = 6))
    colnames(comp_df) <- c("tt", "time", "trt_type", "site", "avg_load_1000h", "se_load_1000h")

  } else if (input_type == "type3") {

    comp_df <- data.frame(matrix(nrow = 0, ncol = 12))
    colnames(comp_df) <- c("tt", "time", "trt_type", "site", "avg_load_1h", "se_load_1h", "avg_load_10h", "se_load_10h", "avg_load_100h", "se_load_100h", "avg_load_1000h", "se_load_1000h")

  }

  # loop through each time:treatment:compartment
  comps <- unique(data$tts)

  for(k in comps) {

    all_plots <- subset(data, tts == k)

    comp_df[nrow(comp_df) + 1, ] <- NA
    j <- nrow(comp_df)

    comp_df$tt[j] <- all_plots$tt[1]
    comp_df$time[j] <- all_plots$time[1]
    comp_df$trt_type[j] <- all_plots$trt_type[1]
    comp_df$site[j] <- all_plots$site[1]

    if(input_type == "type1" || input_type == "type3") {

      one <- WeightedValues(all_plots, "load_1h", "sc_length_1h")
      ten <- WeightedValues(all_plots, "load_10h", "sc_length_10h")
      hun <- WeightedValues(all_plots, "load_100h", "sc_length_100h")

      comp_df$avg_load_1h[j] <- one[1]
      comp_df$se_load_1h[j] <- one[2]
      comp_df$avg_load_10h[j] <- ten[1]
      comp_df$se_load_10h[j] <- ten[2]
      comp_df$avg_load_100h[j] <- hun[1]
      comp_df$se_load_100h[j] <- hun[2]

    }

    if(input_type == "type2" || input_type == "type3") {

      tho <- WeightedValues(all_plots, "load_1000h", "sc_length_1000h")

      comp_df$avg_load_1000h[j] <- tho[1]
      comp_df$se_load_1000h[j] <- tho[2]

    }

  }

  # treatment type values -------------------------------------
  # create an empty dataframe to fill
  if(input_type == "type1") {

    type_df <- data.frame(matrix(nrow = 0, ncol = 8))
    colnames(type_df) <- c("time", "trt_type", "avg_load_1h", "se_load_1h", "avg_load_10h", "se_load_10h", "avg_load_100h", "se_load_100h")

  } else if (input_type == "type2") {

    type_df <- data.frame(matrix(nrow = 0, ncol = 4))
    colnames(type_df) <- c("time", "trt_type", "avg_load_1000h", "se_load_1000h")

  } else if (input_type == "type3") {

    type_df <- data.frame(matrix(nrow = 0, ncol = 10))
    colnames(type_df) <- c("time", "trt_type", "avg_load_1h", "se_load_1h", "avg_load_10h", "se_load_10h", "avg_load_100h", "se_load_100h", "avg_load_1000h", "se_load_1000h")

  }

  # loop through each time:treatment
  treats <- unique(comp_df$tt)

  for(m in treats) {

    all_comps <- subset(comp_df, tt == m)

    type_df[nrow(type_df) + 1, ] <- NA
    l <- nrow(type_df)

    type_df$time[l] <- all_comps$time[1]
    type_df$trt_type[l] <- all_comps$trt_type[1]

    if(input_type == "type1" || input_type == "type3") {

      one_cp <- StratumValues(all_comps, "avg_load_1h")
      ten_cp <- StratumValues(all_comps, "avg_load_10h")
      hun_cp <- StratumValues(all_comps, "avg_load_100h")

      type_df$avg_load_1h[l] <- one_cp[1]
      type_df$se_load_1h[l] <- one_cp[2]
      type_df$avg_load_10h[l] <- ten_cp[1]
      type_df$se_load_10h[l] <- ten_cp[2]
      type_df$avg_load_100h[l] <- hun_cp[1]
      type_df$se_load_100h[l] <- hun_cp[2]

    }

    if(input_type == "type2" || input_type == "type3") {

      tho_cp <- StratumValues(all_comps, "avg_load_1000h")

      type_df$avg_load_1000h[l] <- tho_cp[1]
      type_df$se_load_1000h[l] <- tho_cp[2]

    }

  }

  # create output dataframe with correct columns
  comp_return_df <- subset(comp_df, select = -c(tt))

  # create return list & name list items
  return_list <- list(comp_return_df, type_df)
  names(return_list) <- c("site", "trt_type")
  return(return_list)

}

################################################################
# function for calculating weighted values
################################################################

WeightedValues <- function(df, load, sc_length) {

  # number of transects
  df$n_col <- ifelse(is.na(df[[load]]),0,1)
  n <- sum(df$n_col)

  # transect weight
  sum_Li <- sum(df[[sc_length]], na.rm = TRUE)
  df$wi <- df[[sc_length]]/(sum_Li/n)
  df$wi_yi <- df$wi*df[[load]]

  if(n == 0) {

    # mean and standard error
    y_bar_w <- NA
    s_ybar <- NA

  } else if(n == 1) {

    # mean
    sum_wi_yi <- sum(df$wi_yi, na.rm = TRUE)
    ybar_w <- sum_wi_yi/n

    # standard error
    s_ybar <- NA

  } else {

    # mean
    sum_wi_yi <- sum(df$wi_yi, na.rm = TRUE)
    ybar_w <- sum_wi_yi/n

    # standard error
    df$wi_yi_ybarw <- df$wi*(df[[load]] - ybar_w)^2
    sum_top <- sum(df$wi_yi_ybarw, na.rm = TRUE)
    s_ybar <- sqrt(sum_top/(n*(n-1)))

  }

  # save values into a vector
  return_vec <- c(ybar_w, s_ybar)
  return(return_vec)

}
