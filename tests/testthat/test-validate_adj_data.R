
# run data through TreeBiomass() first
TB_good_metric <- TreeBiomass(data = good_trees_metric,
                              status = "Live",
                              species = "SPP",
                              dbh = "DBH_CM",
                              ht = "HT_M",
                              sp_codes = "4letter",
                              units = "metric")

TB_good_imperial <- TreeBiomass(data = good_trees_imperial,
                                status = "Live",
                                species = "SPP",
                                dbh = "DBH_IN",
                                ht = "HT_FT",
                                sp_codes = "4letter",
                                units = "imperial")

TB_bad <- TreeBiomass(data = bad_trees,
                      status = "Live_v1",
                      species = "SPP4",
                      dbh = "DBH_CM",
                      ht = "HT_M",
                      sp_codes = "4letter",
                      units = "metric")


test_that("Properly formatted data frames throw no errors, warnings, or messages", {

  expect_no_error(ValidateAdjData(data_val = TB_good_metric,
                                  status_val = "Live",
                                  decay_val = "Decay"))

  expect_no_warning(ValidateAdjData(data_val = TB_good_metric,
                                    status_val = "Live",
                                    decay_val = "Decay"))

  expect_no_message(ValidateAdjData(data_val = TB_good_metric,
                                    status_val = "Live",
                                    decay_val = "Decay"))

})


test_that("Unrecognized column names throw an error", {

  expect_error(ValidateAdjData(data_val = TB_good_metric,
                               status_val = "Live",
                               decay_val = "Decayy"),
               'There is no column named "Decayy" in the provided dataframe.')

})

test_that("Decay class code handling works", {

  expect_error(ValidateAdjData(data_val = TB_bad,
                               status_val = "Live_v1",
                               decay_val = "Decay_bad1"),
               'decay_class must be 0 through 5!\nUnrecognized decay class codes: 8')

  expect_warning(ValidateAdjData(data_val = TB_bad,
                                 status_val = "Live_v1",
                                 decay_val = "Decay_bad3"),
                 'There are dead trees with NA and/or zero decay class codes.\nThe biomass of these dead trees will NOT be adjusted.\nConsider investigating these trees with mismatched status/decay class.\n')

  expect_warning(ValidateAdjData(data_val = TB_bad,
                                 status_val = "Live_v1",
                                 decay_val = "Decay_bad2"),
                 'There are live trees with 1-5 decay class codes.\nLive trees should have decay class codes of NA or zero.\nThe biomass of these live trees will NOT be adjusted.\nBut you should consider investigating these trees with mismatched status/decay class.\n')

})

