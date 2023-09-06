









Rfuels <- read.csv(system.file('extdata', 'fuels_check.csv', package = "UCBForestAnalytics"),
                   stringsAsFactors = FALSE)

fuels2 <- Rfuels %>%
  group_by(plot_id, inv_date) %>%
  summarise(R_sound = mean(fuelload_1000s_Mgha),
            R_rotten = mean(fuelload_1000r_Mgha)) %>%
  separate_wider_delim(plot_id, "-", names = c("site", "plot")) %>%
  mutate(site = as.numeric(site),
         plot = as.numeric(plot),
         site = as.character(site),
         plot = as.character(plot)) %>%
  separate_wider_delim(inv_date, "-", names = c("time", "month", "day")) %>%
  select(time, site, plot, R_sound, R_rotten) %>%
  arrange(time, site, plot)


ex_trees <- read.csv(system.file('extdata', 'example_treelist.csv', package = "UCBForestAnalytics"),
                     stringsAsFactors = FALSE)

ex_fuels <- read.csv(system.file('extdata', 'example_fuels.csv', package = "UCBForestAnalytics"),
                     stringsAsFactors = FALSE)

ex_trees$site <- as.character(ex_trees$site)
ex_trees$plot <- as.character(ex_trees$plot)
ex_trees$time <- as.character(ex_trees$time)

ex_fuels$site <- as.character(ex_fuels$site)
ex_fuels$plot <- as.character(ex_fuels$plot)
ex_fuels$time <- as.character(ex_fuels$time)
ex_fuels$transect <- as.character(ex_fuels$transect)
ex_fuels$ssd_S <- ex_fuels$sum_d2_1000s_cm2
ex_fuels$ssd_R <- ex_fuels$sum_d2_1000r_cm2

trial <- CoarseFuels(ex_trees, ex_fuels, units = "metric", sp_codes = "4letter", summed = "yes")

trial2 <- trial %>%
  mutate(K_sound = load_1000s_Mg_ha,
         K_rotten = load_1000r_Mg_ha) %>%
  select(time, site, plot, K_sound, K_rotten) %>%
  arrange(time, site, plot)

all <- full_join(trial2, fuels2, by = c("time", "site", "plot")) %>%
  select(time, site, plot, R_sound, K_sound, R_rotten, K_rotten)


test_that('Rfuels and UCB agree', {

  #expect_equal(all$R_sound, all$K_sound)
  expect_equal(all$R_rotten, all$K_rotten)

})



