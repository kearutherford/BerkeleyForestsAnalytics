
################################################################################
################################################################################
# SumBySpecies function
################################################################################
################################################################################

SumBySpecies <- function(bio_data, bio_units) {

  if(bio_units == "metric") {

    # convert biomass to Mg/ha
    bio_data$Mg_tree <- ((bio_data$total_bio_kg/1000)*bio_data$ef)

    # create empty dataframe to fill
    fill_df <- data.frame(matrix(nrow = 0, ncol = 5))
    colnames(fill_df) <- c("site", "plot", "species", "live_Mg_ha", "dead_Mg_ha")

    # get list of species
    sp_list_data <- subset(bio_data, !is.na(species))
    sp_list <- unique(sp_list_data$species)

    # loop through each site, plot, and species
    forests <- unique(bio_data$site)

    for(f in forests) {

        all_plots <- subset(bio_data, site == f)
        plot_ids <- unique(all_plots$plot)

        for(p in plot_ids) {

            all_trees <- subset(all_plots, plot == p)
            sum_stems <- sum(all_trees$ef)
            alert_NA <- all(is.na(all_trees$Mg_tree))

            # if there are no trees in the plot
            if(sum_stems == 0) {

            temp_df <- data.frame(site = f,
                                  plot = p,
                                  species = sp_list,
                                  live_Mg_ha = 0,
                                  dead_Mg_ha = 0)

            # if there are trees in the plot, but all had NA biomass estimates due to missing data
            } else if (sum_stems > 0 & alert_NA == "TRUE") {

              temp_df <- data.frame(site = f,
                                    plot = p,
                                    species = sp_list,
                                    live_Mg_ha = NA,
                                    dead_Mg_ha = NA)

            # there are trees in the plot, and not all had NA biomass estimates
            } else if (sum_stems > 0 & alert_NA == "FALSE") {

              temp_df <- data.frame(site = f,
                                    plot = p,
                                    species = sp_list,
                                    live_Mg_ha = 0,
                                    dead_Mg_ha = 0)

              all_trees <- subset(all_trees, !is.na(species))
              species_ids <- unique(all_trees$species)

              for(sp in species_ids) {

                  single_sp_L <- subset(all_trees, species == sp & status == 1)
                  single_sp_D <- subset(all_trees, species == sp & status == 0)

                  sum_total_live <- round(sum(single_sp_L$Mg_tree, na.rm = TRUE),2)
                  sum_total_dead <- round(sum(single_sp_D$Mg_tree, na.rm = TRUE),2)

                  temp_df[temp_df$species == sp, "live_Mg_ha"] <- sum_total_live
                  temp_df[temp_df$species == sp, "dead_Mg_ha"] <- sum_total_dead

              }

            }

            fill_df <- rbind(fill_df, temp_df)

         }

    }

  return(fill_df)

  } else if (bio_units == "imperial") {

    # convert biomass to ton/ac
    bio_data$ton_tree <- ((bio_data$total_bio_tons)*bio_data$ef)

    # create empty dataframe to fill
    fill_df <- data.frame(matrix(nrow = 0, ncol = 5))
    colnames(fill_df) <- c("site", "plot", "species", "live_ton_ac", "dead_ton_ac")

    # get list of species
    sp_list_data <- subset(bio_data, !is.na(species))
    sp_list <- unique(sp_list_data$species)

    # loop through each site, plot, and species
    forests <- unique(bio_data$site)

    for(f in forests) {

      all_plots <- subset(bio_data, site == f)
      plot_ids <- unique(all_plots$plot)

      for(p in plot_ids) {

        all_trees <- subset(all_plots, plot == p)
        sum_stems <- sum(all_trees$ef)
        alert_NA <- all(is.na(all_trees$ton_tree))

        # if there are no trees in the plot
        if(sum_stems == 0) {

          temp_df <- data.frame(site = f,
                                plot = p,
                                species = sp_list,
                                live_ton_ac = 0,
                                dead_ton_ac = 0)

          # if there are trees in the plot, but all had NA biomass estimates due to missing data
        } else if (sum_stems > 0 & alert_NA == "TRUE") {

          temp_df <- data.frame(site = f,
                                plot = p,
                                species = sp_list,
                                live_Mg_ha = NA,
                                dead_Mg_ha = NA)

          # there are trees in the plot, and not all had NA biomass estimates
        } else if (sum_stems > 0 & alert_NA == "FALSE") {

          temp_df <- data.frame(site = f,
                                plot = p,
                                species = sp_list,
                                live_Mg_ha = 0,
                                dead_Mg_ha = 0)

          all_trees <- subset(all_trees, !is.na(species))
          species_ids <- unique(all_trees$species)

          for(sp in species_ids) {

            single_sp_L <- subset(all_trees, species == sp & status == 1)
            single_sp_D <- subset(all_trees, species == sp & status == 0)

            sum_total_live <- round(sum(single_sp_L$ton_tree, na.rm = TRUE),2)
            sum_total_dead <- round(sum(single_sp_D$ton_tree, na.rm = TRUE),2)

            temp_df[temp_df$species == sp, "live_ton_ac"] <- sum_total_live
            temp_df[temp_df$species == sp, "dead_ton_ac"] <- sum_total_dead

          }

        }

        fill_df <- rbind(fill_df, temp_df)

      }

    }

    return(fill_df)

  }

}


################################################################################
################################################################################
# SumByPlot function
################################################################################
################################################################################

SumByPlot <- function(bio_data, bio_units) {

  if(bio_units == "metric") {

    # convert biomass to Mg/ha
    bio_data$Mg_tree <- ((bio_data$total_bio_kg/1000)*bio_data$ef)

    # create empty dataframe to fill
    fill_df <- data.frame(matrix(nrow = 0, ncol = 4))
    colnames(fill_df) <- c("site", "plot", "live_Mg_ha", "dead_Mg_ha")

    # loop through each site and plot
    forests <- unique(bio_data$site)

    for(f in forests) {

      all_plots <- subset(bio_data, site == f)
      plot_ids <- unique(all_plots$plot)

      for(p in plot_ids) {

        all_trees <- subset(all_plots, plot == p)
        sum_stems <- sum(all_trees$ef)
        alert_NA <- all(is.na(all_trees$Mg_tree))

        # if there are no trees in the plot
        if(sum_stems == 0) {

          sum_total_live <- 0
          sum_total_dead <- 0

          # if there are trees in the plot, but all had NA biomass estimates due to missing data
        } else if (sum_stems > 0 & alert_NA == "TRUE") {

          sum_total_live <- NA
          sum_total_dead <- NA

          # there are trees in the plot, and not all had NA biomass estimates
        } else if (sum_stems > 0 & alert_NA == "FALSE") {

          live_trees <- subset(all_plots, plot == p & status == 1)
          dead_trees <- subset(all_plots, plot == p & status == 0)

          sum_total_live <- round(sum(live_trees$Mg_tree, na.rm = TRUE),2)
          sum_total_dead <- round(sum(dead_trees$Mg_tree, na.rm = TRUE),2)

        }

        fill_df[nrow(fill_df) + 1, ] <- NA
        n <- nrow(fill_df)

        fill_df$site[n] <- f
        fill_df$plot[n] <- p
        fill_df$live_Mg_ha[n] <- sum_total_live
        fill_df$dead_Mg_ha[n] <- sum_total_dead

      }

    }

    return(fill_df)

  } else if (bio_units == "imperial") {

    # convert biomass to ton/ac
    bio_data$ton_tree <- ((bio_data$total_bio_tons)*bio_data$ef)

    # create empty dataframe to fill
    fill_df <- data.frame(matrix(nrow = 0, ncol = 4))
    colnames(fill_df) <- c("site", "plot", "live_ton_ac", "dead_ton_ac")

    # loop through each site and plot
    forests <- unique(bio_data$site)

    for(f in forests) {

      all_plots <- subset(bio_data, site == f)
      plot_ids <- unique(all_plots$plot)

      for(p in plot_ids) {

        all_trees <- subset(all_plots, plot == p)
        sum_stems <- sum(all_trees$ef)
        alert_NA <- all(is.na(all_trees$ton_tree))

        # if there are no trees in the plot
        if(sum_stems == 0) {

          sum_total_live <- 0
          sum_total_dead <- 0

          # if there are trees in the plot, but all had NA biomass estimates due to missing data
        } else if (sum_stems > 0 & alert_NA == "TRUE") {

          sum_total_live <- NA
          sum_total_dead <- NA

          # there are trees in the plot, and not all had NA biomass estimates
        } else if (sum_stems > 0 & alert_NA == "FALSE") {

          live_trees <- subset(all_plots, plot == p & status == 1)
          dead_trees <- subset(all_plots, plot == p & status == 0)

          sum_total_live <- round(sum(live_trees$ton_tree, na.rm = TRUE),2)
          sum_total_dead <- round(sum(dead_trees$ton_tree, na.rm = TRUE),2)

        }

        fill_df[nrow(fill_df) + 1, ] <- NA
        n <- nrow(fill_df)

        fill_df$site[n] <- f
        fill_df$plot[n] <- p
        fill_df$live_ton_ac[n] <- sum_total_live
        fill_df$dead_ton_ac[n] <- sum_total_dead

      }

    }

    return(fill_df)

  }

}
