#' Invert a list
#'
#' Calculate the pathways per gene of an incidence matrix
#'
#' @param incidence Incidence matrix
#' @return The number of pathways each gene has
#' @keywords internal
inverseList <- function(x) {
  genes <- unlist(x, use.names = FALSE)
  pathways <- rep(names(x), lengths(x))
  split(pathways, genes)
}