#' Goodreau's Faux Magnolia High School as a network object
#'
#' This data set represents a simulation of an in-school friendship network.
#' The network is named `faux.magnolia.high` because the school commnunities on
#' which it is based are large and located in the southern US.
#'
#' @format `faux.magnolia.high` is a [`network`][network::network] object
#' with 1461 vertices (students, in this case) and 974 undirected edges (mutual
#' friendships). To obtain additional summary information about it, type
#' `summary(faux.magnolia.high)`.
#'
#' The vertex attributes are:
#'
#' - `Grade` -- attribute has values 7 through 12, indicating each student's
#' grade in school
#' - `Sex`
#' - `Race` -- attribute is based on the answers to two questions, one on
#' Hispanic identity and one on race, and takes six possible values: White
#' (non-Hisp.), Black (non-Hisp.), Hispanic, Asian (non-Hisp.), Native American,
#' and Other (non-Hisp.)
#'
#' @template data
#'
#' @section Visualizations:
#'
#' ```{r faux.magnolia.high-figure, echo=FALSE, fig.width=10, fig.height=4}
#' set.seed(666)
#' network::plot.network(faux.magnolia.high)
#' title(main="faux.magnolia.high")
#' ```
#'
#' @section Licenses and Citation: If the source of the data set does not
#' specified otherwise, this data set is protected by the Creative Commons
#' License \url{https://creativecommons.org/licenses/by-nc-nd/2.5/}.
#'
#' When publishing results obtained using this data set, the original authors
#' (Resnick et al, 1997) should be cited. In addition this package should be
#' cited as:
#'
#' Mark S. Handcock, David R. Hunter, Carter T. Butts, Steven M. Goodreau, and
#' Martina Morris. 2003 *statnet: Software tools for the Statistical
#' Modeling of Network Data* \url{https://statnet.org}.
#'
#' @references
#' Resnick M.D., Bearman, P.S., Blum R.W. et al. (1997). Protecting
#' adolescents from harm. Findings from the National Longitudinal Study on
#' Adolescent Health, *Journal of the American Medical Association*, 278:
#' 823-32.
#'
#' @source The data set is based upon a model fit to data from two school
#' communities from the AddHealth Study, Wave I (Resnick et al., 1997). It was
#' constructed as follows:
#'
#' The two schools in question (a junior and senior high school in the same
#' community) were combined into a single network dataset.  Students who did
#' not take the AddHealth survey or who were not listed on the schools' student
#' rosters were eliminated, then an undirected link was established between any
#' two individuals who both named each other as a friend.  All missing race,
#' grade, and sex values were replaced by a random draw with weights determined
#' by the size of the attribute classes in the school.
#'
#' The following [ergm::ergm()] model was fit to the original data:
#'
#' ```{r, eval=FALSE}
#' magnolia.fit <- ergm(
#'   magnolia ~ edges + nodematch("Grade",diff=T) + nodematch("Race",diff=T) +
#'     nodematch("Sex",diff=F) + absdiff("Grade") + gwesp(0.25,fixed=T),
#'   burnin=10000, interval=1000, MCMCsamplesize=2500, maxit=25,
#'   control=control.ergm(steplength=0.25)
#' )
#' ```
#'
#' Then the `faux.magnolia.high` dataset was created by simulating a single
#' network from the above model fit:
#'
#' ```{r, eval=FALSE}
#' faux.magnolia.high <- simulate (magnolia.fit, nsim=1, burnin=100000000,
#'   constraint = "edges") }
#' ```
#'
#' @family undirected networks
#' @family high school networks
#' @keywords datasets
#' @docType data
"faux.magnolia.high"