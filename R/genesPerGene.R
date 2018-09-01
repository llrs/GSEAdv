#' @describeIn genesPerGene Number of genes for all genes
#' @examples
#' genesPerGene(Info)
#' genesPerGene(Info, unique = FALSE)
#'  genesPerGene(Info, unique = )
setMethod("genesPerGene",
          signature(object = "GeneSetCollection", genes = "missing", unique = "ANY"),
          function(object, unique = TRUE){
            x <- check(object)
            pathways2genes <- geneIds(x)
            genes2pathways <- inverseList(pathways2genes)
            genesPer <- function(y) {
              if (unique) {
              genes <- nUnique(unlist(pathways2genes[y], use.names = FALSE))
              # Substract itself from the count
              genes - 1
              } else {
                genes <- length(unlist(pathways2genes[y], use.names = FALSE))
                # Substract itself from the count
                genes - length(y)
              }

            }
            vapply(genes2pathways, genesPer, numeric(1))
          }
)




#' @describeIn genesPerGene Number of genes per gene selected
#' @examples
#' genesPerGene(Info, "10")
#' genesPerGene(Info, "10", unique = FALSE)
#' @export
  setMethod("genesPerGene",
            signature(object = "GeneSetCollection", genes = "character", unique = "ANY"),
            function(object, genes, unique = TRUE){
              x <- check(object)

              pathways2genes <- geneIds(x)
              genes2pathways <- inverseList(pathways2genes)

              if (!any(genes %in% names(genes2pathways))) {
                if (all(!genes %in% names(genes2pathways))) {
                  stop("No gene was in the GeneSetCollection")
                } else {
                  warning("Omitting genes not present in GeneSetCollection")
                }
              }

              genes <- genes[genes %in% names(genes2pathways)]
              genesPer <- function(y) {
                if (unique) {
                  genes <- nUnique(unlist(pathways2genes[y], use.names = FALSE))
                  # Substract itself from the count
                  genes - 1
                } else {
                  genes <- length(unlist(pathways2genes[y], use.names = FALSE))
                  # Substract itself from the count
                  genes - length(y)
                }

              }
              vapply(genes2pathways[genes], genesPer, numeric(1))
            }
  )