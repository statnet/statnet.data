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
  title(
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
