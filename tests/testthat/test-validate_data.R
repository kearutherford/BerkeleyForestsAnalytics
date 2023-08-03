
test_that("Properly formatted data frames throw no errors, warnings, or messages", {

  expect_no_error(ValidateData(data_val = good_trees,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units = "metric"))

  expect_no_warning(ValidateData(data_val = good_trees,
                                 site_val = "Forest",
                                 plot_val = "Plot_id",
                                 sp_val = "SPP",
                                 dbh_val = "DBH_CM",
                                 ht_val = "HT_M",
                                 sp_codes_val = "4letter",
                                 units = "metric"))

  expect_no_message(ValidateData(data_val = good_trees,
                                 site_val = "Forest",
                                 plot_val = "Plot_id",
                                 sp_val = "SPP",
                                 dbh_val = "DBH_CM",
                                 ht_val = "HT_M",
                                 sp_codes_val = "4letter",
                                 units = "metric"))

})


test_that("Data frames have expected column names", {

  expect_named((ValidateData(data_val = good_trees,
                             site_val = "Forest",
                             plot_val = "Plot_id",
                             sp_val = "SPP",
                             dbh_val = "DBH_CM",
                             ht_val = "HT_M",
                             sp_codes_val = "4letter",
                             units = "metric")[,1:8]),
               c("site", "plot", "species", "Status", "dbh_cm", "ht_m", "dbh_in", "ht_ft"))

})


test_that("Unrecognized column names throw an error", {

  expect_error(ValidateData(data_val = good_trees,
                            site_val = "For",  # intentional error here
                            plot_val = "Plot_id",
                            sp_val = "SPP",
                            dbh_val = "DBH_CM",
                            ht_val = "HT_M",
                            sp_codes_val = "4letter",
                            units = "metric"),
               'There is no column named "For" in the provided dataframe.')

  expect_error(ValidateData(data_val = good_trees,
                            site_val = "Forest",
                            plot_val = "Plot", # intentional error here
                            sp_val = "SPP",
                            dbh_val = "DBH_CM",
                            ht_val = "HT_M",
                            sp_codes_val = "4letter",
                            units = "metric"),
               'There is no column named "Plot" in the provided dataframe.')

  expect_error(ValidateData(data_val = good_trees,
                            site_val = "Forest",
                            plot_val = "Plot_id",
                            sp_val = "SPPP", # intentional error here
                            dbh_val = "DBH_CM",
                            ht_val = "HT_M",
                            sp_codes_val = "4letter",
                            units = "metric"),
               'There is no column named "SPPP" in the provided dataframe.')

  expect_error(ValidateData(data_val = good_trees,
                            site_val = "Forest",
                            plot_val = "Plot_id",
                            sp_val = "SPP",
                            dbh_val = "DBH_CN", # intentional error here
                            ht_val = "HT_M",
                            sp_codes_val = "4letter",
                            units = "metric"),
               'There is no column named "DBH_CN" in the provided dataframe.')

  expect_error(ValidateData(data_val = good_trees,
                            site_val = "Forest",
                            plot_val = "Plot_id",
                            sp_val = "SPP",
                            dbh_val = "DBH_CM",
                            ht_val = "HT_N", # intentional error here
                            sp_codes_val = "4letter",
                            units = "metric"),
               'There is no column named "HT_N" in the provided dataframe.')

})


test_that("Invalid settings throw an error", {

  expect_error((ValidateData(data_val = good_trees,
                             site_val = "Forest",
                             plot_val = "Plot_id",
                             sp_val = "SPP",
                             dbh_val = "DBH_CM",
                             ht_val = "HT_M",
                             sp_codes_val = "letter", # intentional error here
                             units = "metric")),
               'The "sp_codes" parameter must be set to either "4letter" or "fia."')

  expect_error((ValidateData(data_val = good_trees,
                             site_val = "Forest",
                             plot_val = "Plot_id",
                             sp_val = "SPP",
                             dbh_val = "DBH_CM",
                             ht_val = "HT_M",
                             sp_codes_val = "4letter",
                             units = "metri")), # intentional error here
               'The "units" parameter must be set to either "metric" or "imperial."')

})


test_that("Column class handling works", {

  expect_error(ValidateData(data_val = bad_trees,
                            site_val = "Forest",
                            plot_val = "Plot_id",
                            sp_val = "SPP4",
                            dbh_val = "DBH_CM_bad1", # intentional error here
                            ht_val = "HT_M",
                            sp_codes_val = "4letter",
                            units = "metric"),
               'The parameter dbh requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateData(data_val = bad_trees,
                            site_val = "Forest",
                            plot_val = "Plot_id",
                            sp_val = "SPP4",
                            dbh_val = "DBH_CM",
                            ht_val = "HT_M_bad1", # intentional error here
                            sp_codes_val = "4letter",
                            units = "metric"),
               'The parameter ht requires a numerical variable.\nYou have input a variable of class: factor')

})


test_that("Species code handling works", {

  expect_error(ValidateData(data_val = bad_trees,
                            site_val = "Forest",
                            plot_val = "Plot_id",
                            sp_val = "SPP4_bad1",
                            dbh_val = "DBH_CM",
                            ht_val = "HT_M",
                            sp_codes_val = "4letter",
                            units = "metric"),
               'Not all species codes were recognized!\nUnrecognized codes: CADD')

  expect_error(ValidateData(data_val = bad_trees,
                            site_val = "Forest",
                            plot_val = "Plot_id",
                            sp_val = "SPP4_bad2",
                            dbh_val = "DBH_CM",
                            ht_val = "HT_M",
                            sp_codes_val = "4letter",
                            units = "metric"),
               'No species codes recognized!\nCheck how you set the "sp_codes" parameter.')

  expect_error(ValidateData(data_val = bad_trees,
                            site_val = "Forest",
                            plot_val = "Plot_id",
                            sp_val = "SPP_fia_bad1",
                            dbh_val = "DBH_CM",
                            ht_val = "HT_M",
                            sp_codes_val = "fia",
                            units = "metric"),
               'Not all species codes were recognized!\nUnrecognized codes: 1222')

  expect_error(ValidateData(data_val = bad_trees,
                            site_val = "Forest",
                            plot_val = "Plot_id",
                            sp_val = "SPP_fia_bad2",
                            dbh_val = "DBH_CM",
                            ht_val = "HT_M",
                            sp_codes_val = "fia",
                            units = "metric"),
               'No species codes recognized!\nCheck how you set the "sp_codes" parameter.')

})


test_that("DBH and ht range handling works", {

  expect_warning(ValidateData(data_val = bad_trees,
                              site_val = "Forest",
                              plot_val = "Plot_id",
                              sp_val = "SPP4",
                              dbh_val = "DBH_CM_bad2",
                              ht_val = "HT_M",
                              sp_codes_val = "4letter",
                              units = "metric"),
                 'The allometric equations are for trees with DBH >= 2.5cm.\nYou inputted trees with DBH < 2.5cm. These trees were filtered out.\n')

  expect_warning(ValidateData(data_val = bad_trees,
                              site_val = "Forest",
                              plot_val = "Plot_id",
                              sp_val = "SPP4",
                              dbh_val = "DBH_CM",
                              ht_val = "HT_M_bad2",
                              sp_codes_val = "4letter",
                              units = "metric"),
                 'The allometric equations are for trees with height >= 1.37m.\nYou inputted trees with height < 1.37m. These trees were filtered out.\n')

  expect_warning(ValidateData(data_val = bad_trees,
                              site_val = "Forest",
                              plot_val = "Plot_id",
                              sp_val = "SPP4",
                              dbh_val = "DBH_IN_bad1",
                              ht_val = "HT_M",
                              sp_codes_val = "4letter",
                              units = "imperial"),
                 'The allometric equations are for trees with DBH >= 1.0in.\nYou inputted trees with DBH < 1.0in. These trees were filtered out.\n')

  expect_warning(ValidateData(data_val = bad_trees,
                              site_val = "Forest",
                              plot_val = "Plot_id",
                              sp_val = "SPP4",
                              dbh_val = "DBH_CM",
                              ht_val = "HT_FT_bad1",
                              sp_codes_val = "4letter",
                              units = "imperial"),
                 'The allometric equations are for trees with height >= 4.5ft.\nYou inputted trees with height < 4.5ft. These trees were filtered out.\n')

})


test_that("NA handling works", {

  expect_warning(ValidateData(data_val = bad_trees,
                              site_val = "Forest",
                              plot_val = "Plot_id",
                              sp_val = "SPP4_NA",
                              dbh_val = "DBH_CM",
                              ht_val = "HT_M",
                              sp_codes_val = "4letter",
                              units = "metric"))


  expect_warning(ValidateData(data_val = bad_trees,
                              site_val = "Forest",
                              plot_val = "Plot_id",
                              sp_val = "SPP4",
                              dbh_val = "DBH_NA",
                              ht_val = "HT_M",
                              sp_codes_val = "4letter",
                              units = "metric"))

  expect_warning(ValidateData(data_val = bad_trees,
                              site_val = "Forest",
                              plot_val = "Plot_id",
                              sp_val = "SPP4",
                              dbh_val = "DBH_CM",
                              ht_val = "HT_NA",
                              sp_codes_val = "4letter",
                              units = "metric"))

})

