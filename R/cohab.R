#' Target statistics and model fit to a hypothetical 50,000-node network
#' population with 50,000 nodes based on egocentric survey
#'
#' @description This dataset consists of three objects, each based on data from
#'   King County, Washington, USA (where Seattle is located) derived from the
#'   National Survey of Family Growth (NSFG)
#'   (\url{https://www.cdc.gov/nchs/nsfg/index.htm}). The full dataset cannot be
#'   released publicly, so some aspects of these objects are simulated based on
#'   the real data.
#'
#' @description These objects may be used to illustrate that network modeling
#'   may be performed using data that are collected on egos only, i.e., without
#'   directly observing information about alters in a network except for
#'   information reported from egos. The hypothetical population represented by
#'   this dataset consists of only a subset of individuals, as categorized by
#'   their age, race / ethnicity / immigration status, and gender and sexual
#'   identity.
#'
#' @format The three objects are:
#' \describe{
#' \item{`cohab_MixMat`}{Mixing matrix on 'race'.  Based on ego reports of the
#' race / ethnicity / immigration status of their cohabiting partners, this
#' matrix gives counts of ego-alter ties by the race of each individual for a
#' hypothetical population. These counts are based on the NSFG mixing matrix.
#' Only five categories of the 'race' variable are included here: Black, Black
#' immigrant, Hispanic, Hispanic immigrant, and White. }
#' \item{`cohab_PopWts`}{Data frame of demographic characteristics together with
#' relative counts (weights) in a hypothetical population. Individuals are
#' classified according to five variables:  age in years, race (same five
#' categories of race / ethnicity / immigration status as above), sex (Male or
#' Female), sexual identity (Female, Male who has sex with Females, or Male who
#' has sex with Males or Females), and number of model-predicted persistent
#' partnerships with non-cohabiting partners (0 or 1, where 1 means any nonzero
#' value; the number is capped at 3), and number of partners (0 or 1).}
#' \item{`cohab_TargetStats`}{Vector of target (expected) statistics for a 15-term
#' ERGM applied to a network of 50,000 nodes in which a tie represents a
#' cohabitation relationship between two nodes.  It is assumed for the purposes
#' of these statistics that only male-female cohabitation relationships are
#' allowed and that no individual may have such a relationship with more than
#' one person.  That is, each node must have degree zero or one.  The ergm
#' formula is: \code{~ edges + nodefactor("sex.ident", levels = 3) +
#' nodecov("age") + nodecov("agesq") + nodefactor("race", levels = -5) +
#' nodefactor("othr.net.deg", levels = -1) + nodematch("race", diff = TRUE) +
#' absdiff("sqrt.age.adj")}}
#' }
#'
#' @name cohab
#' @aliases cohab cohab_MixMat cohab_PopWts cohab_TargetStats
#' @keywords datasets
#'
#' @template data
#'
#' @references Krivitsky, P.N., Hunter, D.R., Morris, M., and Klumb, C. (2021).
#' *ergm 4.0: New Features and Improvements*. \url{https://arxiv.org/abs/2106.04997v1}
#'
#' National Center for Health Statistics (NCHS). (2020). *2006-2015 National
#' Survey of Family Growth Public-Use Data and Documentation*. Hyattsville, MD:
#' CDC National Center for Health Statistics.
#' Retrieved from \url{https://www.cdc.gov/nchs/nsfg/index.htm}
c("cohab_MixMat", "cohab_PopWts", "cohab_TargetStats")
