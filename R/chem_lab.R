#' Creates an R Markdown PDF document for the Reed College Chem 101/102 labs
#'
#' This is a function called in output in the YAML of the driver Rmd file to
#' specify using a tweaked version of the default LaTeX pandoc template.
#'
#' @export
#' @param fig_height A positive numeric giving the default height of images
#' @param fig_width A positive numeric giving the default width of images
#' @return A modified \code{pdf_document} based on slightly modified knitr
#' LaTeX default file
#' @examples
#' \dontrun{
#'  output:
#'    chemistr::chem_lab
#' }
chem_lab <- function(fig_height = 2.5, fig_width = 5){
  template <- find_resource("template.tex")

    base <- rmarkdown::pdf_document(template = template,
                                    fig_caption = TRUE,
                                    fig_height = fig_height,
                                    fig_width = fig_width,
                                    keep_tex = TRUE)
    base
}
