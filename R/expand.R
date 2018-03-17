# TODO: Finish this draft
expand <- function(obj, genes) {
  if (!any(genes %in% names(pathwaysPerGene(obj)))){
    stop("To expand the gene set some genes must be inside the object")
  }
  if (any(!names(pathwaysPerGene(obj) %in% genes))){
    message("Including the genes in obj")
  }

  # Sample from all the genes

  # Follow the distribution/pattern
  # A raw distribution (fitted)
  # The interaction
  # Randomly
}