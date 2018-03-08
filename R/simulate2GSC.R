#' Simulate GeneSetCollection
#'
#' Simulates a GeneSetCollection following a distribution
#' @param ppg The number of pathways per genes of the desired GeneSetCollection.
#' @param gpp The number of genes per pathway of the desired GeneSetCollection.
#' @return A GeneSetCollection
yz <- function(ppg, gpp) {

  # Check input
  if (any(ppg < 0) || !is.numeric(ppg)) {
    stop("Provide integer values for genes in the pathways")
  }
  if (any(gpp < 0) || !is.numeric(gpp)) {
    stop("Provide integer values for pathways of the genes")
  }

  # Remove empty pathways or pathways of single genes
  if (any(gpp < 2)) {
    gpp <- gpp[gpp < 2]
  }

  # Remove empty genes without pathways
  if (any(ppg == 0)) {
    ppg <- ppg[ppg == 0]
  }

  # Set names
  if (is.null(names(ppg))) {
    genes <- paste0("G_", seq_along(ppg))
    names(ppg) <- genes
  } else {
    genes <- names(ppg)
  }

  if (is.null(names(gpp))) {
    pathways <- paste0("GS_", seq_along(gpp))
    names(gpp) <- pathways
  } else {
    pathways <- names(gpp)
  }
  # Store the original values just in case
  gpp_orig <- gpp
  ppg_orig <- ppg
  # stop("Work unfinished")

  paths2genes <- vector("list", length(gpp))
  while(sum(gpp) >= 1 || sum(ppg) >=1) {
    pathway <- sample(gpp, 1)
    gpp[names(pathway)] <- gpp[names(pathway)] -1
    if (pathway >= length(ppg)) {
      message(pathway)
      print(ppg)
      stop("Unable to simulate a GeneSetCollection with those restrictions")
    }
    genes <- sample(names(ppg), pathway)
    paths2genes[[names(pathway)]] <- genes
    ppg[genes] <- ppg[genes] - 1

    # Remove empty pathways or pathways of single genes
    if (any(gpp == 0 )) {
      gpp <- gpp[gpp == 0]
    }

    # Remove empty genes without pathways
    if (any(ppg == 0)) {
      ppg <- ppg[ppg == 0]
    }

  }

  genes2pathways <- inverseList(paths2genes)
  as(genes2pathways, "GeneSetCollection")
}
