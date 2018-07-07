#' @export
genesPerPathway <- function(object, pathways) {
  stop("Did you want to use it in a GeneSetCollection with some pathways?")
}

#' @describeIn genesPerPathway Calculates genes per pathway of all the
#' GeneSetCollection
#' @examples
#' genesPerPathway(Info)
#' @export
setMethod("genesPerPathway",
          signature = c("GeneSetCollection", "missing"),
          function(object) {
            lengths(geneIds(object))
          }
)


#' @describeIn genesPerPathway Calculates genes per pathway of the
#' GeneSetCollection for those pathways
#' @examples
#' genesPerPathway(Info, "1430728")
#' @export
setMethod("genesPerPathway",
          signature = c("GeneSetCollection", "character"),
          function(object, pathways) {

            pathways <- unique(pathways)
            paths2genes <- geneIds(object)
            pathsInGSC <- pathways %in% names(paths2genes)
            msg <- "Pathways not present in the GeneSetCollection were omitted."
            if (any(pathsInGSC)){
              pathways <- pathways[pathsInGSC]
              if (!all(pathsInGSC)) {
                warning(msg)
              }
              lengths(paths2genes[pathways])
            } else {
              stop("Pathways were not present in the GeneSetCollection")
            }
          }
)