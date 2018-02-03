pathwaysPerGene <- function(object) {
  warning("Did you want to use it in a GeneSetCollection?")
}

#' @describeIn pathwaysPerGene Pathways per gene in the GeneSetCollection
#' @exportMethod pathwaysPerGene
setMethod("pathwaysPerGene",
          "GeneSetCollection",
          function(object) {
            check_gsc(object)
            pathways2genes <- GSEABase::geneIds(object)
            lengths(inverseList(pathways2genes))
          }
)
