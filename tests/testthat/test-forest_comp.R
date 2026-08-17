
test_that("Output dataframe has expected column names", {

  expect_named(ForestComp(data = good_comp_metric,
                          relative = "BA",
                          units = "metric"),
               c("site", "plot", "species", "dominance"))

})


test_that("Final message is as expected", {

  expect_message(ForestComp(data= good_comp_metric,
                            relative = "BA",
                            units = "metric"),
                 'The following species were present: ABCO CADE PSME')

})


test_that("NA species code handling works", {

  expect_message(expect_warning(ForestComp(data = bad_comp_14,
                                           relative = "BA",
                                           units = "metric")),
                 'The following species were present: ABCO CADE PSME UNTR')

})


test_that("Final column classes are as expected", {

  comp_trial <- ForestComp(data = good_comp_metric,
                           relative = "BA",
                           units = "metric")

  expect_equal(class(comp_trial$site), "character")
  expect_equal(class(comp_trial$plot), "character")
  expect_equal(class(comp_trial$species), "character")
  expect_equal(class(comp_trial$dominance), "numeric")

})


test_that("Package and hand calculations match", {

  # relative density
  expect_message(comp_den_package <- ForestComp(comp_str_trees_m, relative = "density", units = "metric"))
  comp_den_package <- comp_den_package[order(comp_den_package$site, comp_den_package$plot, comp_den_package$species),]
  comp_den_hand <- comp_den_hand[order(comp_den_hand$site, comp_den_hand$plot, comp_den_hand$species),]

  expect_equal(comp_den_hand$dominance, comp_den_package$dominance)

  # relative BA
  expect_message(comp_ba_package <- ForestComp(comp_str_trees_m, relative = "BA", units = "metric"))
  comp_ba_package <- comp_ba_package[order(comp_ba_package$site, comp_ba_package$plot, comp_ba_package$species),]
  comp_ba_hand <- comp_ba_hand[order(comp_ba_hand$site, comp_ba_hand$plot, comp_ba_hand$species),]

  expect_equal(comp_ba_hand$dominance, comp_ba_package$dominance)

})

