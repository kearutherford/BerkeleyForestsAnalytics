
fuel_test <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "120", "90", "120", "90", "120", "20", "120"),
  count_1h = c(12, 30, 10, 2, 5, 14, 9, 6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(15,15,15,15,15,15,15,15),
  slope = c(10,20,15,5,10,20,15,5)
)


tree_test <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("QUKE", NA, "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)



ValidateOverstory <- function(tree_data_val, sp_codes_val) {

  # coerce tibble inputs into data.frame
  tree_data_val <- as.data.frame(tree_data_val)


  ###########################################################
  # Check that all columns are in the provided dataframe
  ###########################################################

  necessary_columns = c("time", "site", "plot", "exp_factor", "species", "dbh")

  if(!all(is.element(necessary_columns, names(tree_data_val)))) {

    stop('tree_data is missing necessary columns!\n',
         'tree_data must include: time, site, plot, exp_factor, species, and dbh')

  }


  ###########################################################
  # Check that column classes are as expected
  ###########################################################

  if(!is.numeric(tree_data_val$dbh)) {
    stop('For tree_data, the parameter dbh requires a numerical variable.\n',
         'You have input a variable of class: ', class(tree_data_val$dbh))
  }

  if(!is.numeric(tree_data_val$exp_factor)) {
    stop('For tree_data, the parameter exp_factor requires a numerical variable.\n',
         'You have input a variable of class: ', class(tree_data_val$exp_factor))
  }


  ###########################################################
  # Check that dbh and expansion factor ranges are as expected
  ###########################################################

  if(any(tree_data_val$dbh < 0, na.rm = TRUE)) {

    stop('In tree_data there are trees with negative dbh values.\n',
         'Trees cannot have negative dbh.')
  }

  if(any(tree_data_val$exp_factor < 0, na.rm = TRUE)) {

    stop('In tree_data there are observations with negative exp_factor values.\n',
         'Expansion factors cannot be negative.')
  }


  ###########################################################
  # Check that options are set appropriately
  ###########################################################

  if(sp_codes_val == "4letter" || sp_codes_val == "fia") {
    # do nothing
  } else {
    stop('The "sp_codes" parameter must be set to either "4letter" or "fia."')
  }


  ###########################################################
  # Check for NAs
  ###########################################################

  if ('TRUE' %in% is.na(tree_data_val$time)) {
    stop('For tree_data, there are missing values in the time column.')
  }

  if ('TRUE' %in% is.na(tree_data_val$site)) {
    stop('For tree_data, there are missing values in the site column.')
  }

  if ('TRUE' %in% is.na(tree_data_val$plot)) {
    stop('For tree_data, there are missing values in the plot column.')
  }

  if ('TRUE' %in% is.na(tree_data_val$exp_factor)) {
    stop('For tree_data, there are missing values in the exp_factor column.')
  }

  if ('TRUE' %in% is.na(tree_data_val$dbh)) {

    warning('For tree_data, there are missing vlaues in the dbh column.\n',
            'Trees with NA dbh will not be used in the calculations.\n',
            'Consider addressing these missing values in your data.\n',
            ' \n')
  }


  ###########################################################
  # Check that species codes are as expected
  ###########################################################

  tree_data_val$species <- as.character(tree_data_val$species) # coerce species into character

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(tree_data_val$species)) {

    warning('There are missing species codes in the provided tree_data dataframe.\n',
            'Trees with NA species codes will be assigned "UNTR" for unknown tree\n',
            'and will receive generic coefficients.\n',
            ' \n')
  }

  # Check for unrecognized species codes ---------------------------------------
  if (sp_codes_val == "4letter") {

    if(!all(is.element(tree_data_val$species,
                       VanWag_species$letter))) {

      unrecognized_sp <- sort(paste0(unique(tree_data_val[!is.element(tree_data_val$species,
                                                                      VanWag_species$letter), "species"]),
                                     sep = " "))

      warning('Not all species codes were recognized! Unrecognized codes were converted to "UNTR" for unknown tree\n',
              'and will receive generic coefficients. Unrecognized codes: ', unrecognized_sp, ' \n')
    }

    # map the missing and unrecognized species to 'UNTR'
    tree_data_val[!is.element(tree_data_val$species,
                              VanWag_species$letter), "species"] = 'UNTR'

    tree_data_val[is.na(tree_data_val$species), "species"] = 'UNTR'

  } else if (sp_codes_val == "fia") {

    if(!all(is.element(tree_data_val$species,
                       VanWag_species$fia))) {

      unrecognized_sp <- sort(paste0(unique(tree_data_val[!is.element(tree_data_val$species,
                                                                      VanWag_species$fia), "species"]),
                                     sep = " "))

      warning('Not all species codes were recognized! Unrecognized codes were converted to "999" for unknown tree\n',
              'and will receive generic coefficients. Unrecognized codes: ', unrecognized_sp, ' \n')
    }

    # map the missing and unrecognized species to '999'
    tree_data_val[!is.element(tree_data_val$species,
                              VanWag_species$fia), "species"] = '999'

    tree_data_val[is.na(tree_data_val$species), "species"] = '999'

  }


  ###########################################################
  # Final dataframe prep
  ###########################################################

  tree_data_val$time <- as.character(tree_data_val$time)
  tree_data_val$site <- as.character(tree_data_val$site)
  tree_data_val$plot <- as.character(tree_data_val$plot)

  tree_data_return <- subset(tree_data_val, select = c(time, site, plot, exp_factor, species, dbh))

  return(tree_data_return)

}


ValidateMatches <- function(tree_match, fuel_match) {

  tree_match$obs_id <- NA
  n <- nrow(tree_match)

  for(i in 1:n) {

    t <- tree_match$time[i]
    s <- tree_match$site[i]
    p <- tree_match$plot[i]

    tree_match$obs_id[i] <- paste0(t,'-',s,'-',p)

  }


  fuel_match$obs_id <- NA
  n <- nrow(fuel_match)

  for(i in 1:n) {

    t <- fuel_match$time[i]
    s <- fuel_match$site[i]
    p <- fuel_match$plot[i]

    fuel_match$obs_id[i] <- paste0(t,'-',s,'-',p)

  }

  if(!all(is.element(tree_match$obs_id,fuel_match$obs_id)) ||
     !all(is.element(fuel_match$obs_id,tree_match$obs_id))) {

    trees_wo_fuels <- paste0(unique(tree_match[!is.element(tree_match$obs_id,fuel_match$obs_id), "obs_id"]), sep = " ")
    fuels_wo_trees <- paste0(unique(fuel_match[!is.element(fuel_match$obs_id,tree_match$obs_id), "obs_id"]), sep = " ")

    stop('Tree and fuel data did not completedly match!\n',
         'These time:site:plot combinations have tree data, but no fuel data: ', trees_wo_fuels, ' \n',
         'These time:site:plot combinations have fuel data, but no tree data: ', fuels_wo_trees)

  }

}


TreeDom <- function(data, tree_units) {

  fill_df <- data.frame(matrix(nrow = 0, ncol = 5))
  colnames(fill_df) <- c("time", "site", "plot", "species", "perc_BA")

  if (tree_units == "metric") {
    data$ba_tree <- (pi*((data$dbh^2)/40000))
  } else if (tree_units == "imperial") {
    data$ba_tree <- (pi*((data$dbh^2)/576))
  }

  data$ba_area <- data$ba_tree*data$exp_factor

  period <- unique(data$time)

  for(pd in period) {

    all_forests <- subset(data, time == pd)
    forest_ids <- unique(all_forests$site)

    for(f in forest_ids) {

      all_plots <- subset(all_forests, site == f)
      plot_ids <- unique(all_plots$plot)

      for(p in plot_ids) {

        all_trees <- subset(all_plots, plot == p)

        total_ba <- sum(all_trees$ba_area, na.rm = TRUE)
        species_ids <- unique(all_trees$species)

        for(sp in species_ids) {

          fill_df[nrow(fill_df) + 1, ] <- NA
          k <- nrow(fill_df)

          single_sp <- subset(all_trees, species == sp)
          sum_sp_ba <- sum(single_sp$ba_area, na.rm = TRUE)

          fill_df$time[k] <- pd
          fill_df$site[k] <- f
          fill_df$plot[k] <- p
          fill_df$species[k] <- sp
          fill_df$perc_BA[k] <- sum_sp_ba/total_ba

        }

      }

    }

  }

  return(fill_df)

}


FWD_coef <- function(fwd_tree_data, fwd_units, fwd_sp_codes) {

  # calculate proportion of time:site:plot basal area occupied by each species
  tree_dom <- TreeDom(data = fwd_tree_data,
                      tree_units = fwd_units)

  # create columns to fill
  tree_dom$qmd_1h <- NA
  tree_dom$qmd_10h <- NA
  tree_dom$qmd_100h <- NA

  tree_dom$sec_1h <- NA
  tree_dom$sec_10h <- NA
  tree_dom$sec_100h <- NA

  tree_dom$sg_1h <- NA
  tree_dom$sg_10h <- NA
  tree_dom$sg_100h <- NA

  n <- nrow(tree_dom)

  # loop through each row
  for(i in 1:n) {

    sp <- tree_dom$species[i]

    if(fwd_sp_codes == "4letter") {

      tree_dom$qmd_1h[i] <- QMD_table[QMD_table$letter == sp, "qmd_1h"]
      tree_dom$qmd_10h[i] <- QMD_table[QMD_table$letter == sp, "qmd_10h"]
      tree_dom$qmd_100h[i] <- QMD_table[QMD_table$letter == sp, "qmd_100h"]

      tree_dom$sec_1h[i] <- SEC_table[SEC_table$letter == sp, "sec_1h"]
      tree_dom$sec_10h[i] <- SEC_table[SEC_table$letter == sp, "sec_10h"]
      tree_dom$sec_100h[i] <- SEC_table[SEC_table$letter == sp, "sec_100h"]

      tree_dom$sg_1h[i] <- SG_table[SG_table$letter == sp, "sg_1h"]
      tree_dom$sg_10h[i] <- SG_table[SG_table$letter == sp, "sg_10h"]
      tree_dom$sg_100h[i] <- SG_table[SG_table$letter == sp, "sg_100h"]

    } else {

      tree_dom$qmd_1h[i] <- QMD_table[QMD_table$fia == sp, "qmd_1h"]
      tree_dom$qmd_10h[i] <- QMD_table[QMD_table$fia == sp, "qmd_10h"]
      tree_dom$qmd_100h[i] <- QMD_table[QMD_table$fia == sp, "qmd_100h"]

      tree_dom$sec_1h[i] <- SEC_table[SEC_table$fia == sp, "sec_1h"]
      tree_dom$sec_10h[i] <- SEC_table[SEC_table$fia == sp, "sec_10h"]
      tree_dom$sec_100h[i] <- SEC_table[SEC_table$fia == sp, "sec_100h"]

      tree_dom$sg_1h[i] <- SG_table[SG_table$fia == sp, "sg_1h"]
      tree_dom$sg_10h[i] <- SG_table[SG_table$fia == sp, "sg_10h"]
      tree_dom$sg_100h[i] <- SG_table[SG_table$fia == sp, "sg_100h"]

    }

  }

  tree_dom$qmd_1h_wt <- tree_dom$qmd_1h*tree_dom$perc_BA
  tree_dom$qmd_10h_wt <- tree_dom$qmd_10h*tree_dom$perc_BA
  tree_dom$qmd_100h_wt <- tree_dom$qmd_100h*tree_dom$perc_BA

  tree_dom$sec_1h_wt <- tree_dom$sec_1h*tree_dom$perc_BA
  tree_dom$sec_10h_wt <- tree_dom$sec_10h*tree_dom$perc_BA
  tree_dom$sec_100h_wt <- tree_dom$sec_100h*tree_dom$perc_BA

  tree_dom$sg_1h_wt <- tree_dom$sg_1h*tree_dom$perc_BA
  tree_dom$sg_10h_wt <- tree_dom$sg_10h*tree_dom$perc_BA
  tree_dom$sg_100h_wt <- tree_dom$sg_100h*tree_dom$perc_BA

  tree_subset <- subset(tree_dom, select = c(time, site, plot,
                                             qmd_1h_wt, qmd_10h_wt, qmd_100h_wt,
                                             sec_1h_wt, sec_10h_wt, sec_100h_wt,
                                             sg_1h_wt, sg_10h_wt, sg_100h_wt))

  tree_ag <- aggregate(data = tree_subset,
                       . ~ time + site + plot,
                       FUN = sum)

  tree_ag$coef_1h <- tree_ag$qmd_1h_wt*tree_ag$sec_1h_wt*tree_ag$sg_1h_wt
  tree_ag$coef_10h <- tree_ag$qmd_10h_wt*tree_ag$sec_10h_wt*tree_ag$sg_10h_wt
  tree_ag$coef_100h <- tree_ag$qmd_100h_wt*tree_ag$sec_100h_wt*tree_ag$sg_100h_wt

  tree_return <- subset(tree_ag, select = c(time, site, plot, coef_1h, coef_10h, coef_100h))

  return(tree_return)

}


FWD_loads <- function(fwd_fuel_data, fwd_tree_data, fwd_units, fwd_sp_codes) {

  # get BA-weighted QMD, SEC, and SG
  coef_calcs <- FWD_coef(fwd_tree_data = fwd_tree_data, fwd_units = fwd_units, fwd_sp_codes = fwd_sp_codes)

  # loop through each row (a transect in a time:site:plot)
  # and assign the BA-weighted QMD*SEC*SG value

  n <- nrow(fwd_fuel_data)

  fwd_fuel_data$coef_1h <- NA
  fwd_fuel_data$coef_10h <- NA
  fwd_fuel_data$coef_100h <- NA

  for(i in 1:n) {

    fwd_fuel_data$coef_1h[i] <- coef_calcs[coef_calcs$time == fwd_fuel_data$time[i] & coef_calcs$site == fwd_fuel_data$site[i] & coef_calcs$plot == fwd_fuel_data$plot[i], "coef_1h"]
    fwd_fuel_data$coef_10h[i] <- coef_calcs[coef_calcs$time == fwd_fuel_data$time[i] & coef_calcs$site == fwd_fuel_data$site[i] & coef_calcs$plot == fwd_fuel_data$plot[i], "coef_10h"]
    fwd_fuel_data$coef_100h[i] <- coef_calcs[coef_calcs$time == fwd_fuel_data$time[i] & coef_calcs$site == fwd_fuel_data$site[i] & coef_calcs$plot == fwd_fuel_data$plot[i], "coef_100h"]

  }

  # slope correction factor
  fwd_fuel_data$slp_c <- sqrt(1 + ((fwd_fuel_data$slope/100)^2))

  # constant k
  k <- 1.234

  # fuel load calculations
  fwd_fuel_data$load_1h_Mg_ha <- (fwd_fuel_data$coef_1h*fwd_fuel_data$slp_c*fwd_fuel_data$count_1h*k)/fwd_fuel_data$length_1h
  fwd_fuel_data$load_10h_Mg_ha <- (fwd_fuel_data$coef_10h*fwd_fuel_data$slp_c*fwd_fuel_data$count_10h*k)/fwd_fuel_data$length_10h
  fwd_fuel_data$load_100h_Mg_ha <- (fwd_fuel_data$coef_100h*fwd_fuel_data$slp_c*fwd_fuel_data$count_100h*k)/fwd_fuel_data$length_100h

  fwd_subset <- subset(fwd_fuel_data, select = c(time, site, plot, load_1h_Mg_ha, load_10h_Mg_ha, load_100h_Mg_ha))

  fwd_ag <- aggregate(data = fwd_subset,
                       . ~ time + site + plot,
                       FUN = mean, na.rm = TRUE)

  fwd_ag$load_fwd_Mg_ha <- fwd_ag$load_1h_Mg_ha + fwd_ag$load_10h_Mg_ha + fwd_ag$load_100h_Mg_ha


  if(fwd_units == "metric") {

    return(fwd_ag)

  } else {

    fwd_ag$load_1h_ton_ac <- fwd_ag$load_1h_Mg_ha*0.44609
    fwd_ag$load_10h_ton_ac <- fwd_ag$load_10h_Mg_ha*0.44609
    fwd_ag$load_100h_ton_ac <- fwd_ag$load_100h_Mg_ha*0.44609
    fwd_ag$load_fwd_ton_ac <- fwd_ag$load_fwd_Mg_ha*0.44609

    fwd_imperial <- subset(fwd_ag, select = c(time, site, plot, load_1h_ton_ac, load_10h_ton_ac, load_100h_ton_ac, load_fwd_ton_ac))

    return(fwd_imperial)

  }

}

FWD_loads(fuel_test, tree_test, "metric", "4letter")







