
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


test_that("Package and hand calculations match", {

  # metric
  str_m_package <- ForestStr(comp_str_trees_m, site = "site", plot = "plot", exp_factor = "exp_factor", dbh = "dbh", ht = "ht", units = "metric")
  str_m_package <- str_m_package[order(str_m_package$site, str_m_package$plot),]
  str_m_hand <- str_m_hand[order(str_m_hand$site, str_m_hand$plot),]

  expect_equal(str_m_hand$sph, str_m_package$sph)
  expect_equal(str_m_hand$ba_m2_ha, str_m_package$ba_m2_ha)
  expect_equal(str_m_hand$qmd_cm, str_m_package$qmd_cm)
  expect_equal(str_m_hand$dbh_cm, str_m_package$dbh_cm)
  expect_equal(str_m_hand$ht_m, str_m_package$ht_m)

  # imperial
  str_i_package <- ForestStr(comp_str_trees_i, site = "site", plot = "plot", exp_factor = "exp_factor", dbh = "dbh", ht = "ht", units = "imperial")
  str_i_package <- str_i_package[order(str_i_package$site, str_i_package$plot),]
  str_i_hand <- str_i_hand[order(str_i_hand$site, str_i_hand$plot),]

  expect_equal(str_i_hand$spa, str_i_package$spa)
  expect_equal(str_i_hand$ba_ft2_ac, str_i_package$ba_ft2_ac)
  expect_equal(str_i_hand$qmd_in, str_i_package$qmd_in)
  expect_equal(str_i_hand$dbh_in, str_i_package$dbh_in)
  expect_equal(str_i_hand$ht_ft, str_i_package$ht_ft)

})

