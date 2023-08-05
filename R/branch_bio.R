BranchBiomass <- function(tree_data) {

  tree_data$branch_eq <- as.character(NA)
  tree_data$branch_bio_kg <- as.double(NA)
  tree_data$total_bio_kg <- as.double(NA)
  n <- nrow(tree_data)

  for (i in 1:n) {

    ############################################################################
    # Part I: assign biomass equation numbers
    ############################################################################

    # Trees with NA species codes will have NA biomass estimates
    if(is.na(tree_data$species[i])) {

      tree_data$branch_eq[i] = "E0"

    # Trees with DBH and/or height values outside of allometric equation cutoffs
    # will have NA biomass estimates
    } else if (tree_data$status[i] == 1 & tree_data$dbh_in[i] < 1.0) {

      tree_data$branch_eq[i] = "E0"

    } else if (tree_data$status[i] == 0 & tree_data$dbh_in[i] < 5.0) {

      tree_data$branch_eq[i] = "E0"

    } else if (tree_data$ht_ft[i] < 4.5) {

      tree_data$branch_eq[i] = "E0"

    } else {

        # softwood equations----------------------------------------------------
        if (tree_data$species[i] == "ABCO" | tree_data$species[i] == "ABGR" |
            tree_data$species[i] == "15" | tree_data$species[i] == "17") {

          tree_data$branch_eq[i] = "E1"

        } else if (tree_data$species[i] == "ABMA" | tree_data$species[i] == "ABPR" |
                   tree_data$species[i] == "20" | tree_data$species[i] == "22") {

          tree_data$branch_eq[i] = "E3"

        } else if(tree_data$species[i] == "PSME" |
                  tree_data$species[i] == "202") {

          tree_data$branch_eq[i] = "E6"

        } else if (tree_data$species[i] == "PIJE" | tree_data$species[i] == "PIPO" | tree_data$species[i] == "PISA" |
                   tree_data$species[i] == "116" | tree_data$species[i] == "122" | tree_data$species[i] == "127") {

          tree_data$branch_eq[i] = "E7"

        } else if (tree_data$species[i] == "PILA" |
                   tree_data$species[i] == "117") {

          tree_data$branch_eq[i] = "E8"

        } else if (tree_data$species[i] == "PIMO" |
                   tree_data$species[i] == "119") {

          tree_data$branch_eq[i] = "E9"

        } else if (tree_data$species[i] == "CADE" | tree_data$species[i] == "SEGI" | tree_data$species[i] == "SESE" |
                   tree_data$species[i] == "TOCA" | tree_data$species[i] == "TABR" |
                   tree_data$species[i] == "81" | tree_data$species[i] == "212" | tree_data$species[i] == "211" |
                   tree_data$species[i] == "251" | tree_data$species[i] == "231") {

          tree_data$branch_eq[i] = "E10"

        } else if (tree_data$species[i] == "PICO" |
                   tree_data$species[i] == "108") {

          tree_data$branch_eq[i] = "E11"

        } else if (tree_data$species[i] == "TSHE" |
                   tree_data$species[i] == "263") {

          tree_data$branch_eq[i] = "E12"

        } else if (tree_data$species[i] == "JUOC" |
                   tree_data$species[i] == "64") {

          tree_data$branch_eq[i] = "E13"

        } else if (tree_data$species[i] == "UNCO" | tree_data$species[i] == "TSME" |
                   tree_data$species[i] == "298" | tree_data$species[i] == "264") {

          tree_data$branch_eq[i] = "E17"

        # hardwood equations----------------------------------------------------
        } else if (tree_data$species[i] == "POTR" |
                   tree_data$species[i] == "746") {

          tree_data$branch_eq[i] = "E14"

        } else if (tree_data$species[i] == "ALRH" |
                   tree_data$species[i] == "352") {

          tree_data$branch_eq[i] = "E16"

        } else {

          tree_data$branch_eq[i] = "E0"

        }

    }


    ############################################################################
    # Part II: calculate biomass
    ############################################################################

    if (tree_data$branch_eq[i] == "E0") {

      tree_data$branch_bio_kg[i] <- NA

    } else if (tree_data$branch_eq[i] == "E1") {

      tree_data$branch_bio_kg[i] <- (13.0 + 12.4*((tree_data$dbh_cm[i]/100)^2)*tree_data$ht_m[i])

    } else if (tree_data$branch_eq[i] == "E3") {

      tree_data$branch_bio_kg[i] <- (exp(-4.1817 + 2.3324*log(tree_data$dbh_cm[i])))

    } else if (tree_data$branch_eq[i] == "E6") {

      tree_data$branch_bio_kg[i] <- (exp(-3.6941 + 2.1382*log(tree_data$dbh_cm[i])))

    } else if (tree_data$branch_eq[i] == "E7") {

      tree_data$branch_bio_kg[i] <- (exp(-4.1068 + 1.5177*log(tree_data$dbh_cm[i]) + 1.0424*log(tree_data$ht_m[i])))

    } else if (tree_data$branch_eq[i] == "E8") {

      tree_data$branch_bio_kg[i] <- (exp(-7.637 + 3.3648*log(tree_data$dbh_cm[i])))

    } else if (tree_data$branch_eq[i] == "E9") {

      tree_data$branch_bio_kg[i] <- (9.5 + 16.8*((tree_data$dbh_cm[i]/100)^2)*tree_data$ht_m[i])

    } else if (tree_data$branch_eq[i] == "E10") {

      tree_data$branch_bio_kg[i] <- (0.199 + 0.00381*(tree_data$dbh_cm[i]^2)*tree_data$ht_m[i])

    } else if (tree_data$branch_eq[i] == "E11") {

      tree_data$branch_bio_kg[i] <- (7.8 + 12.3*((tree_data$dbh_cm[i]/100)^2)*tree_data$ht_m[i])

    } else if (tree_data$branch_eq[i] == "E12") {

      tree_data$branch_bio_kg[i] <- (exp(-4.570 + 2.271*log(tree_data$dbh_cm[i])))

    } else if (tree_data$branch_eq[i] == "E13") {

      tree_data$branch_bio_kg[i] <- (exp(-7.2775 + 2.3337*log(tree_data$dbh_cm[i]*pi)))

    } else if (tree_data$branch_eq[i] == "E14") {

      tree_data$branch_bio_kg[i] <- (1.7 + 26.2*((tree_data$dbh_cm[i]/100)^2)*tree_data$ht_m[i])

    } else if (tree_data$branch_eq[i] == "E16") {

      BF <- ((exp(-4.5648 + 2.6232*log(tree_data$dbh_cm[i])))*(1/(2.7638 + 0.062*(tree_data$dbh_cm[i]^1.3364))))

      tree_data$branch_bio_kg[i] <- (exp(-4.5648 + 2.6232*log(tree_data$dbh_cm[i])) - BF)

    } else if (tree_data$branch_eq[i] == "E17") {

      tree_data$branch_bio_kg[i] <- (exp(-5.2581 + 2.6045*log(tree_data$dbh_cm[i])))

    }


    ############################################################################
    # Part III: calculate total biomass
    ############################################################################

    tree_data$branch_bio_kg[i] <- round(tree_data$branch_bio_kg[i],2)

    if (is.na(tree_data$stem_bio_kg[i]) & is.na(tree_data$bark_bio_kg[i]) & is.na(tree_data$branch_bio_kg[i])) {

      tree_data$total_bio_kg[i] <- NA

    } else {

      tree_data$total_bio_kg[i] <- sum(tree_data$stem_bio_kg[i], tree_data$bark_bio_kg[i], tree_data$branch_bio_kg[i], na.rm = TRUE)

    }

  }

  tree_data_return <- subset(tree_data, select = -c(branch_eq, density))

  return(tree_data_return)

}
