

Rfuels <- read.csv(system.file('extdata', 'fuels_check.csv', package = "UCBForestAnalytics"),
                   stringsAsFactors = FALSE)

fuels2 <- Rfuels %>%
  group_by(plot_id, inv_date) %>%
  summarise(R_lit = mean(fuelload_litter_Mgha),
            R_duff = mean(fuelload_duff_Mgha)) %>%
  separate_wider_delim(plot_id, "-", names = c("site", "plot")) %>%
  mutate(site = as.numeric(site),
         plot = as.numeric(plot),
         site = as.character(site),
         plot = as.character(plot)) %>%
  separate_wider_delim(inv_date, "-", names = c("time", "month", "day")) %>%
  select(time, site, plot, R_lit, R_duff) %>%
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

trial <- GroundLoad(ex_fuels, ex_trees, "metric", "4letter", "separate")

trial2 <- trial %>%
  mutate(K_lit = litter_Mg_ha,
         K_duff = duff_Mg_ha) %>%
  select(time, site, plot, K_lit, K_duff) %>%
  arrange(time, site, plot)

all <- full_join(trial2, fuels2, by = c("time", "site", "plot")) %>%
  select(time, site, plot, R_lit, K_lit, R_duff, K_duff)


test_that('Rfuels and UCB agree', {

  expect_equal(all$R_lit, all$K_lit)
  expect_equal(all$R_duff, all$K_duff)

})
