
################################################################################
################################################################################
# Validate Overstory Data
################################################################################
################################################################################

ValidateOverstory <- function(tree_data_val, sp_codes_val) {

  # coerce tibble inputs into data.frame
  tree_data_val <- as.data.frame(tree_data_val)


  ###########################################################
  # Check that all columns are in the provided dataframe
  ###########################################################

  necessary_columns = c("time", "site", "plot", "exp_factor", "species", "dbh")

  if(!all(is.element(necessary_columns, names(tree_data_val)))) {

    stop('tree_data is missing necessary columns!\n',
         'tree_data must include time, site, plot, exp_factor, species, and dbh')

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
  # Check that options are set appropriately
  ###########################################################

  if(sp_codes_val == "4letter" || sp_codes_val == "fia") {
    # do nothing
  } else {
    stop('The "sp_codes" parameter must be set to either "4letter" or "fia."')
  }


  ###########################################################
  # Check for missing time:site:plot information
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


  ###########################################################
  # Check that expansion factor is as expected
  ###########################################################

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(tree_data_val$exp_factor)) {

    stop('For tree_data, there are missing values in the exp_factor column.\n',
         'For plots with no trees, put 0 for the expansion factor.')

  }

  # Check for negative values --------------------------------------------------
  if(any(tree_data_val$exp_factor < 0, na.rm = TRUE)) {

    stop('In tree_data there are observations with negative exp_factor values.\n',
         'Expansion factors cannot be negative.')
  }

  # First check for proper use of 0 ef -----------------------------------------
  period <- unique(tree_data_val$time)

  for(pd in period) {

    all_forests <- subset(tree_data_val, time == pd)
    forest_ids <- unique(all_forests$site)

    for(f in forest_ids) {

      all_plots <- subset(all_forests, tree_data_val$site == f)
      plot_ids <- unique(all_plots$plot)

      for(p in plot_ids) {

        all_trees <- subset(all_plots, all_plots$plot == p)

        if('TRUE' %in% is.element(all_trees$exp_factor, 0)) {

          n <- nrow(all_trees)

          if(n > 1) {

            stop('For tree_data, there are plots with a recorded expansion factor of 0, but with more than one row.\n',
                 'Plots with no trees should be represented by a single row with time, site and plot filled in as appropriate and an exp_factor of 0.')

          }

        }

      }

    }

  }

  # Second check for proper use of 0 ef -----------------------------------------
  plots_wo_trees <- subset(tree_data_val, tree_data_val$exp_factor == 0,
                           select = c(species, dbh))

  if('FALSE' %in% is.na(plots_wo_trees)) {

    stop('For tree_data, there are plots with a recorded expansion factor of 0, but with non-NA species and/or dbh.\n',
         'Plots with no trees should be represented by a single row with time, site and plot filled in as appropriate,\n',
         'an exp_factor of 0, NA species, and NA dbh.')

  }


  ###########################################################
  # Check that dbh is as expected
  ###########################################################

  if(any(tree_data_val$dbh < 0, na.rm = TRUE)) {

    stop('In tree_data there are trees with negative dbh values.\n',
         'Trees cannot have negative dbh.')
  }

  plots_w_trees <- subset(tree_data_val, tree_data_val$exp_factor > 0)

  if ('TRUE' %in% is.na(plots_w_trees$dbh)) {

    warning('For plots with trees, there are missing values in the dbh column. Trees with NA dbh will be filtered out for the calculations.\n',
            'Note that plots without trees, represented with a 0 exp_factor, are allowed to hava NA dbh and will not be filtered out.',
            ' \n')
  }


  ###########################################################
  # Check that species codes are as expected
  ###########################################################

  tree_data_val$species <- as.character(tree_data_val$species) # coerce species into character
  plots_w_trees$species <- as.character(plots_w_trees$species)

  # Check for NA ---------------------------------------------------------------
  if ('TRUE' %in% is.na(plots_w_trees$species)) {

    warning('For plots with trees, there are missing species codes in the provided dataframe.\n',
            'Trees with NA species codes will be assigned "UNTR" for unknown tree and will receive generic coefficients.\n',
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
              'and will receive generic coefficients. Unrecognized codes: ', unrecognized_sp, ' \n',
              ' \n')
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

  yes_trees <- subset(tree_data_val, tree_data_val$exp_factor > 0 & !is.na(tree_data_val$dbh),
                      select = c(time, site, plot, exp_factor, species, dbh))

  no_trees <- subset(tree_data_val, tree_data_val$exp_factor == 0,
                     select = c(time, site, plot, exp_factor, species, dbh))

  tree_data_return <- rbind(yes_trees, no_trees)

  return(tree_data_return)

}


################################################################################
################################################################################
# Check for time:site:plot matches for tree and fuel data
################################################################################
################################################################################

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

    stop('Tree and fuel data did not completely match!\n',
         'These time:site:plot combinations have tree data but no fuel data: ', trees_wo_fuels, '\n',
         'These time:site:plot combinations have fuel data but no tree data: ', fuels_wo_trees)

  }

}


################################################################################
################################################################################
# Calculate dominance of tree species
################################################################################
################################################################################

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

          if(total_ba > 0) {

            fill_df$perc_BA[k] <- sum_sp_ba/total_ba

          } else {

            fill_df$perc_BA[k] <- 1

          }

        }

      }

    }

  }

  return(fill_df)

}
