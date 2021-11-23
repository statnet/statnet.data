#' Newcomb's Fraternity Networks
#'
#' These 14 networks record weekly sociometric preference rankings from 17 men
#' attending the University of Michigan in the fall of 1956; Data were
#' collected longitudinally over 15 weeks, although data from week 9 are
#' missing.
#'
#' @format
#' List of 15 directed [`network`][network::network] objects.
#'
#' @details
#' The men were recruited to live in off-campus (fraternity) housing, rented
#' for them as part of the Michigan Group Study Project supervised by Theodore
#' Newcomb from 1953 to 1956. All were incoming transfer students with no prior
#' acquaintance of one another.
#'
#' The data set, derived from one in the unreleased \code{netdata} package,
#' contains a network list \code{newcomb} with 14 networks. Each network is
#' complete and contains two edge attributes:
#' \describe{
#' \item{"rank"}{the preference of the \eqn{i}th man for the \eqn{j}th man from
#' \code{1} through \code{16}, with \code{1} being the highest preference.}
#' \item{"descrank"}{the same, but \code{1} indicates lowest preference.}
#' }
#'
#' @template data
#'
#' @source Vladimir Batagelj and Andrej Mrvar (2006) *Pajek datasets*.
#' \url{http://vlado.fmf.uni-lj.si/pub/networks/data/},
#' \url{http://vlado.fmf.uni-lj.si/pub/networks/data/ucinet/ucidata.htm#newfrat}
#'
#'
#' @references
#' Newcomb T. (1961). *The acquaintance process*. New York: Holt, Reinhard and
#' Winston.
#'
#' Nordlie P. (1958). *A longitudinal study of interpersonal attraction in a
#' natural group setting*. Unpublished doctoral dissertation, University of
#' Michigan.
#'
#' White H., Boorman S. and Breiger R. (1977). Social structure from multiple
#' networks, I. Blockmodels of roles and positions. *American Journal of
#' Sociology*, 81, 730-780.
#'
#' @name newcomb
#' @docType data
#' @keywords datasets
#' @family directed networks
#' @examples
#' \dontrun{
#' library(ergm)
#' # Note: This takes a long time.
#' # Fit a model for the transition between initial (time 0) ranking and
#' # ranking after one week (time 1). Note that MCMC interval has been
#' # decreased to save time.
#' newcomb.1.2.fit <- ergm(
#'   newcomb[[2]] ~ rank.inconsistency(newcomb[[1]], "descrank") +
#'     rank.deference + rank.nonconformity("all") +
#'     rank.nonconformity("localAND"),
#'   response = "descrank",
#'   reference = ~ CompleteOrder,
#'   control = control.ergm(
#'     MCMLE.trustregion = 10000,
#'     MCMC.interval=10
#'    )
#' )
#'
#' # Check MCMC diagnostics (barely adequate).
#' mcmc.diagnostics(newcomb.1.2.fit)
#' summary(newcomb.1.2.fit)
#' }
#'
"newcomb"
