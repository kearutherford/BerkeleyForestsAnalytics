
test_that("Output dataframe has expected column names", {

  expect_named(AdjustBiomass(data = good_trees_metric,
                             status = "Live",
                             decay_class = "Decay",
                             species = "SPP",
                             dbh = "DBH_CM",
                             ht = "HT_M"),
               c("Plot", "Live", "Decay", "SPP", "DBH_CM", "HT_M", "stem_bio_kg", "bark_bio_kg", "branch_bio_kg", "total_bio_kg"))

  expect_named(AdjustBiomass(data = good_trees_imperial,
                             status = "Live",
                             decay_class = "Decay",
                             species = "SPP",
                             dbh = "DBH_IN",
                             ht = "HT_FT",
                             units = "imperial"),
               c("Plot", "Live", "Decay", "SPP", "DBH_IN", "HT_FT", "stem_bio_tons", "bark_bio_tons", "branch_bio_tons", "total_bio_tons"))

})


test_that("Final column classes are as expected", {

  adj_trial <- AdjustBiomass(data = good_trees_metric,
                             status = "Live",
                             decay_class = "Decay",
                             species = "SPP",
                             dbh = "DBH_CM",
                             ht = "HT_M")

  expect_equal(class(adj_trial$Decay), "character")

})
