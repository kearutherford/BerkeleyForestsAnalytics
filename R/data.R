
######################################################################
# datasets that need to be documented
#####################################################################

#' @title Data for demonstration
#'
#' @description
#' A fake dataset created for demonstration purposes only
#'
#' @format ## `bio_demo_data`
#' A dataframe with 9 rows and 7 columns:
#' \describe{
#'   \item{Forest}{Broader location or forest where the data were collected}
#'   \item{Plot_id}{Plot in which the individual tree was measured}
#'   \item{SPH}{Stems per hectare}
#'   \item{Live}{Live (1) or dead (0)}
#'   \item{Decay}{1-5 for standing dead trees. NA or 0 for live trees.}
#'   \item{SPP}{Species of the individual tree, using four-letter species codes}
#'   \item{DBH_CM}{Diameter at breast height in centimeters}
#'   \item{HT_M}{Tree height in meters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"bio_demo_data"


#' @title Data for demonstration
#'
#' @description
#' A fake dataset created for demonstration purposes only
#'
#' @format ## `bio_NT_demo`
#' A dataframe with 9 rows and 7 columns:
#' \describe{
#'   \item{Forest}{Broader location or forest where the data were collected}
#'   \item{Plot_id}{Plot in which the individual tree was measured}
#'   \item{SPH}{Stems per hectare}
#'   \item{Live}{Live (1) or dead (0)}
#'   \item{Decay}{1-5 for standing dead trees. NA or 0 for live trees.}
#'   \item{SPP}{Species of the individual tree, using four-letter species codes}
#'   \item{DBH_CM}{Diameter at breast height in centimeters}
#'   \item{HT_M}{Tree height in meters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"bio_NT_demo"


#' @title Data for forest composition demonstration
#'
#' @description
#' A fake dataset created for composition demonstration purposes only
#'
#' @format ## `for_demo_data`
#' A dataframe with 9 rows and 7 columns:
#' \describe{
#'   \item{Forest}{Broader location or forest where the data were collected}
#'   \item{Plot_id}{Plot in which the individual tree was measured}
#'   \item{SPH}{Stems per hectare}
#'   \item{Live}{Live (1) or dead (0)}
#'   \item{SPP}{Species of the individual tree, using four-letter species codes}
#'   \item{DBH_CM}{Diameter at breast height in centimeters}
#'   \item{HT_M}{Tree height in meters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"for_demo_data"


#' @title Data for forest composition demonstration
#'
#' @description
#' A fake dataset created for composition demonstration purposes only
#'
#' @format ## `for_NT_demo`
#' A dataframe with 9 rows and 7 columns:
#' \describe{
#'   \item{Forest}{Broader location or forest where the data were collected}
#'   \item{Plot_id}{Plot in which the individual tree was measured}
#'   \item{SPH}{Stems per hectare}
#'   \item{Live}{Live (1) or dead (0)}
#'   \item{SPP}{Species of the individual tree, using four-letter species codes}
#'   \item{DBH_CM}{Diameter at breast height in centimeters}
#'   \item{HT_M}{Tree height in meters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"for_NT_demo"


######################################################################
# dataframes used for validating input data
######################################################################

sp_code_names <- data.frame(
  letter = c("PSME", "PIJE", "PIPO", "PISA", "TSHE", "TOCA", "TABR", "PICO", "UNCO", "ABMA", "CADE", "PILA",
             "PIMO", "JUOC", "ABCO", "SESE", "SEGI", "CONU", "ALRH", "POTR", "UMCA", "NODE", "ACMA", "QUKE",
             "ARME", "QUCH", "QUAG", "CHCH", "ABPR", "ABGR", "TSME", "UNHA", "UNTR", "SASP", NA),
  fia = c("202", "116", "122", "127", "263", "251", "231", "108", "298", "20", "81", "117", "119", "64", "15",
          "211", "212", "492", "352", "746", "981", "631", "312", "818", "361", "805", "801", "431", "22", "17",
          "264", "998", "999", "920", NA)
)


######################################################################
# dataframes used for TreeBiomass function tests
######################################################################

good_trees_metric <- data.frame(
  Plot = c(1,1,1,2,2),
  Live = c(1, 0, 1, 1, 0),
  Decay = c(NA, 3, NA, NA, 2),
  SPP = c("CADE", "PIPO", "QUKE", "ABCO", "PSME"),
  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8),
  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1)
)

good_trees_imperial <- data.frame(
  Plot = c(1,1,1,2,2),
  Live = c(1, 0, 1, 1, 0),
  Decay = c(NA, 3, NA, NA, 2),
  SPP = c("CADE", "PIPO", "QUKE", "ABCO", "PSME"),
  DBH_IN = c(4.1, 17.6, 7.5, 12.9, 5.4),
  HT_FT = c(16.7, 86.6, 26.2, 76.4, 36.4)
)

bad_trees <- data.frame(

  Live_v1 = c(1, 0, 1, 1, 0),
  Live_v2 = c(0, 0, 1, 1, 0),
  Live_NA = c(1, 0, NA, 1, 0), # NA value
  Live_bad1 = c("L", "D", "L", "L", "D"), # not following 0/1

  SPP4 = c("CADE", "PIPO", "QUKE", "ABCO", "PSME"),
  SPP4_NA = c("CADE", NA, "QUKE", "ABCO", "PSME"), # NA value
  SPP4_bad1 = c("CADD", "PIPO", "QUKE", "ABCO", "PSME"), # one wrong
  SPP4_bad2 = c("CADD", "PIPP", "QUKK", "ABCC", "PSMM"), # all wrong
  SPP_fia_bad1 = c("81", "1222", "818", "15", "202"), # one wrong
  SPP_fia_bad2 = c("8111", "1222", "8188", "1555", "2022"), # all wrong

  Decay = c(NA, 3, NA, NA, 2),
  Decay_bad1 = c(NA, 8, NA, NA, 2), # one wrong
  Decay_bad2 = c(NA, 3, 4, NA, 2), # L tree w a D code
  Decay_bad3 = c(NA, 0, NA, NA, 2), # D tree w a L code

  DBH_CM = c(15.3, 44.7, 19.1, 32.8, 13.8),
  DBH_IN = c(6.0, 17.6, 7.5, 12.9, 5.4),
  DBH_NA = c(15.3, NA, 19.1, 32.8, 13.8), # NA value
  DBH_CM_bad1 = as.character(c(15.3, 44.7, 19.1, 32.8, 13.8)), # wrong class
  DBH_CM_bad2 = c(2.2, 44.7, 19.1, 32.8, 13.8), # below 2.5 cm cutoff for live trees (use with Live_v1)
  DBH_CM_bad3 = c(10.3, 44.7, 19.1, 32.8, 13.8), # below 12.7 cm cutoff for dead trees (use with Live_v2)
  DBH_IN_bad1 = c(0.8, 17.6, 7.5, 12.9, 5.4), # below 1.0 in cutoff for live trees (use with Live_v1)
  DBH_IN_bad2 = c(4.1, 17.6, 7.5, 12.9, 5.4), # below 5.0 in cutoff for dead trees (use with Live_v2)

  HT_M = c(9.1, 26.4, 8.0, 23.3, 11.1),
  HT_FT = c(29.9, 86.6, 26.2, 76.4, 36.4),
  HT_NA = c(9.1, NA, 8.0, 23.3, 11.1), # NA value
  HT_M_bad1 = as.factor(c(9.1, 26.4, 8.0, 23.3, 11.1)), # wrong class
  HT_M_bad2 = c(1.27, 26.4, 8.0, 23.3, 11.1), # below 1.37 m cutoff
  HT_FT_bad1 = c(4.3, 86.6, 26.2, 76.4, 36.4) # below 4.5 ft in cutoff
)


######################################################################
# dataframes used for SummaryBiomass function tests
######################################################################

good_sum_metric <- data.frame(
  Forest = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  Plot_id = as.character(c(1,1,2,2,1,1,2,2,3)),
  SPH = c(50,50,50,50,50,50,50,50,0),
  Live = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  Decay = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  SPP = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA)
)

good_sum_imperial <- data.frame(
  Forest = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  Plot_id = as.character(c(1,1,2,2,1,1,2,2,2)),
  SPA = c(20,20,20,20,20,20,20,20,20),
  Live = c("1", "0", "1", "1", "1", "1", "1", "0", "0"),
  Decay = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, 3)),
  SPP = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", "PSME"),
  DBH_IN = c(4.0, 17.6, 7.5, 12.9, 5.4, 8.0, 12.5, 5.2, 6.2),
  HT_FT = c(16.7, 86.6, 26.2, 76.4, 36.4, 27.9, 73.2, 31.8, 34.8)
)

bad_sum <- data.frame(

  Forest = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  Forest_NA = c("SEKI", NA, "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"), # NA value

  Plot_id = as.character(c(1,1,2,2,1,1,2,2,2)),
  Plot_id_NA = as.character(c(1,NA,2,2,1,1,2,2,2)), # NA value
  Plot_id_bad2 = as.character(c(1,1,2,2,1,1,2,2,3)), # misuse of 0 ef

  SPH = c(50,50,50,50,50,50,50,50,50),
  SPH_NA = c(50,NA,50,50,50,50,50,50,50), # NA value
  SPH_bad1 = as.character(c(50,50,50,50,50,50,50,50,50)), # wrong class
  SPH_bad2 = c(50,50,50,50,50,50,50,50,0), # misuse of 0 ef (use with Plot_id & Plot_id_bad2)

  Live = c("1", "0", "1", "1", "1", "1", "1", "0", "0"),
  Decay = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, 3)),
  SPP = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", "PSME"),
  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, 15.8),
  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, 10.6)
)


######################################################################
# dataframes used for ForestComp and ForestStr function tests
######################################################################

good_comp_metric <- data.frame(
  Forest = c("SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  Plot_id = as.character(c(1,1,1,1,1,2,2,2,2)),
  SPH = c(50,50,50,50,50,50,50,50,50),
  Live = c("1", "0", "1", "1", "1", "1", "1", "1", "0"),
  SPP = c("PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "ABCO", "PSME"),
  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, 15.8),
  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, 10.6)
)

good_comp_imperial <- data.frame(
  Forest = c("SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  Plot_id = as.character(c(1,1,1,1,1,2,2,2,2)),
  SPA = c(20,20,20,20,20,20,20,20,20),
  Live = c("1", "0", "1", "1", "1", "1", "1", "1", "0"),
  SPP = c("PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "ABCO", "PSME"),
  DBH_IN = c(4.0, 17.6, 7.5, 12.9, 5.4, 8.0, 12.5, 5.2, 6.2),
  HT_FT = c(16.7, 86.6, 26.2, 76.4, 36.4, 27.9, 73.2, 31.8, 34.8)
)

bad_comp <- data.frame(
  Forest = c("SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  Forest_NA = c("SEKI", NA, "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"), # NA value

  Plot_id = as.character(c(1,1,1,1,1,2,2,2,2)),
  Plot_id_NA = as.character(c(1,NA,1,1,1,2,2,2,2)), # NA value
  Plot_id_NT = as.character(c(1,1,1,1,1,2,2,2,3)), # no tree plot

  SPH = c(50,50,50,50,50,50,50,50,50),
  SPH_NA = c(50,NA,50,50,50,50,50,50,50), # NA value
  SPH_bad = as.character(c(50,50,50,50,50,50,50,50,50)), # wrong class
  SPH_NT = c(50,50,50,50,50,50,50,50,0), # no tree plot

  Live = c("1", "0", "1", "1", "1", "1", "1", "1", "0"),
  Live_NA = c("1", "0", NA, "1", "1", "1", "1", "1", "0"), # NA value
  Live_bad = c("L", "D", "L", "L", "L", "L", "L", "L", "D"), # not following 0/1
  Live_NT = c("1", "0", "1", "1", "1", "1", "1", "1", NA), # no tree plot

  SPP = c("PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "ABCO", "PSME"),
  SPP_NA = c("PSME", "ABCO", NA, "PSME", "CADE", "CADE", "CADE", "ABCO", "PSME"), # NA value
  SPP_NT = c("PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "ABCO", NA), # no tree plot

  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, 15.8),
  DBH_NA = c(10.3, NA, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, 15.8), # NA value
  DBH_bad = as.character(c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, 15.8)), # wrong class
  DBH_NT = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA), # no tree plot

  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, 10.6),
  HT_NA = c(5.1, NA, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, 10.6), # NA value
  HT_bad = as.character(c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, 10.6)), # wrong class
  HT_NT = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA) # no tree plot

)


######################################################################
# dataframes used for surface and gorund fuel load calculations
######################################################################

DL_table <- data.frame (
  letter = c("PSME","PISA","PIBA", "SEGI", "CADE", "PIJE", "PIAT", "PIFL", "PICO", "TSME", "PIPO", "ABMA", "PIMO1", "PILA", "PIWA", "JUOC", "PIMO2", "ABCO", "PIAL", "UNCO", "UNHA", "UNTR"),
  fia = c("202", "127", "104", "212", "81", "116", "103", "113", "108", "264", "122", "20", "133", "117", "137", "64", "119", "15", "101", "298", "998", "999"),
  litter_coef = c(0.864,0.111,0.886,0.990,1.276,0.358,0.339,0.889,0.951,1.102,0.276,0.530,0.906,0.304,0.600,0.832,0.542,1.050,0.540,0.363,0.363,0.363),
  duff_coef = c(1.319,1.448,2.504,1.648,1.675,1.707,1.646,2.337,1.671,1.876,1.402,1.727,2.592,1.396,1.870,1.798,1.422,1.518,1.895,1.750,1.750,1.750),
  litterduff_coef = c(1.295,1.220,2.360,1.632,1.664,1.496,1.274,2.255,1.612,1.848,1.233,1.722,2.478,1.189,1.719,1.763,1.485,1.572,1.802,1.624,1.624,1.624)
)

QMD_table <- data.frame (
  letter = c("ABCO", "ABMA", "CADE", "JUOC", "PIAL", "PIAT", "PIBA", "PICO", "PIFL", "PIJE", "PILA", "PIMO1", "PIMO2", "PIPO", "PISA", "PIWA", "PSME", "SEGI", "TSME", "UNCO", "UNHA", "UNTR"),
  fia = c("15", "20", "81", "64", "101", "103", "104", "108", "113", "116", "117", "133", "199", "122", "127", "137", "202", "212", "264", "298", "998", "999"),
  qmd_1h = c(0.08,0.10,0.09,0.08,0.13,0.10,0.12,0.10,0.21,0.15,0.12,0.09,0.08,0.23,0.14,0.22,0.06,0.14,0.05,0.12,0.12,0.12),
  qmd_10h = c(1.32,1.32,1.23,1.61,1.21,1.25,0.92,1.44,1.28,1.25,1.46,1.41,0.79,1.56,0.94,1.37,1.37,1.28,1.46,1.28, 1.28,1.28),
  qmd_100h = c(11.56,16.24,20.79,13.92,14.75,9.68,12.82,13.39,17.72,17.31,13.61,11.56,9.92,19.36,12.91,13.47,12.04,17.06,13.61,14.52, 14.52,14.52),
  qmd_1000h = c(162.56,219.93,74.30,61.62,92.74,70.39,127.24,138.06,115.78,135.49,169.52,129.96,127.24,101.81,127.24,122.77,75.69,167.70,115.99,127.24,127.24,127.24)
)

SEC_table <- data.frame (
  letter = c("ABCO", "ABMA", "CADE", "JUOC", "PIAL", "PIAT", "PIBA", "PICO", "PIFL", "PIJE", "PILA", "PIMO1", "PIMO2", "PIPO", "PISA", "PIWA", "PSME", "SEGI", "TSME", "UNCO", "UNHA", "UNTR"),
  fia = c("15", "20", "81", "64", "101", "103", "104", "108", "113", "116", "117", "133", "199", "122", "127", "137", "202", "212", "264", "298", "998", "999"),
  sec_1h = c(1.03,1.03,1.02,1.03,1.02,1.03,1.02,1.02,1.02,1.03,1.04,1.02,1.03,1.02,1.05,1.02,1.03,1.02,1.04,1.03,1.03,1.03),
  sec_10h = c(1.02,1.02,1.02,1.04,1.02,1.02,1.02,1.02,1.02,1.03,1.04,1.01,1.02,1.03,1.03,1.02,1.02,1.02,1.02,1.02,1.02,1.02),
  sec_100h = c(1.02,1.01,1.03,1.04,1.02,1.00,1.01,1.01,1.01,1.04,1.03,1.01,1.06,1.02,1.02,1.01,1.03,1.02,1.02,1.02,1.02,1.02),
  sec_1000h = c(1.01,1.00,1.06,1.04,1.02,1.02,1.02,1.05,1.01,1.05,1.03,1.05,1.02,1.01,1.02,1.05,1.04,1.01,1.00,1.02,1.02,1.02)
)

SG_table <- data.frame(
  letter = c("ABCO", "ABMA", "CADE", "JUOC", "PIAL", "PIAT", "PIBA", "PICO", "PIFL", "PIJE", "PILA", "PIMO1", "PIMO2", "PIPO", "PISA", "PIWA", "PSME", "SEGI", "TSME", "UNCO", "UNHA", "UNTR"),
  fia = c("15", "20", "81", "64", "101", "103", "104", "108", "113", "116", "117", "133", "199", "122", "127", "137", "202", "212", "264", "298", "998", "999"),
  sg_1h = c(0.53,0.57,0.59,0.67,0.55,0.59,0.59,0.53,0.57,0.53,0.59,0.65,0.56,0.55,0.64,0.53,0.60,0.57,0.67,0.58,0.58,0.58),
  sg_10h = c(0.54,0.56,0.54,0.65,0.49,0.55,0.61,0.48,0.57,0.55,0.59,0.64,0.56,0.56,0.61,0.52,0.61,0.57,0.65,0.57,0.57,0.57),
  sg_100h = c(0.57,0.47,0.55,0.62,0.48,0.39,0.53,0.54,0.54,0.55,0.52,0.53,0.49,0.48,0.43,0.44,0.59,0.56,0.62,0.53,0.53,0.53),
  sg_1000s = c(0.32,0.38,0.41,0.47,0.42,0.47,0.47,0.58,0.63,0.47,0.43,0.47,0.47,0.40,0.47,0.35,0.35,0.54,0.66,0.47,0.47,0.47),
  sg_1000r = 0.36
)

