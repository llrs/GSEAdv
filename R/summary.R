#' Calculates some statistics of the GeneSetCollection
#'
#' These statistics include the biggest pathway, the gene in more pathways,
#' h-index and entropy or information content for the genes per pathway and
#' pathways for genes and they percentage  of the maximum.
#' @param object A GeneSetCollection object
#' @return invisible a list of statistics
#' @author Lluís Revilla
#' @seealso \code{\link{genesPerPathway}}, \code{\link{pathwaysPerGene}}
#' @rdname summary
#' @aliases summary
#' @export
setMethod("summary",
          "GeneSetCollection",
          function(object) {
            object <- check(object)
            gpp <- genesPerPathway(object)
            ppg <- pathwaysPerGene(object)

            h_gpp <- h_index(gpp)
            h_ppg <- h_index(ppg)

            out <- c(ICgpp = IC(gpp),
                     ICppg = IC(ppg),
                     maxICgpp = maxIC(gpp),
                     maxICppg = maxIC(ppg),
                     genes = length(ppg),
                     maxGPP = max(gpp),
                     independence = independence(object),
                     isolation = suppressWarnings(isolation(object)),
                     maxPPG = max(ppg),
                     pathways = length(gpp)
            )
            cat("Genes:", out["genes"], "\n")
            cat("\tGene in more pathways:", out["maxPPG"], "pathways\n")
            cat("\th-index:", h_gpp, "genes with at least", h_gpp, "pathways.\n")
            cat("Pathways:", out["pathways"], "\n")
            cat("\tBiggest pathway:", out["maxGPP"], "genes\n")
            cat("\th-index:", h_ppg, "pathways with at least", h_ppg, "genes.\n")
            if (!out["independence"]) {
              cat("IC(genesPerPathway):", round(out["ICgpp"], 2),
                  "(", round(out["ICgpp"]/out["maxICgpp"], 2), "of the maximum)\n")
              cat("IC(pathwaysPerGene)", round(out["ICppg"], 2),
                  "(", round(out["ICppg"]/out["maxICppg"], 2), "of the maximum)\n")
            } else {
              cat("All genes in a single gene set.\n")
            }
            if (out["isolation"]) {
              cat("Some gene set have all genes not present in other gene sets")
            }
            invisible(out)
          }
)
