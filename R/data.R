
######################################################################
# datasets that need to be documented
#####################################################################

#' @title Data for demonstration
#'
#' @description
#' A fake dataset created for demonstration purposes only
#'
#' @format ## `demo_data`
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
"demo_data"


#' @title Data for forest composition demonstration
#'
#' @description
#' A fake dataset created for composition demonstration purposes only
#'
#' @format ## `demo_comp_data`
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
"demo_comp_data"


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
  Plot = c(1,2,3,4,5),
  Live = c(1, 0, 1, 1, 0),
  SPP = c("CADE", "PIPO", "QUKE", "ABCO", "PSME"),
  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8),
  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1)
)

good_trees_imperial <- data.frame(
  Plot = c(1,2,3,4,5),
  Live = c(1, 0, 1, 1, 0),
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
  Plot_id = as.character(c(1,1,2,2,1,1,2,2,2)),
  SPH = c(50,50,50,50,50,50,50,50,50),
  Live = c("1", "0", "1", "1", "1", "1", "1", "0", "0"),
  SPP = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", "PSME"),
  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, 15.8),
  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, 10.6)
)

good_sum_imperial <- data.frame(
  Forest = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  Plot_id = as.character(c(1,1,2,2,1,1,2,2,2)),
  SPH = c(50,50,50,50,50,50,50,50,50),
  Live = c("1", "0", "1", "1", "1", "1", "1", "0", "0"),
  SPP = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", "PSME"),
  DBH_IN = c(4.0, 17.6, 7.5, 12.9, 5.4, 8.0, 12.5, 5.2, 6.2),
  HT_FT = c(16.7, 86.6, 26.2, 76.4, 36.4, 27.9, 73.2, 31.8, 34.8)
)

bad_sum <- data.frame(

  Forest = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  Forest_NA = c("SEKI", NA, "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"), # NA value

  Plot_id = as.character(c(1,1,2,2,1,1,2,2,2)),
  Plot_id_NA = as.character(c(1,NA,2,2,1,1,2,2,2)), # NA value

  SPH = c(50,50,50,50,50,50,50,50,50),
  SPH_NA = c(50,NA,50,50,50,50,50,50,50), # NA value
  SPH_bad = as.character(c(50,50,50,50,50,50,50,50,50)), # wrong class

  Live = c("1", "0", "1", "1", "1", "1", "1", "0", "0"),
  SPP = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", "PSME"),
  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, 15.8),
  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, 10.6)
)


######################################################################
# dataframes used for ForestComp function tests
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
  SPH = c(50,50,50,50,50,50,50,50,50),
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

  SPH = c(50,50,50,50,50,50,50,50,50),
  SPH_NA = c(50,NA,50,50,50,50,50,50,50), # NA value
  SPH_bad = as.character(c(50,50,50,50,50,50,50,50,50)), # wrong class

  Live = c("1", "0", "1", "1", "1", "1", "1", "1", "0"),
  Live_NA = c("1", "0", NA, "1", "1", "1", "1", "1", "0"), # NA value
  Live_bad = c("L", "D", "L", "L", "L", "L", "L", "L", "D"), # not following 0/1

  SPP = c("PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "ABCO", "PSME"),
  SPP_NA = c("PSME", "ABCO", NA, "PSME", "CADE", "CADE", "CADE", "ABCO", "PSME"), # NA value

  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, 15.8),
  DBH_NA = c(10.3, NA, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, 15.8), # NA value
  DBH_bad = as.character(c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, 15.8)) # wrong class
)

