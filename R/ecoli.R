#' Two versions of an E. Coli network dataset
#'
#' This network data set comprises two versions of a biological network in
#' which the nodes are operons in *Escherichia Coli* and a directed edge
#' from one node to another indicates that the first encodes the transcription
#' factor that regulates the second.
#'
#' @details The network object `ecoli1` is directed, with 423 nodes and 519
#'   arcs. The object `ecoli2` is an undirected version of the same network, in
#'   which all arcs are treated as edges and the five isolated nodes (which
#'   exhibit only self-regulation in `ecoli1`) are removed, leaving 418 nodes.
#'
#' @docType data
#' @name ecoli
#' @aliases ecoli ecoli1 ecoli2
#' @keywords datasets
#' @family directed networks
#' @family undirected networks
#'
#' @template licenses
#'
#' @section Visualization:
#' ```{r, ecoli-figure, echo=FALSE, fig.asp=0.5}
#' set.seed(666)
#' layout(matrix(1:2, 1, 2))
#' network::plot.network(ecoli1)
#' title(main="ecoli1")
#' network::plot.network(ecoli2)
#' title(main="ecoli2")
#' layout(1)
#' ```
#'
#' @references
#'
#' Salgado et al (2001), Regulondb (version 3.2): Transcriptional Regulation
#' and Operon Organization in Escherichia Coli K-12, \emph{Nucleic Acids
#' Research}, 29(1): 72-74.
#'
#' Shen-Orr et al (2002), Network Motifs in the Transcriptional Regulation
#' Network of Escerichia Coli, \emph{Nature Genetics}, 31(1): 64-68.
#'
#' Saul, Z. M., & Filkov, V. (2007). Exploring biological network structure
#' using exponential random graph models. Bioinformatics, 23(19), 2604-2611.
#'
#' @source The data set is based on the RegulonDB network (Salgado et al, 2001)
#' and was modified by Shen-Orr et al (2002).
#'
c("ecoli1", "ecoli2")
