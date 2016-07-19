#' Creates a scatterplot with regression line
#'
#'
#' @export
#' @param data A data frame containing variables to be plotted
#' @param xvar The name of the x-variable
#' @param yvar The name of the y-variable
#' @param xlab A string containing the x-axis label
#' @param ylab A string containing the y-axis label
#' @return A plot
#' @examples
#' \dontrun{
#'  chem_scatter(iris, Sepal.Width, Sepal.Length)
#' }

chem_scatter <- function(data, xvar, yvar,
  xlab = "Insert X-axis label",
  ylab = "Insert Y-axis label",
  gg = TRUE, intercept = FALSE){
  data_gd <- NULL
  data_gd$xvar <- tryCatch(
    expr = lazyeval::lazy_eval(substitute(xvar), data = data),
    error = function(e) eval(envir = data, expr = parse(text = xvar))
  )
  data_gd$yvar <- tryCatch(
    expr = lazyeval::lazy_eval(substitute(yvar), data = data),
    error = function(e) eval(envir = data, expr = parse(text = yvar))
  )
  if(gg == TRUE){
 #   if(intercept == FALSE){
      ggplot(data = as.data.frame(data_gd), mapping = aes(x = xvar, y = yvar)) +
        geom_point() +
        theme_bw() +
        geom_smooth(method = "lm", se = FALSE, color = "black", size = 0.3,
          formula = if(intercept == FALSE){y ~ x + 0} else{y ~ x}) +
        labs(x = xlab, y = ylab)
    #}
  #   else{
  #     ggplot(data = as.data.frame(data_gd), mapping = aes(x = xvar, y = yvar)) +
  #       geom_point() +
  #       theme_bw() +
  #       geom_smooth(method = "lm", se = FALSE, color = "black", size = 0.3,
  #         formula = y ~ x) +
  #       labs(x = xlab, y = ylab)}
   }
  else{
      plot(yvar ~ xvar + 0, data = data,
        xlab = "Insert X-axis label",
        ylab = "Insert Y-axis label",
        pch = 20)
      if(intercept == FALSE)
        abline(lm(yvar ~ xvar + 0))
      else
        abline(lm(yvar ~ xvar))

   }
}
