
test_that("Properly formatted data frames throw no errors, warnings, or messages", {

  expect_no_error(ValidateStrData(data_val = good_comp_metric,
                                  site_val = "Forest",
                                  plot_val = "Plot_id",
                                  ef_val = "SPH",
                                  dbh_val = "DBH_CM",
                                  ht_val = "ignore",
                                  units_val = "metric"))

  expect_no_warning(ValidateStrData(data_val = good_comp_metric,
                                    site_val = "Forest",
                                    plot_val = "Plot_id",
                                    ef_val = "SPH",
                                    dbh_val = "DBH_CM",
                                    ht_val = "ignore",
                                    units_val = "metric"))

  expect_no_message(ValidateStrData(data_val = good_comp_metric,
                                    site_val = "Forest",
                                    plot_val = "Plot_id",
                                    ef_val = "SPH",
                                    dbh_val = "DBH_CM",
                                    ht_val = "ignore",
                                    units_val = "metric"))

})


test_that("Dataframes have expected column names", {

  expect_named(ValidateStrData(data_val = good_comp_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               dbh_val = "DBH_CM",
                               ht_val = "ignore",
                               units_val = "metric"),
               c("site", "plot", "ef", "dbh"))

  expect_named(ValidateStrData(data_val = good_comp_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               units_val = "metric"),
               c("site", "plot", "ef", "dbh", "ht"))

})


test_that("Unrecognized column names throw an error", {

  expect_error(ValidateStrData(data_val = good_comp_metric,
                               site_val = "For", # intentional error here
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               units_val = "metric"),
               'There is no column named "For" in the provided dataframe.')

  expect_error(ValidateStrData(data_val = good_comp_metric,
                               site_val = "Forest",
                               plot_val = "Plot", # intentional error here
                               ef_val = "SPH",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               units_val = "metric"),
               'There is no column named "Plot" in the provided dataframe.')

  expect_error(ValidateStrData(data_val = good_comp_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "stems", # intentional error here
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               units_val = "metric"),
               'There is no column named "stems" in the provided dataframe.')

  expect_error(ValidateStrData(data_val = good_comp_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               dbh_val = "DBH", # intentional error here
                               ht_val = "HT_M",
                               units_val = "metric"),
               'There is no column named "DBH" in the provided dataframe.')

  expect_error(ValidateStrData(data_val = good_comp_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               dbh_val = "DBH_CM",
                               ht_val = "HT", # intentional error here
                               units_val = "metric"),
               'There is no column named "HT" in the provided dataframe.')

})


test_that("Invalid settings throw an error", {

  expect_error(ValidateStrData(data_val = good_comp_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               dbh_val = "DBH_CM",
                               ht_val = "ignore",
                               units_val = "metri"), # intentional error here
               'The "units" parameter must be set to either "metric" or "imperial".')

})


test_that("Column class handling works", {

  expect_error(ValidateStrData(data_val = bad_comp,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH_bad", # intentional error here
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               units_val = "metric"),
               'The parameter exp_factor requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateStrData(data_val = bad_comp,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               dbh_val = "DBH_bad", # intentional error here
                               ht_val = "HT_M",
                               units_val = "metric"),
               'The parameter dbh requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateStrData(data_val = bad_comp,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_bad", # intentional error here
                               units_val = "metric"),
               'The parameter ht requires a numerical variable.\nYou have input a variable of class: character')

})


test_that("NA handling works", {

  expect_error(ValidateStrData(data_val = bad_comp,
                               site_val = "Forest_NA", # intentional error here
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               dbh_val = "DBH_CM",
                               ht_val = "ignore",
                               units_val = "metric"),
               'There are missing site names in the provided dataframe.')

  expect_error(ValidateStrData(data_val = bad_comp,
                               site_val = "Forest",
                               plot_val = "Plot_id_NA", # intentional error here
                               ef_val = "SPH",
                               dbh_val = "DBH_CM",
                               ht_val = "ignore",
                               units_val = "metric"),
               'There are missing plot names in the provided dataframe.')

  expect_error(ValidateStrData(data_val = bad_comp,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH_NA", # intentional error here
                               dbh_val = "DBH_CM",
                               ht_val = "ignore",
                               units_val = "metric"),
               'There are missing expansion factors in the provided dataframe.\nFor plots with no trees, put zero for the expansion factor.')

  expect_warning(ValidateStrData(data_val = bad_comp,
                                 site_val = "Forest",
                                 plot_val = "Plot_id",
                                 ef_val = "SPH",
                                 dbh_val = "DBH_NA", # intentional error here
                                 ht_val = "ignore",
                                 units_val = "metric"),
                 'There are trees with missing DBH values in the provided dataframe.\nConsider addressing these missing values in your data.\n')

  expect_warning(ValidateStrData(data_val = bad_comp,
                                 site_val = "Forest",
                                 plot_val = "Plot_id",
                                 ef_val = "SPH",
                                 dbh_val = "DBH_CM",
                                 ht_val = "HT_NA", # intentional error here
                                 units_val = "metric"),
                 'There are trees with missing height values in the provided dataframe.\nConsider addressing these missing values in your data.\n')

})


test_that("Plots with no trees handling works", {

  expect_no_warning(ValidateStrData(data_val = bad_comp,
                                    site_val = "Forest",
                                    plot_val = "Plot_id_NT",
                                    ef_val = "SPH_NT",
                                    dbh_val = "DBH_NT",
                                    ht_val = "HT_NT",
                                    units_val = "metric"))

})

