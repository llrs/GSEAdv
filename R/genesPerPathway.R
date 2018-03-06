#' @export
genesPerPathway <- function(object) {
  warning("Did you want to use it in a GeneSetCollection?")
}

#' @describeIn genesPerPathway Calculates genes per pathway of the
#' GeneSetCollection
#' @export
setMethod("genesPerPathway",
          "GeneSetCollection",
          function(object) {
            object <- check(object)
            lengths(GSEABase::geneIds(object))
          }
)