#' Create a GeneSetCollection
#'
#' Using the genes and to how big pathways thye are associated together with
#' the pathways and the number of genes each gene in the pathways is associated
#' it creates a new pathway.
#' @param sizeGenes A matrix result of \code{sizeGenes}.
#' @param sizePathways A matrix result of \code{sizePathways}.
#' @return A GeneSetCollection object
#' @seealso
#' \code{\link{sizeGenes}}, \code{\link{sizePathways}}
#' @export
fromSizeGenes_sizePathways <- function(sizeGenes, sizePathways) {
  # Check input
  stopifnot(sum(rowSums(sizeGenes)/as.numeric(rownames(sizeGenes))) == ncol(sizePathways))
  stopifnot(sum(rowSums(sizePathways)/as.numeric(rownames(sizePathways))) == ncol(sizeGenes))
  stopifnot(min(as.numeric(rownames(sizeGenes))) >= 2)
  genes <- colnames(sizeGenes)

  gpp <- colSums(sizePathways)
  helper <- function(gene, sizeGenes, sizePathways){
    # message(gene)
    gpp_gene <- sizeGenes[, gene]
    paths <- names(gpp)[gpp %in% names(gpp_gene)]
    paths <- sizePathways[, paths]
    paths <- paths[as.character(sum(gpp_gene)), ]
    base::sample(x = names(paths), size = sum(gpp_gene), prob = paths)
  }

  genes2paths <- lapply(genes, helper,
                        sizeGenes = sizeGenes, sizePathways = sizePathways)
  names(genes2paths) <- genes

  gsc <- as(genes2paths, "GeneSetCollection")

  gpp_gsc <- genesPerPathway(gsc)
  iter <- 1
  while(any(gpp_gsc != colSums(sizePathways))) {
    genes2paths <- lapply(genes, helper,
                          sizeGenes = sizeGenes, sizePathways = sizePathways)
    names(genes2paths) <- genes

    gsc <- as(genes2paths, "GeneSetCollection")

    gpp_gsc <- genesPerPathway(gsc)
    iter <- iter + 1
  }

  message("Iterations: ", iter)
  gsc
}
