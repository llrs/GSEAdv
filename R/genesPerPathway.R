
genesPerPathway <- function(object) {
  warning("Did you want to use it in a GeneSetCollection?")
}

#' @describeIn genesPerPathway Calculates genes per pathway of the
#' GeneSetCollection
#' @exportMethod genesPerPathway
setMethod("genesPerPathway",
          "GeneSetCollection",
          function(object) {
            check_gsc(object)
            lengths(GSEABase::geneIds(object))
          }
)