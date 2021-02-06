#' Florentine Family Marriage and Business Ties Data
#'
#' @description This is a data set of marriage and business ties among
#'   Renaissance Florentine families. The data is originally from Padgett (1994)
#'   via \code{UCINET}.
#'
#' @description - `flo` -- adjacency matrix consisting of weddings among leading
#'   Florentine families.
#'
#' @format Data `flo` is a symmetric `r paste(dim(flo), collapse='x')`
#'   adjacency matrix.
#'
#' @template data
#'
#' @section Visualizations:
#'
#' ```{r flo-figure, echo=FALSE}
#' set.seed(666)
#' network::plot.network(network::network(flo, directed=FALSE),
#'   displaylabels=TRUE, boxed.labels = TRUE, label.cex=0.75)
#' ```
#'
#' @references
#' Breiger R. and Pattison P. (1986). Cumulated social roles: The duality
#' of persons and their algebras, *Social Networks*, 8, 215-256.
#'
#' Wasserman, S. and Faust, K. (1994) *Social Network Analysis: Methods and
#' Applications*, Cambridge: Cambridge University Press.
#'
#' @source Padgett, John F.  (1994). *Marriage and Elite Structure in
#'   Renaissance Florence, 1282-1500.* Paper delivered to the Social Science
#'   History Association.
#'
#' @seealso [network::network()]
#' @docType data
#' @name florentine
#' @keywords datasets
#' @family undirected networks
#'
#' @examples
#' if(requireNamespace("network", quietly=TRUE)) {
#'   nflo <- network::network(flo,directed=FALSE)    # Convert to network object form
#'   all(nflo[,]==flo)                    # Trust, but verify
#'   # A fancy display:
#'   plot(nflo, displaylabels=TRUE, boxed.labels=FALSE, label.cex=0.75)
#' }
"flo"




#' @rdname florentine
#' @aliases florentine flobusiness flomarriage
#'
#' @description - `flomarriage` -- The `flo` data as a
#'   [`network`][network::network] object
#' @description - `flobusiness` -- The business ties among Renaissance
#'   Florentine families as a [`network`][network::network] object.
#'
#' @details Breiger \& Pattison (1986), in their discussion of local role
#'   analysis, use a subset of data on the social relations among Renaissance
#'   Florentine families (person aggregates) collected by John Padgett from
#'   historical documents. The two relations are business ties
#'   (\code{flobusiness} - specifically, recorded financial ties such as loans,
#'   credits and joint partnerships) and marriage alliances
#'   (\code{flomarriage}).
#'
#' As Breiger \& Pattison point out, the original data are symmetrically coded.
#' This is acceptable perhaps for marital ties, but is unfortunate for the
#' financial ties (which are almost certainly directed). To remedy this, the
#' financial ties can be recoded as directed relations using some external
#' measure of power - for instance, a measure of wealth. Both graphs provide
#' vertex information on (1) \code{wealth} each family's net wealth in 1427 (in
#' thousands of lira); (2) \code{priorates} the number of priorates (seats on
#' the civic council) held between 1282- 1344; and (3) \code{totalties} the
#' total number of business or marriage ties in the total dataset of 116
#' families (see Breiger \& Pattison (1986), p 239).
#'
#' Substantively, the data include families who were locked in a struggle for
#' political control of the city of Florence around 1430. Two factions were
#' dominant in this struggle: one revolved around the infamous Medicis (9), the
#' other around the powerful Strozzis (15).
#'
#'
#'
#' @seealso flo, network, plot.network, ergm
#'
#' @keywords datasets
"flobusiness"

#' @rdname florentine
#' @aliases flomarriage
#' @usage flomarriage
"flomarriage"
