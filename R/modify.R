#' @describeIn modify Add or remove relationships between genes and gene sets
#' @examples
#' modify(Info, "Gene2", "156580")
#' modify(Info, c("Gene2", "Gene3"), "156580")
#' modify(Info, "Gene2", c("156580", "211859"))
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
    paths2genes <- helper_modify(paths2genes, pathway, gene)
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
  paths2genes <- helper_modify(paths2genes, pathway, gene)
  as(inverseList(paths2genes), "GeneSetCollection")
}

# For when several pathways and a single gene
modifyGene <- function(obj, gene, pathway) {
  stopifnot(length(gene) == 1)
  stopifnot(length(pathway) > 1)

  paths2genes <- geneIds(obj)
  genes2paths <- inverseList(paths2genes)

  genes2paths <- helper_modify(genes2paths, gene, pathway)
  as(genes2paths, "GeneSetCollection")
}

# Adds or removes values of a list
helper_modify <- function(l, key, value) {
  if (key %in% names(l)) {
    keep <- l[[key]] %in% value # values to remove
    remove <- value %in% l[[key]] #  values to keep
    l[[key]] <- unique(c(l[[key]][!keep], value[!remove]))
  } else {
    l[[key]] <- value
  }
  l
}