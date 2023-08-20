
test_that("Dataframes have expected column names", {

  expect_named(SummaryBiomass(data = good_sum_metric,
                              site = "Forest",
                              plot = "Plot_id",
                              exp_factor = "SPH",
                              status = "Live",
                              decay_class = "Decay",
                              species = "SPP",
                              dbh = "DBH_CM",
                              ht = "HT_M",
                              sp_codes = "4letter",
                              units = "metric",
                              results = "by_plot"),
               c("site", "plot", "live_Mg_ha", "dead_Mg_ha"))

  expect_named(SummaryBiomass(data = good_sum_metric,
                              site = "Forest",
                              plot = "Plot_id",
                              exp_factor = "SPH",
                              status = "Live",
                              decay_class = "Decay",
                              species = "SPP",
                              dbh = "DBH_CM",
                              ht = "HT_M",
                              sp_codes = "4letter",
                              units = "metric",
                              results = "by_species"),
               c("site", "plot", "species", "live_Mg_ha", "dead_Mg_ha"))

  expect_named(SummaryBiomass(data = good_sum_imperial,
                              site = "Forest",
                              plot = "Plot_id",
                              exp_factor = "SPA",
                              status = "Live",
                              decay_class = "Decay",
                              species = "SPP",
                              dbh = "DBH_IN",
                              ht = "HT_FT",
                              sp_codes = "4letter",
                              units = "imperial",
                              results = "by_plot"),
               c("site", "plot", "live_ton_ac", "dead_ton_ac"))

  expect_named(SummaryBiomass(data = good_sum_imperial,
                              site = "Forest",
                              plot = "Plot_id",
                              exp_factor = "SPA",
                              status = "Live",
                              decay_class = "Decay",
                              species = "SPP",
                              dbh = "DBH_IN",
                              ht = "HT_FT",
                              sp_codes = "4letter",
                              units = "imperial",
                              results = "by_species"),
               c("site", "plot", "species", "live_ton_ac", "dead_ton_ac"))

})


test_that("Final column classes are as expected", {

  trial1 <- SummaryBiomass(data = good_sum_metric,
                           site = "Forest",
                           plot = "Plot_id",
                           exp_factor = "SPH",
                           status = "Live",
                           decay_class = "Decay",
                           species = "SPP",
                           dbh = "DBH_CM",
                           ht = "HT_M",
                           sp_codes = "4letter",
                           units = "metric",
                           results = "by_plot")

  expect_equal(class(trial1$site), "character")
  expect_equal(class(trial1$plot), "character")
  expect_equal(class(trial1$live_Mg_ha), "numeric")
  expect_equal(class(trial1$dead_Mg_ha), "numeric")

  trial2 <- SummaryBiomass(data = good_sum_metric,
                           site = "Forest",
                           plot = "Plot_id",
                           exp_factor = "SPH",
                           status = "Live",
                           decay_class = "Decay",
                           species = "SPP",
                           dbh = "DBH_CM",
                           ht = "HT_M",
                           sp_codes = "4letter",
                           units = "metric",
                           results = "by_species")

  expect_equal(class(trial2$site), "character")
  expect_equal(class(trial2$plot), "character")
  expect_equal(class(trial2$species), "character")
  expect_equal(class(trial2$live_Mg_ha), "numeric")
  expect_equal(class(trial2$dead_Mg_ha), "numeric")

  trial3 <- SummaryBiomass(data = good_sum_imperial,
                           site = "Forest",
                           plot = "Plot_id",
                           exp_factor = "SPA",
                           status = "Live",
                           decay_class = "Decay",
                           species = "SPP",
                           dbh = "DBH_IN",
                           ht = "HT_FT",
                           sp_codes = "4letter",
                           units = "imperial",
                           results = "by_plot")

  expect_equal(class(trial3$site), "character")
  expect_equal(class(trial3$plot), "character")
  expect_equal(class(trial3$live_ton_ac), "numeric")
  expect_equal(class(trial3$dead_ton_ac), "numeric")

  trial4 <- SummaryBiomass(data = good_sum_imperial,
                           site = "Forest",
                           plot = "Plot_id",
                           exp_factor = "SPA",
                           status = "Live",
                           decay_class = "Decay",
                           species = "SPP",
                           dbh = "DBH_IN",
                           ht = "HT_FT",
                           sp_codes = "4letter",
                           units = "imperial",
                           results = "by_species")

  expect_equal(class(trial4$site), "character")
  expect_equal(class(trial4$plot), "character")
  expect_equal(class(trial4$species), "character")
  expect_equal(class(trial4$live_ton_ac), "numeric")
  expect_equal(class(trial4$dead_ton_ac), "numeric")

})

