#' @describeIn duplicatedGenes Checks if different genes are described as
#' the same combination of pathways
#' @export
setMethod("duplicatedGenes",
          signature(object = "GeneSetCollection"),
          function(object) {
            paths2genes <- geneIds(object)
            length(paths2genes) != length(unique(paths2genes))
          }
)
#' @describeIn duplicatedPathways Checks if a different pathways are described
#' as the same combination of genes.
#' @export
setMethod("duplicatedPathways",
          signature(object = "GeneSetCollection"),
          function(object) {
            paths2genes <- geneIds(object)
            genes2paths <- inverseList(paths2genes)
            length(genes2paths) != length(unique(genes2paths))
          }
)