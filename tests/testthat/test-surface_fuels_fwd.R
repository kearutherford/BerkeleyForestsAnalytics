
test_that("Properly formatted data frames throw no error, warnings, or messages", {

  expect_no_error(ValidateFWD(fuel_data_val = good_fwd_m,
                              units_val = "metric"))

  expect_no_warning(ValidateFWD(fuel_data_val = good_fwd_m,
                                units_val = "metric"))

  expect_no_message(ValidateFWD(fuel_data_val = good_fwd_m,
                                units_val = "metric"))

})


test_that("Dataframe has expected column names", {

  expect_named(ValidateFWD(fuel_data_val = good_fwd_m,
                           units_val = "metric"),
               c("time", "site", "plot", "transect", "count_1h", "count_10h", "count_100h",
                 "length_1h", "length_10h", "length_100h", "slope"))

})


test_that("Missing columns throw an error", {

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_1,
                         units_val = "metric"),
              'fuel_data is missing necessary columns!\nfuel_data must include: time, site, plot, transect, count_1h, count_10h, count_100h,\nlength_1h, length_10h, and length_100h. slope is optional.')

  expect_warning(ValidateFWD(fuel_data_val = bad_fwd_2,
                             units_val = "metric"),
                'slope was not provided. The slope correction factor will be set to 1, indicating no slope.')

})


test_that("Invalid settings throw an error", {

  expect_error(ValidateFWD(fuel_data_val = good_fwd_m,
                           units_val = "metricc"),
               'The "units" parameter must be set to either "metric" or "imperial".')

})


test_that("Missing id information throws an error", {

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_3,
                           units_val = "metric"),
               'For fuel_data, there are missing values in the time column.')

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_4,
                           units_val = "metric"),
               'For fuel_data, there are missing values in the site column.')

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_5,
                           units_val = "metric"),
               'For fuel_data, there are missing values in the plot column.')

})


test_that("Transect handling works", {

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_6,
                           units_val = "metric"),
               'For fuel_data, the parameter length_1h requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_7,
                           units_val = "metric"),
               'For fuel_data, there are missing values in the length_1h column.')

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_8,
                           units_val = "metric"),
               'For fuel_data, length_1h must be greater than 0.')

})


test_that("Slope handling works", {

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_9,
                           units_val = "metric"),
               'For fuel_data, the parameter slope requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_10,
                           units_val = "metric"),
               'For fuel_data, slope must be positive.')

  expect_warning(ValidateFWD(fuel_data_val = bad_fwd_11,
                             units_val = "metric"),
                'For fuel_data, there are missing values in the slope column.\nFor tansects with NA slopes, slope will be taken to be 0.')

})


test_that("Count handling works", {

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_12,
                           units_val = "metric"),
               'For fuel_data, the parameter count_1h requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_13,
                           units_val = "metric"),
               'For fuel_data, count_1h must be a positive, whole number.')

  expect_warning(ValidateFWD(fuel_data_val = bad_fwd_14,
                             units_val = "metric"),
                 'For fuel_data, there are missing values in the count_1h column.\nFor tansects with NA 1h counts, 1h fuel load estimates will be NA.')

})


test_that("Output dataframe has expected column names", {

  expect_named(FineFuels(fuel_data = good_fwd_m,
                         tree_data = good_sf_trees_m),
               c("time", "site", "plot", "load_1h_Mg_ha", "load_10h_Mg_ha", "load_100h_Mg_ha", "load_fwd_Mg_ha"))

  expect_named(FineFuels(fuel_data = good_fwd_i,
                         tree_data = good_sf_trees_i,
                         units = "imperial"),
               c("time", "site", "plot", "load_1h_ton_ac", "load_10h_ton_ac", "load_100h_ton_ac", "load_fwd_ton_ac"))

})


test_that("Final column classes are as expected", {

  fwd_trial <- FineFuels(fuel_data = good_fwd_m,
                         tree_data = good_sf_trees_m)

  expect_equal(class(fwd_trial$time), "character")
  expect_equal(class(fwd_trial$site), "character")
  expect_equal(class(fwd_trial$plot), "character")
  expect_equal(class(fwd_trial$load_1h_Mg_ha), "numeric")
  expect_equal(class(fwd_trial$load_10h_Mg_ha), "numeric")
  expect_equal(class(fwd_trial$load_100h_Mg_ha), "numeric")
  expect_equal(class(fwd_trial$load_fwd_Mg_ha), "numeric")

})

