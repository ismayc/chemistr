#' Creates a scatterplot with a common horizontal axis and two different
#' variables plotted on the vertical axis with regression lines
#'
#' @export
#' @param data A data frame containing variables to be plotted
#' @param xvar The name of the x-variable
#' @param yvar1 The name of one of the y-variables
#' @param yvar2 The name of the other y-variable
#' @param xlab A string containing the x-axis label
#' @param ylab A string containing the y-axis label
#' @param size A numeric specifying the size of the points
#' @param colors A character vector specifying colors of two y-variables and each line
#' @param intercept1 Set to NULL by default, but can be changed to 0 to force regression
#' line to go through origin for yvar1
#' @param intercept2 Set to NULL by default, but can be changed to 0 to force regression
#' line to go through origin for yvar2
#' @return A plot

chem_dual.scatter <- function(data, xvar, yvar1, yvar2,
                              xlab = "Insert X-axis label",
                              ylab = "Insert Y-axis label",
                              intercept1 = NULL,
                              intercept2 = NULL,
                              size = 3,
                              colors = c("red", "blue")){
  data_gd <- NULL
  data_gd$xvar <- tryCatch(
    expr = lazyeval::lazy_eval(substitute(xvar), data = data),
    error = function(e) eval(envir = data, expr = parse(text = xvar))
  )
  data_gd$yvar1 <- tryCatch(
    expr = lazyeval::lazy_eval(substitute(yvar1), data = data),
    error = function(e) eval(envir = data, expr = parse(text = yvar1))
  )
  data_gd$yvar2 <- tryCatch(
    expr = lazyeval::lazy_eval(substitute(yvar2), data = data),
    error = function(e) eval(envir = data, expr = parse(text = yvar2))
  )
  ggplot(data = as.data.frame(data_gd)) +
    geom_point(aes(x = xvar, y = yvar1), color = colors[1], shape = 18, size = size) +
    geom_smooth(aes(x = xvar, y = yvar1), method = "lm", se = FALSE, color = colors[1], size = 0.3,
                formula = if(!is.null(intercept1)){y ~ I(x + intercept1)} else{y ~ x}) +
    geom_point(aes(x = xvar, y = yvar2), color = colors[2], shape = 18, size = size) +
    geom_smooth(aes(x = xvar, y = yvar2), method = "lm", se = FALSE, color = colors[2], size = 0.3,
                formula = if(!is.null(intercept2)){y ~ I(x + intercept2)} else{y ~ x}) +
    labs(x = xlab, y = ylab) +
    theme(panel.border = element_rect(linetype = "solid", colour = "black", fill = NA),
      panel.background = element_rect(fill = "white"))
}


