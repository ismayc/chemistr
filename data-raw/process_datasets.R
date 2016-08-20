periodic_table <- readr::read_csv(file = "data-raw/periodic_table_2016-08.csv")
periodic_table<- dplyr::mutate(periodic_table,
                               block = factor(block, levels = c("s", "p", "d", "f")))
devtools::use_data(periodic_table, overwrite = TRUE)
