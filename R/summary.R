demo_data2 <- data.frame(
  Forest = c("SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  Plot_id = as.character(c(1,1,1,1,1,2,2)),
  SPH = c(25,25,25,25,25,25,25),
  Status = c("1", "0", "1", "1", "1", "0", "1"),
  SPP = c("CADE", "PIPO", "CADE", "ABCO", "ABCO", "ABCO", "CADE"),
  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8, 19.1, 32.8),
  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.0, 23.3)
)


tree_names <- unique(demo_data2$SPP)
trial <- data.frame(matrix(nrow = 0, ncol = length(tree_names) + 2))
colnames(trial) <- c("site", "plot", tree_names)
trial


forest <- unique(demo_data2$Forest)

for(f in forest) {

  my_trees <- subset(demo_data2, Forest == f)

  plot <- unique(my_trees$Plot_id)

  for(p in plot) {

    my_plot <- subset(my_trees, Plot_id == p)

    trial[nrow(trial) + 1, ] <- 0
    i <- nrow(trial)

    species <- unique(my_plot$SPP)

    for(sp in species) {

      my_species <- subset(my_plot, SPP == sp)

      total <- sum(my_species$DBH_CM)

      trial[[sp]][i] <- total
      trial$site[i] <- f
      trial$plot[i] <- p

    }

  }

}

