#' @describeIn modify Add or remove relationships between genes and gene sets
#' @export
setMethod("modify",
          signature(object = "GeneSetCollection", gene = "character", pathway = "character"),
          function(object, gene = NULL, pathway = NULL) {
            if (length(gene) == 1 & length(pathway) == 1 ) {
              modifyRel(object, gene, pathway)
            } else if (length(gene) > 1 & length(pathway) == 1) {
              modifyPathway(object, gene, pathway)
            } else if (length(gene) == 1 & length(pathway) > 1) {
              modifyGene(object, gene, pathway)
            } else {
              stop("Please check the input.\nSee the help page.")
              }
          }
)

# Given a gene and a pathway modify the object
modifyRel <- function(obj, gene, pathway) {
  stopifnot(length(gene) == 1)
  stopifnot(length(pathway) == 1)

  paths2genes <- geneIds(obj)
  if (pathway %in% names(paths2genes)) {
    if (gene %in% paths2genes[[pathway]]) {
      match <- paths2genes[[pathway]] %in% gene
      paths2genes[[pathway]] <- paths2genes[[pathway]][!match]
    } else {
      paths2genes[[pathway]] <- c(paths2genes[[pathway]], gene)
    }
  } else {
    warning("Impossible to add a new pathway with only one gene")
  }
  as(inverseList(paths2genes), "GeneSetCollection")
}

# Given several genes and a pathway modify the object
modifyPathway <- function(obj, gene, pathway) {
  stopifnot(length(gene) > 1)
  stopifnot(length(pathway) == 1)

  paths2genes <- geneIds(obj)
  if (pathway %in% names(paths2genes)) {
    match <- paths2genes[[pathway]] %in% gene
    match2 <- gene %in% paths2genes[[pathway]]
    paths2genes[[pathway]] <- paths2genes[[pathway]][!match]
    paths2genes[[pathway]] <- c(paths2genes[[pathway]], gene[!match2])
  } else {
    paths2genes[[pathway]] <- gene
  }
  as(inverseList(paths2genes), "GeneSetCollection")
}

# For when several pathways and a single gene
modifyGene <- function(obj, gene, pathway) {
  stopifnot(length(gene) == 1)
  stopifnot(length(pathway) > 1)

  paths2genes <- geneIds(obj)
  genes2paths <- inverseList(paths2genes)

  if (gene %in% names(genes2paths)) {
    match <- genes2paths[[gene]] %in% pathway
    match2 <- pathway %in% genes2paths[[gene]]
    genes2paths[[gene]] <- genes2paths[[gene]][!match]
    genes2paths[[gene]] <- c(genes2paths[[gene]], pathway[!match2])
  } else {
    genes2paths[[gene]] <- pathway
  }
  as(genes2paths, "GeneSetCollection")
}