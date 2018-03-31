#' @describeIn add Add relationships between genes and gene sets
#' @export
setMethod("add",
          signature(object = "GeneSetCollection", gene = "character", pathway = "character"),
          function(object, gene = NULL, pathway = NULL) {
            if (length(gene) == 1 & length(pathway) == 1 ) {
              addRel(object, gene, pathway)
            } else if (length(gene) > 1 & length(pathway) == 1) {
              addGenes(object, gene, pathway)
            } else if (length(gene) == 1 & length(pathway) > 1) {
              addPathways(object, gene, pathway)
            } else {
              stop("Please check the input.\nSee the help page.")
            }
          }
)

# Given a gene and a pathway modify the object
addRel <- function(obj, gene, pathway) {
  stopifnot(length(gene) == 1)
  stopifnot(length(pathway) == 1)

  paths2genes <- geneIds(obj)
  paths2genes[[pathway]] <- c(paths2genes[[pathway]], gene)
  as(inverseList(paths2genes), "GeneSetCollection")
}

# Given several genes and a pathway modify the object
addGenes <- function(obj, gene, pathway) {
  stopifnot(length(gene) > 1)
  stopifnot(length(pathway) == 1)

  paths2genes <- geneIds(obj)
  if (pathway %in% names(paths2genes)) {
    paths2genes[[pathway]] <- c(paths2genes[[pathway]], gene)
  } else {
    paths2genes[[pathway]] <- gene
  }

  as(inverseList(paths2genes), "GeneSetCollection")
}

# For when several pathways and a single gene
addPathways <- function(obj, gene, pathway) {
  stopifnot(length(gene) == 1)
  stopifnot(length(pathway) > 1)

  paths2genes <- geneIds(obj)
  genes2paths <- inverseList(paths2genes)

  if (gene %in% names(genes2paths)) {
    genes2paths[[gene]] <- c(genes2paths[[gene]], pathway)
  } else {
    genes2paths[[gene]] <- pathway
  }
  as(genes2paths, "GeneSetCollection")
}