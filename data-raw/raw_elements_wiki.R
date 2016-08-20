library(rvest)
library(dplyr)
library(readr)

periodic_table <- read_html("https://en.wikipedia.org/wiki/List_of_chemical_elements") %>%
  html_nodes("table") %>%
  .[[1]] %>%
  html_table(fill = TRUE) %>%
  slice(-1)

write_csv(periodic_table, "periodic_table.csv")