StemBiomass <- function(tree_data) {

  tree_data$vol_eq <- as.character(NA)
  tree_data$eq_group <- as.character(NA)
  tree_data$density <- as.double(NA)
  tree_data$CVTS <- as.double(NA)
  n <- nrow(tree_data)

  for (i in 1:n) {

    # Trees with NA species codes or status codes will have NA biomass estimates
    if(is.na(tree_data$species[i]) | is.na(tree_data$status[i])) {

      tree_data$vol_eq[i] = "E0"
      tree_data$eq_group[i] = "G2"
      tree_data$density[i] = NA

    # Trees with DBH and/or height values outside of allometric equation cutoffs
    # will have NA biomass estimates
    } else if (tree_data$status[i] == 1 & tree_data$dbh_in[i] < 1.0) {

      tree_data$vol_eq[i] = "E0"
      tree_data$eq_group[i] = "G2"
      tree_data$density[i] = NA

    } else if (tree_data$status[i] == 0 & tree_data$dbh_in[i] < 5.0) {

      tree_data$vol_eq[i] = "E0"
      tree_data$eq_group[i] = "G2"
      tree_data$density[i] = NA

    } else if (tree_data$ht_ft[i] < 4.5) {

      tree_data$vol_eq[i] = "E0"
      tree_data$eq_group[i] = "G2"
      tree_data$density[i] = NA

    } else {

       #########################################################################
       # Part I: assign volume equation numbers
       #########################################################################

        # softwood equations-----------------------------------------------------
        if(tree_data$species[i] == "PSME" |
           tree_data$species[i] == "202") {

          tree_data$vol_eq[i] = "E3"
          tree_data$eq_group[i] = "G1"

        } else if (tree_data$species[i] == "PIJE" | tree_data$species[i] == "PIPO" | tree_data$species[i] == "PISA" |
                   tree_data$species[i] == "116" | tree_data$species[i] == "122" | tree_data$species[i] == "127") {

          tree_data$vol_eq[i] = "E5"
          tree_data$eq_group[i] = "G1"

        } else if (tree_data$species[i] == "TSHE" |
                   tree_data$species[i] == "263") {

          tree_data$vol_eq[i] = "E6"
          tree_data$eq_group[i] = "GX"

        } else if (tree_data$species[i] == "TOCA" | tree_data$species[i] == "TABR" |
                   tree_data$species[i] == "251" | tree_data$species[i] == "231") {

          tree_data$vol_eq[i] = "E8"
          tree_data$eq_group[i] = "G2"

        } else if (tree_data$species[i] == "PICO" |
                   tree_data$species[i] == "108") {

          tree_data$vol_eq[i] = "E16"
          tree_data$eq_group[i] = "G1"

        } else if (tree_data$species[i] == "UNCO" | tree_data$species[i] == "TSME" |
                   tree_data$species[i] == "298" | tree_data$species[i] == "264") {

          tree_data$vol_eq[i] = "E17"
          tree_data$eq_group[i] = "G2"

        } else if (tree_data$species[i] == "ABMA" | tree_data$species[i] == "ABPR" |
                   tree_data$species[i] == "20" | tree_data$species[i] == "22") {

          tree_data$vol_eq[i] = "E18"
          tree_data$eq_group[i] = "G1"

        } else if (tree_data$species[i] == "CADE" |
                   tree_data$species[i] == "81") {

          tree_data$vol_eq[i] = "E19"
          tree_data$eq_group[i] = "G2"

        } else if (tree_data$species[i] == "PILA" | tree_data$species[i] == "PIMO" |
                   tree_data$species[i] == "117" | tree_data$species[i] == "119") {

          tree_data$vol_eq[i] = "E20"
          tree_data$eq_group[i] = "G1"

        } else if (tree_data$species[i] == "JUOC" |
                   tree_data$species[i] == "64") {

          tree_data$vol_eq[i] = "E21"
          tree_data$eq_group[i] = "G2"

        } else if (tree_data$species[i] == "ABCO" | tree_data$species[i] == "ABGR" |
                   tree_data$species[i] == "15" | tree_data$species[i] == "17" ) {

          tree_data$vol_eq[i] = "E23"
          tree_data$eq_group[i] = "G1"

        } else if (tree_data$species[i] == "SESE" | tree_data$species[i] == "SEGI" |
                   tree_data$species[i] == "211" | tree_data$species[i] == "212") {

          tree_data$vol_eq[i] = "E24"
          tree_data$eq_group[i] = "G2"

        # hardwood equations----------------------------------------------------
        } else if (tree_data$species[i] == "ALRH" |
                   tree_data$species[i] == "352") {

          tree_data$vol_eq[i] = "E26"
          tree_data$eq_group[i] = "G2"

        } else if (tree_data$species[i] == "POTR" |
                   tree_data$species[i] == "746") {

         tree_data$vol_eq[i] = "E28"
         tree_data$eq_group[i] = "G2"

        } else if (tree_data$species[i] == "CHCH" |
                   tree_data$species[i] == "431") {

         tree_data$vol_eq[i] = "E32"
         tree_data$eq_group[i] = "G2"

        } else if (tree_data$species[i] == "UMCA" |
                   tree_data$species[i] == "981") {

          tree_data$vol_eq[i] = "E33"
          tree_data$eq_group[i] = "G2"

       } else if (tree_data$species[i] == "NODE" |
                  tree_data$species[i] == "631") {

          tree_data$vol_eq[i] = "E34"
          tree_data$eq_group[i] = "G2"

       } else if (tree_data$species[i] == "ACMA" | tree_data$species[i] == "CONU" |
                  tree_data$species[i] == "312" | tree_data$species[i] == "492") {

          tree_data$vol_eq[i] = "E37"
          tree_data$eq_group[i] = "G2"

        } else if (tree_data$species[i] == "QUKE" |
                   tree_data$species[i] == "818") {

          tree_data$vol_eq[i] = "E38"
          tree_data$eq_group[i] = "G2"

        } else if (tree_data$species[i] == "ARME" | tree_data$species[i] == "SASP" |
                   tree_data$species[i] == "361" | tree_data$species[i] == "920") {

          tree_data$vol_eq[i] = "E40"
          tree_data$eq_group[i] = "G2"

        } else if (tree_data$species[i] == "UNHA" | tree_data$species[i] == "UNTR" |
                   tree_data$species[i] == "998" | tree_data$species[i] == "999") {

          tree_data$vol_eq[i] = "E41"
          tree_data$eq_group[i] = "G2"

        } else if (tree_data$species[i] == "QUCH" |
                   tree_data$species[i] == "805") {

          tree_data$vol_eq[i] = "E42"
          tree_data$eq_group[i] = "G2"

        } else if (tree_data$species[i] == "QUAG" |
                   tree_data$species[i] == "801") {

          tree_data$vol_eq[i] = "E43"
          tree_data$eq_group[i] = "G2"

        }


        ########################################################################
        # Part II: assign wood density
        ########################################################################

        # softwoods-------------------------------------------------------------
        if(tree_data$species[i] == "PSME" | tree_data$species[i] == "202") {
           tree_data$density[i] = 28.08
        } else if (tree_data$species[i] == "PIJE" | tree_data$species[i] == "116") {
          tree_data$density[i] = 23.09
        } else if (tree_data$species[i] == "PIPO" | tree_data$species[i] == "122") {
          tree_data$density[i] = 23.71
        } else if (tree_data$species[i] == "PISA" | tree_data$species[i] == "127") {
          tree_data$density[i] = 24.96
        } else if (tree_data$species[i] == "TSHE" | tree_data$species[i] == "263") {
          tree_data$density[i] = 26.21
        } else if (tree_data$species[i] == "TOCA" | tree_data$species[i] == "251") {
          tree_data$density[i] = 25.58
        } else if (tree_data$species[i] == "TABR" | tree_data$species[i] == "231") {
          tree_data$density[i] = 37.44
        } else if (tree_data$species[i] == "PICO" | tree_data$species[i] == "108") {
          tree_data$density[i] = 23.71
        } else if (tree_data$species[i] == "UNCO" | tree_data$species[i] == "298") {

            if(tree_data$status[i] == 0) {
              tree_data$density[i] = 25.58
            } else {
              tree_data$density[i] = 32.45
            }

        } else if (tree_data$species[i] == "ABMA" | tree_data$species[i] == "20") {
          tree_data$density[i] = 22.46
        } else if (tree_data$species[i] == "CADE" | tree_data$species[i] == "81") {
          tree_data$density[i] = 21.84
        } else if (tree_data$species[i] == "PILA" | tree_data$species[i] == "117") {
          tree_data$density[i] = 21.22
        } else if (tree_data$species[i] == "PIMO" | tree_data$species[i] == "119") {
          tree_data$density[i] = 22.46
        } else if (tree_data$species[i] == "JUOC" | tree_data$species[i] == "64") {
          tree_data$density[i] = 28.08
        } else if (tree_data$species[i] == "ABCO" | tree_data$species[i] == "15") {
          tree_data$density[i] = 23.09
        } else if (tree_data$species[i] == "SESE" | tree_data$species[i] == "211") {
          tree_data$density[i] = 22.46
        } else if (tree_data$species[i] == "SEGI" | tree_data$species[i] == "212") {
          tree_data$density[i] = 21.22
        } else if (tree_data$species[i] == "ABPR" | tree_data$species[i] == "22") {
          tree_data$density[i] = 23.09
        } else if (tree_data$species[i] == "ABGR" | tree_data$species[i] == "17") {
          tree_data$density[i] = 21.84
        } else if (tree_data$species[i] == "TSME" | tree_data$species[i] == "264") {
          tree_data$density[i] = 26.21

        # hardwoods-----------------------------------------------------------------
        } else if (tree_data$species[i] == "CONU" | tree_data$species[i] == "492") {
          tree_data$density[i] = 36.19
        } else if (tree_data$species[i] == "ALRH" | tree_data$species[i] == "352") {
          tree_data$density[i] = 23.09
        } else if (tree_data$species[i] == "POTR" | tree_data$species[i] == "746") {
          tree_data$density[i] = 21.84
        } else if (tree_data$species[i] == "UMCA" | tree_data$species[i] == "981") {
          tree_data$density[i] = 31.82
        } else if (tree_data$species[i] == "NODE" | tree_data$species[i] == "631") {
          tree_data$density[i] = 36.19
        } else if (tree_data$species[i] == "ACMA" | tree_data$species[i] == "312") {
          tree_data$density[i] = 27.46
        } else if (tree_data$species[i] == "QUKE" | tree_data$species[i] == "818") {
          tree_data$density[i] = 31.82
        } else if (tree_data$species[i] == "ARME" | tree_data$species[i] == "361") {
          tree_data$density[i] = 36.19
        } else if (tree_data$species[i] == "QUCH" | tree_data$species[i] == "805") {
          tree_data$density[i] = 43.68
        } else if (tree_data$species[i] == "QUAG" | tree_data$species[i] == "801") {
          tree_data$density[i] = 36.82
        } else if (tree_data$species[i] == "CHCH" | tree_data$species[i] == "431") {
          tree_data$density[i] = 26.21
        } else if (tree_data$species[i] == "UNHA" | tree_data$species[i] == "998") {
          tree_data$density[i] = 32.45
        } else if (tree_data$species[i] == "UNTR" | tree_data$species[i] == "999") {
          tree_data$density[i] = 32.45
        } else if (tree_data$species[i] == "SASP" | tree_data$species[i] == "920") {
          tree_data$density[i] = 22.46
        }

    }


    ############################################################################
    # Part III: calculate cubic foot volume
    ############################################################################

    # Group 1, small trees -----------------------------------------------------
    if (tree_data$eq_group[i] == "G1" & !is.na(tree_data$dbh_in[i]) & tree_data$dbh_in[i] < 6.0) {

      TMP_DBH <- 6
      BA <- ((tree_data$dbh_in[i]^2)*0.005454154)
      BA_TMP <- ((TMP_DBH^2)*0.005454154)

      if(tree_data$vol_eq[i] == "E3") {
        CF4_TMP_calc <- (0.248569 + 0.0253524*(tree_data$ht_ft[i]/TMP_DBH) - 0.0000560175*(tree_data$ht_ft[i]^2/TMP_DBH))
      } else if (tree_data$vol_eq[i] == "E5") {
        CF4_TMP_calc <- (0.402060 - 0.899914*(1/TMP_DBH))
      } else if (tree_data$vol_eq[i] == "E16") {
        CF4_TMP_calc <- (0.422709 - 0.0000612236*(tree_data$ht_ft[i]^2/TMP_DBH))
      } else if (tree_data$vol_eq[i] == "E18") {
        CF4_TMP_calc <- (0.231237 + 0.028176*(tree_data$ht_ft[i]/TMP_DBH))
      } else if (tree_data$vol_eq[i] == "E20") {
        CF4_TMP_calc <- (0.358550 - 0.488134*(1/TMP_DBH))
      } else if (tree_data$vol_eq[i] == "E23") {
        CF4_TMP_calc <- (0.299039 + 1.91272*(1/tree_data$ht_ft[i]) + 0.0000367217*(tree_data$ht_ft[i]^2/TMP_DBH))
      }

      if(CF4_TMP_calc < 0.3) {
        CF4_TMP = 0.3
      } else if (CF4_TMP_calc > 0.4) {
        CF4_TMP = 0.4
      } else {
        CF4_TMP = CF4_TMP_calc
      }

      TERM <- ((1.033*(1.0 + 1.382937*exp(-4.015292*(tree_data$dbh_in[i]/10.0))))*(BA + 0.087266) - 0.174533)
      CV4_TMP <- (CF4_TMP*BA_TMP*tree_data$ht_ft[i])
      TARIF_TMP_calc <- ((CV4_TMP*0.912733)/(BA_TMP - 0.087266))

      if(TARIF_TMP_calc <= 0.0) {
        TARIF_TMP = 0.01
      } else {
        TARIF_TMP = TARIF_TMP_calc
      }

      TARIF_calc <- (TARIF_TMP*(0.5*(TMP_DBH-tree_data$dbh_in[i])^2 + (1.0 + 0.063*(TMP_DBH - tree_data$dbh_in[i])^2)))

      if(TARIF_calc <= 0.0) {
        TARIF = 0.01
      } else {
        TARIF = TARIF_calc
      }

      CVTS_small_G1 <- (TARIF*TERM)
      tree_data$CVTS[i] <- CVTS_small_G1

      rm(TMP_DBH, BA, BA_TMP, CF4_TMP_calc, CF4_TMP, TERM, CV4_TMP, TARIF_TMP_calc, TARIF_TMP, TARIF_calc, TARIF, CVTS_small_G1)

    # Group 1, large trees -----------------------------------------------------
    } else if (tree_data$eq_group[i] == "G1" & !is.na(tree_data$dbh_in[i]) & tree_data$dbh_in[i] >= 6.0) {

      BA <- (tree_data$dbh_in[i]^2)*0.005454154

      if(tree_data$vol_eq[i] == "E3") {
        CF4_calc <- (0.248569 + 0.0253524*(tree_data$ht_ft[i]/tree_data$dbh_in[i]) - 0.0000560175*(tree_data$ht_ft[i]^2/tree_data$dbh_in[i]))
      } else if (tree_data$vol_eq[i] == "E5") {
        CF4_calc <- (0.402060 - 0.899914*(1/tree_data$dbh_in[i]))
      } else if (tree_data$vol_eq[i] == "E16") {
        CF4_calc <- (0.422709 - 0.0000612236*(tree_data$ht_ft[i]^2/tree_data$dbh_in[i]))
      } else if (tree_data$vol_eq[i] == "E18") {
        CF4_calc <- (0.231237 + 0.028176*(tree_data$ht_ft[i]/tree_data$dbh_in[i]))
      } else if (tree_data$vol_eq[i] == "E20") {
        CF4_calc <- (0.358550 - 0.488134*(1/tree_data$dbh_in[i]))
      } else if (tree_data$vol_eq[i] == "E23") {
        CF4_calc <- (0.299039 + 1.91272*(1/tree_data$ht_ft[i]) + 0.0000367217*(tree_data$ht_ft[i]^2/tree_data$dbh_in[i]))
      }

      if(CF4_calc < 0.3) {
        CF4 = 0.3
      } else if (CF4_calc > 0.4) {
        CF4 = 0.4
      } else {
        CF4 = CF4_calc
      }

      TERM <- ((1.033*(1.0 + 1.382937*exp(-4.015292*(tree_data$dbh_in[i]/10.0))))*(BA + 0.087266) - 0.174533)
      CV4 <- CF4*BA*tree_data$ht_ft[i]
      CVTS_large_G1 <- ((CV4*TERM)/(BA - 0.087266))
      tree_data$CVTS[i] <- CVTS_large_G1

      rm(BA, CF4, CF4_calc, TERM, CV4, CVTS_large_G1)

    # Equation 19, small trees -------------------------------------------------
    } else if (tree_data$vol_eq[i] == "E19" & !is.na(tree_data$dbh_in[i]) & tree_data$dbh_in[i] < 6.0) {

      TMP_DBH <- 6
      BA <- ((tree_data$dbh_in[i]^2)*0.005454154)
      BA_TMP <- ((TMP_DBH^2)*0.005454154)
      CF4_TMP_calc <- (0.225786 + 4.44236*(1/tree_data$ht_ft[i]))

      if(CF4_TMP_calc < 0.27) {
        CF4_TMP = 0.27
      } else {
        CF4_TMP = CF4_TMP_calc
      }

      TERM <- ((1.033*(1.0 + 1.382937*exp(-4.015292*(tree_data$dbh_in[i]/10.0))))*(BA + 0.087266) - 0.174533)
      CV4_TMP <- (CF4_TMP*BA_TMP*tree_data$ht_ft[i])
      TARIF_TMP_calc <- ((CV4_TMP*0.912733)/(BA_TMP - 0.087266))

      if(TARIF_TMP_calc <= 0.0) {
        TARIF_TMP = 0.01
      } else {
        TARIF_TMP = TARIF_TMP_calc
      }

      TARIF_calc <- (TARIF_TMP*(0.5*(TMP_DBH-tree_data$dbh_in[i])^2 + (1.0 + 0.063*(TMP_DBH - tree_data$dbh_in[i])^2)))

      if(TARIF_calc <= 0.0) {
        TARIF = 0.01
      } else {
        TARIF = TARIF_calc
      }

      CVTS_small_G2 <- (TARIF*TERM)
      tree_data$CVTS[i] <- CVTS_small_G2

      rm(TMP_DBH, BA, BA_TMP, CF4_TMP_calc, CF4_TMP, TERM, CV4_TMP, TARIF_TMP_calc, TARIF_TMP, TARIF_calc, TARIF, CVTS_small_G2)

    # Equation 19, large trees -------------------------------------------------
    } else if (tree_data$vol_eq[i] == "E19" & !is.na(tree_data$dbh_in[i]) & tree_data$dbh_in[i] >= 6.0) {

      BA <- ((tree_data$dbh_in[i]^2)*0.005454154)
      CF4_calc <- (0.225786 + 4.44236*(1/tree_data$ht_ft[i]))

      if(CF4_calc < 0.27) {
        CF4 = 0.27
      } else {
        CF4 = CF4_calc
      }

      TERM <- ((1.033*(1.0 + 1.382937*exp(-4.015292*(tree_data$dbh_in[i]/10.0))))*(BA + 0.087266) - 0.174533)
      CV4 <- (CF4*BA*tree_data$ht_ft[i])
      CVTS_large_G2 <- ((CV4*TERM)/(BA - 0.087266))
      tree_data$CVTS[i] <- CVTS_large_G2

      rm(BA, CF4, CF4_calc, TERM, CV4, CVTS_large_G2)

    # All other equations ------------------------------------------------------
    } else if (tree_data$vol_eq[i] == "E6") {

      CVTSL <- (-2.72170 + (2.00857*log10(tree_data$dbh_in[i])) + (1.08620*log10(tree_data$ht_ft[i])) - (0.00568*tree_data$dbh_in[i]))
      CVTS_6 <- (10^(CVTSL))
      tree_data$CVTS[i] <- CVTS_6

      rm(CVTSL, CVTS_6)

    } else if (tree_data$vol_eq[i] == "E8") {

      CVTSL <- (-2.464614 + (1.701993*log10(tree_data$dbh_in[i])) + (1.067038*log10(tree_data$ht_ft[i])))
      CVTS_8 <- (10^(CVTSL))
      tree_data$CVTS[i] <- CVTS_8

      rm(CVTSL, CVTS_8)

    } else if (tree_data$vol_eq[i] == "E17") {

      CVTS_17 <- (0.001106485*(tree_data$dbh_in[i])^1.8140497*(tree_data$ht_ft[i])^1.2744923)
      tree_data$CVTS[i] <- CVTS_17

      rm(CVTS_17)

    } else if (tree_data$vol_eq[i] == "E21") {

      CVTS_21 <- (0.005454154*(0.30708901 + 0.00086157622*tree_data$ht_ft[i]-0.0037255243*tree_data$dbh_in[i]*(tree_data$ht_ft[i]/(tree_data$ht_ft[i]-4.5)))*
                 (tree_data$dbh_in[i]^2)*tree_data$ht_ft[i]*(tree_data$ht_ft[i]/(tree_data$ht_ft[i]-4.5))^2)
      tree_data$CVTS[i] <- CVTS_21

      rm(CVTS_21)

    } else if (tree_data$vol_eq[i] == "E24") {

      CVTS_24 <- exp(-6.2597 + 1.9967*log(tree_data$dbh_in[i]) + 0.9642*log(tree_data$ht_ft[i]))
      tree_data$CVTS[i] <- CVTS_24

      rm(CVTS_24)

    } else if (tree_data$vol_eq[i] == "E26") {

      CVTSL <- (-2.672775 + (1.920617*log10(tree_data$dbh_in[i])) + (1.074024*log10(tree_data$ht_ft[i])))
      CVTS_26 <- (10^(CVTSL))
      tree_data$CVTS[i] <- CVTS_26

      rm(CVTSL, CVTS_26)

    } else if (tree_data$vol_eq[i] == "E28") {

      CVTSL <- (-2.635360 + (1.946034*log10(tree_data$dbh_in[i])) + (1.024793*log10(tree_data$ht_ft[i])))
      CVTS_28 <- (10^(CVTSL))
      tree_data$CVTS[i] <- CVTS_28

      rm(CVTSL, CVTS_28)

    } else if (tree_data$vol_eq[i] == "E32") {

      CVTS_32 <- (0.0120372263*(tree_data$dbh_in[i]^2.02232)*(tree_data$ht_ft[i]^0.68638))
      tree_data$CVTS[i] <- CVTS_32

      rm(CVTS_32)

    } else if (tree_data$vol_eq[i] == "E33") {

      CVTS_33 <- (0.0057821322*(tree_data$dbh_in[i]^1.94553)*(tree_data$ht_ft[i]^0.88389))
      tree_data$CVTS[i] <- CVTS_33

      rm(CVTS_33)

    } else if (tree_data$vol_eq[i] == "E34") {

      if (tree_data$ht_ft[i] > 120) {
        ht_34 <- 120
      } else {
        ht_34 <- tree_data$ht_ft[i]
      }

      CVTS_34 <- (0.0058870024*(tree_data$dbh_in[i]^1.94165)*(ht_34^0.86562))
      tree_data$CVTS[i] <- CVTS_34

      rm(CVTS_34, ht_34)

    } else if (tree_data$vol_eq[i] == "E37") {

      CVTS_37 <- (0.0101786350*(tree_data$dbh_in[i]^2.22462)*(tree_data$ht_ft[i]^0.57561))
      tree_data$CVTS[i] <- CVTS_37

      rm(CVTS_37)

    } else if (tree_data$vol_eq[i] == "E38") {

      CVTS_38 <- (0.0070538108*(tree_data$dbh_in[i])^1.97437*(tree_data$ht_ft[i]^0.85034))
      tree_data$CVTS[i] <- CVTS_38

      rm(CVTS_38)

    } else if (tree_data$vol_eq[i] == "E40") {

      if (tree_data$ht_ft[i] > 120) {
        ht_40 <- 120
      } else {
        ht_40 <- tree_data$ht_ft[i]
      }

      CVTS_40 <-(0.0067322665*(tree_data$dbh_in[i]^1.96628)*(ht_40^0.83458))
      tree_data$CVTS[i] <- CVTS_40

      rm(CVTS_40, ht_40)

    } else if (tree_data$vol_eq[i] == "E41") {

      CVTS_41 <- (0.0072695058*(tree_data$dbh_in[i]^2.14321)*(tree_data$ht_ft[i]^0.74220))
      tree_data$CVTS[i] <- CVTS_41

      rm(CVTS_41)

    } else if (tree_data$vol_eq[i] == "E42") {

      CVTS_42 <- (0.0097438611*(tree_data$dbh_in[i]^2.20527)*(tree_data$ht_ft[i]^0.61190))
      tree_data$CVTS[i] <- CVTS_42

      rm(CVTS_42)

    } else if (tree_data$vol_eq[i] == "E43") {

      CVTS_43 <- (0.0065261029*(tree_data$dbh_in[i]^2.31958)*(tree_data$ht_ft[i]^0.62528))
      tree_data$CVTS[i] <- CVTS_43

      rm(CVTS_43)

    } else if (tree_data$vol_eq[i] == "E0") {

      tree_data$CVTS[i] <- NA

    }

  }

  tree_data$stem_bio <- ((tree_data$CVTS*tree_data$density)/2000)
  tree_data$stem_bio_tons <- round(tree_data$stem_bio,2)
  tree_data$stem_bio_kg <- round(tree_data$stem_bio*907.18474,2)

  tree_data_return <- subset(tree_data, select = -c(vol_eq, eq_group, CVTS, stem_bio))

  return(tree_data_return)

}
