
library(magrittr)

dat <- pamngr::join_sheets(c("conssent", "conscurr","consexp")) %>%
  dplyr::slice_max(dates, n = 60) %>%
  magrittr::set_colnames(c("dates", "Headline", "Current Conditions", "Expectations")) %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")

p <- dat %>%
  pamngr::lineplot() %>%
  pamngr::pam_plot(plot_title = "Consumer Sentiment")

p %>% pamngr::all_output("all-indexes")



