
test_that("Properly formatted data frames throw no errors, warnings, or messages", {

  expect_no_error(ValidateStrData(data_val = good_comp_metric,
                                  units_val = "metric"))

  expect_no_warning(ValidateStrData(data_val = good_comp_metric,
                                    units_val = "metric"))

  expect_no_message(ValidateStrData(data_val = good_comp_metric,
                                    units_val = "metric"))

})


test_that("Invalid settings throw an error", {

  expect_error(ValidateStrData(data_val = good_comp_metric,
                               units_val = "metri"), # intentional error here
               'The "units" parameter must be set to either "metric" or "imperial".')

})


test_that("Missing columns throw an error", {

  expect_error(ValidateStrData(data_val = bad_comp_20,
                               units_val = "metric"),
               'Input data is missing the necessary "site" column.')

  expect_error(ValidateStrData(data_val = bad_comp_21,
                               units_val = "metric"),
               'Input data is missing the necessary "plot" column.')

  expect_error(ValidateStrData(data_val = bad_comp_22,
                               units_val = "metric"),
               'Input data is missing the necessary "exp_factor" column.')

  expect_error(ValidateStrData(data_val = bad_comp_25,
                               units_val = "metric"),
               'Input data is missing the necessary "dbh" column.')

})


test_that("Column class handling works", {

  # Categorical ----------------------------------------------------------------
  expect_error(ValidateStrData(data_val = bad_comp_1,
                               units_val = "metric"),
               '"site" must be a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateStrData(data_val = bad_comp_2,
                               units_val = "metric"),
               '"plot" must be a character variable.\nYou have input a variable of class: numeric')

  # Numeric --------------------------------------------------------------------
  expect_error(ValidateStrData(data_val = bad_comp_5,
                               units_val = "metric"),
               '"exp_factor" must be a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateStrData(data_val = bad_comp_6,
                               units_val = "metric"),
               '"dbh" must be a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateStrData(data_val = bad_comp_17,
                               units_val = "metric"),
               '"ht" must be a numerical variable.\nYou have input a variable of class: character')

})


test_that("Site and plot handling works", {

  expect_error(ValidateStrData(data_val = bad_comp_7,
                               units_val = "metric"),
               'There are missing site names in the provided dataframe.')

  expect_error(ValidateStrData(data_val = bad_comp_8,
                               units_val = "metric"),
               'There are missing plot names in the provided dataframe.')

})


test_that("Expansion factor handling works", {

  expect_error(ValidateStrData(data_val = bad_comp_9,
                               units_val = "metric"),
               'There are missing expansion factors in the provided dataframe.\nFor plots with no trees, put 0 for the exp_factor.')

  expect_error(ValidateStrData(data_val = bad_comp_10,
                               units_val = "metric"),
               'There are negative expansion factors in the provided dataframe. All expansion factors must be >= 0.')

  expect_error(ValidateStrData(data_val = bad_comp_11,
                               units_val = "metric"),
               'There are plots with a recorded expansion factor of 0, but with more than one row.\nPlots with no trees should be represented by a single row with site and plot filled in as appropriate and an exp_factor of 0.')

  expect_error(ValidateStrData(data_val = bad_comp_26,
                               units_val = "metric"),
               'There are plots with a recorded expansion factor of 0, but with non-NA dbh or ht.\nPlots with no trees should be represented by a single row with site and plot filled in as appropriate, an exp_factor of 0,\nNA dbh and, if applicatable, NA ht.')

  expect_no_error(ValidateStrData(data_val = good_comp_no_trees,
                                  units_val = "metric"))

})


test_that("DBH handling works", {

  expect_error(ValidateStrData(data_val = bad_comp_15,
                               units_val = "metric"),
               'There are negative DBH values in the provided dataframe. All DBH values must be >= 0.')

  expect_warning(ValidateStrData(data_val = bad_comp_16,
                                 units_val = "metric"),
                 'There are trees with missing DBH values in the provided dataframe.\nConsider addressing these missing values in your data.\n \n')

})


test_that("Height handling works", {

  expect_error(ValidateStrData(data_val = bad_comp_18,
                               units_val = "metric"),
               'There are negative heights in the provided dataframe. All heights must be >= 0.')

  expect_warning(ValidateStrData(data_val = bad_comp_19,
                                 units_val = "metric"),
                 'There are trees with missing height values in the provided dataframe.\nConsider addressing these missing values in your data.\n \n')

})

