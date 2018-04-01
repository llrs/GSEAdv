#' @describeIn duplicatedGenes Checks if different genes are described as
#' the same combination of pathways
#' @export
setMethod("duplicatedGenes",
          signature(object = "GeneSetCollection"),
          function(object) {
            any(duplicated(t(incidence(object))))
          }
)
#' @describeIn duplicatedPathways Checks if a different pathways are described
#' as the same combination of genes.
#' @export
setMethod("duplicatedPathways",
          signature(object = "GeneSetCollection"),
          function(object) {
            any(duplicated(incidence(object)))
          }
)