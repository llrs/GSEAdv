#' Convert a list or a Bimap interface into GeneSetCollections
#'
#' Transform the list or Bimap structure into a GeneSetCollection with unique
#' gene identifiers an pathnames.
#' @param object A list of genes and their pathways or an AnnDbBimap.
#' @param ... Other unused parameters passed down.
#' @return A GeneSetCollection
#' @author Lluís Revilla
#' @export as.GeneSetCollection
#' @seealso \code{\link[GSEABase]{GeneSetCollection}}
setGeneric("as.GeneSetCollection", function(object, ...)
  standardGeneric("as.GeneSetCollection")
)

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
#' Calculates the number of genes in a pathway of a given size, separated by the
#' number of pathways each gene has.
#' @param object A GeneSetCollection object
#' @return A matrix
#' @author Lluís Revilla
#' @seealso \code{\link{condPath}}
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
#' @seealso \code{\link{condGene}}
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
#' @seealso \code{\link{independence}}
#' @export isolation
setGeneric("isolation", function(object)
  standardGeneric("isolation"))

#' Checks independence of genes
#'
#' Checks if all the genes are only present in one gene set
#' @param object A GeneSetCollection
#' @return \code{TRUE} or \code{FALSE}.
#' @seealso \code{\link{isolation}}
#' @export independence
setGeneric("independence", function(object)
  standardGeneric("independence"))

#' Remove from a GeneSetCollection
#'
#' Removes either genes or pathways of a GeneSetCollection if present
#' @param object A GeneSetCollection object.
#' @param gene The number or names of the genes to be removed.
#' @param pathway The number or names of the pathways to be removed.
#' @return A GeneSetCollection object without those genes or pathways.
#' @note Remember that a GeneSet is defined as a group of genes (more than one),
#' and if one gene set has only one gene it is removed. Conversely, a gene is
#' removed if it doesn't belong to any GeneSet.
#' @export drop
setGeneric("drop", function(object, gene, pathway)
  standardGeneric("drop"))

#' Modify a relationship
#'
#' Given a GeneSetCollection adds or remove a relationship between a gene and a
#' pathway.
#'
#' It accepts one gene and one pathway, several genes and one pathway and
#' several pathways and one gene, but not several pathways and several genes.
#' @param gene A vector of character with genes.
#' @param pathway A vector of character with pathways.
#' @param object A GeneSetCollection
#' @return A GeneSetCollection with those relationships flipped.
#' @seealso \code{\link{drop}} To just remove a gene or a pathways
#' @export modify
setGeneric("modify", function(object, gene, pathway)
  standardGeneric("modify"))

#' Number of genes in pathways of genes
#'
#' Calculates the number of pathways per gene in pathways.
#' @param gene A vector of character with genes.
#' @param object A GeneSetCollection
#' @return A matrix or a list of vectors if only some genes are requested
#' @seealso \code{\link{sizePathways}} To equivalent for pathways
#' @export sizeGenes
setGeneric("sizeGenes", function(object, gene)
  standardGeneric("sizeGenes"))

#' Number of pathways in genes of pathways
#'
#' Calculates the number of pathways per gene in pathways.
#'
#' @param pathway A vector of character with pathways.
#' @param object A GeneSetCollection
#' @return A matrix or a list of vectors if only some pathways are requested
#' @seealso \code{\link{sizeGenes}} The equivalent for genes
#' @export sizePathways
setGeneric("sizePathways", function(object,pathway)
  standardGeneric("sizePathways"))