
test_that("Properly formatted data frames throw no errors, warnings, or messages", {

  # STRS ------------------------------------------
  expect_no_error(ValidatePlotData(data_check = g_strs,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1))

  expect_no_error(ValidatePlotData(data_check = g_strs,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_2))

  expect_no_warning(ValidatePlotData(data_check = g_strs,
                                     design_check = "STRS",
                                     wt_data_check = g_strs_wh_1))

  expect_no_warning(ValidatePlotData(data_check = g_strs,
                                     design_check = "STRS",
                                     wt_data_check = g_strs_wh_2))

  expect_no_message(ValidatePlotData(data_check = g_strs,
                                     design_check = "STRS",
                                     wt_data_check = g_strs_wh_1))

  expect_no_message(ValidatePlotData(data_check = g_strs,
                                     design_check = "STRS",
                                     wt_data_check = g_strs_wh_2))

  # SRS ---------------------------------------------
  expect_no_error(ValidatePlotData(data_check = g_srs,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed"))

  expect_no_warning(ValidatePlotData(data_check = g_srs,
                                     design_check = "SRS",
                                     wt_data_check = "not_needed"))

  expect_no_message(ValidatePlotData(data_check = g_srs,
                                     design_check = "SRS",
                                     wt_data_check = "not_needed"))

  # FFS ---------------------------------------------
  expect_no_error(ValidatePlotData(data_check = g_ffs,
                                   design_check = "FFS",
                                   wt_data_check = "not_needed"))

  expect_no_warning(ValidatePlotData(data_check = g_ffs,
                                     design_check = "FFS",
                                     wt_data_check = "not_needed"))

  expect_no_message(ValidatePlotData(data_check = g_ffs,
                                     design_check = "FFS",
                                     wt_data_check = "not_needed"))

})


test_that("Invalid options throw an error", {

  expect_error(ValidatePlotData(data_check = g_strs,
                                   design_check = "STRSS",
                                   wt_data_check = g_strs_wh_1),
               'The "design" parameter must be set to "SRS", "STRS", or "FFS".')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = "not_needed"),
               'For a stratified random sampling - STRS - design, you must supply wt_data.\nYou left wt_data as the default "not_needed".')

  expect_error(ValidatePlotData(data_check = g_srs,
                                design_check = "SRS",
                                wt_data_check = g_strs_wh_1),
               'For a simple random sampling - SRS - design, you do not need to supply wt_data.\nFor SRS, you should leave wt_data as the default "not_needed".')

  expect_error(ValidatePlotData(data_check = g_ffs,
                                design_check = "FFS",
                                wt_data_check = g_strs_wh_1),
               'For a Fire and Fire Surrogate - FFS - design, you do not need to supply wt_data.\nFor FFS, you should leave wt_data as the default "not_needed".')

})


test_that("Missing columns and missing id information throws an error", {

  expect_error(ValidatePlotData(data_check = b_strs_1,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1),
               'The data input is missing the required "time" column.')

  expect_error(ValidatePlotData(data_check = b_strs_2,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1),
               'The data input is missing the required "site" column.')

  expect_error(ValidatePlotData(data_check = b_strs_3,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1),
               'The data input is missing the required "stratum" column.')

  expect_error(ValidatePlotData(data_check = b_strs_4,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1),
               'The data input is missing the required "plot" column.')

  expect_error(ValidatePlotData(data_check = b_strs_5,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1),
               'For data, there are missing values in the time column.')

  expect_error(ValidatePlotData(data_check = b_strs_6,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1),
               'For data, there are missing values in the site column.')

  expect_error(ValidatePlotData(data_check = b_strs_7,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1),
               'For data, there are missing values in the stratum column.')

  expect_error(ValidatePlotData(data_check = b_strs_8,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1),
               'For data, there are missing values in the plot column.')

  expect_error(ValidatePlotData(data_check = b_ffs_1,
                                design_check = "FFS",
                                wt_data_check = "not_needed"),
               'The data input is missing the required "trt_type" column.')

  expect_error(ValidatePlotData(data_check = b_ffs_2,
                                design_check = "FFS",
                                wt_data_check = "not_needed"),
               'For data, there are missing values in the trt_type column.')

})


test_that("Wrong column class throws an error", {

  # STRS -----------------------------------------------
  expect_error(ValidatePlotData(data_check = b_strs_9,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1),
               'Other than the necessary ID columns - such as time, site, plot -\nall other columns must be numeric. Check the columns in your data input.')

  expect_error(ValidatePlotData(data_check = b_strs_sp_2,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1),
               'Other than the necessary ID columns - such as time, site, plot -\nall other columns must be numeric. Check the columns in your data input.')

  # SRS -------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_srs_1,
                                design_check = "SRS",
                                wt_data_check = "not_needed"),
               'Other than the necessary ID columns - such as time, site, plot -\nall other columns must be numeric. Check the columns in your data input.')

  expect_error(ValidatePlotData(data_check = b_srs_sp_1,
                                design_check = "SRS",
                                wt_data_check = "not_needed"),
               'Other than the necessary ID columns - such as time, site, plot -\nall other columns must be numeric. Check the columns in your data input.')

  # FFS -------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_ffs_3,
                                design_check = "FFS",
                                wt_data_check = "not_needed"),
               'Other than the necessary ID columns - such as time, site, plot -\nall other columns must be numeric. Check the columns in your data input.')

  expect_error(ValidatePlotData(data_check = b_ffs_sp_1,
                                design_check = "FFS",
                                wt_data_check = "not_needed"),
               'Other than the necessary ID columns - such as time, site, plot -\nall other columns must be numeric. Check the columns in your data input.')

})


test_that("Repeat observations throw an error", {

  # STRS -------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_strs_10,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1),
               'For data, there are repeat time:site:stratum:plot observations.\nThere should only be one observation/row for an individual plot at a specific time:site:stratum.\nInvestigate the following time:site:stratum:plot combinations: pre_SEKI_1_1')

  expect_error(ValidatePlotData(data_check = b_strs_sp_3,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1),
               'For data, there are repeat time:site:stratum:plot:species observations.\nThere should only be one observation/row for an individual species at a specific time:site:stratum:plot.\nInvestigate the following time:site:stratum:plot:species combinations: pre_SEKI_1_1_ABCO')

  # SRS ---------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_srs_2,
                                design_check = "SRS",
                                wt_data_check = "not_needed"),
               'For data, there are repeat time:site:plot observations.\nThere should only be one observation/row for an individual plot at a specific time:site.\nInvestigate the following time:site:plot combinations: pre_SEKI_1')

  expect_error(ValidatePlotData(data_check = b_srs_sp_2,
                                design_check = "SRS",
                                wt_data_check = "not_needed"),
               'For data, there are repeat time:site:plot:species observations.\nThere should only be one observation/row for an individual species at a specific time:site:plot.\nInvestigate the following time:site:plot:species combinations: pre_SEKI_1_ABCO')

  # FFS ---------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_ffs_4,
                                design_check = "FFS",
                                wt_data_check = "not_needed"),
               'For data, there are repeat time:trt_type:site:plot observations.\nThere should only be one observation/row for an individual plot at a specific time:trt_type:site.\nInvestigate the following time:trt_type:site:plot combinations: pre_burn_360_1')

  expect_error(ValidatePlotData(data_check = b_ffs_sp_2,
                                design_check = "FFS",
                                wt_data_check = "not_needed"),
               'For data, there are repeat time:trt_type:site:plot:species observations.\nThere should only be one observation/row for an individual species at a specific time:trt_type:site:plot.\nInvestigate the following time:trt_type:site:plot:species combinations: pre_1_360_1_ABCO')

  })


test_that("Missing species throw an error", {

  # STRS --------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_strs_sp_1,
                                design_check = "STRS",
                                wt_data_check = g_strs_wh_1),
               'All species must be represented in each plot.\nUnique species: ABCO   PSME   \nPlots that do not have all unique species represented: pre_SEKI_1_1')

  # SRS ---------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_srs_sp_3,
                                design_check = "SRS",
                                wt_data_check = "not_needed"),
               'All species must be represented in each plot.\nUnique species: ABCO   PSME   \nPlots that do not have all unique species represented: pre_SEKI_1')

  # FFS ---------------------------------------------------
  expect_error(ValidatePlotData(data_check = b_ffs_sp_3,
                                design_check = "FFS",
                                wt_data_check = "not_needed"),
               'All species must be represented in each plot.\nUnique species: ABCO   PSME   \nPlots that do not have all unique species represented: pre_1_360_1')

})


test_that("Weights dataframe handling works", {

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_1),
               'The wt_data input is missing the required "site" column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_2),
               'The wt_data input is missing the required "stratum" column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_3),
               'The wt_data input is missing the required "wh" column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_4),
               'For wt_data, the wh column must be numeric.\nThe wh column is currently class: character')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_5),
               'For wt_data, there are missing values in the time column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_6),
               'For wt_data, there are missing values in the site column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_7),
               'For wt_data, there are missing values in the stratum column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_8),
               'For wt_data, there are missing values in the wh column.')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_9),
               'data and wt_data did not completely match!\nThese strata are in data but do not have a match in wt_data: SEKI_2 \nThese strata are in wt_data but do not have a match in data: SEKI_3')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_10),
               'data and wt_data did not completely match!\nThese strata are in data but do not have a match in wt_data: pre_SEKI_2 \nThese strata are in wt_data but do not have a match in data: pre_SEKI_3')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_11),
               'For wt_data, there are repeat site:stratum values.\nEach row should correspond to a unique site:stratum.\nInvestigate the following site:stratum combinations: SEKI_1')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_12),
               'For wt_data, there are repeat time:site:stratum values.\nEach row should correspond to a unique time:site:stratum.\nInvestigate the following time:site:stratum combinations: pre_SEKI_1')

  expect_error(ValidatePlotData(data_check = g_strs,
                                design_check = "STRS",
                                wt_data_check = b_strs_wh_13),
               'For each site, or time:site, the stratum weights must add to 1.\nSites, or time:sites, with stratum weights that do not sum to 1: SEKI')

})


test_that("Final column classes are as expected", {

  # STRS ------------------------------------------------
  strs_trial <- ValidatePlotData(data_check = g_strs_sp,
                                 design_check = "STRS",
                                 wt_data_check = g_strs_wh_1)

  expect_equal(class(strs_trial$stratum), "character")

  # SRS -------------------------------------------------
  srs_trial <- ValidatePlotData(data_check = g_srs_sp_class,
                                design_check = "SRS",
                                wt_data_check = "not_needed")

  expect_equal(class(srs_trial$time), "character")
  expect_equal(class(srs_trial$site), "character")
  expect_equal(class(srs_trial$plot), "character")
  expect_equal(class(srs_trial$species), "character")

  # FFS -------------------------------------------------
  ffs_trial <- ValidatePlotData(data_check = g_ffs_sp,
                                design_check = "FFS",
                                wt_data_check = "not_needed")

  expect_equal(class(ffs_trial$trt_type), "character")

})
