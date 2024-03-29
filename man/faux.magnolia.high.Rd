% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/faux.magnolia.high.R
\docType{data}
\name{faux.magnolia.high}
\alias{faux.magnolia.high}
\title{Goodreau's Faux Magnolia High School as a network object}
\format{
\code{faux.magnolia.high} is a \code{\link[network:network]{network}} object
with 1461 vertices (students, in this case) and 974 undirected edges (mutual
friendships). To obtain additional summary information about it, type
\code{summary(faux.magnolia.high)}.

The vertex attributes are:
\itemize{
\item \code{Grade} -- attribute has values 7 through 12, indicating each student's
grade in school
\item \code{Sex}
\item \code{Race} -- attribute is based on the answers to two questions, one on
Hispanic identity and one on race, and takes six possible values: White
(non-Hisp.), Black (non-Hisp.), Hispanic, Asian (non-Hisp.), Native American,
and Other (non-Hisp.)
}
}
\source{
The data set is based upon a model fit to data from two school
communities from the AddHealth Study, Wave I (Resnick et al., 1997). It was
constructed as follows:

The two schools in question (a junior and senior high school in the same
community) were combined into a single network dataset.  Students who did
not take the AddHealth survey or who were not listed on the schools' student
rosters were eliminated, then an undirected link was established between any
two individuals who both named each other as a friend.  All missing race,
grade, and sex values were replaced by a random draw with weights determined
by the size of the attribute classes in the school.

The following \code{\link[ergm:ergm]{ergm::ergm()}} model was fit to the original data:\if{html}{\out{<div class="sourceCode r">}}\preformatted{magnolia.fit <- ergm(
  magnolia ~ edges + nodematch("Grade",diff=T) + nodematch("Race",diff=T) +
    nodematch("Sex",diff=F) + absdiff("Grade") + gwesp(0.25,fixed=T),
  burnin=10000, interval=1000, MCMCsamplesize=2500, maxit=25,
  control=control.ergm(steplength=0.25)
)
}\if{html}{\out{</div>}}

Then the \code{faux.magnolia.high} dataset was created by simulating a single
network from the above model fit:\if{html}{\out{<div class="sourceCode r">}}\preformatted{faux.magnolia.high <- simulate (magnolia.fit, nsim=1, burnin=100000000,
  constraint = "edges") \}
}\if{html}{\out{</div>}}
}
\usage{
faux.magnolia.high
}
\description{
This data set represents a simulation of an in-school friendship network.
The network is named \code{faux.magnolia.high} because the school commnunities on
which it is based are large and located in the southern US.
}
\section{Licenses and Citation}{
 If the section Source of this page does not
specify otherwise, this data set is protected by the Creative Commons
License \url{https://creativecommons.org/licenses/by/4.0/}.

When publishing results obtained using this data set, the original authors
(see sections Source and/or References) should be cited, along with this
\code{R} package. To cite this package please use the following:

Handcock M, Hunter D, Butts C, Goodreau S, Krivitsky P, Morris M,
Bojanowski M (2021). \emph{statnet.data: Network Datasets for the Statnet
Suite}. R package version 0.1-0, <URL: https://statnet.org>.
}

\references{
Resnick M.D., Bearman, P.S., Blum R.W. et al. (1997). Protecting
adolescents from harm. Findings from the National Longitudinal Study on
Adolescent Health, \emph{Journal of the American Medical Association}, 278:
823-32.
}
\seealso{
Other undirected networks: 
\code{\link{davis}},
\code{\link{ecoli}},
\code{\link{faux.mesa.high}},
\code{\link{florentine}},
\code{\link{kapferer}},
\code{\link{molecule}},
\code{\link{zach}}

Other high school networks: 
\code{\link{faux.desert.high}},
\code{\link{faux.dixon.high}},
\code{\link{faux.mesa.high}}
}
\concept{high school networks}
\concept{undirected networks}
\keyword{datasets}
