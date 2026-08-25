
test_that("Properly formatted dataframes throw no errors, warnings, or messages", {

  expect_no_error(StandDensity(tree_data = sdi_good,
                               subsec_data = sub_plot_good))

  expect_no_warning(StandDensity(tree_data = sdi_good,
                                 subsec_data = sub_plot_good))

  expect_no_message(StandDensity(tree_data = sdi_good,
                                 subsec_data = sub_plot_good))

  expect_no_error(StandDensity(tree_data = sdi_good,
                               subsec_data = sub_good))

  expect_no_warning(StandDensity(tree_data = sdi_good,
                                 subsec_data = sub_good))

  expect_no_message(StandDensity(tree_data = sdi_good,
                                 subsec_data = sub_good))

})


test_that("Output dataframe has expected column names", {

  expect_named(StandDensity(tree_data = sdi_good,
                            subsec_data = sub_plot_good,
                            output_units = "metric"),
               c("site", "plot", "current_sdi_sph", "max_sdi_sph", "rel_density"))

  expect_named(StandDensity(tree_data = sdi_good,
                            subsec_data = sub_plot_good,
                            output_units = "imperial"),
               c("site", "plot", "current_sdi_spa", "max_sdi_spa", "rel_density"))

})


test_that("Final column classes are as expected", {

  sdi_trial <- StandDensity(tree_data = sdi_good,
                            subsec_data = sub_plot_good)

  expect_equal(class(sdi_trial$site), "character")
  expect_equal(class(sdi_trial$plot), "character")
  expect_equal(class(sdi_trial$current_sdi_sph), "numeric")
  expect_equal(class(sdi_trial$max_sdi_sph), "numeric")
  expect_equal(class(sdi_trial$rel_density), "numeric")

})


test_that("Special cases behave as expected", {

  special_results <- suppressWarnings(StandDensity(tree_data = sdi_special_cases, subsec_data = sub_plot_good))

  # no live trees
  no_live <- subset(special_results, site == "SEKI" & plot == "1")
  expect_equal(no_live$current_sdi_sph, 0)
  expect_true(no_live$max_sdi_sph > 0)
  expect_equal(no_live$rel_density, 0)

  # no complete cases of status and dbh
  no_complete <- subset(special_results, site == "YOMI" & plot == "1")
  expect_true(is.na(no_complete$current_sdi_sph))
  expect_true(no_complete$max_sdi_sph > 0)
  expect_true(is.na(no_complete$rel_density))

  # no live trees with dbh >= 2.54 cm
  no_large_live <- subset(special_results, site == "YOMI" & plot == "2")
  expect_equal(no_large_live$current_sdi_sph, 0)
  expect_true(no_large_live$max_sdi_sph > 0)
  expect_equal(no_large_live$rel_density, 0)

  # no trees
  no_trees <- subset(special_results, site == "YOMI" & plot == "3")
  expect_equal(no_trees$current_sdi_sph, 0)
  expect_true(no_trees$max_sdi_sph > 0)
  expect_equal(no_trees$rel_density, 0)

})
