
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

