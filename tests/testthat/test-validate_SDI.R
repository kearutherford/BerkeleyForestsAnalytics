
test_that("Invalid options throw an error", {

  expect_error(ValidateSDIOptions(in_units_val = "m", # intentional error here
                                  out_units_val = "imperial"),
               'The "input_units" parameter must be set to either "metric" or "imperial."')

  expect_error(ValidateSDIOptions(in_units_val = "metric",
                                  out_units_val = "i"), # intentional error here
               'The "output_units" parameter must be set to either "metric" or "imperial."')

})


test_that("Missing columns throw an error (tree data)", {

  expect_error(ValidateSDITrees(tree_data_val = sdi_b1,
                                in_units = "metric"),
               'tree_data is missing the necessary "site" column.')

  expect_error(ValidateSDITrees(tree_data_val = sdi_b2,
                                in_units = "metric"),
               'tree_data is missing the necessary "plot" column.')

  expect_error(ValidateSDITrees(tree_data_val = sdi_b3,
                                in_units = "metric"),
               'tree_data is missing the necessary "exp_factor" column.')

  expect_error(ValidateSDITrees(tree_data_val = sdi_b4,
                                in_units = "metric"),
               'tree_data is missing the necessary "status" column.')

  expect_error(ValidateSDITrees(tree_data_val = sdi_b5,
                                in_units = "metric"),
               'tree_data is missing the necessary "dbh" column.')

})


test_that("Wrong column class throws an error (tree data)", {

  # Categorical ----------------------------------------------------------------
  expect_error(ValidateSDITrees(tree_data_val = sdi_b6,
                                in_units = "metric"),
               '"site" in tree_data must be a character variable.\nYou have input a variable of class: factor')

  expect_error(ValidateSDITrees(tree_data_val = sdi_b7,
                                in_units = "metric"),
               '"plot" in tree_data must be a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateSDITrees(tree_data_val = sdi_b8,
                                in_units = "metric"),
               '"status" in tree_data must be a character variable.\nYou have input a variable of class: numeric')

  # Numeric --------------------------------------------------------------------
  expect_error(ValidateSDITrees(tree_data_val = sdi_b9,
                                in_units = "metric"),
               '"exp_factor" in tree_data must be a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateSDITrees(tree_data_val = sdi_b10,
                                in_units = "metric"),
               '"dbh" in tree_data must be a numerical variable.\nYou have input a variable of class: character')

})


test_that("Missing id information throws an error (tree data)", {

  expect_error(ValidateSDITrees(tree_data_val = sdi_b11,
                                in_units = "metric"),
               '"site" in tree_data has missing values.')

  expect_error(ValidateSDITrees(tree_data_val = sdi_b12,
                                in_units = "metric"),
               '"plot" in tree_data has missing values.')

})


test_that("Expansion factor handling works (tree data)", {

  expect_error(ValidateSDITrees(tree_data_val = sdi_b13,
                                in_units = "metric"),
               '"exp_factor" in tree_data has missing values.\nFor plots with no trees, set "exp_factor" to 0.')

  expect_error(ValidateSDITrees(tree_data_val = sdi_b14,
                                in_units = "metric"),
               '"exp_factor" in tree_data has values < 0. All values must be >= 0.')

  expect_error(ValidateSDITrees(tree_data_val = sdi_b15,
                                in_units = "metric"),
               'There are plots with an "exp_factor" of 0 that have more than one row.\nPlots with no trees should be represented by a single row with "site" and "plot" filled in and "exp_factor" set to 0.')

  expect_error(ValidateSDITrees(tree_data_val = sdi_b16,
                                in_units = "metric"),
               'There are plots with an "exp_factor" of 0 that have non-NA values for "status" or "dbh".\nPlots with no trees should be represented by a single row with "site" and "plot" filled in,\n"exp_factor" set to 0, "status" set to NA, and "dbh" set to NA.')

})


test_that("Status handling works (tree data)", {

  expect_error(ValidateSDITrees(tree_data_val = sdi_b17,
                                in_units = "metric"),
               '"status" in tree_data must be 0 or 1.\nUnrecognized status codes: dead, live')

  expect_warning(ValidateSDITrees(tree_data_val = sdi_b18,
                                in_units = "metric"),
                 'There are missing "status" values in tree_data outside of plots with an "exp_factor" of 0.\nPlots with an "exp_factor" of 0 represent plots with no trees and should have NA "status".\nTrees with NA "status" will be ignored in the SDI calculations. Consider investigating these trees.\n')

})


test_that("DBH handling works (tree data)", {

  expect_error(ValidateSDITrees(tree_data_val = sdi_b19,
                                in_units = "metric"),
               '"dbh" in tree_data has values <= 0. All values must be > 0.')

  expect_warning(ValidateSDITrees(tree_data_val = sdi_b20,
                                in_units = "metric"),
                 'There are missing "dbh" values in tree_data outside of plots with an "exp_factor" of 0.\nPlots with an "exp_factor" of 0 represent plots with no trees and should have NA "dbh".\nTrees with NA "dbh" will be ignored in the SDI calculations. Consider investigating these trees.\n')

  expect_warning(ValidateSDITrees(tree_data_val = sdi_b21,
                                  in_units = "metric"),
                 'tree_data has trees with DBH < 2.54 cm, which will be ignored in the SDI calculations.\n')

  expect_warning(ValidateSDITrees(tree_data_val = sdi_b21,
                                  in_units = "imperial"),
                 'tree_data has trees with DBH < 1.0 in, which will be ignored in the SDI calculations.\n')

})


test_that("Missing columns throw an error (subsection data)", {

  expect_error(ValidateSDISubs(sub_data_val = sub_plot_b1),
               'subsec_data is missing the necessary "site" column.')

  expect_error(ValidateSDISubs(sub_data_val = sub_plot_b2),
               'subsec_data is missing the necessary "subsection" column.')

})


test_that("Wrong column class throws an error (subsection data)", {

  expect_error(ValidateSDISubs(sub_data_val = sub_plot_b3),
               '"site" in subsec_data must be a character variable.\nYou have input a variable of class: factor')

  expect_error(ValidateSDISubs(sub_data_val = sub_plot_b4),
               '"plot" in subsec_data must be a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateSDISubs(sub_data_val = sub_plot_b5),
               '"subsection" in subsec_data must be a character variable.\nYou have input a variable of class: numeric')



})


test_that("Missing id information throws an error (subsection data)", {

  expect_error(ValidateSDISubs(sub_data_val = sub_plot_b6),
               '"site" in subsec_data has missing values.')

  expect_error(ValidateSDISubs(sub_data_val = sub_plot_b7),
               '"plot" in subsec_data has missing values.')

})


test_that("Duplicate site/plot combinations throw an error (subsection data)", {

  expect_error(ValidateSDISubs(sub_data_val = sub_plot_b12),
               'In subsec_data there must be only one row per site-plot combination.\nDuplicate site-plot combinations: SEKI-1')

  expect_error(ValidateSDISubs(sub_data_val = sub_b2),
               'In subsec_data there must be only one row per site.\nDuplicate sites: SEKI')

})


test_that("Subsection handling works (subsection data)", {

  expect_error(ValidateSDISubs(sub_data_val = sub_plot_b8),
               '"subsection" in subsec_data has missing values.')

  expect_error(ValidateSDISubs(sub_data_val = sub_plot_b9),
               'No subsection codes were recognized.\nCheck that you are using the correct subsection reference.')

  expect_error(ValidateSDISubs(sub_data_val = sub_plot_b10),
               'Not all subsection codes were recognized.\nUnrecognized subsection codes: 413')

})


test_that("Tree and subsection data match handling works", {

  expect_error(ValidateSDIMatches(tree_match = sdi_good,
                                  sub_match = sub_plot_b11),
               'tree_data and subsec_data did not completely match.\nThese site or site:plot combinations have tree data but no subsection data: SEKI-1\nThese site or site:plot combinations have subsection data but no tree data: SEKI-2')

  expect_error(ValidateSDIMatches(tree_match = sdi_good,
                                  sub_match = sub_b1),
               'tree_data and subsec_data did not completely match.\nThese site or site:plot combinations have tree data but no subsection data: SEKI\nThese site or site:plot combinations have subsection data but no tree data: YOPI')

})
