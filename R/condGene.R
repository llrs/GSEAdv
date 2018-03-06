#' @describeIn condGene Given the number of pathways calculates the probability
#' of having a size of gene set
#' @export
setMethod("condGene",
          signature(object = "GeneSetCollection"),
          function(object) {
            object <- check(object)

            gpp <- genesPerPathway(object)
            ppg <- pathwaysPerGene(object)

            uPPG <- unique(ppg)
            uGPP <- unique(gpp)
            # Create the matrix to fill
            m <- matrix(0, ncol = length(uPPG), nrow = length(uGPP),
                        dimnames =
                          list("genesPerPathway" = uGPP[order(uGPP)],
                               "pathwaysPerGene" = uPPG[order(uPPG)]))

            paths2genes <- GSEABase::geneIds(object)
            genes2paths <- inverseList(paths2genes)

            # Find the genes with those pathways
            for (g in colnames(m)) {
              genes <- names(ppg)[ppg == g]
              paths <- unique(unlist(genes2paths[genes], use.names = FALSE))
              subGPP <- gpp[paths]
              # Find the pathways with those number of genes
              for (pSize in rownames(m)) {
                if (length(pSize) == 0) {
                  m[pSize, g] <- 0
                }
                m[pSize, g] <- sum(subGPP == pSize, na.rm = TRUE)/length(subGPP)
              }
            }
            m
          }
)