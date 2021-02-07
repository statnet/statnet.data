#' Read Highland Tribes
#'
#' A network of political alliances and enmities among the 16 Gahuku-Gama
#' sub-tribes of Eastern Central Highlands of New Guinea, documented by Read
#' (1954). This network shows 3 clusters.
#'
#' @format
#'  An undirected [`network`][network::network] object with no loops, having the following
#'  vertex attributes:
#'
#'  - `vertex.names` -- Character attribute with names of tribes.
#'
#'  Edge attributes:
#'
#'  - `pos` -- Logical attribute indicating an alliance relationship.
#'  - `neg` -- Logical attribute indicating a hostile relationship ("rova")
#'  - `sign` -- Numeric attribute coding -1 for enmity, 0 for no relationship, and 1 for alliance.
#'  - `sign.012` -- Numeric attribute coding 0 for enmity, 1 for no relationship, and 2 for alliance.
#'
#'  Because of limitations of `network` objects, the object itself is a complete
#'  graph, and is thus meaningless if used directly or plotted.
#'
#' @template data
#'
#' @references
#' Taken from UCINET IV, which cites the following:
#'
#' Hage P. and Harary F. (1983). Structural models in anthropology. Cambridge:
#' Cambridge University Press. (See p 56-60).  Read K. (1954). Cultures of the
#' central highlands, New Guinea. Southwestern Journal of Anthropology, 10,
#' 1-43.
#'
#' @source
#' \url{http://vlado.fmf.uni-lj.si/pub/networks/data/UciNet/UciData.htm#gama},
#' with corrections from Read (1954).
#'
#' @name tribes
#' @docType data
#' @family directed networks
#' @keywords multivariate cluster graphs
#'
#' @examples
#' \dontrun{
#' library(latentnet)
#' # Only model positive ties:
#' tribes.fit < -ergmm(tribes ~ euclidean(d=2, G=3), response="pos")
#' # Edge color must be set manually, for green ties to represent alliance
#' # and for red ties to represent enmity.
#' plot(tribes.fit,
#'   edge.col = as.matrix(tribes, "pos", m="a") * 3 + as.matrix(tribes,"neg",m="a")*2,
#'   pie = TRUE)
#' # Model both positive and negative ties:
#' tribes.fit3 < -ergmm(tribes ~ euclidean(d=2, G=3), response="sign.012",
#'                    family="binomial.logit", fam.par=list(trials=2))
#' # Edge color must be set manually, for green ties to represent alliance
#' # and for red ties to represent enmity.
#' plot(tribes.fit3,
#'   edge.col = as.matrix(tribes,"pos",m="a")*3+as.matrix(tribes,"neg",m="a")*2,
#'   pie=TRUE)
#' }
NULL
