#' @describeIn edges Number of edges
#' @export
setMethod("nEdges",
          signature(object = "GeneSetCollection"),
          function(object){
            adj <- adjacency(object)
            sum(adj[upper.tri(adj)] >= 1)
          }
)

#' @describeIn edges Genes between which there is an edge
#' @export
setMethod("edges",
          signature(object = "GeneSetCollection"),
          function(object){
            adj <- adjacency(object)
            edges <- which(upper.tri(adj) & adj >= 1, arr.ind = TRUE)
            edges <- as.data.frame(edges, row.names = FALSE)
            # edgs colnames(adj)
            edges$row <- rownames(adj)[edges$row]
            edges$col <- colnames(adj)[edges$col]
            edges
          }
)