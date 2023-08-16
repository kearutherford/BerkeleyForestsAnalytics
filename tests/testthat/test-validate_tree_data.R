
test_that("Properly formatted data frames throw no errors, warnings, or messages", {

  expect_no_error(ValidateTreeData(data_val = good_trees_metric,
                                   status_val = "Live",
                                   sp_val = "SPP",
                                   dbh_val = "DBH_CM",
                                   ht_val = "HT_M",
                                   sp_codes_val = "4letter",
                                   units = "metric"))

  expect_no_warning(ValidateTreeData(data_val = good_trees_metric,
                                     status_val = "Live",
                                     sp_val = "SPP",
                                     dbh_val = "DBH_CM",
                                     ht_val = "HT_M",
                                     sp_codes_val = "4letter",
                                     units = "metric"))

  expect_no_message(ValidateTreeData(data_val = good_trees_metric,
                                     status_val = "Live",
                                     sp_val = "SPP",
                                     dbh_val = "DBH_CM",
                                     ht_val = "HT_M",
                                     sp_codes_val = "4letter",
                                     units = "metric"))

})


test_that("Dataframes have expected column names", {

  expect_named(ValidateTreeData(data_val = good_trees_metric,
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                ht_val = "HT_M",
                                sp_codes_val = "4letter",
                                units = "metric"),
               c("Plot", "status", "species", "dbh_cm", "ht_m", "dbh_in", "ht_ft"))

  expect_named(ValidateTreeData(data_val = good_trees_imperial,
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_IN",
                                ht_val = "HT_FT",
                                sp_codes_val = "4letter",
                                units = "imperial"),
               c("Plot", "status", "species",  "dbh_in", "ht_ft", "dbh_cm", "ht_m"))

})


test_that("Unrecognized column names throw an error", {

  expect_error(ValidateTreeData(data_val = good_trees_metric,
                                status_val = "Liv", # intentional error here
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                ht_val = "HT_M",
                                sp_codes_val = "4letter",
                                units = "metric"),
               'There is no column named "Liv" in the provided dataframe.')

  expect_error(ValidateTreeData(data_val = good_trees_metric,
                                status_val = "Live",
                                sp_val = "SPPP", # intentional error here
                                dbh_val = "DBH_CM",
                                ht_val = "HT_M",
                                sp_codes_val = "4letter",
                                units = "metric"),
               'There is no column named "SPPP" in the provided dataframe.')

  expect_error(ValidateTreeData(data_val = good_trees_metric,
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CN", # intentional error here
                                ht_val = "HT_M",
                                sp_codes_val = "4letter",
                                units = "metric"),
               'There is no column named "DBH_CN" in the provided dataframe.')

  expect_error(ValidateTreeData(data_val = good_trees_metric,
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                ht_val = "HT_N", # intentional error here
                                sp_codes_val = "4letter",
                                units = "metric"),
               'There is no column named "HT_N" in the provided dataframe.')

})


test_that("Invalid settings throw an error", {

  expect_error(ValidateTreeData(data_val = good_trees_metric,
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                ht_val = "HT_M",
                                sp_codes_val = "letter", # intentional error here
                                units = "metric"),
               'The "sp_codes" parameter must be set to either "4letter" or "fia."')

  expect_error(ValidateTreeData(data_val = good_trees_metric,
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                ht_val = "HT_M",
                                sp_codes_val = "4letter",
                                units = "metri"), # intentional error here
               'The "units" parameter must be set to either "metric" or "imperial."')

})


test_that("Column class handling works", {

  expect_error(ValidateTreeData(data_val = bad_trees,
                                status_val = "Live_v1",
                                sp_val = "SPP4",
                                dbh_val = "DBH_CM_bad1", # intentional error here
                                ht_val = "HT_M",
                                sp_codes_val = "4letter",
                                units = "metric"),
               'The parameter dbh requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateTreeData(data_val = bad_trees,
                                status_val = "Live_v1",
                                sp_val = "SPP4",
                                dbh_val = "DBH_CM",
                                ht_val = "HT_M_bad1", # intentional error here
                                sp_codes_val = "4letter",
                                units = "metric"),
               'The parameter ht requires a numerical variable.\nYou have input a variable of class: factor')

})

test_that("Status code handling works", {

  expect_error(ValidateTreeData(data_val = bad_trees,
                                status_val = "Live_bad1",
                                sp_val = "SPP4",
                                dbh_val = "DBH_CM",
                                ht_val = "HT_M",
                                sp_codes_val = "4letter",
                                units = "metric"),
               'Status must be 0 or 1!\nUnrecognized status codes: D L')

})


test_that("Species code handling works", {

  expect_error(ValidateTreeData(data_val = bad_trees,
                                status_val = "Live_v1",
                                sp_val = "SPP4_bad1",
                                dbh_val = "DBH_CM",
                                ht_val = "HT_M",
                                sp_codes_val = "4letter",
                                units = "metric"),
               'Not all species codes were recognized!\nUnrecognized codes: CADD')

  expect_error(ValidateTreeData(data_val = bad_trees,
                                status_val = "Live_v1",
                                sp_val = "SPP4_bad2",
                                dbh_val = "DBH_CM",
                                ht_val = "HT_M",
                                sp_codes_val = "4letter",
                                units = "metric"),
               'No species codes recognized!\nCheck how you set the "sp_codes" parameter.')

  expect_error(ValidateTreeData(data_val = bad_trees,
                                status_val = "Live_v1",
                                sp_val = "SPP_fia_bad1",
                                dbh_val = "DBH_CM",
                                ht_val = "HT_M",
                                sp_codes_val = "fia",
                                units = "metric"),
               'Not all species codes were recognized!\nUnrecognized codes: 1222')

  expect_error(ValidateTreeData(data_val = bad_trees,
                                status_val = "Live_v1",
                                sp_val = "SPP_fia_bad2",
                                dbh_val = "DBH_CM",
                                ht_val = "HT_M",
                                sp_codes_val = "fia",
                                units = "metric"),
               'No species codes recognized!\nCheck how you set the "sp_codes" parameter.')

})


test_that("DBH range handling works", {

  # DBH range for live trees
  expect_warning(ValidateTreeData(data_val = bad_trees,
                                  status_val = "Live_v1",
                                  sp_val = "SPP4",
                                  dbh_val = "DBH_CM_bad2",
                                  ht_val = "HT_M",
                                  sp_codes_val = "4letter",
                                  units = "metric"),
                 'The allometric equations are for live trees with DBH >= 2.5cm and dead trees with DBH >= 12.7cm.\nYou inputted live trees with DBH < 2.5cm. These trees will have NA biomass estimates.\n')

  expect_warning(ValidateTreeData(data_val = bad_trees,
                                  status_val = "Live_v1",
                                  sp_val = "SPP4",
                                  dbh_val = "DBH_IN_bad1",
                                  ht_val = "HT_FT",
                                  sp_codes_val = "4letter",
                                  units = "imperial"),
                 'The allometric equations are for live trees with DBH >= 1.0in and dead trees with DBH >= 5.0in.\nYou inputted live trees with DBH < 1.0in. These trees will have NA biomass estimates.\n')

  # DBH range for dead trees
  expect_warning(ValidateTreeData(data_val = bad_trees,
                                  status_val = "Live_v2",
                                  sp_val = "SPP4",
                                  dbh_val = "DBH_CM_bad3",
                                  ht_val = "HT_M",
                                  sp_codes_val = "4letter",
                                  units = "metric"),
                 'The allometric equations are for live trees with DBH >= 2.5cm and dead trees with DBH >= 12.7cm.\nYou inputted dead trees with DBH < 12.7cm. These trees will have NA biomass estimates.\n')

  expect_warning(ValidateTreeData(data_val = bad_trees,
                                  status_val = "Live_v2",
                                  sp_val = "SPP4",
                                  dbh_val = "DBH_IN_bad2",
                                  ht_val = "HT_FT",
                                  sp_codes_val = "4letter",
                                  units = "imperial"),
                 'The allometric equations are for live trees with DBH >= 1.0in and dead trees with DBH >= 5.0in.\nYou inputted dead trees with DBH < 5.0in. These trees will have NA biomass estimates.\n')

})


test_that("Height range handling works", {

  expect_warning(ValidateTreeData(data_val = bad_trees,
                                  status_val = "Live_v1",
                                  sp_val = "SPP4",
                                  dbh_val = "DBH_CM",
                                  ht_val = "HT_M_bad2",
                                  sp_codes_val = "4letter",
                                  units = "metric"),
                 'The allometric equations are for trees with height >= 1.37m.\nYou inputted trees with height < 1.37m. These trees will have NA biomass estimates.\n')

  expect_warning(ValidateTreeData(data_val = bad_trees,
                                  status_val = "Live_v1",
                                  sp_val = "SPP4",
                                  dbh_val = "DBH_IN",
                                  ht_val = "HT_FT_bad1",
                                  sp_codes_val = "4letter",
                                  units = "imperial"),
                 'The allometric equations are for trees with height >= 4.5ft.\nYou inputted trees with height < 4.5ft. These trees will have NA biomass estimates.\n')

})


test_that("NA handling works", {

  expect_warning(ValidateTreeData(data_val = bad_trees,
                                  status_val = "Live_v1",
                                  sp_val = "SPP4_NA",
                                  dbh_val = "DBH_CM",
                                  ht_val = "HT_M",
                                  sp_codes_val = "4letter",
                                  units = "metric"),
                 'There are missing species codes in the provided dataframe.\nTrees with NA species codes will have NA biomass estimates.\nConsider assigning unknown conifer, unknown hardwood, or unknown tree, as appropriate.\n')

  expect_warning(ValidateTreeData(data_val = bad_trees,
                                  status_val = "Live_v1",
                                  sp_val = "SPP4",
                                  dbh_val = "DBH_NA",
                                  ht_val = "HT_M",
                                  sp_codes_val = "4letter",
                                  units = "metric"),
                 'There are missing DBH values in the provided dataframe.\nTrees with NA DBH will have NA biomass estimates.\n')

  expect_warning(ValidateTreeData(data_val = bad_trees,
                                  status_val = "Live_v1",
                                  sp_val = "SPP4",
                                  dbh_val = "DBH_CM",
                                  ht_val = "HT_NA",
                                  sp_codes_val = "4letter",
                                  units = "metric"),
                 'There are missing tree height values in the provided dataframe.\nTrees with NA height will have NA biomass estimates.\n')

  expect_warning(ValidateTreeData(data_val = bad_trees,
                                  status_val = "Live_NA",
                                  sp_val = "SPP4",
                                  dbh_val = "DBH_CM",
                                  ht_val = "HT_M",
                                  sp_codes_val = "4letter",
                                  units = "metric"),
                 'There are missing status codes in the provided dataframe.\nTrees with NA status codes will have NA biomass estimates.\n')

})

