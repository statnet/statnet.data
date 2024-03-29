#' Cumulative network of positive affection within a monastery
#'
#' Cumulative "liking" nominations of Sampson's (1969) monks over the three time
#' points.
#'
#' @format `r data_format(samplike)` The vertex attributes are:
#'
#' - `group` -- Groups of novices as classified by Sampson: "Loyal", "Outcasts",
#' and "Turks".
#' - `cloisterville` -- An indicator of attendance in the minor seminary of
#' "Cloisterville" before coming to the monastery.
#' - `vertex.names` -- The given names of the novices.  NB: These names have
#' been corrected as of `ergm` version 3.6.1; see details below.
#'
#' In addition, the data set has an edge attribute:
#'
#' - `nominations` -- number of times (out of 3) that monk A nominated monk B.
#'
#' @details
#' Sampson (1969) recorded the social interactions among a group of monks while
#' he was a resident as an experimenter at the cloister.  During his stay, a
#' political "crisis in the cloister" resulted in the expulsion of four
#' monks-- namely, the three "outcasts," Brothers Elias, Simplicius, Basil, and
#' the leader of the "young Turks," Brother Gregory.  Not long after Brother
#' Gregory departed, all but one of the "young Turks" left voluntarily:
#' Brothers John Bosco, Albert, Boniface, Hugh, and Mark.  Then, all three of
#' the "waverers" also left: First, Brothers Amand and Victor, then later
#' Brother Romuald.  Eventually, Brother Peter and Brother Winfrid also left,
#' leaving only four of the original group.
#'
#' Of particular interest are the data on positive affect relations
#' ("liking," using the terminology later adopted by White et al. (1976)), in
#' which each monk was asked if he had positive relations to each of the other
#' monks. Each monk ranked only his top three choices (or four, in the case of
#' ties) on "liking".  Here, we consider a directed edge from monk A to monk
#' B to exist if A nominated B among these top choices.
#'
#' The data were gathered at three times to capture changes in group sentiment
#' over time. They represent three time points in the period during which a new
#' cohort had entered the monastery near the end of the study but before the
#' major conflict began.  These three time points are labeled T2, T3, and T4 in
#' Tables D5 through D16 in the appendices of Sampson's 1969 dissertation.  The
#' `samplike` data set is the time-aggregated network.  Thus, a tie from
#' monk A to monk B exists if A nominated B as one of his three (or four, in
#' case of ties) best friends at any of the three time points.
#'
#' This data set is standard in the social network analysis literature, having
#' been modeled by Holland and Leinhardt (1981), Reitz (1982), Holland, Laskey
#' and Leinhardt (1983), Fienberg, Meyer, and Wasserman (1981), and Hoff,
#' Raftery, and Handcock (2002), among others. This is only a small piece of
#' the data collected by Sampson.
#'
#' This data set was updated for version 2.5 (March 2012) to add the
#' \code{cloisterville} variable and refine the names. This information is from
#' de Nooy, Mrvar, and Batagelj (2005). The original vertex names were:
#' Romul_10, Bonaven_5, Ambrose_9, Berth_6, Peter_4, Louis_11, Victor_8,
#' Winf_12, John_1, Greg_2, Hugh_14, Boni_15, Mark_7, Albert_16, Amand_13,
#' Basil_3, Elias_17, Simp_18. The numbers indicate the ordering used in the
#' original dissertation of Sampson (1969).
#'
#' @template data
#'
#' @section Mislabeling in Versions Prior to 3.6.1: In \code{ergm} version
#' 3.6.0 and earlier, The adjacency matrices of the \code{\link{samplike}},
#' \code{\link{samplk1}}, \code{\link{samplk2}}, and \code{\link{samplk3}}
#' networks reflected the original Sampson (1969) ordering of the names even
#' though the vertex labels used the name order of de Nooy, Mrvar, and Batagelj
#' (2005). That is, in \code{ergm} version 3.6.0 and earlier, the vertices were
#' mislabeled. The correct order is the same one given in Tables D5, D9, and
#' D13 of Sampson (1969): John Bosco, Gregory, Basil, Peter, Bonaventure,
#' Berthold, Mark, Victor, Ambrose, Romauld (Sampson uses both spellings
#' "Romauld" and "Ramauld" in the dissertation), Louis, Winfrid, Amand, Hugh,
#' Boniface, Albert, Elias, Simplicius. By contrast, the order given in
#' \code{ergm} version 3.6.0 and earlier is: Ramuald, Bonaventure, Ambrose,
#' Berthold, Peter, Louis, Victor, Winfrid, John Bosco, Gregory, Hugh,
#' Boniface, Mark, Albert, Amand, Basil, Elias, Simplicius.
#'
#' @source PhD thesis of Sampson (1968) and Pajek datasets at
#' \url{http://vlado.fmf.uni-lj.si/pub/networks/data/esna/sampson.htm}
#'
#' @seealso See also the data sets [`samplk1`], [`samplk2`], and [`samplk3`],
#'   containing the networks at each of the three individual time points.
#'
#' @references
#' Breiger, R. L., Boorman, S. A., & Arabie, P. (1975). An algorithm for
#' clustering relational data with applications to social network analysis and
#' comparison with multidimensional scaling. *Journal of Mathematical Psychology*,
#' 12(3), 328-383.
#'
#' Fienberg, S. E., Meyer, M. M., & Wasserman, S. S. (1985). Statistical
#' analysis of multiple sociometric relations. *Journal of the American
#' Statistical Association*, 80(389), 51-67.
#'
#' Hoff, P. D., Raftery, A. E., & Handcock, M. S. (2002). Latent space
#' approaches to social network analysis. *Journal of the American Statistical
#' Association*, 97(460), 1090-1098.
#'
#' Holland, P. W., Laskey, K. B., & Leinhardt, S. (1983). Stochastic
#' blockmodels: First steps. *Social Networks*, 5(2), 109-137.
#'
#' Holland, P. W., & Leinhardt, S. (1981). An exponential family of probability
#' distributions for directed graphs. *Journal of the American Statistical
#' Association*, 76(373), 33-50.
#'
#' de Nooy, W., Mrvar, A., Batagelj, V. (2005) *Exploratory Social Network
#' Analysis with Pajek*, Cambridge: Cambridge University Press
#'
#' Reitz, K. P. (1982). Using log linear analysis with network data: Another
#' look at Sampson's monastery. *Social Networks*, 4(3), 243-256.
#'
#' Sampson, S. F. (1968), *A novitiate in a period of change: An
#' experimental and case study of relationships*, Unpublished Ph.D.
#' dissertation, Department of Sociology, Cornell University.
#'
#' White, H.C., Boorman, S.A. and Breiger, R.L. (1976). Social structure from
#' multiple networks. I. Blockmodels of roles and positions. *American Journal
#' of Sociology*, 81(4), 730-780.
#'
#' @docType data
#' @name sampson
#' @aliases sampson samplike
#' @family directed networks
#' @family Sampson's datasets
#' @keywords datasets
"samplike"
