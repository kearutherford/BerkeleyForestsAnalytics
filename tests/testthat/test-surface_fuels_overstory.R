
test_that("Properly formatted data frames throw no error, warnings, or messages", {

  expect_no_error(ValidateOverstory(tree_data_val = good_sf_trees_m,
                                    sp_codes_val = "4letter"))

  expect_no_warning(ValidateOverstory(tree_data_val = good_sf_trees_m,
                                      sp_codes_val = "4letter"))

  expect_no_message(ValidateOverstory(tree_data_val = good_sf_trees_m,
                                      sp_codes_val = "4letter"))

})


test_that("Dataframe has expected column names", {

  expect_named(ValidateOverstory(tree_data_val = good_sf_trees_m,
                                 sp_codes_val = "4letter"),
               c("time", "site", "plot", "exp_factor", "species", "dbh"))

})


test_that("Missing columns throw an error", {

  expect_error(ValidateOverstory(tree_data_val = bad_sf_trees_1,
                                    sp_codes_val = "4letter"),
               'tree_data is missing necessary columns!\ntree_data must include time, site, plot, exp_factor, species, and dbh')

})


test_that("Invalid settings throw an error", {

  expect_error(ValidateOverstory(tree_data_val = good_sf_trees_m,
                                 sp_codes_val = "letter"), # intentional error here
               'The "sp_codes" parameter must be set to either "4letter" or "fia."')

})


test_that("Missing id information throws an error", {

  expect_error(ValidateOverstory(tree_data_val = bad_sf_trees_2,
                                 sp_codes_val = "4letter"),
               'For tree_data, there are missing values in the time column.')

  expect_error(ValidateOverstory(tree_data_val = bad_sf_trees_3,
                                 sp_codes_val = "4letter"),
               'For tree_data, there are missing values in the site column.')

  expect_error(ValidateOverstory(tree_data_val = bad_sf_trees_4,
                                 sp_codes_val = "4letter"),
               'For tree_data, there are missing values in the plot column.')

})


test_that("Expansion factor handling works", {

  expect_error(ValidateOverstory(tree_data_val = bad_sf_trees_5,
                                 sp_codes_val = "4letter"),
               'For tree_data, there are missing values in the exp_factor column.\nFor plots with no trees, put 0 for the expansion factor.')

  expect_error(ValidateOverstory(tree_data_val = bad_sf_trees_6,
                                 sp_codes_val = "4letter"),
               'In tree_data there are observations with negative exp_factor values.\nExpansion factors cannot be negative.')

  expect_error(ValidateOverstory(tree_data_val = bad_sf_trees_7,
                                 sp_codes_val = "4letter"),
               'For tree_data, there are plots with a recorded expansion factor of 0, but with more than one row.\nPlots with no trees should be represented by a single row with time, site and plot filled in as appropriate and an exp_factor of 0.')

  expect_error(ValidateOverstory(tree_data_val = bad_sf_trees_8,
                                 sp_codes_val = "4letter"),
               'For tree_data, there are plots with a recorded expansion factor of 0, but with non-NA species and/or dbh.\nPlots with no trees should be represented by a single row with time, site and plot filled in as appropriate,\nan exp_factor of 0, NA species, and NA dbh.')

})


test_that("DBH handling works", {

  expect_error(ValidateOverstory(tree_data_val = bad_sf_trees_9,
                                 sp_codes_val = "4letter"),
               'In tree_data there are trees with negative dbh values.\nTrees cannot have negative dbh.')

  expect_warning(ValidateOverstory(tree_data_val = bad_sf_trees_10,
                                 sp_codes_val = "4letter"),
                 'For plots with trees, there are missing values in the dbh column. Trees with NA dbh will be filtered out for the calculations.\nNote that plots without trees, represented with a 0 exp_factor, are allowed to hava NA dbh and will not be filtered out.')

  expect_no_warning(ValidateOverstory(tree_data_val = bad_sf_trees_11,
                                   sp_codes_val = "4letter"))

})


test_that("Species code handling works", {

  expect_warning(ValidateOverstory(tree_data_val = bad_sf_trees_12,
                                   sp_codes_val = "4letter"),
               'For plots with trees, there are missing species codes in the provided dataframe.\nTrees with NA species codes will be assigned "UNTR" for unknown tree and will receive generic coefficients.\n')

  expect_warning(ValidateOverstory(tree_data_val = bad_sf_trees_13,
                                   sp_codes_val = "4letter"),
                 'Not all species codes were recognized! Unrecognized codes were converted to "UNTR" for unknown tree\nand will receive generic coefficients. Unrecognized codes: ABCC')

})

test_that("Column class handling works", {

  expect_error(ValidateOverstory(tree_data_val = bad_sf_trees_14,
                                 sp_codes_val = "4letter"),
               'For tree_data, the parameter dbh requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateOverstory(tree_data_val = bad_sf_trees_15,
                                 sp_codes_val = "4letter"),
               'For tree_data, the parameter exp_factor requires a numerical variable.\nYou have input a variable of class: character')

})


test_that("ID matching works", {

  expect_error(ValidateMatches(tree_match = bad_sf_trees_11,
                               fuel_match = good_fwd_m),
               'Tree and fuel data did not completely match!\nThese time:site:plot combinations have tree data but no fuel data: 2019-SEKI-3 \nThese time:site:plot combinations have fuel data but no tree data: ')

})

