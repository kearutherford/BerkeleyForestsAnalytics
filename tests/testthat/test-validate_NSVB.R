
test_that("Properly formatted data frames throw no errors, warnings, or messages", {

  expect_no_error(ValidateNSVB(data_val = nsvb_gm4,
                               sp_val = "4letter",
                               in_units_val = "metric",
                               out_units_val = "imperial",
                               results_val = "by_plot"))

  expect_no_warning(ValidateNSVB(data_val = nsvb_gm4,
                                 sp_val = "4letter",
                                 in_units_val = "metric",
                                 out_units_val = "imperial",
                                 results_val = "by_plot"))

  expect_no_message(ValidateNSVB(data_val = nsvb_gm4,
                                 sp_val = "4letter",
                                 in_units_val = "metric",
                                 out_units_val = "imperial",
                                 results_val = "by_plot"))


  expect_no_error(ValidateNSVB(data_val = nsvb_gm4,
                               sp_val = "4letter",
                               in_units_val = "metric",
                               out_units_val = "imperial",
                               results_val = "by_tree"))

  expect_no_warning(ValidateNSVB(data_val = nsvb_gm4,
                                 sp_val = "4letter",
                                 in_units_val = "metric",
                                 out_units_val = "imperial",
                                 results_val = "by_tree"))

  expect_no_message(ValidateNSVB(data_val = nsvb_gm4,
                                 sp_val = "4letter",
                                 in_units_val = "metric",
                                 out_units_val = "imperial",
                                 results_val = "by_tree"))


  expect_no_error(ValidateNSVB(data_val = nsvb_gm4,
                               sp_val = "4letter",
                               in_units_val = "metric",
                               out_units_val = "imperial",
                               results_val = "by_species"))

  expect_no_warning(ValidateNSVB(data_val = nsvb_gm4,
                                 sp_val = "4letter",
                                 in_units_val = "metric",
                                 out_units_val = "imperial",
                                 results_val = "by_species"))

  expect_no_message(ValidateNSVB(data_val = nsvb_gm4,
                                 sp_val = "4letter",
                                 in_units_val = "metric",
                                 out_units_val = "imperial",
                                 results_val = "by_species"))


  expect_no_error(ValidateNSVB(data_val = nsvb_gm4,
                               sp_val = "4letter",
                               in_units_val = "metric",
                               out_units_val = "imperial",
                               results_val = "by_status"))

  expect_no_warning(ValidateNSVB(data_val = nsvb_gm4,
                                 sp_val = "4letter",
                                 in_units_val = "metric",
                                 out_units_val = "imperial",
                                 results_val = "by_status"))

  expect_no_message(ValidateNSVB(data_val = nsvb_gm4,
                                 sp_val = "4letter",
                                 in_units_val = "metric",
                                 out_units_val = "imperial",
                                 results_val = "by_status"))


  expect_no_error(ValidateNSVB(data_val = nsvb_gm4,
                               sp_val = "4letter",
                               in_units_val = "metric",
                               out_units_val = "imperial",
                               results_val = "by_sp_st"))

  expect_no_warning(ValidateNSVB(data_val = nsvb_gm4,
                                 sp_val = "4letter",
                                 in_units_val = "metric",
                                 out_units_val = "imperial",
                                 results_val = "by_sp_st"))

  expect_no_message(ValidateNSVB(data_val = nsvb_gm4,
                                 sp_val = "4letter",
                                 in_units_val = "metric",
                                 out_units_val = "imperial",
                                 results_val = "by_sp_st"))


  expect_no_error(ValidateNSVB(data_val = nsvb_gif,
                               sp_val = "fia",
                               in_units_val = "imperial",
                               out_units_val = "metric",
                               results_val = "by_plot"))

  expect_no_warning(ValidateNSVB(data_val = nsvb_gif,
                                 sp_val = "fia",
                                 in_units_val = "imperial",
                                 out_units_val = "metric",
                                 results_val = "by_plot"))

  expect_no_message(ValidateNSVB(data_val = nsvb_gif,
                                 sp_val = "fia",
                                 in_units_val = "imperial",
                                 out_units_val = "metric",
                                 results_val = "by_plot"))

})


test_that("Invalid options throw an error", {

  expect_error(ValidateNSVB(data_val = nsvb_gm4,
                            sp_val = "4let",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'The "sp_codes" parameter must be set to either "4letter" or "fia."')

  expect_error(ValidateNSVB(data_val = nsvb_gm4,
                            sp_val = "4letter",
                            in_units_val = "m",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'The "input_units" parameter must be set to either "metric" or "imperial."')

  expect_error(ValidateNSVB(data_val = nsvb_gm4,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "i",
                            results_val = "by_plot"),
               'The "output_units" parameter must be set to either "metric" or "imperial."')

  expect_error(ValidateNSVB(data_val = nsvb_gm4,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_treee"),
               'The "results" parameter must be set to "by_tree", "by_plot", "by_status", "by_species", or "by_sp_st".')

})


test_that("Missing columns throw an error", {

  expect_error(ValidateNSVB(data_val = nsvb_b1,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Input data is missing the necessary "site" column.')

  expect_error(ValidateNSVB(data_val = nsvb_b2,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Input data is missing the necessary "plot" column.')

  expect_error(ValidateNSVB(data_val = nsvb_b3,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Input data is missing the necessary "exp_factor" column.')

  expect_error(ValidateNSVB(data_val = nsvb_b4,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Input data is missing the necessary "division" column.')

  expect_error(ValidateNSVB(data_val = nsvb_b5,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Input data is missing the necessary "status" column.')

  expect_error(ValidateNSVB(data_val = nsvb_b6,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Input data is missing the necessary "decay_class" column.')

  expect_error(ValidateNSVB(data_val = nsvb_b7,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Input data is missing the necessary "species" column.')

  expect_error(ValidateNSVB(data_val = nsvb_b8,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Input data is missing the necessary "dbh" column.')


  expect_error(ValidateNSVB(data_val = nsvb_b9,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Input data is missing the necessary "ht1" column.')

  expect_error(ValidateNSVB(data_val = nsvb_b10,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Input data is missing the necessary "ht2" column.')

  expect_error(ValidateNSVB(data_val = nsvb_b11,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Input data is missing the necessary "crown_ratio" column.')

  expect_error(ValidateNSVB(data_val = nsvb_b12,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Input data is missing the necessary "top" column.')

  expect_error(ValidateNSVB(data_val = nsvb_b13,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Input data is missing the necessary "cull" column.')

})


test_that("Wrong column class throws an error", {

  expect_error(ValidateNSVB(data_val = nsvb_b14,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               '"exp_factor" must be a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateNSVB(data_val = nsvb_b15,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               '"dbh" must be a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateNSVB(data_val = nsvb_b16,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               '"ht1" must be a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateNSVB(data_val = nsvb_b17,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               '"ht2" must be a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateNSVB(data_val = nsvb_b18,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               '"crown_ratio" must be a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateNSVB(data_val = nsvb_b19,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               '"cull" must be a numerical variable.\nYou have input a variable of class: character')

})


test_that("Missing id information throws an error", {

  expect_error(ValidateNSVB(data_val = nsvb_b20,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'There are missing site names in the provided dataframe.')

  expect_error(ValidateNSVB(data_val = nsvb_b21,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'There are missing plot names in the provided dataframe.')

})


test_that("Expansion factor handling works", {

  expect_error(ValidateNSVB(data_val = nsvb_b22,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'There are missing expansion factors in the provided dataframe.\nFor plots with no trees, put 0 for the exp_factor.')

  expect_error(ValidateNSVB(data_val = nsvb_b23,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'There are plots with a recorded expansion factor of 0, but with more than one row.\nPlots with no trees should be represented by a single row with site and plot filled in as appropriate and an exp_factor of 0.')

  expect_error(ValidateNSVB(data_val = nsvb_b24,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'There are plots with a recorded expansion factor of 0, but with non-NA status, decay_class, species, dbh, ht1, ht2, crown_ratio, top and/or cull.\nPlots with no trees should be represented by a single row with site and plot filled in as appropriate, an exp_factor of 0,\nand NA status, decay_class, species, dbh, ht1, ht2, crown_ratio, top and/or cull.')

})


test_that("Division handling works", {

  expect_error(ValidateNSVB(data_val = nsvb_b25,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'There are missing division codes in the provided dataframe.')

  expect_error(ValidateNSVB(data_val = nsvb_b26,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'division must be 260, M260, 320, or 340!\nUnrecognized division codes:  220 M330 ')

})


test_that("Status handling works", {

  expect_error(ValidateNSVB(data_val = nsvb_b27,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Status must be 0 or 1!\nUnrecognized status codes: L ')

  expect_warning(ValidateNSVB(data_val = nsvb_b28,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'There are missing status codes in the provided dataframe - outside of plots with exp_factor of 0, signifying plots with no trees, which should have NA status.\nTrees with NA status codes will have NA biomass estimates. Consider investigating these trees.\n')

})






