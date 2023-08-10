
test_that("Dataframes have expected column names", {

  expect_named((SummaryBiomass(data = good_sum_metric,
                               site = "Forest",
                               plot = "Plot_id",
                               exp_factor = "SPH",
                               status = "Live",
                               species = "SPP",
                               dbh = "DBH_CM",
                               ht = "HT_M",
                               sp_codes = "4letter",
                               units = "metric",
                               results = "by_plot")),
               c("site", "plot", "live_Mg_ha", "dead_Mg_ha"))

  expect_named((SummaryBiomass(data = good_sum_metric,
                               site = "Forest",
                               plot = "Plot_id",
                               exp_factor = "SPH",
                               status = "Live",
                               species = "SPP",
                               dbh = "DBH_CM",
                               ht = "HT_M",
                               sp_codes = "4letter",
                               units = "metric",
                               results = "by_species")),
               c("site", "plot", "species", "live_Mg_ha", "dead_Mg_ha"))

  expect_named((SummaryBiomass(data = good_sum_imperial,
                               site = "Forest",
                               plot = "Plot_id",
                               exp_factor = "SPH",
                               status = "Live",
                               species = "SPP",
                               dbh = "DBH_IN",
                               ht = "HT_FT",
                               sp_codes = "4letter",
                               units = "imperial",
                               results = "by_plot")),
               c("site", "plot", "live_ton_ac", "dead_ton_ac"))

  expect_named((SummaryBiomass(data = good_sum_imperial,
                               site = "Forest",
                               plot = "Plot_id",
                               exp_factor = "SPH",
                               status = "Live",
                               species = "SPP",
                               dbh = "DBH_IN",
                               ht = "HT_FT",
                               sp_codes = "4letter",
                               units = "imperial",
                               results = "by_species")),
               c("site", "plot", "species", "live_ton_ac", "dead_ton_ac"))

})
