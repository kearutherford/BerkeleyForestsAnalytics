
test_that("outputs are lists with two components: (1) total run time and (2) dataframe", {

  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")), "list")
  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$run_time), "difftime")
  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe), "data.frame")

  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_plot")), "list")
  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_plot")$run_time), "difftime")
  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_plot")$dataframe), "data.frame")

  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_species")), "list")
  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_species")$run_time), "difftime")
  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_species")$dataframe), "data.frame")

  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_status")), "list")
  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_status")$run_time), "difftime")
  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_status")$dataframe), "data.frame")

  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_sp_st")), "list")
  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_sp_st")$run_time), "difftime")
  expect_equal(class(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_sp_st")$dataframe), "data.frame")

})


test_that("by_tree dataframes have expected column names", {

  expect_named(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe,
               c("division", "province", "site", "plot", "exp_factor", "status", "decay_class", "species", "species_fia", "dbh_cm", "ht1_m", "ht2_m", "crown_ratio",
                 "top", "cull", "total_wood_kg", "total_bark_kg", "total_branch_kg", "total_ag_kg", "merch_wood_kg", "merch_bark_kg", "merch_total_kg",
                 "merch_top_kg", "stump_wood_kg", "stump_bark_kg", "stump_total_kg", "foliage_kg", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                 "merch_wood_c", "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio"))

  expect_named(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_tree")$dataframe,
               c("division", "province", "site", "plot", "exp_factor", "status", "decay_class", "species", "species_fia", "dbh_in", "ht1_ft", "ht2_ft", "crown_ratio", "top", "cull",
                 "total_wood_tons", "total_bark_tons", "total_branch_tons", "total_ag_tons", "merch_wood_tons", "merch_bark_tons", "merch_total_tons", "merch_top_tons",
                 "stump_wood_tons", "stump_bark_tons", "stump_total_tons", "foliage_tons", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_wood_c",
                 "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio"))

  expect_named(BiomassNSVB(data = nsvb_gmf, sp_codes = "fia", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe,
               c("division", "province", "site", "plot", "exp_factor", "status", "decay_class", "species", "dbh_cm", "ht1_m", "ht2_m", "crown_ratio",
                 "top", "cull", "total_wood_kg", "total_bark_kg", "total_branch_kg", "total_ag_kg", "merch_wood_kg", "merch_bark_kg", "merch_total_kg",
                 "merch_top_kg", "stump_wood_kg", "stump_bark_kg", "stump_total_kg", "foliage_kg", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                 "merch_wood_c", "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio", "extra1", "extra2"))

  expect_named(BiomassNSVB(data = nsvb_gmf, sp_codes = "fia", input_units = "metric", output_units = "imperial", results = "by_tree")$dataframe,
               c("division", "province", "site", "plot", "exp_factor", "status", "decay_class", "species", "dbh_in", "ht1_ft", "ht2_ft", "crown_ratio", "top", "cull",
                 "total_wood_tons", "total_bark_tons", "total_branch_tons", "total_ag_tons", "merch_wood_tons", "merch_bark_tons", "merch_total_tons", "merch_top_tons",
                 "stump_wood_tons", "stump_bark_tons", "stump_total_tons", "foliage_tons", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_wood_c",
                 "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio", "extra1", "extra2"))

  expect_named(BiomassNSVB(data = nsvb_gi4, sp_codes = "4letter", input_units = "imperial", output_units = "metric", results = "by_tree")$dataframe,
               c("division", "province", "site", "plot", "exp_factor", "status", "decay_class", "species", "species_fia", "dbh_cm", "ht1_m", "ht2_m", "crown_ratio",
                 "top", "cull", "total_wood_kg", "total_bark_kg", "total_branch_kg", "total_ag_kg", "merch_wood_kg", "merch_bark_kg", "merch_total_kg",
                 "merch_top_kg", "stump_wood_kg", "stump_bark_kg", "stump_total_kg", "foliage_kg", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                 "merch_wood_c", "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio"))

  expect_named(BiomassNSVB(data = nsvb_gi4, sp_codes = "4letter", input_units = "imperial", output_units = "imperial", results = "by_tree")$dataframe,
               c("division", "province", "site", "plot", "exp_factor", "status", "decay_class", "species", "species_fia", "dbh_in", "ht1_ft", "ht2_ft", "crown_ratio", "top", "cull",
                 "total_wood_tons", "total_bark_tons", "total_branch_tons", "total_ag_tons", "merch_wood_tons", "merch_bark_tons", "merch_total_tons", "merch_top_tons",
                 "stump_wood_tons", "stump_bark_tons", "stump_total_tons", "foliage_tons", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_wood_c",
                 "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio"))

  expect_named(BiomassNSVB(data = nsvb_gif, sp_codes = "fia", input_units = "imperial", output_units = "metric", results = "by_tree")$dataframe,
               c("division", "province", "site", "plot", "exp_factor", "status", "decay_class", "species", "dbh_cm", "ht1_m", "ht2_m", "crown_ratio",
                 "top", "cull", "total_wood_kg", "total_bark_kg", "total_branch_kg", "total_ag_kg", "merch_wood_kg", "merch_bark_kg", "merch_total_kg",
                 "merch_top_kg", "stump_wood_kg", "stump_bark_kg", "stump_total_kg", "foliage_kg", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                 "merch_wood_c", "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio"))

  expect_named(BiomassNSVB(data = nsvb_gif, sp_codes = "fia", input_units = "imperial", output_units = "imperial", results = "by_tree")$dataframe,
               c("division", "province", "site", "plot", "exp_factor", "status", "decay_class", "species", "dbh_in", "ht1_ft", "ht2_ft", "crown_ratio", "top", "cull",
                 "total_wood_tons", "total_bark_tons", "total_branch_tons", "total_ag_tons", "merch_wood_tons", "merch_bark_tons", "merch_total_tons", "merch_top_tons",
                 "stump_wood_tons", "stump_bark_tons", "stump_total_tons", "foliage_tons", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_wood_c",
                 "merch_bark_c", "merch_total_c", "merch_top_c", "stump_wood_c", "stump_bark_c", "stump_total_c", "foliage_c", "calc_bio"))

})


test_that("by_tree dataframes have expected column classes", {

  # Outputs are imperial -------------------------------------------------------
  by_tree_check1 <- BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_tree")$dataframe

  expect_equal(class(by_tree_check1$division), "character")
  expect_equal(class(by_tree_check1$province), "character")
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
  expect_equal(class(by_tree_check2$province), "character")
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


test_that("NA biomass/carbon is as expected", {

  # small trees have NA merchantable biomass/carbon
  NA_check_small <- subset(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe, dbh_cm < 12.7,
                           select = c(merch_wood_kg, merch_bark_kg, merch_total_kg, merch_top_kg, stump_wood_kg, stump_bark_kg, stump_total_kg,
                                      merch_wood_c, merch_bark_c, merch_total_c, merch_top_c, stump_wood_c, stump_bark_c, stump_total_c))
  expect_true(all(is.na(NA_check_small)))

  # trees with NA status have NA estimates
  expect_warning(NA_check_status <- BiomassNSVB(data = nsvb_b28, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe)
  expect_true(all(is.na(subset(NA_check_status, exp_factor > 0 & is.na(status),
                        select = -c(division, province, site, plot, exp_factor, status, decay_class, species, species_fia, dbh_cm, ht1_m, ht2_m, crown_ratio, top, cull, calc_bio)))))

  # trees with NA species have NA estimates
  expect_warning(NA_check_sp <- BiomassNSVB(data = nsvb_b38, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe)
  expect_true(all(is.na(subset(NA_check_sp, exp_factor > 0 & is.na(species),
                        select = -c(division, province, site, plot, exp_factor, status, decay_class, species, species_fia, dbh_cm, ht1_m, ht2_m, crown_ratio, top, cull, calc_bio)))))

  # trees with NA dbh have NA estimates
  expect_warning(NA_check_dbh1 <- BiomassNSVB(data = nsvb_b41, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe)
  expect_true(all(is.na(subset(NA_check_dbh1, exp_factor > 0 & is.na(dbh_cm),
                        select = -c(division, province, site, plot, exp_factor, status, decay_class, species, species_fia, dbh_cm, ht1_m, ht2_m, crown_ratio, top, cull, calc_bio)))))

  # trees with dbh below cutoff (in metric) have NA estimates
  expect_warning(NA_check_dbh2 <- BiomassNSVB(data = nsvb_b42, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe)
  expect_true(all(is.na(subset(NA_check_dbh2, dbh_cm < 2.5,
                        select = -c(division, province, site, plot, exp_factor, status, decay_class, species, species_fia, dbh_cm, ht1_m, ht2_m, crown_ratio, top, cull, calc_bio)))))

  # trees with dbh below cutoff (in imperial) have NA estimates
  expect_warning(NA_check_dbh3 <- BiomassNSVB(data = nsvb_b43, sp_codes = "fia", input_units = "imperial", output_units = "imperial", results = "by_tree")$dataframe)
  expect_true(all(is.na(subset(NA_check_dbh3, dbh_in < 1,
                        select = -c(division, province, site, plot, exp_factor, status, decay_class, species, dbh_in, ht1_ft, ht2_ft, crown_ratio, top, cull, calc_bio)))))

  # trees with NA ht1 have NA estimates
  expect_warning(NA_check_ht1.1 <- BiomassNSVB(data = nsvb_b44, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe)
  expect_true(all(is.na(subset(NA_check_ht1.1, exp_factor > 0 & is.na(ht1_m),
                        select = -c(division, province, site, plot, exp_factor, status, decay_class, species, species_fia, dbh_cm, ht1_m, ht2_m, crown_ratio, top, cull, calc_bio)))))

  # trees with ht1 below cutoff (in metric) have NA estimates
  expect_warning(NA_check_ht1.2 <- BiomassNSVB(data = nsvb_b46, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe)
  expect_true(all(is.na(subset(NA_check_ht1.2, ht1_m < 1.37,
                        select = -c(division, province, site, plot, exp_factor, status, decay_class, species, species_fia, dbh_cm, ht1_m, ht2_m, crown_ratio, top, cull, calc_bio)))))

  # trees with ht1 below cutoff (in imperial) have NA estimates
  expect_warning(NA_check_ht1.3 <- BiomassNSVB(data = nsvb_b48, sp_codes = "fia", input_units = "imperial", output_units = "imperial", results = "by_tree")$dataframe)
  expect_true(all(is.na(subset(NA_check_ht1.3, ht1_ft < 4.5,
                        select = -c(division, province, site, plot, exp_factor, status, decay_class, species, dbh_in, ht1_ft, ht2_ft, crown_ratio, top, cull, calc_bio)))))

  # trees with NA ht2 have NA estimates
  expect_warning(NA_check_ht2.1 <- BiomassNSVB(data = nsvb_b45, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe)
  expect_true(all(is.na(subset(NA_check_ht2.1, exp_factor > 0 & top == "N" & is.na(ht2_m),
                        select = -c(division, province, site, plot, exp_factor, status, decay_class, species, species_fia, dbh_cm, ht1_m, ht2_m, crown_ratio, top, cull, calc_bio)))))

  # trees with ht2 below cutoff (in metric) have NA estimates
  expect_warning(NA_check_ht2.2 <- BiomassNSVB(data = nsvb_b47, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe)
  expect_true(all(is.na(subset(NA_check_ht2.2, ht2_m < 1.37,
                        select = -c(division, province, site, plot, exp_factor, status, decay_class, species, species_fia, dbh_cm, ht1_m, ht2_m, crown_ratio, top, cull, calc_bio)))))

  # trees with ht2 below cutoff (in imperial) have NA estimates
  expect_warning(NA_check_ht2.3 <- BiomassNSVB(data = nsvb_b49, sp_codes = "fia", input_units = "imperial", output_units = "imperial", results = "by_tree")$dataframe)
  expect_true(all(is.na(subset(NA_check_ht2.3, ht2_ft < 4.5,
                        select = -c(division, province, site, plot, exp_factor, status, decay_class, species, dbh_in, ht1_ft, ht2_ft, crown_ratio, top, cull, calc_bio)))))

})


test_that("Units are being converted properly", {

  # dbh conversions
  expect_equal(BiomassNSVB(data = nsvb_m_units, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe$dbh_cm, nsvb_m_units$dbh)
  expect_equal(BiomassNSVB(data = nsvb_m_units, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_tree")$dataframe$dbh_in, nsvb_i_units$dbh)
  expect_equal(BiomassNSVB(data = nsvb_i_units, sp_codes = "4letter", input_units = "imperial", output_units = "imperial", results = "by_tree")$dataframe$dbh_in, nsvb_i_units$dbh)
  expect_equal(BiomassNSVB(data = nsvb_i_units, sp_codes = "4letter", input_units = "imperial", output_units = "metric", results = "by_tree")$dataframe$dbh_cm, nsvb_m_units$dbh)

  # ht1 conversions
  expect_equal(BiomassNSVB(data = nsvb_m_units, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe$ht1_m, nsvb_m_units$ht1)
  expect_equal(BiomassNSVB(data = nsvb_m_units, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_tree")$dataframe$ht1_ft, nsvb_i_units$ht1)
  expect_equal(BiomassNSVB(data = nsvb_i_units, sp_codes = "4letter", input_units = "imperial", output_units = "imperial", results = "by_tree")$dataframe$ht1_ft, nsvb_i_units$ht1)
  expect_equal(BiomassNSVB(data = nsvb_i_units, sp_codes = "4letter", input_units = "imperial", output_units = "metric", results = "by_tree")$dataframe$ht1_m, nsvb_m_units$ht1)

  # ht2 conversions
  expect_equal(BiomassNSVB(data = nsvb_m_units, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe$ht2_m, nsvb_m_units$ht2)
  expect_equal(BiomassNSVB(data = nsvb_m_units, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_tree")$dataframe$ht2_ft, nsvb_i_units$ht2)
  expect_equal(BiomassNSVB(data = nsvb_i_units, sp_codes = "4letter", input_units = "imperial", output_units = "imperial", results = "by_tree")$dataframe$ht2_ft, nsvb_i_units$ht2)
  expect_equal(BiomassNSVB(data = nsvb_i_units, sp_codes = "4letter", input_units = "imperial", output_units = "metric", results = "by_tree")$dataframe$ht2_m, nsvb_m_units$ht2)

  # exp_factor conversions
  expect_equal(BiomassNSVB(data = nsvb_m_units, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe$exp_factor, nsvb_m_units$exp_factor)
  expect_equal(round(BiomassNSVB(data = nsvb_m_units, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_tree")$dataframe$exp_factor,5), nsvb_i_units$exp_factor)
  expect_equal(BiomassNSVB(data = nsvb_i_units, sp_codes = "4letter", input_units = "imperial", output_units = "imperial", results = "by_tree")$dataframe$exp_factor, nsvb_i_units$exp_factor)
  expect_equal(round(BiomassNSVB(data = nsvb_i_units, sp_codes = "4letter", input_units = "imperial", output_units = "metric", results = "by_tree")$dataframe$exp_factor,0), nsvb_m_units$exp_factor)

  # biomass estimates should be the same regardless of input units
  expect_equal(BiomassNSVB(data = nsvb_m_units, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_tree")$dataframe$total_wood_kg,
               BiomassNSVB(data = nsvb_i_units, sp_codes = "4letter", input_units = "imperial", output_units = "metric", results = "by_tree")$dataframe$total_wood_kg)

  expect_equal(BiomassNSVB(data = nsvb_m_units, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_tree")$dataframe$total_wood_tons,
               BiomassNSVB(data = nsvb_i_units, sp_codes = "4letter", input_units = "imperial", output_units = "imperial", results = "by_tree")$dataframe$total_wood_tons)

})


test_that("by_sp_st dataframes have expected column names", {

  expect_named(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_sp_st")$dataframe,
               c("site", "plot", "species", "total_wood_L_t_ac", "total_wood_D_t_ac", "total_bark_L_t_ac", "total_bark_D_t_ac", "total_branch_L_t_ac", "total_branch_D_t_ac",
                 "total_ag_L_t_ac", "total_ag_D_t_ac", "merch_total_L_t_ac", "merch_total_D_t_ac", "merch_top_L_t_ac", "merch_top_D_t_ac", "stump_total_L_t_ac", "stump_total_D_t_ac",
                 "foliage_L_t_ac", "total_wood_L_c", "total_wood_D_c", "total_bark_L_c", "total_bark_D_c", "total_branch_L_c", "total_branch_D_c", "total_ag_L_c", "total_ag_D_c",
                 "merch_total_L_c", "merch_total_D_c", "merch_top_L_c", "merch_top_D_c", "stump_total_L_c", "stump_total_D_c", "foliage_L_c"))

  expect_named(BiomassNSVB(data = nsvb_gif, sp_codes = "fia", input_units = "imperial", output_units = "metric", results = "by_sp_st")$dataframe,
               c("site", "plot", "species", "total_wood_L_Mg_ha", "total_wood_D_Mg_ha", "total_bark_L_Mg_ha", "total_bark_D_Mg_ha", "total_branch_L_Mg_ha", "total_branch_D_Mg_ha",
                 "total_ag_L_Mg_ha", "total_ag_D_Mg_ha", "merch_total_L_Mg_ha", "merch_total_D_Mg_ha", "merch_top_L_Mg_ha", "merch_top_D_Mg_ha", "stump_total_L_Mg_ha", "stump_total_D_Mg_ha",
                 "foliage_L_Mg_ha", "total_wood_L_c", "total_wood_D_c", "total_bark_L_c", "total_bark_D_c", "total_branch_L_c", "total_branch_D_c", "total_ag_L_c", "total_ag_D_c",
                 "merch_total_L_c", "merch_total_D_c", "merch_top_L_c", "merch_top_D_c", "stump_total_L_c", "stump_total_D_c", "foliage_L_c"))

})


test_that("by_sp_st dataframes have expected column classes", {

  # Outputs are imperial -------------------------------------------------------
  by_sp_st_check1 <- BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_sp_st")$dataframe

  expect_equal(class(by_sp_st_check1$site), "character")
  expect_equal(class(by_sp_st_check1$plot), "character")
  expect_equal(class(by_sp_st_check1$species), "character")
  expect_equal(class(by_sp_st_check1$total_wood_L_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$total_bark_L_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$total_branch_L_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$total_ag_L_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$merch_total_L_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$merch_top_L_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$stump_total_L_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$foliage_L_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$total_wood_L_c), "numeric")
  expect_equal(class(by_sp_st_check1$total_bark_L_c), "numeric")
  expect_equal(class(by_sp_st_check1$total_branch_L_c), "numeric")
  expect_equal(class(by_sp_st_check1$total_ag_L_c), "numeric")
  expect_equal(class(by_sp_st_check1$merch_total_L_c), "numeric")
  expect_equal(class(by_sp_st_check1$merch_top_L_c), "numeric")
  expect_equal(class(by_sp_st_check1$stump_total_L_c), "numeric")
  expect_equal(class(by_sp_st_check1$foliage_L_c), "numeric")
  expect_equal(class(by_sp_st_check1$total_wood_D_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$total_bark_D_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$total_branch_D_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$total_ag_D_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$merch_total_D_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$merch_top_D_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$stump_total_D_t_ac), "numeric")
  expect_equal(class(by_sp_st_check1$total_wood_D_c), "numeric")
  expect_equal(class(by_sp_st_check1$total_bark_D_c), "numeric")
  expect_equal(class(by_sp_st_check1$total_branch_D_c), "numeric")
  expect_equal(class(by_sp_st_check1$total_ag_D_c), "numeric")
  expect_equal(class(by_sp_st_check1$merch_total_D_c), "numeric")
  expect_equal(class(by_sp_st_check1$merch_top_D_c), "numeric")
  expect_equal(class(by_sp_st_check1$stump_total_D_c), "numeric")

  # Outputs are metric ---------------------------------------------------------
  by_sp_st_check2 <- BiomassNSVB(data = nsvb_gif, sp_codes = "fia", input_units = "imperial", output_units = "metric", results = "by_sp_st")$dataframe

  expect_equal(class(by_sp_st_check2$site), "character")
  expect_equal(class(by_sp_st_check2$plot), "character")
  expect_equal(class(by_sp_st_check2$species), "character")
  expect_equal(class(by_sp_st_check2$total_wood_L_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$total_bark_L_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$total_branch_L_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$total_ag_L_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$merch_total_L_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$merch_top_L_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$stump_total_L_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$foliage_L_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$total_wood_L_c), "numeric")
  expect_equal(class(by_sp_st_check2$total_bark_L_c), "numeric")
  expect_equal(class(by_sp_st_check2$total_branch_L_c), "numeric")
  expect_equal(class(by_sp_st_check2$total_ag_L_c), "numeric")
  expect_equal(class(by_sp_st_check2$merch_total_L_c), "numeric")
  expect_equal(class(by_sp_st_check2$merch_top_L_c), "numeric")
  expect_equal(class(by_sp_st_check2$stump_total_L_c), "numeric")
  expect_equal(class(by_sp_st_check2$foliage_L_c), "numeric")
  expect_equal(class(by_sp_st_check2$total_wood_D_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$total_bark_D_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$total_branch_D_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$total_ag_D_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$merch_total_D_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$merch_top_D_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$stump_total_D_Mg_ha), "numeric")
  expect_equal(class(by_sp_st_check2$total_wood_D_c), "numeric")
  expect_equal(class(by_sp_st_check2$total_bark_D_c), "numeric")
  expect_equal(class(by_sp_st_check2$total_branch_D_c), "numeric")
  expect_equal(class(by_sp_st_check2$total_ag_D_c), "numeric")
  expect_equal(class(by_sp_st_check2$merch_total_D_c), "numeric")
  expect_equal(class(by_sp_st_check2$merch_top_D_c), "numeric")
  expect_equal(class(by_sp_st_check2$stump_total_D_c), "numeric")

})


test_that("by_species dataframes have expected column names", {

  expect_named(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_species")$dataframe,
               c("site", "plot", "species",
                 "total_wood_t_ac", "total_bark_t_ac", "total_branch_t_ac", "total_ag_t_ac", "merch_total_t_ac", "merch_top_t_ac", "stump_total_t_ac", "foliage_t_ac",
                 "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_total_c", "merch_top_c", "stump_total_c", "foliage_c"))

  expect_named(BiomassNSVB(data = nsvb_gif, sp_codes = "fia", input_units = "imperial", output_units = "metric", results = "by_species")$dataframe,
               c("site", "plot", "species",
                 "total_wood_Mg_ha", "total_bark_Mg_ha", "total_branch_Mg_ha", "total_ag_Mg_ha", "merch_total_Mg_ha", "merch_top_Mg_ha", "stump_total_Mg_ha", "foliage_Mg_ha",
                 "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_total_c", "merch_top_c", "stump_total_c", "foliage_c"))

})


test_that("by_species dataframes have expected column classes", {

  # Outputs are imperial -------------------------------------------------------
  by_sp_check1 <- BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_species")$dataframe

  expect_equal(class(by_sp_check1$site), "character")
  expect_equal(class(by_sp_check1$plot), "character")
  expect_equal(class(by_sp_check1$species), "character")
  expect_equal(class(by_sp_check1$total_wood_t_ac), "numeric")
  expect_equal(class(by_sp_check1$total_bark_t_ac), "numeric")
  expect_equal(class(by_sp_check1$total_branch_t_ac), "numeric")
  expect_equal(class(by_sp_check1$total_ag_t_ac), "numeric")
  expect_equal(class(by_sp_check1$merch_total_t_ac), "numeric")
  expect_equal(class(by_sp_check1$merch_top_t_ac), "numeric")
  expect_equal(class(by_sp_check1$stump_total_t_ac), "numeric")
  expect_equal(class(by_sp_check1$foliage_t_ac), "numeric")
  expect_equal(class(by_sp_check1$total_wood_c), "numeric")
  expect_equal(class(by_sp_check1$total_bark_c), "numeric")
  expect_equal(class(by_sp_check1$total_branch_c), "numeric")
  expect_equal(class(by_sp_check1$total_ag_c), "numeric")
  expect_equal(class(by_sp_check1$merch_total_c), "numeric")
  expect_equal(class(by_sp_check1$merch_top_c), "numeric")
  expect_equal(class(by_sp_check1$stump_total_c), "numeric")
  expect_equal(class(by_sp_check1$foliage_c), "numeric")

  # Outputs are metric ---------------------------------------------------------
  by_sp_check2 <- BiomassNSVB(data = nsvb_gif, sp_codes = "fia", input_units = "imperial", output_units = "metric", results = "by_species")$dataframe

  expect_equal(class(by_sp_check2$site), "character")
  expect_equal(class(by_sp_check2$plot), "character")
  expect_equal(class(by_sp_check2$species), "character")
  expect_equal(class(by_sp_check2$total_wood_Mg_ha), "numeric")
  expect_equal(class(by_sp_check2$total_bark_Mg_ha), "numeric")
  expect_equal(class(by_sp_check2$total_branch_Mg_ha), "numeric")
  expect_equal(class(by_sp_check2$total_ag_Mg_ha), "numeric")
  expect_equal(class(by_sp_check2$merch_total_Mg_ha), "numeric")
  expect_equal(class(by_sp_check2$merch_top_Mg_ha), "numeric")
  expect_equal(class(by_sp_check2$stump_total_Mg_ha), "numeric")
  expect_equal(class(by_sp_check2$foliage_Mg_ha), "numeric")
  expect_equal(class(by_sp_check2$total_wood_c), "numeric")
  expect_equal(class(by_sp_check2$total_bark_c), "numeric")
  expect_equal(class(by_sp_check2$total_branch_c), "numeric")
  expect_equal(class(by_sp_check2$total_ag_c), "numeric")
  expect_equal(class(by_sp_check2$merch_total_c), "numeric")
  expect_equal(class(by_sp_check2$merch_top_c), "numeric")
  expect_equal(class(by_sp_check2$stump_total_c), "numeric")
  expect_equal(class(by_sp_check2$foliage_c), "numeric")

})


test_that("by_status dataframes have expected column names", {

  expect_named(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_status")$dataframe,
               c("site", "plot", "total_wood_L_t_ac", "total_wood_D_t_ac", "total_bark_L_t_ac", "total_bark_D_t_ac", "total_branch_L_t_ac", "total_branch_D_t_ac",
                 "total_ag_L_t_ac", "total_ag_D_t_ac", "merch_total_L_t_ac", "merch_total_D_t_ac", "merch_top_L_t_ac", "merch_top_D_t_ac", "stump_total_L_t_ac",
                 "stump_total_D_t_ac", "foliage_L_t_ac", "total_wood_L_c", "total_wood_D_c", "total_bark_L_c", "total_bark_D_c", "total_branch_L_c", "total_branch_D_c",
                 "total_ag_L_c", "total_ag_D_c", "merch_total_L_c", "merch_total_D_c", "merch_top_L_c", "merch_top_D_c", "stump_total_L_c", "stump_total_D_c", "foliage_L_c"))

  expect_named(BiomassNSVB(data = nsvb_gif, sp_codes = "fia", input_units = "imperial", output_units = "metric", results = "by_status")$dataframe,
               c("site", "plot", "total_wood_L_Mg_ha", "total_wood_D_Mg_ha", "total_bark_L_Mg_ha", "total_bark_D_Mg_ha", "total_branch_L_Mg_ha", "total_branch_D_Mg_ha",
                 "total_ag_L_Mg_ha", "total_ag_D_Mg_ha", "merch_total_L_Mg_ha", "merch_total_D_Mg_ha", "merch_top_L_Mg_ha", "merch_top_D_Mg_ha", "stump_total_L_Mg_ha",
                 "stump_total_D_Mg_ha", "foliage_L_Mg_ha", "total_wood_L_c", "total_wood_D_c", "total_bark_L_c", "total_bark_D_c", "total_branch_L_c", "total_branch_D_c",
                 "total_ag_L_c", "total_ag_D_c", "merch_total_L_c", "merch_total_D_c", "merch_top_L_c", "merch_top_D_c", "stump_total_L_c", "stump_total_D_c", "foliage_L_c"))

})


test_that("by_status dataframes have expected column classes", {

  # Outputs are imperial -------------------------------------------------------
  by_st_check1 <- BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_status")$dataframe

  expect_equal(class(by_st_check1$site), "character")
  expect_equal(class(by_st_check1$plot), "character")
  expect_equal(class(by_st_check1$total_wood_L_t_ac), "numeric")
  expect_equal(class(by_st_check1$total_bark_L_t_ac), "numeric")
  expect_equal(class(by_st_check1$total_branch_L_t_ac), "numeric")
  expect_equal(class(by_st_check1$total_ag_L_t_ac), "numeric")
  expect_equal(class(by_st_check1$merch_total_L_t_ac), "numeric")
  expect_equal(class(by_st_check1$merch_top_L_t_ac), "numeric")
  expect_equal(class(by_st_check1$stump_total_L_t_ac), "numeric")
  expect_equal(class(by_st_check1$foliage_L_t_ac), "numeric")
  expect_equal(class(by_st_check1$total_wood_L_c), "numeric")
  expect_equal(class(by_st_check1$total_bark_L_c), "numeric")
  expect_equal(class(by_st_check1$total_branch_L_c), "numeric")
  expect_equal(class(by_st_check1$total_ag_L_c), "numeric")
  expect_equal(class(by_st_check1$merch_total_L_c), "numeric")
  expect_equal(class(by_st_check1$merch_top_L_c), "numeric")
  expect_equal(class(by_st_check1$stump_total_L_c), "numeric")
  expect_equal(class(by_st_check1$foliage_L_c), "numeric")
  expect_equal(class(by_st_check1$total_wood_D_t_ac), "numeric")
  expect_equal(class(by_st_check1$total_bark_D_t_ac), "numeric")
  expect_equal(class(by_st_check1$total_branch_D_t_ac), "numeric")
  expect_equal(class(by_st_check1$total_ag_D_t_ac), "numeric")
  expect_equal(class(by_st_check1$merch_total_D_t_ac), "numeric")
  expect_equal(class(by_st_check1$merch_top_D_t_ac), "numeric")
  expect_equal(class(by_st_check1$stump_total_D_t_ac), "numeric")
  expect_equal(class(by_st_check1$total_wood_D_c), "numeric")
  expect_equal(class(by_st_check1$total_bark_D_c), "numeric")
  expect_equal(class(by_st_check1$total_branch_D_c), "numeric")
  expect_equal(class(by_st_check1$total_ag_D_c), "numeric")
  expect_equal(class(by_st_check1$merch_total_D_c), "numeric")
  expect_equal(class(by_st_check1$merch_top_D_c), "numeric")
  expect_equal(class(by_st_check1$stump_total_D_c), "numeric")

  # Outputs are metric ---------------------------------------------------------
  by_st_check2 <- BiomassNSVB(data = nsvb_gif, sp_codes = "fia", input_units = "imperial", output_units = "metric", results = "by_status")$dataframe

  expect_equal(class(by_st_check2$site), "character")
  expect_equal(class(by_st_check2$plot), "character")
  expect_equal(class(by_st_check2$total_wood_L_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$total_bark_L_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$total_branch_L_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$total_ag_L_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$merch_total_L_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$merch_top_L_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$stump_total_L_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$foliage_L_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$total_wood_L_c), "numeric")
  expect_equal(class(by_st_check2$total_bark_L_c), "numeric")
  expect_equal(class(by_st_check2$total_branch_L_c), "numeric")
  expect_equal(class(by_st_check2$total_ag_L_c), "numeric")
  expect_equal(class(by_st_check2$merch_total_L_c), "numeric")
  expect_equal(class(by_st_check2$merch_top_L_c), "numeric")
  expect_equal(class(by_st_check2$stump_total_L_c), "numeric")
  expect_equal(class(by_st_check2$foliage_L_c), "numeric")
  expect_equal(class(by_st_check2$total_wood_D_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$total_bark_D_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$total_branch_D_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$total_ag_D_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$merch_total_D_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$merch_top_D_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$stump_total_D_Mg_ha), "numeric")
  expect_equal(class(by_st_check2$total_wood_D_c), "numeric")
  expect_equal(class(by_st_check2$total_bark_D_c), "numeric")
  expect_equal(class(by_st_check2$total_branch_D_c), "numeric")
  expect_equal(class(by_st_check2$total_ag_D_c), "numeric")
  expect_equal(class(by_st_check2$merch_total_D_c), "numeric")
  expect_equal(class(by_st_check2$merch_top_D_c), "numeric")
  expect_equal(class(by_st_check2$stump_total_D_c), "numeric")

})


test_that("by_plot dataframes have expected column names", {

  expect_named(BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_plot")$dataframe,
               c("site", "plot", "total_wood_t_ac", "total_bark_t_ac", "total_branch_t_ac", "total_ag_t_ac", "merch_total_t_ac", "merch_top_t_ac", "stump_total_t_ac",
                 "foliage_t_ac", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_total_c", "merch_top_c", "stump_total_c", "foliage_c"))

  expect_named(BiomassNSVB(data = nsvb_gif, sp_codes = "fia", input_units = "imperial", output_units = "metric", results = "by_plot")$dataframe,
               c("site", "plot", "total_wood_Mg_ha", "total_bark_Mg_ha","total_branch_Mg_ha", "total_ag_Mg_ha", "merch_total_Mg_ha", "merch_top_Mg_ha",  "stump_total_Mg_ha",
                 "foliage_Mg_ha", "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_total_c", "merch_top_c", "stump_total_c", "foliage_c"))

})


test_that("by_plot dataframes have expected column classes", {

  # Outputs are imperial -------------------------------------------------------
  by_plot_check1 <- BiomassNSVB(data = nsvb_gm4, sp_codes = "4letter", input_units = "metric", output_units = "imperial", results = "by_plot")$dataframe

  expect_equal(class(by_plot_check1$site), "character")
  expect_equal(class(by_plot_check1$plot), "character")
  expect_equal(class(by_plot_check1$total_wood_t_ac), "numeric")
  expect_equal(class(by_plot_check1$total_bark_t_ac), "numeric")
  expect_equal(class(by_plot_check1$total_branch_t_ac), "numeric")
  expect_equal(class(by_plot_check1$total_ag_t_ac), "numeric")
  expect_equal(class(by_plot_check1$merch_total_t_ac), "numeric")
  expect_equal(class(by_plot_check1$merch_top_t_ac), "numeric")
  expect_equal(class(by_plot_check1$stump_total_t_ac), "numeric")
  expect_equal(class(by_plot_check1$foliage_t_ac), "numeric")
  expect_equal(class(by_plot_check1$total_wood_c), "numeric")
  expect_equal(class(by_plot_check1$total_bark_c), "numeric")
  expect_equal(class(by_plot_check1$total_branch_c), "numeric")
  expect_equal(class(by_plot_check1$total_ag_c), "numeric")
  expect_equal(class(by_plot_check1$merch_total_c), "numeric")
  expect_equal(class(by_plot_check1$merch_top_c), "numeric")
  expect_equal(class(by_plot_check1$stump_total_c), "numeric")
  expect_equal(class(by_plot_check1$foliage_c), "numeric")

  # Outputs are metric ---------------------------------------------------------
  by_plot_check2 <- BiomassNSVB(data = nsvb_gif, sp_codes = "fia", input_units = "imperial", output_units = "metric", results = "by_plot")$dataframe

  expect_equal(class(by_plot_check2$site), "character")
  expect_equal(class(by_plot_check2$plot), "character")
  expect_equal(class(by_plot_check2$total_wood_Mg_ha), "numeric")
  expect_equal(class(by_plot_check2$total_bark_Mg_ha), "numeric")
  expect_equal(class(by_plot_check2$total_branch_Mg_ha), "numeric")
  expect_equal(class(by_plot_check2$total_ag_Mg_ha), "numeric")
  expect_equal(class(by_plot_check2$merch_total_Mg_ha), "numeric")
  expect_equal(class(by_plot_check2$merch_top_Mg_ha), "numeric")
  expect_equal(class(by_plot_check2$stump_total_Mg_ha), "numeric")
  expect_equal(class(by_plot_check2$foliage_Mg_ha), "numeric")
  expect_equal(class(by_plot_check2$total_wood_c), "numeric")
  expect_equal(class(by_plot_check2$total_bark_c), "numeric")
  expect_equal(class(by_plot_check2$total_branch_c), "numeric")
  expect_equal(class(by_plot_check2$total_ag_c), "numeric")
  expect_equal(class(by_plot_check2$merch_total_c), "numeric")
  expect_equal(class(by_plot_check2$merch_top_c), "numeric")
  expect_equal(class(by_plot_check2$stump_total_c), "numeric")
  expect_equal(class(by_plot_check2$foliage_c), "numeric")

})


test_that("Package and GTR example calculations match", {

  nsvb_package <- BiomassNSVB(data = gtr_examples, sp_codes = "fia", input_units = "imperial", output_units = "imperial", results = "by_tree")$dataframe
  nsvb_package_1 <- subset(nsvb_package, example == "1")
  nsvb_package_2 <- subset(nsvb_package, example == "2")
  nsvb_package_3 <- subset(nsvb_package, example == "3")
  nsvb_package_4 <- subset(nsvb_package, example == "4")
  nsvb_package_5 <- subset(nsvb_package, example == "5")

  nsvb_hand_1 <- subset(nsvb_hand, example == "1")
  nsvb_hand_2 <- subset(nsvb_hand, example == "2")
  nsvb_hand_3 <- subset(nsvb_hand, example == "3")
  nsvb_hand_4 <- subset(nsvb_hand, example == "4")
  nsvb_hand_5 <- subset(nsvb_hand, example == "5")

  # Example 1
  expect_equal(round(nsvb_package_1$total_wood_tons,5), round(nsvb_hand_1$total_wood_tons,5))
  expect_equal(round(nsvb_package_1$total_bark_tons,5), round(nsvb_hand_1$total_bark_tons,5))
  expect_equal(round(nsvb_package_1$total_branch_tons,5), round(nsvb_hand_1$total_branch_tons,5))
  expect_equal(round(nsvb_package_1$total_ag_tons,5), round(nsvb_hand_1$total_ag_tons,5))
  expect_equal(round(nsvb_package_1$merch_wood_tons,5), round(nsvb_hand_1$merch_wood_tons,5))
  expect_equal(round(nsvb_package_1$merch_bark_tons,5), round(nsvb_hand_1$merch_bark_tons,5))
  expect_equal(round(nsvb_package_1$merch_total_tons,5), round(nsvb_hand_1$merch_total_tons,5))
  expect_equal(round(nsvb_package_1$merch_top_tons,5), round(nsvb_hand_1$merch_top_tons,5))
  expect_equal(round(nsvb_package_1$stump_wood_tons,5), round(nsvb_hand_1$stump_wood_tons,5))
  expect_equal(round(nsvb_package_1$stump_bark_tons,5), round(nsvb_hand_1$stump_bark_tons,5))
  expect_equal(round(nsvb_package_1$stump_total_tons,5), round(nsvb_hand_1$stump_total_tons,5))
  expect_equal(round(nsvb_package_1$foliage_tons,5), round(nsvb_hand_1$foliage_tons,5))
  expect_equal(round(nsvb_package_1$total_ag_c,5), round(nsvb_hand_1$total_ag_c_tons,5))

  # Example 2
  expect_equal(round(nsvb_package_2$total_wood_tons,5), round(nsvb_hand_2$total_wood_tons,5))
  expect_equal(round(nsvb_package_2$total_bark_tons,5), round(nsvb_hand_2$total_bark_tons,5))
  expect_equal(round(nsvb_package_2$total_branch_tons,5), round(nsvb_hand_2$total_branch_tons,5))
  expect_equal(round(nsvb_package_2$total_ag_tons,5), round(nsvb_hand_2$total_ag_tons,5))
  expect_equal(round(nsvb_package_2$merch_wood_tons,5), round(nsvb_hand_2$merch_wood_tons,5))
  expect_equal(round(nsvb_package_2$merch_bark_tons,5), round(nsvb_hand_2$merch_bark_tons,5))
  expect_equal(round(nsvb_package_2$merch_total_tons,5), round(nsvb_hand_2$merch_total_tons,5))
  expect_equal(round(nsvb_package_2$merch_top_tons,5), round(nsvb_hand_2$merch_top_tons,5))
  expect_equal(round(nsvb_package_2$stump_wood_tons,5), round(nsvb_hand_2$stump_wood_tons,5))
  expect_equal(round(nsvb_package_2$stump_bark_tons,5), round(nsvb_hand_2$stump_bark_tons,5))
  expect_equal(round(nsvb_package_2$stump_total_tons,5), round(nsvb_hand_2$stump_total_tons,5))
  expect_equal(round(nsvb_package_2$foliage_tons,5), round(nsvb_hand_2$foliage_tons,5))
  expect_equal(round(nsvb_package_2$total_ag_c,5), round(nsvb_hand_2$total_ag_c_tons,5))

  # Example 3
  #expect_equal(round(nsvb_package_3$total_wood_tons,5), round(nsvb_hand_3$total_wood_tons,5))
  #expect_equal(round(nsvb_package_3$total_bark_tons,5), round(nsvb_hand_3$total_bark_tons,5))
  #expect_equal(round(nsvb_package_3$total_branch_tons,5), round(nsvb_hand_3$total_branch_tons,5))
  #expect_equal(round(nsvb_package_3$total_ag_tons,5), round(nsvb_hand_3$total_ag_tons,5))
  #expect_equal(round(nsvb_package_3$merch_wood_tons,5), round(nsvb_hand_3$merch_wood_tons,5))
  #expect_equal(round(nsvb_package_3$merch_bark_tons,5), round(nsvb_hand_3$merch_bark_tons,5))
  #expect_equal(round(nsvb_package_3$merch_total_tons,5), round(nsvb_hand_3$merch_total_tons,5))
  #expect_equal(round(nsvb_package_3$merch_top_tons,5), round(nsvb_hand_3$merch_top_tons,5))
  #expect_equal(round(nsvb_package_3$stump_wood_tons,5), round(nsvb_hand_3$stump_wood_tons,5))
  #expect_equal(round(nsvb_package_3$stump_bark_tons,5), round(nsvb_hand_3$stump_bark_tons,5))
  #expect_equal(round(nsvb_package_3$stump_total_tons,5), round(nsvb_hand_3$stump_total_tons,5))
  #expect_equal(round(nsvb_package_3$foliage_tons,5), round(nsvb_hand_3$foliage_tons,5))
  #expect_equal(round(nsvb_package_3$total_ag_c,5), round(nsvb_hand_3$total_ag_c_tons,5))

  # Example 4
  expect_equal(round(nsvb_package_4$total_wood_tons,5), round(nsvb_hand_4$total_wood_tons,5))
  expect_equal(round(nsvb_package_4$total_bark_tons,5), round(nsvb_hand_4$total_bark_tons,5))
  expect_equal(round(nsvb_package_4$total_branch_tons,5), round(nsvb_hand_4$total_branch_tons,5))
  expect_equal(round(nsvb_package_4$total_ag_tons,5), round(nsvb_hand_4$total_ag_tons,5))
  expect_equal(round(nsvb_package_4$merch_wood_tons,5), round(nsvb_hand_4$merch_wood_tons,5))
  expect_equal(round(nsvb_package_4$merch_bark_tons,5), round(nsvb_hand_4$merch_bark_tons,5))
  expect_equal(round(nsvb_package_4$merch_total_tons,5), round(nsvb_hand_4$merch_total_tons,5))
  expect_equal(round(nsvb_package_4$merch_top_tons,5), round(nsvb_hand_4$merch_top_tons,5))
  expect_equal(round(nsvb_package_4$stump_wood_tons,5), round(nsvb_hand_4$stump_wood_tons,5))
  expect_equal(round(nsvb_package_4$stump_bark_tons,5), round(nsvb_hand_4$stump_bark_tons,5))
  expect_equal(round(nsvb_package_4$stump_total_tons,5), round(nsvb_hand_4$stump_total_tons,5))
  expect_equal(round(nsvb_package_4$foliage_tons,5), round(nsvb_hand_4$foliage_tons,5))
  expect_equal(round(nsvb_package_4$total_ag_c,5), round(nsvb_hand_4$total_ag_c_tons,5))

  # Example 5
  expect_equal(round(nsvb_package_5$total_wood_tons,5), round(nsvb_hand_5$total_wood_tons,5))
  expect_equal(round(nsvb_package_5$total_bark_tons,5), round(nsvb_hand_5$total_bark_tons,5))
  expect_equal(round(nsvb_package_5$total_branch_tons,5), round(nsvb_hand_5$total_branch_tons,5))
  expect_equal(round(nsvb_package_5$total_ag_tons,5), round(nsvb_hand_5$total_ag_tons,5))
  expect_equal(round(nsvb_package_5$merch_wood_tons,5), round(nsvb_hand_5$merch_wood_tons,5))
  expect_equal(round(nsvb_package_5$merch_bark_tons,5), round(nsvb_hand_5$merch_bark_tons,5))
  expect_equal(round(nsvb_package_5$merch_total_tons,5), round(nsvb_hand_5$merch_total_tons,5))
  expect_equal(round(nsvb_package_5$merch_top_tons,5), round(nsvb_hand_5$merch_top_tons,5))
  expect_equal(round(nsvb_package_5$stump_wood_tons,5), round(nsvb_hand_5$stump_wood_tons,5))
  expect_equal(round(nsvb_package_5$stump_bark_tons,5), round(nsvb_hand_5$stump_bark_tons,5))
  expect_equal(round(nsvb_package_5$stump_total_tons,5), round(nsvb_hand_5$stump_total_tons,5))
  expect_equal(round(nsvb_package_5$foliage_tons,5), round(nsvb_hand_5$foliage_tons,5))
  expect_equal(round(nsvb_package_5$total_ag_c,5), round(nsvb_hand_5$total_ag_c_tons,5))

})


test_that("Package and hand species/status summaries match", {

  expect_warning(expect_warning(by_package_sp_st <- BiomassNSVB(data = nsvb_sum_check, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_sp_st")$dataframe))
  by_package_sp_st <- by_package_sp_st[order(by_package_sp_st$site, by_package_sp_st$plot, by_package_sp_st$species),]
  by_hand_sp_st <- by_hand_sp_st[order(by_hand_sp_st$site, by_hand_sp_st$plot, by_hand_sp_st$species),]

  expect_equal(by_package_sp_st$total_wood_L_Mg_ha, round(by_hand_sp_st$total_wood_L,5))
  expect_equal(by_package_sp_st$total_wood_D_Mg_ha, round(by_hand_sp_st$total_wood_D,5))
  expect_equal(by_package_sp_st$total_bark_L_Mg_ha, round(by_hand_sp_st$total_bark_L,5))
  expect_equal(by_package_sp_st$total_bark_D_Mg_ha, round(by_hand_sp_st$total_bark_D,5))
  expect_equal(by_package_sp_st$total_branch_L_Mg_ha, round(by_hand_sp_st$total_branch_L,5))
  expect_equal(by_package_sp_st$total_branch_D_Mg_ha, round(by_hand_sp_st$total_branch_D,5))
  expect_equal(by_package_sp_st$total_ag_L_Mg_ha, round(by_hand_sp_st$total_ag_L,5))
  expect_equal(by_package_sp_st$total_ag_D_Mg_ha, round(by_hand_sp_st$total_ag_D,5))
  expect_equal(by_package_sp_st$merch_total_L_Mg_ha, round(by_hand_sp_st$merch_total_L,5))
  expect_equal(by_package_sp_st$merch_total_D_Mg_ha, round(by_hand_sp_st$merch_total_D,5))
  expect_equal(by_package_sp_st$merch_top_L_Mg_ha, round(by_hand_sp_st$merch_top_L,5))
  expect_equal(by_package_sp_st$merch_top_D_Mg_ha, round(by_hand_sp_st$merch_top_D,5))
  expect_equal(by_package_sp_st$stump_total_L_Mg_ha, round(by_hand_sp_st$stump_total_L,5))
  expect_equal(by_package_sp_st$stump_total_D_Mg_ha, round(by_hand_sp_st$stump_total_D,5))
  expect_equal(by_package_sp_st$foliage_L_Mg_ha, round(by_hand_sp_st$foliage_L,5))

  expect_equal(by_package_sp_st$total_wood_L_c, round(by_hand_sp_st$total_wood_L_c,5))
  expect_equal(by_package_sp_st$total_wood_D_c, round(by_hand_sp_st$total_wood_D_c,5))
  expect_equal(by_package_sp_st$total_bark_L_c, round(by_hand_sp_st$total_bark_L_c,5))
  expect_equal(by_package_sp_st$total_bark_D_c, round(by_hand_sp_st$total_bark_D_c,5))
  expect_equal(by_package_sp_st$total_branch_L_c, round(by_hand_sp_st$total_branch_L_c,5))
  expect_equal(by_package_sp_st$total_branch_D_c, round(by_hand_sp_st$total_branch_D_c,5))
  expect_equal(by_package_sp_st$total_ag_L_c, round(by_hand_sp_st$total_ag_L_c,5))
  expect_equal(by_package_sp_st$total_ag_D_c, round(by_hand_sp_st$total_ag_D_c,5))
  expect_equal(by_package_sp_st$merch_total_L_c, round(by_hand_sp_st$merch_total_L_c,5))
  expect_equal(by_package_sp_st$merch_total_D_c, round(by_hand_sp_st$merch_total_D_c,5))
  expect_equal(by_package_sp_st$merch_top_L_c, round(by_hand_sp_st$merch_top_L_c,5))
  expect_equal(by_package_sp_st$merch_top_D_c, round(by_hand_sp_st$merch_top_D_c,5))
  expect_equal(by_package_sp_st$stump_total_L_c, round(by_hand_sp_st$stump_total_L_c,5))
  expect_equal(by_package_sp_st$stump_total_D_c, round(by_hand_sp_st$stump_total_D_c,5))
  expect_equal(by_package_sp_st$foliage_L_c, round(by_hand_sp_st$foliage_L_c,5))

})


test_that("Package and hand species summaries match", {

  expect_warning(expect_warning(by_package_sp <- BiomassNSVB(data = nsvb_sum_check, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_species")$dataframe))
  by_package_sp <- by_package_sp[order(by_package_sp$site, by_package_sp$plot, by_package_sp$species),]
  by_hand_sp <- by_hand_sp[order(by_hand_sp$site, by_hand_sp$plot, by_hand_sp$species),]

  expect_equal(by_package_sp$total_wood_Mg_ha, round(by_hand_sp$total_wood,5))
  expect_equal(by_package_sp$total_bark_Mg_ha, round(by_hand_sp$total_bark,5))
  expect_equal(by_package_sp$total_branch_Mg_ha, round(by_hand_sp$total_branch,5))
  expect_equal(by_package_sp$total_ag_Mg_ha, round(by_hand_sp$total_ag,5))
  expect_equal(by_package_sp$merch_total_Mg_ha, round(by_hand_sp$merch_total,5))
  expect_equal(by_package_sp$merch_top_Mg_ha, round(by_hand_sp$merch_top,5))
  expect_equal(by_package_sp$stump_total_Mg_ha, round(by_hand_sp$stump_total,5))
  expect_equal(by_package_sp$foliage_Mg_ha, round(by_hand_sp$foliage,5))

  expect_equal(by_package_sp$total_wood_c, round(by_hand_sp$total_wood_c,5))
  expect_equal(by_package_sp$total_bark_c, round(by_hand_sp$total_bark_c,5))
  expect_equal(by_package_sp$total_branch_c, round(by_hand_sp$total_branch_c,5))
  expect_equal(by_package_sp$total_ag_c, round(by_hand_sp$total_ag_c,5))
  expect_equal(by_package_sp$merch_total_c, round(by_hand_sp$merch_total_c,5))
  expect_equal(by_package_sp$merch_top_c, round(by_hand_sp$merch_top_c,5))
  expect_equal(by_package_sp$stump_total_c, round(by_hand_sp$stump_total_c,5))
  expect_equal(by_package_sp$foliage_c, round(by_hand_sp$foliage_c,5))

})


test_that("Package and hand status summaries match", {

  expect_warning(expect_warning(by_package_st <- BiomassNSVB(data = nsvb_sum_check, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_status")$dataframe))
  by_package_st <- by_package_st[order(by_package_st$site, by_package_st$plot),]
  by_hand_st <- by_hand_st[order(by_hand_st$site, by_hand_st$plot),]

  expect_equal(by_package_st$total_wood_L_Mg_ha, round(by_hand_st$total_wood_L,5))
  expect_equal(by_package_st$total_wood_D_Mg_ha, round(by_hand_st$total_wood_D,5))
  expect_equal(by_package_st$total_bark_L_Mg_ha, round(by_hand_st$total_bark_L,5))
  expect_equal(by_package_st$total_bark_D_Mg_ha, round(by_hand_st$total_bark_D,5))
  expect_equal(by_package_st$total_branch_L_Mg_ha, round(by_hand_st$total_branch_L,5))
  expect_equal(by_package_st$total_branch_D_Mg_ha, round(by_hand_st$total_branch_D,5))
  expect_equal(by_package_st$total_ag_L_Mg_ha, round(by_hand_st$total_ag_L,5))
  expect_equal(by_package_st$total_ag_D_Mg_ha, round(by_hand_st$total_ag_D,5))
  expect_equal(by_package_st$merch_total_L_Mg_ha, round(by_hand_st$merch_total_L,5))
  expect_equal(by_package_st$merch_total_D_Mg_ha, round(by_hand_st$merch_total_D,5))
  expect_equal(by_package_st$merch_top_L_Mg_ha, round(by_hand_st$merch_top_L,5))
  expect_equal(by_package_st$merch_top_D_Mg_ha, round(by_hand_st$merch_top_D,5))
  expect_equal(by_package_st$stump_total_L_Mg_ha, round(by_hand_st$stump_total_L,5))
  expect_equal(by_package_st$stump_total_D_Mg_ha, round(by_hand_st$stump_total_D,5))
  expect_equal(by_package_st$foliage_L_Mg_ha, round(by_hand_st$foliage_L,5))

  expect_equal(by_package_st$total_wood_L_c, round(by_hand_st$total_wood_L_c,5))
  expect_equal(by_package_st$total_wood_D_c, round(by_hand_st$total_wood_D_c,5))
  expect_equal(by_package_st$total_bark_L_c, round(by_hand_st$total_bark_L_c,5))
  expect_equal(by_package_st$total_bark_D_c, round(by_hand_st$total_bark_D_c,5))
  expect_equal(by_package_st$total_branch_L_c, round(by_hand_st$total_branch_L_c,5))
  expect_equal(by_package_st$total_branch_D_c, round(by_hand_st$total_branch_D_c,5))
  expect_equal(by_package_st$total_ag_L_c, round(by_hand_st$total_ag_L_c,5))
  expect_equal(by_package_st$total_ag_D_c, round(by_hand_st$total_ag_D_c,5))
  expect_equal(by_package_st$merch_total_L_c, round(by_hand_st$merch_total_L_c,5))
  expect_equal(by_package_st$merch_total_D_c, round(by_hand_st$merch_total_D_c,5))
  expect_equal(by_package_st$merch_top_L_c, round(by_hand_st$merch_top_L_c,5))
  expect_equal(by_package_st$merch_top_D_c, round(by_hand_st$merch_top_D_c,5))
  expect_equal(by_package_st$stump_total_L_c, round(by_hand_st$stump_total_L_c,5))
  expect_equal(by_package_st$stump_total_D_c, round(by_hand_st$stump_total_D_c,5))
  expect_equal(by_package_st$foliage_L_c, round(by_hand_st$foliage_L_c,5))

})


test_that("Package and hand plot summaries match", {

  expect_warning(expect_warning(by_package_plot <- BiomassNSVB(data = nsvb_sum_check, sp_codes = "4letter", input_units = "metric", output_units = "metric", results = "by_plot")$dataframe))
  by_package_plot <- by_package_plot[order(by_package_plot$site, by_package_plot$plot),]
  by_hand_plot <- by_hand_plot[order(by_hand_plot$site, by_hand_plot$plot),]

  expect_equal(by_package_plot$total_wood_Mg_ha, round(by_hand_plot$total_wood,5))
  expect_equal(by_package_plot$total_bark_Mg_ha, round(by_hand_plot$total_bark,5))
  expect_equal(by_package_plot$total_branch_Mg_ha, round(by_hand_plot$total_branch,5))
  expect_equal(by_package_plot$total_ag_Mg_ha, round(by_hand_plot$total_ag,5))
  expect_equal(by_package_plot$merch_total_Mg_ha, round(by_hand_plot$merch_total,5))
  expect_equal(by_package_plot$merch_top_Mg_ha, round(by_hand_plot$merch_top,5))
  expect_equal(by_package_plot$stump_total_Mg_ha, round(by_hand_plot$stump_total,5))
  expect_equal(by_package_plot$foliage_Mg_ha, round(by_hand_plot$foliage,5))

  expect_equal(by_package_plot$total_wood_c, round(by_hand_plot$total_wood_c,5))
  expect_equal(by_package_plot$total_bark_c, round(by_hand_plot$total_bark_c,5))
  expect_equal(by_package_plot$total_branch_c, round(by_hand_plot$total_branch_c,5))
  expect_equal(by_package_plot$total_ag_c, round(by_hand_plot$total_ag_c,5))
  expect_equal(by_package_plot$merch_total_c, round(by_hand_plot$merch_total_c,5))
  expect_equal(by_package_plot$merch_top_c, round(by_hand_plot$merch_top_c,5))
  expect_equal(by_package_plot$stump_total_c, round(by_hand_plot$stump_total_c,5))
  expect_equal(by_package_plot$foliage_c, round(by_hand_plot$foliage_c,5))

})

