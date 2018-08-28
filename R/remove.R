#' @describeIn drop Drop genes and pathways
#' @examples
#' drop(Info, gene = "3", pathway = "156580")
#' @export
setMethod("drop",
          signature(object = "GeneSetCollection", gene = "character", pathway = "character"),
          function(object, gene, pathway) {

            paths2genes <- geneIds(object)

            remove <- names(paths2genes) %in% pathway
            genes2paths <- inverseList(paths2genes[!remove])

            remove <- names(genes2paths) %in% gene
            genes2paths <- genes2paths[!remove]

            # Return a GeneSetCollection
            as(genes2paths, "GeneSetCollection")
          }
)


#' @describeIn drop Drop pathways
#' @examples
#' drop(Info, pathway = "156580")
#' @export
setMethod("drop",
          signature(object = "GeneSetCollection", gene = "missing", pathway = "character"),
          function(object, pathway) {

            paths2genes <- geneIds(object)

            remove <- names(paths2genes) %in% pathway
            genes2paths <- inverseList(paths2genes[!remove])

                        # Return a GeneSetCollection
            as(genes2paths, "GeneSetCollection")
          }
)

#' @describeIn drop Drop genes
#' @export
setMethod("drop",
          signature(object = "GeneSetCollection", gene = "character", pathway = "missing"),
          function(object, gene) {

            paths2genes <- geneIds(object)
            genes2paths <- inverseList(paths2genes)

            remove <- names(genes2paths) %in% gene
            genes2paths <- genes2paths[!remove]

            # Return a GeneSetCollection
            as(genes2paths, "GeneSetCollection")
          }
)



#' @describeIn drop Drop the specified number of genes and pathways
#' @export
setMethod("drop",
          signature(object = "GeneSetCollection", gene = "numeric", pathway = "numeric"),
          function(object, gene, pathway) {
            stopifnot(gene >= 1)
            stopifnot(pathway >= 1)

            paths2genes <- geneIds(object)

            # Remove pathways
            remove <- sample(seq_along(paths2genes), pathway)
            genes2paths <- inverseList(paths2genes[-remove])

            # Remove genes
            remove <- sample(seq_along(genes2paths), gene)
            genes2paths <- genes2paths[-remove]

            # Return a GeneSetCollection
            as(genes2paths, "GeneSetCollection")
          }
)


#' @describeIn drop Drop the specified number of pathway
#' @export
setMethod("drop",
          signature(object = "GeneSetCollection", gene = "missing", pathway = "numeric"),
          function(object, pathway) {
            stopifnot(pathway >= 1)

            paths2genes <- geneIds(object)

            # Remove pathways
            remove <- sample(seq_along(paths2genes), pathway)
            genes2paths <- inverseList(paths2genes[-remove])

            # Return a GeneSetCollection
            as(genes2paths, "GeneSetCollection")
          }
)



#' @describeIn drop Drop the specified number of genes.
#' @export
setMethod("drop",
          signature(object = "GeneSetCollection", gene = "numeric", pathway = "missing"),
          function(object, gene, pathway) {
            stopifnot(gene >= 1)

            paths2genes <- geneIds(object)
            genes2paths <- inverseList(paths2genes)

            # Remove genes
            remove <- sample(seq_along(genes2paths), gene)
            genes2paths <- genes2paths[-remove]

            # Return a GeneSetCollection
            as(genes2paths, "GeneSetCollection")
          }
)

#' @describeIn dropRel a relationship between a genes and a pathway
#' @examples
#' genesPerPathway(Info)
#' out <- dropRel(Info, "9", "156580")
#' genesPerPathway(out)
#' @export
setMethod("dropRel",
          signature(object = "GeneSetCollection", gene = "character", pathway = "character"),
          function(object, gene, pathway) {
            paths2genes <- geneIds(object)
            if (!pathway %in% names(paths2genes)) {
              stop("Pathway not present")
            }
            genesIn <- paths2genes[[pathway]]
            remove <- !genesIn %in% gene
            if (sum(remove) >= 1L) {
              warning("Removing ", sum(remove), " genes of the pathway")
            }
            paths2genes[[pathway]] <- genesIn[remove]

            as(inverseList(paths2genes), "GeneSetCollection")

          }
)
