#' Invert a list
#'
#' Calculate the pathways per gene of list
#'
#' @param x A list with genes as names and names of pathways as values of the
#' list
#' @return The number of pathways each gene has.
#' @author Lluís Revilla
#' @keywords internal
inverseList <- function(x) {
  stopifnot(length(names(x)) == length(x))
  stopifnot(all(vapply(x, is.character, logical(1))))
  genes <- unlist(x, use.names = FALSE)
  pathways <- rep(names(x), lengths(x))
  split(pathways, genes)
}

#' Calculate the information content or entropy
#'
#' @param x The values to calculate
#' @return The numeric value of entropy
#' @author Lluís Revilla
#' @keywords internal
IC <- function(x) {
  freq <- table(x) / length(x)
  -sum(freq * log2(freq))
}
#' Calculate the maximal information content or entropy
#'
#' @param x The values to calculate
#' @return The numeric value of max entropy that can be achieved
#' @author Lluís Revilla
#' @keywords internal
maxIC <- function(x) {
  tab <- table(x)
  freq <- rep(1 / length(tab), length(tab))
  -sum(freq * log2(freq))
}

#' Calculates H-index
#'
#' Given a table find which is the h-index of the data
#' @param x The table or values to calculate the h-index from it.
#' @return The numeric value of the h.index
#' @author Lluís Revilla
#' @keywords internal
h_index <- function(x) {
  if (!is(x, "table")) {
    x <- table(x)
  }
  position <- x - as.numeric(names(x))

  return(max(0, as.numeric(names(x)[position >= 0])))
}

#' Give a name to a vector
#'
#' Given a numeric vector sets names
#' @param x The numeric vector
#' @param pre The prefix for the names of the vector
#' @return the same vector with names
#' names_vec(1:3, "GS_")
#' @keywords internal
names_vec <- function(x, pre){
  stopifnot(is.numeric(x))

  if (is.null(names(x))) {
    nam <- paste0(pre, seq_along(x))
    names(x) <- nam
  }
  x
}
