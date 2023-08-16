
test_that("Properly formatted data frames throw no errors, warnings, or messages", {

  expect_no_error(ValidateCompData(data_val = good_comp_metric,
                                   site_val = "Forest",
                                   plot_val = "Plot_id",
                                   ef_val = "SPH",
                                   status_val = "Live",
                                   sp_val = "SPP",
                                   dbh_val = "DBH_CM",
                                   rel_val = "BA",
                                   units_val = "metric"))

  expect_no_warning(ValidateCompData(data_val = good_comp_metric,
                                     site_val = "Forest",
                                     plot_val = "Plot_id",
                                     ef_val = "SPH",
                                     status_val = "Live",
                                     sp_val = "SPP",
                                     dbh_val = "DBH_CM",
                                     rel_val = "BA",
                                     units_val = "metric"))

  expect_no_message(ValidateCompData(data_val = good_comp_metric,
                                     site_val = "Forest",
                                     plot_val = "Plot_id",
                                     ef_val = "SPH",
                                     status_val = "Live",
                                     sp_val = "SPP",
                                     dbh_val = "DBH_CM",
                                     rel_val = "BA",
                                     units_val = "metric"))

})


test_that("Dataframes have expected column names", {

  expect_named(ValidateCompData(data_val = good_comp_metric,
                                site_val = "Forest",
                                plot_val = "Plot_id",
                                ef_val = "SPH",
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                rel_val = "BA",
                                units_val = "metric"),
               c("site", "plot", "ef", "status", "species", "dbh"))

})


test_that("Unrecognized column names throw an error", {

  expect_error(ValidateCompData(data_val = good_comp_metric,
                                site_val = "For", # intentional error here
                                plot_val = "Plot_id",
                                ef_val = "SPH",
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                rel_val = "BA",
                                units_val = "metric"),
               'There is no column named "For" in the provided dataframe.')

  expect_error(ValidateCompData(data_val = good_comp_metric,
                                site_val = "Forest",
                                plot_val = "Plot", # intentional error here
                                ef_val = "SPH",
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                rel_val = "BA",
                                units_val = "metric"),
               'There is no column named "Plot" in the provided dataframe.')

  expect_error(ValidateCompData(data_val = good_comp_metric,
                                site_val = "Forest",
                                plot_val = "Plot_id",
                                ef_val = "stems", # intentional error here
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                rel_val = "BA",
                                units_val = "metric"),
               'There is no column named "stems" in the provided dataframe.')

  expect_error(ValidateCompData(data_val = good_comp_metric,
                                site_val = "Forest",
                                plot_val = "Plot_id",
                                ef_val = "SPH",
                                status_val = "Dead", # intentional error here
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                rel_val = "BA",
                                units_val = "metric"),
               'There is no column named "Dead" in the provided dataframe.')

  expect_error(ValidateCompData(data_val = good_comp_metric,
                                site_val = "Forest",
                                plot_val = "Plot_id",
                                ef_val = "SPH",
                                status_val = "Live",
                                sp_val = "SPP4", # intentional error here
                                dbh_val = "DBH_CM",
                                rel_val = "BA",
                                units_val = "metric"),
               'There is no column named "SPP4" in the provided dataframe.')

  expect_error(ValidateCompData(data_val = good_comp_metric,
                                site_val = "Forest",
                                plot_val = "Plot_id",
                                ef_val = "SPH",
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH", # intentional error here
                                rel_val = "BA",
                                units_val = "metric"),
               'There is no column named "DBH" in the provided dataframe.')

})


test_that("Invalid settings throw an error", {

  expect_error(ValidateCompData(data_val = good_comp_metric,
                                site_val = "Forest",
                                plot_val = "Plot_id",
                                ef_val = "SPH",
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                rel_val = "stems", # intentional error here
                                units_val = "metric"),
               'The "relative" parameter must be set to either "BA" or "density".')

  expect_error(ValidateCompData(data_val = good_comp_metric,
                                site_val = "Forest",
                                plot_val = "Plot_id",
                                ef_val = "SPH",
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                rel_val = "BA",
                                units_val = "metri"), # intentional error here
               'The "units" parameter must be set to either "metric" or "imperial".')

})


test_that("Column class handling works", {

  expect_error(ValidateCompData(data_val = bad_comp,
                                site_val = "Forest",
                                plot_val = "Plot_id",
                                ef_val = "SPH_bad", # intentional error here
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                rel_val = "BA",
                                units_val = "metric"),
               'The parameter exp_factor requires a numerical variable.\nYou have input a variable of class: character')

  expect_error(ValidateCompData(data_val = bad_comp,
                                site_val = "Forest",
                                plot_val = "Plot_id",
                                ef_val = "SPH",
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_bad", # intentional error here
                                rel_val = "BA",
                                units_val = "metric"),
               'The parameter dbh requires a numerical variable.\nYou have input a variable of class: character')

})


test_that("Status code handling works", {

  expect_error(ValidateCompData(data_val = bad_comp,
                                site_val = "Forest",
                                plot_val = "Plot_id",
                                ef_val = "SPH",
                                status_val = "Live_bad", # intentional error here
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                rel_val = "BA",
                                units_val = "metric"),
               'Status must be 0 or 1!\nUnrecognized status codes: D L')

})


test_that("NA handling works", {

  expect_error(ValidateCompData(data_val = bad_comp,
                                site_val = "Forest_NA",  # intentional error here
                                plot_val = "Plot_id",
                                ef_val = "SPH",
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                rel_val = "BA",
                                units_val = "metric"),
               'There are missing site names in the provided dataframe.')

  expect_error(ValidateCompData(data_val = bad_comp,
                                site_val = "Forest",
                                plot_val = "Plot_id_NA", # intentional error here
                                ef_val = "SPH",
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                rel_val = "BA",
                                units_val = "metric"),
               'There are missing plot names in the provided dataframe.')

  expect_error(ValidateCompData(data_val = bad_comp,
                                site_val = "Forest",
                                plot_val = "Plot_id",
                                ef_val = "SPH_NA", # intentional error here
                                status_val = "Live",
                                sp_val = "SPP",
                                dbh_val = "DBH_CM",
                                rel_val = "BA",
                                units_val = "metric"),
               'There are missing expansion factors in the provided dataframe.\nFor plots with no trees, put zero for the expansion factor.\n')

  expect_warning(ValidateCompData(data_val = bad_comp,
                                  site_val = "Forest",
                                  plot_val = "Plot_id",
                                  ef_val = "SPH",
                                  status_val = "Live",
                                  sp_val = "SPP_NA", # intentional error here
                                  dbh_val = "DBH_CM",
                                  rel_val = "BA",
                                  units_val = "metric"),
                 'There are trees with missing species codes in the provided dataframe.\nTrees with NA species codes will be assigned "UNTR" for unknown tree.\n')

  expect_warning(ValidateCompData(data_val = bad_comp,
                                  site_val = "Forest",
                                  plot_val = "Plot_id",
                                  ef_val = "SPH",
                                  status_val = "Live",
                                  sp_val = "SPP",
                                  dbh_val = "DBH_NA", # intentional error here
                                  rel_val = "BA",
                                  units_val = "metric"),
                 'There are trees with missing DBH values in the provided dataframe.\nTrees with NA DBH will not be included in the composition calculations.\nConsider addressing these missing values in your data.\n')

  expect_no_warning(ValidateCompData(data_val = bad_comp,
                                     site_val = "Forest",
                                     plot_val = "Plot_id",
                                     ef_val = "SPH",
                                     status_val = "Live",
                                     sp_val = "SPP",
                                     dbh_val = "DBH_NA", # intentional error here
                                     rel_val = "density", # set to density
                                     units_val = "metric"))

  expect_warning(ValidateCompData(data_val = bad_comp,
                                  site_val = "Forest",
                                  plot_val = "Plot_id",
                                  ef_val = "SPH",
                                  status_val = "Live_NA", # intentional error here
                                  sp_val = "SPP",
                                  dbh_val = "DBH_CM",
                                  rel_val = "BA",
                                  units_val = "metric"),
                 'There are trees with missing status codes in the provided dataframe.\nTrees with NA status codes will not be included in the composition calculations.\nConsider addressing these missing values in your data.\n')

})


test_that("Plots with no trees handling works", {

  expect_no_error(ValidateCompData(data_val = bad_comp,
                                   site_val = "Forest",
                                   plot_val = "Plot_id_NT",
                                   ef_val = "SPH_NT",
                                   status_val = "Live_NT",
                                   sp_val = "SPP_NT",
                                   dbh_val = "DBH_NT",
                                   rel_val = "BA",
                                   units_val = "metric"))

})

