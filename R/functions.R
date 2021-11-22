# Generate data documentation
#
# @description Generate text in Markdown describing a network dataset.
#
# @description - `data_format()` generates "Format" section.
#
# @param net network; network object to be described
#
# @return qwerty
data_format <- function(net) {
  requireNamespace("network")

  out <- character(0)

  append(out) <- paste0(
    if(network::is.directed(net)) "Directer" else "Undirected",
    if(network::is.bipartite(net)) " bipartite" else NULL,
    " [`network`][network::network] object with ", network::network.size(net),
      " nodes and ",
    network::network.edgecount(net), " edges."
  )

  vattr <- setdiff(network::list.vertex.attributes(net), c("na", "vertex.names"))
  if(length(vattr) > 0) {
    append(out) <- paste0(
      "Vertex attributes: ",
      paste(bQuote(vattr), collapse=", "),
      "."
    )
  }

  eattr <- setdiff(network::list.edge.attributes(net), c("na"))
  if(length(eattr) > 0) {
    append(out) <- paste0(
      "Edge attributes: ",
      paste(bQuote(vattr), collapse=", "),
      "."
    )
  }
  paste(out, collapse="\n")
}



# Utils -------------------------------------------------------------------

# backquote a vector
bQuote <- function(x) paste0("`", x, "`")

# Assignment version of append()
"append<-" <- function(x, value) {
  append(x, values=value)
}
