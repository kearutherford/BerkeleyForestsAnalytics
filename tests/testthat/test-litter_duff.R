
test_that("Properly formatted data frames throw no error, warnings, or messages", {

  expect_no_error(ValidateLitDuff(fuel_data_val = good_duff_m,
                                  units_val = "metric",
                                  meas_val = "separate"))

  expect_no_warning(ValidateLitDuff(fuel_data_val = good_duff_m,
                                    units_val = "metric",
                                    meas_val = "separate"))

  expect_no_message(ValidateLitDuff(fuel_data_val = good_duff_m,
                                    units_val = "metric",
                                    meas_val = "separate"))

})


test_that("Dataframe has expected column names", {

  expect_named(ValidateLitDuff(fuel_data_val = good_duff_m,
                               units_val = "metric",
                               meas_val = "separate"),
               c("time", "site", "plot", "transect", "duff_depth", "litter_depth"))

  expect_named(ValidateLitDuff(fuel_data_val = good_duff_m,
                               units_val = "metric",
                               meas_val = "combined"),
               c("time", "site", "plot", "transect", "lit_duff_depth"))

})


test_that("Invalid settings throw an error", {

  expect_error(ValidateLitDuff(fuel_data_val = good_duff_m,
                               units_val = "m",
                               meas_val = "separate"),
               'The "units" parameter must be set to either "metric" or "imperial".')

  expect_error(ValidateLitDuff(fuel_data_val = good_duff_m,
                               units_val = "metric",
                               meas_val = "sep"),
               'The "measurement" parameter must be set to either "separate" or "combined".')

})


test_that("Missing columns throw an error", {

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_1,
                               units_val = "metric",
                               meas_val = "separate"),
               'fuel_data is missing necessary columns!\nfuel_data must include: time, site, plot, transect, litter_depth and duff_depth\nwhen measurement is set to "separate".\n')

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_1,
                               units_val = "metric",
                               meas_val = "combined"),
               'fuel_data is missing necessary columns!\nfuel_data must include: time, site, plot, transect, and lit_duff_depth\nwhen measurement is set to "combined".\n')

})


test_that("Missing id information throws an error", {

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_2,
                               units_val = "metric",
                               meas_val = "separate"),
               'For fuel_data, there are missing values in the time column.')

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_3,
                               units_val = "metric",
                               meas_val = "separate"),
               'For fuel_data, there are missing values in the site column.')

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_4,
                               units_val = "metric",
                               meas_val = "separate"),
               'For fuel_data, there are missing values in the plot column.')

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_5,
                               units_val = "metric",
                               meas_val = "separate"),
               'For fuel_data, there are missing values in the transect column.')

})


test_that("time/site/plot/transect column class handling works", {

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_9,
                               units_val = "metric",
                               meas_val = "separate"),
               'For fuel_data, the parameter time requires a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_10,
                               units_val = "metric",
                               meas_val = "separate"),
               'For fuel_data, the parameter site requires a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_11,
                               units_val = "metric",
                               meas_val = "separate"),
               'For fuel_data, the parameter plot requires a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_12,
                               units_val = "metric",
                               meas_val = "separate"),
               'For fuel_data, the parameter transect requires a character variable.\nYou have input a variable of class: numeric')

})


test_that("Depth handling works", {

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_6,
                               units_val = "metric",
                               meas_val = "separate"),
               'For fuel_data, the parameter litter_depth requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_7,
                               units_val = "metric",
                               meas_val = "separate"),
               'In fuel_data there are observations with negative litter_depth values.\nLitter depth cannot be negative.')

  expect_warning(ValidateLitDuff(fuel_data_val = bad_duff_8,
                                 units_val = "metric",
                                 meas_val = "separate"),
               'For fuel_data, there are missing values in the litter_depth column.')

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_6,
                               units_val = "metric",
                               meas_val = "combined"),
               'For fuel_data, the parameter lit_duff_depth requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateLitDuff(fuel_data_val = bad_duff_7,
                               units_val = "metric",
                               meas_val = "combined"),
               'In fuel_data there are observations with negative lit_duff_depth values.\nLitter and duff depth cannot be negative.')

  expect_warning(ValidateLitDuff(fuel_data_val = bad_duff_8,
                                 units_val = "metric",
                                 meas_val = "combined"),
                 'For fuel_data, there are missing values in the lit_duff_depth column.')

})


test_that("Output dataframe has expected column names", {

  expect_named(LitterDuff(fuel_data = good_duff_m,
                          tree_data = good_sf_trees_m),
               c("time", "site", "plot", "litter_Mg_ha", "duff_Mg_ha"))

  expect_named(LitterDuff(fuel_data = good_duff_m,
                          tree_data = good_sf_trees_m,
                          units = "imperial"),
               c("time", "site", "plot", "litter_ton_ac", "duff_ton_ac"))

  expect_named(LitterDuff(fuel_data = good_duff_m,
                          tree_data = good_sf_trees_m,
                          units = "imperial",
                          measurement = "combined"),
               c("time", "site", "plot", "lit_duff_ton_ac"))

  expect_named(LitterDuff(fuel_data = good_duff_m,
                          tree_data = good_sf_trees_m,
                          measurement = "combined"),
               c("time", "site", "plot", "lit_duff_Mg_ha"))

})


test_that("Final column classes are as expected", {

  duff_trial1 <- LitterDuff(fuel_data = good_duff_m,
                            tree_data = good_sf_trees_m)

  duff_trial2 <- LitterDuff(fuel_data = good_duff_m,
                            tree_data = good_sf_trees_m,
                            measurement = "combined")

  expect_equal(class(duff_trial1$time), "character")
  expect_equal(class(duff_trial1$site), "character")
  expect_equal(class(duff_trial1$plot), "character")
  expect_equal(class(duff_trial1$litter_Mg_ha), "numeric")
  expect_equal(class(duff_trial1$duff_Mg_ha), "numeric")
  expect_equal(class(duff_trial2$lit_duff_Mg_ha), "numeric")

})
