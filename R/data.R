#' Data on the elements of the periodic table
#'
#' Different characteristics about the 118 chemical elements as of August 2016.
#'
#' @docType data
#' @name periodic_table
#' @usage data(periodic_table)
#' @format
#'   A data frame with 118 observations (elements) on the following variables.
#'   \itemize{
#'     \item{\code{atomic_number}} {an integer giving the number of protons found in the
#'     nucleus of an atom for each element}
#'     \item{\code{symbol}} {A character string of length 1, 2, or 3 characters giving the symbol
#'     of the chemical element}
#'     \item{\code{name}} {A character string giving the name of the element}
#'     \item{\code{name_origin}} {Multiple character strings giving a brief summary of the origin
#'     of the name of the element}
#'     \item{\code{group}} {An integer from 1 to 18 giving the family for a column of elements}
#'     \item{\code{period}} {An integer giving the horizontal row in the periodic table}
#'     \item{\code{block}} {A character (either "s", "f", "d", or "p") corresponding to the
#'     characteristic orbital}
#'     \item{\code{state_at_stp}} {A character string (either "Gas", "Liquid", or "Solid") giving
#'     the element's state at Standard Temperature and Pressure}
#'     \item{\code{occurrence}} {A character string denoting when current forms of the element
#'     in nature came about (either "Primordial", "Synthetic", or "Transient")}
#'     \item{\code{description}} {A character string denoting which subcategory of metal-nonmetal
#'     trend the element corresponds to)}
#'     \item{\code{atomic_weight}} {A numerical value giving the ratio of the average mass
#'     of atoms of an element (from a single given sample or source) to 1⁄12 of the mass
#'     of an atom of carbon-12.  Measured in unified atomic mass units.)}
#'     \item{\code{aw_uncertainty}} {An integer value giving a measure of uncertainity (if one given)
#'     for the atomic weight of an element}
#'     \item{\code{any_stable_nuclides}} {If \code{"No"}, the element does not have any
#'     stable nuclides, and the reported \code{atomic_weight} indicates the mass number of
#'     the longest-lived isotope of the element.  If \code{"Yes"}, the element does have stable
#'     nuclides and the \code{atomic_weight} reflects this.}
#'     \item{\code{density}} {A numeric value giving the mass per unit volume of the element.
#'     Measured in grams per cubic centimeter.}
#'     \item{\code{density_predicted}} {If \code{TRUE}, the element likely has a short half-life
#'     and so the value of \code{density} is not precisely measured, but predicted instead.}
#'     \item{\code{melting_point}} {A numeric value for solid elements giving the Kelvin
#'     temperature at which it changes state from solid to liquid at atmospheric pressure.}
#'     \item{\code{mp_predicted}} {If \code{TRUE}, the element likely has a short half-life
#'     and so the value of \code{melting_point} is not precisely measured, but predicted instead.}
#'     \item{\code{boiling_point}} {A numeric value giving the kelvin temperature at which the vapor
#'     pressure of the liquid equals the pressure surrounding the liquid and the liquid changes
#'     into a vapor}
#'     \item{\code{bp_predicted}} {If \code{TRUE}, the element likely has a short half-life
#'     and so the value of \code{boiling_point} is not precisely measured, but predicted instead.}
#'     \item{\code{heat_capacity}} {A numeric value giving the ratio of the head added
#'     (or removed from) an element to the resulting temperature change. Measured in joule
#'     per gram kelvin.}
#'     \item{\code{electronegativity}} {A numeric value describing the tendency of an atom
#'     or a functional group to attract electrons (or electron density) towards itself.}
#'     \item{\code{abundance}} {A numeric value giving the abundance of the element in Earth's crust.
#'     Measured in milligrams per kilogram.}
#'   }
#'
#' @details
#' This data was collected via web scraping and cleaning the wiki page and also combining
#' columns from the \code{elements} data frame in the \code{rfordummies} package.  Note that
#' there are many missing values in this data set usually due to measurements not being available
#' for that element.
#'
#' @source
#' https://en.wikipedia.org/wiki/List_of_chemical_elements
#'
#'
#' @examples
#' data(periodic_table, package = "chemistr")
#'
"periodic_table"
#> [1] "periodic_table"

