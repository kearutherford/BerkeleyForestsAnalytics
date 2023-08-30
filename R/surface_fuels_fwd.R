
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
  species = c("PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)


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

        total_ba <- sum(all_trees$ba_area)
        species_ids <- unique(all_trees$species)

        for(sp in species_ids) {

          fill_df[nrow(fill_df) + 1, ] <- NA
          k <- nrow(fill_df)

          single_sp <- subset(all_trees, species == sp)
          sum_sp_ba <- sum(single_sp$ba_area)

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

FWD_coef(fwd_tree_data = tree_test, fwd_units = "metric", fwd_sp_codes = "4letter")


FWD_loads <- function(  ) {

# calc 1, 10, and 100-hr fuel loads at the plot level

}











