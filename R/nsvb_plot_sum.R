
################################################################################
################################################################################
# SumBy function
################################################################################
################################################################################

SumBy <- function(sum_data, sum_units, sum_by) {

  # convert to Mg/ha
  if(sum_units == "metric") {

    sum_data$total_wood <- (sum_data$total_wood_kg/1000)*sum_data$exp_factor
    sum_data$total_bark <- (sum_data$total_bark_kg/1000)*sum_data$exp_factor
    sum_data$total_branch <- (sum_data$total_branch_kg/1000)*sum_data$exp_factor
    sum_data$total_ag <- (sum_data$total_ag_kg/1000)*sum_data$exp_factor
    sum_data$merch_total <- (sum_data$merch_total_kg/1000)*sum_data$exp_factor
    sum_data$merch_top <- (sum_data$merch_top_kg/1000)*sum_data$exp_factor
    sum_data$stump_total <- (sum_data$stump_total_kg/1000)*sum_data$exp_factor
    sum_data$foliage <- (sum_data$foliage_kg/1000)*sum_data$exp_factor

    sum_data$total_woodC <- (sum_data$total_wood_c/1000)*sum_data$exp_factor
    sum_data$total_barkC <- (sum_data$total_bark_c/1000)*sum_data$exp_factor
    sum_data$total_branchC <- (sum_data$total_branch_c/1000)*sum_data$exp_factor
    sum_data$total_agC <- (sum_data$total_ag_c/1000)*sum_data$exp_factor
    sum_data$merch_totalC <- (sum_data$merch_total_c/1000)*sum_data$exp_factor
    sum_data$merch_topC <- (sum_data$merch_top_c/1000)*sum_data$exp_factor
    sum_data$stump_totalC <- (sum_data$stump_total_c/1000)*sum_data$exp_factor
    sum_data$foliageC <- (sum_data$foliage_c/1000)*sum_data$exp_factor

    # convert to t/ac
  } else if (sum_units == "imperial") {

    sum_data$total_wood <- sum_data$total_wood_tons*sum_data$exp_factor
    sum_data$total_bark <- sum_data$total_bark_tons*sum_data$exp_factor
    sum_data$total_branch <- sum_data$total_branch_tons*sum_data$exp_factor
    sum_data$total_ag <- sum_data$total_ag_tons*sum_data$exp_factor
    sum_data$merch_total <- sum_data$merch_total_tons*sum_data$exp_factor
    sum_data$merch_top <- sum_data$merch_top_tons*sum_data$exp_factor
    sum_data$stump_total <- sum_data$stump_total_tons*sum_data$exp_factor
    sum_data$foliage <- sum_data$foliage_tons*sum_data$exp_factor

    sum_data$total_woodC <- sum_data$total_wood_c*sum_data$exp_factor
    sum_data$total_barkC <- sum_data$total_bark_c*sum_data$exp_factor
    sum_data$total_branchC <- sum_data$total_branch_c*sum_data$exp_factor
    sum_data$total_agC <- sum_data$total_ag_c*sum_data$exp_factor
    sum_data$merch_totalC <- sum_data$merch_total_c*sum_data$exp_factor
    sum_data$merch_topC <- sum_data$merch_top_c*sum_data$exp_factor
    sum_data$stump_totalC <- sum_data$stump_total_c*sum_data$exp_factor
    sum_data$foliageC <- sum_data$foliage_c*sum_data$exp_factor

  }

  # route to the appropriate summary function
  if(sum_by == "by_plot") {

    output <- ByPlot(sum_data, sum_units)

  } else if(sum_by == "by_status") {

    output <- ByStatus(sum_data, sum_units)

  } else if(sum_by == "by_species") {

    output <- BySpecies(sum_data, sum_units)

  } else if(sum_by == "by_sp_st") {

    output <- BySpSt(sum_data, sum_units)

  }

  return(output)

}


################################################################################
################################################################################
# BySpSt function
################################################################################
################################################################################

BySpSt <- function(data, out_units) {

  # create empty dataframe to fill
  fill_df <- data.frame(matrix(nrow = 0, ncol = 33))
  colnames(fill_df) <- c("site", "plot", "species",
                         "total_wood_L", "total_wood_D", "total_bark_L", "total_bark_D", "total_branch_L", "total_branch_D", "total_ag_L", "total_ag_D",
                         "merch_total_L", "merch_total_D", "merch_top_L", "merch_top_D", "stump_total_L", "stump_total_D", "foliage_L",
                         "total_wood_LC", "total_wood_DC", "total_bark_LC", "total_bark_DC", "total_branch_LC", "total_branch_DC", "total_ag_LC", "total_ag_DC",
                         "merch_total_LC", "merch_total_DC", "merch_top_LC", "merch_top_DC", "stump_total_LC", "stump_total_DC", "foliage_LC")

  # get list of species
  sp_list_data <- subset(data, !is.na(species))
  sp_list <- unique(sp_list_data$species)

  # loop through each site, plot, and species
  forests <- unique(data$site)

  for(f in forests) {

    all_plots <- subset(data, site == f)
    plot_ids <- unique(all_plots$plot)

    for(p in plot_ids) {

      all_trees <- subset(all_plots, plot == p)
      sum_stems <- sum(all_trees$exp_factor)
      alert <- all(all_trees$calc_bio == "N")

      # if there are no trees in the plot
      if(sum_stems == 0) {

        temp_df <- data.frame(site = f, plot = p, species = sp_list,
                              total_wood_L = 0, total_wood_D = 0, total_bark_L = 0, total_bark_D = 0, total_branch_L = 0, total_branch_D = 0, total_ag_L = 0, total_ag_D = 0,
                              merch_total_L = 0, merch_total_D = 0, merch_top_L = 0, merch_top_D = 0, stump_total_L = 0, stump_total_D = 0, foliage_L = 0,
                              total_wood_LC = 0, total_wood_DC = 0, total_bark_LC = 0, total_bark_DC = 0, total_branch_LC = 0, total_branch_DC = 0, total_ag_LC = 0, total_ag_DC = 0,
                              merch_total_LC = 0, merch_total_DC = 0, merch_top_LC = 0, merch_top_DC = 0, stump_total_LC = 0, stump_total_DC = 0, foliage_LC = 0)

        # if there are trees in the plot, but all had NA biomass estimates due to missing data
      } else if (sum_stems > 0 & alert == "TRUE") {

        temp_df <- data.frame(site = f, plot = p, species = sp_list,
                              total_wood_L = NA, total_wood_D = NA, total_bark_L = NA, total_bark_D = NA, total_branch_L = NA, total_branch_D = NA, total_ag_L = NA, total_ag_D = NA,
                              merch_total_L = NA, merch_total_D = NA, merch_top_L = NA, merch_top_D = NA, stump_total_L = NA, stump_total_D = NA, foliage_L = NA,
                              total_wood_LC = NA, total_wood_DC = NA, total_bark_LC = NA, total_bark_DC = NA, total_branch_LC = NA, total_branch_DC = NA, total_ag_LC = NA, total_ag_DC = NA,
                              merch_total_LC = NA, merch_total_DC = NA, merch_top_LC = NA, merch_top_DC = NA, stump_total_LC = NA, stump_total_DC = NA, foliage_LC = NA)

        # there are trees in the plot, and not all had NA biomass estimates
      } else if (sum_stems > 0 & alert == "FALSE") {

        temp_df <- data.frame(site = f, plot = p, species = sp_list,
                              total_wood_L = 0, total_wood_D = 0, total_bark_L = 0, total_bark_D = 0, total_branch_L = 0, total_branch_D = 0, total_ag_L = 0, total_ag_D = 0,
                              merch_total_L = 0, merch_total_D = 0, merch_top_L = 0, merch_top_D = 0, stump_total_L = 0, stump_total_D = 0, foliage_L = 0,
                              total_wood_LC = 0, total_wood_DC = 0, total_bark_LC = 0, total_bark_DC = 0, total_branch_LC = 0, total_branch_DC = 0, total_ag_LC = 0, total_ag_DC = 0,
                              merch_total_LC = 0, merch_total_DC = 0, merch_top_LC = 0, merch_top_DC = 0, stump_total_LC = 0, stump_total_DC = 0, foliage_LC = 0)

        all_trees <- subset(all_trees, !is.na(species))
        species_ids <- unique(all_trees$species)

        for(sp in species_ids) {

          single_sp_L <- subset(all_trees, species == sp & status == "1")
          single_sp_D <- subset(all_trees, species == sp & status == "0")

          temp_df[temp_df$species == sp, "total_wood_L"] <- round(sum(single_sp_L$total_wood, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_wood_D"] <- round(sum(single_sp_D$total_wood, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_bark_L"] <- round(sum(single_sp_L$total_bark, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_bark_D"] <- round(sum(single_sp_D$total_bark, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_branch_L"] <- round(sum(single_sp_L$total_branch, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_branch_D"] <- round(sum(single_sp_D$total_branch, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_ag_L"] <- round(sum(single_sp_L$total_ag, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_ag_D"] <- round(sum(single_sp_D$total_ag, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "merch_total_L"] <- round(sum(single_sp_L$merch_total, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "merch_total_D"] <- round(sum(single_sp_D$merch_total, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "merch_top_L"] <- round(sum(single_sp_L$merch_top, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "merch_top_D"] <- round(sum(single_sp_D$merch_top, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "stump_total_L"] <- round(sum(single_sp_L$stump_total, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "stump_total_D"] <- round(sum(single_sp_D$stump_total, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "foliage_L"] <- round(sum(single_sp_L$foliage, na.rm = TRUE),5)

          temp_df[temp_df$species == sp, "total_wood_LC"] <- round(sum(single_sp_L$total_woodC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_wood_DC"] <- round(sum(single_sp_D$total_woodC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_bark_LC"] <- round(sum(single_sp_L$total_barkC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_bark_DC"] <- round(sum(single_sp_D$total_barkC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_branch_LC"] <- round(sum(single_sp_L$total_branchC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_branch_DC"] <- round(sum(single_sp_D$total_branchC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_ag_LC"] <- round(sum(single_sp_L$total_agC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_ag_DC"] <- round(sum(single_sp_D$total_agC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "merch_total_LC"] <- round(sum(single_sp_L$merch_totalC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "merch_total_DC"] <- round(sum(single_sp_D$merch_totalC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "merch_top_LC"] <- round(sum(single_sp_L$merch_topC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "merch_top_DC"] <- round(sum(single_sp_D$merch_topC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "stump_total_LC"] <- round(sum(single_sp_L$stump_totalC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "stump_total_DC"] <- round(sum(single_sp_D$stump_totalC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "foliage_LC"] <- round(sum(single_sp_L$foliageC, na.rm = TRUE),5)

        }

      }

      fill_df <- rbind(fill_df, temp_df)

    }

  }

  # rename columns, so that units are clear to users
  if(out_units == "metric") {

    colnames(fill_df) <- c("site", "plot", "species", "total_wood_L_Mg_ha", "total_wood_D_Mg_ha", "total_bark_L_Mg_ha", "total_bark_D_Mg_ha", "total_branch_L_Mg_ha", "total_branch_D_Mg_ha",
                           "total_ag_L_Mg_ha", "total_ag_D_Mg_ha", "merch_total_L_Mg_ha", "merch_total_D_Mg_ha", "merch_top_L_Mg_ha", "merch_top_D_Mg_ha", "stump_total_L_Mg_ha", "stump_total_D_Mg_ha",
                           "foliage_L_Mg_ha", "total_wood_L_c", "total_wood_D_c", "total_bark_L_c", "total_bark_D_c", "total_branch_L_c", "total_branch_D_c", "total_ag_L_c", "total_ag_D_c",
                           "merch_total_L_c", "merch_total_D_c", "merch_top_L_c", "merch_top_D_c", "stump_total_L_c", "stump_total_D_c", "foliage_L_c")

  } else if (out_units == "imperial") {

    colnames(fill_df) <- c("site", "plot", "species", "total_wood_L_t_ac", "total_wood_D_t_ac", "total_bark_L_t_ac", "total_bark_D_t_ac", "total_branch_L_t_ac", "total_branch_D_t_ac",
                           "total_ag_L_t_ac", "total_ag_D_t_ac", "merch_total_L_t_ac", "merch_total_D_t_ac", "merch_top_L_t_ac", "merch_top_D_t_ac", "stump_total_L_t_ac", "stump_total_D_t_ac",
                           "foliage_L_t_ac", "total_wood_L_c", "total_wood_D_c", "total_bark_L_c", "total_bark_D_c", "total_branch_L_c", "total_branch_D_c", "total_ag_L_c", "total_ag_D_c",
                           "merch_total_L_c", "merch_total_D_c", "merch_top_L_c", "merch_top_D_c", "stump_total_L_c", "stump_total_D_c", "foliage_L_c")

  }

  return(fill_df)

}


################################################################################
################################################################################
# BySpecies function
################################################################################
################################################################################

BySpecies <- function(data, out_units) {

  # create empty dataframe to fill
  fill_df <- data.frame(matrix(nrow = 0, ncol = 19))
  colnames(fill_df) <- c("site", "plot", "species",
                         "total_wood", "total_bark", "total_branch", "total_ag", "merch_total", "merch_top", "stump_total", "foliage",
                         "total_wood_C", "total_bark_C", "total_branch_C", "total_ag_C", "merch_total_C", "merch_top_C", "stump_total_C", "foliage_C")

  # get list of species
  sp_list_data <- subset(data, !is.na(species))
  sp_list <- unique(sp_list_data$species)

  # loop through each site, plot, and species
  forests <- unique(data$site)

  for(f in forests) {

    all_plots <- subset(data, site == f)
    plot_ids <- unique(all_plots$plot)

    for(p in plot_ids) {

      all_trees <- subset(all_plots, plot == p)
      sum_stems <- sum(all_trees$exp_factor)
      alert <- all(all_trees$calc_bio == "N")

      # if there are no trees in the plot
      if(sum_stems == 0) {

        temp_df <- data.frame(site = f, plot = p, species = sp_list,
                              total_wood = 0, total_bark = 0, total_branch = 0, total_ag = 0, merch_total = 0, merch_top = 0, stump_total = 0, foliage = 0,
                              total_wood_C = 0, total_bark_C = 0, total_branch_C = 0, total_ag_C = 0, merch_total_C = 0, merch_top_C = 0, stump_total_C = 0, foliage_C = 0)

        # if there are trees in the plot, but all had NA biomass estimates due to missing data
      } else if (sum_stems > 0 & alert == "TRUE") {

        temp_df <- data.frame(site = f, plot = p, species = sp_list,
                              total_wood = NA, total_bark = NA, total_branch = NA, total_ag = NA, merch_total = NA, merch_top = NA, stump_total = NA, foliage = NA,
                              total_wood_C = NA, total_bark_C = NA, total_branch_C = NA, total_ag_C = NA, merch_total_C = NA, merch_top_C = NA, stump_total_C = NA, foliage_C = NA)

        # there are trees in the plot, and not all had NA biomass estimates
      } else if (sum_stems > 0 & alert == "FALSE") {

        temp_df <- data.frame(site = f, plot = p, species = sp_list,
                              total_wood = 0, total_bark = 0, total_branch = 0, total_ag = 0, merch_total = 0, merch_top = 0, stump_total = 0, foliage = 0,
                              total_wood_C = 0, total_bark_C = 0, total_branch_C = 0, total_ag_C = 0, merch_total_C = 0, merch_top_C = 0, stump_total_C = 0, foliage_C = 0)

        all_trees <- subset(all_trees, !is.na(species))
        species_ids <- unique(all_trees$species)

        for(sp in species_ids) {

          single_sp <- subset(all_trees, species == sp)

          temp_df[temp_df$species == sp, "total_wood"] <- round(sum(single_sp$total_wood, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_bark"] <- round(sum(single_sp$total_bark, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_branch"] <- round(sum(single_sp$total_branch, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_ag"] <- round(sum(single_sp$total_ag, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "merch_total"] <- round(sum(single_sp$merch_total, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "merch_top"] <- round(sum(single_sp$merch_top, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "stump_total"] <- round(sum(single_sp$stump_total, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "foliage"] <- round(sum(single_sp$foliage, na.rm = TRUE),5)

          temp_df[temp_df$species == sp, "total_wood_C"] <- round(sum(single_sp$total_woodC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_bark_C"] <- round(sum(single_sp$total_barkC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_branch_C"] <- round(sum(single_sp$total_branchC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "total_ag_C"] <- round(sum(single_sp$total_agC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "merch_total_C"] <- round(sum(single_sp$merch_totalC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "merch_top_C"] <- round(sum(single_sp$merch_topC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "stump_total_C"] <- round(sum(single_sp$stump_totalC, na.rm = TRUE),5)
          temp_df[temp_df$species == sp, "foliage_C"] <- round(sum(single_sp$foliageC, na.rm = TRUE),5)

        }

      }

      fill_df <- rbind(fill_df, temp_df)

    }

  }

  # rename columns, so that units are clear to users
  if(out_units == "metric") {

    colnames(fill_df) <- c("site", "plot", "species",
                           "total_wood_Mg_ha", "total_bark_Mg_ha", "total_branch_Mg_ha", "total_ag_Mg_ha", "merch_total_Mg_ha", "merch_top_Mg_ha", "stump_total_Mg_ha", "foliage_Mg_ha",
                           "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_total_c", "merch_top_c", "stump_total_c", "foliage_c")

  } else if (out_units == "imperial") {

    colnames(fill_df) <- c("site", "plot", "species",
                           "total_wood_t_ac", "total_bark_t_ac", "total_branch_t_ac", "total_ag_t_ac", "merch_total_t_ac", "merch_top_t_ac", "stump_total_t_ac", "foliage_t_ac",
                           "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c", "merch_total_c", "merch_top_c", "stump_total_c", "foliage_c")

  }

  return(fill_df)

}


################################################################################
################################################################################
# ByStatus function
################################################################################
################################################################################

ByStatus <- function(data, out_units) {

  # create empty dataframe to fill
  fill_df <- data.frame(matrix(nrow = 0, ncol = 32))
  colnames(fill_df) <- c("site", "plot", "total_wood_L", "total_wood_D", "total_bark_L", "total_bark_D", "total_branch_L", "total_branch_D", "total_ag_L", "total_ag_D",
                         "merch_total_L", "merch_total_D", "merch_top_L", "merch_top_D", "stump_total_L", "stump_total_D", "foliage_L",
                         "total_wood_LC", "total_wood_DC", "total_bark_LC", "total_bark_DC", "total_branch_LC", "total_branch_DC", "total_ag_LC", "total_ag_DC",
                         "merch_total_LC", "merch_total_DC", "merch_top_LC", "merch_top_DC", "stump_total_LC", "stump_total_DC", "foliage_LC")

  # loop through each site and plot
  forests <- unique(data$site)

  for(f in forests) {

    all_plots <- subset(data, site == f)
    plot_ids <- unique(all_plots$plot)

    for(p in plot_ids) {

      all_trees <- subset(all_plots, plot == p)
      sum_stems <- sum(all_trees$exp_factor)
      alert <- all(all_trees$calc_bio == "N")

      fill_df[nrow(fill_df) + 1, ] <- NA
      n <- nrow(fill_df)

      fill_df$site[n] <- f
      fill_df$plot[n] <- p

      # if there are no trees in the plot
      if(sum_stems == 0) {

        fill_df[n, 3:32] <- 0

        # if there are trees in the plot, but all had NA biomass estimates due to missing data
      } else if (sum_stems > 0 & alert == "TRUE") {

        fill_df[n, 3:32] <- NA

        # there are trees in the plot, and not all had NA biomass estimates
      } else if (sum_stems > 0 & alert == "FALSE") {

        live_trees <- subset(all_plots, plot == p & status == "1")
        dead_trees <- subset(all_plots, plot == p & status == "0")

        fill_df$total_wood_L[n] <- round(sum(live_trees$total_wood, na.rm = TRUE),5)
        fill_df$total_wood_D[n] <- round(sum(dead_trees$total_wood, na.rm = TRUE),5)
        fill_df$total_bark_L[n] <- round(sum(live_trees$total_bark, na.rm = TRUE),5)
        fill_df$total_bark_D[n] <- round(sum(dead_trees$total_bark, na.rm = TRUE),5)
        fill_df$total_branch_L[n] <- round(sum(live_trees$total_branch, na.rm = TRUE),5)
        fill_df$total_branch_D[n] <- round(sum(dead_trees$total_branch, na.rm = TRUE),5)
        fill_df$total_ag_L[n] <- round(sum(live_trees$total_ag, na.rm = TRUE),5)
        fill_df$total_ag_D[n] <- round(sum(dead_trees$total_ag, na.rm = TRUE),5)
        fill_df$merch_total_L[n] <- round(sum(live_trees$merch_total, na.rm = TRUE),5)
        fill_df$merch_total_D[n] <- round(sum(dead_trees$merch_total, na.rm = TRUE),5)
        fill_df$merch_top_L[n] <- round(sum(live_trees$merch_top, na.rm = TRUE),5)
        fill_df$merch_top_D[n] <- round(sum(dead_trees$merch_top, na.rm = TRUE),5)
        fill_df$stump_total_L[n] <- round(sum(live_trees$stump_total, na.rm = TRUE),5)
        fill_df$stump_total_D[n] <- round(sum(dead_trees$stump_total, na.rm = TRUE),5)
        fill_df$foliage_L[n] <- round(sum(live_trees$foliage, na.rm = TRUE),5)

        fill_df$total_wood_LC[n] <- round(sum(live_trees$total_woodC, na.rm = TRUE),5)
        fill_df$total_wood_DC[n] <- round(sum(dead_trees$total_woodC, na.rm = TRUE),5)
        fill_df$total_bark_LC[n] <- round(sum(live_trees$total_barkC, na.rm = TRUE),5)
        fill_df$total_bark_DC[n] <- round(sum(dead_trees$total_barkC, na.rm = TRUE),5)
        fill_df$total_branch_LC[n] <- round(sum(live_trees$total_branchC, na.rm = TRUE),5)
        fill_df$total_branch_DC[n] <- round(sum(dead_trees$total_branchC, na.rm = TRUE),5)
        fill_df$total_ag_LC[n] <- round(sum(live_trees$total_agC, na.rm = TRUE),5)
        fill_df$total_ag_DC[n] <- round(sum(dead_trees$total_agC, na.rm = TRUE),5)
        fill_df$merch_total_LC[n] <- round(sum(live_trees$merch_totalC, na.rm = TRUE),5)
        fill_df$merch_total_DC[n] <- round(sum(dead_trees$merch_totalC, na.rm = TRUE),5)
        fill_df$merch_top_LC[n] <- round(sum(live_trees$merch_topC, na.rm = TRUE),5)
        fill_df$merch_top_DC[n] <- round(sum(dead_trees$merch_topC, na.rm = TRUE),5)
        fill_df$stump_total_LC[n] <- round(sum(live_trees$stump_totalC, na.rm = TRUE),5)
        fill_df$stump_total_DC[n] <- round(sum(dead_trees$stump_totalC, na.rm = TRUE),5)
        fill_df$foliage_LC[n] <- round(sum(live_trees$foliageC, na.rm = TRUE),5)

      }

    }

  }

  # rename columns, so that units are clear to users
  if(out_units == "metric") {

    colnames(fill_df) <- c("site", "plot", "total_wood_L_Mg_ha", "total_wood_D_Mg_ha", "total_bark_L_Mg_ha", "total_bark_D_Mg_ha", "total_branch_L_Mg_ha", "total_branch_D_Mg_ha",
                           "total_ag_L_Mg_ha", "total_ag_D_Mg_ha", "merch_total_L_Mg_ha", "merch_total_D_Mg_ha", "merch_top_L_Mg_ha", "merch_top_D_Mg_ha", "stump_total_L_Mg_ha",
                           "stump_total_D_Mg_ha", "foliage_L_Mg_ha", "total_wood_L_c", "total_wood_D_c", "total_bark_L_c", "total_bark_D_c", "total_branch_L_c", "total_branch_D_c",
                           "total_ag_L_c", "total_ag_D_c", "merch_total_L_c", "merch_total_D_c", "merch_top_L_c", "merch_top_D_c", "stump_total_L_c", "stump_total_D_c", "foliage_L_c")

  } else if (out_units == "imperial") {

    colnames(fill_df) <- c("site", "plot", "total_wood_L_t_ac", "total_wood_D_t_ac", "total_bark_L_t_ac", "total_bark_D_t_ac", "total_branch_L_t_ac", "total_branch_D_t_ac",
                           "total_ag_L_t_ac", "total_ag_D_t_ac", "merch_total_L_t_ac", "merch_total_D_t_ac", "merch_top_L_t_ac", "merch_top_D_t_ac", "stump_total_L_t_ac",
                           "stump_total_D_t_ac", "foliage_L_t_ac", "total_wood_L_c", "total_wood_D_c", "total_bark_L_c", "total_bark_D_c", "total_branch_L_c", "total_branch_D_c",
                           "total_ag_L_c", "total_ag_D_c", "merch_total_L_c", "merch_total_D_c", "merch_top_L_c", "merch_top_D_c", "stump_total_L_c", "stump_total_D_c", "foliage_L_c")

  }

  return(fill_df)

}


################################################################################
################################################################################
# ByPlot function
################################################################################
################################################################################

ByPlot <- function(data, out_units) {

  # create empty dataframe to fill
  fill_df <- data.frame(matrix(nrow = 0, ncol = 18))
  colnames(fill_df) <- c("site", "plot", "total_wood", "total_bark", "total_branch", "total_ag", "merch_total", "merch_top", "stump_total", "foliage",
                         "total_wood_C", "total_bark_C", "total_branch_C", "total_ag_C", "merch_total_C", "merch_top_C", "stump_total_C", "foliage_C")

  # loop through each site and plot
  forests <- unique(data$site)

  for(f in forests) {

    all_plots <- subset(data, site == f)
    plot_ids <- unique(all_plots$plot)

    for(p in plot_ids) {

      all_trees <- subset(all_plots, plot == p)
      sum_stems <- sum(all_trees$exp_factor)
      alert <- all(all_trees$calc_bio == "N")

      fill_df[nrow(fill_df) + 1, ] <- NA
      n <- nrow(fill_df)

      fill_df$site[n] <- f
      fill_df$plot[n] <- p

      # if there are no trees in the plot
      if(sum_stems == 0) {

        fill_df[n, 3:18] <- 0

        # if there are trees in the plot, but all had NA biomass estimates due to missing data
      } else if (sum_stems > 0 & alert == "TRUE") {

        fill_df[n, 3:18] <- NA

        # there are trees in the plot, and not all had NA biomass estimates
      } else if (sum_stems > 0 & alert == "FALSE") {

        fill_df$total_wood[n] <- round(sum(all_trees$total_wood, na.rm = TRUE),5)
        fill_df$total_bark[n] <- round(sum(all_trees$total_bark, na.rm = TRUE),5)
        fill_df$total_branch[n] <- round(sum(all_trees$total_branch, na.rm = TRUE),5)
        fill_df$total_ag[n] <- round(sum(all_trees$total_ag, na.rm = TRUE),5)
        fill_df$merch_total[n] <- round(sum(all_trees$merch_total, na.rm = TRUE),5)
        fill_df$merch_top[n] <- round(sum(all_trees$merch_top, na.rm = TRUE),5)
        fill_df$stump_total[n] <- round(sum(all_trees$stump_total, na.rm = TRUE),5)
        fill_df$foliage[n] <- round(sum(all_trees$foliage, na.rm = TRUE),5)

        fill_df$total_wood_C[n] <- round(sum(all_trees$total_woodC, na.rm = TRUE),5)
        fill_df$total_bark_C[n] <- round(sum(all_trees$total_barkC, na.rm = TRUE),5)
        fill_df$total_branch_C[n] <- round(sum(all_trees$total_branchC, na.rm = TRUE),5)
        fill_df$total_ag_C[n] <- round(sum(all_trees$total_agC, na.rm = TRUE),5)
        fill_df$merch_total_C[n] <- round(sum(all_trees$merch_totalC, na.rm = TRUE),5)
        fill_df$merch_top_C[n] <- round(sum(all_trees$merch_topC, na.rm = TRUE),5)
        fill_df$stump_total_C[n] <- round(sum(all_trees$stump_totalC, na.rm = TRUE),5)
        fill_df$foliage_C[n] <- round(sum(all_trees$foliageC, na.rm = TRUE),5)

      }

    }

  }

  # rename columns, so that units are clear to users
  if(out_units == "metric") {

    colnames(fill_df) <- c("site", "plot",
                           "total_wood_Mg_ha", "total_bark_Mg_ha","total_branch_Mg_ha", "total_ag_Mg_ha",
                           "merch_total_Mg_ha", "merch_top_Mg_ha", "stump_total_Mg_ha", "foliage_Mg_ha",
                           "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                           "merch_total_c", "merch_top_c", "stump_total_c", "foliage_c")

  } else if (out_units == "imperial") {

    colnames(fill_df) <- c("site", "plot",
                           "total_wood_t_ac", "total_bark_t_ac", "total_branch_t_ac", "total_ag_t_ac",
                           "merch_total_t_ac", "merch_top_t_ac", "stump_total_t_ac", "foliage_t_ac",
                           "total_wood_c", "total_bark_c", "total_branch_c", "total_ag_c",
                           "merch_total_c", "merch_top_c", "stump_total_c", "foliage_c")

  }

  return(fill_df)

}
