
test_that("Output dataframe has expected column names", {

  expect_named(ForestStr(data = good_comp_metric,
                         site = "Forest",
                         plot = "Plot_id",
                         exp_factor = "SPH",
                         dbh = "DBH_CM",
                         ht = "ignore",
                         units = "metric"),
               c("site", "plot", "sph", "ba_m2_ha", "qmd_cm", "dbh_cm"))

  expect_named(ForestStr(data = good_comp_metric,
                         site = "Forest",
                         plot = "Plot_id",
                         exp_factor = "SPH",
                         dbh = "DBH_CM",
                         ht = "HT_M",
                         units = "metric"),
               c("site", "plot", "sph", "ba_m2_ha", "qmd_cm", "dbh_cm", "ht_m"))

  expect_named(ForestStr(data = good_comp_imperial,
                         site = "Forest",
                         plot = "Plot_id",
                         exp_factor = "SPA",
                         dbh = "DBH_IN",
                         ht = "ignore",
                         units = "imperial"),
               c("site", "plot", "spa", "ba_ft2_ac", "qmd_in", "dbh_in"))

  expect_named(ForestStr(data = good_comp_imperial,
                         site = "Forest",
                         plot = "Plot_id",
                         exp_factor = "SPA",
                         dbh = "DBH_IN",
                         ht = "HT_FT",
                         units = "imperial"),
               c("site", "plot", "spa", "ba_ft2_ac", "qmd_in", "dbh_in", "ht_ft"))

})


test_that("Final column classes are as expected", {

  str_trial <- ForestStr(data = good_comp_metric,
                         site = "Forest",
                         plot = "Plot_id",
                         exp_factor = "SPH",
                         dbh = "DBH_CM",
                         ht = "HT_M",
                         units = "metric")

  expect_equal(class(str_trial$site), "character")
  expect_equal(class(str_trial$plot), "character")
  expect_equal(class(str_trial$sph), "numeric")
  expect_equal(class(str_trial$ba_m2_ha), "numeric")
  expect_equal(class(str_trial$qmd_cm), "numeric")
  expect_equal(class(str_trial$dbh_cm), "numeric")
  expect_equal(class(str_trial$ht_m), "numeric")

})
