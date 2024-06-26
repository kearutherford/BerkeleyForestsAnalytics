
test_that("Properly formatted data frames throw no errors, warnings, or messages", {

  # STRS ------------------------------------------
  expect_no_error(ValidatePlotData(data_check = g_strs,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed"))

  expect_no_error(ValidatePlotData(data_check = g_strs,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_2,
                                   fpc_data_check = "not_needed"))

  expect_no_error(ValidatePlotData(data_check = g_strs,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = g_strs_fpc_1))

  expect_no_error(ValidatePlotData(data_check = g_strs,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = g_strs_fpc_2))


  expect_no_warning(ValidatePlotData(data_check = g_strs,
                                     design_check = "STRS",
                                     wt_data_check = g_strs_wh_1,
                                     fpc_data_check = "not_needed"))

  expect_no_warning(ValidatePlotData(data_check = g_strs,
                                     design_check = "STRS",
                                     wt_data_check = g_strs_wh_2,
                                     fpc_data_check = "not_needed"))

  expect_no_warning(ValidatePlotData(data_check = g_strs,
                                     design_check = "STRS",
                                     wt_data_check = g_strs_wh_1,
                                     fpc_data_check = g_strs_fpc_1))

  expect_no_warning(ValidatePlotData(data_check = g_strs,
                                     design_check = "STRS",
                                     wt_data_check = g_strs_wh_1,
                                     fpc_data_check = g_strs_fpc_2))


  expect_no_message(ValidatePlotData(data_check = g_strs,
                                     design_check = "STRS",
                                     wt_data_check = g_strs_wh_1,
                                     fpc_data_check = "not_needed"))

  expect_no_message(ValidatePlotData(data_check = g_strs,
                                     design_check = "STRS",
                                     wt_data_check = g_strs_wh_2,
                                     fpc_data_check = "not_needed"))

  expect_no_message(ValidatePlotData(data_check = g_strs,
                                     design_check = "STRS",
                                     wt_data_check = g_strs_wh_1,
                                     fpc_data_check = g_strs_fpc_1))

  expect_no_message(ValidatePlotData(data_check = g_strs,
                                     design_check = "STRS",
                                     wt_data_check = g_strs_wh_1,
                                     fpc_data_check = g_strs_fpc_2))

  # SRS ---------------------------------------------
  expect_no_error(ValidatePlotData(data_check = g_srs,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed"))

  expect_no_error(ValidatePlotData(data_check = g_srs,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = g_srs_fpc_1))

  expect_no_error(ValidatePlotData(data_check = g_srs,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = g_srs_fpc_2))


  expect_no_warning(ValidatePlotData(data_check = g_srs,
                                     design_check = "SRS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = "not_needed"))

  expect_no_warning(ValidatePlotData(data_check = g_srs,
                                     design_check = "SRS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = g_srs_fpc_1))

  expect_no_warning(ValidatePlotData(data_check = g_srs,
                                     design_check = "SRS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = g_srs_fpc_2))


  expect_no_message(ValidatePlotData(data_check = g_srs,
                                     design_check = "SRS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = "not_needed"))

  expect_no_message(ValidatePlotData(data_check = g_srs,
                                     design_check = "SRS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = g_srs_fpc_1))

  expect_no_message(ValidatePlotData(data_check = g_srs,
                                     design_check = "SRS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = g_srs_fpc_2))


  # FFS ---------------------------------------------
  expect_no_error(ValidatePlotData(data_check = g_ffs,
                                   design_check = "FFS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed"))

  expect_no_error(ValidatePlotData(data_check = g_ffs,
                                   design_check = "FFS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = g_ffs_fpc_1))

  expect_no_error(ValidatePlotData(data_check = g_ffs,
                                   design_check = "FFS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = g_ffs_fpc_2))


  expect_no_warning(ValidatePlotData(data_check = g_ffs,
                                     design_check = "FFS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = "not_needed"))

  expect_no_warning(ValidatePlotData(data_check = g_ffs,
                                     design_check = "FFS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = g_ffs_fpc_1))

  expect_no_warning(ValidatePlotData(data_check = g_ffs,
                                     design_check = "FFS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = g_ffs_fpc_2))


  expect_no_message(ValidatePlotData(data_check = g_ffs,
                                     design_check = "FFS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = "not_needed"))

  expect_no_message(ValidatePlotData(data_check = g_ffs,
                                     design_check = "FFS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = g_ffs_fpc_1))

  expect_no_message(ValidatePlotData(data_check = g_ffs,
                                     design_check = "FFS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = g_ffs_fpc_2))


})


test_that("Invalid options throw an error", {

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRSS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'The "design" parameter must be set to "SRS", "STRS", or "FFS".')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'For a stratified random sampling - STRS - design, you must supply wt_data.\nYou left wt_data as the default "not_needed".')

  expect_error(ValidatePlotData(data_check = g_srs,
                                design_check = "SRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'For a simple random sampling - SRS - design, you do not need to supply wt_data.\nFor SRS, you should leave wt_data as the default "not_needed".')

  expect_error(ValidatePlotData(data_check = g_ffs,
                                design_check = "FFS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'For a Fire and Fire Surrogate - FFS - design, you do not need to supply wt_data.\nFor FFS, you should leave wt_data as the default "not_needed".')

})


test_that("Missing columns and missing id information throws an error", {

  expect_error(ValidatePlotData(data_check = b_strs_1,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'The data input is missing the required "time" column.')

  expect_error(ValidatePlotData(data_check = b_strs_2,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'The data input is missing the required "site" column.')

  expect_error(ValidatePlotData(data_check = b_strs_3,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'The data input is missing the required "stratum" column.')

  expect_error(ValidatePlotData(data_check = b_strs_4,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'The data input is missing the required "plot" column.')

  expect_error(ValidatePlotData(data_check = b_strs_5,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'For data, there are missing values in the time column.')

  expect_error(ValidatePlotData(data_check = b_strs_6,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'For data, there are missing values in the site column.')

  expect_error(ValidatePlotData(data_check = b_strs_7,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'For data, there are missing values in the stratum column.')

  expect_error(ValidatePlotData(data_check = b_strs_8,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'For data, there are missing values in the plot column.')

  expect_error(ValidatePlotData(data_check = b_ffs_1,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'The data input is missing the required "trt_type" column.')

  expect_error(ValidatePlotData(data_check = b_ffs_2,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'For data, there are missing values in the trt_type column.')

})


test_that("Wrong column class throws an error (for character variables)", {

  expect_error(ValidatePlotData(data_check = b_srs_sp_4,
                                design_check = "SRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'For data, time must be a character variable.\nThe time column is currently class: factor')

  expect_error(ValidatePlotData(data_check = b_srs_sp_5,
                                design_check = "SRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'For data, site must be a character variable.\nThe site column is currently class: factor')

  expect_error(ValidatePlotData(data_check = b_srs_sp_6,
                                design_check = "SRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'For data, plot must be a character variable.\nThe plot column is currently class: numeric')

  expect_error(ValidatePlotData(data_check = b_srs_sp_7,
                                design_check = "SRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'For data, species must be a character variable.\nThe species column is currently class: numeric')

  expect_error(ValidatePlotData(data_check = b_strs_11,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'For data, stratum must be a character variable.\nThe stratum column is currently class: numeric')

  expect_error(ValidatePlotData(data_check = b_ffs_5,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'For data, trt_type must be a character variable.\nThe trt_type column is currently class: factor')

})


test_that("Wrong column class throws an error (for numeric variables)", {

  # STRS -----------------------------------------------
  expect_error(ValidatePlotData(data_check = b_strs_9,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'Other than the necessary ID columns - such as time, site, plot -\nall other columns must be numeric. Check the columns in your data input.')

  expect_error(ValidatePlotData(data_check = b_strs_sp_2,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'Other than the necessary ID columns - such as time, site, plot -\nall other columns must be numeric. Check the columns in your data input.')

  # SRS -------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_srs_1,
                                design_check = "SRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'Other than the necessary ID columns - such as time, site, plot -\nall other columns must be numeric. Check the columns in your data input.')

  expect_error(ValidatePlotData(data_check = b_srs_sp_1,
                                design_check = "SRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'Other than the necessary ID columns - such as time, site, plot -\nall other columns must be numeric. Check the columns in your data input.')

  # FFS -------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_ffs_3,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'Other than the necessary ID columns - such as time, site, plot -\nall other columns must be numeric. Check the columns in your data input.')

  expect_error(ValidatePlotData(data_check = b_ffs_sp_1,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'Other than the necessary ID columns - such as time, site, plot -\nall other columns must be numeric. Check the columns in your data input.')

})


test_that("Repeat observations throw an error", {

  # STRS -------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_strs_10,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'For data, there are repeat time:site:stratum:plot observations.\nThere should only be one observation/row for an individual plot at a specific time:site:stratum.\nInvestigate the following time:site:stratum:plot combinations: pre_SEKI_1_1')

  expect_error(ValidatePlotData(data_check = b_strs_sp_3,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'For data, there are repeat time:site:stratum:plot:species observations.\nThere should only be one observation/row for an individual species at a specific time:site:stratum:plot.\nInvestigate the following time:site:stratum:plot:species combinations: pre_SEKI_1_1_ABCO')

  # SRS ---------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_srs_2,
                                design_check = "SRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'For data, there are repeat time:site:plot observations.\nThere should only be one observation/row for an individual plot at a specific time:site.\nInvestigate the following time:site:plot combinations: pre_SEKI_1')

  expect_error(ValidatePlotData(data_check = b_srs_sp_2,
                                design_check = "SRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'For data, there are repeat time:site:plot:species observations.\nThere should only be one observation/row for an individual species at a specific time:site:plot.\nInvestigate the following time:site:plot:species combinations: pre_SEKI_1_ABCO')

  # FFS ---------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_ffs_4,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'For data, there are repeat time:trt_type:site:plot observations.\nThere should only be one observation/row for an individual plot at a specific time:trt_type:site.\nInvestigate the following time:trt_type:site:plot combinations: pre_burn_360_1')

  expect_error(ValidatePlotData(data_check = b_ffs_sp_2,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'For data, there are repeat time:trt_type:site:plot:species observations.\nThere should only be one observation/row for an individual species at a specific time:trt_type:site:plot.\nInvestigate the following time:trt_type:site:plot:species combinations: pre_1_360_1_ABCO')

  })


test_that("Missing species throw an error", {

  # STRS --------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_strs_sp_1,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'All species must be represented in each plot.\nUnique species: ABCO   PSME   \nPlots that do not have all unique species represented: pre_SEKI_1_1')

  # SRS ---------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_srs_sp_3,
                                design_check = "SRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'All species must be represented in each plot.\nUnique species: ABCO   PSME   \nPlots that do not have all unique species represented: pre_SEKI_1')

  # FFS ---------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_ffs_sp_3,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = "not_needed"),
               'All species must be represented in each plot.\nUnique species: ABCO   PSME   \nPlots that do not have all unique species represented: pre_1_360_1')

})


test_that("Weights dataframe handling works", {

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_1,
                                fpc_data_check = "not_needed"),
               'The wt_data input is missing the required "site" column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_2,
                                fpc_data_check = "not_needed"),
               'The wt_data input is missing the required "stratum" column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_3,
                                fpc_data_check = "not_needed"),
               'The wt_data input is missing the required "wh" column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_14,
                                fpc_data_check = "not_needed"),
               'For wt_data, time must be a character variable.\nThe time column is currently class: factor')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_15,
                                fpc_data_check = "not_needed"),
               'For wt_data, site must be a character variable.\nThe site column is currently class: numeric')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_16,
                                fpc_data_check = "not_needed"),
               'For wt_data, stratum must be a character variable.\nThe stratum column is currently class: numeric')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_4,
                                fpc_data_check = "not_needed"),
               'For wt_data, the wh column must be numeric.\nThe wh column is currently class: character')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_5,
                                fpc_data_check = "not_needed"),
               'For wt_data, there are missing values in the time column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_6,
                                fpc_data_check = "not_needed"),
               'For wt_data, there are missing values in the site column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_7,
                                fpc_data_check = "not_needed"),
               'For wt_data, there are missing values in the stratum column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_8,
                                fpc_data_check = "not_needed"),
               'For wt_data, there are missing values in the wh column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_9,
                                fpc_data_check = "not_needed"),
               'data and wt_data did not completely match!\nThese strata are in data but do not have a match in wt_data: SEKI_2 \nThese strata are in wt_data but do not have a match in data: SEKI_3')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_10,
                                fpc_data_check = "not_needed"),
               'data and wt_data did not completely match!\nThese strata are in data but do not have a match in wt_data: pre_SEKI_2 \nThese strata are in wt_data but do not have a match in data: pre_SEKI_3')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_11,
                                fpc_data_check = "not_needed"),
               'For wt_data, there are repeat site:stratum values.\nEach row should correspond to a unique site:stratum.\nInvestigate the following site:stratum combinations: SEKI_1')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_12,
                                fpc_data_check = "not_needed"),
               'For wt_data, there are repeat time:site:stratum values.\nEach row should correspond to a unique time:site:stratum.\nInvestigate the following time:site:stratum combinations: pre_SEKI_1')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_13,
                                fpc_data_check = "not_needed"),
               'For each site, or time:site, the stratum weights must add to 1.\nSites, or time:sites, with stratum weights that do not sum to 1: SEKI')

})


test_that("FPC dataframe handling works", {

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_1),
               'The fpc_data input is missing the required "site" column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_2),
               'The fpc_data input is missing the required "stratum" column.\nThis column is required when you have a "STRS" design.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_3),
               'The fpc_data input is missing the required "N" column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_4),
               'The fpc_data input is missing the required "n" column.')

  expect_error(ValidatePlotData(data_check = g_ffs,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = b_ffs_fpc_1),
               'The fpc_data input is missing the required "trt_type" column.\nThis column is required when you have a "FFS" design.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_17),
               'For fpc_data, time must be a character variable.\nThe time column is currently class: factor')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_18),
               'For fpc_data, site must be a character variable.\nThe site column is currently class: factor')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_19),
               'For fpc_data, stratum must be a character variable.\nThe stratum column is currently class: numeric')

  expect_error(ValidatePlotData(data_check = g_ffs,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = b_ffs_fpc_7),
               'For fpc_data, trt_type must be a character variable.\nThe trt_type column is currently class: numeric')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_5),
               'For fpc_data, the N column must be numeric.\nThe N column is currently class: character')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_6),
               'For fpc_data, the n column must be numeric.\nThe n column is currently class: character')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_7),
               'For fpc_data, there are missing values in the time column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_8),
               'For fpc_data, there are missing values in the site column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_9),
               'For fpc_data, there are missing values in the stratum column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_10),
               'For fpc_data, there are missing values in the N column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_11),
               'For fpc_data, there are missing values in the n column.')

  expect_error(ValidatePlotData(data_check = g_ffs,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = b_ffs_fpc_2),
               'For fpc_data, there are missing values in the trt_type column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_12),
               'data and fpc_data did not completely match!\nIn data but does not have a match in fpc_data: pre_SEKI_2 \nIn fpc_data but does not have a match in data: pre_SEKI_3')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_13),
               'data and fpc_data did not completely match!\nIn data but does not have a match in fpc_data: SEKI_2 \nIn fpc_data but does not have a match in data: SEKI_3')

  expect_error(ValidatePlotData(data_check = g_srs,
                                design_check = "SRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = b_srs_fpc_1),
               'data and fpc_data did not completely match!\nIn data but does not have a match in fpc_data: pre_SEKI \nIn fpc_data but does not have a match in data: pre_YOPI')

  expect_error(ValidatePlotData(data_check = g_srs,
                                design_check = "SRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = b_srs_fpc_2),
               'data and fpc_data did not completely match!\nIn data but does not have a match in fpc_data: SEKI \nIn fpc_data but does not have a match in data: YOPI')

  expect_error(ValidatePlotData(data_check = g_ffs,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = b_ffs_fpc_3),
               'data and fpc_data did not completely match!\nIn data but does not have a match in fpc_data: pre_burn_360 \nIn fpc_data but does not have a match in data: pre_burn_3600')

  expect_error(ValidatePlotData(data_check = g_ffs,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = b_ffs_fpc_4),
               'data and fpc_data did not completely match!\nIn data but does not have a match in fpc_data: burn_360 \nIn fpc_data but does not have a match in data: burn_3600')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_14),
               'For fpc_data, there are repeat time:site:stratum values.\nEach row should correspond to a unique time:site:stratum.\nInvestigate the following time:site:stratum combinations: post_YOMI_2')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_15),
               'For fpc_data, there are repeat site:stratum values.\nEach row should correspond to a unique site:stratum.\nInvestigate the following site:stratum combinations: YOMI_2')

  expect_error(ValidatePlotData(data_check = g_srs,
                                design_check = "SRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = b_srs_fpc_3),
               'For fpc_data, there are repeat time:site values.\nEach row should correspond to a unique time:site.\nInvestigate the following time:site combinations: post_YOMI')

  expect_error(ValidatePlotData(data_check = g_srs,
                                design_check = "SRS",
                                wt_data_check = "not_needed",
                                fpc_data_check = b_srs_fpc_4),
               'For fpc_data, there are repeat site values.\nEach row should correspond to a unique site.\nInvestigate the following site combinations: YOMI')

  expect_error(ValidatePlotData(data_check = g_ffs,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = b_ffs_fpc_5),
               'For fpc_data, there are repeat time:trt_type:site values.\nEach row should correspond to a unique time:trt_type:site.\nInvestigate the following time:trt_type:site combinations: post_mech_530')

  expect_error(ValidatePlotData(data_check = g_ffs,
                                design_check = "FFS",
                                wt_data_check = "not_needed",
                                fpc_data_check = b_ffs_fpc_6),
               'For fpc_data, there are repeat trt_type:site values.\nEach row should correspond to a unique trt_type:site.\nInvestigate the following trt_type:site combinations: mech_530')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1,
                                fpc_data_check = b_strs_fpc_16),
               'For fpc_data, there are cases where N < n.\nN must be >= n.')

})

