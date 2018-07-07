pathwaysPerGene <- function(object, genes) {
  warning("Did you want to use it in a GeneSetCollection?")
}

#' @describeIn pathwaysPerGene Pathways per gene in all the GeneSetCollection
#' @examples
#' pathwaysPerGene(Info)
#' @export
setMethod("pathwaysPerGene",
          signature = c("GeneSetCollection", "missing"),
          function(object) {
            pathways2genes <- geneIds(object)
            lengths(inverseList(pathways2genes))
          }
)


#' @describeIn pathwaysPerGene Pathways per gene in the GeneSetCollection for
#' those genes.
#' @examples
#' pathwaysPerGene(Info, "10")
#' @export
setMethod("pathwaysPerGene",
          signature = c("GeneSetCollection", "character"),
          function(object, genes) {

            genes <- unique(genes)
            pathways2genes <- geneIds(object)
            genes2paths <- inverseList(pathways2genes)
            genesInGSC <- genes %in% names(genes2paths)
            msg <- "Genes not present in the GeneSetCollection were omitted."
            if (any(genesInGSC)){
              genes <- genes[genesInGSC]
              if (!all(genesInGSC)) {
                warning(msg)
              }
              lengths(genes2paths[genes])
            } else {
              stop("Genes were not present in the GeneSetCollection")
            }
          }
)