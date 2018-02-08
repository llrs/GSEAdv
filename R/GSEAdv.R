#' GSEAdv: A package for analyzing gene sets.
#'
#' The GSEAdv package provides methods enhancing the GSEABase package
#'
#' @section GSEAdv methods:
#' - \code{\link[GSEAdv]{summary}}: Some statistics of the GeneSetCollection.
#' - \code{\link{genesPerPathway}}: The number of genes each gene set has.
#' - \code{\link{pathwaysPerGene}}: The number of gene sets each gene has.
#' - \code{\link{pathway}}: Information about a gene set.
#' - \code{\link{gene}}: Information about a gene.
#' - \code{\link{condGene}}: The conditional probability of the length of a
#' pathway given the numer of gene sets a gene is in.
#' - \code{\link{condPath}}: The conditional probability of the numer of gene
#' sets a gene is in given the length of a gene set.
#'  - \code{\link{genesSizePathways}}
#' @docType package
#' @name GSEAdv
#' @import GSEABase
#' @import methods
NULL