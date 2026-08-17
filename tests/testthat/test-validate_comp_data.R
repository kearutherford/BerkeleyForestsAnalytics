
test_that("Properly formatted data frames throw no errors, warnings, or messages", {

  expect_no_error(ValidateCompData(data_val = good_comp_metric,
                                   rel_val = "BA",
                                   units_val = "metric"))

  expect_no_warning(ValidateCompData(data_val = good_comp_metric,
                                     rel_val = "BA",
                                     units_val = "metric"))

  expect_no_message(ValidateCompData(data_val = good_comp_metric,
                                     rel_val = "BA",
                                     units_val = "metric"))

})


test_that("Invalid settings throw an error", {

  expect_error(ValidateCompData(data_val = good_comp_metric,
                                rel_val = "stems", # intentional error here
                                units_val = "metric"),
               'The "relative" parameter must be set to either "BA" or "density".')

  expect_error(ValidateCompData(data_val = good_comp_metric,
                                rel_val = "BA",
                                units_val = "metri"), # intentional error here
               'The "units" parameter must be set to either "metric" or "imperial".')

})


test_that("Missing columns throw an error", {

  expect_error(ValidateCompData(data_val = bad_comp_20,
                                rel_val = "BA",
                                units_val = "metric"),
               'Input data is missing the necessary "site" column.')

  expect_error(ValidateCompData(data_val = bad_comp_21,
                                rel_val = "BA",
                                units_val = "metric"),
               'Input data is missing the necessary "plot" column.')

  expect_error(ValidateCompData(data_val = bad_comp_22,
                                rel_val = "BA",
                                units_val = "metric"),
               'Input data is missing the necessary "exp_factor" column.')

  expect_error(ValidateCompData(data_val = bad_comp_23,
                                rel_val = "BA",
                                units_val = "metric"),
               'Input data is missing the necessary "status" column.')

  expect_error(ValidateCompData(data_val = bad_comp_24,
                                rel_val = "BA",
                                units_val = "metric"),
               'Input data is missing the necessary "species" column.')

  expect_error(ValidateCompData(data_val = bad_comp_25,
                                rel_val = "BA",
                                units_val = "metric"),
               'Input data is missing the necessary "dbh" column.')

})


test_that("Column class handling works", {

  # Categorical ----------------------------------------------------------------
  expect_error(ValidateCompData(data_val = bad_comp_1,
                                rel_val = "BA",
                                units_val = "metric"),
               '"site" must be a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateCompData(data_val = bad_comp_2,
                                rel_val = "BA",
                                units_val = "metric"),
               '"plot" must be a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateCompData(data_val = bad_comp_3,
                                rel_val = "BA",
                                units_val = "metric"),
               '"status" must be a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateCompData(data_val = bad_comp_4,
                                rel_val = "BA",
                                units_val = "metric"),
               '"species" must be a character variable.\nYou have input a variable of class: numeric')

  # Numeric --------------------------------------------------------------------
  expect_error(ValidateCompData(data_val = bad_comp_5,
                                rel_val = "BA",
                                units_val = "metric"),
               '"exp_factor" must be a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateCompData(data_val = bad_comp_6,
                                rel_val = "BA",
                                units_val = "metric"),
               '"dbh" must be a numerical variable.\nYou have input a variable of class: character')

})


test_that("Site and plot handling works", {

  expect_error(ValidateCompData(data_val = bad_comp_7,
                                rel_val = "BA",
                                units_val = "metric"),
               'There are missing site names in the provided dataframe.')

  expect_error(ValidateCompData(data_val = bad_comp_8,
                                rel_val = "BA",
                                units_val = "metric"),
               'There are missing plot names in the provided dataframe.')

})


test_that("Expansion factor handling works", {

  expect_error(ValidateCompData(data_val = bad_comp_9,
                                rel_val = "BA",
                                units_val = "metric"),
               'There are missing expansion factors in the provided dataframe.\nFor plots with no trees, put 0 for the exp_factor.')

  expect_error(ValidateCompData(data_val = bad_comp_10,
                                rel_val = "BA",
                                units_val = "metric"),
               'There are negative expansion factors in the provided dataframe. All expansion factors must be >= 0.')

  expect_error(ValidateCompData(data_val = bad_comp_11,
                                rel_val = "BA",
                                units_val = "metric"),
               'There are plots with a recorded expansion factor of 0, but with more than one row.\nPlots with no trees should be represented by a single row with site and plot filled in as appropriate and an exp_factor of 0.')

  expect_error(ValidateCompData(data_val = bad_comp_26,
                                rel_val = "BA",
                                units_val = "metric"),
               'There are plots with a recorded expansion factor of 0, but with non-NA status, species, and/or dbh.\nPlots with no trees should be represented by a single row with site and plot filled in as appropriate, an exp_factor of 0,\nand NA status, species, and dbh.')

  expect_no_error(ValidateCompData(data_val = good_comp_no_trees,
                                   rel_val = "BA",
                                   units_val = "metric"))

})


test_that("Status handling works", {

  expect_error(ValidateCompData(data_val = bad_comp_12,
                                rel_val = "BA",
                                units_val = "metric"),
               'Status must be 0 or 1!\nUnrecognized status codes: D L')

  expect_warning(ValidateCompData(data_val = bad_comp_13,
                                  rel_val = "BA",
                                  units_val = "metric"),
                 'There are trees with missing status codes in the provided dataframe.\nTrees with NA status codes will not be included in the composition calculations.\nConsider addressing these missing values in your data.\n \n')

})


test_that("Species handling works", {

  expect_warning(ValidateCompData(data_val = bad_comp_14,
                                rel_val = "BA",
                                units_val = "metric"),
                 'There are trees with missing species codes in the provided dataframe.\nTrees with NA species codes will be assigned "UNTR" for unknown tree.\n \n')

})


test_that("DBH handling works", {

  expect_error(ValidateCompData(data_val = bad_comp_15,
                                rel_val = "BA",
                                units_val = "metric"),
               'There are negative DBH values in the provided dataframe. All DBH values must be >= 0.')

  expect_warning(ValidateCompData(data_val = bad_comp_16,
                                  rel_val = "BA",
                                  units_val = "metric"),
                 'There are trees with missing DBH values in the provided dataframe.\nTrees with NA DBH will not be included in the composition calculations.\nConsider addressing these missing values in your data.\n \n')

})

