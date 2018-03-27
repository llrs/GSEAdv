#' @describeIn nested Check if pathways are included in another pathway.
#' @export
setMethod("nested",
          signature(object = "GeneSetCollection"),
          function(object) {
  paths2genes <- geneIds(object)

  a <- function(x, y) {
    if (length(x) > length(y)) {
      0
    } else {
      ifelse(all(x %in% y), 1, 0)
    }
  }

  a_vec <- Vectorize(a, vectorize.args = c("x", "y"))
  outer(paths2genes, paths2genes, a_vec)
}
)