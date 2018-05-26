#' @describeIn genesPerGene Number of genes for all genes
setMethod("genesPerGene",
          signature(object = "GeneSetCollection", genes = "missing", unique = "ANY"),
          function(object, unique = TRUE){
            x <- check(object)
            pathways2genes <- geneIds(x)
            genes2pathways <- inverseList(pathways2genes)
            genesPer <- function(y) {
              if (unique) {
              genes <- length(unique(unlist(pathways2genes[y], use.names = FALSE)))
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
                  genes <- length(unique(unlist(pathways2genes[y], use.names = FALSE)))
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