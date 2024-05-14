
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

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_15,
                           units_val = "metric"),
               'For fuel_data, there are missing values in the transect column.')

})


test_that("time/site/plot/transect column class handling works", {

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_17,
                           units_val = "metric"),
               'For fuel_data, the parameter time requires a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_18,
                           units_val = "metric"),
               'For fuel_data, the parameter site requires a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_19,
                           units_val = "metric"),
               'For fuel_data, the parameter plot requires a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_20,
                           units_val = "metric"),
               'For fuel_data, the parameter transect requires a character variable.\nYou have input a variable of class: numeric')

})


test_that("Repeat time:site:plot:transect observations throw an error", {

  expect_error(ValidateFWD(fuel_data_val = bad_fwd_16,
                           units_val = "metric"),
               'For fuel_data, there are repeat time:site:plot:transect observations.\nThere should only be one observation/row for an individual transect at a specific time:site:plot.\nInvestigate the following time:site:plot:transect combinations: 2019-SEKI-1-90   2020-SEKI-2-90')

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
               'For fuel_data, there are missing values in the count_1h column.\nFor transects with NA 1h counts, 1h fuel load estimates will be NA.')

})


test_that("Output dataframe has expected column names", {

  expect_named(FineFuels(fuel_data = good_fwd_m,
                         tree_data = good_sf_trees_m),
               c("time", "site", "plot", "load_1h_Mg_ha", "load_10h_Mg_ha", "load_100h_Mg_ha", "load_fwd_Mg_ha",
                 "sc_length_1h", "sc_length_10h", "sc_length_100h"))

  expect_named(FineFuels(fuel_data = good_fwd_i,
                         tree_data = good_sf_trees_i,
                         units = "imperial"),
               c("time", "site", "plot", "load_1h_ton_ac", "load_10h_ton_ac", "load_100h_ton_ac", "load_fwd_ton_ac",
                 "sc_length_1h", "sc_length_10h", "sc_length_100h"))

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
  expect_equal(class(fwd_trial$sc_length_1h), "numeric")
  expect_equal(class(fwd_trial$sc_length_10h), "numeric")
  expect_equal(class(fwd_trial$sc_length_100h), "numeric")

})


test_that("Rfuels and BFA outputs match", {

  expect_warning(fwd_package <- FineFuels(tree_data = rfuels_trees, fuel_data = rfuels_fuels))
  fwd_package <- fwd_package[order(fwd_package$site, fwd_package$time, fwd_package$plot),]
  rfuels_loads <- rfuels_loads[order(rfuels_loads$site, rfuels_loads$time, rfuels_loads$plot),]

  expect_equal(rfuels_loads$rf_1h, fwd_package$load_1h_Mg_ha)
  expect_equal(rfuels_loads$rf_10h, fwd_package$load_10h_Mg_ha)
  expect_equal(rfuels_loads$rf_100h, fwd_package$load_100h_Mg_ha)
  expect_equal(rfuels_loads$rf_fwd, fwd_package$load_fwd_Mg_ha)

})

