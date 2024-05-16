
test_that("Output classes are as expected", {

  expect_equal(class(CompilePlots(data = g_strs, design = "STRS", wt_data = g_strs_wh_1)), "list")
  expect_equal(class(CompilePlots(data = g_srs, design = "SRS")), "data.frame")
  expect_equal(class(CompilePlots(data = g_ffs, design = "FFS")), "list")

})


test_that("STRS outputs have expected column names and classes", {

  strs_check <- CompilePlots(data = g_strs,
                             design = "STRS",
                             wt_data = g_strs_wh_1)

  expect_named(strs_check$stratum, c("time", "site", "stratum", "avg_ba", "se_ba", "avg_dbh", "se_dbh"))
  expect_equal(class(strs_check$stratum$time), "character")
  expect_equal(class(strs_check$stratum$site), "character")
  expect_equal(class(strs_check$stratum$stratum), "character")
  expect_equal(class(strs_check$stratum$avg_ba), "numeric")
  expect_equal(class(strs_check$stratum$se_ba), "numeric")
  expect_equal(class(strs_check$stratum$avg_dbh), "numeric")
  expect_equal(class(strs_check$stratum$se_dbh), "numeric")

  expect_named(strs_check$site, c("time", "site", "avg_ba", "se_ba", "avg_dbh", "se_dbh"))
  expect_equal(class(strs_check$site$time), "character")
  expect_equal(class(strs_check$site$site), "character")
  expect_equal(class(strs_check$site$avg_ba), "numeric")
  expect_equal(class(strs_check$site$se_ba), "numeric")
  expect_equal(class(strs_check$site$avg_dbh), "numeric")
  expect_equal(class(strs_check$site$se_dbh), "numeric")

  strs_check_sp <- CompilePlots(data = g_strs_sp,
                                design = "STRS",
                                wt_data = g_strs_wh_1)

  expect_named(strs_check_sp$stratum, c("time", "site", "stratum", "species", "avg_bio", "se_bio"))
  expect_equal(class(strs_check_sp$stratum$time), "character")
  expect_equal(class(strs_check_sp$stratum$site), "character")
  expect_equal(class(strs_check_sp$stratum$stratum), "character")
  expect_equal(class(strs_check_sp$stratum$species), "character")
  expect_equal(class(strs_check_sp$stratum$avg_bio), "numeric")
  expect_equal(class(strs_check_sp$stratum$se_bio), "numeric")

  expect_named(strs_check_sp$site, c("time", "site", "species", "avg_bio", "se_bio"))
  expect_equal(class(strs_check_sp$site$time), "character")
  expect_equal(class(strs_check_sp$site$site), "character")
  expect_equal(class(strs_check_sp$site$species), "character")
  expect_equal(class(strs_check_sp$site$avg_bio), "numeric")
  expect_equal(class(strs_check_sp$site$se_bio), "numeric")

})


test_that("STRS package and hand calculations match", {

  # STRS
  strs_package_1 <- CompilePlots(g_strs, design = "STRS", wt_data = g_strs_wh_1)$stratum
  strs_package_1 <- strs_package_1[order(strs_package_1$time, strs_package_1$site, strs_package_1$stratum),]
  strs_hand_1 <- strs_hand_1[order(strs_hand_1$time, strs_hand_1$site, strs_hand_1$stratum),]

  expect_equal(strs_hand_1$avg_ba, strs_package_1$avg_ba)
  expect_equal(strs_hand_1$se_ba, strs_package_1$se_ba)
  expect_equal(strs_hand_1$avg_dbh, strs_package_1$avg_dbh)
  expect_equal(strs_hand_1$se_dbh, strs_package_1$se_dbh)

  strs_package_2 <- CompilePlots(g_strs, design = "STRS", wt_data = g_strs_wh_1)$site
  strs_package_2 <- strs_package_2[order(strs_package_2$time, strs_package_2$site),]
  strs_hand_2 <- strs_hand_2[order(strs_hand_2$time, strs_hand_2$site),]

  expect_equal(strs_hand_2$avg_ba, strs_package_2$avg_ba)
  expect_equal(strs_hand_2$se_ba, strs_package_2$se_ba)
  expect_equal(strs_hand_2$avg_dbh, strs_package_2$avg_dbh)
  expect_equal(strs_hand_2$se_dbh, strs_package_2$se_dbh)

  # STRS, with FPC
  strs_package_fpc_1 <- CompilePlots(g_strs, design = "STRS", wt_data = g_strs_wh_1, fpc_data = g_strs_fpc_1)$stratum
  strs_package_fpc_1 <- strs_package_fpc_1[order(strs_package_fpc_1$time, strs_package_fpc_1$site, strs_package_fpc_1$stratum),]
  strs_hand_fpc_1 <- strs_hand_fpc_1[order(strs_hand_fpc_1$time, strs_hand_fpc_1$site, strs_hand_fpc_1$stratum),]

  expect_equal(strs_hand_fpc_1$avg_ba, strs_package_fpc_1$avg_ba)
  expect_equal(strs_hand_fpc_1$se_ba, strs_package_fpc_1$se_ba)
  expect_equal(strs_hand_fpc_1$avg_dbh, strs_package_fpc_1$avg_dbh)
  expect_equal(strs_hand_fpc_1$se_dbh, strs_package_fpc_1$se_dbh)

  strs_package_fpc_2 <- CompilePlots(g_strs, design = "STRS", wt_data = g_strs_wh_1, fpc_data = g_strs_fpc_1)$site
  strs_package_fpc_2 <- strs_package_fpc_2[order(strs_package_fpc_2$time, strs_package_fpc_2$site),]
  strs_hand_fpc_2 <- strs_hand_fpc_2[order(strs_hand_fpc_2$time, strs_hand_fpc_2$site),]

  expect_equal(strs_hand_fpc_2$avg_ba, strs_package_fpc_2$avg_ba)
  expect_equal(strs_hand_fpc_2$se_ba, strs_package_fpc_2$se_ba)
  expect_equal(strs_hand_fpc_2$avg_dbh, strs_package_fpc_2$avg_dbh)
  expect_equal(strs_hand_fpc_2$se_dbh, strs_package_fpc_2$se_dbh)

  # STRS, with species
  strs_package_sp_1 <- CompilePlots(g_strs_sp, design = "STRS", wt_data = g_strs_wh_1)$stratum
  strs_package_sp_1 <- strs_package_sp_1[order(strs_package_sp_1$time, strs_package_sp_1$site, strs_package_sp_1$stratum, strs_package_sp_1$species),]
  strs_hand_sp_1 <- strs_hand_sp_1[order(strs_hand_sp_1$time, strs_hand_sp_1$site, strs_hand_sp_1$stratum, strs_hand_sp_1$species),]

  expect_equal(strs_hand_sp_1$avg_bio, strs_package_sp_1$avg_bio)
  expect_equal(strs_hand_sp_1$se_bio, strs_package_sp_1$se_bio)

  strs_package_sp_2 <- CompilePlots(g_strs_sp, design = "STRS", wt_data = g_strs_wh_1)$site
  strs_package_sp_2 <- strs_package_sp_2[order(strs_package_sp_2$time, strs_package_sp_2$site, strs_package_sp_2$species),]
  strs_hand_sp_2 <- strs_hand_sp_2[order(strs_hand_sp_2$time, strs_hand_sp_2$site, strs_hand_sp_2$species),]

  expect_equal(strs_hand_sp_2$avg_bio, strs_package_sp_2$avg_bio)
  expect_equal(strs_hand_sp_2$se_bio, strs_package_sp_2$se_bio)

  # STRS, with species, with FPC
  strs_package_sp_fpc_1 <- CompilePlots(g_strs_sp, design = "STRS", wt_data = g_strs_wh_1, fpc_data = g_strs_fpc_1)$stratum
  strs_package_sp_fpc_1 <- strs_package_sp_fpc_1[order(strs_package_sp_fpc_1$time, strs_package_sp_fpc_1$site, strs_package_sp_fpc_1$stratum, strs_package_sp_fpc_1$species),]
  strs_hand_sp_fpc_1 <- strs_hand_sp_fpc_1[order(strs_hand_sp_fpc_1$time, strs_hand_sp_fpc_1$site, strs_hand_sp_fpc_1$stratum, strs_hand_sp_1$species),]

  expect_equal(strs_hand_sp_fpc_1$avg_bio, strs_package_sp_fpc_1$avg_bio)
  expect_equal(strs_hand_sp_fpc_1$se_bio, strs_package_sp_fpc_1$se_bio)

  strs_package_sp_fpc_2 <- CompilePlots(g_strs_sp, design = "STRS", wt_data = g_strs_wh_1, fpc_data = g_strs_fpc_1)$site
  strs_package_sp_fpc_2 <- strs_package_sp_fpc_2[order(strs_package_sp_fpc_2$time, strs_package_sp_fpc_2$site, strs_package_sp_fpc_2$species),]
  strs_hand_sp_fpc_2 <- strs_hand_sp_fpc_2[order(strs_hand_sp_fpc_2$time, strs_hand_sp_fpc_2$site, strs_hand_sp_fpc_2$species),]

  expect_equal(strs_hand_sp_fpc_2$avg_bio, strs_package_sp_fpc_2$avg_bio)
  expect_equal(strs_hand_sp_fpc_2$se_bio, strs_package_sp_fpc_2$se_bio)

})


test_that("SRS outputs have expected column names and classes", {

  srs_check <- CompilePlots(data = g_srs,
                            design = "SRS")

  expect_named(srs_check, c("time", "site", "avg_ba", "se_ba", "avg_dbh", "se_dbh"))
  expect_equal(class(srs_check$time), "character")
  expect_equal(class(srs_check$site), "character")
  expect_equal(class(srs_check$avg_ba), "numeric")
  expect_equal(class(srs_check$se_ba), "numeric")
  expect_equal(class(srs_check$avg_dbh), "numeric")
  expect_equal(class(srs_check$se_dbh), "numeric")

  srs_check_sp <- CompilePlots(data = g_srs_sp,
                               design = "SRS")

  expect_named(srs_check_sp, c("time", "site", "species", "avg_bio", "se_bio"))
  expect_equal(class(srs_check_sp$time), "character")
  expect_equal(class(srs_check_sp$site), "character")
  expect_equal(class(srs_check_sp$species), "character")
  expect_equal(class(srs_check_sp$avg_bio), "numeric")
  expect_equal(class(srs_check_sp$se_bio), "numeric")

})


test_that("SRS package and hand calculations match", {

  # SRS
  srs_package <- CompilePlots(g_srs, design = "SRS")
  srs_package <- srs_package[order(srs_package$time, srs_package$site),]
  srs_hand <- srs_hand[order(srs_hand$time, srs_hand$site),]

  expect_equal(srs_hand$avg_ba, srs_package$avg_ba)
  expect_equal(srs_hand$se_ba, srs_package$se_ba)
  expect_equal(srs_hand$avg_dbh, srs_package$avg_dbh)
  expect_equal(srs_hand$se_dbh, srs_package$se_dbh)

  # SRS, with FPC
  srs_package_fpc <- CompilePlots(g_srs, design = "SRS", fpc = g_srs_fpc_1)
  srs_package_fpc <- srs_package_fpc[order(srs_package_fpc$time, srs_package_fpc$site),]
  srs_hand_fpc <- srs_hand_fpc[order(srs_hand_fpc$time, srs_hand_fpc$site),]

  expect_equal(srs_hand_fpc$avg_ba, srs_package_fpc$avg_ba)
  expect_equal(srs_hand_fpc$se_ba, srs_package_fpc$se_ba)
  expect_equal(srs_hand_fpc$avg_dbh, srs_package_fpc$avg_dbh)
  expect_equal(srs_hand_fpc$se_dbh, srs_package_fpc$se_dbh)

  # SRS, with species
  srs_package_sp <- CompilePlots(g_srs_sp, design = "SRS")
  srs_package_sp <- srs_package_sp[order(srs_package_sp$time, srs_package_sp$site, srs_package_sp$species),]
  srs_hand_sp <- srs_hand_sp[order(srs_hand_sp$time, srs_hand_sp$site, srs_hand_sp$species),]

  expect_equal(srs_hand_sp$avg_bio, srs_package_sp$avg_bio)
  expect_equal(srs_hand_sp$se_bio, srs_package_sp$se_bio)

  # SRS, with species, with FPC
  srs_package_sp_fpc <- CompilePlots(g_srs_sp, design = "SRS", fpc = g_srs_fpc_1)
  srs_package_sp_fpc <- srs_package_sp_fpc[order(srs_package_sp_fpc$time, srs_package_sp_fpc$site, srs_package_sp_fpc$species),]
  srs_hand_sp_fpc <- srs_hand_sp_fpc[order(srs_hand_sp_fpc$time, srs_hand_sp_fpc$site, srs_package_sp_fpc$species),]

  expect_equal(srs_hand_sp_fpc$avg_bio, srs_package_sp_fpc$avg_bio)
  expect_equal(srs_hand_sp_fpc$se_bio, srs_package_sp_fpc$se_bio)

})


test_that("FFS outputs have expected column names and classes", {

  ffs_check <- CompilePlots(data = g_ffs,
                            design = "FFS")

  expect_named(ffs_check$site, c("time", "trt_type", "site", "avg_ba", "se_ba", "avg_dbh", "se_dbh"))
  expect_equal(class(ffs_check$site$time), "character")
  expect_equal(class(ffs_check$site$trt_type), "character")
  expect_equal(class(ffs_check$site$site), "character")
  expect_equal(class(ffs_check$site$avg_ba), "numeric")
  expect_equal(class(ffs_check$site$se_ba), "numeric")
  expect_equal(class(ffs_check$site$avg_dbh), "numeric")
  expect_equal(class(ffs_check$site$se_dbh), "numeric")

  expect_named(ffs_check$trt_type, c("time", "trt_type", "avg_ba", "se_ba", "avg_dbh", "se_dbh"))
  expect_equal(class(ffs_check$trt_type$time), "character")
  expect_equal(class(ffs_check$trt_type$trt_type), "character")
  expect_equal(class(ffs_check$trt_type$avg_ba), "numeric")
  expect_equal(class(ffs_check$trt_type$se_ba), "numeric")
  expect_equal(class(ffs_check$trt_type$avg_dbh), "numeric")
  expect_equal(class(ffs_check$trt_type$se_dbh), "numeric")

  ffs_check_sp <- CompilePlots(data = g_ffs_sp,
                               design = "FFS")

  expect_named(ffs_check_sp$site, c("time", "trt_type", "site", "species", "avg_bio", "se_bio"))
  expect_equal(class(ffs_check_sp$site$time), "character")
  expect_equal(class(ffs_check_sp$site$trt_type), "character")
  expect_equal(class(ffs_check_sp$site$site), "character")
  expect_equal(class(ffs_check_sp$site$species), "character")
  expect_equal(class(ffs_check_sp$site$avg_bio), "numeric")
  expect_equal(class(ffs_check_sp$site$se_bio), "numeric")

  expect_named(ffs_check_sp$trt_type, c("time", "trt_type", "species", "avg_bio", "se_bio"))
  expect_equal(class(ffs_check_sp$trt_type$time), "character")
  expect_equal(class(ffs_check_sp$trt_type$trt_type), "character")
  expect_equal(class(ffs_check_sp$trt_type$species), "character")
  expect_equal(class(ffs_check_sp$trt_type$avg_bio), "numeric")
  expect_equal(class(ffs_check_sp$trt_type$se_bio), "numeric")

})


test_that("FFS package and hand calculations match", {

  # FFS
  ffs_package_1 <- CompilePlots(g_ffs, design = "FFS")$site
  ffs_package_1 <- ffs_package_1[order(ffs_package_1$time, ffs_package_1$trt_type, ffs_package_1$site),]
  ffs_hand_1 <- ffs_hand_1[order(ffs_hand_1$time, ffs_hand_1$trt_type, ffs_hand_1$site),]

  expect_equal(ffs_hand_1$avg_ba, ffs_package_1$avg_ba)
  expect_equal(ffs_hand_1$se_ba, ffs_package_1$se_ba)
  expect_equal(ffs_hand_1$avg_dbh, ffs_package_1$avg_dbh)
  expect_equal(ffs_hand_1$se_dbh, ffs_package_1$se_dbh)

  ffs_package_2 <- CompilePlots(g_ffs, design = "FFS")$trt_type
  ffs_package_2 <- ffs_package_2[order(ffs_package_2$time, ffs_package_2$trt_type),]
  ffs_hand_2 <- ffs_hand_2[order(ffs_hand_2$time, ffs_hand_2$trt_type),]

  expect_equal(ffs_hand_2$avg_ba, ffs_package_2$avg_ba)
  expect_equal(ffs_hand_2$se_ba, ffs_package_2$se_ba)
  expect_equal(ffs_hand_2$avg_dbh, ffs_package_2$avg_dbh)
  expect_equal(ffs_hand_2$se_dbh, ffs_package_2$se_dbh)

  # FFS, with FPC
  ffs_package_fpc_1 <- CompilePlots(g_ffs, design = "FFS", fpc_data = g_ffs_fpc_1)$site
  ffs_package_fpc_1 <- ffs_package_fpc_1[order(ffs_package_fpc_1$time, ffs_package_fpc_1$trt_type, ffs_package_fpc_1$site),]
  ffs_hand_fpc_1 <- ffs_hand_fpc_1[order(ffs_hand_fpc_1$time, ffs_hand_fpc_1$trt_type, ffs_hand_fpc_1$site),]

  expect_equal(ffs_hand_fpc_1$avg_ba, ffs_package_fpc_1$avg_ba)
  expect_equal(ffs_hand_fpc_1$se_ba, ffs_package_fpc_1$se_ba)
  expect_equal(ffs_hand_fpc_1$avg_dbh, ffs_package_fpc_1$avg_dbh)
  expect_equal(ffs_hand_fpc_1$se_dbh, ffs_package_fpc_1$se_dbh)

  ffs_package_fpc_2 <- CompilePlots(g_ffs, design = "FFS", fpc_data = g_ffs_fpc_1)$trt_type
  ffs_package_fpc_2 <- ffs_package_fpc_2[order(ffs_package_fpc_2$time, ffs_package_fpc_2$trt_type),]
  ffs_hand_fpc_2 <- ffs_hand_fpc_2[order(ffs_hand_fpc_2$time, ffs_hand_fpc_2$trt_type),]

  expect_equal(ffs_hand_fpc_2$avg_ba, ffs_package_fpc_2$avg_ba)
  expect_equal(ffs_hand_fpc_2$se_ba, ffs_package_fpc_2$se_ba)
  expect_equal(ffs_hand_fpc_2$avg_dbh, ffs_package_fpc_2$avg_dbh)
  expect_equal(ffs_hand_fpc_2$se_dbh, ffs_package_fpc_2$se_dbh)

  # FFS, with species
  ffs_package_sp_1 <- CompilePlots(g_ffs_sp, design = "FFS")$site
  ffs_package_sp_1 <- ffs_package_sp_1[order(ffs_package_sp_1$time, ffs_package_sp_1$trt_type, ffs_package_sp_1$site, ffs_package_sp_1$species),]
  ffs_hand_sp_1 <- ffs_hand_sp_1[order(ffs_hand_sp_1$time, ffs_hand_sp_1$trt_type, ffs_hand_sp_1$site, ffs_hand_sp_1$species),]

  expect_equal(ffs_hand_sp_1$avg_bio, ffs_package_sp_1$avg_bio)
  expect_equal(ffs_hand_sp_1$se_bio, ffs_package_sp_1$se_bio)

  ffs_package_sp_2 <- CompilePlots(g_ffs_sp, design = "FFS")$trt_type
  ffs_package_sp_2 <- ffs_package_sp_2[order(ffs_package_sp_2$time, ffs_package_sp_2$trt_type, ffs_package_sp_2$species),]
  ffs_hand_sp_2 <- ffs_hand_sp_2[order(ffs_hand_sp_2$time, ffs_hand_sp_2$trt_type, ffs_hand_sp_2$species),]

  expect_equal(ffs_hand_sp_2$avg_bio, ffs_package_sp_2$avg_bio)
  expect_equal(ffs_hand_sp_2$se_bio, ffs_package_sp_2$se_bio)

  # FFS, with species, with FPC
  ffs_package_sp_fpc_1 <- CompilePlots(g_ffs_sp, design = "FFS", fpc_data = g_ffs_fpc_3)$site
  ffs_package_sp_fpc_1 <- ffs_package_sp_fpc_1[order(ffs_package_sp_fpc_1$time, ffs_package_sp_fpc_1$trt_type, ffs_package_sp_fpc_1$site, ffs_package_sp_fpc_1$species),]
  ffs_hand_sp_fpc_1 <- ffs_hand_sp_fpc_1[order(ffs_hand_sp_fpc_1$time, ffs_hand_sp_fpc_1$trt_type, ffs_hand_sp_fpc_1$site, ffs_hand_sp_fpc_1$species),]

  expect_equal(ffs_hand_sp_fpc_1$avg_bio, ffs_package_sp_fpc_1$avg_bio)
  expect_equal(ffs_hand_sp_fpc_1$se_bio, ffs_package_sp_fpc_1$se_bio)

  ffs_package_sp_fpc_2 <- CompilePlots(g_ffs_sp, design = "FFS", fpc_data = g_ffs_fpc_3)$trt_type
  ffs_package_sp_fpc_2 <- ffs_package_sp_fpc_2[order(ffs_package_sp_fpc_2$time, ffs_package_sp_fpc_2$trt_type, ffs_package_sp_fpc_2$species),]
  ffs_hand_sp_fpc_2 <- ffs_hand_sp_fpc_2[order(ffs_hand_sp_fpc_2$time, ffs_hand_sp_fpc_2$trt_type, ffs_hand_sp_fpc_2$species),]

  expect_equal(ffs_hand_sp_fpc_2$avg_bio, ffs_package_sp_fpc_2$avg_bio)
  expect_equal(ffs_hand_sp_fpc_2$se_bio, ffs_package_sp_fpc_2$se_bio)

})

