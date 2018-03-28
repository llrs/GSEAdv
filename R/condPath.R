#' @describeIn condGene Given the size of gene set calculates the probability
#' of having a number of pathways
#' @export
setMethod("condPath",
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
                          list("GenesPerPathway" = uGPP[order(uGPP)],
                               "PathwaysPerGene" = uPPG[order(uPPG)]))

            paths2genes <- geneIds(object)
            genes2paths <- inverseList(paths2genes)

            # Find the genes with those pathways
            for (p in rownames(m)) {
              paths <- names(gpp)[gpp == p]
              genes <- unlist(paths2genes[paths], use.names = FALSE)
              subPPG <- ppg[genes]
              # Find the pathways with those number of genes
              for (gSize in colnames(m)) {
                if (length(gSize) == 0) {
                  m[p, gSize] <- 0
                }
                m[p, gSize] <- sum(subPPG == gSize, na.rm = TRUE)
              }
            }
            m
          }
)