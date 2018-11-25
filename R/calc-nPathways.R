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

#' Estimate the max number of genes
#'
#' Given the number of pathways calculates the max number of possible genes
#' @param nPathways Numeric value of number of pathways
#' @return Numeric value of number of possible genes
#' @export
#' @examples
#' calc.max.nGenes(6)
calc.max.nGenes <- function(nPathways) {
  nPathways * 2
}

#' Estimate the min number of genes
#'
#' Given the number of pathways calculates the min number of possible genes
#' @param nPathways Numeric value of number of pathways
#' @return Numeric value of number of possible genes
#' @export
#' @examples
#' calc.min.nGenes(6)
calc.min.nGenes <- function(nPathways) {
  nGenes <- seq_len(ceiling(nPathways-1))
  g <- choose(nGenes, 2)
  min(nGenes[g>=nPathways])
}
