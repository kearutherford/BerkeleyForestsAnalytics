
AdjustBiomass <- function(data, status, decay_class, species, dbh, ht, sp_codes = "4letter", units = "metric") {

  # Calculate tree-level biomass
  step1 <- TreeBiomass(data = data,
                       status = status,
                       species = species,
                       dbh = dbh,
                       ht = ht,
                       sp_codes = sp_codes,
                       units = units)

}


demo_data <- data.frame(
  Forest = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  Plot_id = as.character(c(1,1,2,2,1,1,2,2,2)),
  SPH = c(50,50,50,50,50,50,50,50,50),
  Live = c("1", "0", "1", "1", "1", "1", "1", "0", "0"),
  FIA = as.character(c(NA, 2, NA, NA, NA, NA, NA, 3, 4)),
  SPP = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", "PSME"),
  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, 15.8),
  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, 10.6)
)

test <- TreeBiomass(data = demo_data,
                    status = "Live",
                    species = "SPP",
                    dbh = "DBH_CM",
                    ht = "HT_M",
                    sp_codes = "4letter",
                    units = "metric")

test2 <- Discount(tree_data = test,
                  tree_status = "Live",
                  tree_decay = "FIA",
                  tree_sp = "SPP",
                  tree_sp_codes = "4letter",
                  tree_units = "metric")


Discount <- function(tree_data, tree_status, tree_decay, tree_sp, tree_sp_codes, tree_units) {

  # bring in live:dead ratio table
  discount <- read.csv(system.file('extdata', 'sd_ratios.csv', package = "UCBForestAnalytics"),
                       stringsAsFactors = FALSE)

  # make sure decay_class is a character column
  discount$decay_class <- as.character(discount$decay_class)
  discount$fia_code <- as.character(discount$fia_code)

  # loop through each row
  n <- nrow(tree_data)

  for(i in 1:n) {

    if (!is.na(tree_data[[tree_status]][i]) & tree_data[[tree_status]][i] == 0) {

      sp <- tree_data[[tree_sp]][i]
      sd <- tree_data[[tree_decay]][i]

      # pull out live:dead ratio
      if (tree_sp_codes == "4letter") {

        ratio_val <- discount[discount$letter_code == sp & discount$decay_class == sd, "decay_ratio"]

      } else if (tree_sp_codes == "fia") {

        ratio_val <- discount[discount$fia_code == sp & discount$decay_class == sd, "decay_ratio"]

      }

      # discount biomass
      if (tree_units == "metric") {

        tree_data$stem_bio_kg[i] <- round(ratio_val*(tree_data$stem_bio_kg[i]),2)
        tree_data$bark_bio_kg[i] <- round(ratio_val*(tree_data$bark_bio_kg[i]),2)
        tree_data$branch_bio_kg[i] <- round(ratio_val*(tree_data$branch_bio_kg[i]),2)
        tree_data$total_bio_kg[i] <- tree_data$stem_bio_kg[i] + tree_data$bark_bio_kg[i] + tree_data$branch_bio_kg[i]

      } else if (tree_units == "imperial") {

        tree_data$stem_bio_tons[i] <- round(ratio_val*(tree_data$stem_bio_tons[i]),2)
        tree_data$bark_bio_tons[i] <- round(ratio_val*(tree_data$bark_bio_tons[i]),2)
        tree_data$branch_bio_tons[i] <- round(ratio_val*(tree_data$branch_bio_tons[i]),2)
        tree_data$total_bio_tons[i] <- tree_data$stem_bio_tons[i] + tree_data$bark_bio_tons[i] + tree_data$branch_bio_tons[i]

      }

    }

  }

  return(tree_data)

}
