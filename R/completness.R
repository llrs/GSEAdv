#' Number of possible combinations
#'
#' Calculates the number of combinations of each size.
#' @param x A numeric vector
#' @return A named numeric vector
#' @export
#' @examples
#' genesPerPathway <- c(2, 4, 5, 8, 5, 8)
#' completness(genesPerPathway)
completness <- function(x){
  iter <- seq_len(max(x))
  out <- vapply(iter, choose, FUN.VALUE = numeric(1), n = length(x))
  names(out) <- as.character(iter)
  out
}

