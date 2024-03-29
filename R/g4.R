#' Goodreau's four node network as a "network" object
#'
#' This is an example thought of by Steve Goodreau.
#'
#' @format `r data_format(g4)`
#'
#' @details
#' It is interesting because the maximum likelihood estimator of the model with
#' out degree 3 in it exists, but the maximum psuedolikelihood estimator does
#' not.
#'
#' @template data
#'
#' @source Steve Goodreau
#'
#' @docType data
#' @name g4
#' @keywords datasets
#' @family directed networks
#' @examples
#' \dontrun{
#' library(ergm)
#' summary(ergm(g4 ~ odegree(3), estimate="MPLE"))
#' summary(ergm(g4 ~ odegree(3), control=control.ergm(init=0)))
#' }
#'
"g4"
