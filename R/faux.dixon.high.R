#' Faux Dixon High School as a network object
#'
#' This data set represents a simulation of a directed in-school friendship
#' network. The network is named `faux.dixon.high`.
#'
#' @format `faux.dixon.high` is a [`network`][network::network] object
#' with 248 vertices (students, in this case) and 1197 directed edges
#' (friendship nominations). To obtain additional summary information about it,
#' type `summary(faux.dixon.high)`.
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
#' @source The data set is simulation based upon an ergm model fit to data from
#' one school community from the AddHealth Study, Wave I (Resnick et al.,
#' 1997). It was constructed as follows:
#'
#' The school in question (a single school with 7th through 12th grades) was
#' selected from the Add Health "structure files."  Documentation on these
#' files can be found here:
#' \url{https://addhealth.cpc.unc.edu/documentation/codebooks/}.
#'
#' The stucture file contains directed out-ties representing each instance of a
#' student who named another student as a friend.  Students could nominate up
#' to 5 male and 5 female friends. Note that registered students who did not
#' take the AddHealth survey or who were not listed by name on the schools'
#' student roster are not included in the stucture files.  In addition, we
#' removed any students with missing values for race, grade or sex.
#'
#' The following [ergm::ergm()] model was fit to the original data:
#'
#' ```{r, eval=FALSE}
#' dixon.fit <- ergm(
#'   original.net ~ edges + mutual + absdiff("grade") +
#'     nodefactor("race", base=5) + nodefactor("grade", base=3) +
#'     nodefactor("sex") + nodematch("race", diff = TRUE) +
#'     nodematch("grade", diff = TRUE) + nodematch("sex", diff = FALSE) +
#'     idegree(0:1) + odegree(0:1) + gwesp(0.1,fixed=T),
#'   constraints = ~bd(maxout=10),
#'   control = control.ergm(
#'     MCMLE.steplength = .25,
#'     MCMC.burnin = 100000,
#'     MCMC.interval = 10000,
#'     MCMC.samplesize = 2500,
#'     MCMLE.maxit = 100
#'   ),
#'   verbose=T
#' )
#' ```
#'
#' Then the faux.dixon.high dataset was created by simulating a single network
#' from the above model fit:
#'
#' ```{r, eval=FALSE}
#' faux.dixon.high <- simulate(desert.fit, nsim=1, burnin=1e+8,
#'   constraint = "edges")
#' ```
#'
#' @template data
#'
#' @references
#' Resnick M.D., Bearman, P.S., Blum R.W. et al. (1997). Protecting
#' adolescents from harm. Findings from the National Longitudinal Study on
#' Adolescent Health, *Journal of the American Medical Association*, 278:
#' 823-32.
#'
#'
#' @family directed networks
#' @family high school networks
#' @docType data
#' @keywords datasets
"faux.dixon.high"
