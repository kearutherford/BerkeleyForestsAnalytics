Final <- function(data_1, data_2, site_orig, plot_orig, sp_orig, dbh_orig, ht_orig, units_orig) {
  
  if (units_orig == "metric") {
    
    final_df <- subset(data_2, select = -c(dbh_in, ht_ft))
    names(final_df)[names(final_df) == "dbh_cm"] <- colnames(data_1[dbh_orig])
    names(final_df)[names(final_df) == "ht_m"] <- colnames(data_1[ht_orig])
    
  } else if (units_orig == "imperial") {
    
    final_df <- subset(data_2, select = -c(dbh_cm, ht_m))
    names(final_df)[names(final_df) == "dbh_in"] <- colnames(data_1[dbh_orig])
    names(final_df)[names(final_df) == "ht_ft"] <- colnames(data_1[ht_orig])
    
  }
  
  names(final_df)[names(final_df) == "site"] <- colnames(data_1[site_orig])
  names(final_df)[names(final_df) == "plot"] <- colnames(data_1[plot_orig])
  names(final_df)[names(final_df) == "species"] <- colnames(data_1[sp_orig])
  
  rownames(final_df) <- NULL
  
  return(final_df)
  
}