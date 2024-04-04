
test_that("Properly formatted data frames for STRS throw no errors, warnings, or messages", {

  expect_no_error(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                      cwd_data_check = g_strs_cwd_m,
                                      design_check = "STRS",
                                      wt_data_check = g_strs_wh_1,
                                      fpc_data_check = "not_needed",
                                      unit_check = "metric",
                                      type_check = "type3"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                        cwd_data_check = g_strs_cwd_m,
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type3"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                        cwd_data_check = g_strs_cwd_m,
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type3"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                      cwd_data_check = g_strs_cwd_m,
                                      design_check = "STRS",
                                      wt_data_check = g_strs_wh_1,
                                      fpc_data_check = g_strs_fpc_1,
                                      unit_check = "metric",
                                      type_check = "type3"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                        cwd_data_check = g_strs_cwd_m,
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check =  g_strs_fpc_1,
                                        unit_check = "metric",
                                        type_check = "type3"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                        cwd_data_check = g_strs_cwd_m,
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check =  g_strs_fpc_1,
                                        unit_check = "metric",
                                        type_check = "type3"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                      cwd_data_check = g_strs_cwd_m,
                                      design_check = "STRS",
                                      wt_data_check = g_strs_wh_1,
                                      fpc_data_check = g_strs_fpc_2,
                                      unit_check = "metric",
                                      type_check = "type3"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                        cwd_data_check = g_strs_cwd_m,
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check =  g_strs_fpc_2,
                                        unit_check = "metric",
                                        type_check = "type3"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                        cwd_data_check = g_strs_cwd_m,
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check =  g_strs_fpc_2,
                                        unit_check = "metric",
                                        type_check = "type3"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = g_strs_fwd_i,
                                      cwd_data_check = g_strs_cwd_i,
                                      design_check = "STRS",
                                      wt_data_check = g_strs_wh_1,
                                      fpc_data_check = "not_needed",
                                      unit_check = "imperial",
                                      type_check = "type3"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_strs_fwd_i,
                                        cwd_data_check = g_strs_cwd_i,
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check = "not_needed",
                                        unit_check = "imperial",
                                        type_check = "type3"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_strs_fwd_i,
                                        cwd_data_check = g_strs_cwd_i,
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check = "not_needed",
                                        unit_check = "imperial",
                                        type_check = "type3"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                      cwd_data_check = "none",
                                      design_check = "STRS",
                                      wt_data_check = g_strs_wh_1,
                                      fpc_data_check = "not_needed",
                                      unit_check = "metric",
                                      type_check = "type1"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                        cwd_data_check = "none",
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type1"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                        cwd_data_check = "none",
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type1"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = "none",
                                      cwd_data_check = g_strs_cwd_m,
                                      design_check = "STRS",
                                      wt_data_check = g_strs_wh_1,
                                      fpc_data_check = "not_needed",
                                      unit_check = "metric",
                                      type_check = "type2"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = "none",
                                        cwd_data_check = g_strs_cwd_m,
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type2"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = "none",
                                        cwd_data_check = g_strs_cwd_m,
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type2"))

})


test_that("Properly formatted data frames for SRS throw no errors, warnings, or messages", {

  expect_no_error(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                      cwd_data_check = g_srs_cwd_m,
                                      design_check = "SRS",
                                      wt_data_check = "not_needed",
                                      fpc_data_check = "not_needed",
                                      unit_check = "metric",
                                      type_check = "type3"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                        cwd_data_check = g_srs_cwd_m,
                                        design_check = "SRS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type3"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                        cwd_data_check = g_srs_cwd_m,
                                        design_check = "SRS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type3"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                      cwd_data_check = g_srs_cwd_m,
                                      design_check = "SRS",
                                      wt_data_check = "not_needed",
                                      fpc_data_check = g_srs_fpc_1,
                                      unit_check = "metric",
                                      type_check = "type3"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                        cwd_data_check = g_srs_cwd_m,
                                        design_check = "SRS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = g_srs_fpc_1,
                                        unit_check = "metric",
                                        type_check = "type3"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                        cwd_data_check = g_srs_cwd_m,
                                        design_check = "SRS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = g_srs_fpc_1,
                                        unit_check = "metric",
                                        type_check = "type3"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                      cwd_data_check = g_srs_cwd_m,
                                      design_check = "SRS",
                                      wt_data_check = "not_needed",
                                      fpc_data_check = g_srs_fpc_2,
                                      unit_check = "metric",
                                      type_check = "type3"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                        cwd_data_check = g_srs_cwd_m,
                                        design_check = "SRS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = g_srs_fpc_2,
                                        unit_check = "metric",
                                        type_check = "type3"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                        cwd_data_check = g_srs_cwd_m,
                                        design_check = "SRS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = g_srs_fpc_2,
                                        unit_check = "metric",
                                        type_check = "type3"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = g_srs_fwd_i,
                                      cwd_data_check = g_srs_cwd_i,
                                      design_check = "SRS",
                                      wt_data_check = "not_needed",
                                      fpc_data_check = "not_needed",
                                      unit_check = "imperial",
                                      type_check = "type3"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_srs_fwd_i,
                                        cwd_data_check = g_srs_cwd_i,
                                        design_check = "SRS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "imperial",
                                        type_check = "type3"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_srs_fwd_i,
                                        cwd_data_check = g_srs_cwd_i,
                                        design_check = "SRS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "imperial",
                                        type_check = "type3"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                      cwd_data_check = "none",
                                      design_check = "SRS",
                                      wt_data_check = "not_needed",
                                      fpc_data_check = "not_needed",
                                      unit_check = "metric",
                                      type_check = "type1"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                        cwd_data_check = "none",
                                        design_check = "SRS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type1"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                        cwd_data_check = "none",
                                        design_check = "SRS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type1"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = "none",
                                      cwd_data_check = g_srs_cwd_m,
                                      design_check = "SRS",
                                      wt_data_check = "not_needed",
                                      fpc_data_check = "not_needed",
                                      unit_check = "metric",
                                      type_check = "type2"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = "none",
                                        cwd_data_check = g_srs_cwd_m,
                                        design_check = "SRS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type2"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = "none",
                                        cwd_data_check = g_srs_cwd_m,
                                        design_check = "SRS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type2"))

})


test_that("Properly formatted data frames for FFS throw no errors, warnings, or messages", {

  expect_no_error(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_m,
                                      cwd_data_check = g_ffs_cwd_m,
                                      design_check = "FFS",
                                      wt_data_check = "not_needed",
                                      fpc_data_check = "not_needed",
                                      unit_check = "metric",
                                      type_check = "type3"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_m,
                                        cwd_data_check = g_ffs_cwd_m,
                                        design_check = "FFS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type3"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_m,
                                        cwd_data_check = g_ffs_cwd_m,
                                        design_check = "FFS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type3"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_m,
                                      cwd_data_check = g_ffs_cwd_m,
                                      design_check = "FFS",
                                      wt_data_check = "not_needed",
                                      fpc_data_check = g_ffs_fpc_1,
                                      unit_check = "metric",
                                      type_check = "type3"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_m,
                                        cwd_data_check = g_ffs_cwd_m,
                                        design_check = "FFS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = g_ffs_fpc_1,
                                        unit_check = "metric",
                                        type_check = "type3"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_m,
                                        cwd_data_check = g_ffs_cwd_m,
                                        design_check = "FFS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = g_ffs_fpc_1,
                                        unit_check = "metric",
                                        type_check = "type3"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_m,
                                      cwd_data_check = g_ffs_cwd_m,
                                      design_check = "FFS",
                                      wt_data_check = "not_needed",
                                      fpc_data_check = g_ffs_fpc_2,
                                      unit_check = "metric",
                                      type_check = "type3"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_m,
                                        cwd_data_check = g_ffs_cwd_m,
                                        design_check = "FFS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = g_ffs_fpc_2,
                                        unit_check = "metric",
                                        type_check = "type3"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_m,
                                        cwd_data_check = g_ffs_cwd_m,
                                        design_check = "FFS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = g_ffs_fpc_2,
                                        unit_check = "metric",
                                        type_check = "type3"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_i,
                                      cwd_data_check = g_ffs_cwd_i,
                                      design_check = "FFS",
                                      wt_data_check = "not_needed",
                                      fpc_data_check = "not_needed",
                                      unit_check = "imperial",
                                      type_check = "type3"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_i,
                                        cwd_data_check = g_ffs_cwd_i,
                                        design_check = "FFS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "imperial",
                                        type_check = "type3"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_i,
                                        cwd_data_check = g_ffs_cwd_i,
                                        design_check = "FFS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "imperial",
                                        type_check = "type3"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_m,
                                      cwd_data_check = "none",
                                      design_check = "FFS",
                                      wt_data_check = "not_needed",
                                      fpc_data_check = "not_needed",
                                      unit_check = "metric",
                                      type_check = "type1"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_m,
                                        cwd_data_check = "none",
                                        design_check = "FFS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type1"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_m,
                                        cwd_data_check = "none",
                                        design_check = "FFS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type1"))


  expect_no_error(ValidateSurfaceData(fwd_data_check = "none",
                                      cwd_data_check = g_ffs_cwd_m,
                                      design_check = "FFS",
                                      wt_data_check = "not_needed",
                                      fpc_data_check = "not_needed",
                                      unit_check = "metric",
                                      type_check = "type2"))

  expect_no_warning(ValidateSurfaceData(fwd_data_check = "none",
                                        cwd_data_check = g_ffs_cwd_m,
                                        design_check = "FFS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type2"))

  expect_no_message(ValidateSurfaceData(fwd_data_check = "none",
                                        cwd_data_check = g_ffs_cwd_m,
                                        design_check = "FFS",
                                        wt_data_check = "not_needed",
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type2"))

})


test_that("Invalid options throw an error", {

  expect_error(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                   cwd_data_check = g_srs_cwd_m,
                                   design_check = "SRSS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type3"),
               'The "design" parameter must be set to "SRS", "STRS", or "FFS".')

  expect_error(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                   cwd_data_check = g_srs_cwd_m,
                                   design_check = "STRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type3"),
               'For a stratified random sampling - STRS - design, you must supply wt_data.\nYou left wt_data as the default "not_needed".')

  expect_error(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                   cwd_data_check = g_srs_cwd_m,
                                   design_check = "SRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type3"),
               'For a simple random sampling - SRS - design, you do not need to supply wt_data.\nFor SRS, you should leave wt_data as the default "not_needed".')

  expect_error(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                   cwd_data_check = g_srs_cwd_m,
                                   design_check = "FFS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type3"),
               'For a Fire and Fire Surrogate - FFS - design, you do not need to supply wt_data.\nFor FFS, you should leave wt_data as the default "not_needed".')

  expect_error(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                   cwd_data_check = g_srs_cwd_m,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metricc",
                                   type_check = "type3"),
               'The "units" parameter must be set to "metric" or "imperial".')

})


test_that("Missing columns throw an error", {

  # STRS --------------------------------------------------------
  expect_error(ValidateSurfaceData(fwd_data_check = b_strs_fwd_m_1,
                                   cwd_data_check = "none",
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'fwd_data is missing necessary columns!\nFor a STRS design and metric units, fwd_data must include: time, site, stratum, plot,\nload_1h_Mg_ha, load_10h_Mg_ha, load_100h_Mg_ha, sc_length_1h, sc_length_10h, and sc_length_100h')

  expect_error(ValidateSurfaceData(fwd_data_check = b_strs_fwd_i_1,
                                   cwd_data_check = g_strs_cwd_i,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "imperial",
                                   type_check = "type3"),
               'fwd_data is missing necessary columns!\nFor a STRS design and imperial units, fwd_data must include: time, site, stratum, plot,\nload_1h_ton_ac, load_10h_ton_ac, load_100h_ton_ac, sc_length_1h, sc_length_10h, and sc_length_100h')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_strs_cwd_m_1,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'cwd_data is missing necessary columns!\nFor a STRS design and metric units, cwd_data must include: time, site, stratum, plot,\nload_1000s_Mg_ha, load_1000r_Mg_ha, load_cwd_Mg_ha, sc_length_1000s, and sc_length_1000r')

  expect_error(ValidateSurfaceData(fwd_data_check = g_strs_fwd_i,
                                   cwd_data_check = b_strs_cwd_i_1,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "imperial",
                                   type_check = "type3"),
               'cwd_data is missing necessary columns!\nFor a STRS design and imperial units, cwd_data must include: time, site, stratum, plot,\nload_1000s_ton_ac, load_1000r_ton_ac, load_cwd_ton_ac, sc_length_1000s, and sc_length_1000r')

  # SRS ------------------------------------------------------------
  expect_error(ValidateSurfaceData(fwd_data_check = b_srs_fwd_m_1,
                                   cwd_data_check = "none",
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'fwd_data is missing necessary columns!\nFor a SRS design and metric units, fwd_data must include: time, site, plot,\nload_1h_Mg_ha, load_10h_Mg_ha, load_100h_Mg_ha, sc_length_1h, sc_length_10h, and sc_length_100h')

  expect_error(ValidateSurfaceData(fwd_data_check = b_srs_fwd_i_1,
                                   cwd_data_check = g_srs_cwd_i,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "imperial",
                                   type_check = "type3"),
               'fwd_data is missing necessary columns!\nFor a SRS design and imperial units, fwd_data must include: time, site, plot,\nload_1h_ton_ac, load_10h_ton_ac, load_100h_ton_ac, sc_length_1h, sc_length_10h, and sc_length_100h')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_srs_cwd_m_1,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'cwd_data is missing necessary columns!\nFor a SRS design and metric units, cwd_data must include: time, site, plot,\nload_1000s_Mg_ha, load_1000r_Mg_ha, load_cwd_Mg_ha, sc_length_1000s, and sc_length_1000r')

  expect_error(ValidateSurfaceData(fwd_data_check = g_srs_fwd_i,
                                   cwd_data_check = b_srs_cwd_i_1,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "imperial",
                                   type_check = "type3"),
               'cwd_data is missing necessary columns!\nFor a SRS design and imperial units, cwd_data must include: time, site, plot,\nload_1000s_ton_ac, load_1000r_ton_ac, load_cwd_ton_ac, sc_length_1000s, and sc_length_1000r')

  # FFS ------------------------------------------------------------
  expect_error(ValidateSurfaceData(fwd_data_check = b_ffs_fwd_m_1,
                                   cwd_data_check = "none",
                                   design_check = "FFS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'fwd_data is missing necessary columns!\nFor a FFS design and metric units, fwd_data must include: time, trt_type, site, plot,\nload_1h_Mg_ha, load_10h_Mg_ha, load_100h_Mg_ha, sc_length_1h, sc_length_10h, and sc_length_100h')

  expect_error(ValidateSurfaceData(fwd_data_check = b_ffs_fwd_i_1,
                                   cwd_data_check = g_ffs_cwd_i,
                                   design_check = "FFS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "imperial",
                                   type_check = "type3"),
               'fwd_data is missing necessary columns!\nFor a FFS design and imperial units, fwd_data must include: time, trt_type, site, plot,\nload_1h_ton_ac, load_10h_ton_ac, load_100h_ton_ac, sc_length_1h, sc_length_10h, and sc_length_100h')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_ffs_cwd_m_1,
                                   design_check = "FFS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'cwd_data is missing necessary columns!\nFor a FFS design and metric units, cwd_data must include: time, trt_type, site, plot,\nload_1000s_Mg_ha, load_1000r_Mg_ha, load_cwd_Mg_ha, sc_length_1000s, and sc_length_1000r')

  expect_error(ValidateSurfaceData(fwd_data_check = g_ffs_fwd_i,
                                   cwd_data_check = b_ffs_cwd_i_1,
                                   design_check = "FFS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "imperial",
                                   type_check = "type3"),
               'cwd_data is missing necessary columns!\nFor a FFS design and imperial units, cwd_data must include: time, trt_type, site, plot,\nload_1000s_ton_ac, load_1000r_ton_ac, load_cwd_ton_ac, sc_length_1000s, and sc_length_1000r')

})


test_that("Missing values throw an error", {

  # FWD ----------------------------------------------------------
  expect_error(ValidateSurfaceData(fwd_data_check = b_strs_fwd_m_2,
                                   cwd_data_check = "none",
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, there are missing values in the time column.')

  expect_error(ValidateSurfaceData(fwd_data_check = b_strs_fwd_m_3,
                                   cwd_data_check = "none",
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, there are missing values in the site column.')

  expect_error(ValidateSurfaceData(fwd_data_check = b_strs_fwd_m_4,
                                   cwd_data_check = "none",
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, there are missing values in the stratum column.')

  expect_error(ValidateSurfaceData(fwd_data_check = b_strs_fwd_m_5,
                                   cwd_data_check = "none",
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, there are missing values in the plot column.')

  expect_error(ValidateSurfaceData(fwd_data_check = b_ffs_fwd_m_2,
                                   cwd_data_check = "none",
                                   design_check = "FFS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, there are missing values in the trt_type column.')

  # CWD --------------------------------------------------------
  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_strs_cwd_m_2,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, there are missing values in the time column.')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check =  b_strs_cwd_m_3,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, there are missing values in the site column.')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_strs_cwd_m_4,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, there are missing values in the stratum column.')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_strs_cwd_m_5,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, there are missing values in the plot column.')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_ffs_cwd_m_2,
                                   design_check = "FFS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, there are missing values in the trt_type column.')

})


test_that("Wrong column class throws an error", {

  # FWD ---------------------------------------------------------
  # numeric -----------
  expect_error(ValidateSurfaceData(fwd_data_check = b_srs_fwd_m_2,
                                   cwd_data_check = "none",
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, the load_1h_Mg_ha column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = b_srs_fwd_m_3,
                                   cwd_data_check = "none",
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, the load_10h_Mg_ha column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = b_srs_fwd_m_4,
                                   cwd_data_check = g_srs_cwd_m,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type3"),
               'For fwd_data, the load_100h_Mg_ha column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = b_srs_fwd_m_5,
                                   cwd_data_check = "none",
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, the sc_length_1h column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = b_srs_fwd_m_6,
                                   cwd_data_check = "none",
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, the sc_length_10h column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = b_srs_fwd_m_7,
                                   cwd_data_check = "none",
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, the sc_length_100h column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = b_srs_fwd_i_2,
                                   cwd_data_check = "none",
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "imperial",
                                   type_check = "type1"),
               'For fwd_data, the load_1h_ton_ac column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = b_srs_fwd_i_3,
                                   cwd_data_check = "none",
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "imperial",
                                   type_check = "type1"),
               'For fwd_data, the load_10h_ton_ac column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = b_srs_fwd_i_4,
                                   cwd_data_check = g_srs_cwd_i,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "imperial",
                                   type_check = "type3"),
               'For fwd_data, the load_100h_ton_ac column must be numeric.\nCurrently, the column is class: character')

  # character -----------
  expect_error(ValidateSurfaceData(fwd_data_check = b_strs_fwd_m_8,
                                   cwd_data_check = "none",
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, time must be a character variable.\nThe time column is currently class: factor')

  expect_error(ValidateSurfaceData(fwd_data_check = b_strs_fwd_m_9,
                                   cwd_data_check = "none",
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, site must be a character variable.\nThe site column is currently class: numeric')

  expect_error(ValidateSurfaceData(fwd_data_check = b_strs_fwd_m_10,
                                   cwd_data_check = "none",
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, stratum must be a character variable.\nThe stratum column is currently class: numeric')

  expect_error(ValidateSurfaceData(fwd_data_check = b_strs_fwd_m_11,
                                   cwd_data_check = "none",
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, plot must be a character variable.\nThe plot column is currently class: numeric')

  expect_error(ValidateSurfaceData(fwd_data_check = b_ffs_fwd_m_5,
                                   cwd_data_check = "none",
                                   design_check = "FFS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, trt_type must be a character variable.\nThe trt_type column is currently class: factor')

  # CWD ------------------------------------------------------------
  # numeric -----------
  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_srs_cwd_m_2,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, the load_1000s_Mg_ha column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_srs_cwd_m_3,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, the load_1000r_Mg_ha column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                   cwd_data_check = b_srs_cwd_m_4,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type3"),
               'For cwd_data, the load_cwd_Mg_ha column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_srs_cwd_m_5,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, the sc_length_1000s column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_srs_cwd_m_6,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, the sc_length_1000r column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_srs_cwd_i_2,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "imperial",
                                   type_check = "type2"),
               'For cwd_data, the load_1000s_ton_ac column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_srs_cwd_i_3,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "imperial",
                                   type_check = "type2"),
               'For cwd_data, the load_1000r_ton_ac column must be numeric.\nCurrently, the column is class: character')

  expect_error(ValidateSurfaceData(fwd_data_check = g_srs_fwd_i,
                                   cwd_data_check = b_srs_cwd_i_4,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "imperial",
                                   type_check = "type3"),
               'For cwd_data, the load_cwd_ton_ac column must be numeric.\nCurrently, the column is class: character')

  # character -----------
  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_strs_cwd_m_7,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, time must be a character variable.\nThe time column is currently class: factor')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_strs_cwd_m_8,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, site must be a character variable.\nThe site column is currently class: factor')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_strs_cwd_m_9,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, stratum must be a character variable.\nThe stratum column is currently class: numeric')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_strs_cwd_m_10,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, plot must be a character variable.\nThe plot column is currently class: numeric')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_ffs_cwd_m_4,
                                   design_check = "FFS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, trt_type must be a character variable.\nThe trt_type column is currently class: factor')

})


test_that("Repeat observations throw an error", {

  # STRS -------------------------------------------------
  expect_error(ValidateSurfaceData(fwd_data_check = b_strs_fwd_m_6,
                                   cwd_data_check = "none",
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, there are repeat time:site:stratum:plot observations.\nThere should only be one observation/row for an individual plot at a specific time:site:stratum.\nInvestigate the following time:site:stratum:plot combinations: pre_SEKI_1_3')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_strs_cwd_m_6,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, there are repeat time:site:stratum:plot observations.\nThere should only be one observation/row for an individual plot at a specific time:site:stratum.\nInvestigate the following time:site:stratum:plot combinations: pre_SEKI_1_3')

  # SRS ---------------------------------------------------
  expect_error(ValidateSurfaceData(fwd_data_check = b_srs_fwd_m_8,
                                   cwd_data_check = "none",
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, there are repeat time:site:plot observations.\nThere should only be one observation/row for an individual plot at a specific time:site.\nInvestigate the following time:site:plot combinations: pre_SEKI_1')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_srs_cwd_m_7,
                                   design_check = "SRS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, there are repeat time:site:plot observations.\nThere should only be one observation/row for an individual plot at a specific time:site.\nInvestigate the following time:site:plot combinations: pre_SEKI_1')

  # FFS ---------------------------------------------------
  expect_error(ValidateSurfaceData(fwd_data_check = b_ffs_fwd_m_3,
                                   cwd_data_check = "none",
                                   design_check = "FFS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'For fwd_data, there are repeat time:trt_type:site:plot observations.\nThere should only be one observation/row for an individual plot at a specific time:trt_type:site.\nInvestigate the following time:trt_type:site:plot combinations: pre_burn_220_2')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = b_ffs_cwd_m_3,
                                   design_check = "FFS",
                                   wt_data_check = "not_needed",
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'For cwd_data, there are repeat time:trt_type:site:plot observations.\nThere should only be one observation/row for an individual plot at a specific time:trt_type:site.\nInvestigate the following time:trt_type:site:plot combinations: pre_burn_220_2')

})


test_that("Dataframe merging works", {

  # STRS -------------------------------------------------
  expect_warning(ValidateSurfaceData(fwd_data_check = b_strs_fwd_m_7,
                                     cwd_data_check = g_strs_cwd_m,
                                     design_check = "STRS",
                                     wt_data_check = g_strs_wh_1,
                                     fpc_data_check = "not_needed",
                                     unit_check = "metric",
                                     type_check = "type3"),
                'fwd_data and cwd_data did not completely match!\nThese plots are in "fwd_data" but do not have matches in "cwd_data": pre_SEKI_1_4 \nThese plots are in "cwd_data" but do not have matches in "fwd_data": pre_SEKI_1_3 \nPlots without matches will NOT be dropped when the two dataframes are merged.\nNA values will be filled in as needed for a full merge.')

  # SRS ---------------------------------------------------
  expect_warning(ValidateSurfaceData(fwd_data_check = b_srs_fwd_m_9,
                                     cwd_data_check = g_srs_cwd_m,
                                     design_check = "SRS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = "not_needed",
                                     unit_check = "metric",
                                     type_check = "type3"),
               'fwd_data and cwd_data did not completely match!\nThese plots are in "fwd_data" but do not have matches in "cwd_data": pre_YOMI_5 \nThese plots are in "cwd_data" but do not have matches in "fwd_data": pre_YOMI_4 \nPlots without matches will NOT be dropped when the two dataframes are merged.\nNA values will be filled in as needed for a full merge.')

  # FFS ---------------------------------------------------
  expect_warning(ValidateSurfaceData(fwd_data_check = b_ffs_fwd_m_4,
                                     cwd_data_check = g_ffs_cwd_m,
                                     design_check = "FFS",
                                     wt_data_check = "not_needed",
                                     fpc_data_check = "not_needed",
                                     unit_check = "metric",
                                     type_check = "type3"),
               'fwd_data and cwd_data did not completely match!\nThese plots are in "fwd_data" but do not have matches in "cwd_data": pre_burn_220_4 \nThese plots are in "cwd_data" but do not have matches in "fwd_data": pre_burn_220_3 \nPlots without matches will NOT be dropped when the two dataframes are merged.\nNA values will be filled in as needed for a full merge.')

})


test_that("Weights dataframe handling works", {

  expect_error(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                   cwd_data_check = g_strs_cwd_m,
                                   design_check = "STRS",
                                   wt_data_check = b_strs_wh_9,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type3"),
               'combined fwd_cwd_data and wt_data did not completely match!\nThese strata are in combined fwd_cwd_data but do not have a match in wt_data: SEKI_2 \nThese strata are in wt_data but do not have a match in combined fwd_cwd_data: SEKI_3')

  expect_error(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                   cwd_data_check = "none",
                                   design_check = "STRS",
                                   wt_data_check = b_strs_wh_9,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type1"),
               'fwd_data and wt_data did not completely match!\nThese strata are in fwd_data but do not have a match in wt_data: SEKI_2 \nThese strata are in wt_data but do not have a match in fwd_data: SEKI_3')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = g_strs_cwd_m,
                                   design_check = "STRS",
                                   wt_data_check = b_strs_wh_9,
                                   fpc_data_check = "not_needed",
                                   unit_check = "metric",
                                   type_check = "type2"),
               'cwd_data and wt_data did not completely match!\nThese strata are in cwd_data but do not have a match in wt_data: SEKI_2 \nThese strata are in wt_data but do not have a match in cwd_data: SEKI_3')

})


test_that("FPC dataframe handling works", {

  expect_error(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                   cwd_data_check = g_strs_cwd_m,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = b_strs_fpc_13,
                                   unit_check = "metric",
                                   type_check = "type3"),
               'combined fwd_cwd_data and fpc_data did not completely match!\nIn combined fwd_cwd_data but does not have a match in fpc_data: SEKI_2 \nIn fpc_data but does not have a match in combined fwd_cwd_data: SEKI_3')

  expect_error(ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                   cwd_data_check = "none",
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = b_strs_fpc_13,
                                   unit_check = "metric",
                                   type_check = "type1"),
               'fwd_data and fpc_data did not completely match!\nIn fwd_data but does not have a match in fpc_data: SEKI_2 \nIn fpc_data but does not have a match in fwd_data: SEKI_3')

  expect_error(ValidateSurfaceData(fwd_data_check = "none",
                                   cwd_data_check = g_strs_cwd_m,
                                   design_check = "STRS",
                                   wt_data_check = g_strs_wh_1,
                                   fpc_data_check = b_strs_fpc_13,
                                   unit_check = "metric",
                                   type_check = "type2"),
               'cwd_data and fpc_data did not completely match!\nIn cwd_data but does not have a match in fpc_data: SEKI_2 \nIn fpc_data but does not have a match in cwd_data: SEKI_3')

})


test_that("Final column classes are as expected", {

  # STRS ------------------------------------------------
  strs_fwd_trial <- ValidateSurfaceData(fwd_data_check = g_strs_fwd_m,
                                        cwd_data_check = "none",
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type1")

  expect_equal(class(strs_fwd_trial$stratum), "character")

  strs_cwd_trial <- ValidateSurfaceData(fwd_data_check = "none",
                                        cwd_data_check = g_strs_cwd_m,
                                        design_check = "STRS",
                                        wt_data_check = g_strs_wh_1,
                                        fpc_data_check = "not_needed",
                                        unit_check = "metric",
                                        type_check = "type2")

  expect_equal(class(strs_cwd_trial$stratum), "character")

  # SRS -------------------------------------------------
  srs_fwd_trial <- ValidateSurfaceData(fwd_data_check = g_srs_fwd_m_class,
                                       cwd_data_check = "none",
                                       design_check = "SRS",
                                       wt_data_check = "not_needed",
                                       fpc_data_check = "not_needed",
                                       unit_check = "metric",
                                       type_check = "type1")

  expect_equal(class(srs_fwd_trial$time), "character")
  expect_equal(class(srs_fwd_trial$site), "character")
  expect_equal(class(srs_fwd_trial$plot), "character")

  srs_cwd_trial <- ValidateSurfaceData(fwd_data_check = "none",
                                       cwd_data_check = g_srs_cwd_m_class,
                                       design_check = "SRS",
                                       wt_data_check = "not_needed",
                                       fpc_data_check = "not_needed",
                                       unit_check = "metric",
                                       type_check = "type2")

  expect_equal(class(srs_cwd_trial$time), "character")
  expect_equal(class(srs_cwd_trial$site), "character")
  expect_equal(class(srs_cwd_trial$plot), "character")

  # FFS -------------------------------------------------
  ffs_fwd_trial <- ValidateSurfaceData(fwd_data_check = g_ffs_fwd_m_class,
                                       cwd_data_check = "none",
                                       design_check = "FFS",
                                       wt_data_check = "not_needed",
                                       fpc_data_check = "not_needed",
                                       unit_check = "metric",
                                       type_check = "type1")

  expect_equal(class(ffs_fwd_trial$trt_type), "character")

  ffs_cwd_trial <- ValidateSurfaceData(fwd_data_check = "none",
                                       cwd_data_check = g_ffs_cwd_m_class,
                                       design_check = "FFS",
                                       wt_data_check = "not_needed",
                                       fpc_data_check = "not_needed",
                                       unit_check = "metric",
                                       type_check = "type2")

  expect_equal(class(ffs_cwd_trial$trt_type), "character")

})


test_that("Final columns are as expected", {

  type1_m_trial <- ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                       cwd_data_check = "none",
                                       design_check = "SRS",
                                       wt_data_check = "not_needed",
                                       fpc_data_check = "not_needed",
                                       unit_check = "metric",
                                       type_check = "type1")

  expect_equal(names(type1_m_trial), c("time", "site", "plot", "load_1h", "load_10h", "load_100h", "load_fwd_Mg_ha", "sc_length_1h", "sc_length_10h", "sc_length_100h"))

  type1_i_trial <- ValidateSurfaceData(fwd_data_check = g_srs_fwd_i,
                                       cwd_data_check = "none",
                                       design_check = "SRS",
                                       wt_data_check = "not_needed",
                                       fpc_data_check = "not_needed",
                                       unit_check = "imperial",
                                       type_check = "type1")

  expect_equal(names(type1_i_trial), c("time", "site", "plot", "load_1h", "load_10h", "load_100h", "load_fwd_ton_ac", "sc_length_1h", "sc_length_10h", "sc_length_100h"))

  type2_m_trial <- ValidateSurfaceData(fwd_data_check = "none",
                                       cwd_data_check = g_srs_cwd_m,
                                       design_check = "SRS",
                                       wt_data_check = "not_needed",
                                       fpc_data_check = "not_needed",
                                       unit_check = "metric",
                                       type_check = "type2")

  expect_equal(names(type2_m_trial), c("time", "site", "plot", "load_1000s_Mg_ha", "load_1000r_Mg_ha", "load_1000h", "sc_length_1000s", "sc_length_1000r", "sc_length_1000h"))

  type2_i_trial <- ValidateSurfaceData(fwd_data_check = "none",
                                       cwd_data_check = g_srs_cwd_i,
                                       design_check = "SRS",
                                       wt_data_check = "not_needed",
                                       fpc_data_check = "not_needed",
                                       unit_check = "imperial",
                                       type_check = "type2")

  expect_equal(names(type2_i_trial), c("time", "site", "plot", "load_1000s_ton_ac", "load_1000r_ton_ac", "load_1000h", "sc_length_1000s", "sc_length_1000r", "sc_length_1000h"))

  type3_m_trial <- ValidateSurfaceData(fwd_data_check = g_srs_fwd_m,
                                       cwd_data_check = g_srs_cwd_m,
                                       design_check = "SRS",
                                       wt_data_check = "not_needed",
                                       fpc_data_check = "not_needed",
                                       unit_check = "metric",
                                       type_check = "type3")

  expect_equal(names(type3_m_trial), c("time", "site", "plot", "load_1h", "load_10h", "load_100h", "load_fwd_Mg_ha", "sc_length_1h", "sc_length_10h", "sc_length_100h",
                                       "load_1000s_Mg_ha", "load_1000r_Mg_ha", "load_1000h", "sc_length_1000s", "sc_length_1000r", "sc_length_1000h"))

  type3_i_trial <- ValidateSurfaceData(fwd_data_check = g_srs_fwd_i,
                                       cwd_data_check = g_srs_cwd_i,
                                       design_check = "SRS",
                                       wt_data_check = "not_needed",
                                       fpc_data_check = "not_needed",
                                       unit_check = "imperial",
                                       type_check = "type3")

  expect_equal(names(type3_i_trial), c("time", "site", "plot", "load_1h", "load_10h", "load_100h", "load_fwd_ton_ac", "sc_length_1h", "sc_length_10h", "sc_length_100h",
                                       "load_1000s_ton_ac", "load_1000r_ton_ac", "load_1000h", "sc_length_1000s", "sc_length_1000r", "sc_length_1000h"))

})

