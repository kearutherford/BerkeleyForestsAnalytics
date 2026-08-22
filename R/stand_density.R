
################################################################################
################################################################################
# Top-level function
################################################################################
################################################################################

StandDensity <- function(tree_data, subsec_data, input_units = "metric", output_units = "metric") {

  # coerce tibble inputs into data.frame
  tree_step0 <- as.data.frame(tree_data)
  subsec_step0 <- as.data.frame(subsec_data)

  # Check input data
  #ValidateSDITrees()
  #ValidateSDISubs()
  #ValidateSDIMatches()

  # Calculate SDIs
  step1 <- CalcSDI(sdi_tree_data = tree_step0,
                   sdi_subsec_data = subsec_step0,
                   sdi_input = input_units,
                   sdi_output = output_units)

  return(step1)

}

tree_trial <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,1,1,1,2,2,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,0),
  status = c("0", "0", "0", "1", NA, "1", "1", "0", "0",NA),
  dbh = c(1.3, 44.7, 19.1, NA, 13.8, 2.2, 1.7, 13.1, 15.8,NA)
)

sub_trial <- data.frame(
  site = c("SEKI", "YOMI"),
  subsection = c("413Hr", "313Ga")
)

StandDensity(tree_trial, sub_trial)


################################################################################
################################################################################
# ValidateSDI functions
################################################################################
################################################################################


################################################################################
################################################################################
# CalcSDI function
################################################################################
################################################################################

CalcSDI <- function(sdi_tree_data, sdi_subsec_data, sdi_input, sdi_output) {

  # unit conversion
  if(sdi_input == "imperial") {

    sdi_tree_data$exp_factor <- sdi_tree_data$exp_factor*2.47105
    sdi_tree_data$dbh <- sdi_tree_data$dbh*2.54

  }

  # calculate current SDI
  # create empty dataframe to fill
  fill_df <- data.frame(matrix(nrow = 0, ncol = 3))
  colnames(fill_df) <- c("site", "plot", "current_sdi")

  # loop through each site and plot
  forests <- unique(sdi_tree_data$site)

  for(f in forests) {

    all_plots <- subset(sdi_tree_data, site == f)
    plot_ids <- unique(all_plots$plot)

    for(p in plot_ids) {

      all_trees <- subset(all_plots, plot == p)

      complete <- complete.cases(all_trees[c("status", "dbh")])
      alert_na <- !any(complete)
      alert_all_dead <- any(complete) && all(all_trees$status[complete] == "0")

      live <- complete & all_trees$status != "0"
      alert_too_small <- any(live) && all(all_trees$dbh[live] < 2.54)

      # if there are no trees in the plot
      if(sum(all_trees$exp_factor) == 0) {
        temp_df <- data.frame(site = f, plot = p, current_sdi = 0)

      # if there are no complete cases of status and dbh
      } else if(alert_na) {
        temp_df <- data.frame(site = f, plot = p, current_sdi = NA)

      # if there are no live trees
      } else if(alert_all_dead) {
        temp_df <- data.frame(site = f, plot = p, current_sdi = 0)

      # if there are no live trees with dbh >= 2.54 cm
      } else if(alert_too_small) {
        temp_df <- data.frame(site = f, plot = p, current_sdi = 0)

      # if there are live trees with dbh >= 2.54 cm
      } else {

        live_large <- live & all_trees$dbh >= 2.54

        temp_df <- data.frame(site = f,
                              plot = p,
                              current_sdi = sum(all_trees$exp_factor[live_large]*(all_trees$dbh[live_large]/25.4)^1.6))
      }

      fill_df <- rbind(fill_df, temp_df)

    }

  }

  # pull median maxSDI
  max_sdi_data <- merge(sdi_subsec_data, subsec_max_sdi, by = "subsection", all.x = TRUE, all.y = FALSE)

  if("plot" %in% names(max_sdi_data)) {
    merged_sdi_data <- merge(fill_df, max_sdi_data, by = c("site", "plot"))
  } else {
    merged_sdi_data <- merge(fill_df, max_sdi_data, by = "site", all = TRUE)
  }

  # unit conversion and clean up
  if(sdi_output == "imperial") {

    merged_sdi_data$current_sdi_spa <- round(merged_sdi_data$current_sdi/2.47105,0)
    merged_sdi_data$max_sdi_spa <- round(merged_sdi_data$median_sdi_max/2.47105,0)
    merged_sdi_data$rel_density <- merged_sdi_data$current_sdi_spa/merged_sdi_data$max_sdi_spa
    return_sdi_df <- merged_sdi_data[c("site", "plot", "current_sdi_spa", "max_sdi_spa", "rel_density")]

  } else {

    merged_sdi_data$current_sdi_sph <- round(merged_sdi_data$current_sdi,0)
    merged_sdi_data$max_sdi_sph <- round(merged_sdi_data$median_sdi_max,0)
    merged_sdi_data$rel_density <- merged_sdi_data$current_sdi_sph/merged_sdi_data$max_sdi_sph
    return_sdi_df <- merged_sdi_data[c("site", "plot", "current_sdi_sph", "max_sdi_sph", "rel_density")]

  }

  return_sdi_df <- return_sdi_df[order(return_sdi_df$site, return_sdi_df$plot), ]
  return(return_sdi_df)

}
