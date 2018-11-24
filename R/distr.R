
# @param x Matrix with dimnames
# @return A matrix with the distribution of the elements
helper_distr <- function(x) {
  d <- diag(x)
  y <- table(x, row(x))
  colnames(y) <- colnames(x)
  for (i in seq_along(d)) {
    rowName <- as.character(d[i])
    y[rowName, i] <- y[rowName, i]-1
  }
  y
}

#' @describeIn distrGenes Calculates pathways shared with other genes of the
#' GeneSetCollection.
#' @export
setMethod("distrGenes",
          signature = c("GeneSetCollection"),
          function(object) {
            y <- helper_distr(crossprod(incidence(object)))
            names(dimnames(y)) <- c("Shared", "Genes")
            y
          }
)

#' @describeIn distrPathways Calculates genes shared with other pathways of the
#' GeneSetCollection.
#' @export
setMethod("distrPathways",
          signature = c("GeneSetCollection"),
          function(object){
            y <- helper_distr(tcrossprod(incidence(object)))
            names(dimnames(y)) <- c("Shared", "Pathways")
            y
          }
)