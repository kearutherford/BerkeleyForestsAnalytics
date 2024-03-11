
################################################################################
################################################################################
# NSVBCalcs function
################################################################################
################################################################################

NSVBCalcs <- function(data) {

  data$total_wood_bio <- as.double(NA)
  data$total_bark_bio <- as.double(NA)
  data$total_branch_bio <- as.double(NA)
  data$total_ag_bio <- as.double(NA)
  data$merch_wood_bio <- as.double(NA)
  data$merch_bark_bio <- as.double(NA)
  data$merch_total_bio <- as.double(NA)
  data$merch_top_bio <- as.double(NA)
  data$stump_wood_bio <- as.double(NA)
  data$stump_bark_bio <- as.double(NA)
  data$stump_total_bio <- as.double(NA)
  data$foliage_bio <- as.double(NA)
  data$carbon_frac <- as.double(NA)

  n <- nrow(data)

  for (i in 1:n) {

    if(data$calc_bio[i] == "Y") {

      # STEP 1: predict gross total stem wood volume
      Table_S1_Pull <- Table_Pull(Table_S1a, Table_S1b, data[i,])
      Vtot_ib_Gross <- EQ_set(Table_S1_Pull, data[i,])

      # STEP 2: predict gross total stem bark volume
      Table_S2_Pull <- Table_Pull(Table_S2a, Table_S2b, data[i,])
      Vtot_bk_Gross <- EQ_set(Table_S2_Pull, data[i,])

      # STEP 3: obtain gross total stem outside-bark volume
      Vtot_ob_Gross <- Vtot_ib_Gross + Vtot_bk_Gross

      # If merchantable...
      # STEP 4: estimate heights to merchantable top diameter
      # STEP 5: estimate stem component gross volumes

      Table_S5_Pull <- Table_Pull(Table_S5a, Table_S5b, data[i,]) # Table_S5_Pull used in various calcs, not just for merch

      if(data$dbh[i] >= 5) {

        Table_S3_Pull <- Table_Pull(Table_S3a, Table_S3b, data[i,])
        Table_S4_Pull <- Table_Pull(Table_S4a, Table_S4b, data[i,])

        EQ_7_hm <- uniroot(EQ_7, c(0,data$ht1[i]), tol = 0.001, maxiter = 100000, d = 4, table_data_1 = Table_S3_Pull, table_data_2 = Table_S4_Pull, tree_data = data[i,])
        h_m <- EQ_7_hm$root

        R_1 <- EQ_6(1, Table_S5_Pull, data[i,])
        R_m <- EQ_6(h_m, Table_S5_Pull, data[i,])

        Vmer_ib_Gross <- (R_m*Vtot_ib_Gross) - (R_1*Vtot_ib_Gross)
        Vmer_ob_Gross <- (R_m*Vtot_ob_Gross) - (R_1*Vtot_ob_Gross)
        Vmer_bk_Gross <- Vmer_ob_Gross - Vmer_ib_Gross

        Vstump_ob_Gross <- (R_1*Vtot_ob_Gross)
        Vstump_ib_Gross <- (R_1*Vtot_ib_Gross)
        Vstump_bk_Gross <- Vstump_ob_Gross - Vstump_ib_Gross

      }

      # PATH 1 (live, with intact top) ------------------------------------------>
      if(data$path[i] == "1") {

        # STEP 6: estimate stem component sound volumes
        # Not a necessary step for this pathway

        # STEP 7: convert total stem wood gross volume to biomass weight
        Wtot_ib <- Vtot_ib_Gross*data$WDSG[i]*62.4
        Wtot_ib_red <- Vtot_ib_Gross*(1 - data$cull[i]/100*(1 - data$DensProp[i]))*data$WDSG[i]*62.4

        # STEP 8: predict total stem bark biomass
        Table_S6_Pull <- Table_Pull(Table_S6a, Table_S6b, data[i,])
        Wtot_bk <- EQ_set(Table_S6_Pull, data[i,])
        Wtot_bk_red <- Wtot_bk

        # STEP 9: predict total branch biomass
        Table_S7_Pull <- Table_Pull(Table_S7a, Table_S7b, data[i,])
        Wbranch <- EQ_set(Table_S7_Pull, data[i,])
        Wbranchred <- Wbranch

        # PATH 2 (live, with broken top) ------------------------------------------>
      } else if(data$path[i] == "2") {

        # STEP 6: estimate stem component sound volumes
        R_b <- EQ_6(data$ht2[i], Table_S5_Pull, data[i,])

        # If merchantable...
        if(data$dbh[i] >= 5) {

          if(data$ht2[i] < h_m) {

            Vmer_ib_Sound <- (R_b*Vtot_ib_Gross) - (R_1*Vtot_ib_Gross)
            Vmer_bk_Sound <- (R_b*Vtot_bk_Gross) - (R_1*Vtot_bk_Gross)

          } else {

            Vmer_ib_Sound <- Vmer_ib_Gross
            Vmer_bk_Sound <- Vmer_bk_Gross

          }

        }

        # STEP 7: convert total stem wood gross volume to biomass weight
        Wtot_ib <- Vtot_ib_Gross*data$WDSG[i]*62.4
        Wtot_ib_red <- (Vtot_ib_Gross*R_b)*(1 - data$cull[i]/100*(1 - data$DensProp[i]))*data$WDSG[i]*62.4

        # STEP 8: predict total stem bark biomass
        Table_S6_Pull <- Table_Pull(Table_S6a, Table_S6b, data[i,])
        Wtot_bk <- EQ_set(Table_S6_Pull, data[i,])
        Wtot_bk_red <- Wtot_bk*R_b

        # STEP 9: predict total branch biomass
        Table_S7_Pull <- Table_Pull(Table_S7a, Table_S7b, data[i,])
        Wbranch <- EQ_set(Table_S7_Pull, data[i,])

        CR <- (data$ht1[i] - data$ht2[i]*(1 - data$CR[i]))/data$ht1[i]
        BranchRem <- (data$ht2[i] - data$ht1[i]*(1-CR))/(data$ht1[i]*CR)

        Wbranchred <- Wbranch*BranchRem

        # PATH 3 (dead, with intact top) ------------------------------------------>
      } else if(data$path[i] == "3") {

        # STEP 6: estimate stem component sound volumes
        # Not a necessary step for this pathway

        # STEP 7: convert total stem wood gross volume to biomass weight
        Wtot_ib <- Vtot_ib_Gross*data$WDSG[i]*62.4
        Wtot_ib_red <- Vtot_ib_Gross*data$WDSG[i]*data$wood_prop[i]*62.4

        # STEP 8: predict total stem bark biomass
        Table_S6_Pull <- Table_Pull(Table_S6a, Table_S6b, data[i,])
        Wtot_bk <- EQ_set(Table_S6_Pull, data[i,])
        Wtot_bk_red <- Wtot_bk*data$wood_prop[i]*data$bark_prop[i]

        # STEP 9: predict total branch biomass
        Table_S7_Pull <- Table_Pull(Table_S7a, Table_S7b, data[i,])
        Wbranch <- EQ_set(Table_S7_Pull, data[i,])
        Wbranchred <- Wbranch*data$wood_prop[i]*data$branch_prop[i]

        # PATH 4 (dead, with broken top) ------------------------------------------>
      } else if(data$path[i] == "4") {

        # STEP 6: estimate stem component sound volumes
        R_b <- EQ_6(data$ht2[i], Table_S5_Pull, data[i,])

        # If merchantable...
        if(data$dbh[i] >= 5) {

          if(data$ht2[i] < h_m) {

            Vmer_ib_Sound <- (R_b*Vtot_ib_Gross) - (R_1*Vtot_ib_Gross)
            Vmer_bk_Sound <- (R_b*Vtot_bk_Gross) - (R_1*Vtot_bk_Gross)

          } else {

            Vmer_ib_Sound <- Vmer_ib_Gross
            Vmer_bk_Sound <- Vmer_bk_Gross

          }

        }

        # STEP 7: convert total stem wood gross volume to biomass weight
        Wtot_ib <- Vtot_ib_Gross*data$WDSG[i]*62.4
        Wtot_ib_red <- (Vtot_ib_Gross*R_b)*data$WDSG[i]*data$wood_prop[i]*62.4

        # STEP 8: predict total stem bark biomass
        Table_S6_Pull <- Table_Pull(Table_S6a, Table_S6b, data[i,])
        Wtot_bk <- EQ_set(Table_S6_Pull, data[i,])
        Wtot_bk_red <- Wtot_bk*R_b*data$wood_prop[i]*data$bark_prop[i]

        # STEP 9: predict total branch biomass
        Table_S7_Pull <- Table_Pull(Table_S7a, Table_S7b, data[i,])
        Wbranch <- EQ_set(Table_S7_Pull, data[i,])
        BranchRem <- (data$ht2[i] - data$ht1[i]*(1-data$CR[i]))/(data$ht1[i]*data$CR[i])
        Wbranchred <- Wbranch*data$wood_prop[i]*data$branch_prop[i]*BranchRem

      }

      # STEP 10: predict total aboveground biomass
      Table_S8_Pull <- Table_Pull(Table_S8a, Table_S8b, data[i,])
      AGB_Predicted <- EQ_set(Table_S8_Pull, data[i,])

      # STEP 11: sum total stem wood biomass, total stem bark biomass, and total branch biomass
      # to obtain a second total aboveground biomass
      AGB_Component_red <- Wtot_ib_red + Wtot_bk_red + Wbranchred

      # STEP 12: proportionally distribute the difference between
      # the directly predicted total biomass and the total from the component estimates
      AGB_Reduce <- AGB_Component_red/(Wtot_ib + Wtot_bk + Wbranch)
      AGB_Predicted_red <- AGB_Predicted*AGB_Reduce

      Wood_Harmonized <- AGB_Predicted_red*(Wtot_ib_red/AGB_Component_red)
      Bark_Harmonized <- AGB_Predicted_red*(Wtot_bk_red/AGB_Component_red)
      Branch_Harmonized <- AGB_Predicted_red*(Wbranchred/AGB_Component_red)

      data$total_wood_bio[i] <- Wood_Harmonized
      data$total_bark_bio[i] <- Bark_Harmonized
      data$total_branch_bio[i] <- Branch_Harmonized
      data$total_ag_bio[i] <- AGB_Predicted_red

      # If merchantable...
      if(data$dbh[i] >= 5) {

        # PATH 1 OR 3 (intact top) ---------------------------------------------->
        if(data$path[i] == "1" | data$path[i] == "3") {

          # STEP 13: calculate an adjusted wood density
          WDSG_Adj <- Wood_Harmonized/Vtot_ib_Gross/62.4

          # STEP 14: calculate an adjusted bark density
          BKSG_Adj <- Bark_Harmonized/Vtot_bk_Gross/62.4

          Wmer_ib <- Vmer_ib_Gross*WDSG_Adj*62.4
          Wmer_bk <- Vmer_bk_Gross*BKSG_Adj*62.4
          Wmer_ob <- Wmer_ib + Wmer_bk

          # PATH 2 OR 4 (broken top) ---------------------------------------------->
        } else if(data$path[i] == "2" | data$path[i] == "4") {

          # STEP 13: calculate an adjusted wood density
          WDSG_Adj <- Wood_Harmonized/(Vtot_ib_Gross*R_b)/62.4

          # STEP 14: calculate an adjusted bark density
          BKSG_Adj <- Bark_Harmonized/(Vtot_bk_Gross*R_b)/62.4

          Wmer_ib <- Vmer_ib_Sound*WDSG_Adj*62.4
          Wmer_bk <- Vmer_bk_Sound*BKSG_Adj*62.4
          Wmer_ob <- Wmer_ib + Wmer_bk

        }

        Wstump_ib <- Vstump_ib_Gross*WDSG_Adj*62.4
        Wstump_bk <- Vstump_bk_Gross*BKSG_Adj*62.4
        Wstump_ob <- Wstump_ib + Wstump_bk

        DRYBIO_TOP <- AGB_Predicted_red - Wmer_ob - Wstump_ob

        data$merch_wood_bio[i] <- Wmer_ib
        data$merch_bark_bio[i] <- Wmer_bk
        data$merch_total_bio[i] <- Wmer_ob
        data$merch_top_bio[i] <- DRYBIO_TOP

        data$stump_wood_bio[i] <- Wstump_ib
        data$stump_bark_bio[i] <- Wstump_bk
        data$stump_total_bio[i] <- Wstump_ob

      }

      # PATH 1 (live, with intact top) ------------------------------------------>
      if(data$path[i] == "1") {

        # STEP 15: predict total foliage dry weight
        Table_S9_Pull <- Table_Pull(Table_S9a, Table_S9b, data[i,])
        Wfoliage <- EQ_set(Table_S9_Pull, data[i,])
        data$foliage_bio[i] <- Wfoliage

        # STEP 16: get species-specific carbon fraction
        CF <- (subset(Table_S10a, SPCD == data$species[i])$fia.wood.c)/100

        # PATH 2 (live, with broken top) ------------------------------------------>
      } else if(data$path[i] == "2") {

        # STEP 15: predict total foliage dry weight
        Table_S9_Pull <- Table_Pull(Table_S9a, Table_S9b, data[i,])
        Wfoliage <- EQ_set(Table_S9_Pull, data[i,])
        FoliageRem <- (data$ht2[i] - data$ht1[i]*(1-CR))/(data$ht1[i]*CR)
        Wfoliagered <- Wfoliage*FoliageRem
        data$foliage_bio[i] <- Wfoliagered

        # STEP 16: get species-specific carbon fraction
        CF <- (subset(Table_S10a, SPCD == data$species[i])$fia.wood.c)/100

        # PATH 3 OR 4 (dead) ------------------------------------------------------>
      } else if(data$path[i] == "3" | data$path[i] == "4") {

        # STEP 15: predict total foliage dry weight
        Wfoliage <- 0
        data$foliage_bio[i] <- Wfoliage

        # STEP 16: get species-specific carbon fraction
        CF <- (subset(Table_S10b, S.H == data$type[i] & Decay.code == data$decay_class[i])$C.fraction)/100

      }

      data$carbon_frac[i] <- CF

    }

  }

  return(data)

}


################################################################################
################################################################################
# Supporting functions
################################################################################
################################################################################

# Model equations 1-5
EQ_set <- function(table_data, tree_data) {

  if(table_data$model[1] == "1") {

    y <- table_data$a[1]*(tree_data$dbh[1]^table_data$b[1])*(tree_data$ht1[1]^table_data$c[1])

  } else if(table_data$model[1] == "2") {

    if(tree_data$dbh[1] < tree_data$k[1]) {

      y <- table_data$a[1]*(tree_data$dbh[1]^table_data$b[1])*(tree_data$ht1[1]^table_data$c[1])

    } else if(tree_data$dbh[1] >= tree_data$k[1]) {

      y <- table_data$a[1]*(tree_data$k[1]^(table_data$b[1]-table_data$b1[1]))*(tree_data$dbh[1]^table_data$b1[1])*(tree_data$ht1[1]^table_data$c[1])

    }

  } else if(table_data$model[1] == "3") {

    y <- table_data$a[1]*(tree_data$dbh[1]^(table_data$a1[1]*(1-exp(-table_data$b[1]*tree_data$dbh[1]))^table_data$c1[1]))*(tree_data$ht1[1]^table_data$c[1])

  } else if(table_data$model[1] == "4") {

    y <- table_data$a[1]*(tree_data$dbh[1]^table_data$b[1])*(tree_data$ht1[1]^table_data$c[1])*exp(-(table_data$b1[1]*tree_data$dbh[1]))

  } else if(table_data$model[1] == "5") {

    y <- table_data$a[1]*(tree_data$dbh[1]^table_data$b[1])*(tree_data$ht1[1]^table_data$c[1])*tree_data$WDSG[1]

  }

  return(y)

}

# Equation 6 (volume ratio model)
EQ_6 <- function(h, table_data, tree_data) {

  y <- (1 - (1 - h/tree_data$ht1[1])^table_data$alpha[1])^table_data$beta[1]
  return(y)

}

# Equation 7 (taper function)
EQ_7 <- function(h, d, table_data_1, table_data_2, tree_data) {

  d - (table_data_1$a[1]*tree_data$dbh[1]^table_data_1$b[1]*tree_data$ht1[1]^table_data_1$c[1]/0.005454154/tree_data$ht1[1]*table_data_2$alpha[1]*table_data_2$beta[1]*(1-(h/tree_data$ht1[1]))^(table_data_2$alpha[1]-1)*(1-(1-(h/tree_data$ht1[1]))^table_data_2$alpha[1])^(table_data_2$beta[1]-1))^0.5

}

# Pull values from provided tables
Table_Pull <- function(table_data_a, table_data_b, tree_data) {

  if(tree_data$species[1] %in% table_data_a$SPCD) {

    table_pull <- subset(table_data_a, SPCD == tree_data$species[1])

    if(tree_data$division[1] %in% table_pull$DIVISION) {

      return_table <- subset(table_pull, DIVISION == tree_data$division[1])

    } else {

      return_table <- subset(table_pull, is.na(DIVISION))

    }

  } else {

    return_table <- subset(table_data_b, JENKINS_SPGRPCD == tree_data$JENKINS_SPGRPCD[1])

  }

  return(return_table)

}

