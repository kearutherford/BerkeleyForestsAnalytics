
test_that("Properly formatted data frames throw no error, warnings, or messages", {

  expect_no_error(ValidateCWD(fuel_data_val = good_cwd_m,
                              units_val = "metric",
                              sum_val = "no"))

  expect_no_warning(ValidateCWD(fuel_data_val = good_cwd_m,
                                units_val = "metric",
                                sum_val = "no"))

  expect_no_message(ValidateCWD(fuel_data_val = good_cwd_m,
                                units_val = "metric",
                                sum_val = "no"))

})


test_that("Invalid settings throw an error", {

  expect_error(ValidateCWD(fuel_data_val = good_cwd_m,
                           units_val = "metricc",
                           sum_val = "no"),
               'The "units" parameter must be set to either "metric" or "imperial".')

  expect_error(ValidateCWD(fuel_data_val = good_cwd_m,
                           units_val = "metric",
                           sum_val = "noo"),
               'The "summed" parameter must be set to either "no" or "yes".')

})


test_that("Dataframe has expected column names", {

  expect_named(ValidateCWD(fuel_data_val = good_cwd_m,
                           units_val = "metric",
                           sum_val = "no"),
               c("time", "site", "plot", "transect", "length_1000h", "slope", "ssd_S", "ssd_R"))

  expect_named(ValidateCWD(fuel_data_val = good_cwd_sum,
                           units_val = "metric",
                           sum_val = "yes"),
               c("time", "site", "plot", "transect", "length_1000h", "slope", "ssd_S", "ssd_R"))

})


test_that("Missing columns throw an error", {

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_1,
                           units_val = "metric",
                           sum_val = "no"),
               'fuel_data is missing necessary columns!\nWhen the "summed" parameter is set to "no" fuel_data must include:\ntime, site, plot, transect, length_1000h, diameter, and status.')

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_sum1,
                           units_val = "metric",
                           sum_val = "yes"),
               'fuel_data is missing necessary columns!\nWhen the "summed" parameter is set to "yes" fuel_data must include:\ntime, site, plot, transect, length_1000h, ssd_S, and ssd_R.')

  expect_warning(ValidateCWD(fuel_data_val = bad_cwd_2,
                             units_val = "metric",
                             sum_val = "no"),
                 'slope was not provided. The slope correction factor will be set to 1, indicating no slope.')

})


test_that("Missing id information throws an error", {

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_3,
                           units_val = "metric",
                           sum_val = "no"),
               'For fuel_data, there are missing values in the time column.')

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_4,
                           units_val = "metric",
                           sum_val = "no"),
               'For fuel_data, there are missing values in the site column.')

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_5,
                           units_val = "metric",
                           sum_val = "no"),
               'For fuel_data, there are missing values in the plot column.')

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_6,
                           units_val = "metric",
                           sum_val = "no"),
               'For fuel_data, there are missing values in the transect column.')

})


test_that("Transect handling works", {

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_7,
                           units_val = "metric",
                           sum_val = "no"),
               'For fuel_data, the parameter length_1000h requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_8,
                           units_val = "metric",
                           sum_val = "no"),
               'For fuel_data, there are missing values in the length_1000h column.')

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_9,
                           units_val = "metric",
                           sum_val = "no"),
               'For fuel_data, length_1000h must be greater than 0.')

})


test_that("Slope handling works", {

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_10,
                           units_val = "metric",
                           sum_val = "no"),
               'For fuel_data, the parameter slope requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_11,
                           units_val = "metric",
                           sum_val = "no"),
               'For fuel_data, slope must be positive.')

  expect_warning(ValidateCWD(fuel_data_val = bad_cwd_12,
                             units_val = "metric",
                             sum_val = "no"),
                'For fuel_data, there are missing values in the slope column.\nFor tansects with NA slopes, slope will be taken to be 0.')

})


test_that("Summed NO process works", {

  # Diameter -----------------------------------------------------
  expect_error(ValidateCWD(fuel_data_val = bad_cwd_13,
                           units_val = "metric",
                           sum_val = "no"),
               'For fuel_data, the parameter diameter requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_14,
                           units_val = "metric",
                           sum_val = "no"),
               '1000-hr fuels are defined as having a diameter > 7.62 cm, or > 3 in.\nThere are diameters below this threshold in the provided fuel_data.\nNote: diameters of exactly 0 are allowed, indicating a transect without coarse woody debris.\nThis warning is for diameters > 0 and <= 7.62.')

  expect_warning(ValidateCWD(fuel_data_val = bad_cwd_15,
                             units_val = "metric",
                             sum_val = "no"),
                 'For fuel_data, there are missing values in the diameter column.\nConsider investigating these missing diameters.\n')

  # Status -----------------------------------------------------
  expect_error(ValidateCWD(fuel_data_val = bad_cwd_16,
                           units_val = "metric",
                           sum_val = "no"),
               'Status must be R or S!\nUnrecognized status codes: K')

  expect_warning(ValidateCWD(fuel_data_val = bad_cwd_17,
                             units_val = "metric",
                             sum_val = "no"),
                 'There are coarse woody debris pieces with missing status codes in the provided fuel_data.\nPieces with NA status codes will be assumed to be rotten.\nConsider investigating these missing values in your data.\n')

  # Other checks ------------------------------------------------
  expect_error(ValidateCWD(fuel_data_val = bad_cwd_18,
                           units_val = "metric",
                           sum_val = "no"),
               'Each time:site:plot:transect combination should have the same "length_1000h" value.\nThe following time:site:plot:transect combination has multiple "length_1000h" values recorded: 2019-SEKI-2-90')

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_19,
                           units_val = "metric",
                           sum_val = "no"),
               'Each time:site:plot:transect combination should have the same "slope" value.\nThe following time:site:plot:transect combination has multiple "slope" values recorded: 2019-SEKI-2-90')

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_20,
                           units_val = "metric",
                           sum_val = "no"),
               'For fuel_data, there are transects with a recorded diameter of 0, but with more than one row.\nTransects with no coarse woody debris should be represented by a single row with time, site, plot, transect,\nlength_1000h, and slope filled in as appropriate and a diameter of 0. Status can be "R", "S", or NA.')

})


test_that("Summed YES process works", {

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_sum2,
                           units_val = "metric",
                           sum_val = "yes"),
               'For fuel_data, the parameter ssd_S requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_sum3,
                           units_val = "metric",
                           sum_val = "yes"),
               'For fuel_data, ssd_S must be greater than or equal to 0.')

  expect_warning(ValidateCWD(fuel_data_val = bad_cwd_sum4,
                             units_val = "metric",
                             sum_val = "yes"),
                'For fuel_data, there are missing values in the ssd_S column.\nConsider investigating these missing values in your data.\n')

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_sum5,
                           units_val = "metric",
                           sum_val = "yes"),
               'For fuel_data, the parameter ssd_R requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateCWD(fuel_data_val = bad_cwd_sum6,
                           units_val = "metric",
                           sum_val = "yes"),
               'For fuel_data, ssd_R must be greater than or equal to 0.')

  expect_warning(ValidateCWD(fuel_data_val = bad_cwd_sum7,
                             units_val = "metric",
                             sum_val = "yes"),
                 'For fuel_data, there are missing values in the ssd_R column.\nConsider investigating these missing values in your data.\n')

})


test_that("Output dataframe has expected column names", {

  expect_named(CoarseFuels(fuel_data = good_cwd_m,
                           tree_data = good_sf_trees_m),
               c("time", "site", "plot", "load_1000s_Mg_ha", "load_1000r_Mg_ha", "load_cwd_Mg_ha", "sc_length_1000h"))

  expect_named(CoarseFuels(fuel_data = good_cwd_i,
                           tree_data = good_sf_trees_i,
                           units = "imperial"),
               c("time", "site", "plot", "load_1000s_ton_ac", "load_1000r_ton_ac", "load_cwd_ton_ac", "sc_length_1000h"))

})


test_that("Final column classes are as expected", {

  cwd_trial <- CoarseFuels(fuel_data = good_cwd_m,
                           tree_data = good_sf_trees_m)

  expect_equal(class(cwd_trial$time), "character")
  expect_equal(class(cwd_trial$site), "character")
  expect_equal(class(cwd_trial$plot), "character")
  expect_equal(class(cwd_trial$load_1000r_Mg_ha), "numeric")
  expect_equal(class(cwd_trial$load_1000s_Mg_ha), "numeric")
  expect_equal(class(cwd_trial$load_cwd_Mg_ha), "numeric")
  expect_equal(class(cwd_trial$sc_length_1000h), "numeric")

})

