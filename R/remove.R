#' @describeIn drop Drop genes and pathways
#' @export
setMethod("drop",
          signature(object = "GeneSetCollection", gene = "character", pathway = "character"),
          function(object, gene, pathway) {

            paths2genes <- geneIds(object)

            if (is(pathway, "character")) {
              remove <- names(paths2genes) %in% pathway
              genes2paths <- inverseList(paths2genes[!remove])
            } else {
              genes2paths <- inverseList(paths2genes)
            }

            if (is(gene, "character")) {
              remove <- names(genes2paths) %in% gene
              genes2paths <- genes2paths[!remove]
            }

            # Return a GeneSetCollection
            as(genes2paths, "GeneSetCollection")
          }
)


#' @describeIn drop Drop pathways
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
            # genes2paths <- inverseList(paths2genes)

            # Remove genes
            remove <- sample(seq_along(genes2paths), gene)
            genes2paths <- genes2paths[-remove]

            # Return a GeneSetCollection
            as(genes2paths, "GeneSetCollection")
          }
)