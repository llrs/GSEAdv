#' Remove from a GeneSetCollection
#'
#' Removes either genes or pathways of a GeneSetCollection if present.
#' @param obj A GeneSetCollection object.
#' @param gene The number or names of the genes to be removed.
#' @param pathway The number or names of the pathways to be removed.
#' @return A GeneSetCollection object without those genes or pathways.
#' @note Remember that a GeneSet is defined as a group of genes (more than one),
#' and if one gene set has only one gene it is removed. Conversely, a gene is
#' removed if it doesn't belong to any GeneSet.
#' @export
drop <- function(obj, gene = NULL, pathway = NULL) {

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
  as.GeneSetCollection(genes2paths)
}
