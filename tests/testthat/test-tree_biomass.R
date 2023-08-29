
test_that("Dataframes have expected column names", {

  expect_named(TreeBiomass(data = good_trees_metric,
                           status = "Live",
                           species = "SPP",
                           dbh = "DBH_CM",
                           ht = "HT_M",
                           decay_class = "ignore",
                           sp_codes = "4letter",
                           units = "metric"),
               c("Plot", "Live", "Decay", "SPP", "DBH_CM", "HT_M", "stem_bio_kg", "bark_bio_kg", "branch_bio_kg", "total_bio_kg"))

  expect_named(TreeBiomass(data = good_trees_metric,
                           status = "Live",
                           species = "SPP",
                           dbh = "DBH_CM",
                           ht = "HT_M",
                           decay_class = "Decay",
                           sp_codes = "4letter",
                           units = "metric"),
               c("Plot", "Live", "Decay", "SPP", "DBH_CM", "HT_M", "stem_bio_kg", "bark_bio_kg", "branch_bio_kg", "total_bio_kg"))

  expect_named(TreeBiomass(data = good_trees_imperial,
                           status = "Live",
                           species = "SPP",
                           dbh = "DBH_IN",
                           ht = "HT_FT",
                           decay_class = "ignore",
                           sp_codes = "4letter",
                           units = "imperial"),
               c("Plot", "Live", "Decay", "SPP", "DBH_IN", "HT_FT", "stem_bio_tons", "bark_bio_tons", "branch_bio_tons", "total_bio_tons"))

})


test_that("Final column classes are as expected", {

  trial_metric <- TreeBiomass(data = good_trees_metric,
                              status = "Live",
                              species = "SPP",
                              dbh = "DBH_CM",
                              ht = "HT_M",
                              decay_class = "Decay",
                              sp_codes = "4letter",
                              units = "metric")

  expect_equal(class(trial_metric$Live), "factor")
  expect_equal(class(trial_metric$Decay), "character")
  expect_equal(class(trial_metric$SPP), "character")
  expect_equal(class(trial_metric$stem_bio_kg), "numeric")
  expect_equal(class(trial_metric$bark_bio_kg), "numeric")
  expect_equal(class(trial_metric$branch_bio_kg), "numeric")
  expect_equal(class(trial_metric$total_bio_kg), "numeric")

  trial_imperial <- TreeBiomass(data = good_trees_imperial,
                                status = "Live",
                                species = "SPP",
                                dbh = "DBH_IN",
                                ht = "HT_FT",
                                decay_class = "Decay",
                                sp_codes = "4letter",
                                units = "imperial")

  expect_equal(class(trial_metric$Live), "factor")
  expect_equal(class(trial_metric$Decay), "character")
  expect_equal(class(trial_metric$SPP), "character")
  expect_equal(class(trial_imperial$stem_bio_tons), "numeric")
  expect_equal(class(trial_imperial$bark_bio_tons), "numeric")
  expect_equal(class(trial_imperial$branch_bio_tons), "numeric")
  expect_equal(class(trial_imperial$total_bio_tons), "numeric")

})


test_that("Package and hand calculations match", {

  results_by_hand <- read.csv(system.file('extdata', 'results_check.csv', package = "UCBForestAnalytics"),
                              stringsAsFactors = FALSE)

  # 4letter and metric --------------------------
  results_by_package1 <- TreeBiomass(data = results_by_hand,
                                     status = "Live",
                                     species = "SP4",
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
