#' @describeIn sizeGenes Number of genes per pathway in all genes
#' @examples
#' sizeGenes(Info)
#' @export
setMethod("sizeGenes",
          signature(object = "GeneSetCollection", gene = "missing"),
          function(object) {
            object <- check(object)

            paths2genes <- geneIds(object)
            genes2paths <- inverseList(paths2genes)
            m <- helper_sizes(genes2paths, paths2genes)
            names(dimnames(m)) <- c("genePerPathway", "Gene")
            m
          }
)

#' @describeIn sizeGenes Number of genes per pathway in all genes
#' @examples
#' sizeGenes(Info, "2")
#' sizeGenes(Info, c("2", "3"))
#' @export
setMethod("sizeGenes",
          signature(object = "GeneSetCollection", gene = "character"),
          function(object, gene) {
            object <- check(object)

            gene2paths <- inverseList(geneIds(object))

            # Handles missing genes
            if (any(!gene %in% names(gene2paths))) {
              keep <- gene %in% names(gene2paths)
              if (sum(keep) >= 1) {
                remove <- gene[!keep]
                gene <- gene[keep]
                warning("Omitting ", sum(keep), " genes not present.")
              } else {
                stop("No provided gene is present.")
              }
            }

            m <- helper_sizes(gene2paths[gene], inverseList(gene2paths))
            names(dimnames(m)) <- c("genePerPathway", "Gene")
            m
          }
)

#' @describeIn sizePathways Number of pathways per gene in all pathways
#' @examples
#' sizePathways(Info)
#' @export
setMethod("sizePathways",
          signature(object = "GeneSetCollection", pathway = "missing"),
          function(object) {

            object <- check(object)
            paths2genes <- geneIds(object)
            genes2paths <- inverseList(paths2genes)
            m <- helper_sizes(paths2genes, genes2paths)
            names(dimnames(m)) <- c("pathwaysPerGene", "Pathway")
            m
          }
)


#' @describeIn sizePathways Number of pathways per gene in all pathways
#' @examples
#' sizePathways(Info, "1430728")
#' sizePathways(Info, c("1430728", "156580"))
#' @export
setMethod("sizePathways",
          signature(object = "GeneSetCollection", pathway = "character"),
          function(object, pathway) {

            object <- check(object)

            path2gene <- geneIds(object)


            # Handles missing genes
            if (any(!pathway %in% names(path2gene))) {
              keep <- pathway %in% names(path2gene)
              if (sum(keep) >= 1) {
                remove <- pathway[!keep]
                pathway <- pathway[keep]
                warning("Omitting ", sum(keep), " pathway not present.")
              } else {
                stop("No provided pathway is present.")
              }
            }

            m <- helper_sizes(path2gene[pathway], inverseList(path2gene))
            names(dimnames(m)) <- c("pathwaysPerGene", "Pathway")
            m
          }
)

#' Helper for sizes
#'
#' Calculates the sizes of the input
#' @param data1 The list of genes to pathways or of pathways to genes
#' @param data2 The inverse of the other
#' @return A matrix with the sizes of the data grouped
#' @keywords internal
helper_sizes <- function(data1, data2){

  stopifnot(is.list(data1))
  stopifnot(is.list(data2))
  size_data2 <- lengths(data2)
  sizes <- as.character(unique(lengths(data2)))
  u_sizes <- sizes[order(sizes, decreasing = FALSE)]

  # Create the matrix to fill
  m <- matrix(0, ncol = length(names(data1)), nrow = length(sizes),
              dimnames = list(u_sizes, names(data1)))
  m <- m[order(as.numeric(rownames(m))), , drop = FALSE]

  for (obj in colnames(m)) {
    groups <- data1[[obj]]
    pSize <- table(size_data2[groups])
    m[names(pSize), obj] <- pSize
  }

  m[rowSums(m, na.rm = TRUE) != 0, , drop = FALSE]
}
