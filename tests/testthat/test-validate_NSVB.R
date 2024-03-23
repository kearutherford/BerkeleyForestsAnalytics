
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
                            sp_val = "4let", # intentional error here
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'The "sp_codes" parameter must be set to either "4letter" or "fia."')

  expect_error(ValidateNSVB(data_val = nsvb_gm4,
                            sp_val = "4letter",
                            in_units_val = "m", # intentional error here
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'The "input_units" parameter must be set to either "metric" or "imperial."')

  expect_error(ValidateNSVB(data_val = nsvb_gm4,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "i", # intentional error here
                            results_val = "by_plot"),
               'The "output_units" parameter must be set to either "metric" or "imperial."')

  expect_error(ValidateNSVB(data_val = nsvb_gm4,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_treee"), # intentional error here
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

  # Categorical ----------------------------------------------------------------
  expect_error(ValidateNSVB(data_val = nsvb_b57,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               '"division" must be a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateNSVB(data_val = nsvb_b58,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               '"site" must be a character variable.\nYou have input a variable of class: factor')

  expect_error(ValidateNSVB(data_val = nsvb_b59,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               '"plot" must be a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateNSVB(data_val = nsvb_b60,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               '"status" must be a character variable.\nYou have input a variable of class: factor')

  expect_error(ValidateNSVB(data_val = nsvb_b61,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               '"decay" must be a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateNSVB(data_val = nsvb_b62,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               '"species" must be a character variable.\nYou have input a variable of class: factor')

  expect_error(ValidateNSVB(data_val = nsvb_b63,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               '"top" must be a character variable.\nYou have input a variable of class: factor')

  # Numeric --------------------------------------------------------------------
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

  expect_error(ValidateNSVB(data_val = nsvb_b64,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'There are negative expansion factors in the provided dataframe. All expansion factors must be >= 0.')

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


test_that("Decay class handling works", {

  expect_error(ValidateNSVB(data_val = nsvb_b29,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'decay_class must be 0 through 5!\nUnrecognized decay class codes: 44 8')

  expect_warning(ValidateNSVB(data_val = nsvb_b30,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'There are dead trees with NA and/or 0 decay class codes.\nThese trees will be assigned a decay class of 3.\nConsider investigating these trees with mismatched status/decay class.\n')

  expect_warning(ValidateNSVB(data_val = nsvb_b31,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'There are live trees with 1-5 decay class codes.\nLive trees should have decay class codes of NA or 0.\nThese trees will still be considered live in the biomass/carbon calculations.\nBut you should consider investigating these trees with mismatched status/decay class.\n')

})


test_that("Species code handling works", {

  # FIA ------------------------------------------------------------------------
  expect_error(ValidateNSVB(data_val = nsvb_gif,
                            sp_val = "4letter", # set to 4letter but fia used
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'No species codes recognized!\nCheck how you set the "sp_codes" parameter.')

  expect_error(ValidateNSVB(data_val = nsvb_b32,
                            sp_val = "fia",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Not all species codes were recognized!\nUnrecognized codes: 155')

  expect_error(ValidateNSVB(data_val = nsvb_b33,
                            sp_val = "fia",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'There are live trees with a species code of 998.\n998 is for unknown DEAD hardwoods. Consider using the species code 999, which is for unknown live or dead trees.')

  expect_error(ValidateNSVB(data_val = nsvb_b34,
                            sp_val = "fia",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'There are live trees with a species code of 299.\n299 is for unknown DEAD conifers. Consider using the species code 999, which is for unknown live or dead trees.')

  # 4-letter -------------------------------------------------------------------
  expect_error(ValidateNSVB(data_val = nsvb_gm4,
                            sp_val = "fia", # set to fia but 4letter used
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'No species codes recognized!\nCheck how you set the "sp_codes" parameter.')

  expect_error(ValidateNSVB(data_val = nsvb_b35,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Not all species codes were recognized!\nUnrecognized codes: ABCOO')

  expect_error(ValidateNSVB(data_val = nsvb_b36,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'There are live trees with a species code of "UNHA".\n"UNHA" is for unknown DEAD hardwoods. Consider using the species code "UNTR", which is for unknown live or dead trees.')

  expect_error(ValidateNSVB(data_val = nsvb_b37,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'There are live trees with a species code of "UNCO".\n"UNCO" is for unknown DEAD conifers. Consider using the species code "UNTR", which is for unknown live or dead trees.')

  # General --------------------------------------------------------------------
  expect_warning(ValidateNSVB(data_val = nsvb_b38,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'There are missing species codes in the provided dataframe - outside of plots with exp_factor of 0, signifying plots with no trees, which should have NA species.\nTrees with NA species codes will have NA biomass/carbon estimates.\nConsider assigning unknown dead conifer, unknown dead hardwood, or unknown live or dead tree, as appropriate.\n')

})


test_that("Top handling works", {

  expect_error(ValidateNSVB(data_val = nsvb_b39,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'top must be "Y" or "N"!\nUnrecognized top codes: 0 1')

  expect_warning(ValidateNSVB(data_val = nsvb_b40,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'There are missing tree top codes in the provided dataframe - outside of plots with exp_factor of 0, signifying plots with no trees, which should have NA top.\nThese trees will be assigned top = "Y". Consider investigating these trees.\n')

})


test_that("DBH handling works", {

  expect_warning(ValidateNSVB(data_val = nsvb_b41,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'There are missing DBH values in the provided dataframe - outside of plots with exp_factor of 0, signifying plots with no trees, which should have NA dbh.\nTrees with NA DBH will have NA biomass/carbon estimates. Consider investigating these trees.\n')

  expect_warning(ValidateNSVB(data_val = nsvb_b42,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'The allometric equations are for trees with DBH >= 2.5cm.\nYou inputted trees with DBH < 2.5cm. These trees will have NA biomass/carbon estimates.\n')

  expect_warning(ValidateNSVB(data_val = nsvb_b43,
                              sp_val = "fia",
                              in_units_val = "imperial",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'The allometric equations are for trees with DBH >= 1.0in.\nYou inputted trees with DBH < 1.0in. These trees will have NA biomass/carbon estimates.\n')

})


test_that("Height handling works", {

  expect_warning(ValidateNSVB(data_val = nsvb_b44,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'There are missing ht1 values in the provided dataframe - outside of plots with exp_factor of 0, signifying plots with no trees, which should have NA ht1.\nTrees with NA ht1 will have NA biomass/carbon estimates.\n')

  expect_warning(ValidateNSVB(data_val = nsvb_b45,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'There are trees without tops, top = "N", with missing ht2 values in the provided dataframe.\nTrees without tops with NA ht2 will have NA biomass/carbon estimates.\n')

  expect_warning(ValidateNSVB(data_val = nsvb_b46,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'The allometric equations are for trees with height >= 1.37m.\nYou inputted trees with ht1 < 1.37m. These trees will have NA biomass/carbon estimates.\n')

  expect_warning(ValidateNSVB(data_val = nsvb_b47,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'The allometric equations are for trees with height >= 1.37m.\nYou inputted trees with ht2 < 1.37m. These trees will have NA biomass/carbon estimates.\n')

  expect_warning(ValidateNSVB(data_val = nsvb_b48,
                              sp_val = "fia",
                              in_units_val = "imperial",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'The allometric equations are for trees with height >= 4.5ft.\nYou inputted trees with ht1 < 4.5ft. These trees will have NA biomass/carbon estimates.\n')

  expect_warning(ValidateNSVB(data_val = nsvb_b49,
                              sp_val = "fia",
                              in_units_val = "imperial",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'The allometric equations are for trees with height >= 4.5ft.\nYou inputted trees with ht2 < 4.5ft. These trees will have NA biomass/carbon estimates.\n')

  expect_error(ValidateNSVB(data_val = nsvb_b50,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'There are trees with ht2 > ht1. ht1 must be greater than ht2.\n')

  expect_warning(ValidateNSVB(data_val = nsvb_b51,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'There are trees with intact tops, top = "Y", with non-NA ht2 values in the provided dataframe.\nTrees with intact tops should not require ht2 values.\nThese trees will still be treated as if they have intact tops in the biomass/carbon estimations.\nBut you should consider investigating these trees with mismatched top/ht2.\n')

})


test_that("Crown ratio handling works", {

  expect_warning(ValidateNSVB(data_val = nsvb_b52,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'There are live trees with missing live crown ratio values in the provided dataframe - outside of plots with exp_factor of 0, signifying plots with no trees, which should have NA crown_ratio.\nLive trees with NA crown_ratio will have mean crown ratios substituted in from table S11. Consider investigating these trees.\n')

  expect_error(ValidateNSVB(data_val = nsvb_b53,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Crown ratio must be between 0 and 1! You inputted crown ratio values outside of this range.')

  expect_warning(ValidateNSVB(data_val = nsvb_b54,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'There are dead trees with live crown ratio values in the provided dataframe.\nDead trees should not have live crown ratios. Live crown ratios for dead trees will be overwritten to follow the NSVB framework.\n')

})


test_that("Cull handling works", {

  expect_warning(ValidateNSVB(data_val = nsvb_b55,
                              sp_val = "4letter",
                              in_units_val = "metric",
                              out_units_val = "imperial",
                              results_val = "by_plot"),
                 'There are trees with missing cull values in the provided dataframe - outside of plots with exp_factor of 0, signifying plots with no trees, which should have NA cull.\nThese trees will be assigned a cull of 0, assuming no cull. Consider investigating these trees.\n')

  expect_error(ValidateNSVB(data_val = nsvb_b56,
                            sp_val = "4letter",
                            in_units_val = "metric",
                            out_units_val = "imperial",
                            results_val = "by_plot"),
               'Cull must be between 0 and 100! You inputted cull values outside of this range.')

})

