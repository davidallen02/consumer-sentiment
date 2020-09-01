
library(magrittr)

df1 <- pamngr::get_data("conssent")
df2 <- pamngr::get_data("conscurr")
df3 <- pamngr::get_data("consexp")

df1 %>%
  dplyr::left_join(df2, by = "dates") %>%
  dplyr::left_join(df3, by = "dates") %>%
  dplyr::slice_max(dates, n = 50) %>%
  set_colnames(c("dates", "Headline", "Current Conditions", "Expectations")) %>%
  reshape2::melt(id.vars = "dates") %>%
  set_colnames(c("dates", "variable","value")) %>%
  pamngr::lineplot() %>%
  pamngr::pam.plot(
    faceted = "col",
    plot.title = "Consumer Sentiment"
  ) %>%
  pamngr::ppt_output("all_indexes.png")

