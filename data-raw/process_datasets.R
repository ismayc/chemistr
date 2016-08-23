trim.trailing <- function(x) sub("\\s+$", "", x)

periodic_table <- readr::read_csv(file = "data-raw/periodic_table_2016-08.csv")
periodic_table$block <- trim.trailing(periodic_table$block)
readr::write_csv(periodic_table, "periodic-table-data.csv")
devtools::use_data(periodic_table, overwrite = TRUE)
