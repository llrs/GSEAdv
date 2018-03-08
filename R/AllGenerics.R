#' Pathways per gene
#'
#' Calculates the pathways per gene of a GeneSetCollection. In set theory it is
#' called cardinality.
#' @param object A GeneSetCollection object
#' @return a list of pathways per genes
#' @author Lluís Revilla
#' @export pathwaysPerGene
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
#' @export genesPerPathway
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
#' @export gene
setGeneric("gene", function(object, gene) standardGeneric("gene") )

#' Statistics about pathways
#'
#' Calculates some statistics of the genes, like the biggest
#' pathway, the gene in more pathways, h-index and entropy or information
#' content for the genes per pathway and pathways for genes and they percentage
#' of the maximum.
#' Uses \code{\link{check}} to validate the input
#' @param object A GeneSetCollection object
#' @param pathway A character of the pathway to analyze. If missing it will analyze
#' all pathways
#' @return If a single pathway is provided invisible a list of statistics (the
#' statistics will be printed on the screen), otherwise the data.frame of
#' statistics.
#' @author Lluís Revilla
#' @export pathway
setGeneric("pathway", function(object, pathway)
  standardGeneric("pathway")
)

#' Conditional probability of pathway length given the number of pathways
#'
#' @param object A GeneSetCollection object
#' @return A matrix
#' @author Lluís Revilla
#' @export condGene
setGeneric("condGene", function(object) standardGeneric("condGene"))


#' Conditional probability of the number of pathways given pathways length
#'
#' Calculates the probability of a gene to have a number of pathways given the
#' size of pathways.
#'
#' Uses \code{\link{check}} to validate the output.
#' @param object A GeneSetCollection object
#' @return A matrix
#' @author Lluís Revilla
#' @export condPath
setGeneric("condPath", function(object) standardGeneric("condPath"))

#' Gene set size - gene relationship
#'
#' Calculates the number of gene sets of the same size a gene has.
#' @param object A GeneSetCollection object
#' @return A matrix
#' @author Lluís Revilla
#' @export genesSizePathways
setGeneric("genesSizePathways", function(object)
  standardGeneric("genesSizePathways"))

#' Number of genes
#'
#' Calculates the number of genes.
#' @param object A GeneSetCollection object
#' @return A number
#' @author Lluís Revilla
#' @export nGenes
setGeneric("nGenes", function(object)
  standardGeneric("nGenes"))

#' Number of GeneSets
#'
#' Calculates the number of GeneSets
#' @param object A GeneSetCollection object
#' @return A number
#' @author Lluís Revilla
#' @aliases nPaths
#' @aliases nGeneSets
#' @export nPathways
setGeneric("nPathways", function(object)
  standardGeneric("nPathways"))

#' Checks a GeneSetCollection
#'
#' Checks that all the collection types is the same. Issues a warning when a
#' GOCollection is detected. Checks tat all the geneIdTypes is the same for
#' all the GeneSets. Checks that a GeneSet is bigger or equal to two genes.
#' @param object A GeneSetCollection
#' @return A geneSetCollection
#' @export
setGeneric("check", function(object)
  standardGeneric("check"))

#' Checks isolated GeneSets
#'
#' Checks if any gene set has all the genes only present in that gene set.
#' @param object A GeneSetCollection
#' @return Invisible a logical value
#' @export isolation
setGeneric("isolation", function(object)
  standardGeneric("isolation"))

#' Remove from a GeneSetCollection
#'
#' Removes either genes or pathways of a GeneSetCollection if present
#' @param obj A GeneSetCollection object.
#' @param gene The number or names of the genes to be removed.
#' @param pathway The number or names of the pathways to be removed.
#' @return A GeneSetCollection object without those genes or pathways.
#' @note Remember that a GeneSet is defined as a group of genes (more than one),
#' and if one gene set has only one gene it is removed. Conversely, a gene is
#' removed if it doesn't belong to any GeneSet.
#' @export drop
setGeneric("drop", function(object, gene, pathway)
  standardGeneric("drop"))

#' Remove a relationship from a GeneSetCollection
#'
#' Removes a gene-pathway relationship of a GeneSetCollection if present.
#' @param obj A GeneSetCollection object.
#' @param gene The name of the gene.
#' @param pathway The name of the pathway.
#' @return A GeneSetCollection object without that relationship.
#' @note Remember that a GeneSet is defined as a group of genes (more than one),
#' and if one gene set has only one gene it is removed. Conversely, a gene is
#' removed if it doesn't belong to any GeneSet.
#' @export dropRel
setGeneric("dropRel", function(object, gene, pathway)
  standardGeneric("dropRel"))