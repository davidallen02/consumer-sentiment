devtools::install_github("davidallen02/pamr", force = TRUE)

library(magrittr)

pamr::get_data("conssent") %>%
  dplyr::slice_max(dates, n = 120) %>%
  reshape2::melt(id.vars = "Dates") %>%
  pamr::lineplot() %>%
  pamr::pam.plot(
    plot.title = "Consumer Sentiment",
    show.legend = FALSE)
  
