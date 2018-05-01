#' GSEAdv: A package for analyzing gene sets.
#'
#' The GSEAdv package provides methods enhancing the GSEABase package. Mainly it
#' address thre points related to GeneSetCollections, describe, analyze, and
#' simulate them. Each one has a specific vignette.
#'
#' @section GSEAdv methods:
#' There are several new methods for GeneSetCollections
#' - \code{\link[GSEAdv]{summary}}: Some statistics of the GeneSetCollection.
#' - \code{\link{genesPerPathway}}: The number of genes each gene set has.
#' - \code{\link{pathwaysPerGene}}: The number of gene sets each gene has.
#' - \code{\link{pathway}}: Information about a gene set.
#' - \code{\link{gene}}: Information about a gene.
#' - \code{\link{condPerGenes}}: The conditional probability of the length of a
#' pathway given the numer of gene sets a gene is in.
#' - \code{\link{condPerPathways}}: The conditional probability of the numer of gene
#' sets a gene is in given the length of a gene set.
#'  - \code{\link{sizePathways}}
#'  - \code{\link{sizeGenes}}
#' @docType package
#' @name GSEAdv
#' @import GSEABase
#' @import methods
NULL

#' A GeneSetCollection
#'
#' A version of pathways of the KEGG database from the org.Hs.eg.db package
#' @format A GeneSetCollection
#' @source \code{as.GeneSetCollection(org.Hs.egPATH)}
"genesKegg"

#' A GeneSetCollection
#'
#' A small GeneSetCollection to test and do examples with
#' @format A GeneSetCollection
#' @source Derived from genesKegg
"Info"