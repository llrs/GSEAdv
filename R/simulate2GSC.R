#' Simulate GeneSetCollection
#'
#' Simulates a GeneSetCollection following distributions of genes per pathway
#' and of pathways per gene.
#' @param ppg The number of pathways per genes of the desired GeneSetCollection.
#' @param gpp The number of genes per pathway of the desired GeneSetCollection.
#' @return A GeneSetCollection
#' @aliases fromGPP_PPG
#' @export
fromPPG_GPP <- function(ppg, gpp) {

  # Check input
  if (any(ppg < 0) || !is.numeric(ppg)) {
    stop("Provide integer values for genes in the pathways")
  }
  if (any(gpp < 0) || !is.numeric(gpp)) {
    stop("Provide integer values for pathways of the genes")
  }

  # Remove empty pathways or pathways of single genes
  if (any(gpp < 2)) {
    warning("Removing pathways with only one gene")
    gpp <- gpp[gpp < 2]
  }

  # Remove empty genes without pathways
  if (any(ppg == 0)) {
    warning("Removing genes without pathway")
    ppg <- ppg[ppg == 0]
  }

  # Check that a GeneSetCollection can be simulated
  stopifnot(max(ppg) < length(gpp))
  stopifnot(max(gpp) < length(ppg))

  if (sum(ppg) != sum(gpp)) {
    stop("These genes per pathways and this pathways per gene do not match.\n
         Arrange so that the sum of the elements are equal.")
  }

  # Set names
  ppg <- names_vec(ppg, "G_")
  genes <- names(ppg)

  gpp <- names_vec(gpp, "GS_")
  pathways <- names(gpp)

  genes2paths <- lapply(ppg, sample, x = pathways, prob = gpp)
  paths2genes <- inverseList(genes2paths)

  # Precalculate data
  ppg_sim <- lengths(paths2genes)
  pass1 <- check_vec(ppg, ppg_sim)
  gpp_sim <- lengths(genes2paths)
  pass2 <- check_vec(gpp, gpp_sim)


  iter <- 1
  while (!(pass1  & pass2)) {
    iter <- iter + 1

    genes2paths <- lapply(ppg, sample, x = pathways, prob = gpp)
    paths2genes <- inverseList(genes2paths)

    # Precalculate data
    ppg_sim <- lengths(paths2genes)
    pass1 <- check_vec(ppg, ppg_sim)
    gpp_sim <- lengths(genes2paths)
    pass2 <- check_vec(gpp, gpp_sim)

  }
  message("Iterations: ", iter)
  as(genes2paths, "GeneSetCollection")
}
