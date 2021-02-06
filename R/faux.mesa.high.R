#' Goodreau's Faux Mesa High School as a network object
#'
#' This data set (formerly called "fauxhigh") represents a simulation of
#' an in-school friendship network.  The network is named `faux.mesa.high`
#' because the school community on which it is based is in the rural western
#' US, with a student body that is largely Hispanic and Native American.
#'
#' @docType data
#' @format `faux.mesa.high` is a [`network`][network::network] object
#' with 205 vertices (students, in this case) and 203 undirected edges (mutual
#' friendships).  To obtain additional summary information about it, type
#' `summary(faux.mesa.high)`.
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
#' ```{r faux.mesa.high-figure, echo=FALSE}
#' set.seed(666)
#' network::plot.network(faux.mesa.high)
#' title(main="faux.mesa.high")
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
#' Hunter D.R., Goodreau S.M. and Handcock M.S. (2008). Goodness of Fit
#' of Social Network Models, *Journal of the American Statistical
#' Association*.
#'
#' Resnick M.D., Bearman, P.S., Blum R.W. et al. (1997). Protecting
#' adolescents from harm. Findings from the National Longitudinal Study on
#' Adolescent Health, *Journal of the American Medical Association*, 278:
#' 823-32.
#'
#' @source The data set is based upon a model fit to data from one school
#' community from the AddHealth Study, Wave I (Resnick et al., 1997). It was
#' constructed as follows:
#'
#' A vector representing the sex of each student in the school was randomly
#' re-ordered.  The same was done with the students' response to questions on
#' race and grade.  These three attribute vectors were permuted independently.
#' Missing values for each were randomly assigned with weights determined by
#' the size of the attribute classes in the school.
#'
#' The following [ergm::ergm()] formula was used to fit a model to the
#' original data:
#'
#' ```{r, eval=FALSE}
#' ~ edges + nodefactor("Grade") + nodefactor("Race") + nodefactor("Sex") +
#'   nodematch("Grade",diff=TRUE) + nodematch("Race",diff=TRUE) +
#'   nodematch("Sex",diff=FALSE) + gwdegree(1.0,fixed=TRUE) +
#'   gwesp(1.0,fixed=TRUE) + gwdsp(1.0,fixed=TRUE)
#' ```
#'
#' The resulting model fit was then applied to a network with actors possessing
#' the permuted attributes and with the same number of edges as in the original
#' data.
#'
#' The processes for handling missing data and defining the race attribute are
#' described in Hunter, Goodreau \& Handcock (2008).
#'
#' @family undirected networks
#' @family high school networks
#' @docType data
#' @aliases fauxhigh
#' @keywords datasets
"faux.mesa.high"