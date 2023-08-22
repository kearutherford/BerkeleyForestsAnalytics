
# run data through AdjustBiomass() first
AB_good_metric <- AdjustBiomass(data = good_sum_metric,
                                status = "Live",
                                decay_class = "Decay",
                                species = "SPP",
                                dbh = "DBH_CM",
                                ht = "HT_M",
                                sp_codes = "4letter",
                                units = "metric")

AB_good_imperial <- AdjustBiomass(data = good_sum_imperial,
                                  status = "Live",
                                  decay_class = "Decay",
                                  species = "SPP",
                                  dbh = "DBH_IN",
                                  ht = "HT_FT",
                                  sp_codes = "4letter",
                                  units = "imperial")

AB_bad <- AdjustBiomass(data = bad_sum,
                        status = "Live",
                        decay_class = "Decay",
                        species = "SPP",
                        dbh = "DBH_CM",
                        ht = "HT_M",
                        sp_codes = "4letter",
                        units = "metric")


test_that("Properly formatted data frames throw no errors, warnings, or messages", {

  expect_no_error(ValidateSumData(data_val = AB_good_metric,
                                  site_val = "Forest",
                                  plot_val = "Plot_id",
                                  ef_val = "SPH",
                                  results_val = "by_plot",
                                  status_val = "Live",
                                  sp_val = "SPP"))

  expect_no_warning(ValidateSumData(data_val = AB_good_metric,
                                    site_val = "Forest",
                                    plot_val = "Plot_id",
                                    ef_val = "SPH",
                                    results_val = "by_plot",
                                    status_val = "Live",
                                    sp_val = "SPP"))

  expect_no_message(ValidateSumData(data_val = AB_good_metric,
                                    site_val = "Forest",
                                    plot_val = "Plot_id",
                                    ef_val = "SPH",
                                    results_val = "by_plot",
                                    status_val = "Live",
                                    sp_val = "SPP"))

})


test_that("Dataframes have expected column names", {

  expect_named(ValidateSumData(data_val = AB_good_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
                c("site", "plot", "ef", "status", "Decay", "species", "DBH_CM", "HT_M", "stem_bio_kg", "bark_bio_kg", "branch_bio_kg", "total_bio_kg"))

  expect_named(ValidateSumData(data_val = AB_good_imperial,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPA",
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               c("site", "plot", "ef", "status", "Decay", "species", "DBH_IN", "HT_FT", "stem_bio_tons", "bark_bio_tons", "branch_bio_tons", "total_bio_tons"))

})


test_that("Unrecognized column names throw an error", {

  expect_error(ValidateSumData(data_val = AB_good_metric,
                               site_val = "For", # intentional error here
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'There is no column named "For" in the provided dataframe.')

  expect_error(ValidateSumData(data_val = AB_good_metric,
                               site_val = "Forest",
                               plot_val = "Plot", # intentional error here
                               ef_val = "SPH",
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'There is no column named "Plot" in the provided dataframe.')

  expect_error(ValidateSumData(data_val = AB_good_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPA", # intentional error here
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'There is no column named "SPA" in the provided dataframe.')

})


test_that("Invalid settings throw an error", {

  expect_error(ValidateSumData(data_val = AB_good_metric,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               results_val = "by_plots", # intentional error here
                               status_val = "Live",
                               sp_val = "SPP"),
               'The "results" parameter must be set to either "by_plot" or "by_species".')

})


test_that("Column class handling works", {

  expect_error(ValidateSumData(data_val = AB_bad,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH_bad1", # intentional error here
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'The parameter exp_factor requires a numerical variable.\nYou have input a variable of class: character')

})


test_that("NA handling works", {

  expect_error(ValidateSumData(data_val = AB_bad,
                               site_val = "Forest_NA", # intentional error here
                               plot_val = "Plot_id",
                               ef_val = "SPH",
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'There are missing site names in the provided dataframe.')

  expect_error(ValidateSumData(data_val = AB_bad,
                               site_val = "Forest",
                               plot_val = "Plot_id_NA", # intentional error here
                               ef_val = "SPH",
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'There are missing plot names in the provided dataframe.')

  expect_error(ValidateSumData(data_val = AB_bad,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH_NA", # intentional error here
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'There are missing expansion factors in the provided dataframe.\nFor plots with no trees, put zero for the expansion factor.')

})


test_that("0 expansion factor handling works", {

  expect_error(ValidateSumData(data_val = AB_bad,
                               site_val = "Forest",
                               plot_val = "Plot_id",
                               ef_val = "SPH_bad2", # intentional error here
                               results_val = "by_plot",
                               status_val = "Live",
                               sp_val = "SPP"),
               'There is a plot with a recorded expansion factor of 0, but with more than one row.\nPlots with no trees should be represented by a single row, with site and plot filled in as appropriate and an exp_factor of 0.\nColumns status, decay_class, species, dbh, and ht should be NA.\nInvestigate the following plot: YOMI 2')

})

