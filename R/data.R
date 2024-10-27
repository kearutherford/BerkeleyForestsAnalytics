
######################################################################
# datasets that need to be documented
#####################################################################

#' @title Data for biomass demonstrations
#'
#' @description
#' A fake dataset created for biomass demonstration purposes only
#'
#' @format
#' A dataframe with 9 rows and 7 columns:
#' \describe{
#'   \item{Forest}{Broader location or forest where the data were collected}
#'   \item{Plot_id}{Plot in which the individual tree was measured}
#'   \item{SPH}{Stems per hectare}
#'   \item{Live}{Live (1) or dead (0)}
#'   \item{Decay}{1-5 for standing dead trees. NA for live trees.}
#'   \item{SPP}{Species of the individual tree, using four-letter species codes}
#'   \item{DBH_CM}{Diameter at breast height in centimeters}
#'   \item{HT_M}{Tree height in meters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes
"bio_demo_data"


#' @title Data for biomass demonstrations
#'
#' @description
#' A fake dataset created for biomass demonstration purposes only. Includes a plot without trees.
#'
#' @format
#' A dataframe with 9 rows and 7 columns:
#' \describe{
#'   \item{Forest}{Broader location or forest where the data were collected}
#'   \item{Plot_id}{Plot in which the individual tree was measured}
#'   \item{SPH}{Stems per hectare}
#'   \item{Live}{Live (1) or dead (0)}
#'   \item{Decay}{1-5 for standing dead trees. NA for live trees.}
#'   \item{SPP}{Species of the individual tree, using four-letter species codes}
#'   \item{DBH_CM}{Diameter at breast height in centimeters}
#'   \item{HT_M}{Tree height in meters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes
"bio_NT_demo"


#' @title Data for NSVB framework biomass and carbon demonstrations
#'
#' @description
#' A fake dataset created for NSVB framework biomass and carbon demonstration purposes only
#'
#' @format
#' A dataframe with 16 rows and 14 columns:
#' \describe{
#'   \item{division}{Ecodivision in which the data were collected}
#'   \item{province}{Province in which the data were collected}
#'   \item{site}{Forest where the data were collected}
#'   \item{plot}{Plot in which the individual tree was measured}
#'   \item{exp_factor}{Stems per hectare}
#'   \item{status}{Live (1) or dead (0)}
#'   \item{decay_class}{1-5 for standing dead trees. NA for live trees.}
#'   \item{Species}{Species of the individual tree, using four-letter species codes}
#'   \item{dbh}{Diameter at breast height in centimeters}
#'   \item{ht1}{Tree height 1 in meters}
#'   \item{ht2}{Tree height 2 in meters}
#'   \item{crown_ratio}{Live crown ratio}
#'   \item{top}{Yes top (Y) or no top (N)}
#'   \item{cull}{Percent wood cull}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes
"nsvb_demo"


#' @title Data for forest composition and structure demonstrations
#'
#' @description
#' A fake dataset created for composition and structure demonstration purposes only
#'
#' @format
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
#' @source Created by Kea Rutherford for demonstration purposes
"for_demo_data"


#' @title Data for forest composition and structure demonstrations
#'
#' @description
#' A fake dataset created for composition and structure demonstration purposes only. Includes a plot without trees.
#'
#' @format
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


#' @title Overstory data for surface and ground fuel demonstrations
#'
#' @description
#' A fake dataset created for surface and ground fuel demonstration purposes only
#'
#' @format
#' A dataframe with 14 rows and 6 columns:
#' \describe{
#'   \item{time}{Year in which the data were collected}
#'   \item{site}{Broader location or forest where the data were collected}
#'   \item{plot}{Plot in which the individual tree was measured}
#'   \item{exp_factor}{Stems per hectare}
#'   \item{species}{Species of the individual tree, using four-letter species codes}
#'   \item{dbh}{Diameter at breast height in centimeters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes
"overstory_demo"


#' @title Data for fine woody debris demonstrations
#'
#' @description
#' A fake dataset created for fine surface fuel demonstration purposes only
#'
#' @format
#' A dataframe with 12 rows and 11 columns:
#' \describe{
#'   \item{time}{Year in which the data were collected}
#'   \item{site}{Broader location or forest where the data were collected}
#'   \item{plot}{Plot in which the individual transect was measured}
#'   \item{transect}{Transect on which the fuel tallies were collected}
#'   \item{count_1h}{Count of 1-hour fuels}
#'   \item{count_10h}{Count of 10-hour fuels}
#'   \item{count_100h}{Count of 100-hour fuels}
#'   \item{length_1h}{Length of the sampling transect for 1-hour fuels in meters}
#'   \item{length_10h}{Length of the sampling transect for 10-hour fuels in meters}
#'   \item{length_100h}{Length of the sampling transect for 100-hour fuels in meters}
#'   \item{slope}{Slope along the transect in percent}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes
"fwd_demo"


#' @title Data for coarse woody debris demonstrations
#'
#' @description
#' A fake dataset created for coarse surface fuel demonstration purposes only. Sum-of-squared-diameters for sound and rotten 1000-hour fuels NOT already calculated.
#'
#' @format
#' A dataframe with 16 rows and 8 columns:
#' \describe{
#'   \item{time}{Year in which the data were collected}
#'   \item{site}{Broader location or forest where the data were collected}
#'   \item{plot}{Plot in which the individual transect was measured}
#'   \item{transect}{Transect on which the 1000-hour fuel measurements were taken}
#'   \item{length_1000h}{Length of the sampling transect for 1000-hour fuels in meters}
#'   \item{slope}{Slope along the transect in percent}
#'   \item{diameter}{Diameter of 1000-hour fuel in centimeters}
#'   \item{status}{Rotten (R) or sound (S)}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes
"cwd_NS_demo"


#' @title Data for coarse woody debris demonstrations
#'
#' @description
#' A fake dataset created for coarse surface fuel demonstration purposes only. Sum-of-squared-diameters for sound and rotten 1000-hour fuels already calculated.
#'
#' @format
#' A dataframe with 12 rows and 8 columns:
#' \describe{
#'   \item{time}{Year in which the data were collected}
#'   \item{site}{Broader location or forest where the data were collected}
#'   \item{plot}{Plot in which the individual transect was measured}
#'   \item{transect}{Transect on which the 1000-hour fuel measurements were taken}
#'   \item{length_1000h}{Length of the sampling transect for 1000-hour fuels in meters}
#'   \item{slope}{Slope along the transect in percent}
#'   \item{ssd_S}{Sum-of-squared-diameters for sound 1000-hour fuels}
#'   \item{ssd_R}{Sum-of-squared-diameters for rotten 1000-hour fuels}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"cwd_YS_demo"


#' @title Data for duff and litter demonstrations
#'
#' @description
#' A fake dataset created for duff and litter fuel demonstration purposes only. Depths NOT already averaged together for each transect.
#'
#' @format
#' A dataframe with 24 rows and 6 columns:
#' \describe{
#'   \item{time}{Year in which the data were collected}
#'   \item{site}{Broader location or forest where the data were collected}
#'   \item{plot}{Plot in which the individual transect was measured}
#'   \item{transect}{Transect on which the duff/litter depths were measured}
#'   \item{litter_depth}{Litter depth in centimeters}
#'   \item{duff_depth}{Duff depth in centimeters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"lit_duff_demo"


#' @title Data for duff and litter demonstrations
#'
#' @description
#' A fake dataset created for duff and litter fuel demonstration purposes only. Depths already averaged together for each transect.
#'
#' @format
#' A dataframe with 24 rows and 6 columns:
#' \describe{
#'   \item{time}{Year in which the data were collected}
#'   \item{site}{Broader location or forest where the data were collected}
#'   \item{plot}{Plot in which the individual transect was measured}
#'   \item{transect}{Transect on which the duff/litter depths were measured}
#'   \item{litter_depth}{Litter depth in centimeters}
#'   \item{duff_depth}{Duff depth in centimeters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"lit_duff_avg_demo"


#' @title Fine woody debris data for compilation demonstrations
#'
#' @description
#' A fake dataset created for fine woody debris compilation demonstration purposes only.
#'
#' @format
#' A dataframe with 9 rows and 11 columns:
#' \describe{
#'   \item{time}{year in which the data were collected}
#'   \item{site}{broader location or forest where the data were collected}
#'   \item{stratum}{stratum within site}
#'   \item{plot}{plot within stratum}
#'   \item{load_1h_Mg_ha}{fuel load of 1-hour fuels in megagrams per hectare}
#'   \item{load_10h_Mg_ha}{fuel load of 10-hour fuels in megagrams per hectare}
#'   \item{load_100h_Mg_ha}{fuel load of 100-hour fuels in megagrams per hectare}
#'   \item{load_fwd_Mg_ha}{total fine woody debris fuel load in megagrams per hectare}
#'   \item{sc_length_1h}{slope-corrected transect length for 1-hour fuels in meters}
#'   \item{sc_length_10h}{slope-corrected transect length for 10-hour fuels in meters}
#'   \item{sc_length_100h}{slope-corrected transect length for 100-hour fuels in meters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"compilation_fwd_demo"


#' @title Coarse woody debris data for compilation demonstrations
#'
#' @description
#' A fake dataset created for coarse woody debris compilation demonstration purposes only.
#'
#' @format
#' A dataframe with 9 rows and 9 columns:
#' \describe{
#'   \item{time}{year in which the data were collected}
#'   \item{site}{broader location or forest where the data were collected}
#'   \item{stratum}{stratum within site}
#'   \item{plot}{plot within stratum}
#'   \item{load_1000s_Mg_ha}{fuel load of sound 1000-hour fuels in megagrams per hectare}
#'   \item{load_1000r_Mg_ha}{fuel load of rotten 1000-hour fuels in megagrams per hectare}
#'   \item{load_cwd_Mg_ha}{total coarse woody debris fuel load in megagrams per hectare}
#'   \item{sc_length_1000s}{slope-corrected transect length for sound 1000-hour fuels in meters}
#'   \item{sc_length_1000r}{slope-corrected transect length for rotten 1000-hour fuels in meters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"compilation_cwd_demo"


#' @title Data for general stratified random sampling demonstrations
#'
#' @description
#' A fake dataset created for general compilation demonstration purposes only.
#'
#' @format
#' A dataframe with 9 rows and 8 columns:
#' \describe{
#'   \item{time}{year in which the data were collected}
#'   \item{site}{broader location or forest where the data were collected}
#'   \item{stratum}{stratum within site}
#'   \item{plot}{plot within stratum}
#'   \item{sph}{stems per hectare}
#'   \item{ba_m2_ha}{basal area in meters squared per hectare}
#'   \item{qmd_cm}{quadratic mean diameter in centimeters}
#'   \item{dbh_cm}{average diameter at breast height in centimeters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"compilation_strs_demo"


#' @title Weight data for stratified random sampling demonstrations
#'
#' @description
#' A fake dataset created for general compilation demonstration purposes only.
#'
#' @format
#' A dataframe with 4 rows and 3 columns:
#' \describe{
#'   \item{site}{broader location or forest where the data were collected}
#'   \item{stratum}{stratum within site}
#'   \item{wh}{stratum weight}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"compilation_wt_demo"


#' @title Data for general simple random sampling demonstrations
#'
#' @description
#' A fake dataset created for general compilation demonstration purposes only.
#'
#' @format
#' A dataframe with 9 rows and 7 columns:
#' \describe{
#'   \item{time}{year in which the data were collected}
#'   \item{site}{broader location or forest where the data were collected}
#'   \item{plot}{plot within site}
#'   \item{sph}{stems per hectare}
#'   \item{ba_m2_ha}{basal area in meters squared per hectare}
#'   \item{qmd_cm}{quadratic mean diameter in centimeters}
#'   \item{dbh_cm}{average diameter at breast height in centimeters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"compilation_srs_demo"


#' @title Data for general simple random sampling demonstrations
#'
#' @description
#' A fake dataset created for general compilation demonstration purposes only.
#'
#' @format
#' A dataframe with 8 rows and 8 columns:
#' \describe{
#'   \item{time}{year in which the data were collected}
#'   \item{site}{broader location or forest where the data were collected}
#'   \item{plot}{plot within site}
#'   \item{species}{tree species}
#'   \item{dominance}{relative basal area in percent}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"compilation_srs_sp_demo"


#' @title FPC data for general simple random sampling demonstrations
#'
#' @description
#' A fake dataset created for general compilation demonstration purposes only.
#'
#' @format
#' A dataframe with 2 rows and 3 columns:
#' \describe{
#'   \item{site}{broader location or forest where the data were collected}
#'   \item{N}{number of possible plots for the site}
#'   \item{n}{number of plots measured}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"compilation_fpc_demo"


#' @title Data for general Fire and Fire Surrogate demonstrations
#'
#' @description
#' A fake dataset created for general compilation demonstration purposes only.
#'
#' @format
#' A dataframe with 9 rows and 8 columns:
#' \describe{
#'   \item{time}{year in which the data were collected}
#'   \item{trt_type}{treatment type (burn, thin, thin + burn, control)}
#'   \item{site}{compartment}
#'   \item{plot}{plot within compartment}
#'   \item{sph}{stems per hectare}
#'   \item{ba_m2_ha}{basal area in meters squared per hectare}
#'   \item{qmd_cm}{quadratic mean diameter in centimeters}
#'   \item{dbh_cm}{average diameter at breast height in centimeters}
#' }
#'
#' @source Created by Kea Rutherford for demonstration purposes.
"compilation_ffs_demo"


#' @title Tree data for vignette, version 1
#'
#' @description
#' A dataset with intentional errors for demonstration purposes
#'
#' @format
#' A dataframe with 2250 rows and 10 columns:
#' \describe{
#'   \item{id}{time:site combined}
#'   \item{time}{pre (pre-burn) or post (post-burn)}
#'   \item{site}{compartment (60, 340, or 400)}
#'   \item{plot}{plot in which the individual tree was measured}
#'   \item{exp_factor}{stems per hectare}
#'   \item{status}{live (1) or dead (0)}
#'   \item{decay}{1-5 for standing dead trees. 0 for live trees.}
#'   \item{species}{Species of the individual tree, using four-letter species codes}
#'   \item{dbh}{diameter at breast height in centimeters}
#'   \item{ht}{tree height in meters}
#' }
#'
#' @source Fire and Fire Surrogate Study, Stephens Lab, University of California, Berkeley
"vign_trees_1"


#' @title Tree data for vignette, version 2
#'
#' @description
#' A dataset with intentional errors for demonstration purposes
#'
#' @format
#' A dataframe with 2250 rows and 10 columns:
#' \describe{
#'   \item{id}{time:site combined}
#'   \item{time}{pre (pre-burn) or post (post-burn)}
#'   \item{site}{compartment (60, 340, or 400)}
#'   \item{plot}{plot in which the individual tree was measured}
#'   \item{exp_factor}{stems per hectare}
#'   \item{status}{live (1) or dead (0)}
#'   \item{decay}{1-5 for standing dead trees. 0 for live trees.}
#'   \item{species}{Species of the individual tree, using four-letter species codes}
#'   \item{dbh}{diameter at breast height in centimeters}
#'   \item{ht}{tree height in meters}
#' }
#'
#' @source Fire and Fire Surrogate Study, Stephens Lab, University of California, Berkeley
"vign_trees_2"


#' @title Tree data for vignette, version 3
#'
#' @description
#' A dataset with intentional warnings for demonstration purposes
#'
#' @format
#' A dataframe with 2250 rows and 10 columns:
#' \describe{
#'   \item{id}{time:site combined}
#'   \item{time}{pre (pre-burn) or post (post-burn)}
#'   \item{site}{compartment (60, 340, or 400)}
#'   \item{plot}{plot in which the individual tree was measured}
#'   \item{exp_factor}{stems per hectare}
#'   \item{status}{live (1) or dead (0)}
#'   \item{decay}{1-5 for standing dead trees. 0 for live trees.}
#'   \item{species}{Species of the individual tree, using four-letter species codes}
#'   \item{dbh}{diameter at breast height in centimeters}
#'   \item{ht}{tree height in meters}
#' }
#'
#' @source Fire and Fire Surrogate Study, Stephens Lab, University of California, Berkeley
"vign_trees_3"


#' @title Tree data for vignette, version 4
#'
#' @description
#'  A dataset with intentional warnings for demonstration purposes
#'
#' @format
#' A dataframe with 2250 rows and 10 columns:
#' \describe{
#'   \item{id}{time:site combined}
#'   \item{time}{pre (pre-burn) or post (post-burn)}
#'   \item{site}{compartment (60, 340, or 400)}
#'   \item{plot}{plot in which the individual tree was measured}
#'   \item{exp_factor}{stems per hectare}
#'   \item{status}{live (1) or dead (0)}
#'   \item{decay}{1-5 for standing dead trees. 0 for live trees.}
#'   \item{species}{Species of the individual tree, using four-letter species codes}
#'   \item{dbh}{diameter at breast height in centimeters}
#'   \item{ht}{tree height in meters}
#' }
#'
#' @source Fire and Fire Surrogate Study, Stephens Lab, University of California, Berkeley
"vign_trees_4"


#' @title Tree data for vignette, version 5
#'
#' @description
#' A clean dataset for demonstration purposes
#'
#' @format
#' A dataframe with 2250 rows and 10 columns:
#' \describe{
#'   \item{id}{time:site combined}
#'   \item{time}{pre (pre-burn) or post (post-burn)}
#'   \item{site}{compartment (60, 340, or 400)}
#'   \item{plot}{plot in which the individual tree was measured}
#'   \item{exp_factor}{stems per hectare}
#'   \item{status}{live (1) or dead (0)}
#'   \item{decay}{1-5 for standing dead trees. 0 for live trees.}
#'   \item{species}{Species of the individual tree, using four-letter species codes}
#'   \item{dbh}{diameter at breast height in centimeters}
#'   \item{ht}{tree height in meters}
#' }
#'
#' @source Fire and Fire Surrogate Study, Stephens Lab, University of California, Berkeley
"vign_trees_5"


#' @title Fuel data for vignette, version 1
#'
#' @description
#' A dataset with intentional errors for demonstration purposes
#'
#' @format
#' A dataframe with 236 rows and 16 columns:
#' \describe{
#'   \item{time}{pre (pre-burn) or post (post-burn)}
#'   \item{site}{compartment (60, 340, or 400)}
#'   \item{plot}{plot in which the individual transect was measured}
#'   \item{transect}{azimuth of transect on which the fuel data were collected}
#'   \item{count_1h}{count of 1-hour fuels}
#'   \item{count_10h}{count of 10-hour fuels}
#'   \item{count_100h}{count of 100-hour fuels}
#'   \item{length_1h}{length of the sampling transect for 1-hour fuels in meters}
#'   \item{length_10h}{length of the sampling transect for 10-hour fuels in meters}
#'   \item{length_100h}{length of the sampling transect for 100-hour fuels in meters}
#'   \item{length_1000h}{length of the sampling transect for 1000-hour fuels in meters}
#'   \item{ssd_S}{sum-of-squared-diameters for sound 1000-hour fuels}
#'   \item{ssd_R}{sum-of-squared-diameters for rotten 1000-hour fuels}
#'   \item{litter_depth}{litter depth in centimeters}
#'   \item{duff_depth}{duff depth in centimeters}
#'   \item{slope}{slope along the transect in percent}
#' }
#'
#' @source Fire and Fire Surrogate Study, Stephens Lab, University of California, Berkeley
"vign_fuels_1"


#' @title Fuel data for vignette, version 2
#'
#' @description
#' A dataset with intentional errors for demonstration purposes
#'
#' @format
#' A dataframe with 236 rows and 16 columns:
#' \describe{
#'   \item{time}{pre (pre-burn) or post (post-burn)}
#'   \item{site}{compartment (60, 340, or 400)}
#'   \item{plot}{plot in which the individual transect was measured}
#'   \item{transect}{azimuth of transect on which the fuel data were collected}
#'   \item{count_1h}{count of 1-hour fuels}
#'   \item{count_10h}{count of 10-hour fuels}
#'   \item{count_100h}{count of 100-hour fuels}
#'   \item{length_1h}{length of the sampling transect for 1-hour fuels in meters}
#'   \item{length_10h}{length of the sampling transect for 10-hour fuels in meters}
#'   \item{length_100h}{length of the sampling transect for 100-hour fuels in meters}
#'   \item{length_1000h}{length of the sampling transect for 1000-hour fuels in meters}
#'   \item{ssd_S}{sum-of-squared-diameters for sound 1000-hour fuels}
#'   \item{ssd_R}{sum-of-squared-diameters for rotten 1000-hour fuels}
#'   \item{litter_depth}{litter depth in centimeters}
#'   \item{duff_depth}{duff depth in centimeters}
#'   \item{slope}{slope along the transect in percent}
#' }
#'
#' @source Fire and Fire Surrogate Study, Stephens Lab, University of California, Berkeley
"vign_fuels_2"


#' @title Fuel data for vignette, version 3
#'
#' @description
#' A dataset with intentional errors for demonstration purposes
#'
#' @format
#' A dataframe with 236 rows and 16 columns:
#' \describe{
#'   \item{time}{pre (pre-burn) or post (post-burn)}
#'   \item{site}{compartment (60, 340, or 400)}
#'   \item{plot}{plot in which the individual transect was measured}
#'   \item{transect}{azimuth of transect on which the fuel data were collected}
#'   \item{count_1h}{count of 1-hour fuels}
#'   \item{count_10h}{count of 10-hour fuels}
#'   \item{count_100h}{count of 100-hour fuels}
#'   \item{length_1h}{length of the sampling transect for 1-hour fuels in meters}
#'   \item{length_10h}{length of the sampling transect for 10-hour fuels in meters}
#'   \item{length_100h}{length of the sampling transect for 100-hour fuels in meters}
#'   \item{length_1000h}{length of the sampling transect for 1000-hour fuels in meters}
#'   \item{ssd_S}{sum-of-squared-diameters for sound 1000-hour fuels}
#'   \item{ssd_R}{sum-of-squared-diameters for rotten 1000-hour fuels}
#'   \item{litter_depth}{litter depth in centimeters}
#'   \item{duff_depth}{duff depth in centimeters}
#'   \item{slope}{slope along the transect in percent}
#' }
#'
#' @source Fire and Fire Surrogate Study, Stephens Lab, University of California, Berkeley
"vign_fuels_3"


#' @title Fuel data for vignette, version 4
#'
#' @description
#' A dataset with intentional errors and warnings for demonstration purposes
#'
#' @format
#' A dataframe with 236 rows and 16 columns:
#' \describe{
#'   \item{time}{pre (pre-burn) or post (post-burn)}
#'   \item{site}{compartment (60, 340, or 400)}
#'   \item{plot}{plot in which the individual transect was measured}
#'   \item{transect}{azimuth of transect on which the fuel data were collected}
#'   \item{count_1h}{count of 1-hour fuels}
#'   \item{count_10h}{count of 10-hour fuels}
#'   \item{count_100h}{count of 100-hour fuels}
#'   \item{length_1h}{length of the sampling transect for 1-hour fuels in meters}
#'   \item{length_10h}{length of the sampling transect for 10-hour fuels in meters}
#'   \item{length_100h}{length of the sampling transect for 100-hour fuels in meters}
#'   \item{length_1000h}{length of the sampling transect for 1000-hour fuels in meters}
#'   \item{ssd_S}{sum-of-squared-diameters for sound 1000-hour fuels}
#'   \item{ssd_R}{sum-of-squared-diameters for rotten 1000-hour fuels}
#'   \item{litter_depth}{litter depth in centimeters}
#'   \item{duff_depth}{duff depth in centimeters}
#'   \item{slope}{slope along the transect in percent}
#' }
#'
#' @source Fire and Fire Surrogate Study, Stephens Lab, University of California, Berkeley
"vign_fuels_4"


#' @title Fuel data for vignette, version 5
#'
#' @description
#' A clean dataset for demonstration purposes
#'
#' @format
#' A dataframe with 236 rows and 16 columns:
#' \describe{
#'   \item{time}{pre (pre-burn) or post (post-burn)}
#'   \item{site}{compartment (60, 340, or 400)}
#'   \item{plot}{plot in which the individual transect was measured}
#'   \item{transect}{azimuth of transect on which the fuel data were collected}
#'   \item{count_1h}{count of 1-hour fuels}
#'   \item{count_10h}{count of 10-hour fuels}
#'   \item{count_100h}{count of 100-hour fuels}
#'   \item{length_1h}{length of the sampling transect for 1-hour fuels in meters}
#'   \item{length_10h}{length of the sampling transect for 10-hour fuels in meters}
#'   \item{length_100h}{length of the sampling transect for 100-hour fuels in meters}
#'   \item{length_1000h}{length of the sampling transect for 1000-hour fuels in meters}
#'   \item{ssd_S}{sum-of-squared-diameters for sound 1000-hour fuels}
#'   \item{ssd_R}{sum-of-squared-diameters for rotten 1000-hour fuels}
#'   \item{litter_depth}{litter depth in centimeters}
#'   \item{duff_depth}{duff depth in centimeters}
#'   \item{slope}{slope along the transect in percent}
#' }
#'
#' @source Fire and Fire Surrogate Study, Stephens Lab, University of California, Berkeley
"vign_fuels_5"


######################################################################
# dataframes used for validating input data
######################################################################

sp_code_names <- data.frame(
  letter = c("PSME", "PIJE", "PIPO", "PISA", "TSHE", "TOCA", "TABR", "PICO", "UNCO", "ABMA", "CADE", "PILA",
             "PIMO", "JUOC", "ABCO", "SESE", "SEGI", "CONU", "ALRH", "POTR", "UMCA", "NODE", "ACMA", "QUKE",
             "ARME", "QUCH", "QUAG", "CHCH", "ABPR", "ABGR", "TSME", "UNHA", "UNTR", "SASP", NA),
  fia = c("202", "116", "122", "127", "263", "251", "231", "108", "299", "20", "81", "117", "119", "64", "15",
          "211", "212", "492", "352", "746", "981", "631", "312", "818", "361", "805", "801", "431", "22", "17",
          "264", "998", "999", "920", NA)
)

NSVB_sp_code_names <- data.frame(
  letter = c("ABCO", "ABRA", "ABMA", "ABPR", "JUCO", "CADE", "PICO", "PIJE", "PILA", "PIMO", "PIPO", "PISA", "PSME", "SESE", "SEGI", "TABR", "TOCA", "TSHE", "TSME", "UNCO",
             "ACMA", "ACRU", "ALRH", "ARME", "CHCH", "CONU", "NODE", "POTR", "QUSP", "QUAG", "QUAL", "QUCH", "QUKE", "SASP", "UMCA", "UNHA", "UNTR",
             "PRSE", "BEPO", "AMSP", "SOAM", "ACSP", "SAPU", "PRVI", "COSP", "TIAM", "QURU", "PIST", "OSVI",
             "FAGR", "POGR", "ABBA", "FRNI", "TSCA", "BEPA", "PRPE", "PIRU", "ACSA", "ACPE", "FRAM", "BEAL", NA),
  fia = c("15", "17", "20", "22", "64", "81", "108", "116", "117", "119", "122", "127", "202", "211", "212", "231", "251", "263", "264", "299",
          "312", "316", "352", "361", "431", "492", "631", "746", "800", "801", "802", "805", "818", "920", "981", "998", "999",
          "762", "379", "356", "935", "319", "6991", "763", "490", "951", "833", "129", "701",
          "531", "743", "12", "543", "261", "375", "761", "97", "318", "315", "541", "371", NA)
)

VanWag_species <- data.frame (
  letter = c("PSME","PISA","PIBA", "SEGI", "CADE", "PIJE", "PIAT", "PIFL", "PICO", "TSME", "PIPO", "ABMA", "PIMO1", "PILA", "PIWA", "JUOC", "PIMO2", "ABCO", "PIAL", "UNCO", "UNHA", "UNTR", NA),
  fia = c("202", "127", "104", "212", "81", "116", "103", "113", "108", "264", "122", "20", "133", "117", "137", "64", "119", "15", "101", "299", "998", "999", NA)
)


######################################################################
# dataframes used for NSVB biomass calculations
######################################################################

Table_1 <- data.frame(
  type = c("H","H","H","H","H","S","S","S","S","S"),
  decay_class = c("1","2","3","4","5","1","2","3","4","5"),
  wood_prop = c(0.99,0.8,0.54,0.43,0.43,0.97,1,0.92,0.55,0.55),
  bark_prop = c(1,0.8,0.5,0.2,0,1,0.8,0.5,0.2,0),
  branch_prop = c(1,0.5,0.1,0,0,1,0.5,0.1,0,0)
)


######################################################################
# dataframes used for surface and ground fuel load calculations
######################################################################

DL_table <- data.frame (
  letter = c("PSME","PISA","PIBA", "SEGI", "CADE", "PIJE", "PIAT", "PIFL", "PICO", "TSME", "PIPO", "ABMA", "PIMO1", "PILA", "PIWA", "JUOC", "PIMO2", "ABCO", "PIAL", "UNCO", "UNHA", "UNTR"),
  fia = c("202", "127", "104", "212", "81", "116", "103", "113", "108", "264", "122", "20", "133", "117", "137", "64", "119", "15", "101", "299", "998", "999"),
  litter_coef = c(0.864,0.111,0.886,0.990,1.276,0.358,0.339,0.889,0.951,1.102,0.276,0.530,0.906,0.304,0.600,0.832,0.542,1.050,0.540,0.363,0.363,0.363),
  duff_coef = c(1.319,1.448,2.504,1.648,1.675,1.707,1.646,2.337,1.671,1.876,1.402,1.727,2.592,1.396,1.870,1.798,1.422,1.518,1.895,1.750,1.750,1.750),
  litterduff_coef = c(1.295,1.220,2.360,1.632,1.664,1.496,1.274,2.255,1.612,1.848,1.233,1.722,2.478,1.189,1.719,1.763,1.485,1.572,1.802,1.624,1.624,1.624)
)

QMD_table <- data.frame (
  letter = c("ABCO", "ABMA", "CADE", "JUOC", "PIAL", "PIAT", "PIBA", "PICO", "PIFL", "PIJE", "PILA", "PIMO1", "PIMO2", "PIPO", "PISA", "PIWA", "PSME", "SEGI", "TSME", "UNCO", "UNHA", "UNTR"),
  fia = c("15", "20", "81", "64", "101", "103", "104", "108", "113", "116", "117", "133", "119", "122", "127", "137", "202", "212", "264", "299", "998", "999"),
  qmd_1h = c(0.08,0.10,0.09,0.08,0.13,0.10,0.12,0.10,0.21,0.15,0.12,0.09,0.08,0.23,0.14,0.22,0.06,0.14,0.05,0.12,0.12,0.12),
  qmd_10h = c(1.32,1.32,1.23,1.61,1.21,1.25,0.92,1.44,1.28,1.25,1.46,1.41,0.79,1.56,0.94,1.37,1.37,1.28,1.46,1.28, 1.28,1.28),
  qmd_100h = c(11.56,16.24,20.79,13.92,14.75,9.68,12.82,13.39,17.72,17.31,13.61,11.56,9.92,19.36,12.91,13.47,12.04,17.06,13.61,14.52, 14.52,14.52),
  qmd_1000h = c(162.56,219.93,74.30,61.62,92.74,70.39,127.24,138.06,115.78,135.49,169.52,129.96,127.24,101.81,127.24,122.77,75.69,167.70,115.99,127.24,127.24,127.24)
)

SEC_table <- data.frame (
  letter = c("ABCO", "ABMA", "CADE", "JUOC", "PIAL", "PIAT", "PIBA", "PICO", "PIFL", "PIJE", "PILA", "PIMO1", "PIMO2", "PIPO", "PISA", "PIWA", "PSME", "SEGI", "TSME", "UNCO", "UNHA", "UNTR"),
  fia = c("15", "20", "81", "64", "101", "103", "104", "108", "113", "116", "117", "133", "119", "122", "127", "137", "202", "212", "264", "299", "998", "999"),
  sec_1h = c(1.03,1.03,1.02,1.03,1.02,1.03,1.02,1.02,1.02,1.03,1.04,1.02,1.03,1.02,1.05,1.02,1.03,1.02,1.04,1.03,1.03,1.03),
  sec_10h = c(1.02,1.02,1.02,1.04,1.02,1.02,1.02,1.02,1.02,1.03,1.04,1.01,1.02,1.03,1.03,1.02,1.02,1.02,1.02,1.02,1.02,1.02),
  sec_100h = c(1.02,1.01,1.03,1.04,1.02,1.00,1.01,1.01,1.01,1.04,1.03,1.01,1.06,1.02,1.02,1.01,1.03,1.02,1.02,1.02,1.02,1.02),
  sec_1000h = c(1.01,1.00,1.06,1.04,1.02,1.02,1.02,1.05,1.01,1.05,1.03,1.05,1.02,1.01,1.02,1.05,1.04,1.01,1.00,1.02,1.02,1.02)
)

SG_table <- data.frame(
  letter = c("ABCO", "ABMA", "CADE", "JUOC", "PIAL", "PIAT", "PIBA", "PICO", "PIFL", "PIJE", "PILA", "PIMO1", "PIMO2", "PIPO", "PISA", "PIWA", "PSME", "SEGI", "TSME", "UNCO", "UNHA", "UNTR"),
  fia = c("15", "20", "81", "64", "101", "103", "104", "108", "113", "116", "117", "133", "119", "122", "127", "137", "202", "212", "264", "299", "998", "999"),
  sg_1h = c(0.53,0.57,0.59,0.67,0.55,0.59,0.59,0.53,0.57,0.53,0.59,0.65,0.56,0.55,0.64,0.53,0.60,0.57,0.67,0.58,0.58,0.58),
  sg_10h = c(0.54,0.56,0.54,0.65,0.49,0.55,0.61,0.48,0.57,0.55,0.59,0.64,0.56,0.56,0.61,0.52,0.61,0.57,0.65,0.57,0.57,0.57),
  sg_100h = c(0.57,0.47,0.55,0.62,0.48,0.39,0.53,0.54,0.54,0.55,0.52,0.53,0.49,0.48,0.43,0.44,0.59,0.56,0.62,0.53,0.53,0.53),
  sg_1000s = c(0.32,0.38,0.41,0.47,0.42,0.47,0.47,0.58,0.63,0.47,0.43,0.47,0.47,0.40,0.47,0.35,0.35,0.54,0.66,0.47,0.47,0.47)
)


######################################################################
# dataframes used for TreeBiomass function tests
######################################################################

good_trees_metric <- data.frame(
  Plot = as.character(c(1,1,1,2,2)),
  Live = as.character(c(1, 0, 1, 1, 0)),
  Decay = as.character(c(NA, 3, NA, NA, 2)),
  SPP = c("CADE", "PIPO", "QUKE", "ABCO", "PSME"),
  DBH_CM = c(10.3, 44.7, 19.1, 32.8, 13.8),
  HT_M = c(5.1, 26.4, 8.0, 23.3, 11.1)
)

good_trees_imperial <- data.frame(
  Plot = as.character(c(1,1,1,2,2)),
  Live = as.character(c(1, 0, 1, 1, 0)),
  Decay = as.character(c(NA, 3, NA, NA, 2)),
  SPP = c("CADE", "PIPO", "QUKE", "ABCO", "PSME"),
  DBH_IN = c(4.1, 17.6, 7.5, 12.9, 5.4),
  HT_FT = c(16.7, 86.6, 26.2, 76.4, 36.4)
)

bad_trees <- data.frame(

  Live_v1 = as.character(c(1, 0, 1, 1, 0)),
  Live_v2 = as.character(c(0, 0, 1, 1, 0)),
  Live_NA = as.character(c(1, 0, NA, 1, 0)), # NA value
  Live_bad1 = c("L", "D", "L", "L", "D"), # not following 0/1
  Live_bad2 = c(1, 0, 1, 1, 0), # wrong class

  SPP4 = c("CADE", "PIPO", "QUKE", "ABCO", "PSME"),
  SPP4_NA = c("CADE", NA, "QUKE", "ABCO", "PSME"), # NA value
  SPP4_bad1 = c("CADD", "PIPO", "QUKE", "ABCO", "PSME"), # one wrong
  SPP4_bad2 = c("CADD", "PIPP", "QUKK", "ABCC", "PSMM"), # all wrong
  SPP_fia_bad1 = c("81", "1222", "818", "15", "202"), # one wrong
  SPP_fia_bad2 = c("8111", "1222", "8188", "1555", "2022"), # all wrong
  SPP_fia_bad3 = c(81, 122, 818, 15, 202), # wrong class

  Decay = as.character(c(NA, 3, NA, NA, 2)),
  Decay_bad1 = as.character(c(NA, 8, NA, NA, 2)), # one wrong
  Decay_bad2 = as.character(c(NA, 3, 4, NA, 2)), # L tree w a D code
  Decay_bad3 = as.character(c(NA, 0, NA, NA, 2)), # D tree w a L code
  Decay_bad4 = c(NA, 3, NA, NA, 2), # wrong class

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
  Forest_bad1 = c(1,1,1,1,2,2,2,2,2), # wrong class

  Plot_id = as.character(c(1,1,2,2,1,1,2,2,2)),
  Plot_id_NA = as.character(c(1,NA,2,2,1,1,2,2,2)), # NA value
  Plot_id_bad1 = c(1,1,2,2,1,1,2,2,2), # wrong class
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
# dataframes used for BiomassNSVB function tests
######################################################################

gtr_examples <- data.frame(
  example = c("1", "2", "3", "4", "5"),
  site = "USDA",
  plot = "1",
  exp_factor = 20,
  species = c("202", "316", "631", "802", "800"),
  status = c("1", "1", "0", "1", "0"),
  dbh = c(20, 11.1, 11.3, 18.1, 16),
  ht1 = c(110, 38, 28, 65, 50),
  ht2 = c(NA, NA, 21, 59, NA),
  crown_ratio = c(0.3, 0.3, NA, 0.3, NA),
  top = c("Y", "Y", "N", "N", "Y"),
  decay_class = as.character(c(NA, NA, 2, NA, 3)),
  cull = c(0, 3, 10, 2, 10),
  division = c("240", "M210", "M240", "M220", "M260"),
  province = c("242", "M211", "M242", "M221", "M261")
)

nsvb_sum_check <- data.frame(
  division = "M260",
  province = "M261",
  site = c("SEKI","SEKI","SEKI","SEKI","SEKI","SEKI","SEKI","SEKI","SEKI","YOMI","YOMI","YOMI","YOMI","YOMI","YOMI","YOMI","YOMI","YOMI"),
  plot = as.character(c(1,1,1,1,1,2,2,2,2,1,1,1,1,1,1,2,3,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,0,50,50),
  status = as.character(c(1,0,1,1,0,1,1,1,0,1,1,1,1,1,1,NA,1,1)),
  decay_class = as.character(c(NA,2,NA,NA,3,NA,NA,NA,3,NA,NA,NA,NA,NA,NA,NA,NA,NA)),
  species = c("PSME","ABCO","PSME","PSME","ABCO","ABCO","ABCO","ABCO","ABCO","PSME","PSME","ABCO","PSME","ABCO","PSME",NA,"PSME","PSME"),
  dbh = c(10.3,44.7,19.1,32.8,13.8,20.2,31.7,13.1,26.3,10.7,40.6,20.1,33.8,12.4,22.2,NA,NA,28.1),
  ht1 = c(5.1,26.4,8.0,23.3,11.1,8.5,22.3,9.7,15.6,5.5,28.4,7.9,22.3,10.8,9.5,NA,9.9,NA),
  ht2 = c(NA,NA,6.0,NA,8.2,NA,NA,NA,NA,NA,18.6,NA,NA,NA,NA,NA,NA,NA),
  crown_ratio = c(0.3,NA,0.4,0.4,NA,0.5,0.4,0.2,NA,0.6,0.4,0.3,0.3,0.5,0.2,NA,0.3,0.3),
  top = c("Y","Y","N","Y","N","Y","Y","Y","Y","Y","N","Y","Y","Y","Y",NA,"Y","Y"),
  cull = c(0,0,10,0,0,0,5,0,10,5,0,10,0,0,0,NA,0,0)
)

nsvb_gm4 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_gmf <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("202", "15", "202", "202", "15", "81", "818", "15", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA),
  extra1 = 2024,
  extra2 = "Z"
)

nsvb_gi4 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(20,20,20,20,20,20,20,20,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(4.0, 17.6, 7.5, 12.9, 5.4, 8.0, 12.5, 5.2, NA),
  ht1 = c(16.7, 86.6, 26.2, 76.4, 36.4, 27.9, 73.2, 31.8, NA),
  ht2 = c(NA, NA, 20.0, NA, 26.9, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_gif <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(20,20,20,20,20,20,20,20,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("202", "15", "202", "202", "15", "81", "818", "15", NA),
  dbh = c(4.0, 17.6, 7.5, 12.9, 5.4, 8.0, 12.5, 5.2, NA),
  ht1 = c(16.7, 86.6, 26.2, 76.4, 36.4, 27.9, 73.2, 31.8, NA),
  ht2 = c(NA, NA, 20.0, NA, 26.9, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_m_units <- data.frame(
  site = "SEKI",
  plot = "1",
  exp_factor = 50,
  division = "M260",
  province = "M261",
  status = "1",
  decay_class = as.character(NA),
  species = "PSME",
  dbh = 25.4,
  ht1 = 20,
  ht2 = 15,
  crown_ratio = 0.3,
  top = "N",
  cull = 0
)

nsvb_i_units <- data.frame(
  site = "SEKI",
  plot = "1",
  exp_factor = 20.23431,
  division = "M260",
  province = "M261",
  status = "1",
  decay_class = as.character(NA),
  species = "PSME",
  dbh = 10,
  ht1 = 65.6168,
  ht2 = 49.2126,
  crown_ratio = 0.3,
  top = "N",
  cull = 0
)

nsvb_b1 <- data.frame(
  #site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b2 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  #plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b3 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  #exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b4 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  #division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b5 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  #status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b6 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  #decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b7 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  #species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b8 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  #dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b9 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  #ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b10 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  #ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b11 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  #crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b12 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  #top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b13 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA)
  #cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b14 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = as.character(c(50,50,50,50,50,50,50,50,0)), # wrong class
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b15 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = as.character(c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA)), # wrong class
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b16 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = as.character(c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA)), # wrong class
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b17 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = as.character(c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA)), # wrong class
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b18 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = as.character(c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA)), # wrong class
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b19 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = as.character(c(0,0,10,0,0,0,5,0,NA)) # wrong class
)

nsvb_b20 <- data.frame(
  site = c("SEKI", NA, "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"), # NA value
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b21 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,NA,2,2,1,1,2,2,3)), # NA value
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b22 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,NA,50,50,50,50,50,50,0), # NA value
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b23 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,50,50,0), # incorrect use pf exp_factor = 0
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b24 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, 10.1), # dbh for a no tree plot
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b25 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = c(NA,"M260","M260","M260","M260","M260","","M260","M260"), # NA value
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b26 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = c("M330","M260","220","M260","M260","M260","","M260","M260"), # unrecognized divisions
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b27 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("L", "0", "1", "1", "1", "1", "1", "0", NA), # unrecognized code
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b28 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c(NA, "0", "1", "1", "1", "1", "1", "0", NA), # NA value
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b29 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 8, NA, NA, NA, NA, NA, 44, NA)), # wrong decay class codes
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b30 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, NA, NA, NA, NA, NA, NA, 4, NA)), # NA decay class for dead tree
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b31 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(1, 2, NA, NA, NA, NA, NA, 4, NA)), # live tree with a decay class
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b32 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("202", "155", "202", "202", "15", "81", "818", "15", NA), # species typo
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b35 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCOO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA), # species typo
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b38 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", NA, "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA), # NA value
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b39 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("1", "Y", "0", "Y", "N", "Y", "Y", "Y", NA), # wrong top code
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b40 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c(NA, "Y", "N", "Y", "N", "Y", "Y", "Y", NA), # NA value
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b41 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, NA, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA), # NA value
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b42 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 2.0, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA), # DBH below cutoff
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b43 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(20,20,20,20,20,20,20,20,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("202", "15", "202", "202", "15", "81", "818", "15", NA),
  dbh = c(4.0, 0.6, 7.5, 12.9, 5.4, 8.0, 12.5, 5.2, NA), # DBH below cutoff
  ht1 = c(16.7, 86.6, 26.2, 76.4, 36.4, 27.9, 73.2, 31.8, NA),
  ht2 = c(NA, NA, 20.0, NA, 26.9, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)


nsvb_b44 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(NA, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA), # NA value
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b45 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(16.7, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, NA, NA, 8.2, NA, NA, NA, NA), # NA value
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b46 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(0.7, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA), # HT1 below cutoff
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b47 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(16.7, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 1.0, NA, 8.2, NA, NA, NA, NA), # HT2 below cutoff
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b48 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(20,20,20,20,20,20,20,20,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("202", "15", "202", "202", "15", "81", "818", "15", NA),
  dbh = c(4.0, 12.6, 7.5, 12.9, 5.4, 8.0, 12.5, 5.2, NA),
  ht1 = c(1.7, 86.6, 26.2, 76.4, 36.4, 27.9, 73.2, 31.8, NA), # HT1 below cutoff
  ht2 = c(NA, NA, 20.0, NA, 26.9, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b49 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(20,20,20,20,20,20,20,20,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("202", "15", "202", "202", "15", "81", "818", "15", NA),
  dbh = c(4.0, 12.6, 7.5, 12.9, 5.4, 8.0, 12.5, 5.2, NA),
  ht1 = c(16.7, 86.6, 26.2, 76.4, 36.4, 27.9, 73.2, 31.8, NA),
  ht2 = c(NA, NA, 2.0, NA, 26.9, NA, NA, NA, NA), # HT2 below cutoff
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b50 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(16.7, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 36.0, NA, 8.2, NA, NA, NA, NA), # HT2 > HT1
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b51 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(16.7, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, 20.0, 6.0, NA, 8.2, NA, NA, NA, NA), # non-NA value
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b52 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(16.7, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(NA,NA,0.4,0.4,0.3,0.5,0.4,NA,NA), # NA value
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b53 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(16.7, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(1.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA), # value outside of range
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b54 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(16.7, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,0.3,0.4,0.4,0.3,0.5,0.4,NA,NA), # dead tree w live crown ratio
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b55 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(16.7, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(NA,0,10,0,0,0,5,0,NA) # NA value
)

nsvb_b56 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(16.7, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,1000,0,0,0,5,0,NA) # value outside of range
)

nsvb_b57 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = 260, # wrong class
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b58 <- data.frame(
  site = as.factor(c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI")), # wrong class
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b59 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = c(1,1,2,2,1,1,2,2,3), # wrong class
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b60 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = as.factor(c("1", "0", "1", "1", "1", "1", "1", "0", NA)), # wrong class
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b61 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = c(NA, 2, NA, NA, NA, NA, NA, 4, NA), # wrong class
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b62 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = as.factor(c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA)), # wrong class
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b63 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = as.factor(c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA)), # wrong class
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b64 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(-50,50,50,50,50,50,50,50,0), # a nagative value
  division = "M260",
  province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b65 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  #province = "M261",
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b66 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "260",
  province = 261, # wrong class
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b67 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = "M260",
  province = c(NA, "M261", "M261", "M261", "M261", "M261", "M261", "M261", "M261"), # NA value
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b68 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = c("M260", "M260", "260", "260", "320", "320", "340", "340", "340"),
  province = c("M2611", "M261", "261", "261", "3222", "322", "341", "341", "341"), # unrecognized codes
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b69 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = c("M260", "M260", "260", "260", "320", "320", "340", "340", "340"),
  province = c("261", "M261", "261", "261", "322", "322", "341", "341", "341"), # mismatched code
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b70 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = c("M260", "M260", "260", "260", "320", "320", "340", "340", "340"),
  province = c("M261", "M261", "261", "M261", "322", "322", "341", "341", "341"), # mismatched code
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b71 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = c("M260", "M260", "260", "260", "320", "320", "340", "340", "340"),
  province = c("M261", "M261", "261", "261", "341", "322", "341", "341", "341"), # mismatched code
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
)

nsvb_b72 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,1,1,2,2,3)),
  exp_factor = c(50,50,50,50,50,50,50,50,0),
  division = c("M260", "M260", "260", "260", "320", "320", "340", "340", "340"),
  province = c("M261", "M261", "261", "261", "322", "322", "322", "341", "341"), # mismatched code
  status = c("1", "0", "1", "1", "1", "1", "1", "0", NA),
  decay_class = as.character(c(NA, 2, NA, NA, NA, NA, NA, 4, NA)),
  species = c("PSME", "ABCO", "PSME", "PSME", "ABCO", "CADE", "QUKE", "ABCO", NA),
  dbh = c(10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7, 13.1, NA),
  ht1 = c(5.1, 26.4, 8.0, 23.3, 11.1, 8.5, 22.3, 9.7, NA),
  ht2 = c(NA, NA, 6.0, NA, 8.2, NA, NA, NA, NA),
  crown_ratio = c(0.3,NA,0.4,0.4,0.3,0.5,0.4,NA,NA),
  top = c("Y", "Y", "N", "Y", "N", "Y", "Y", "Y", NA),
  cull = c(0,0,10,0,0,0,5,0,NA)
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
  Forest_bad = c(1,1,1,2,2,2,2,2,2), # wrong class

  Plot_id = as.character(c(1,1,1,1,1,2,2,2,2)),
  Plot_id_NA = as.character(c(1,NA,1,1,1,2,2,2,2)), # NA value
  Plot_id_NT = as.character(c(1,1,1,1,1,2,2,2,3)), # no tree plot
  Plot_id_bad = c(1,1,1,1,1,2,2,2,2), # wrong class

  SPH = c(50,50,50,50,50,50,50,50,50),
  SPH_NA = c(50,NA,50,50,50,50,50,50,50), # NA value
  SPH_bad = as.character(c(50,50,50,50,50,50,50,50,50)), # wrong class
  SPH_NT = c(50,50,50,50,50,50,50,50,0), # no tree plot

  Live = c("1", "0", "1", "1", "1", "1", "1", "1", "0"),
  Live_NA = c("1", "0", NA, "1", "1", "1", "1", "1", "0"), # NA value
  Live_bad = c("L", "D", "L", "L", "L", "L", "L", "L", "D"), # not following 0/1
  Live_NT = c("1", "0", "1", "1", "1", "1", "1", "1", NA), # no tree plot
  Live_bad2 = c(1, 0, 1, 1, 1, 1, 1, 1, 0), # wrong class

  SPP = c("PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "ABCO", "PSME"),
  SPP_NA = c("PSME", "ABCO", NA, "PSME", "CADE", "CADE", "CADE", "ABCO", "PSME"), # NA value
  SPP_NT = c("PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "ABCO", NA), # no tree plot
  SPP_bad = 15, # wrong class

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
# dataframes used for surface/ground fuel function tests
######################################################################

#---------------------------------------------------------------------
# tree dataframes
#---------------------------------------------------------------------

good_sf_trees_m <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

good_sf_trees_i <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(20,20,20,20,20,20,20,20,20,20,20,20,20,20),
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(5.3, 4.1, 7.5, 12.9, 5.4, 8.0, 12.4, 4.1, 17.6, 7.5, 12.9, 5.4, 8.0, 12.5)
)

bad_sf_trees_1 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  #plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)), # intentional missing column
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_2 <- data.frame(
  time = c("2019", NA, "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"), # missing time
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_3 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", NA, "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"), # missing site
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_4 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,NA,1,2,2,2,2,1,1,1,2,2,2,2)), # missing plot
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_5 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,NA,50,50,50,50,50,50,50,50,50,50,50,50), # missing expansion factor
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_6 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,-5,50,50,50,50,50,50,50,50,50,50,50,50), # negative expansion factor
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_7 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,0,50,50,50,50,50,50,50,50,50,50,50,50), # 0 expansion factor, but more than one row
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_8 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,3,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,0,50,50,50,50,50,50,50), # 0 expansion factor, but non-NA species and dbh
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_9 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, -10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7) # negative dbh
)

bad_sf_trees_10 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, NA, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7) # missing dbh
)

bad_sf_trees_11 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,3,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,0,50,50,50,50,50,50,50), # 0 expansion factor
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", NA, "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"), # NA species
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, NA, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7) # NA dbh
)

bad_sf_trees_12 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("ABCO", NA, "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"), # NA species
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_13 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("ABCO", "ABCC", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"), # unrecognized sp.
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_14 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = as.character(c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)) # wrong class
)

bad_sf_trees_15 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = as.character(c(50,50,50,50,50,50,50,50,50,50,50,50,50,50)), # wrong class
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_16 <- data.frame(
  time = c(2019, 2019, 2019, 2019, 2019, 2019, 2019, 2020, 2020, 2020, 2020, 2020, 2020, 2020), # wrong class
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_17 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = 1, # wrong class
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_18 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c(1,1,1,2,2,2,2,1,1,1,2,2,2,2), # wrong class
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = c("ABCO", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE", "PSME", "ABCO", "ABCO", "PSME", "CADE", "CADE", "CADE"),
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)

bad_sf_trees_19 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = as.character(c(1,1,1,2,2,2,2,1,1,1,2,2,2,2)),
  exp_factor = c(50,50,50,50,50,50,50,50,50,50,50,50,50,50),
  species = 15, # wrong class
  dbh = c(13.5, 10.3, 19.1, 32.8, 13.8, 20.2, 31.7, 10.3, 44.7, 19.1, 32.8, 13.8, 20.2, 31.7)
)


#---------------------------------------------------------------------
# FWD dataframes
#---------------------------------------------------------------------

good_fwd_m <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

good_fwd_i <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(6,6,6,6,6,6,6,6),
  length_10h = c(12,12,12,12,12,12,12,12),
  length_100h = c(20,20,20,20,20,20,20,20),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_1 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  #plot = c("1", "1", "2", "2", "1", "1", "2", "2"), # intentional missing column
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_2 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6)
  #slope = c(10,20,15,5,10,20,15,5) # remove slope
)

bad_fwd_3 <- data.frame(
  time = c("2019", NA, "2019", "2019", "2020", "2020", "2020", "2020"), # missing time
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_4 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", NA, "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"), # missing site
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_5 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", NA, "2", "2", "1", "1", "2", "2"), # missing plot
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_6 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = as.character(c(2,2,2,2,2,2,2,2)), # wrong class
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_7 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,NA,2,2,2,2,2,2), # missing length
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_8 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,-2,2,2,2,2,2,2), # negative length
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_9 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = as.character(c(10,20,15,5,10,20,15,5)) # wrong class
)

bad_fwd_10 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(-10,20,15,5,10,20,15,5) # negative slope
)

bad_fwd_11 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,NA,15,5,10,20,15,5) # missing slope
)

bad_fwd_12 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = as.character(c(12,30,10,2,5,14,9,6)), # wrong class
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_13 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30.1,10,2,5,14,9,6), # not a whole number
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_14 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,NA,10,2,5,14,9,6), # missing count
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_15 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", NA, "90", "180", "90", "180", "90", "180"), # missing transect
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_16 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "180", "90", "180", "90", "90"), # repeat time:site:plot:transect
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_17 <- data.frame(
  time = c(1,1,1,1,2,2,2,2), # wrong class
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_18 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = 1, # wrong class
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_19 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c(1, 1, 2, 2, 1, 1, 2, 2), # wrong class
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)

bad_fwd_20 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c(90, 180, 90, 180, 90, 180, 90, 180), # wrong class
  count_1h = c(12,30,10,2,5,14,9,6),
  count_10h = c(4,8,3,2,9,4,3,3),
  count_100h = c(5,7,10,11,6,3,13,9),
  length_1h = c(2,2,2,2,2,2,2,2),
  length_10h = c(4,4,4,4,4,4,4,4),
  length_100h = c(6,6,6,6,6,6,6,6),
  slope = c(10,20,15,5,10,20,15,5)
)


#---------------------------------------------------------------------
# CWD dataframes
#---------------------------------------------------------------------

good_cwd_m <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

good_cwd_i <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(5,6,4,4,8,12,6),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(50,50,50,50,50,50,50),
  slope = c(10,2,2,0,0,5,5)
)

good_cwd_sum <- data.frame(
  time = c("2019", "2019", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI"),
  plot = c("1", "2", "1", "2"),
  transect = c("90", "90", "90", "90"),
  ssd_S = c(0, 225, 400, 1217),
  ssd_R = c(144, 81, 100, 0),
  length_1000h = c(15,15,15,15),
  slope = c(10,2,0,5)
)

bad_cwd_1 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  # plot = c("1", "2", "2", "1", "1", "2", "2"), # intentional missing column
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_sum1 <- data.frame(
  time = c("2019", "2019", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI"),
  # plot = c("1", "2", "1", "2"), # intentional missing column
  transect = c("90", "90", "90", "90"),
  ssd_S = c(0, 225, 400, 1217),
  ssd_R = c(144, 81, 100, 0),
  length_1000h = c(15,15,15,15),
  slope = c(10,2,0,5)
)

bad_cwd_2 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15)
  #slope = c(10,2,2,0,0,5,5) # remove slope
)

bad_cwd_3 <- data.frame(
  time = c("2019", NA, "2019", "2020", "2020", "2020", "2020"), # missing time
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_4 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", NA,"SEKI", "SEKI", "SEKI", "SEKI", "SEKI"), # missing site
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_5 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", NA, "2", "1", "1", "2", "2"), # missing plot
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_6 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", NA, "90", "90", "90", "90", "90"), # missing transect
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_7 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = as.character(c(15,15,15,15,15,15,15)), # wrong class
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_8 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,NA,15,15,15,15,15), # missing length
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_9 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,-15,15,15,15,15,15), # negative length
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_10 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = as.character(c(10,2,2,0,0,5,5)) # wrong class
)

bad_cwd_11 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,-2,-2,0,0,5,5) # negative slope
)

bad_cwd_12 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,NA,NA,0,0,5,5) # missing slope
)

bad_cwd_13 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = as.character(c(12,15,9,10,20,31,16)), # wrong class
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_14 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,7,9,10,20,31,16), # diam below threshold
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_15 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,NA,9,10,20,31,16), # missing diam
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_16 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","K","R","R","S","S","S"), # unrecognized status code
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_17 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R",NA,"R","R","S","S","S"), # missing status code
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_18 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,12,15,15,15,15,15), # diff lengths
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_19 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,0,2,0,0,5,5) # diff slopes
)

bad_cwd_20 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,0,9,10,20,31,16), # 0 diam, but more than 1 row
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_21 <- data.frame(
  time = c(2019, 2019, 2019, 2020, 2020, 2020, 2020), # wrong class
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_22 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = 1, # wrong class
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_23 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c(1, 2, 2, 1, 1, 2, 2), # wrong class
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_24 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = 90, # wrong class
  diameter = c(12,15,9,10,20,31,16),
  status = c("R","S","R","R","S","S","S"),
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5))

bad_cwd_25 <- data.frame(
  time = c("2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "90", "90", "90", "90", "90", "90"),
  diameter = c(12,15,9,10,20,31,16),
  status = as.factor(c("R","S","R","R","S","S","S")), # wrong class
  length_1000h = c(15,15,15,15,15,15,15),
  slope = c(10,2,2,0,0,5,5)
)

bad_cwd_sum2 <- data.frame(
  time = c("2019", "2019", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI"),
  plot = c("1", "2", "1", "2"),
  transect = c("90", "90", "90", "90"),
  ssd_S = as.character(c(0, 225, 400, 1217)), # wrong class
  ssd_R = c(144, 81, 100, 0),
  length_1000h = c(15,15,15,15),
  slope = c(10,2,0,5)
)

bad_cwd_sum3 <- data.frame(
  time = c("2019", "2019", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI"),
  plot = c("1", "2", "1", "2"),
  transect = c("90", "90", "90", "90"),
  ssd_S = c(0, -225, 400, 1217), # negative value
  ssd_R = c(144, 81, 100, 0),
  length_1000h = c(15,15,15,15),
  slope = c(10,2,0,5)
)

bad_cwd_sum4 <- data.frame(
  time = c("2019", "2019", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI"),
  plot = c("1", "2", "1", "2"),
  transect = c("90", "90", "90", "90"),
  ssd_S = c(0, NA, 400, 1217), # missing value
  ssd_R = c(144, 81, 100, 0),
  length_1000h = c(15,15,15,15),
  slope = c(10,2,0,5)
)

bad_cwd_sum5 <- data.frame(
  time = c("2019", "2019", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI"),
  plot = c("1", "2", "1", "2"),
  transect = c("90", "90", "90", "90"),
  ssd_S = c(0, 225, 400, 1217),
  ssd_R = as.character(c(144, 81, 100, 0)), # wrong class
  length_1000h = c(15,15,15,15),
  slope = c(10,2,0,5)
)

bad_cwd_sum6 <- data.frame(
  time = c("2019", "2019", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI"),
  plot = c("1", "2", "1", "2"),
  transect = c("90", "90", "90", "90"),
  ssd_S = c(0, 225, 400, 1217),
  ssd_R = c(144, -81, 100, 0), # negative value
  length_1000h = c(15,15,15,15),
  slope = c(10,2,0,5)
)

bad_cwd_sum7 <- data.frame(
  time = c("2019", "2019", "2020", "2020"),
  site = c("SEKI", "SEKI","SEKI", "SEKI"),
  plot = c("1", "2", "1", "2"),
  transect = c("90", "90", "90", "90"),
  ssd_S = c(0, 225, 400, 1217),
  ssd_R = c(144, NA, 100, 0), # missing value
  length_1000h = c(15,15,15,15),
  slope = c(10,2,0,5)
)

bad_cwd_sum8 <- data.frame(    # repeat time:site:plot:transect
  time = c("2019", "2019", "2019", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI"),
  plot = c("1", "1", "2", "1", "2"),
  transect = c("90", "90", "90", "90", "90"),
  ssd_S = c(0, 0, 225, 400, 1217),
  ssd_R = c(144, 144, 81, 100, 0),
  length_1000h = c(15,15,15,15,15),
  slope = c(10,10,2,0,5)
)


#---------------------------------------------------------------------
# Duff/litter dataframes
#---------------------------------------------------------------------

good_duff_m <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  litter_depth = c(2,3,6,7,5,5,3,6),
  duff_depth = c(5,1,3,2,4,4,2,1),
  lit_duff_depth = c(7,4,9,9,9,9,5,7)
)

good_duff_i <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  litter_depth = c(1,1,2,3,2,2,1,2),
  duff_depth = c(2,1,1,2,2,2,1,1),
  lit_duff_depth = c(3,2,3,5,4,4,2,3)
)

bad_duff_1 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180")
  #litter_depth = c(2,3,6,7,5,5,3,6), # missing columns
  #duff_depth = c(5,1,3,2,4,4,2,1),
  #lit_duff_depth = c(7,4,9,9,9,9,5,7)
)

bad_duff_2 <- data.frame(
  time = c(NA, "2019", "2019", "2019", "2020", "2020", "2020", "2020"), # missing time
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  litter_depth = c(2,3,6,7,5,5,3,6),
  duff_depth = c(5,1,3,2,4,4,2,1),
  lit_duff_depth = c(7,4,9,9,9,9,5,7)
)

bad_duff_3 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", NA, "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"), # missing site
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  litter_depth = c(2,3,6,7,5,5,3,6),
  duff_depth = c(5,1,3,2,4,4,2,1),
  lit_duff_depth = c(7,4,9,9,9,9,5,7)
)

bad_duff_4 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", NA, "2", "2", "1", "1", "2", "2"), # missing plot
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  litter_depth = c(2,3,6,7,5,5,3,6),
  duff_depth = c(5,1,3,2,4,4,2,1),
  lit_duff_depth = c(7,4,9,9,9,9,5,7)
)

bad_duff_5 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c(NA, "180", "90", "180", "90", "180", "90", "180"), # missing transect
  litter_depth = c(2,3,6,7,5,5,3,6),
  duff_depth = c(5,1,3,2,4,4,2,1),
  lit_duff_depth = c(7,4,9,9,9,9,5,7)
)

bad_duff_6 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  litter_depth = as.character(c(2,3,6,7,5,5,3,6)), # wrong class
  duff_depth = c(5,1,3,2,4,4,2,1),
  lit_duff_depth = as.character(c(7,4,9,9,9,9,5,7)) # wrong class
)

bad_duff_7 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  litter_depth = c(2,-3,6,7,5,5,3,6), # negative depth
  duff_depth = c(5,1,3,2,4,4,2,1),
  lit_duff_depth = c(7,-4,9,9,9,9,5,7) # negative depth
)

bad_duff_8 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  litter_depth = c(2,NA,6,7,5,5,3,6), # missing depth
  duff_depth = c(5,1,3,2,4,4,2,1),
  lit_duff_depth = c(7,NA,9,9,9,9,5,7) # missing depth
)

bad_duff_9 <- data.frame(
  time = c(2019, 2019, 2019, 2019, 2020, 2020, 2020, 2020), # wrong class
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  litter_depth = c(2,3,6,7,5,5,3,6),
  duff_depth = c(5,1,3,2,4,4,2,1),
  lit_duff_depth = c(7,4,9,9,9,9,5,7)
)

bad_duff_10 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = 1, # wrong class
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  litter_depth = c(2,3,6,7,5,5,3,6),
  duff_depth = c(5,1,3,2,4,4,2,1),
  lit_duff_depth = c(7,4,9,9,9,9,5,7)
)

bad_duff_11 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c(1, 1, 2, 2, 1, 1, 2, 2), # wrong class
  transect = c("90", "180", "90", "180", "90", "180", "90", "180"),
  litter_depth = c(2,3,6,7,5,5,3,6),
  duff_depth = c(5,1,3,2,4,4,2,1),
  lit_duff_depth = c(7,4,9,9,9,9,5,7)
)

bad_duff_12 <- data.frame(
  time = c("2019", "2019", "2019", "2019", "2020", "2020", "2020", "2020"),
  site = c("SEKI", "SEKI", "SEKI","SEKI", "SEKI", "SEKI", "SEKI", "SEKI"),
  plot = c("1", "1", "2", "2", "1", "1", "2", "2"),
  transect = c(90, 180, 90, 180, 90, 180, 90, 180), # wrong class
  litter_depth = c(2,3,6,7,5,5,3,6),
  duff_depth = c(5,1,3,2,4,4,2,1),
  lit_duff_depth = c(7,4,9,9,9,9,5,7)
)


######################################################################
# dataframes used for compilation function tests
######################################################################

#---------------------------------------------------------------------
# General compilation dataframes
#---------------------------------------------------------------------

# stratified random sampling -----------------------------------------
g_strs <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c("1", "1", "1", "2", "2", "1", "1", "2", "2", "1", "1", "1", "2", "2", "1", "1", "2", "2"),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

g_strs_sp <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 1, 2, 2, 2, 2)),
  plot = as.character(c(1,1,2,2,3,3,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,3,3,1,1,2,2,1,1,2,2,1,1,2,2)),
  species =  c("ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"),
  bio = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

g_strs_wh_1 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2)),
  wh = c(0.3,0.7,0.8,0.2)
)

g_strs_wh_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "YOMI", "YOMI", "SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2,1,2,1,2)),
  wh = c(0.3,0.7,0.8,0.2,0.1,0.9,0.5,0.5)
)

g_strs_fpc_1 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2)),
  N = c(20,15,18,22),
  n = c(3,2,2,2)
)

g_strs_fpc_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "YOMI", "YOMI", "SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2,1,2,1,2)),
  N = c(300,400,500,600,300,400,500,600),
  n = c(5,10,20,40,5,9,18,35)
)

b_strs_1 <- data.frame(
  #time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),  missing column
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c("1", "1", "1", "2", "2", "1", "1", "2", "2", "1", "1", "1", "2", "2", "1", "1", "2", "2"),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_strs_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  #site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),  missing column
  stratum = c("1", "1", "1", "2", "2", "1", "1", "2", "2", "1", "1", "1", "2", "2", "1", "1", "2", "2"),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_strs_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  #stratum = c("1", "1", "1", "2", "2", "1", "1", "2", "2", "1", "1", "1", "2", "2", "1", "1", "2", "2"),  missing column
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_strs_4 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c("1", "1", "1", "2", "2", "1", "1", "2", "2", "1", "1", "1", "2", "2", "1", "1", "2", "2"),
  #plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),  missing column
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_strs_5 <- data.frame(
  time = c("pre", NA, "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),  # missing time
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c("1", "1", "1", "2", "2", "1", "1", "2", "2", "1", "1", "1", "2", "2", "1", "1", "2", "2"),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_strs_6 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", NA, "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"), # missing site
  stratum = c("1", "1", "1", "2", "2", "1", "1", "2", "2", "1", "1", "1", "2", "2", "1", "1", "2", "2"),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_strs_7 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c("1", NA, "1", "2", "2", "1", "1", "2", "2", "1", "1", "1", "2", "2", "1", "1", "2", "2"), # missing stratum
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_strs_8 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c("1", "1", "1", "2", "2", "1", "1", "2", "2", "1", "1", "1", "2", "2", "1", "1", "2", "2"),
  plot = as.character(c(1,NA,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)), # missing plot
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_strs_9 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c("1", "1", "1", "2", "2", "1", "1", "2", "2", "1", "1", "1", "2", "2", "1", "1", "2", "2"),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  ba = as.character(c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25)), # wrong class
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_strs_10 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c("1", "1", "1", "2", "2", "1", "1", "2", "2", "1", "1", "1", "2", "2", "1", "1", "2", "2"),
  plot = as.character(c(1,1,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)), # repeat time:site:stratum:plot
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_strs_11 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c(1, 1, 1, 2, 2, 1, 1, 2, 2, 1, 1, 1, 2, 2, 1, 1, 2, 2), # wrong class
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_strs_sp_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c("1", "1", "1", "1", "1", "2", "2", "2", "2", "1", "1", "1", "1", "2", "2", "2", "2", "1", "1", "1", "1", "1", "1", "2", "2", "2", "2", "1", "1", "1", "1",  "2", "2", "2", "2"),
  plot = as.character(c(1,2,2,3,3,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,3,3,1,1,2,2,1,1,2,2,1,1,2,2)),
  species =  c("PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"), # missing species
  bio = c(42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_strs_sp_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c("1", "1", "1", "1", "1", "1", "2", "2", "2", "2", "1", "1", "1", "1", "2", "2", "2", "2", "1", "1", "1", "1", "1", "1", "2", "2", "2", "2", "1", "1", "1", "1",  "2", "2", "2", "2"),
  plot = as.character(c(1,1,2,2,3,3,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,3,3,1,1,2,2,1,1,2,2,1,1,2,2)),
  species =  c("ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"),
  bio = as.character(c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)) # wrong class
)

b_strs_sp_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c("1", "1", "1", "1", "1", "1", "1", "2", "2", "2", "2", "1", "1", "1", "1", "2", "2", "2", "2", "1", "1", "1", "1", "1", "1", "2", "2", "2", "2", "1", "1", "1", "1",  "2", "2", "2", "2"),
  plot = as.character(c(1,1,1,2,2,3,3,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,3,3,1,1,2,2,1,1,2,2,1,1,2,2)),
  species =  c("ABCO", "ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"), # repeat species
  bio = c(20, 31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_strs_wh_1 <- data.frame(
  #site = c("SEKI", "SEKI", "YOMI", "YOMI"),  missing column
  stratum = as.character(c(1,2,1,2)),
  wh = c(0.3,0.7,0.8,0.2)
)

b_strs_wh_2 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  #stratum = as.character(c(1,2,1,2)),  missing column
  wh = c(0.3,0.7,0.8,0.2)
)

b_strs_wh_3 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2))
  #wh = c(0.3,0.7,0.8,0.2)  missing column
)

b_strs_wh_4 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2)),
  wh = as.character(c(0.3,0.7,0.8,0.2)) # wrong class
)

b_strs_wh_5 <- data.frame(
  time = c(NA, "pre", "pre", "pre", "post", "post", "post", "post"), # missing time
  site = c("SEKI", "SEKI", "YOMI", "YOMI", "SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2,1,2,1,2)),
  wh = c(0.3,0.7,0.8,0.2,0.3,0.7,0.8,0.2)
)

b_strs_wh_6 <- data.frame(
  site = c(NA, "SEKI", "YOMI", "YOMI"), # missing site
  stratum = as.character(c(1,2,1,2)),
  wh = c(0.3,0.7,0.8,0.2)
)

b_strs_wh_7 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(NA,2,1,2)), # missing stratum
  wh = c(0.3,0.7,0.8,0.2)
)

b_strs_wh_8 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2)),
  wh = c(NA,0.7,0.8,0.2) # missing weight
)

b_strs_wh_9 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,3,1,2)), # mismatch site:stratum
  wh = c(0.3,0.7,0.8,0.2)
)

b_strs_wh_10 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "YOMI", "YOMI", "SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,3,1,2,1,2,1,2)), # mismatch time:site:stratum
  wh = c(0.3,0.7,0.8,0.2,0.3,0.7,0.8,0.2)
)

b_strs_wh_11 <- data.frame(
  site = c("SEKI", "SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,2,1,2)), # repeat site:stratum
  wh = c(0.3,0.3,0.7,0.8,0.2)
)

b_strs_wh_12 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,2,1,2,1,2,1,2)), # repeat time:site:stratum
  wh = c(0.3,0.3,0.7,0.8,0.2,0.3,0.7,0.8,0.2)
)

b_strs_wh_13 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2)),
  wh = c(0.2,0.7,0.8,0.2) # incorrect weighting
)

b_strs_wh_14 <- data.frame(
  time = as.factor(c("pre", "pre", "pre", "pre", "post", "post", "post", "post")), # wrong class
  site = c("SEKI", "SEKI", "YOMI", "YOMI", "SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2,1,2,1,2)),
  wh = c(0.3,0.7,0.8,0.2,0.1,0.9,0.5,0.5)
)

b_strs_wh_15 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "post", "post", "post", "post"),
  site = c(1,1,2,2,1,1,2,2), # wrong class
  stratum = as.character(c(1,2,1,2,1,2,1,2)),
  wh = c(0.3,0.7,0.8,0.2,0.1,0.9,0.5,0.5)
)

b_strs_wh_16 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "YOMI", "YOMI", "SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = c(1,2,1,2,1,2,1,2), # wrong class
  wh = c(0.3,0.7,0.8,0.2,0.1,0.9,0.5,0.5)
)

b_strs_fpc_1 <- data.frame(
  #site = c("SEKI", "SEKI", "YOMI", "YOMI"),  missing column
  stratum = as.character(c(1,2,1,2)),
  N = c(300,400,500,600),
  n = c(5,10,20,40)
)

b_strs_fpc_2 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  #stratum = as.character(c(1,2,1,2)),  missing column
  N = c(300,400,500,600),
  n = c(5,10,20,40)
)

b_strs_fpc_3 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2)),
  #N = c(300,400,500,600),  missing column
  n = c(5,10,20,40)
)

b_strs_fpc_4 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2)),
  N = c(300,400,500,600)
  #n = c(5,10,20,40)  missing column
)

b_strs_fpc_5 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2)),
  N = as.character(c(300,400,500,600)), # wrong class
  n = c(5,10,20,40)
)

b_strs_fpc_6 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2)),
  N = c(300,400,500,600),
  n = as.character(c(5,10,20,40)) # wrong class
)

b_strs_fpc_7 <- data.frame(
  time = c("pre", NA, "pre", "pre", "post", "post", "post", "post"), # missing time
  site = c("SEKI", "SEKI", "YOMI", "YOMI", "SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2,1,2,1,2)),
  N = c(300,400,500,600,300,400,500,600),
  n = c(5,10,20,40,5,9,18,35)
)

b_strs_fpc_8 <- data.frame(
  site = c("SEKI", NA, "YOMI", "YOMI"), # missing site
  stratum = as.character(c(1,2,1,2)),
  N = c(300,400,500,600),
  n = c(5,10,20,40)
)

b_strs_fpc_9 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,NA,1,2)), # missing stratum
  N = c(300,400,500,600),
  n = c(5,10,20,40)
)

b_strs_fpc_10 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2)),
  N = c(300,NA,500,600), # missing N
  n = c(5,10,20,40)
)

b_strs_fpc_11 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2)),
  N = c(300,400,500,600),
  n = c(5,NA,20,40) # missing n
)

b_strs_fpc_12 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "YOMI", "YOMI", "SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,3,1,2,1,2,1,2)), # mismatch time:site:stratum
  N = c(300,400,500,600,300,400,500,600),
  n = c(5,10,20,40,5,9,18,35)
)

b_strs_fpc_13 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,3,1,2)), # mismatch site:stratum
  N = c(300,400,500,600),
  n = c(5,10,20,40)
)

b_strs_fpc_14 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "post", "post", "post", "post", "post"), # repeat time:site:stratum
  site = c("SEKI", "SEKI", "YOMI", "YOMI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2,1,2,1,2,2)),
  N = c(300,400,500,600,300,400,500,600,600),
  n = c(5,10,20,40,5,9,18,35,35)
)

b_strs_fpc_15 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI", "YOMI"), # repeat site:stratum
  stratum = as.character(c(1,2,1,2,2)),
  N = c(300,400,500,600,600),
  n = c(5,10,20,40,40)
)

b_strs_fpc_16 <- data.frame(
  site = c("SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2)),
  N = c(300,400,500,600),
  n = c(5,1000,20,40) # n > N
)

b_strs_fpc_17 <- data.frame(
  time = as.factor(c("pre", "pre", "pre", "pre", "post", "post", "post", "post")), # wrong class
  site = c("SEKI", "SEKI", "YOMI", "YOMI", "SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = as.character(c(1,2,1,2,1,2,1,2)),
  N = c(300,400,500,600,300,400,500,600),
  n = c(5,10,20,40,5,9,18,35)
)

b_strs_fpc_18 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "post", "post", "post", "post"),
  site = as.factor(c("SEKI", "SEKI", "YOMI", "YOMI", "SEKI", "SEKI", "YOMI", "YOMI")), # wrong class
  stratum = as.character(c(1,2,1,2,1,2,1,2)),
  N = c(300,400,500,600,300,400,500,600),
  n = c(5,10,20,40,5,9,18,35)
)

b_strs_fpc_19 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "YOMI", "YOMI", "SEKI", "SEKI", "YOMI", "YOMI"),
  stratum = c(1,2,1,2,1,2,1,2), # wrong class
  N = c(300,400,500,600,300,400,500,600),
  n = c(5,10,20,40,5,9,18,35)
)

# simple random sampling -----------------------------------------
g_srs <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

g_srs_sp <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4,1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4)),
  species =  c("ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"),
  bio = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

g_srs_fpc_1 <- data.frame(
  site = c("SEKI", "YOMI"),
  N = c(60,20),
  n = c(5,4)
)

g_srs_fpc_2 <- data.frame(
  time = c("pre", "pre", "post", "post"),
  site = c("SEKI", "YOMI", "SEKI", "YOMI"),
  N = c(700,1000,700,1000),
  n = c(15,60,14,57)
)

b_srs_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  ba = as.character(c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25)), # wrong class
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_srs_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)), # repeat observation
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_srs_sp_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4,1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4)),
  species =  c("ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"),
  bio = as.character(c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)) # wrong class
)

b_srs_sp_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4,1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4)),
  species =  c("ABCO", "ABCO", "PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"), # repeat observation
  bio = c(21,31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_srs_sp_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4,1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4)),
  species =  c("PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"),
  bio = c(42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_srs_sp_4 <- data.frame(
  time = as.factor(c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post")), # wrong class
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4,1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4)),
  species =  c("ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"),
  bio = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_srs_sp_5 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = as.factor(c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI")), # wrong class
  plot = as.character(c(1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4,1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4)),
  species =  c("ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"),
  bio = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_srs_sp_6 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = c(1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4,1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4), # wrong class
  species =  c("ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"),
  bio = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_srs_sp_7 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4,1,1,2,2,3,3,4,4,5,5,1,1,2,2,3,3,4,4)),
  species =  15, # wrong class
  bio = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_srs_fpc_1 <- data.frame(
  time = c("pre", "pre", "post", "post"),
  site = c("YOPI", "YOMI", "SEKI", "YOMI"), # mismatch time:site
  N = c(700,1000,700,1000),
  n = c(15,60,14,57)
)

b_srs_fpc_2 <- data.frame(
  site = c("YOPI", "YOMI"), # mismatch site
  N = c(700,1000),
  n = c(15,60)
)

b_srs_fpc_3 <- data.frame(
  time = c("pre", "pre", "post", "post", "post"), # repeat time:site
  site = c("SEKI", "YOMI", "SEKI", "YOMI", "YOMI"),
  N = c(700,1000,700,1000,1000),
  n = c(15,60,14,57,57)
)

b_srs_fpc_4 <- data.frame(
  site = c("SEKI", "YOMI", "YOMI"), # repeat site
  N = c(700,1000,1000),
  n = c(15,60,60)
)

# Fire and fire surrogate -----------------------------------------
g_ffs <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"),
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

g_ffs_sp <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = as.character(c(1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2)),
  site = as.character(c(360, 360, 360, 360, 220, 220, 220, 220, 220, 220, 460, 460, 460, 460, 530, 530, 530, 530, 360, 360, 360, 360, 220, 220, 220, 220, 220, 220, 460, 460, 460, 460, 530, 530, 530, 530)),
  plot = as.character(c(1,1,2,2,1,1,2,2,3,3,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,3,3,1,1,2,2,1,1,2,2)),
  species =  c("ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"),
  bio = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

g_ffs_fpc_1 <- data.frame(
  trt_type = c("burn", "burn", "mech", "mech"),
  site = c("360", "220", "460", "530"),
  N = c(20,15,18,22),
  n = c(2,3,2,2)
)

g_ffs_fpc_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "mech", "mech", "burn", "burn", "mech", "mech"),
  site = c("360", "220", "460", "530", "360", "220", "460", "530"),
  N = c(300,400,500,600,300,400,500,600),
  n = c(5,10,20,40,5,9,18,37)
)

g_ffs_fpc_3 <- data.frame(
  trt_type = c("1", "1", "2", "2"),
  site = c("360", "220", "460", "530"),
  N = c(20,15,18,22),
  n = c(2,3,2,2)
)

b_ffs_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  #trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"), missing column
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_ffs_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", NA, "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"), # missing trt type
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_ffs_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"),
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  ba = as.character(c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25)), # wrong class
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_ffs_4 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"),
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,1,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)), # repeat observation
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_ffs_5 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = as.factor(c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech")), # wrong class
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  ba = c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25),
  dbh = c(15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_ffs_sp_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = as.character(c(1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2)),
  site = as.character(c(360, 360, 360, 360, 220, 220, 220, 220, 220, 220, 460, 460, 460, 460, 530, 530, 530, 530, 360, 360, 360, 360, 220, 220, 220, 220, 220, 220, 460, 460, 460, 460, 530, 530, 530, 530)),
  plot = as.character(c(1,1,2,2,1,1,2,2,3,3,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,3,3,1,1,2,2,1,1,2,2)),
  species =  c("ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"),
  bio = as.character(c(31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)) # wrong_class
)

b_ffs_sp_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = as.character(c(1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2)),
  site = as.character(c(360, 360, 360, 360, 360, 220, 220, 220, 220, 220, 220, 460, 460, 460, 460, 530, 530, 530, 530, 360, 360, 360, 360, 220, 220, 220, 220, 220, 220, 460, 460, 460, 460, 530, 530, 530, 530)),
  plot = as.character(c(1,1,1,2,2,1,1,2,2,3,3,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,3,3,1,1,2,2,1,1,2,2)),
  species =  c("ABCO","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"), # repeat observation
  bio = c(31,31,42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_ffs_sp_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = as.character(c(1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2)),
  site = as.character(c(360, 360, 360, 220, 220, 220, 220, 220, 220, 460, 460, 460, 460, 530, 530, 530, 530, 360, 360, 360, 360, 220, 220, 220, 220, 220, 220, 460, 460, 460, 460, 530, 530, 530, 530)),
  plot = as.character(c(1,2,2,1,1,2,2,3,3,1,1,2,2,1,1,2,2,1,1,2,2,1,1,2,2,3,3,1,1,2,2,1,1,2,2)),
  species =  c("PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME","ABCO","PSME"), # missing species
  bio = c(42,50,34,37,38,46,34,40,15,30,21,24,28,18,19,23,25,15,24,27,23,28,19,25,21,17,17,26,29,25,30,21,27,23,19)
)

b_ffs_fpc_1 <- data.frame(
  #trt_type = c("burn", "burn", "mech", "mech"), missing column
  site = c("360", "220", "460", "530"),
  N = c(300,400,500,600),
  n = c(5,10,20,40)
)

b_ffs_fpc_2 <- data.frame(
  trt_type = c("burn", NA, "mech", "mech"), # missing trt_type
  site = c("360", "220", "460", "530"),
  N = c(300,400,500,600),
  n = c(5,10,20,40)
)

b_ffs_fpc_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "mech", "mech", "burn", "burn", "mech", "mech"),
  site = c("3600", "220", "460", "530", "360", "220", "460", "530"), # mismatch time:trt_type:site
  N = c(300,400,500,600,300,400,500,600),
  n = c(5,10,20,40,5,9,18,37)
)

b_ffs_fpc_4 <- data.frame(
  trt_type = c("burn", "burn", "mech", "mech"),
  site = c("3600", "220", "460", "530"), # mismatch trt_type:site
  N = c(300,400,500,600),
  n = c(5,10,20,40)
)

b_ffs_fpc_5 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "post", "post", "post", "post", "post"), # repeat time:trt_type:site
  trt_type = c("burn", "burn", "mech", "mech", "burn", "burn", "mech", "mech", "mech"),
  site = c("360", "220", "460", "530", "360", "220", "460", "530", "530"),
  N = c(300,400,500,600,300,400,500,600,600),
  n = c(5,10,20,40,5,9,18,37,37)
)

b_ffs_fpc_6 <- data.frame(
  trt_type = c("burn", "burn", "mech", "mech", "mech"), # repeat trt_type:site
  site = c("360", "220", "460", "530", "530"),
  N = c(300,400,500,600,600),
  n = c(5,10,20,40,40)
)

b_ffs_fpc_7 <- data.frame(
  trt_type = c(1, 1, 2, 2), # wrong class
  site = c("360", "220", "460", "530"),
  N = c(300,400,500,600),
  n = c(5,10,20,40)
)

#---------------------------------------------------------------------
# Surface fuel compilation dataframes
#---------------------------------------------------------------------

# stratified random sampling -----------------------------------------
# FWD -------
g_strs_fwd_m <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

g_strs_fwd_i <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1h_ton_ac = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_ton_ac = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_strs_fwd_m_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  #stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)), missing column
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_strs_fwd_m_2 <- data.frame(
  time = c("pre", NA, "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"), # missing time
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_strs_fwd_m_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", NA, "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"), # missing site
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_strs_fwd_m_4 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,NA,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)), # missing stratum
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_strs_fwd_m_5 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,NA,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)), # missing plot
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_strs_fwd_m_6 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,3,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)), # repeat observation
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_strs_fwd_m_7 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,4,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)), # merging dataframes check
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_strs_fwd_m_8 <- data.frame(
  time = as.factor(c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post")), # wrong class
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_strs_fwd_m_9 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c(1,1,1,1,1,2,2,2,2,1,1,1,1,1,2,2,2,2), # wrong class
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_strs_fwd_m_10 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2), # wrong class
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_strs_fwd_m_11 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2), # wrong class
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_strs_fwd_i_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  #load_1h_ton_ac = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2), missing column
  load_10h_ton_ac = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

# CWD -------
g_strs_cwd_m <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

g_strs_cwd_i <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1000s_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_ton_ac = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_strs_cwd_m_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  #stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)), missing column
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_strs_cwd_m_2 <- data.frame(
  time = c("pre", NA, "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"), # missing time
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_strs_cwd_m_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", NA, "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"), # missing site
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_strs_cwd_m_4 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,NA,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)), # missing stratum
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_strs_cwd_m_5 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,NA,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)), # missing plot
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_strs_cwd_m_6 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,3,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)), # repeat observation
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_strs_cwd_m_7 <- data.frame(
  time = as.factor(c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post")), # wrong class
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_strs_cwd_m_8 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = as.factor(c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI")), # wrong class
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_strs_cwd_m_9 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2), # wrong class
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_strs_cwd_m_10 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2), # wrong class
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_strs_cwd_i_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  stratum = as.character(c(1,1,1,2,2,1,1,2,2,1,1,1,2,2,1,1,2,2)),
  plot = as.character(c(1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2,1,2)),
  #load_1000s_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4), missing column
  load_1000r_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_ton_ac = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)


# simple random sampling -----------------------------------------
# FWD -----
g_srs_fwd_m <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

g_srs_fwd_i <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1h_ton_ac = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_ton_ac = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_srs_fwd_m_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  #plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)), missing column
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_srs_fwd_m_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1h_Mg_ha = as.character(c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2)), # wrong class
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_srs_fwd_m_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = as.character(c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3)), # wrong class
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_srs_fwd_m_4 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = as.character(c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4)), # wrong class
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_srs_fwd_m_5 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = as.character(c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)), # wrong class
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_srs_fwd_m_6 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = as.character(c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)), # wrong class
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_srs_fwd_m_7 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = as.character(c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)) # wrong class
)

b_srs_fwd_m_8 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)), # repeat observation
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_srs_fwd_m_9 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,5,1,2,3,4,5,1,2,3,4)), # merging dataframes check
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_srs_fwd_i_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  #load_1h_ton_ac = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2), missing column
  load_10h_ton_ac = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_srs_fwd_i_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1h_ton_ac = as.character(c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2)), # wrong class
  load_10h_ton_ac = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_srs_fwd_i_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1h_ton_ac = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_ton_ac = as.character(c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3)), # wrong class
  load_100h_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_srs_fwd_i_4 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1h_ton_ac = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_ton_ac = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_ton_ac = as.character(c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4)), # wrong class
  load_fwd_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

# CWD ------
g_srs_cwd_m <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

g_srs_cwd_i <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1000s_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_ton_ac = c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_srs_cwd_m_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  #plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)), missing column
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_srs_cwd_m_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1000s_Mg_ha = as.character(c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4)), # wrong class
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_srs_cwd_m_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = as.character(c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9)), # wrong class
  load_cwd_Mg_ha = c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_srs_cwd_m_4 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = as.character(c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13)), # wrong class
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_srs_cwd_m_5 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = as.character(c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)), # wrong class
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_srs_cwd_m_6 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = as.character(c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)) # wrong class
)

b_srs_cwd_m_7 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,1,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)), # repeat observation
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_srs_cwd_i_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  #load_1000s_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4), missing column
  load_1000r_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_ton_ac = c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_srs_cwd_i_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1000s_ton_ac = as.character(c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4)), # wrong class
  load_1000r_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_ton_ac = c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_srs_cwd_i_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1000s_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_ton_ac = as.character(c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9)), # wrong class
  load_cwd_ton_ac = c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_srs_cwd_i_4 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  site = c("SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI", "SEKI", "SEKI", "SEKI", "SEKI", "SEKI", "YOMI", "YOMI", "YOMI", "YOMI"),
  plot = as.character(c(1,2,3,4,5,1,2,3,4,1,2,3,4,5,1,2,3,4)),
  load_1000s_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_ton_ac = as.character(c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13)), # wrong class
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)


# Fire and fire surrogate -----------------------------------------
# FWD -----
g_ffs_fwd_m <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"),
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

g_ffs_fwd_i <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"),
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  load_1h_ton_ac = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_ton_ac = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_ffs_fwd_m_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  #trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"), missing column
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_ffs_fwd_m_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", NA, "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"), # missing type
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_ffs_fwd_m_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"),
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,2,1,2,1,2,1,2,1,2,3,1,2,1,2)), # repeat observation
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_ffs_fwd_m_4 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"),
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,4,1,2,1,2,1,2,1,2,3,1,2,1,2)), # merging dataframes check
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_ffs_fwd_m_5 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = as.factor(c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech")), # wrong class
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  load_1h_Mg_ha = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2),
  load_10h_Mg_ha = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

b_ffs_fwd_i_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"),
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  #load_1h_ton_ac = c(1,1,2,3,1,0,3,2,2,0,2,1,1,0,3,2,1,2), missing column
  load_10h_ton_ac = c(2,2,3,4,2,1,4,3,3,1,3,2,2,1,4,3,2,3),
  load_100h_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_fwd_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  sc_length_1h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_10h = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_100h = c(9,9,8,7,9,9,9,8,8,9,9,8,7,9,9,9,8,8)
)

# CWD -----
g_ffs_cwd_m <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"),
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

g_ffs_cwd_i <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"),
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  load_1000s_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_ton_ac = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_ffs_cwd_m_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  #trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"), missing column
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_ffs_cwd_m_2 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", NA, "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"), # missing type
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_ffs_cwd_m_3 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"),
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,2,1,2,1,2,1,2,1,2,3,1,2,1,2)), # repeat observation
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_ffs_cwd_m_4 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = as.factor(c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech")), # wrong class
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  load_1000s_Mg_ha = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4),
  load_1000r_Mg_ha = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_Mg_ha = c(9,9,13,17,9,5,17,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)

b_ffs_cwd_i_1 <- data.frame(
  time = c("pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "pre", "post", "post", "post", "post", "post", "post", "post", "post", "post"),
  trt_type = c("burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech", "burn", "burn", "burn", "burn", "burn", "mech", "mech", "mech", "mech"),
  site = as.character(c(360, 360, 220, 220, 220, 460, 460, 530, 530, 360, 360, 220, 220, 220, 460, 460, 530, 530)),
  plot = as.character(c(1,2,1,2,3,1,2,1,2,1,2,1,2,3,1,2,1,2)),
  #load_1000s_ton_ac = c(3,3,4,5,3,2,5,4,4,2,4,3,3,2,5,4,3,4), missing column
  load_1000r_ton_ac = c(6,6,9,12,6,3,12,9,9,3,9,6,6,3,12,9,6,9),
  load_cwd_ton_ac = c(9,9,13,17,9,5,1713,13,5,13,9,9,5,17,13,13,9,13),
  sc_length_1000s = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6),
  sc_length_1000r = c(6,6,5,5,6,4,6,6,6,6,6,5,5,6,4,6,6,6)
)
