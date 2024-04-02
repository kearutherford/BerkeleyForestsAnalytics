
test_that("Properly formatted data frames throw no errors, warnings, or messages", {

  expect_no_error(ValidateSumData(data_val = good_sum_metric,
                                  site_val = "Forest",
                                  plot_val = "Plot_id",
                                  ef_val = "SPH",
                                  status_val = "Live",
                                  decay_val = "Decay",
                                  sp_val = "SPP",
                                  dbh_val = "DBH_CM",
                                  ht_val = "HT_M",
                                  sp_codes_val = "4letter",
                                  units_val = "metric",
                                  results_val = "by_plot"))

  expect_no_warning(ValidateSumData(data_val = good_sum_metric,
                                    site_val = "Forest",
                                    plot_val = "Plot_id",
                                    ef_val = "SPH",
                                    status_val = "Live",
                                    decay_val = "Decay",
                                    sp_val = "SPP",
                                    dbh_val = "DBH_CM",
                                    ht_val = "HT_M",
                                    sp_codes_val = "4letter",
                                    units_val = "metric",
                                    results_val = "by_plot"))

  expect_no_message(ValidateSumData(data_val = good_sum_metric,
                                    site_val = "Forest",
                                    plot_val = "Plot_id",
                                    ef_val = "SPH",
                                    status_val = "Live",
                                    decay_val = "Decay",
                                    sp_val = "SPP",
                                    dbh_val = "DBH_CM",
                                    ht_val = "HT_M",
                                    sp_codes_val = "4letter",
                                    units_val = "metric",
                                    results_val = "by_plot"))

})


test_that("Dataframes have expected column names", {

  expect_named(ValidateSumData(data_val = good_sum_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units_val = "metric",
                               results_val = "by_plot"),
                c("site", "plot", "ef", "status", "decay", "species", "dbh_cm", "ht_m", "dbh_in", "ht_ft"))

  expect_named(ValidateSumData(data_val = good_sum_imperial,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPA",
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_IN",
                               ht_val = "HT_FT",
                               sp_codes_val = "4letter",
                               units_val = "imperial",
                               results_val = "by_plot"),
               c("site", "plot", "ef", "status", "decay", "species", "dbh_in", "ht_ft", "dbh_cm", "ht_m"))

})


test_that("Unrecognized column names throw an error", {

  expect_error(ValidateSumData(data_val = good_sum_metric,
                               site_val = "For", # intentional error here
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units_val = "metric",
                               results_val = "by_plot"),
               'There is no column named "For" in the provided dataframe.')

  expect_error(ValidateSumData(data_val = good_sum_metric,
                               site_val = "Forest",
                               plot_val = "Plot", # intentional error here
                               ef_val = "SPH",
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units_val = "metric",
                               results_val = "by_plot"),
               'There is no column named "Plot" in the provided dataframe.')

  expect_error(ValidateSumData(data_val = good_sum_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPA", # intentional error here
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units_val = "metric",
                               results_val = "by_plot"),
               'There is no column named "SPA" in the provided dataframe.')

})


test_that("Invalid settings throw an error", {

  expect_error(ValidateSumData(data_val = good_sum_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units_val = "metric",
                               results_val = "by_plots"), # intentional error here
               'The "results" parameter must be set to either "by_plot" or "by_species".')

})


test_that("Column class handling works", {

  # Categorical ----------------------------------------------------------------
  expect_error(ValidateSumData(data_val = bad_sum,
                               site_val = "Forest_bad1", # intentional error here
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units_val = "metric",
                               results_val = "by_plot"),
               'The parameter site requires a character variable.\nYou have input a variable of class: numeric')

  expect_error(ValidateSumData(data_val = bad_sum,
                               site_val = "Forest",
                               plot_val = "Plot_id_bad1", # intentional error here
                               ef_val = "SPH",
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units_val = "metric",
                               results_val = "by_plot"),
               'The parameter plot requires a character variable.\nYou have input a variable of class: numeric')

  # Numeric --------------------------------------------------------------------
  expect_error(ValidateSumData(data_val = bad_sum,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH_bad1", # intentional error here
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units_val = "metric",
                               results_val = "by_plot"),
               'The parameter exp_factor requires a numerical variable.\nYou have input a variable of class: character')

})


test_that("NA handling works", {

  expect_error(ValidateSumData(data_val = bad_sum,
                               site_val = "Forest_NA", # intentional error here
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units_val = "metric",
                               results_val = "by_plot"),
               'There are missing site names in the provided dataframe.')

  expect_error(ValidateSumData(data_val = bad_sum,
                               site_val = "Forest",
                               plot_val = "Plot_id_NA", # intentional error here
                               ef_val = "SPH",
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units_val = "metric",
                               results_val = "by_plot"),
               'There are missing plot names in the provided dataframe.')

  expect_error(ValidateSumData(data_val = bad_sum,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH_NA", # intentional error here
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units_val = "metric",
                               results_val = "by_plot"),
               'There are missing expansion factors in the provided dataframe.\nFor plots with no trees, put zero for the expansion factor.')

})


test_that("0 expansion factor handling works", {

  expect_error(ValidateSumData(data_val = bad_sum,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH_bad2", # intentional error here
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units_val = "metric",
                               results_val = "by_plot"),
               'There are plots with a recorded expansion factor of 0, but with more than one row.\nPlots with no trees should be represented by a single row with site and plot filled in as appropriate and an exp_factor of 0.')

  expect_error(ValidateSumData(data_val = bad_sum,
                               site_val = "Forest",
                               plot_val = "Plot_id_bad2", # intentional error here
                               ef_val = "SPH_bad2", # intentional error here
                               status_val = "Live",
                               decay_val = "Decay",
                               sp_val = "SPP",
                               dbh_val = "DBH_CM",
                               ht_val = "HT_M",
                               sp_codes_val = "4letter",
                               units_val = "metric",
                               results_val = "by_plot"),
               'There are plots with a recorded expansion factor of 0, but with non-NA status, decay_class, species, dbh and/or ht.\nPlots with no trees should be represented by a single row with site and plot filled in as appropriate, an exp_factor of 0,\nand NA status, decay_class, species, dbh, and ht.')

})

