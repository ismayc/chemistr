#' Creates a scatterplot with regression line
#'
#'
#' @export
#' @param data A data frame containing variables to be plotted
#' @param xvar The name of the x-variable
#' @param yvar The name of the y-variable
#' @param xlab A string containing the x-axis label
#' @param ylab A string containing the y-axis label
#' @param intercept Set to NULL by default, but can be changed to a numeric value
#' to force the regression to through a specified y-value.  For example,
#' \code{intercept = 0} forces the regression line to go through origin
#' @param reg_line Set to TRUE by default to show the regression line.  If set to
#' FALSE no regression line will appear showing only the points
#' @return A plot
#' @examples
#' \dontrun{
#'  chem_scatter(iris, Sepal.Width, Sepal.Length)
#' }

chem_scatter <- function(data, xvar, yvar,
  xlab = "Insert X-axis label",
  ylab = "Insert Y-axis label",
  intercept = NULL,
  reg_line = TRUE){
  data_gd <- NULL
  data_gd$xvar <- tryCatch(
    expr = lazyeval::lazy_eval(substitute(xvar), data = data),
    error = function(e) eval(envir = data, expr = parse(text = xvar))
  )
  data_gd$yvar <- tryCatch(
    expr = lazyeval::lazy_eval(substitute(yvar), data = data),
    error = function(e) eval(envir = data, expr = parse(text = yvar))
  )
  if(is.null(intercept) & reg_line){
  ggplot(data = as.data.frame(data_gd), mapping = aes(x = xvar, y = yvar)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE, color = "black", size = 0.3,
      formula = y ~ x) +
    labs(x = xlab, y = ylab) +
    theme(panel.border = element_rect(linetype = "solid", colour = "black",
      fill = NA),
      panel.background = element_rect(fill = "white"))
  }
  else if(!is.null(intercept) & reg_line){
    ggplot(data = as.data.frame(data_gd), mapping = aes(x = xvar, y = yvar)) +
      geom_point() +
    geom_smooth(method = "lm", se = FALSE, color = "black", size = 0.3,
      formula = y ~ I(x - intercept) + 0) +
      labs(x = xlab, y = ylab) +
      theme(panel.border = element_rect(linetype = "solid", colour = "black",
        fill = NA),
        panel.background = element_rect(fill = "white"))
  }
  else {
    ggplot(data = as.data.frame(data_gd), mapping = aes(x = xvar, y = yvar)) +
      geom_point() +
      labs(x = xlab, y = ylab) +
      theme(panel.border = element_rect(linetype = "solid", colour = "black",
        fill = NA),
        panel.background = element_rect(fill = "white"))
  }

}
