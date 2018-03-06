#' Simulate GeneSetCollection
#'
#' Simulates a GeneSetCollection following a distribution
#' @param ppg The number of pathways per genes of the desired GeneSetCollection
#' @return A GeneSetCollection
y <- function(ppg) {
  # Check input
  if (any(ppg < 0) || !is.numeric(ppg)) {
    stop("Provide positive integer values for genes in the pathways")
  }

  # Remove empty genes without pathways
  if (any(ppg == 0)) {
    ppg <- ppg[ppg == 0]
  }

  # Set names to the genes
  if (is.null(names(ppg))) {
    genes <- paste0("G_", seq_along(ppg))
    names(ppg) <- genes
  } else {
    genes <- names(ppg)
  }

  # Compares the actual number of pathways with the possible outcome of
  if (choose(length(ppg), 2) < max(ppg)){
    stop("Impossible combination of genes and pathways")
  }

  # For each gene create a random pathway of the size set ppg
  # Could be done in parallel, as each gene doesn't depend on the previous
  genes2pathsG <- lapply(ppg, function(y) {
    lapply(seq_len(y), sample, x = genes)
  })

  # Remove duplicate pathways
  pathways <- unique(unlist(genes2pathsG, recursive = FALSE,
                               use.names = FALSE))
  names(pathways) <- paste0("GS_", seq_along(pathways))
  genes2pathways <- inverseList(pathways)
  as.GeneSetCollection(genes2pathways)
}


#' Simulate GeneSetCollection
#'
#' Simulates a GeneSetCollection following a distribution
#' @param gpp The number of pathways per genes of the desired GeneSetCollection
#' @return A GeneSetCollection
z <- function(gpp) {
  # Check input
  if (any(gpp < 0) || !is.numeric(gpp)) {
    stop("Provide positive integer values for pathways of the genes")
  }

  # Remove empty pathways or pathways of single genes
  if (any(gpp < 2)) {
    gpp <- gpp[!gpp < 2]
  }

  # Set names to the genes
  if (is.null(names(gpp))) {
    pathways <- paste0("GS_", seq_along(gpp))
    names(gpp) <- pathways
  } else {
    pathways <- names(gpp)
  }
  # max(gpp), sum(gpp)

  # Compares the actual number of pathways with the possible outcome of
  if (choose(length(gpp), 2) < max(gpp)){
    stop("Impossible combination of genes and pathways")
  }

  # For each pathway create a random group of genes
  # Could be done in parallel, as each gene doesn't depend on the previous
  genes2pathsG <- lapply(gpp, function(y) {
    lapply(seq_len(y), sample, x = pathways)
  })

  # Remove duplicate pathways
  genes2pathways <- unique(unlist(genes2pathsG, recursive = FALSE,
                            use.names = FALSE))
  names(genes2pathways) <- paste0("G_", seq_along(genes2pathways))
  as.GeneSetCollection(genes2pathways)
}
