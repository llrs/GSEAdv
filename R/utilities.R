#' Inverts a list
#'
#' @param x A list with tags and values
#' @return The same list but the values are now the tags
#' @author Lluís Revilla
#' @keywords internal
inverseList <- function(x) {
  l <- equalize(x)
  split(l$b, l$a)
}

#' Convert to characters
#'
#' @param x A list with keys and values
#' @return A list with two elements all the keys and all the values associated
#' @author Lluís Revilla
#' @keywords internal
equalize <- function(x) {
  stopifnot(length(names(x)) == length(x))
  stopifnot(all(vapply(x, is.character, logical(1))))
  a <- unlist(x, use.names = FALSE)
  b <- rep(names(x), lengths(x))
  list("a" = a, "b" = b)
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
