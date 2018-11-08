
setMethod("adjacency",
          signature = c("GeneSetCollection"),
          function(object) {
            adj <- crossprod(incidence(object))
            adj[adj != 0] <- 1
          }
)