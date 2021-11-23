#' Karate club social network of Zachary (1977)
#'
#' Zachary (1977) reported observations of social relations in a university
#' karate club
#'
#' @format `r data_format(zach)` The vertex attributes are:
#'
#' - `club` -- the club in which the actor ended up
#' - `faction` -- faction alignment of the actor as recorded by Zachary
#' - `faction.id` -- faction alignment coded numerically, as -2 (strongly Mr.
#' Hi's), -1 (weakly Mr. Hi's), 0 (neutral), +1 (weakly John's), and +2
#' (strongly John's)
#'  - `role` -- role of the actor in the network (Instructor, Member, or
#'  President)
#'
#' The edge attributes are:
#'
#' - `contexts` -- the number of contexts of interaction for that pair of
#' actors.
#'
#'
#'
#' @details
#' Zachary (1977) reported observations of social relations in a university
#' karate club, with membership that varied between 50 and 100, of whom 34
#' individuals: 32 ordinary club members and officers, the club president ("John
#' A."), and the part-time instructor ("Mr. Hi"); consistently interacted
#' outside of the club. Over the course of the study, the club divided into two
#' factions, and, ultimately, split into two clubs, one led by Hi and the other
#' by John and the original club's officers. The split was driven by a
#' disagreement over whether Hi could unilaterally change the level of
#' compensation for his services.
#'
#' Zachary identifies the faction with which each of the 34 actors was aligned
#' and how strongly and reports, for each pair of actors, the count of social
#' contexts in which they interacted. The 8 contexts recorded were
#'
#' - academic classes at the university
#' - Hi's private karate studio in his night classes
#' - Hi's private karate studio where he taught on weekends
#' - student-teaching at Hi's studio
#' - the university rathskeller (bar) located near the karate club
#' - a bar located near the university campus
#' - open karate tournaments in the area; and
#' - intercollegiate karate tournaments.
#'
#' The highest number of contexts of interaction for a pair of individuals that
#' was observed was 7.
#'
#' @template data
#'
#' @source Sociomatrix in machine-readable format was retrieved from
#' \url{http://vlado.fmf.uni-lj.si/pub/networks/data/ucinet/ucidata.htm} originally
#' coming from Zachary (1977)
#'
#' @references
#' Zachary, WW (1977). An Information Flow Model for Conflict and
#' Fission in Small Groups. \emph{Journal of Anthropological Research}, 33(4),
#' 452-473.
#'
#'
#' @name zach
#' @docType data
#' @keywords datasets
#' @family undirected networks
#' @examples
#' if(requireNamespace("network", quietly=TRUE)){
#' oldpal <- palette()
#' palette(gray((1:8)/8))
#' plot(zach, vertex.col="role", displaylabels=TRUE, edge.col="contexts")
#' palette(oldpal)
#' }
#'
#' \dontrun{
#' # Fit a binomial-reference ERGM.
#' zach.fit1 <- ergm(zach~nonzero+sum+nodefactor("role",base=2)+absdiffcat("faction.id"),
#'                   response="contexts", reference=~Binomial(8),
#'                   control=control.ergm(MCMLE.trustregion=1000))
#' mcmc.diagnostics(zach.fit1)
#' summary(zach.fit1)
#'
#' # This is much slower.
#' zach.fit2 <- ergm(zach~nonzero+sum+nodefactor("role",base=2)+transitiveties,
#'                   response="contexts", reference=~Binomial(8),
#'                   control=control.ergm(MCMLE.trustregion=1000),
#'                   eval.loglik=FALSE)
#' mcmc.diagnostics(zach.fit2)
#' summary(zach.fit2)
#' }
#'
"zach"
