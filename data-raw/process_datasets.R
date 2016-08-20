periodic_table <- readr::read_csv(file = "data-raw/periodic_table_2016-08.csv")
devtools::use_data(periodic_table, overwrite = TRUE)
