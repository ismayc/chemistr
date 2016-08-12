#' Creates a clustered bar graph
#'
#'
#' @export
#' @param data A data frame containing variables to be plotted
#' @param xvar The name of the x-variable
#' @param yvar The name of the y-variable
#' @param fillvar The name of the variable to color the bars by
#' @param xlab A string containing the x-axis label
#' @param ylab A string containing the y-axis label
#' @param n The number of unique entries in \code{fillvar}
#' @param colors A character vector containing the names of the
#' R colors to color the plot with
#' @return A plot

chem_clustered.bar <- function(data, xvar, yvar,
                               fillvar,
                               xlab = "Insert X-axis label",
                               ylab = "Insert Y-axis label",
                               n = 4,
                               colors = hcl(h = seq(15, 375, length = n + 1),
                                            l = 65, c = 100)[1:n]
  ){
  data_gd <- NULL
  data_gd$xvar <- tryCatch(
    expr = lazyeval::lazy_eval(substitute(xvar), data = data),
    error = function(e) eval(envir = data, expr = parse(text = xvar))
  )
  data_gd$yvar <- tryCatch(
    expr = lazyeval::lazy_eval(substitute(yvar), data = data),
    error = function(e) eval(envir = data, expr = parse(text = yvar))
  )
  data_gd$fillvar <- tryCatch(
    expr = lazyeval::lazy_eval(substitute(fillvar), data = data),
    error = function(e) eval(envir = data, expr = parse(text = fillvar))
  )
  ggplot(data = as.data.frame(data_gd), mapping = aes(x = xvar, y = yvar)) +
    geom_bar(aes(fill = fillvar), color = "black", stat = "identity", position = "dodge") +
    scale_fill_manual(values = colors) +
    labs(x = xlab, y = ylab, fill = "") +
    theme(panel.border = element_rect(linetype = "solid", colour = "black", fill = NA),
      panel.background = element_rect(fill = "white"))
}
