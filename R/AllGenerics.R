#' Pathways per gene
#'
#' Calculates the pathways per gene of a GeneSetCollection
#' @param object A GeneSetCollection object
#' @return a list of pathways per genes
#' @author Lluís Revilla
#' @aliases pathwaysPerGene
#' @exportMethod pathwaysPerGene
#' @seealso \code{\link{genesPerPathway}}
setGeneric("pathwaysPerGene", function(object) {
  standardGeneric("pathwaysPerGene")
})

#' Genes per pathway
#'
#' Calculates the genes per pathway of a GeneSetCollection
#' @param object A GeneSetCollection object
#' @return A list of genes per pathway.
#' @author Lluís Revilla
#' @aliases genesPerPathway
#' @exportMethod genesPerPathway
#' @seealso \code{\link{pathwaysPerGene}}
setGeneric("genesPerPathway", function(object) {
  standardGeneric("genesPerPathway")
})
