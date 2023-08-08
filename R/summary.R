demo_data2 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,1,1,1,2,2)),
  ef = c(25,25,25,25,25,25,25),
  status = c("1", "0", "1", "1", "1", "0", "1"),
  species = c("CADE", "ABCO", "CADE", "ABCO", "ABCO", "CADE", "QUKE"),
  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8, 19.1, 32.8),
  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.0, 23.3)
)

trial <- TreeBiomass(data = demo_data2,
                     status = "status",
                     species = "species",
                     dbh = "DBH_CM",
                     ht = "HT_M")

trial2 <- subset(trial, !is.na(total_bio_kg))

trial2$sp_status <- NA
n <- nrow(trial2)

for (i in 1:n) {

  if(trial2$status[i] == 1) {

    trial2$sp_status[i] <- paste(trial2$species[i],"L",sep= ".")

    } else {

    trial2$sp_status[i] <- paste(trial2$species[i],"D",sep= ".")

    }
}


SumBySpecies <- function(bio_data) {

  # create empty dataframe to fill
  sp_names <- unique(bio_data$species)
  sp.L <- paste(sp_names,"L", sep = ".")
  sp.D <- paste(sp_names,"D", sep = ".")

  sp_df <- data.frame(matrix(nrow = 0, ncol = (2*length(sp_names))))
  colnames(sp_df) <- c(sp.L, sp.D)
  sp_df <- sp_df[,order(colnames(sp_df))]

  location_df <- data.frame(matrix(nrow = 0, ncol = 2))
  colnames(location_df) <- c("site", "plot")

  final_df <- cbind(location_df, sp_df)

  # loop through each site, plot, and species
  forests <- unique(bio_data$site)

  for(f in forests) {

    all_plots <- subset(bio_data, site == f)
    plot_ids <- unique(all_plots$plot)

    for(p in plot_ids) {

      all_trees <- subset(all_plots, plot == p)
      species_ids <- unique(all_trees$sp_status)

      final_df[nrow(final_df) + 1, ] <- format(round(0), nsmall = 2)
      k <- nrow(final_df)

      for(sp in species_ids) {

        single_sp <- subset(all_trees, sp_status == sp)
        sum_total_bio <- sum(single_sp$total_bio_kg, na.rm = TRUE)

        final_df[[sp]][k] <- sum_total_bio
        final_df$site[k] <- f
        final_df$plot[k] <- p

      }
    }
  }

  message('You selected metric units. All biomass estimates are in Mg/ha.')
  return(final_df)

}


SumBySpecies(trial2)



