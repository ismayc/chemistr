#' Creates a nice table for data frames
#'
#'
#' @export
#' @param data A data frame containing variables to be included in the table
#' @param caption A character string specifying the caption of the table
#' @return A nicely formatted table to be included in the Word document
#' @examples
#' \dontrun{
#'  chem_table(head(iris), caption = "First six rows of iris data")
#' }

chem_table <- function(data, caption){
  names(data) <- pandoc.strong.return(names(data))
  pandoc.table(data, caption = caption, style = "multiline",
               split.tables = Inf)
  cat("\\newline")
}

# PDF VERSION
# chem_table <- function(data, title, align = NULL,
#                        digits = NULL, display = NULL){
#   # Display a table in the appropriate format with caption on the top
#   print(xtable(data,
#                # set the caption to be the specified title above
#                caption = title,
#                # right align all columns and create vertical lines, need one
#                # more |r| than total columns.  Use l or c for left or center aligned
#                align = align,#"|r|r|r|",
#                # the default number of digits specified for real numbers
#                digits = digits,#6,
#                # the row numbers are the first column here,
#                # "d" corresponds to integers, "fg" to floating point
#                display = display #c("d", "fg", "fg")
#                # end the parameters to xtable
#   ),
#   # Caption on top
#   caption.placement = 'top',
#   # Horizontal lines on top through bottom of table
#   hline.after = seq(-1, nrow(data)),
#   # The row names are just numbers here & are ignored
#   include.rownames = FALSE,
#   # There is an annoying extra comment that prints if this is not specified as FALSE
#   comment = FALSE,
#   # To get the caption to be about the width of the table
#   caption.width = '2.7in',
#   # Bold the variable names using the function above
#   sanitize.colnames.function = bold_all_col_names
#   # End the entire call to print
#   )
# }


