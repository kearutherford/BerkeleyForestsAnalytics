
test_that("Dataframes have expected column names", {

  expect_named((TreeBiomass(data = good_trees_metric,
                            status = "Live",
                            sp = "SPP",
                            dbh = "DBH_CM",
                            ht = "HT_M",
                            sp_codes = "4letter",
                            units = "metric")),
               c("Plot", "Live", "SPP", "DBH_CM", "HT_M", "stem_bio_kg", "bark_bio_kg", "branch_bio_kg", "total_bio_kg"))

  expect_named((TreeBiomass(data = good_trees_imperial,
                            status = "Live",
                            sp = "SPP",
                            dbh = "DBH_IN",
                            ht = "HT_FT",
                            sp_codes = "4letter",
                            units = "imperial")),
               c("Plot", "Live", "SPP", "DBH_IN", "HT_FT", "stem_bio_tons", "bark_bio_tons", "branch_bio_tons", "total_bio_tons"))

})


test_that("Package and hand calculations match", {

  results_by_hand <- read.csv(system.file('extdata', 'results_check.csv', package = "Rbiomass"),
                              stringsAsFactors = FALSE)

  # 4letter and metric --------------------------
  results_by_package1 <- TreeBiomass(data = results_by_hand,
                                     status = "Live",
                                     sp = "SP4",
                                     dbh = "DBH_CM",
                                     ht = "HT_M",
                                     sp_codes = "4letter",
                                     units = "metric")

  # stem
  expect_equal(results_by_package1$stem_bio_kg,
               results_by_hand$stem_KR)

  # bark
  expect_equal(results_by_package1$bark_bio_kg,
               results_by_hand$bark_KR)

  # branch
  expect_equal(results_by_package1$branch_bio_kg,
               results_by_hand$branch_KR)

  # fia and metric -----------------------------
  results_by_package2 <- TreeBiomass(data = results_by_hand,
                                     status = "Live",
                                     sp = "FIA",
                                     dbh = "DBH_CM",
                                     ht = "HT_M",
                                     sp_codes = "fia",
                                     units = "metric")

  # stem
  expect_equal(results_by_package2$stem_bio_kg,
               results_by_hand$stem_KR)

  # bark
  expect_equal(results_by_package2$bark_bio_kg,
               results_by_hand$bark_KR)

  # branch
  expect_equal(results_by_package2$branch_bio_kg,
               results_by_hand$branch_KR)

})
