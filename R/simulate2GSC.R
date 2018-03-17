#' Simulate GeneSetCollection
#'
#' Simulates a GeneSetCollection following the both distributions
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

  # Set names
  ppg <- names_vec(ppg, "G_")
  genes <- names(ppg)

  gpp <- names_vec(gpp, "GS_")
  pathways <- names(gpp)

  genes2paths <- lapply(ppg, sample, x = pathways, prob = gpp)
  paths2genes <- inverseList(genes2paths)

  # Precalculate data
  ppg_sim <- lengths(paths2genes)
  t_ppg_sim <- table(ppg_sim)
  t_ppg <- table(ppg)

  # Logics
  len <- length(t_ppg) == length(t_ppg_sim)
  if (len){
    nam <- all(names(t_ppg) == names(t_ppg_sim))
    if (nam) {
      keep <- all(t_ppg == t_ppg_sim)
    } else {
      keep <- FALSE
    }
  } else {
    nam <- FALSE
    keep <- FALSE
  }

  iter <- 1
  while (!(len & nam & keep)) {
    iter <- iter + 1

    genes2paths <- lapply(ppg, sample, x = pathways, prob = gpp)
    paths2genes <- inverseList(genes2paths)

    # Precalculate data
    ppg_sim <- lengths(paths2genes)
    t_ppg_sim <- table(ppg_sim)
    t_ppg <- table(ppg)

    # Logics
    len <- length(t_ppg) == length(t_ppg_sim)
    if (len){
      nam <- all(names(t_ppg) == names(t_ppg_sim))
      if (nam) {
        keep <- all(t_ppg == t_ppg_sim)
      } else {
        keep <- FALSE
      }
    } else {
      nam <- FALSE
      keep <- FALSE
    }

  }
  message("Iterations: ", iter)
  as(genes2paths, "GeneSetCollection")
}
