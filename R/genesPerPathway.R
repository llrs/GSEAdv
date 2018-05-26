#' @export
genesPerPathway <- function(object) {
  stop("Did you want to use it in a GeneSetCollection?")
}

#' @describeIn genesPerPathway Calculates genes per pathway of the
#' GeneSetCollection
#' @export
setMethod("genesPerPathway",
          "GeneSetCollection",
          function(object) {
            lengths(geneIds(object))
          }
)