pathwaysPerGene <- function(object) {
  warning("Did you want to use it in a GeneSetCollection?")
}

#' @describeIn pathwaysPerGene Pathways per gene in the GeneSetCollection
#' @export
setMethod("pathwaysPerGene",
          "GeneSetCollection",
          function(object) {
            object <- check(object)
            pathways2genes <- GSEABase::geneIds(object)
            lengths(inverseList(pathways2genes))
          }
)
