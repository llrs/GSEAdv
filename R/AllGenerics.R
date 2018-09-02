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
#' @param object A GeneSetCollection object.
#' @param genes A character vector of genes.
#' @return A numeric vector of pathways per genes.
#' @author Lluís Revilla
#' @export pathwaysPerGene
#' @seealso \code{\link{genesPerPathway}}
setGeneric("pathwaysPerGene", function(object, genes) {
  standardGeneric("pathwaysPerGene")
})

#' Genes per pathway
#'
#' Calculates the genes per pathway of a GeneSetCollection
#' @param object A GeneSetCollection object.
#' @param pathways A character vector of the pathways.
#' @return A numeric vector of genes per pathway.
#' @author Lluís Revilla
#' @export genesPerPathway
#' @seealso \code{\link{pathwaysPerGene}}
setGeneric("genesPerPathway", function(object, pathways) {
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
#' @examples
#' isTRUE(check(Info))
#' @export
setGeneric("check", function(object)
  standardGeneric("check"))

#' Checks isolated GeneSets
#'
#' Checks if any gene set has all the genes only present in that gene set.
#' @param object A GeneSetCollection
#' @return \code{TRUE} if there is a gene set where all its genes are only present on this gene set.
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
#' Removes either genes or pathways of a GeneSetCollection if present.
#' @param object A GeneSetCollection object.
#' @param gene The number or names of the genes to be removed.
#' @param pathway The number or names of the pathways to be removed.
#' @return A GeneSetCollection object without those genes or pathways.
#' @note Remember that a GeneSet is defined as a group of genes (more than one),
#' and if one gene set has only one gene it is removed. Conversely, a gene is
#' removed if it doesn't belong to any GeneSet.
#' @seealso
#' \code{\link{add}} To just add a relationship.
#' \code{\link{modify}} To remove and add relationship at once.
#' @export drop
setGeneric("drop", function(object, gene, pathway)
  standardGeneric("drop"))

#' Remove a relationship from a GeneSetCollection
#'
#' Removes a relationship between genes and a pathway of a GeneSetCollection
#' @inheritParams drop
#' @seealso
#' \code{\link{add}} To just add a relationship.
#' \code{\link{modify}} To remove and add relationship at once.
#' \code{\link{drop}} To remove genes and pathways.
#' @export
setGeneric("dropRel", function(object, gene, pathway)
  standardGeneric("dropRel"))

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
#' @seealso
#' \code{\link{drop}} To just remove a gene or a pathways
#' \code{\link{add}} To just add a relationship.
#' @export modify
setGeneric("modify", function(object, gene, pathway)
  standardGeneric("modify"))

#' Add a relationship
#'
#' Given a GeneSetCollection adds a relationship between a gene and a
#' pathway.
#'
#' It accepts one gene and one pathway, several genes and one pathway and
#' several pathways and one gene, but not several pathways and several genes.
#' @param gene A vector of character with genes.
#' @param pathway A vector of character with pathways.
#' @param object A GeneSetCollection
#' @return A GeneSetCollection with those relationships added.
#' @seealso
#'  \code{\link{drop}} To just remove a gene or a pathways.
#'  \code{\link{modify}} To remove and add relationship at once.
#' @export add
setGeneric("add", function(object, gene, pathway)
  standardGeneric("add"))

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
setGeneric("sizePathways", function(object, pathway)
  standardGeneric("sizePathways"))


#' Duplicated genes
#'
#' Check if there are some pathways that are only present in the same genes.
#'
#' @param object A GeneSetCollection
#' @return If some genes are duplicated returns \code{TRUE} else \code{FALSE}
#' @seealso \code{\link{duplicatedPathways}}
#' @export duplicatedGenes
setGeneric("duplicatedGenes", function(object)
  standardGeneric("duplicatedGenes"))

#' Duplicated pathways
#'
#' Check if there are some genes that are only present in the same pathways.
#'
#' @param object A GeneSetCollection
#' @return  If some pathways are duplicated returns \code{TRUE} else \code{FALSE}
#' @seealso \code{\link{duplicatedGenes}}
#' @export duplicatedPathways
setGeneric("duplicatedPathways", function(object)
  standardGeneric("duplicatedPathways"))

#' Pathways included in other pathways
#'
#' Check if all the genes of a pathway are inside another pathway.
#' @param object A GeneSetCollection
#' @return A matrix with 1 if they are included and 0 if not. 1
#' means that the pathways on the rows are in the ones of the columns
#' @export nested
#' @seealso \code{\link{compare}}
setGeneric("nested", function(object)
  standardGeneric("nested"))


#' Conditional probability by genes per pathway
#'
#' Calculates the probability of having a number of pathways per gene given the
#' number of genes in a pathway
#' @param object A GeneSetCollection
#' @param genesPerPathway A numeric vector of the number of genes per pathways.
#' @return A matrix with the probabilities
#' @author Lluís Revilla Sancho
#' @seealso \code{\link{condPerPathways}}
#' @export condPerGenes
setGeneric("condPerGenes", function(object, genesPerPathway)
  standardGeneric("condPerGenes"))

#' Conditional probability by genes per pathway
#'
#' Calculates the probability of having a number of genes per pathway given the
#' number of pathways in a gene
#' @param object A GeneSetCollection
#' @param pathwaysPerGene A numeric vector of the number of pathways per genes.
#' @return A matrix with the probabilities
#' @author Lluís Revilla Sancho
#' @export condPerPathways
#' @seealso \code{\link{condPerGenes}}
setGeneric("condPerPathways", function(object, pathwaysPerGene)
  standardGeneric("condPerPathways"))

#' Number of different size of pathways per gene
#'
#' How many pathways of different length a gene is involved in.
#' @param object A GeneSetCollection
#' @param genes A character gene.
#' @return A vector with the number of different pathways sizes of the genes.
#' @author Lluís Revilla Sancho
#' @seealso  \code{\link{sizesPerPathway}}
#' @export sizesPerGene
setGeneric("sizesPerGene", function(object, genes)
  standardGeneric("sizesPerGene"))

#' Number of different sizes of gene per pathway
#'
#' How many genes of different length a pathway is involved in.
#' @param object A GeneSetCollection
#' @param pathways A character vector of the pathways-
#' @return A vector with the number of different gene sizes of the pathays
#' @author Lluís Revilla Sancho
#' @seealso  \code{\link{sizesPerGene}}
#' @export sizesPerPathway
setGeneric("sizesPerPathway", function(object, pathways)
  standardGeneric("sizesPerPathway"))

#' Number genes related to a gene
#'
#' How many genes of different length a pathway is involved in.
#' @param object A GeneSetCollection
#' @param genes A character vector of the genes.
#' @param unique A logical, to choose between unique genes or not.
#' @return A vector with the number of genes related to each gene.
#' @author Lluís Revilla Sancho
#' @seealso  \code{\link{pathwaysPerGene}}
#' @export genesPerGene
setGeneric("genesPerGene", function(object, genes, unique = TRUE)
  standardGeneric("genesPerGene"))


#' The combinations of genes per pathways
#'
#' The number of combinations that can lead to the current
#' distribution of genes per pathway
#' @return A numeric value
#' @param object A \code{GeneSetCollection}
#' @seealso  \code{\link{combnPPG}}
#' @export combnGPP
setGeneric("combnGPP", function(object)
  standardGeneric("combnGPP"))

#' The combinations of pathways per gene
#'
#' The number of combinations that can lead to the current
#' distribution of pathways per genes
#' @param object A \code{GeneSetCollection}
#' @return A numeric value
#' @author Lluís Revilla Sancho
#' @seealso  \code{\link{combnGPP}}
#' @export combnPPG
setGeneric("combnPPG", function(object)
  standardGeneric("combnPPG"))
