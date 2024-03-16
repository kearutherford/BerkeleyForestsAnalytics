
test_that("outputs are lists with two components: (1) total run time and (2) dataframe", {





})


test_that("by_tree dataframes have expected column names", {

  expect_named(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe,
               c("division", "site", "plot", "exp_factor", "status", "decay_class", "species", "species_fia", "dbh_cm", "ht1_m", "ht2_m", "crown_ratio",
                 "top", "cull", "total_wood_kg", "total_bark_kg", "total_branch_kg", "total_ag_kg", "merch_wood_kg", "merch_bark_kg", "merch_total_kg",
                 "merch_top_kg", "stump_wood_kg", "stump_bark_kg", "stump_total_kg", "foliage_kg", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                 "merch_wood_c", "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio"))

  expect_named(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_tree")$dataframe,
               c("division", "site", "plot", "exp_factor", "status", "decay_class", "species", "species_fia", "dbh_in", "ht1_ft", "ht2_ft", "crown_ratio", "top", "cull",
                 "total_wood_tons", "total_bark_tons", "total_branch_tons", "total_ag_tons", "merch_wood_tons", "merch_bark_tons", "merch_total_tons", "merch_top_tons",
                 "stump_wood_tons", "stump_bark_tons", "stump_total_tons", "foliage_tons", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_wood_c",
                 "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio"))

  expect_named(BiomassNSVB(data = nsvb_gmf, sp_codes = "fia", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe,
               c("division", "site", "plot", "exp_factor", "status", "decay_class", "species", "dbh_cm", "ht1_m", "ht2_m", "crown_ratio",
                 "top", "cull", "total_wood_kg", "total_bark_kg", "total_branch_kg", "total_ag_kg", "merch_wood_kg", "merch_bark_kg", "merch_total_kg",
                 "merch_top_kg", "stump_wood_kg", "stump_bark_kg", "stump_total_kg", "foliage_kg", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                 "merch_wood_c", "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio", "extra1", "extra2"))

  expect_named(BiomassNSVB(data = nsvb_gmf, sp_codes = "fia", input_units = "metric", output_units = "imperial", results = "by_tree")$dataframe,
               c("division", "site", "plot", "exp_factor", "status", "decay_class", "species", "dbh_in", "ht1_ft", "ht2_ft", "crown_ratio", "top", "cull",
                 "total_wood_tons", "total_bark_tons", "total_branch_tons", "total_ag_tons", "merch_wood_tons", "merch_bark_tons", "merch_total_tons", "merch_top_tons",
                 "stump_wood_tons", "stump_bark_tons", "stump_total_tons", "foliage_tons", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_wood_c",
                 "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio", "extra1", "extra2"))

  expect_named(BiomassNSVB(data = nsvb_gi4, sp_codes = "4letter", input_units = "imperial", output_units = "metric", results = "by_tree")$dataframe,
               c("division", "site", "plot", "exp_factor", "status", "decay_class", "species", "species_fia", "dbh_cm", "ht1_m", "ht2_m", "crown_ratio",
                 "top", "cull", "total_wood_kg", "total_bark_kg", "total_branch_kg", "total_ag_kg", "merch_wood_kg", "merch_bark_kg", "merch_total_kg",
                 "merch_top_kg", "stump_wood_kg", "stump_bark_kg", "stump_total_kg", "foliage_kg", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                 "merch_wood_c", "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio"))

  expect_named(BiomassNSVB(data = nsvb_gi4, sp_codes = "4letter", input_units = "imperial", output_units = "imperial", results = "by_tree")$dataframe,
               c("division", "site", "plot", "exp_factor", "status", "decay_class", "species", "species_fia", "dbh_in", "ht1_ft", "ht2_ft", "crown_ratio", "top", "cull",
                 "total_wood_tons", "total_bark_tons", "total_branch_tons", "total_ag_tons", "merch_wood_tons", "merch_bark_tons", "merch_total_tons", "merch_top_tons",
                 "stump_wood_tons", "stump_bark_tons", "stump_total_tons", "foliage_tons", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_wood_c",
                 "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio"))

  expect_named(BiomassNSVB(data = nsvb_gif, sp_codes = "fia", input_units = "imperial", output_units = "metric", results = "by_tree")$dataframe,
               c("division", "site", "plot", "exp_factor", "status", "decay_class", "species", "dbh_cm", "ht1_m", "ht2_m", "crown_ratio",
                 "top", "cull", "total_wood_kg", "total_bark_kg", "total_branch_kg", "total_ag_kg", "merch_wood_kg", "merch_bark_kg", "merch_total_kg",
                 "merch_top_kg", "stump_wood_kg", "stump_bark_kg", "stump_total_kg", "foliage_kg", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                 "merch_wood_c", "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio"))

  expect_named(BiomassNSVB(data = nsvb_gif, sp_codes = "fia", input_units = "imperial", output_units = "imperial", results = "by_tree")$dataframe,
               c("division", "site", "plot", "exp_factor", "status", "decay_class", "species", "dbh_in", "ht1_ft", "ht2_ft", "crown_ratio", "top", "cull",
                 "total_wood_tons", "total_bark_tons", "total_branch_tons", "total_ag_tons", "merch_wood_tons", "merch_bark_tons", "merch_total_tons", "merch_top_tons",
                 "stump_wood_tons", "stump_bark_tons", "stump_total_tons", "foliage_tons", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_wood_c",
                 "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio"))

})


test_that("by_tree dataframes have expected column classes", {

  # Outputs are imperial -------------------------------------------------------
  by_tree_check1 <- BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_tree")$dataframe

  expect_equal(class(by_tree_check1$division), "character")
  expect_equal(class(by_tree_check1$site), "character")
  expect_equal(class(by_tree_check1$plot), "character")
  expect_equal(class(by_tree_check1$exp_factor), "numeric")
  expect_equal(class(by_tree_check1$status), "character")
  expect_equal(class(by_tree_check1$decay_class), "character")
  expect_equal(class(by_tree_check1$species), "character")
  expect_equal(class(by_tree_check1$species_fia), "character")
  expect_equal(class(by_tree_check1$dbh_in), "numeric")
  expect_equal(class(by_tree_check1$ht1_ft), "numeric")
  expect_equal(class(by_tree_check1$ht2_ft), "numeric")
  expect_equal(class(by_tree_check1$crown_ratio), "numeric")
  expect_equal(class(by_tree_check1$top), "character")
  expect_equal(class(by_tree_check1$cull), "numeric")
  expect_equal(class(by_tree_check1$total_wood_tons), "numeric")
  expect_equal(class(by_tree_check1$total_bark_tons), "numeric")
  expect_equal(class(by_tree_check1$total_branch_tons), "numeric")
  expect_equal(class(by_tree_check1$total_ag_tons), "numeric")
  expect_equal(class(by_tree_check1$merch_wood_tons), "numeric")
  expect_equal(class(by_tree_check1$merch_bark_tons), "numeric")
  expect_equal(class(by_tree_check1$merch_total_tons), "numeric")
  expect_equal(class(by_tree_check1$merch_top_tons), "numeric")
  expect_equal(class(by_tree_check1$stump_wood_tons), "numeric")
  expect_equal(class(by_tree_check1$stump_bark_tons), "numeric")
  expect_equal(class(by_tree_check1$stump_total_tons), "numeric")
  expect_equal(class(by_tree_check1$foliage_tons), "numeric")
  expect_equal(class(by_tree_check1$total_wood_c), "numeric")
  expect_equal(class(by_tree_check1$total_bark_c), "numeric")
  expect_equal(class(by_tree_check1$total_branch_c), "numeric")
  expect_equal(class(by_tree_check1$total_ag_c), "numeric")
  expect_equal(class(by_tree_check1$merch_wood_c), "numeric")
  expect_equal(class(by_tree_check1$merch_bark_c), "numeric")
  expect_equal(class(by_tree_check1$merch_total_c), "numeric")
  expect_equal(class(by_tree_check1$merch_top_c), "numeric")
  expect_equal(class(by_tree_check1$stump_wood_c), "numeric")
  expect_equal(class(by_tree_check1$stump_bark_c), "numeric")
  expect_equal(class(by_tree_check1$stump_total_c), "numeric")
  expect_equal(class(by_tree_check1$foliage_c), "numeric")
  expect_equal(class(by_tree_check1$calc_bio), "character")

  # Outputs are metric ---------------------------------------------------------
  by_tree_check2 <- BiomassNSVB(data = nsvb_gif, sp_codes = "fia", input_units = "imperial", output_units = "metric", results = "by_tree")$dataframe

  expect_equal(class(by_tree_check2$division), "character")
  expect_equal(class(by_tree_check2$site), "character")
  expect_equal(class(by_tree_check2$plot), "character")
  expect_equal(class(by_tree_check2$exp_factor), "numeric")
  expect_equal(class(by_tree_check2$status), "character")
  expect_equal(class(by_tree_check2$decay_class), "character")
  expect_equal(class(by_tree_check2$species), "character")
  expect_equal(class(by_tree_check2$dbh_cm), "numeric")
  expect_equal(class(by_tree_check2$ht1_m), "numeric")
  expect_equal(class(by_tree_check2$ht2_m), "numeric")
  expect_equal(class(by_tree_check2$crown_ratio), "numeric")
  expect_equal(class(by_tree_check2$top), "character")
  expect_equal(class(by_tree_check2$cull), "numeric")
  expect_equal(class(by_tree_check2$total_wood_kg), "numeric")
  expect_equal(class(by_tree_check2$total_bark_kg), "numeric")
  expect_equal(class(by_tree_check2$total_branch_kg), "numeric")
  expect_equal(class(by_tree_check2$total_ag_kg), "numeric")
  expect_equal(class(by_tree_check2$merch_wood_kg), "numeric")
  expect_equal(class(by_tree_check2$merch_bark_kg), "numeric")
  expect_equal(class(by_tree_check2$merch_total_kg), "numeric")
  expect_equal(class(by_tree_check2$merch_top_kg), "numeric")
  expect_equal(class(by_tree_check2$stump_wood_kg), "numeric")
  expect_equal(class(by_tree_check2$stump_bark_kg), "numeric")
  expect_equal(class(by_tree_check2$stump_total_kg), "numeric")
  expect_equal(class(by_tree_check2$foliage_kg), "numeric")
  expect_equal(class(by_tree_check2$total_wood_c), "numeric")
  expect_equal(class(by_tree_check2$total_bark_c), "numeric")
  expect_equal(class(by_tree_check2$total_branch_c), "numeric")
  expect_equal(class(by_tree_check2$total_ag_c), "numeric")
  expect_equal(class(by_tree_check2$merch_wood_c), "numeric")
  expect_equal(class(by_tree_check2$merch_bark_c), "numeric")
  expect_equal(class(by_tree_check2$merch_total_c), "numeric")
  expect_equal(class(by_tree_check2$merch_top_c), "numeric")
  expect_equal(class(by_tree_check2$stump_wood_c), "numeric")
  expect_equal(class(by_tree_check2$stump_bark_c), "numeric")
  expect_equal(class(by_tree_check2$stump_total_c), "numeric")
  expect_equal(class(by_tree_check2$foliage_c), "numeric")
  expect_equal(class(by_tree_check2$calc_bio), "character")

})


test_that("Package and hand calculations match", {




})
