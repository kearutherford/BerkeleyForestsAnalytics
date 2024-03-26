
Vtot_ib_Gross <- 0.005109889*gtr_examples$dbh[5]^(1.750900491*(1-exp(-0.184334722*gtr_examples$dbh[5]))^0.268865063)*gtr_examples$ht1[5]^0.964427633

Vtot_bk_Gross <- 0.002863318*11^(1.845527431-1.404391454)*gtr_examples$dbh[5]^1.404391454*gtr_examples$ht1[5]^0.719187158

Vtot_ob_Gross <- 0.005124362*gtr_examples$dbh[5]^1.910991064*gtr_examples$ht1[5]^0.890474002

EQ_7 <- function(h, d, tree_data) {

  d - (0.005124362*tree_data$dbh[5]^1.910991064*tree_data$ht1[5]^0.890474002/0.005454154/tree_data$ht1[5]*2.478170079*0.873668316*(1-(h/tree_data$ht1[5]))^(2.478170079-1)*(1-(1-(h/tree_data$ht1[5]))^2.478170079)^(0.873668316-1))^0.5

}

EQ_7_hm <- uniroot(EQ_7, c(0,50), tol = 0.001, maxiter = 100000, d = 4, tree_data = gtr_examples)
h_m <- EQ_7_hm$root

R_1 <- (1 - (1 - 1/gtr_examples$ht1[5])^2.510517145)^0.868659559
R_m <- (1 - (1 - h_m/gtr_examples$ht1[5])^2.510517145)^0.868659559

Vmer_ib_Gross
