
Rfuels <- read.csv(system.file('extdata', 'fuels_check.csv', package = "UCBForestAnalytics"),
                   stringsAsFactors = FALSE)

fuels2 <- Rfuels %>%
  group_by(plot_id, inv_date) %>%
  summarise(R_1h = mean(fuelload_1h_Mgha),
            R_10h = mean(fuelload_10h_Mgha),
            R_100h = mean(fuelload_100h_Mgha)) %>%
  separate_wider_delim(plot_id, "-", names = c("site", "plot")) %>%
  mutate(site = as.numeric(site),
         plot = as.numeric(plot),
         site = as.character(site),
         plot = as.character(plot)) %>%
  separate_wider_delim(inv_date, "-", names = c("time", "month", "day")) %>%
  select(time, site, plot, R_1h, R_10h, R_100h) %>%
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

trial <- FWD_loads(ex_fuels, ex_trees, "metric", "4letter")

trial2 <- trial %>%
  mutate(K_1h = load_1h_Mg_ha,
         K_10h = load_10h_Mg_ha,
         K_100h = load_100h_Mg_ha) %>%
  select(time, site, plot, K_1h, K_10h, K_100h) %>%
  arrange(time, site, plot)

all <- full_join(trial2, fuels2, by = c("time", "site", "plot")) %>%
  select(time, site, plot, R_1h, K_1h, R_10h, K_10h, R_100h, K_100h)


test_that('Rfuels and UCB agree', {

expect_equal(all$R_1h, all$K_1h)
expect_equal(all$R_10h, all$K_10h)
expect_equal(all$R_100h, all$K_100h)

})


