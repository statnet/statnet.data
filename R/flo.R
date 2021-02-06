#' Florentine Wedding Data (Padgett)
#'
#' This is a data set of Padgett (1994), consisting of weddings among leading
#' Florentine families.
#'
#' @format This data is stored in symmetric `r paste(dim(flo), collapse='x')`
#'   adjacency matrix form.
#'
#' @template licenses
#'
#' @section Visualization:
#'
#' ```{r flo-figure, echo=FALSE}
#' set.seed(666)
#' network::plot.network(network::network(flo, directed=FALSE),
#'   displaylabels=TRUE, boxed.labels = TRUE, label.cex=0.75)
#' ```
#'
#' @references Wasserman, S. and Faust, K. (1994) *Social Network Analysis:
#'   Methods and Applications*, Cambridge: Cambridge University Press.
#'
#' @source Padgett, John F.  (1994). *Marriage and Elite Structure in
#'   Renaissance Florence, 1282-1500.* Paper delivered to the Social Science
#'   History Association.
#'
#' @seealso [network::network()]
#' @docType data
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
