Decisions made when adding all FIA species: 

* In the NSVB workflow, there is no model for Jenkins group 10. 
  For species that were hardwood and 10 I assigned equation 8 (matching unknown hardwood). 
  For species that were softwood and 10 I assigned equation 4 (matching unknown softwood).
  
* 4 species did not have H/S assigned. I looked them up and assigned them:
  5328 (H), 74 (S), 75 (S), 8621 (H)
  
  
REF_SPECIES_BFA is based on FIADB REF_SPECIES csv file. 

  
To update internal data run the following:  

use_data(discount, REF_SPECIES_BFA, results_by_hand,
         Table_S10a, Table_S10b,
         Table_S11,
         Table_S1a, Table_S1b,
         Table_S2a, Table_S2b,
         Table_S3a, Table_S3b,
         Table_S4a, Table_S4b,
         Table_S5a, Table_S5b,
         Table_S6a, Table_S6b,
         Table_S7a, Table_S7b,
         Table_S8a, Table_S8b,
         Table_S9a, Table_S9b,
         by_hand_sp, by_hand_sp_st, by_hand_st, by_hand_plot, nsvb_hand,
         rfuels_fuels, rfuels_trees, rfuels_loads,
         comp_str_trees_m, comp_str_trees_i,
         comp_den_hand, comp_ba_hand,
         str_m_hand, str_i_hand,
         srs_hand, srs_hand_fpc, srs_hand_sp, srs_hand_sp_fpc,
         strs_hand_1, strs_hand_2, strs_hand_fpc_1, strs_hand_fpc_2,
         strs_hand_sp_1, strs_hand_sp_2, strs_hand_sp_fpc_1, strs_hand_sp_fpc_2,
         ffs_hand_1, ffs_hand_2, ffs_hand_fpc_1, ffs_hand_fpc_2,
         ffs_hand_sp_1, ffs_hand_sp_2, ffs_hand_sp_fpc_1, ffs_hand_sp_fpc_2,
         srs_fuels_hand, srs_fuels_hand_fpc,
         strs_fuels_hand_1, strs_fuels_hand_2, strs_fuels_hand_fpc_1, strs_fuels_hand_fpc_2,
         ffs_fuels_hand_1, ffs_fuels_hand_2, ffs_fuels_hand_fpc_1, ffs_fuels_hand_fpc_2,
         internal = TRUE,
         overwrite = TRUE)
