
library(magrittr)

dat <- pamngr::join_sheets(c("conssent", "conscurr","consexp")) %>%
  dplyr::slice_max(dates, n = 60) %>%
  magrittr::set_colnames(c("dates", "Headline", "Current Conditions", "Expectations")) %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")

p <- dat %>%
  pamngr::lineplot() %>%
  pamngr::pam_plot(plot_title = "Consumer Sentiment")

p %>% pamngr::all_output("all-indexes")

# df1 <- pamngr::get_data("conssent")
# df2 <- pamngr::get_data("conscurr")
# df3 <- pamngr::get_data("consexp")
# 
# df1 %>%
#   dplyr::left_join(df2, by = "dates") %>%
#   dplyr::left_join(df3, by = "dates") %>%
#   dplyr::slice_max(dates, n = 50) %>%
#   set_colnames(c("dates", "Headline", "Current Conditions", "Expectations")) %>%
#   reshape2::melt(id.vars = "dates") %>%
#   set_colnames(c("dates", "variable","value")) %>%
#   pamngr::lineplot() %>%
#   pamngr::pam_plot(
#     faceted = "col",
#     plot_title = "Consumer Sentiment"
#   ) %>%
#   pamngr::all_output("all-indexes")
# 
