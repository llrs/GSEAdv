#' @describeIn genesSizePathways Calculates the number of pathways with the
#' same size for each gene
#' @export
setMethod("genesSizePathways",
          signature(object = "GeneSetCollection"),
          function(object) {
            object <- check(object)

            genes2paths <- inverseList(geneIds(object))
            gpp <- genesPerPathway(object)
            u_gpp <- unique(gpp)
            u_gpp <- u_gpp[order(u_gpp)]
            dimn <- list("SizePaths" = u_gpp, "Genes" = names(genes2paths))
            out <- matrix(0, ncol = length(genes2paths),
                          nrow = length(unique(gpp)),
                          dimnames = dimn)
            for (g in names(genes2paths)) {
              calc <- table(gpp[genes2paths[[g]]])
              out[names(calc), g] <- calc
            }
            out
          }
)