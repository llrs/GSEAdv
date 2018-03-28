pathwaysPerGene <- function(object) {
  warning("Did you want to use it in a GeneSetCollection?")
}

#' @describeIn pathwaysPerGene Pathways per gene in the GeneSetCollection
#' @export
setMethod("pathwaysPerGene",
          "GeneSetCollection",
          function(object) {
            pathways2genes <- geneIds(object)
            lengths(inverseList(pathways2genes))
          }
)
