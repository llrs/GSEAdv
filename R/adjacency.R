#' @describeIn adjacency Adjacency between genes
#' @export
setMethod("adjacency",
          signature(object = "GeneSetCollection"),
          function(object) {
            adj <- crossprod(incidence(object))
            adj[adj != 0] <- 1
            adj
          }
)