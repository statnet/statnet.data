#' Generate "Format" section of data documentation
#'
#' @description Generates text in Markdown for the "Format" section (without the
#'   section itself). It is a generic function with methods defined below.
#'
#' @param object data object to be described see "Methods" section below for
#'   available methods
#'
#' @return Character scalar with the Markdown text.
#'
#' @family data documentation generators
#'
data_format <- function(object, ...) UseMethod("data_format")

#' @describeIn data_format Create a paragraph providing information on the size
#'   of the node set, the edge set and the node and edge attributes.
data_format.network <- function(object, ...) {
  requireNamespace("network")

  out <- character(0)

  append(out) <- paste0(
    if(network::is.directed(object)) "Directed" else "Undirected",
    if(network::is.bipartite(object)) " bipartite" else NULL,
    " [`network`][network::network] object with ", network::network.size(object),
      " nodes and ",
    network::network.edgecount(object), " edges."
  )

  vattr <- setdiff(network::list.vertex.attributes(object), c("na", "vertex.names"))
  if(length(vattr) > 0) {
    append(out) <- paste0(
      "Vertex attributes: ",
      paste(md_code(vattr), collapse=", "),
      "."
    )
  }

  eattr <- setdiff(network::list.edge.attributes(object), c("na"))
  if(length(eattr) > 0) {
    append(out) <- paste0(
      "Edge attributes: ",
      paste(md_code(vattr), collapse=", "),
      "."
    )
  }
  paste(out, collapse="\n")
}





# Markdown formatting -----------------------------------------------------

md_code <- function(x) paste0("`", x, "`")

md_bold <- function(x) paste0("**", x, "**")

md_italics <- function(x) paste0("*", x, "*")

md_table <- function(x, ...) {
  names(x) <- md_bold(names(x))
  knitr::kable(x, ...)
}



# Utils -------------------------------------------------------------------

# Assignment version of append()
"append<-" <- function(x, value, ...) {
  append(x, values=value, ...)
}
