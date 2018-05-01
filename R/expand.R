# TODO: Finish this draft
#' @importFrom stats rgeom
expand <- function(obj, genes) {

  if (!requireNamespace("fitdistrplus")){
    stop("To use this function it needs the package fitdistrplus.
         Please install it with install.packages('fitdistrplus')")
  }

  # Find the distribution of genes and pathways
  ppg <- pathwaysPerGene(obj)
  gpp <- genesPerPathway(obj)

  #Fit a distribution
  f <- fitdistrplus::fitdist(ppg, "geom")
  ppg_sim <- stats::rgeom(length(genes), f$estimate)
  f <- fitdistrplus::fitdist(gpp, "geom")
  gpp_sim <- stats::rgeom(length(), f$estimate)

  # Follow the distribution/pattern
  # A raw distribution (fitted)
  # The interaction
  # Randomly
}