#' Kapferer's tailor shop data
#'
#' This well-known social network dataset, collected by Bruce Kapferer in Zambia
#' from June 1965 to August 1965, involves interactions among workers in a
#' tailor shop as observed by Kapferer himself.
#'
#' @format Two `network` objects, `kapferer` and `kapferer2`. The `kapferer`
#'   dataset contains only the 39 individuals who were present at both
#'   data-collection time periods.  However, these data only reflect data
#'   collected during the first period. See Details. The individuals' names are
#'   included as a nodal covariate called `names`.
#'
#' @details
#' An interaction is defined by Kapferer as "continuous uninterrupted social
#' activity involving the participation of at least two persons"; only
#' transactions that were relatively frequent are recorded. All of the
#' interactions in this particular dataset are "sociational", as opposed to
#' "instrumental".  Kapferer explains the difference (p. 164) as follows:
#'
#' "I have classed as transactions which were sociational in content those
#' where the activity was markedly convivial such as general conversation, the
#' sharing of gossip and the enjoyment of a drink together.  Examples of
#' instrumental transactions are the lending or giving of money, assistance at
#' times of personal crisis and help at work."
#'
#' Kapferer also observed and recorded instrumental transactions, many of which
#' are unilateral (directed) rather than reciprocal (undirected), though those
#' transactions are not recorded here.  In addition, there was a second period
#' of data collection, from September 1965 to January 1966, but these data are
#' also not recorded here.  All data are given in Kapferer's 1972 book on pp.
#' 176-179.
#'
#' During the first time period, there were 43 individuals working in this
#' particular tailor shop; however, the better-known dataset includes only those
#' 39 individuals who were present during both time collection periods. (Missing
#' are the workers named Lenard, Peter, Lazarus, and Laurent.) Thus, we give two
#' separate network datasets here: `kapferer` is the well-known 39-individual
#' dataset, whereas `kapferer2` is the full 43-individual dataset.
#'
#' @template data
#'
#' @source
#' Kapferer, Bruce (1972), *Strategy and Transaction in an African Factory*,
#' Manchester University Press.
#'
#' @docType data
#' @name kapferer
#' @aliases kapferer kapferer2 tailor
#' @family undirected networks
#' @keywords datasets
"kapferer"
