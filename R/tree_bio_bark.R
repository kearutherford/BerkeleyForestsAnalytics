BarkBiomass <- function(tree_data) {

  tree_data$bark_eq <- as.character(NA)
  tree_data$bark_bio_kg <- as.double(NA)
  n <- nrow(tree_data)

  for (i in 1:n) {

    ############################################################################
    # Part I: assign biomass equation numbers
    ############################################################################

    # Trees with NA species codes or status codes will have NA biomass estimates
    if(is.na(tree_data$species[i]) | is.na(tree_data$status[i]) |
       is.na(tree_data$dbh_in[i]) | is.na(tree_data$ht_ft[i])) {

      tree_data$bark_eq[i] = "E0"

    # Trees with DBH and/or height values outside of allometric equation cutoffs
    # will have NA biomass estimates
    } else if (tree_data$status[i] == 1 & tree_data$dbh_in[i] < 1.0) {

      tree_data$bark_eq[i] = "E0"

    } else if (tree_data$status[i] == 0 & tree_data$dbh_in[i] < 5.0) {

      tree_data$bark_eq[i] = "E0"

    } else if (tree_data$ht_ft[i] < 4.5) {

      tree_data$bark_eq[i] = "E0"

    } else {

        # softwood equations----------------------------------------------------
        if (tree_data$species[i] == "ABCO" | tree_data$species[i] == "15") {

          tree_data$bark_eq[i] = "E1"

        } else if (tree_data$species[i] == "ABGR" | tree_data$species[i] == "17") {

          tree_data$bark_eq[i] = "E2"

        } else if (tree_data$species[i] == "ABMA" | tree_data$species[i] == "20") {

          tree_data$bark_eq[i] = "E4"

        } else if (tree_data$species[i] == "ABPR" | tree_data$species[i] == "22") {

          tree_data$bark_eq[i] = "E5"

        } else if(tree_data$species[i] == "PSME" | tree_data$species[i] == "202") {

          tree_data$bark_eq[i] = "E8"

        } else if (tree_data$species[i] == "PIJE" | tree_data$species[i] == "PIPO" | tree_data$species[i] == "PISA" |
                   tree_data$species[i] == "116" | tree_data$species[i] == "122" | tree_data$species[i] == "127") {

          tree_data$bark_eq[i] = "E9"

        } else if (tree_data$species[i] == "PILA" | tree_data$species[i] == "117") {

          tree_data$bark_eq[i] = "E10"

        } else if (tree_data$species[i] == "PIMO" | tree_data$species[i] == "119") {

          tree_data$bark_eq[i] = "E11"

        } else if (tree_data$species[i] == "CADE" | tree_data$species[i] == "81") {

          tree_data$bark_eq[i] = "E12"

        } else if (tree_data$species[i] == "TOCA" | tree_data$species[i] == "TABR" |
                   tree_data$species[i] == "251" | tree_data$species[i] == "231") {

          tree_data$bark_eq[i] = "E13"

        } else if (tree_data$species[i] == "PICO" | tree_data$species[i] == "108") {

          tree_data$bark_eq[i] = "E14"

        } else if (tree_data$species[i] == "TSHE" | tree_data$species[i] == "263") {

          tree_data$bark_eq[i] = "E15"

        } else if (tree_data$species[i] == "JUOC" | tree_data$species[i] == "64") {

          tree_data$bark_eq[i] = "E16"

        } else if (tree_data$species[i] == "UNCO" | tree_data$species[i] == "TSME" |
                   tree_data$species[i] == "298" | tree_data$species[i] == "264") {

          tree_data$bark_eq[i] = "E21"

        } else if (tree_data$species[i] == "SEGI" | tree_data$species[i] == "212") {

            if(tree_data$dbh_in[i] > 39.37) {
              tree_data$bark_eq[i] = "E17"
            } else {
              tree_data$bark_eq[i] = "E13"
            }

        } else if (tree_data$species[i] == "SESE" | tree_data$species[i] == "211") {

            if(tree_data$dbh_in[i] > 39.37) {
              tree_data$bark_eq[i] = "E17"
            } else {
              tree_data$bark_eq[i] = "E13"
            }

        # hardwood equations----------------------------------------------------
        } else if (tree_data$species[i] == "POTR" | tree_data$species[i] == "746") {

          tree_data$bark_eq[i] = "E18"

        } else if (tree_data$species[i] == "ALRH" | tree_data$species[i] == "352") {

          tree_data$bark_eq[i] = "E20"

        } else {

          tree_data$bark_eq[i] = "E0"

        }

    }


    ############################################################################
    # Part II: calculate biomass
    ############################################################################

    if (tree_data$bark_eq[i] == "E0") {

      tree_data$bark_bio_kg[i] <- NA

    } else if (tree_data$bark_eq[i] == "E1") {

      tree_data$bark_bio_kg[i] <- (exp(2.1069 + 2.7271*log(tree_data$dbh_cm[i]))/1000)

    } else if (tree_data$bark_eq[i] == "E2") {

      tree_data$bark_bio_kg[i] <- (0.6 + 16.4*((tree_data$dbh_cm[i]/100)^2)*tree_data$ht_m[i])

    } else if (tree_data$bark_eq[i] == "E4") {

      tree_data$bark_bio_kg[i] <- (exp(1.47146 + 2.8421*log(tree_data$dbh_cm[i]))/1000)

    } else if (tree_data$bark_eq[i] == "E5") {

      tree_data$bark_bio_kg[i] <- (exp(2.79189 + 2.4313*log(tree_data$dbh_cm[i]))/1000)

    } else if (tree_data$bark_eq[i] == "E8") {

      tree_data$bark_bio_kg[i] <- (exp(-4.3103 + 2.4300*log(tree_data$dbh_cm[i])))

    } else if (tree_data$bark_eq[i] == "E9") {

      tree_data$bark_bio_kg[i] <- (exp(-3.6263 + 1.34077*log(tree_data$dbh_cm[i]) + 0.8567*log(tree_data$ht_m[i])))

    } else if (tree_data$bark_eq[i] == "E10") {

      tree_data$bark_bio_kg[i] <- (exp(2.183174 + 2.6610*log(tree_data$dbh_cm[i]))/1000)

    } else if (tree_data$bark_eq[i] == "E11") {

      tree_data$bark_bio_kg[i] <- (1.2 + 11.2*((tree_data$dbh_cm[i]/100)^2)*tree_data$ht_m[i])

    } else if (tree_data$bark_eq[i] == "E12") {

      tree_data$bark_bio_kg[i] <- (exp(-13.3146 + 2.8594*log(tree_data$dbh_cm[i]))*1000)

    } else if (tree_data$bark_eq[i] == "E13") {

      tree_data$bark_bio_kg[i] <- (0.336 + 0.00058*(tree_data$dbh_cm[i]^2)*tree_data$ht_m[i])

    } else if (tree_data$bark_eq[i] == "E14") {

      tree_data$bark_bio_kg[i] <- (3.2 + 9.1*((tree_data$dbh_cm[i]/100)^2)*tree_data$ht_m[i])

    } else if (tree_data$bark_eq[i] == "E15") {

      tree_data$bark_bio_kg[i] <- (exp(-4.371 + 2.259*log(tree_data$dbh_cm[i])))

    } else if (tree_data$bark_eq[i] == "E16") {

      tree_data$bark_bio_kg[i] <- (exp(-10.175 + 2.6333*log(tree_data$dbh_cm[i]*pi)))

    } else if (tree_data$bark_eq[i] == "E17") {

      tree_data$bark_bio_kg[i] <- (exp(7.189689 + 1.5837*log(tree_data$dbh_cm[i]))/1000)

    } else if (tree_data$bark_eq[i] == "E18") {

      tree_data$bark_bio_kg[i] <- (1.3 + 27.6*((tree_data$dbh_cm[i]/100)^2)*tree_data$ht_m[i])

    } else if (tree_data$bark_eq[i] == "E20") {

      tree_data$bark_bio_kg[i] <- (exp(-4.6424 + 2.4617*log(tree_data$dbh_cm[i])))

    } else if (tree_data$bark_eq[i] == "E21") {

      tree_data$bark_bio_kg[i] <- (0.9 + 27.4*((tree_data$dbh_cm[i]/100)^2)*tree_data$ht_m[i])

    }

  }

  tree_data$bark_bio_tons <- round((tree_data$bark_bio_kg*0.0011023),2)
  tree_data$bark_bio_kg <- round(tree_data$bark_bio_kg,2)
  tree_data_return <- subset(tree_data, select = -c(bark_eq))

  return(tree_data_return)

}
