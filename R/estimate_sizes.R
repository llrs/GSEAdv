#' Estimate range of genes
#'
#' For a given vector of genes per pathways it calculates how many genes are able
#' to create this combination of sizes.
#' @param gpp Numeric vector of genes per pathways
#' @return A vector of the upper and lower extreme values of number of genes
#' that can create such combination
#' @export
#' @examples
#' estimate.nGenes(c(4, 5, 5, 5, 5, 5))
estimate.nGenes <- function(gpp){

  nPaths <- length(gpp)
  # The magic number of 10^(10/3*..) comes from a linear model using
  # calc.nPathways and the input
  min_genes <- min(max(gpp, na.rm = TRUE), 10^(10/3*nPaths))
  max_genes <- sum(gpp, na.rm = TRUE)
  c(min_genes, max_genes)
}

#' Estimate range of pathways
#'
#' For a given vector of pathays per gene it calculcates how many pathways are
#' possible. Note, the minimum is always 1
#' @param ppg A numeric vector of pathways per genes
#' @return The range of possible number of pathways.
#' @note If the number of genes is greater than 1024 it will return Inf for that
#' @export
#' @examples
#' estimate.nPathways(c(4, 5, 5, 5, 5, 5))
estimate.nPathways <- function(ppg){

  min_path <- min(ppg)
  max_path <- min(max(ppg), calc.nPathways(length(ppg)))
  c(min_path, max_path)
}
