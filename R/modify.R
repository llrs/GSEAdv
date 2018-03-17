
#' @describeIn modify Drop a gene a pathway or both
#' @export
setMethod("drop",
          signature(object = "GeneSetCollection", gene = "ANY", pathway = "ANY"),
          function(object, gene, pathway) {
            paths2genes <- geneIds(object)
            if (length(gene) == 1 & length(pathway) == 1) {
              if (pathway %in% names(paths2genes)){
                match <- paths2genes[[pathway]] %in% gene
                if (match) {
                  paths2genes[[pathway]] <- paths2genes[[pathway]][!match]
                } else {
                  paths2genes[[pathway]] <- c(paths2genes[[pathway]], gene)
                }
              } else {
                paths2genes[[pathway]] <- gene
              }
            } else if (length(gene) >= 2 & length(pathway) == 1) {
              if (pathway %in% names(paths2genes)){
                match <- paths2genes[[pathway]] %in% gene
                if (match) {
                  # Doesn't hold
                  # FIXME!! if pathway is of length bigger than 2 and there are only two genes

                  paths2genes[[pathway]] <- paths2genes[[pathway]][!match]
                } else {
                  paths2genes[[pathway]] <- c(paths2genes[[pathway]], gene)
                }
              }
            } else if ( length(gene) == 1 & length(pathway) >= 2) {
              gene2paths <- inverseList(paths2genes)
              if (gene %in% names(gene2paths)) {
                match <- gene2paths[[gene]] %in% pathway
                if (match)
                  gene2paths[[gene]] <- "bu"
              }
            } # TODO: Simplify!! into three subfunctions
            as(inverseList(paths2genes), "GeneSetCollection")
          }
)




# Given a gene and a pathway modify the object
m <- function(obj, gene, pathway) {
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

# Given several genes and a patwhay modify the object
m2 <- function(obj, gene, pathway) {
  stopifnot(length(gene) > 1)
  stopifnot(length(pathway) == 1)

  paths2genes <- geneIds(obj)
  if (pathway %in% names(paths2genes)) {
    match <- paths2genes[[pathway]] %in% gene
    match2 <- gene %in% paths2genes[[pathway]]
    paths2genes[[pathway]] <- paths2genes[[pathway]][!match]
    paths2genes[[pathway]] <- c(paths2genes[[pathway]], gene[!match2])
  } else {
    paths2genes[[pathway]] <- genes
  }
  as(inverseList(paths2genes), "GeneSetCollection")
}

# TODO: FiXME add another case
# For ewhen several pathways and a single gene
