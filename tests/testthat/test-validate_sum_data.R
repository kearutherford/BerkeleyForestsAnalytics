
test_that("Properly formatted data frames throw no errors, warnings, or messages", {

  expect_no_error(ValidateSumData(data_val = good_sum_metric,
                                  site_val = "Forest",
                                  plot_val = "Plot_id",
                                  ef_val = "SPH",
                                  results_val = "by_plot",
                                  status_val = "Live",
                                  sp_val = "SPP"))

  expect_no_warning(ValidateSumData(data_val = good_sum_metric,
                                    site_val = "Forest",
                                    plot_val = "Plot_id",
                                    ef_val = "SPH",
                                    results_val = "by_plot",
                                    status_val = "Live",
                                    sp_val = "SPP"))

  expect_no_message(ValidateSumData(data_val = good_sum_metric,
                                    site_val = "Forest",
                                    plot_val = "Plot_id",
                                    ef_val = "SPH",
                                    results_val = "by_plot",
                                    status_val = "Live",
                                    sp_val = "SPP"))

})


test_that("Dataframes have expected column names", {

  expect_named(ValidateSumData(data_val = good_sum_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP")[1:7],
                c("site", "plot", "ef", "status", "species", "DBH_CM", "HT_M"))

  expect_named(ValidateSumData(data_val = good_sum_imperial,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPA",
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP")[1:7],
               c("site", "plot", "ef", "status", "species", "DBH_IN", "HT_FT"))

})


test_that("Unrecognized column names throw an error", {

  expect_error(ValidateSumData(data_val = good_sum_metric,
                               site_val = "For", # intentional error here
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'There is no column named "For" in the provided dataframe.')

  expect_error(ValidateSumData(data_val = good_sum_metric,
                               site_val = "Forest",
                               plot_val = "Plot", # intentional error here
                               ef_val = "SPH",
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'There is no column named "Plot" in the provided dataframe.')

  expect_error(ValidateSumData(data_val = good_sum_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPA", # intentional error here
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'There is no column named "SPA" in the provided dataframe.')

})


test_that("Invalid settings throw an error", {

  expect_error(ValidateSumData(data_val = good_sum_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               results_val = "by_plots", # intentional error here
                               status_val = "Live",
                               sp_val = "SPP"),
               'The "results" parameter must be set to either "by_plot" or "by_species".')

})


test_that("Column class handling works", {

  expect_error(ValidateSumData(data_val = bad_sum,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH_bad", # intentional error here
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'The parameter exp_factor requires a numerical variable.\nYou have input a variable of class: character')

})


test_that("NA handling works", {

  expect_error(ValidateSumData(data_val = bad_sum,
                               site_val = "Forest_NA", # intentional error here
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'There are missing site names in the provided dataframe.')

  expect_error(ValidateSumData(data_val = bad_sum,
                               site_val = "Forest",
                               plot_val = "Plot_id_NA", # intentional error here
                               ef_val = "SPH",
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'There are missing plot names in the provided dataframe.')

  expect_error(ValidateSumData(data_val = bad_sum,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH_NA", # intentional error here
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'There are missing expansion factors in the provided dataframe.')

})
