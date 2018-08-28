# TODO: Add a helper function

#' @describeIn gene Calculates statistics for a single gene
#' @export
setMethod("gene",
          signature(object = "GeneSetCollection", gene = "character"),
          function(object, gene) {

            if (length(gene) > 1) {
              stop("Please use just one gene")
            }
            object <- check(object)
            ppg <- pathwaysPerGene(object)
            gpp <- genesPerPathway(object)

            paths2genes <- geneIds(object)
            genes2paths <- inverseList(paths2genes)

            totalGenes <- length(genes2paths)
            totalPathways <- length(paths2genes)

            Tgpp <- prop.table(table(gpp))
            Tppg <- prop.table(table(ppg))


            if (! gene %in% names(genes2paths)) {
              stop("Gene provided is not in the GeneSetCollection.")
            }

            pathways <- unique(unlist(genes2paths[gene], use.names = FALSE))
            Pathways_length <- lengths(paths2genes[pathways])

            ic <- IC(Pathways_length)
            maxIC <- maxIC(ppg)

            out <- c(ic, # Information content
                     maxIC(Pathways_length), # Relative to its possibilities
                     length(pathways), # Number of pathways per gene
                     Tppg[as.character(length(pathways))], # Probability to find a gene with those pathways
                     prod(Tgpp[as.character(Pathways_length)], na.rm = TRUE)) # Probability to find a gene with pathways of these length
            names(out) <- c("IC", "maxIC", "pathways", "Prob_#_pathways", "Prob_genes_#_pathways")

            # cat("Genes ", out["genes"], "\n")
            # cat("Pathways ", out["pathways"], "\n")
            # cat("IC(genesPerPathway) ", round(out["ICgpp"], 2), "\n")
            cat("IC(pathwaysPerGene) ", round(out["ICppg"], 2), "\n")
            cat("Pathways", out["pathways"], "\n")
            cat("Probability", out["Prob"], "\n")

            invisible(out)
          }
)

#' @describeIn gene Calculates statistics for all genes
#' @export
setMethod("gene",
          signature(object = "GeneSetCollection", gene = "missing"),
          function(object, gene) {
            ppg <- pathwaysPerGene(object)
            gpp <- genesPerPathway(object)

            paths2genes <- geneIds(object)
            genes2paths <- inverseList(paths2genes)

            totalGenes <- length(genes2paths)
            totalPathways <- length(paths2genes)

            Tgpp <- prop.table(table(gpp))
            Tppg <- prop.table(table(ppg))

            maxIC <- maxIC(ppg)
            out <- sapply(names(genes2paths), function(gene) {
              pathways <- unique(unlist(genes2paths[gene], use.names = FALSE))
              Pathways_length <- lengths(paths2genes[pathways])

              if (length(pathways) == 1) {
                ic <- 0
              } else {
                ic <- IC(Pathways_length)
              }
              out <- c(ic, # Information content
                       maxIC(Pathways_length), # Relative to its possibilities
                       length(pathways), # Number of pathways per gene
                       Tppg[as.character(length(pathways))], # Probability to find a gene with those pathways
                       prod(Tgpp[as.character(Pathways_length)], na.rm = TRUE)) # Probability to find a gene with pathways of these length
              names(out) <- c("IC", "maxIC", "pathways", "Prob_#_pathways", "Prob_genes_#_pathways")
              out
            })
            out <- t(out)
            as.data.frame(out)
          }
)