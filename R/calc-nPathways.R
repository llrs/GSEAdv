# TODO: Estimates change if we assume that the original object pass the check function

#' Estimate the number of pathways
#'
#' Given the number of genes calculates the number of possible pathways
#' @param nGenes Numeric value of number of genes
#' @return Numeric value of number of possible pathways
#' @export
#' @examples
#' calc.nPathways(6)
calc.nPathways <- function(nGenes){
  sum(vapply(seq_len(nGenes), choose, n = nGenes, numeric(1L)))-1
}

#' Estimate the number of genes
#'
#' Given the number of pathways calculates the minimum number of possible genes
#' @param nPathways Numeric value of number of pathways
#' @return Numeric value of number of possible genes
#' @export
#' @examples
#' calc.nGenes(6)
calc.nGenes <- function(nPathways) {
  min_nGenes <- nPathways +1
  min_nGenes
}
