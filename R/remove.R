#' @describeIn drop Drop a gene a pathway or both
#' @export
setMethod("drop",
          signature(object = "GeneSetCollection", gene = "ANY", pathway = "ANY"),
          function(object, gene = NULL, pathway = NULL) {

            paths2genes <- geneIds(obj)

            if (is(pathway, "character")) {
              remove <- match(names(paths2genes), pathway)
              remove <- remove[!is.na(remove)]
            } else if (is(pathway, "numeric")) {
              remove <- sample(seq_along(paths2genes), pathway)
            } else if (!is.null(pathway)) {
              stop("Please use either characters or numbers to remove pathways")
            }

            # Remove pathways
            if (length(remove) == 0) {
              genes2paths <- inverseList(paths2genes)
            } else if (!is.null(pathway)) {
              genes2paths <- inverseList(paths2genes[-remove])
            }

            if (is(gene, "character")) {
              remove <- match(names(genes2paths), gene)
              remove <- remove[!is.na(remove)]
            } else if (is(gene, "numeric")) {
              remove <- sample(seq_along(genes2paths), gene)
            } else if (!is.null(gene)) {
              stop("Please use either characters or numbers to be removed as genes")
            }

            # Remove genes
            if (length(remove) != 0 & !is.null(gene)) {
              genes2paths <- genes2paths[-remove]
            }

            # Return a GeneSetCollection
            as(genes2paths, "GeneSetCollection")
          }
)

#' @describeIn drop Drop a gene a pathway or both
#' @export
dropRel <- function(obj, gene = NULL, pathway = NULL) {

  }