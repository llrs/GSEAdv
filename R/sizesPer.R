nUnique <- function(x) {
  length(unique(x))
}

unique_translate <- function(x, data){
  nUnique(data[x])
}

#' @describeIn sizesPerGene Number of sizes of pathways per all the genes
#' @export
setMethod("sizesPerGene",
          signature(object = "GeneSetCollection", genes = "missing"),
          function(object){
            object <- check(object)
            paths2genes <- geneIds(object)
            gpp <- lengths(paths2genes)
            genes2paths <- inverseList(paths2genes)

            vapply(genes2paths, unique_translate, numeric(1), data = gpp)
          }
)

#' @describeIn sizesPerGene Number of sizes of pathways per the provided genes
#' @export
setMethod("sizesPerGene",
          signature(object = "GeneSetCollection", genes = "character"),
          function(object, genes){
            object <- check(object)
            paths2genes <- geneIds(object)
            gpp <- lengths(paths2genes)
            genes2paths <- inverseList(paths2genes)
            keep <- genes %in% names(genes2paths)
            if (sum(keep) == 0) {
              stop("All genes were not in the GeneSetCollection provided")
            } else if (sum(keep) < length(keep)) {
              warning("Some genes are not in the GeneSetCollection provided")
            }
            genes <- genes[keep]
            vapply(genes2paths[genes], unique_translate, numeric(1), data = gpp)
          }
)

#' @describeIn sizesPerPathway Number of sizes of genes per all pathways.
#' @export
setMethod("sizesPerPathway",
          signature(object = "GeneSetCollection", pathways = "missing"),
          function(object){
            object <- check(object)
            paths2genes <- geneIds(object)
            genes2paths <- inverseList(paths2genes)
            ppg <- lengths(genes2paths)

            vapply(paths2genes, unique_translate, numeric(1), data = ppg)

          }
)

#' @describeIn sizesPerPathway Number of sizes of genes per pathways provided
#' @export
setMethod("sizesPerPathway",
          signature(object = "GeneSetCollection", pathways = "character"),
          function(object, pathways){
            object <- check(object)
            paths2genes <- geneIds(object)
            genes2paths <- inverseList(paths2genes)

            keep <- pathways %in% names(paths2genes)
            if (sum(keep) == 0) {
              stop("All pathways were not in the GeneSetCollection provided")
            } else if (sum(keep) < length(keep)) {
              warning("Some pathways are not in the GeneSetCollection provided.
                      Omitting them.")
            }
            pathways <- pathways[keep]

            ppg <- lengths(genes2paths)
            vapply(paths2genes[pathways], unique_translate,
                   numeric(1), data = ppg)

          }
)