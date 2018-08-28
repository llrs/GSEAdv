#' @describeIn nGenes Number of different genes
#' @export
setMethod("nGenes",
          signature(object = "GeneSetCollection"),
          function(object) {
            nUnique(unlist(geneIds(object), use.names = FALSE))
          }
)

#' @describeIn nPathways Number of GeneSets
#' @export
setMethod("nPathways",
          signature(object = "GeneSetCollection"),
          function(object) {
            length(object)
          }
)