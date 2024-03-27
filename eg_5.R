
Vtot_ib_Gross <- 0.005109889*gtr_examples$dbh[5]^(1.750900491*(1-exp(-0.184334722*gtr_examples$dbh[5]))^0.268865063)*gtr_examples$ht1[5]^0.964427633

Vtot_bk_Gross <- 0.002863318*11^(1.845527431-1.404391454)*gtr_examples$dbh[5]^1.404391454*gtr_examples$ht1[5]^0.719187158

Vtot_ob_Gross <- Vtot_ib_Gross + Vtot_bk_Gross

EQ_7 <- function(h, d, tree_data) {
  d - (0.005124362*tree_data$dbh[5]^1.910991064*tree_data$ht1[5]^0.890474002/0.005454154/tree_data$ht1[5]*2.478170079*0.873668316*(1-(h/tree_data$ht1[5]))^(2.478170079-1)*(1-(1-(h/tree_data$ht1[5]))^2.478170079)^(0.873668316-1))^0.5
}

EQ_7_hm <- uniroot(EQ_7, c(0,50), tol = 0.001, maxiter = 100000, d = 4, tree_data = gtr_examples)
h_m <- EQ_7_hm$root

R_1 <- (1 - (1 - 1/gtr_examples$ht1[5])^2.510517145)^0.868659559
R_m <- (1 - (1 - h_m/gtr_examples$ht1[5])^2.510517145)^0.868659559

Vmer_ib_Gross <- (R_m*Vtot_ib_Gross) - (R_1*Vtot_ib_Gross)
Vmer_ob_Gross <- (R_m*Vtot_ob_Gross) - (R_1*Vtot_ob_Gross)
Vmer_bk_Gross <- Vmer_ob_Gross - Vmer_ib_Gross

Vstump_ob_Gross <- (R_1*Vtot_ob_Gross)
Vstump_ib_Gross <- (R_1*Vtot_ib_Gross)
Vstump_bk_Gross <- Vstump_ob_Gross - Vstump_ib_Gross

Wtot_ib <- Vtot_ib_Gross*62.4*0.59
Wtot_ib_red <- Wtot_ib*0.54

Wtot_bk <- 0.036743204*gtr_examples$dbh[5]^1.630276513*gtr_examples$ht1[5]^0.962121833
Wtot_bk_red <- Wtot_bk*0.54*0.5

Wbranch <- 0.198994402*gtr_examples$dbh[5]^2.681943186*gtr_examples$ht1[5]^0.288130955*0.59
Wbranchred <- Wbranch*0.54*0.1

AGB_pred <- 0.303328094*gtr_examples$dbh[5]^2.01600356*gtr_examples$ht1[5]^0.903672396*0.59
AGB_comp_red <- Wtot_ib_red + Wtot_bk_red + Wbranchred
AGB_red <- AGB_comp_red/(Wtot_ib + Wtot_bk + Wbranch)
AGB_pred_red <- AGB_pred*AGB_red

Wood_harm <- AGB_pred_red*(Wtot_ib_red/AGB_comp_red)
Bark_harm <- AGB_pred_red*(Wtot_bk_red/AGB_comp_red)
Branch_harm <- AGB_pred_red*(Wbranchred/AGB_comp_red)

Wfoliage <- 0

WDSG_adj <- Wood_harm/Vtot_ib_Gross/62.4
BKSG_adj <- Bark_harm/Vtot_bk_Gross/62.4

Wmer_ib <- Vmer_ib_Gross*WDSG_adj*62.4
Wmer_bk <- Vmer_bk_Gross*BKSG_adj*62.4
Wmer_ob <- Wmer_ib + Wmer_bk

Wstump_ib <- Vstump_ib_Gross*WDSG_adj*62.4
Wstump_bk <- Vstump_bk_Gross*BKSG_adj*62.4
Wstump_ob <- Wstump_ib + Wstump_bk

top <- AGB_pred_red - Wmer_ob - Wstump_ob

AGB_C <- AGB_pred_red*0.481



