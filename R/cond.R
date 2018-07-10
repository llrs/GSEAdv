#' @describeIn condPerGenes Check the conditional probability given the
#' number of genes
#' @examples
#' condPerGenes(Info)
#' @export
setMethod("condPerGenes",
          signature(object = "GeneSetCollection", genesPerPathway = "missing"),
          function(object) {
            paths2genes <- geneIds(object)
            ppg <- pathwaysPerGene(object)
            gpp <- genesPerPathway(object)

            p2g <- equalize(paths2genes)

            p2g$a <- ppg[p2g$a]
            p2g$b <- gpp[p2g$b]

            m <- helper_cond(p2g)
            names(dimnames(m)) <- c("pathwaysPerGene", "genesPerPathway")
            m
          }
)

#' @describeIn condPerGenes Check the conditional probability given the
#' number of genes
#' @examples
#' condPerGenes(Info, 2)
#' @export
setMethod("condPerGenes",
          signature(object = "GeneSetCollection", genesPerPathway = "numeric"),
          function(object, genesPerPathway) {
            paths2genes <- geneIds(object)
            ppg <- pathwaysPerGene(object)
            gpp <- genesPerPathway(object)

            keepGenesSize <- genesPerPathway %in% gpp
            if (!all(keepGenesSize)){

              warning("There isn't any gene with ", genesPerPathway[!keepGenesSize], " pathways")
              genesPerPathway <- genesPerPathway[keepGenesSize]

            }

            p2g <- equalize(paths2genes)

            p2g$a <- ppg[p2g$a]
            p2g$b <- gpp[p2g$b]

            keep <- p2g$b %in% genesPerPathway
            if (sum(keep) == 0) {
              stop("There isn't any pathway size left")
            }
            p2g$b <- p2g$b[keep]
            p2g$a <- p2g$a[keep]


            m <- helper_cond(p2g)
            names(dimnames(m)) <- c("pathwaysPerGene", "genesPerPathway")
            m
          }
)

#' @describeIn condPerPathways Check the conditional probability given the
#' number of pathways
#' @examples
#' condPerPathways(Info)
#' @export
setMethod("condPerPathways",
          signature(object = "GeneSetCollection", pathwaysPerGene = "missing"),
          function(object) {
  paths2genes <- geneIds(object)
  ppg <- pathwaysPerGene(object)
  gpp <- genesPerPathway(object)

  p2g <- equalize(inverseList(paths2genes))

  p2g$b <- ppg[p2g$b]
  p2g$a <- gpp[p2g$a]

  m <- helper_cond(p2g)
  names(dimnames(m)) <- c("genesPerPathway", "pathwaysPerGene")
  m
})

#' @describeIn condPerPathways Check the conditional probability given the
#' number of pathways
#' @examples
#' condPerPathways(Info, 2)
#' @export
setMethod("condPerPathways",
          signature(object = "GeneSetCollection", pathwaysPerGene = "numeric"),
          function(object, pathwaysPerGene) {

            paths2genes <- geneIds(object)
            ppg <- pathwaysPerGene(object)
            gpp <- genesPerPathway(object)
            keepPathsSize <- pathwaysPerGene %in% ppg
            if (!all(keepPathsSize)){

              warning("There isn't any gene with ", pathwaysPerGene[!keepPathsSize], " pathways")
              pathwaysPerGene <- pathwaysPerGene[keepPathsSize]

            }

            p2g <- equalize(inverseList(paths2genes))

            p2g$b <- ppg[p2g$b]
            p2g$a <- gpp[p2g$a]

            keep <- p2g$b %in% pathwaysPerGene
            if (sum(keep) == 0) {
              stop("There isn't any gene size left")
            }
            p2g$b <- p2g$b[keep]
            p2g$a <- p2g$a[keep]

            m <- helper_cond(p2g)
            names(dimnames(m)) <- c("genesPerPathway", "pathwaysPerGene")
            m
          })


uniq_order <- function(x){
  y <- unique(x)
  y[order(y)]
}

helper_cond <- function(p2g){

  u_a <- uniq_order(p2g$a)
  u_b <- uniq_order(p2g$b)

  m <- matrix(0, nrow = length(u_a), ncol = length(u_b), dimnames = list(u_a, u_b))

  for (sG in colnames(m)) {
    cond1 <- p2g$b == as.numeric(sG)
    if (sum(cond1) != 0){
      for (sP in rownames(m)) {
        cond2 <- p2g$a == as.numeric(sP)
        m[sP, sG] <- sum(cond1 & cond2)/sum(cond1)
      }
    }
  }
  m[rowSums(m) != 0, , drop = FALSE]
}
