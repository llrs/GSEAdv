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

#' Statistics about genes
#'
#' Calculates some statistics of the genes, like the biggest
#' pathway, the gene in more pathways, h-index and entropy or information
#' content for the genes per pathway and pathways for genes and they percentage
#' of the maximum.
#' @param object A GeneSetCollection object
#' @param gene A character of the gene to analyze. If missing it will analyze
#' all genes
#' @return If a single gene is provided invisible a list of statistics (the
#' statistics will be printed on the screen), otherwise the data.frame of
#' statistics.
#' @author Lluís Revilla
#' @exportMethod gene
setGeneric("gene", function(object, gene) standardGeneric("gene") )

#' Statistics about pathways
#'
#' Calculates some statistics of the genes, like the biggest
#' pathway, the gene in more pathways, h-index and entropy or information
#' content for the genes per pathway and pathways for genes and they percentage
#' of the maximum.
#' @param object A GeneSetCollection object
#' @param pathway A character of the pathway to analyze. If missing it will analyze
#' all pathways
#' @return If a single pathway is provided invisible a list of statistics (the
#' statistics will be printed on the screen), otherwise the data.frame of
#' statistics.
#' @author Lluís Revilla
#' @exportMethod pathway
setGeneric("pathway", function(object, pathway)
  standardGeneric("pathway")
)

#' Conditional probability of pathway length given the number of pathways
#'
#' @param object A GeneSetCollection object
#' @return A matrix
#' @author Lluís Revilla
#' @exportMethod condGene
setGeneric("condGene", function(object) standardGeneric("condGene"))


#' Conditional probability of the number of pathways given a pathway length
#'
#' @param object A GeneSetCollection object
#' @return A matrix
#' @author Lluís Revilla
#' @exportMethod condPath
setGeneric("condPath", function(object) standardGeneric("condPath"))

#' Gene set size - gene relationship
#'
#' Calculates the number of gene sets of the same size a gene has.
#' @param object A GeneSetCollection object
#' @return A matrix
#' @author Lluís Revilla
#' @exportMethod genesSizePathways
setGeneric("genesSizePathways", function(object)
  standardGeneric("genesSizePathways"))