devtools::install_github("davidallen02/pamngr", force = TRUE) 

library(magrittr)

df1 <- pamngr::get_data("conssdem")
df2 <- pamngr::get_data("conssrep")
df3 <- pamngr::get_data("conssind")

df1 %>%
  dplyr::left_join(df2, by = "Dates") %>%
  dplyr::left_join(df3, by = "Dates") %>%
  set_colnames(c("Dates", "Democrats", "Republicans", "Independents")) %>%
  reshape2::melt(id.vars = "Dates") %>%
  set_colnames(c("dates", "variable","value")) %>%
  pamngr::lineplot() %>%
  pamngr::pam.plot(
    plot.title = "Consumer Sentiment",
    plot.subtitle = "Sentiment by Political Affiliation"
  ) %>%
  pamngr::ppt_output("partisan_sentiment.png")
