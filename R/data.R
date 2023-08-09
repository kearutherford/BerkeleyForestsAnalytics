
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
# dataframes used for package tests
#####################################################################

good_trees <- data.frame(
  Plot = c(1,2,3,4,5),
  Live = c(1, 1, 1, 1, 1),
  SPP = c("CADE", "PIPO", "QUKE", "ABCO", "PSME"),
  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8),
  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1)
)


bad_trees <- data.frame(

  Live = c(1, 1, 1, 1, 1),

  SPP4 = c("CADE", "PIPO", "QUKE", "ABCO", "PSME"),
  SPP4_NA = c("CADE", NA, "QUKE", "ABCO", "PSME"), # NA value
  SPP4_bad1 = c("CADD", "PIPO", "QUKE", "ABCO", "PSME"), # one wrong
  SPP4_bad2 = c("CADD", "PIPP", "QUKK", "ABCC", "PSMM"), # all wrong
  SPP_fia_bad1 = c("81", "1222", "818", "15", "202"), # one wrong
  SPP_fia_bad2 = c("8111", "1222", "8188", "1555", "2022"), # all wrong

  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8),
  DBH_NA = c(10.3, NA, 19.1, 32.8, 13.8), # NA value
  DBH_CM_bad1 = as.character(c(10.3, 44.7, 19.1, 32.8, 13.8)), # wrong class
  DBH_CM_bad2 = c(2.2, 44.7, 19.1, 32.8, 13.8), # below 2.5 cm cutoff
  DBH_IN_bad1 = c(0.8, 17.6, 7.5, 12.9, 5.4), # below 1.0 in cutoff

  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1),
  HT_NA = c(5.1, NA, 8.0, 23.3, 11.1), # NA value
  HT_M_bad1 = as.factor(c(5.1, 26.4, 8.0, 23.3, 11.1)), # wrong class
  HT_M_bad2 = c(1.27, 26.4, 8.0, 23.3, 11.1), # below 1.37 m cutoff
  HT_FT_bad1 = c(4.3, 86.6, 26.2, 76.4, 36.4) # below 4.5 ft in cutoff
)
