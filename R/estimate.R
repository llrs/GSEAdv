#' Estimate a GeneSetCollection
#'
#' Given information about a \code{GeneSetCollection} it estimates the range of
#' the different parameters.
#' If the parameter should be a matrix, it only outputs the maximum and the
#' lowest value it could reach.
#' @param nGenes Numeric value with the number of genes
#' @param nPathways Numeric value with the number of pathways
#' @param genesPerPathway Numeric vector with the number of genes per pathway
#' @param pathwaysPerGene Numeric vector with the number of pathways per gene
#' @param sizeGenes Numeric matrix with the size of pathways in genes see \code{\link{sizeGenes}}
#' @param sizePathways Numeric matrix with the size of genes in pathways see \code{\link{sizePathways}}
#' @param sizePerGenes  A numeric vector with the amount of pathways of different size per genes see \code{\link{sizesPerGene}}
#' @param sizePerPathways A numeric vector with the amount of genes of different size per pathways see \code{\link{sizesPerPathway}}
#' @return A \code{data.frame} with the max and minimum value for each estimate.
#' \code{NA} is returned if it cannot be estimated.
#' @examples
#' estimate(nGenes = 100)
#' estimate(nPathways = 100)
#' estimate(nGenes = 100, nPathways = 100)
#' @export
estimate <- function(nGenes = NULL, nPathways = NULL,
         genesPerPathway = NULL, pathwaysPerGene = NULL,
         sizeGenes = NULL, sizePathways = NULL,
         sizePerGenes = NULL, sizePerPathways = NULL) {
  params <- list(nGenes, nPathways,
              genesPerPathway, pathwaysPerGene,
              sizeGenes, sizePathways,
              sizePerGenes, sizePerPathways)
  nulls <- vapply(params, is.null, logical(1L))
  if (all(nulls)) {
    stop("Please provide some data to estimate data from the original ",
         "GeneSetCollection")
  }

  if (any(!vapply(params[!nulls], is.numeric, logical(1L)))) {
    stop("Please provide either a matrix or a numeric vector depending ",
         "on the parameter")
  }
  if (!is.null(nPathways)) {
    nGenes <- min(calc.max.nGenes(nPathways), nGenes)
  }
  if (!is.null(nGenes)) {
    maxNPathways <- double.factorial(nGenes)
    nPathways <- min(maxNPathways, nPathways)
  }
  if (!is.null(genesPerPathway)) {
    nGenes <- min(estimate.nGenes(genesPerPathway), nGenes)
  }
  if (!is.null(pathwaysPerGene)) {
    nPathways <- min(estimate.nGenes(pathwaysPerGene), nPathways)
  }
  max <- c("nPathways" = nPathways, "nGenes" = nGenes)
  min <- c("nPathways" = 2, "nGenes" = 3)
  out <- cbind.data.frame(max, min)
  out <- cbind("estimate" = rownames(out), out)
  row.names(out) <- NULL
  out
}