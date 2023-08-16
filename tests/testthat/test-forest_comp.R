
test_that("Output dataframe has expected column names", {

  expect_named(ForestComp(data = good_comp_metric,
                          site = "Forest",
                          plot = "Plot_id",
                          exp_factor = "SPH",
                          status = "Live",
                          species = "SPP",
                          dbh = "DBH_CM",
                          relative = "BA",
                          units = "metric"),
               c("site", "plot", "species", "dominance"))

})


test_that("Final message is as expected", {

  expect_message(ForestComp(data= good_comp_metric,
                            site = "Forest",
                            plot = "Plot_id",
                            exp_factor = "SPH",
                            status = "Live",
                            species = "SPP",
                            dbh = "DBH_CM",
                            relative = "BA",
                            units = "metric"),
                 'The following species were present: ABCO CADE PSME')

})


test_that("NA species code handling works", {

  expect_message(ForestComp(data = bad_comp,
                            site = "Forest",
                            plot = "Plot_id",
                            exp_factor = "SPH",
                            status = "Live",
                            species = "SPP_NA",
                            dbh = "DBH_CM",
                            relative = "BA",
                            units = "metric"),
                 'The following species were present: ABCO CADE PSME UNTR')

})


test_that("Final column classes are as expected", {

  comp_trial <- ForestComp(data = good_comp_metric,
                           site = "Forest",
                           plot = "Plot_id",
                           exp_factor = "SPH",
                           status = "Live",
                           species = "SPP",
                           dbh = "DBH_CM",
                           relative = "BA",
                           units = "metric")

  expect_equal(class(comp_trial$site), "character")
  expect_equal(class(comp_trial$plot), "character")
  expect_equal(class(comp_trial$species), "character")
  expect_equal(class(comp_trial$dominance), "numeric")

})
