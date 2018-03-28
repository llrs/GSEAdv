#' @describeIn sizeGenes Number of genes per pathway in all genes
#' @export
setMethod("sizeGenes",
          signature(object = "GeneSetCollection", gene = "missing"),
          function(object) {
            object <- check(object)

            gpp <- genesPerPathway(object)
            ppg <- pathwaysPerGene(object)

            uPPG <- unique(ppg)
            uGPP <- unique(gpp)

            paths2genes <- geneIds(object)
            genes2paths <- inverseList(paths2genes)

            # Create the matrix to fill
            m <- matrix(0, ncol = length(ppg), nrow = length(uGPP),
                        dimnames =
                          list("genesPerPathway" = uGPP[order(uGPP)],
                               "Genes" = names(ppg)))

            for (gene in colnames(m)) {
              paths <- genes2paths[[gene]]
              pSize <- table(gpp[paths])
              m[names(pSize), gene] <- pSize
            }
            m
          }
)

#' @describeIn sizePathways Number of pathways per gene in all pathways
#' @export
setMethod("sizePathways",
          signature(object = "GeneSetCollection", pathway = "missing"),
          function(object) {

            object <- check(object)

            gpp <- genesPerPathway(object)
            ppg <- pathwaysPerGene(object)

            uPPG <- unique(ppg)
            uGPP <- unique(gpp)

            paths2genes <- geneIds(object)
            genes2paths <- inverseList(paths2genes)

            # Create the matrix to fill
            m <- matrix(0, ncol = length(gpp), nrow = length(uPPG),
                        dimnames =
                          list("pathwaysPerGene" = uPPG[order(uPPG)],
                               "Pathway" = names(gpp)))

            for (path in colnames(m)) {
              genes <- paths2genes[[path]]
              pSize <- table(ppg[genes])
              m[names(pSize), path] <- pSize
            }
            m
          }
)


#' @describeIn sizePathways Number of pathways per gene in all pathways
#' @export
setMethod("sizePathways",
          signature(object = "GeneSetCollection", pathway = "character"),
          function(object, pathway) {

            object <- check(object)

            gpp <- genesPerPathway(object)
            ppg <- pathwaysPerGene(object)

            uPPG <- unique(ppg)
            uGPP <- unique(gpp)

            paths2genes <- geneIds(object)
            genes2paths <- inverseList(paths2genes)

            if (length(pathway) >= 1) {
              if (any(!pathway %in% names(paths2genes))) {
                keep <- pathway %in% names(paths2genes)
                if (sum(keep) >= 1) {
                  remove <- pathway[!keep]
                  pathway <- pathway[keep]
                  warning("Omitting ", remove, "pathway.\nIt wasn't present")
                } else {
                  stop("No provided pathway is present.")
                }
              }
              out <- sapply(pathway, function(path){
                genes <- paths2genes[[path]]
                pSize <- table(ppg[genes])
              })
            } else {
              if (pathway %in% names(paths2genes)) {
                genes <- paths2genes[[pathway]]
                out <- table(ppg[genes])
              } else {
                stop("No pathway is present.")
              }
            }

            out
          }
)