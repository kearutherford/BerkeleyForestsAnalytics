
test_that("Output classes are as expected", {

  expect_equal(class(CompileSurfaceFuels(fwd_data = g_srs_fwd_m, cwd_data = g_srs_cwd_m, design = "SRS", wt_data = "not_needed", units = "metric")), "data.frame")
  expect_equal(class(CompileSurfaceFuels(fwd_data = g_strs_fwd_m, cwd_data = g_strs_cwd_m, design = "STRS", wt_data = g_strs_wh_1, units = "metric")), "list")
  expect_equal(class(CompileSurfaceFuels(fwd_data = g_ffs_fwd_m, cwd_data = g_ffs_cwd_m, design = "FFS", wt_data = "not_needed", units = "metric")), "list")

})


test_that("STRS outputs have expected column names and classes", {

  # type 1, metric
  strs_1m <- CompileSurfaceFuels(fwd_data = g_strs_fwd_m,
                                 cwd_data = "none",
                                 design = "STRS",
                                 wt_data = g_strs_wh_1,
                                 units = "metric")

  expect_named(strs_1m$stratum, c("time", "site", "stratum", "avg_1h_Mg_ha", "se_1h_Mg_ha", "avg_10h_Mg_ha", "se_10h_Mg_ha", "avg_100h_Mg_ha", "se_100h_Mg_ha"))
  expect_equal(class(strs_1m$stratum$time), "character")
  expect_equal(class(strs_1m$stratum$site), "character")
  expect_equal(class(strs_1m$stratum$stratum), "character")
  expect_equal(class(strs_1m$stratum$avg_1h_Mg_ha), "numeric")
  expect_equal(class(strs_1m$stratum$se_1h_Mg_ha), "numeric")
  expect_equal(class(strs_1m$stratum$avg_10h_Mg_ha), "numeric")
  expect_equal(class(strs_1m$stratum$se_10h_Mg_ha), "numeric")
  expect_equal(class(strs_1m$stratum$avg_100h_Mg_ha), "numeric")
  expect_equal(class(strs_1m$stratum$se_100h_Mg_ha), "numeric")

  expect_named(strs_1m$site, c("time", "site", "avg_1h_Mg_ha", "se_1h_Mg_ha", "avg_10h_Mg_ha", "se_10h_Mg_ha", "avg_100h_Mg_ha", "se_100h_Mg_ha"))
  expect_equal(class(strs_1m$site$time), "character")
  expect_equal(class(strs_1m$site$site), "character")
  expect_equal(class(strs_1m$site$avg_1h_Mg_ha), "numeric")
  expect_equal(class(strs_1m$site$se_1h_Mg_ha), "numeric")
  expect_equal(class(strs_1m$site$avg_10h_Mg_ha), "numeric")
  expect_equal(class(strs_1m$site$se_10h_Mg_ha), "numeric")
  expect_equal(class(strs_1m$site$avg_100h_Mg_ha), "numeric")
  expect_equal(class(strs_1m$site$se_100h_Mg_ha), "numeric")

  # type 1, imperial
  strs_1i <- CompileSurfaceFuels(fwd_data = g_strs_fwd_i,
                                 cwd_data = "none",
                                 design = "STRS",
                                 wt_data = g_strs_wh_1,
                                 units = "imperial")

  expect_named(strs_1i$stratum, c("time", "site", "stratum", "avg_1h_ton_ac", "se_1h_ton_ac", "avg_10h_ton_ac", "se_10h_ton_ac", "avg_100h_ton_ac", "se_100h_ton_ac"))
  expect_equal(class(strs_1i$stratum$time), "character")
  expect_equal(class(strs_1i$stratum$site), "character")
  expect_equal(class(strs_1i$stratum$stratum), "character")
  expect_equal(class(strs_1i$stratum$avg_1h_ton_ac), "numeric")
  expect_equal(class(strs_1i$stratum$se_1h_ton_ac), "numeric")
  expect_equal(class(strs_1i$stratum$avg_10h_ton_ac), "numeric")
  expect_equal(class(strs_1i$stratum$se_10h_ton_ac), "numeric")
  expect_equal(class(strs_1i$stratum$avg_100h_ton_ac), "numeric")
  expect_equal(class(strs_1i$stratum$se_100h_ton_ac), "numeric")

  expect_named(strs_1i$site, c("time", "site", "avg_1h_ton_ac", "se_1h_ton_ac", "avg_10h_ton_ac", "se_10h_ton_ac", "avg_100h_ton_ac", "se_100h_ton_ac"))
  expect_equal(class(strs_1i$site$time), "character")
  expect_equal(class(strs_1i$site$site), "character")
  expect_equal(class(strs_1i$site$avg_1h_ton_ac), "numeric")
  expect_equal(class(strs_1i$site$se_1h_ton_ac), "numeric")
  expect_equal(class(strs_1i$site$avg_10h_ton_ac), "numeric")
  expect_equal(class(strs_1i$site$se_10h_ton_ac), "numeric")
  expect_equal(class(strs_1i$site$avg_100h_ton_ac), "numeric")
  expect_equal(class(strs_1i$site$se_100h_ton_ac), "numeric")

  # type 2, metric
  strs_2m <- CompileSurfaceFuels(fwd_data = "none",
                                 cwd_data = g_strs_cwd_m,
                                 design = "STRS",
                                 wt_data = g_strs_wh_1,
                                 units = "metric")

  expect_named(strs_2m$stratum, c("time", "site", "stratum", "avg_1000h_Mg_ha", "se_1000h_Mg_ha"))
  expect_equal(class(strs_2m$stratum$time), "character")
  expect_equal(class(strs_2m$stratum$site), "character")
  expect_equal(class(strs_2m$stratum$stratum), "character")
  expect_equal(class(strs_2m$stratum$avg_1000h_Mg_ha), "numeric")
  expect_equal(class(strs_2m$stratum$se_1000h_Mg_ha), "numeric")

  expect_named(strs_2m$site, c("time", "site", "avg_1000h_Mg_ha", "se_1000h_Mg_ha"))
  expect_equal(class(strs_2m$site$time), "character")
  expect_equal(class(strs_2m$site$site), "character")
  expect_equal(class(strs_2m$site$avg_1000h_Mg_ha), "numeric")
  expect_equal(class(strs_2m$site$se_1000h_Mg_ha), "numeric")

  # type 2, imperial
  strs_2i <- CompileSurfaceFuels(fwd_data = "none",
                                 cwd_data = g_strs_cwd_i,
                                 design = "STRS",
                                 wt_data = g_strs_wh_1,
                                 units = "imperial")

  expect_named(strs_2i$stratum, c("time", "site", "stratum", "avg_1000h_ton_ac", "se_1000h_ton_ac"))
  expect_equal(class(strs_2i$stratum$time), "character")
  expect_equal(class(strs_2i$stratum$site), "character")
  expect_equal(class(strs_2i$stratum$stratum), "character")
  expect_equal(class(strs_2i$stratum$avg_1000h_ton_ac), "numeric")
  expect_equal(class(strs_2i$stratum$se_1000h_ton_ac), "numeric")

  expect_named(strs_2i$site, c("time", "site", "avg_1000h_ton_ac", "se_1000h_ton_ac"))
  expect_equal(class(strs_2i$site$time), "character")
  expect_equal(class(strs_2i$site$site), "character")
  expect_equal(class(strs_2i$site$avg_1000h_ton_ac), "numeric")
  expect_equal(class(strs_2i$site$se_1000h_ton_ac), "numeric")

  # type 3, metric
  strs_3m <- CompileSurfaceFuels(fwd_data = g_strs_fwd_m,
                                 cwd_data = g_strs_cwd_m,
                                 design = "STRS",
                                 wt_data = g_strs_wh_1,
                                 units = "metric")

  expect_named(strs_3m$stratum, c("time", "site", "stratum", "avg_1h_Mg_ha", "se_1h_Mg_ha", "avg_10h_Mg_ha", "se_10h_Mg_ha", "avg_100h_Mg_ha", "se_100h_Mg_ha", "avg_1000h_Mg_ha", "se_1000h_Mg_ha"))
  expect_equal(class(strs_3m$stratum$time), "character")
  expect_equal(class(strs_3m$stratum$site), "character")
  expect_equal(class(strs_3m$stratum$stratum), "character")
  expect_equal(class(strs_3m$stratum$avg_1h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$stratum$se_1h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$stratum$avg_10h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$stratum$se_10h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$stratum$avg_100h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$stratum$se_100h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$stratum$avg_1000h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$stratum$se_1000h_Mg_ha), "numeric")

  expect_named(strs_3m$site, c("time", "site", "avg_1h_Mg_ha", "se_1h_Mg_ha", "avg_10h_Mg_ha", "se_10h_Mg_ha", "avg_100h_Mg_ha", "se_100h_Mg_ha", "avg_1000h_Mg_ha", "se_1000h_Mg_ha"))
  expect_equal(class(strs_3m$site$time), "character")
  expect_equal(class(strs_3m$site$site), "character")
  expect_equal(class(strs_3m$site$avg_1h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$site$se_1h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$site$avg_10h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$site$se_10h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$site$avg_100h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$site$se_100h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$site$avg_1000h_Mg_ha), "numeric")
  expect_equal(class(strs_3m$site$se_1000h_Mg_ha), "numeric")

  # type 3, imperial
  strs_3i <- CompileSurfaceFuels(fwd_data = g_strs_fwd_i,
                                 cwd_data = g_strs_cwd_i,
                                 design = "STRS",
                                 wt_data = g_strs_wh_1,
                                 units = "imperial")

  expect_named(strs_3i$stratum, c("time", "site", "stratum", "avg_1h_ton_ac", "se_1h_ton_ac", "avg_10h_ton_ac", "se_10h_ton_ac", "avg_100h_ton_ac", "se_100h_ton_ac", "avg_1000h_ton_ac", "se_1000h_ton_ac"))
  expect_equal(class(strs_3i$stratum$time), "character")
  expect_equal(class(strs_3i$stratum$site), "character")
  expect_equal(class(strs_3i$stratum$stratum), "character")
  expect_equal(class(strs_3i$stratum$avg_1h_ton_ac), "numeric")
  expect_equal(class(strs_3i$stratum$se_1h_ton_ac), "numeric")
  expect_equal(class(strs_3i$stratum$avg_10h_ton_ac), "numeric")
  expect_equal(class(strs_3i$stratum$se_10h_ton_ac), "numeric")
  expect_equal(class(strs_3i$stratum$avg_100h_ton_ac), "numeric")
  expect_equal(class(strs_3i$stratum$se_100h_ton_ac), "numeric")
  expect_equal(class(strs_3i$stratum$avg_1000h_ton_ac), "numeric")
  expect_equal(class(strs_3i$stratum$se_1000h_ton_ac), "numeric")

  expect_named(strs_3i$site, c("time", "site", "avg_1h_ton_ac", "se_1h_ton_ac", "avg_10h_ton_ac", "se_10h_ton_ac", "avg_100h_ton_ac", "se_100h_ton_ac", "avg_1000h_ton_ac", "se_1000h_ton_ac"))
  expect_equal(class(strs_3i$site$time), "character")
  expect_equal(class(strs_3i$site$site), "character")
  expect_equal(class(strs_3i$site$avg_1h_ton_ac), "numeric")
  expect_equal(class(strs_3i$site$se_1h_ton_ac), "numeric")
  expect_equal(class(strs_3i$site$avg_10h_ton_ac), "numeric")
  expect_equal(class(strs_3i$site$se_10h_ton_ac), "numeric")
  expect_equal(class(strs_3i$site$avg_100h_ton_ac), "numeric")
  expect_equal(class(strs_3i$site$se_100h_ton_ac), "numeric")
  expect_equal(class(strs_3i$site$avg_1000h_ton_ac), "numeric")
  expect_equal(class(strs_3i$site$se_1000h_ton_ac), "numeric")

})


test_that("STRS package and hand calculations match", {

  # STRS
  strs_fuels_package_1 <- CompileSurfaceFuels(fwd_data = g_strs_fwd_m, cwd_data = g_strs_cwd_m, design = "STRS", wt_data = g_strs_wh_1)$stratum
  strs_fuels_package_1 <- strs_fuels_package_1[order(strs_fuels_package_1$time, strs_fuels_package_1$site, strs_fuels_package_1$stratum),]
  strs_fuels_hand_1 <- strs_fuels_hand_1[order(strs_fuels_hand_1$time, strs_fuels_hand_1$site, strs_fuels_hand_1$stratum),]

  expect_equal(strs_fuels_hand_1$avg_1h, strs_fuels_package_1$avg_1h_Mg_ha)
  expect_equal(strs_fuels_hand_1$se_1h, strs_fuels_package_1$se_1h_Mg_ha)
  expect_equal(strs_fuels_hand_1$avg_10h, strs_fuels_package_1$avg_10h_Mg_ha)
  expect_equal(strs_fuels_hand_1$se_10h, strs_fuels_package_1$se_10h_Mg_ha)
  expect_equal(strs_fuels_hand_1$avg_100h, strs_fuels_package_1$avg_100h_Mg_ha)
  expect_equal(strs_fuels_hand_1$se_100h, strs_fuels_package_1$se_100h_Mg_ha)
  expect_equal(strs_fuels_hand_1$avg_1000h, strs_fuels_package_1$avg_1000h_Mg_ha)
  expect_equal(strs_fuels_hand_1$se_1000h, strs_fuels_package_1$se_1000h_Mg_ha)

  strs_fuels_package_2 <- CompileSurfaceFuels(fwd_data = g_strs_fwd_m, cwd_data = g_strs_cwd_m, design = "STRS", wt_data = g_strs_wh_1)$site
  strs_fuels_package_2 <- strs_fuels_package_2[order(strs_fuels_package_2$time, strs_fuels_package_2$site),]
  strs_fuels_hand_2 <- strs_fuels_hand_2[order(strs_fuels_hand_2$time, strs_fuels_hand_2$site),]

  expect_equal(strs_fuels_hand_2$avg_1h, strs_fuels_package_2$avg_1h_Mg_ha)
  expect_equal(strs_fuels_hand_2$se_1h, strs_fuels_package_2$se_1h_Mg_ha)
  expect_equal(strs_fuels_hand_2$avg_10h, strs_fuels_package_2$avg_10h_Mg_ha)
  expect_equal(strs_fuels_hand_2$se_10h, strs_fuels_package_2$se_10h_Mg_ha)
  expect_equal(strs_fuels_hand_2$avg_100h, strs_fuels_package_2$avg_100h_Mg_ha)
  expect_equal(strs_fuels_hand_2$se_100h, strs_fuels_package_2$se_100h_Mg_ha)
  expect_equal(strs_fuels_hand_2$avg_1000h, strs_fuels_package_2$avg_1000h_Mg_ha)
  expect_equal(strs_fuels_hand_2$se_1000h, strs_fuels_package_2$se_1000h_Mg_ha)

  # STRS, with FPC
  strs_fuels_package_fpc_1 <- CompileSurfaceFuels(fwd_data = g_strs_fwd_m, cwd_data = g_strs_cwd_m, design = "STRS", wt_data = g_strs_wh_1, fpc_data = g_strs_fpc_1)$stratum
  strs_fuels_package_fpc_1 <- strs_fuels_package_fpc_1[order(strs_fuels_package_fpc_1$time, strs_fuels_package_fpc_1$site, strs_fuels_package_fpc_1$stratum),]
  strs_fuels_hand_fpc_1 <- strs_fuels_hand_fpc_1[order(strs_fuels_hand_fpc_1$time, strs_fuels_hand_fpc_1$site, strs_fuels_hand_fpc_1$stratum),]

  expect_equal(strs_fuels_hand_fpc_1$avg_1h, strs_fuels_package_fpc_1$avg_1h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_1$se_1h, strs_fuels_package_fpc_1$se_1h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_1$avg_10h, strs_fuels_package_fpc_1$avg_10h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_1$se_10h, strs_fuels_package_fpc_1$se_10h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_1$avg_100h, strs_fuels_package_fpc_1$avg_100h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_1$se_100h, strs_fuels_package_fpc_1$se_100h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_1$avg_1000h, strs_fuels_package_fpc_1$avg_1000h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_1$se_1000h, strs_fuels_package_fpc_1$se_1000h_Mg_ha)

  strs_fuels_package_fpc_2 <- CompileSurfaceFuels(fwd_data = g_strs_fwd_m, cwd_data = g_strs_cwd_m, design = "STRS", wt_data = g_strs_wh_1, fpc_data = g_strs_fpc_1)$site
  strs_fuels_package_fpc_2 <- strs_fuels_package_fpc_2[order(strs_fuels_package_fpc_2$time, strs_fuels_package_fpc_2$site),]
  strs_fuels_hand_fpc_2 <- strs_fuels_hand_fpc_2[order(strs_fuels_hand_fpc_2$time, strs_fuels_hand_fpc_2$site),]

  expect_equal(strs_fuels_hand_fpc_2$avg_1h, strs_fuels_package_fpc_2$avg_1h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_2$se_1h, strs_fuels_package_fpc_2$se_1h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_2$avg_10h, strs_fuels_package_fpc_2$avg_10h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_2$se_10h, strs_fuels_package_fpc_2$se_10h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_2$avg_100h, strs_fuels_package_fpc_2$avg_100h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_2$se_100h, strs_fuels_package_fpc_2$se_100h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_2$avg_1000h, strs_fuels_package_fpc_2$avg_1000h_Mg_ha)
  expect_equal(strs_fuels_hand_fpc_2$se_1000h, strs_fuels_package_fpc_2$se_1000h_Mg_ha)

})


test_that("SRS outputs have expected column names and classes", {

  # type 1, metric
  srs_1m <- CompileSurfaceFuels(fwd_data = g_srs_fwd_m,
                                cwd_data = "none",
                                design = "SRS",
                                wt_data = "not_needed",
                                units = "metric")

  expect_named(srs_1m, c("time", "site", "avg_1h_Mg_ha", "se_1h_Mg_ha", "avg_10h_Mg_ha", "se_10h_Mg_ha", "avg_100h_Mg_ha", "se_100h_Mg_ha"))
  expect_equal(class(srs_1m$time), "character")
  expect_equal(class(srs_1m$site), "character")
  expect_equal(class(srs_1m$avg_1h_Mg_ha), "numeric")
  expect_equal(class(srs_1m$se_1h_Mg_ha), "numeric")
  expect_equal(class(srs_1m$avg_10h_Mg_ha), "numeric")
  expect_equal(class(srs_1m$se_10h_Mg_ha), "numeric")
  expect_equal(class(srs_1m$avg_100h_Mg_ha), "numeric")
  expect_equal(class(srs_1m$se_100h_Mg_ha), "numeric")

  # type 1, imperial
  srs_1i <- CompileSurfaceFuels(fwd_data = g_srs_fwd_i,
                                cwd_data = "none",
                                design = "SRS",
                                wt_data = "not_needed",
                                units = "imperial")

  expect_named(srs_1i, c("time", "site", "avg_1h_ton_ac", "se_1h_ton_ac", "avg_10h_ton_ac", "se_10h_ton_ac", "avg_100h_ton_ac", "se_100h_ton_ac"))
  expect_equal(class(srs_1i$time), "character")
  expect_equal(class(srs_1i$site), "character")
  expect_equal(class(srs_1i$avg_1h_ton_ac), "numeric")
  expect_equal(class(srs_1i$se_1h_ton_ac), "numeric")
  expect_equal(class(srs_1i$avg_10h_ton_ac), "numeric")
  expect_equal(class(srs_1i$se_10h_ton_ac), "numeric")
  expect_equal(class(srs_1i$avg_100h_ton_ac), "numeric")
  expect_equal(class(srs_1i$se_100h_ton_ac), "numeric")

  # type 2, metric
  srs_2m <- CompileSurfaceFuels(fwd_data = "none",
                                cwd_data = g_srs_cwd_m,
                                design = "SRS",
                                wt_data = "not_needed",
                                units = "metric")

  expect_named(srs_2m, c("time", "site", "avg_1000h_Mg_ha", "se_1000h_Mg_ha"))
  expect_equal(class(srs_2m$time), "character")
  expect_equal(class(srs_2m$site), "character")
  expect_equal(class(srs_2m$avg_1000h_Mg_ha), "numeric")
  expect_equal(class(srs_2m$se_1000h_Mg_ha), "numeric")

  # type 2, imperial
  srs_2i <- CompileSurfaceFuels(fwd_data = "none",
                                cwd_data = g_srs_cwd_i,
                                design = "SRS",
                                wt_data = "not_needed",
                                units = "imperial")

  expect_named(srs_2i, c("time", "site", "avg_1000h_ton_ac", "se_1000h_ton_ac"))
  expect_equal(class(srs_2i$time), "character")
  expect_equal(class(srs_2i$site), "character")
  expect_equal(class(srs_2i$avg_1000h_ton_ac), "numeric")
  expect_equal(class(srs_2i$se_1000h_ton_ac), "numeric")

  # type 3, metric
  srs_3m <- CompileSurfaceFuels(fwd_data = g_srs_fwd_m,
                                cwd_data = g_srs_cwd_m,
                                design = "SRS",
                                wt_data = "not_needed",
                                units = "metric")

  expect_named(srs_3m, c("time", "site", "avg_1h_Mg_ha", "se_1h_Mg_ha", "avg_10h_Mg_ha", "se_10h_Mg_ha", "avg_100h_Mg_ha", "se_100h_Mg_ha", "avg_1000h_Mg_ha", "se_1000h_Mg_ha"))
  expect_equal(class(srs_3m$time), "character")
  expect_equal(class(srs_3m$site), "character")
  expect_equal(class(srs_3m$avg_1h_Mg_ha), "numeric")
  expect_equal(class(srs_3m$se_1h_Mg_ha), "numeric")
  expect_equal(class(srs_3m$avg_10h_Mg_ha), "numeric")
  expect_equal(class(srs_3m$se_10h_Mg_ha), "numeric")
  expect_equal(class(srs_3m$avg_100h_Mg_ha), "numeric")
  expect_equal(class(srs_3m$se_100h_Mg_ha), "numeric")
  expect_equal(class(srs_3m$avg_1000h_Mg_ha), "numeric")
  expect_equal(class(srs_3m$se_1000h_Mg_ha), "numeric")

  # type 3, imperial
  srs_3i <- CompileSurfaceFuels(fwd_data = g_srs_fwd_i,
                                cwd_data = g_srs_cwd_i,
                                design = "SRS",
                                wt_data = "not_needed",
                                units = "imperial")

  expect_named(srs_3i, c("time", "site", "avg_1h_ton_ac", "se_1h_ton_ac", "avg_10h_ton_ac", "se_10h_ton_ac", "avg_100h_ton_ac", "se_100h_ton_ac", "avg_1000h_ton_ac", "se_1000h_ton_ac"))
  expect_equal(class(srs_3i$time), "character")
  expect_equal(class(srs_3i$site), "character")
  expect_equal(class(srs_3i$avg_1h_ton_ac), "numeric")
  expect_equal(class(srs_3i$se_1h_ton_ac), "numeric")
  expect_equal(class(srs_3i$avg_10h_ton_ac), "numeric")
  expect_equal(class(srs_3i$se_10h_ton_ac), "numeric")
  expect_equal(class(srs_3i$avg_100h_ton_ac), "numeric")
  expect_equal(class(srs_3i$se_100h_ton_ac), "numeric")
  expect_equal(class(srs_3i$avg_1000h_ton_ac), "numeric")
  expect_equal(class(srs_3i$se_1000h_ton_ac), "numeric")

})


test_that("SRS package and hand calculations match", {

  # SRS
  srs_fuels_package <- CompileSurfaceFuels(fwd_data = g_srs_fwd_m, cwd_data = g_srs_cwd_m, design = "SRS")
  srs_fuels_package <- srs_fuels_package[order(srs_fuels_package$time, srs_fuels_package$site),]
  srs_fuels_hand <- srs_fuels_hand[order(srs_fuels_hand$time, srs_fuels_hand$site),]

  expect_equal(srs_fuels_hand$avg_1h, srs_fuels_package$avg_1h_Mg_ha)
  expect_equal(srs_fuels_hand$se_1h, srs_fuels_package$se_1h_Mg_ha)
  expect_equal(srs_fuels_hand$avg_10h, srs_fuels_package$avg_10h_Mg_ha)
  expect_equal(srs_fuels_hand$se_10h, srs_fuels_package$se_10h_Mg_ha)
  expect_equal(srs_fuels_hand$avg_100h, srs_fuels_package$avg_100h_Mg_ha)
  expect_equal(srs_fuels_hand$se_100h, srs_fuels_package$se_100h_Mg_ha)
  expect_equal(srs_fuels_hand$avg_1000h, srs_fuels_package$avg_1000h_Mg_ha)
  expect_equal(srs_fuels_hand$se_1000h, srs_fuels_package$se_1000h_Mg_ha)

  # SRS, with FPC
  srs_fuels_package_fpc <- CompileSurfaceFuels(fwd_data = g_srs_fwd_m, cwd_data = g_srs_cwd_m, design = "SRS", fpc_data = g_srs_fpc_1)
  srs_fuels_package_fpc <- srs_fuels_package_fpc[order(srs_fuels_package_fpc$time, srs_fuels_package_fpc$site),]
  srs_fuels_hand_fpc <- srs_fuels_hand_fpc[order(srs_fuels_hand_fpc$time, srs_fuels_hand_fpc$site),]

  expect_equal(srs_fuels_hand_fpc$avg_1h, srs_fuels_package_fpc$avg_1h_Mg_ha)
  expect_equal(srs_fuels_hand_fpc$se_1h, srs_fuels_package_fpc$se_1h_Mg_ha)
  expect_equal(srs_fuels_hand_fpc$avg_10h, srs_fuels_package_fpc$avg_10h_Mg_ha)
  expect_equal(srs_fuels_hand_fpc$se_10h, srs_fuels_package_fpc$se_10h_Mg_ha)
  expect_equal(srs_fuels_hand_fpc$avg_100h, srs_fuels_package_fpc$avg_100h_Mg_ha)
  expect_equal(srs_fuels_hand_fpc$se_100h, srs_fuels_package_fpc$se_100h_Mg_ha)
  expect_equal(srs_fuels_hand_fpc$avg_1000h, srs_fuels_package_fpc$avg_1000h_Mg_ha)
  expect_equal(srs_fuels_hand_fpc$se_1000h, srs_fuels_package_fpc$se_1000h_Mg_ha)

})


test_that("FFS outputs have expected column names and classes", {

  # type 1, metric
  ffs_1m <- CompileSurfaceFuels(fwd_data = g_ffs_fwd_m,
                                cwd_data = "none",
                                design = "FFS",
                                wt_data = "not_needed",
                                units = "metric")

  expect_named(ffs_1m$site, c("time", "trt_type", "site",  "avg_1h_Mg_ha", "se_1h_Mg_ha", "avg_10h_Mg_ha", "se_10h_Mg_ha", "avg_100h_Mg_ha", "se_100h_Mg_ha"))
  expect_equal(class(ffs_1m$site$time), "character")
  expect_equal(class(ffs_1m$site$trt_type), "character")
  expect_equal(class(ffs_1m$site$site), "character")
  expect_equal(class(ffs_1m$site$avg_1h_Mg_ha), "numeric")
  expect_equal(class(ffs_1m$site$se_1h_Mg_ha), "numeric")
  expect_equal(class(ffs_1m$site$avg_10h_Mg_ha), "numeric")
  expect_equal(class(ffs_1m$site$se_10h_Mg_ha), "numeric")
  expect_equal(class(ffs_1m$site$avg_100h_Mg_ha), "numeric")
  expect_equal(class(ffs_1m$site$se_100h_Mg_ha), "numeric")

  expect_named(ffs_1m$trt_type, c("time", "trt_type", "avg_1h_Mg_ha", "se_1h_Mg_ha", "avg_10h_Mg_ha", "se_10h_Mg_ha", "avg_100h_Mg_ha", "se_100h_Mg_ha"))
  expect_equal(class(ffs_1m$trt_type$time), "character")
  expect_equal(class(ffs_1m$trt_type$trt_type), "character")
  expect_equal(class(ffs_1m$trt_type$avg_1h_Mg_ha), "numeric")
  expect_equal(class(ffs_1m$trt_type$se_1h_Mg_ha), "numeric")
  expect_equal(class(ffs_1m$trt_type$avg_10h_Mg_ha), "numeric")
  expect_equal(class(ffs_1m$trt_type$se_10h_Mg_ha), "numeric")
  expect_equal(class(ffs_1m$trt_type$avg_100h_Mg_ha), "numeric")
  expect_equal(class(ffs_1m$trt_type$se_100h_Mg_ha), "numeric")

  # type 1, imperial
  ffs_1i <- CompileSurfaceFuels(fwd_data = g_ffs_fwd_i,
                                cwd_data = "none",
                                design = "FFS",
                                wt_data = "not_needed",
                                units = "imperial")

  expect_named(ffs_1i$site, c("time", "trt_type", "site", "avg_1h_ton_ac", "se_1h_ton_ac", "avg_10h_ton_ac", "se_10h_ton_ac", "avg_100h_ton_ac", "se_100h_ton_ac"))
  expect_equal(class(ffs_1i$site$time), "character")
  expect_equal(class(ffs_1i$site$trt_type), "character")
  expect_equal(class(ffs_1i$site$site), "character")
  expect_equal(class(ffs_1i$site$avg_1h_ton_ac), "numeric")
  expect_equal(class(ffs_1i$site$se_1h_ton_ac), "numeric")
  expect_equal(class(ffs_1i$site$avg_10h_ton_ac), "numeric")
  expect_equal(class(ffs_1i$site$se_10h_ton_ac), "numeric")
  expect_equal(class(ffs_1i$site$avg_100h_ton_ac), "numeric")
  expect_equal(class(ffs_1i$site$se_100h_ton_ac), "numeric")

  expect_named(ffs_1i$trt_type, c("time", "trt_type", "avg_1h_ton_ac", "se_1h_ton_ac", "avg_10h_ton_ac", "se_10h_ton_ac", "avg_100h_ton_ac", "se_100h_ton_ac"))
  expect_equal(class(ffs_1i$trt_type$time), "character")
  expect_equal(class(ffs_1i$trt_type$trt_type), "character")
  expect_equal(class(ffs_1i$trt_type$avg_1h_ton_ac), "numeric")
  expect_equal(class(ffs_1i$trt_type$se_1h_ton_ac), "numeric")
  expect_equal(class(ffs_1i$trt_type$avg_10h_ton_ac), "numeric")
  expect_equal(class(ffs_1i$trt_type$se_10h_ton_ac), "numeric")
  expect_equal(class(ffs_1i$trt_type$avg_100h_ton_ac), "numeric")
  expect_equal(class(ffs_1i$trt_type$se_100h_ton_ac), "numeric")

  # type 2, metric
  ffs_2m <- CompileSurfaceFuels(fwd_data = "none",
                                cwd_data = g_ffs_cwd_m,
                                design = "FFS",
                                wt_data = "not_needed",
                                units = "metric")

  expect_named(ffs_2m$site, c("time", "trt_type", "site", "avg_1000h_Mg_ha", "se_1000h_Mg_ha"))
  expect_equal(class(ffs_2m$site$time), "character")
  expect_equal(class(ffs_2m$site$trt_type), "character")
  expect_equal(class(ffs_2m$site$site), "character")
  expect_equal(class(ffs_2m$site$avg_1000h_Mg_ha), "numeric")
  expect_equal(class(ffs_2m$site$se_1000h_Mg_ha), "numeric")

  expect_named(ffs_2m$trt_type, c("time", "trt_type", "avg_1000h_Mg_ha", "se_1000h_Mg_ha"))
  expect_equal(class(ffs_2m$trt_type$time), "character")
  expect_equal(class(ffs_2m$trt_type$trt_type), "character")
  expect_equal(class(ffs_2m$trt_type$avg_1000h_Mg_ha), "numeric")
  expect_equal(class(ffs_2m$trt_type$se_1000h_Mg_ha), "numeric")

  # type 2, imperial
  ffs_2i <- CompileSurfaceFuels(fwd_data = "none",
                                cwd_data = g_ffs_cwd_i,
                                design = "FFS",
                                wt_data = "not_needed",
                                units = "imperial")

  expect_named(ffs_2i$site, c("time", "trt_type", "site", "avg_1000h_ton_ac", "se_1000h_ton_ac"))
  expect_equal(class(ffs_2i$site$time), "character")
  expect_equal(class(ffs_2i$site$trt_type), "character")
  expect_equal(class(ffs_2i$site$site), "character")
  expect_equal(class(ffs_2i$site$avg_1000h_ton_ac), "numeric")
  expect_equal(class(ffs_2i$site$se_1000h_ton_ac), "numeric")

  expect_named(ffs_2i$trt_type, c("time", "trt_type", "avg_1000h_ton_ac", "se_1000h_ton_ac"))
  expect_equal(class(ffs_2i$trt_type$time), "character")
  expect_equal(class(ffs_2i$trt_type$trt_type), "character")
  expect_equal(class(ffs_2i$trt_type$avg_1000h_ton_ac), "numeric")
  expect_equal(class(ffs_2i$trt_type$se_1000h_ton_ac), "numeric")

  # type 3, metric
  ffs_3m <- CompileSurfaceFuels(fwd_data = g_ffs_fwd_m,
                                cwd_data = g_ffs_cwd_m,
                                design = "FFS",
                                wt_data = "not_needed",
                                units = "metric")

  expect_named(ffs_3m$site, c("time", "trt_type", "site",  "avg_1h_Mg_ha", "se_1h_Mg_ha", "avg_10h_Mg_ha", "se_10h_Mg_ha", "avg_100h_Mg_ha", "se_100h_Mg_ha", "avg_1000h_Mg_ha", "se_1000h_Mg_ha"))
  expect_equal(class(ffs_3m$site$time), "character")
  expect_equal(class(ffs_3m$site$trt_type), "character")
  expect_equal(class(ffs_3m$site$site), "character")
  expect_equal(class(ffs_3m$site$avg_1h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$site$se_1h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$site$avg_10h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$site$se_10h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$site$avg_100h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$site$se_100h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$site$avg_1000h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$site$se_1000h_Mg_ha), "numeric")

  expect_named(ffs_3m$trt_type, c("time", "trt_type", "avg_1h_Mg_ha", "se_1h_Mg_ha", "avg_10h_Mg_ha", "se_10h_Mg_ha", "avg_100h_Mg_ha", "se_100h_Mg_ha", "avg_1000h_Mg_ha", "se_1000h_Mg_ha"))
  expect_equal(class(ffs_3m$trt_type$time), "character")
  expect_equal(class(ffs_3m$trt_type$trt_type), "character")
  expect_equal(class(ffs_3m$trt_type$avg_1h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$trt_type$se_1h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$trt_type$avg_10h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$trt_type$se_10h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$trt_type$avg_100h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$trt_type$se_100h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$trt_type$avg_1000h_Mg_ha), "numeric")
  expect_equal(class(ffs_3m$trt_type$se_1000h_Mg_ha), "numeric")

  # type 3, imperial
  ffs_3i <- CompileSurfaceFuels(fwd_data = g_ffs_fwd_i,
                                cwd_data = g_ffs_cwd_i,
                                design = "FFS",
                                wt_data = "not_needed",
                                units = "imperial")

  expect_named(ffs_3i$site, c("time", "trt_type", "site", "avg_1h_ton_ac", "se_1h_ton_ac", "avg_10h_ton_ac", "se_10h_ton_ac", "avg_100h_ton_ac", "se_100h_ton_ac", "avg_1000h_ton_ac", "se_1000h_ton_ac"))
  expect_equal(class(ffs_3i$site$time), "character")
  expect_equal(class(ffs_3i$site$trt_type), "character")
  expect_equal(class(ffs_3i$site$site), "character")
  expect_equal(class(ffs_3i$site$avg_1h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$site$se_1h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$site$avg_10h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$site$se_10h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$site$avg_100h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$site$se_100h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$site$avg_1000h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$site$se_1000h_ton_ac), "numeric")

  expect_named(ffs_3i$trt_type, c("time", "trt_type", "avg_1h_ton_ac", "se_1h_ton_ac", "avg_10h_ton_ac", "se_10h_ton_ac", "avg_100h_ton_ac", "se_100h_ton_ac", "avg_1000h_ton_ac", "se_1000h_ton_ac"))
  expect_equal(class(ffs_3i$trt_type$time), "character")
  expect_equal(class(ffs_3i$trt_type$trt_type), "character")
  expect_equal(class(ffs_3i$trt_type$avg_1h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$trt_type$se_1h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$trt_type$avg_10h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$trt_type$se_10h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$trt_type$avg_100h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$trt_type$se_100h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$trt_type$avg_1000h_ton_ac), "numeric")
  expect_equal(class(ffs_3i$trt_type$se_1000h_ton_ac), "numeric")

})


test_that("FFS package and hand calculations match", {

  # FFS
  ffs_fuels_package_1 <- CompileSurfaceFuels(fwd_data = g_ffs_fwd_m, cwd_data = g_ffs_cwd_m, design = "FFS")$site
  ffs_fuels_package_1 <- ffs_fuels_package_1[order(ffs_fuels_package_1$time, ffs_fuels_package_1$trt_type, ffs_fuels_package_1$site),]
  ffs_fuels_hand_1 <- ffs_fuels_hand_1[order(ffs_fuels_hand_1$time, ffs_fuels_hand_1$trt_type, ffs_fuels_hand_1$site),]

  expect_equal(ffs_fuels_hand_1$avg_1h, ffs_fuels_package_1$avg_1h_Mg_ha)
  expect_equal(ffs_fuels_hand_1$se_1h, ffs_fuels_package_1$se_1h_Mg_ha)
  expect_equal(ffs_fuels_hand_1$avg_10h, ffs_fuels_package_1$avg_10h_Mg_ha)
  expect_equal(ffs_fuels_hand_1$se_10h, ffs_fuels_package_1$se_10h_Mg_ha)
  expect_equal(ffs_fuels_hand_1$avg_100h, ffs_fuels_package_1$avg_100h_Mg_ha)
  expect_equal(ffs_fuels_hand_1$se_100h, ffs_fuels_package_1$se_100h_Mg_ha)
  expect_equal(ffs_fuels_hand_1$avg_1000h, ffs_fuels_package_1$avg_1000h_Mg_ha)
  expect_equal(ffs_fuels_hand_1$se_1000h, ffs_fuels_package_1$se_1000h_Mg_ha)

  ffs_fuels_package_2 <- CompileSurfaceFuels(fwd_data = g_ffs_fwd_m, cwd_data = g_ffs_cwd_m, design = "FFS")$trt_type
  ffs_fuels_package_2 <- ffs_fuels_package_2[order(ffs_fuels_package_2$time, ffs_fuels_package_2$trt_type),]
  ffs_fuels_hand_2 <- ffs_fuels_hand_2[order(ffs_fuels_hand_2$time, ffs_fuels_hand_2$trt_type),]

  expect_equal(ffs_fuels_hand_2$avg_1h, ffs_fuels_package_2$avg_1h_Mg_ha)
  expect_equal(ffs_fuels_hand_2$se_1h, ffs_fuels_package_2$se_1h_Mg_ha)
  expect_equal(ffs_fuels_hand_2$avg_10h, ffs_fuels_package_2$avg_10h_Mg_ha)
  expect_equal(ffs_fuels_hand_2$se_10h, ffs_fuels_package_2$se_10h_Mg_ha)
  expect_equal(ffs_fuels_hand_2$avg_100h, ffs_fuels_package_2$avg_100h_Mg_ha)
  expect_equal(ffs_fuels_hand_2$se_100h, ffs_fuels_package_2$se_100h_Mg_ha)
  expect_equal(ffs_fuels_hand_2$avg_1000h, ffs_fuels_package_2$avg_1000h_Mg_ha)
  expect_equal(ffs_fuels_hand_2$se_1000h, ffs_fuels_package_2$se_1000h_Mg_ha)

  # FFS, with FPC
  ffs_fuels_package_fpc_1 <- CompileSurfaceFuels(fwd_data = g_ffs_fwd_m, cwd_data = g_ffs_cwd_m, design = "FFS", fpc_data = g_ffs_fpc_1)$site
  ffs_fuels_package_fpc_1 <- ffs_fuels_package_fpc_1[order(ffs_fuels_package_fpc_1$time, ffs_fuels_package_fpc_1$trt_type, ffs_fuels_package_fpc_1$site),]
  ffs_fuels_hand_fpc_1 <- ffs_fuels_hand_fpc_1[order(ffs_fuels_hand_fpc_1$time, ffs_fuels_hand_fpc_1$trt_type, ffs_fuels_hand_fpc_1$site),]

  expect_equal(ffs_fuels_hand_fpc_1$avg_1h, ffs_fuels_package_fpc_1$avg_1h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_1$se_1h, ffs_fuels_package_fpc_1$se_1h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_1$avg_10h, ffs_fuels_package_fpc_1$avg_10h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_1$se_10h, ffs_fuels_package_fpc_1$se_10h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_1$avg_100h, ffs_fuels_package_fpc_1$avg_100h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_1$se_100h, ffs_fuels_package_fpc_1$se_100h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_1$avg_1000h, ffs_fuels_package_fpc_1$avg_1000h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_1$se_1000h, ffs_fuels_package_fpc_1$se_1000h_Mg_ha)

  ffs_fuels_package_fpc_2 <- CompileSurfaceFuels(fwd_data = g_ffs_fwd_m, cwd_data = g_ffs_cwd_m, design = "FFS", fpc_data = g_ffs_fpc_1)$trt_type
  ffs_fuels_package_fpc_2 <- ffs_fuels_package_fpc_2[order(ffs_fuels_package_fpc_2$time, ffs_fuels_package_fpc_2$trt_type),]
  ffs_fuels_hand_fpc_2 <- ffs_fuels_hand_fpc_2[order(ffs_fuels_hand_fpc_2$time, ffs_fuels_hand_fpc_2$trt_type),]

  expect_equal(ffs_fuels_hand_fpc_2$avg_1h, ffs_fuels_package_fpc_2$avg_1h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_2$se_1h, ffs_fuels_package_fpc_2$se_1h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_2$avg_10h, ffs_fuels_package_fpc_2$avg_10h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_2$se_10h, ffs_fuels_package_fpc_2$se_10h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_2$avg_100h, ffs_fuels_package_fpc_2$avg_100h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_2$se_100h, ffs_fuels_package_fpc_2$se_100h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_2$avg_1000h, ffs_fuels_package_fpc_2$avg_1000h_Mg_ha)
  expect_equal(ffs_fuels_hand_fpc_2$se_1000h, ffs_fuels_package_fpc_2$se_1000h_Mg_ha)

})

