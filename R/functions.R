#' Generate "Format" section of data documentation
#'
#' @description Generates text in Markdown for the "Format" section (without the
#'   section itself). It is a generic function with methods defined below.
#'
#' @param object data object to be described see "Methods" section below for
#'   available methods
#' @param ... arguments passed to/from other methods. Currently ignored.
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
      paste(md_code(eattr), collapse=", "),
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





# Plotting ----------------------------------------------------------------

# Plot network with lists of vertex and edge attributes in the subtitle
#
# @param net network object
# @param net_name object name
# @param ... passed to network::plot.network()
#
visual_summary <- function(net, net_name=deparse(substitute(net)), ...) {
  requireNamespace("network")
  network::plot.network(net, ...)
  vattrs <- network::list.vertex.attributes(net)
  eattrs <- network::list.edge.attributes(net)
  graphics::title(
    main = net_name,
    sub = paste(
      if(identical(vattrs, "na")) {
        NULL
      } else {
        paste0("Vertex attributes: ", paste(vattrs, collapse = ", "), "\n")
      },
      if(identical(eattrs, "na")) {
        NULL
      } else {
        paste0("Edge attributes: ", paste(eattrs, collapse = ", "), "\n")
      }
    )
  )
}



# Summary of all datasets based on package sources ------------------------

# Get a dataset
# @param name
# @return A named list of data object
get_data <- function(fname) {
  if(!file.exists(fname))
    stop("file ", sQuote(name), " not found", call.=FALSE)
  e <- new.env()
  load(fname, envir=e)
  as.list(e)
}

#' @export
describe_data_object <- function(object, ...) UseMethod("describe_data_object")

#' @export
describe_data_object.default <- function(object, ...) {
  data.frame(
    class = data.class(object)
  )
}

#' @export
describe_data_object.network <- function(object, ...) {
  r <- NextMethod()
  # r <- describe_data_object.default(object, ...)
  r$directed <- if(network::is.directed(object)) "Yes" else "No"
  r$bipartite <- if(network::is.bipartite(object)) "Yes" else "No"
  r$nodes <- network::network.size(object)
  r$edges <- network::network.edgecount(object)
  r
}

table_datasets <- function() {
  all_data_files <- list.files("data", pattern="\\.rda")
  data_names <- gsub("\\.rda$", "", all_data_files)
  l <- lapply(
    file.path("data", all_data_files),
    function(fn) lapply(get_data(fn), describe_data_object)
  )
  l
}




# Utils -------------------------------------------------------------------

# Assignment version of append()
"append<-" <- function(x, ..., value) {
  append(x, values=value, ...)
}
