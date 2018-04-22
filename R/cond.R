#' @describeIn condPerGenes Check the conditional probability given the
#' number of genes
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
#' @export
setMethod("condPerGenes",
          signature(object = "GeneSetCollection", genesPerPathway = "numeric"),
          function(object, genesPerPathway) {
            paths2genes <- geneIds(object)
            ppg <- pathwaysPerGene(object)
            gpp <- genesPerPathway(object)

            p2g <- equalize(paths2genes)

            p2g$a <- ppg[p2g$a]
            p2g$b <- gpp[p2g$b]

            keep <- p2g$b %in% genesPerPathway
            p2g$b <- p2g$b[keep]
            p2g$a <- p2g$a[keep]


            m <- helper_cond(p2g)
            names(dimnames(m)) <- c("pathwaysPerGene", "genesPerPathway")
            m
          }
)

#' @describeIn condPerPathways Check the conditional probability given the
#' number of pathways
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
#' @export
setMethod("condPerPathways",
          signature(object = "GeneSetCollection", pathwaysPerGene = "numeric"),
          function(object, pathwaysPerGene) {

            paths2genes <- geneIds(object)
            ppg <- pathwaysPerGene(object)
            gpp <- genesPerPathway(object)

            if (!all(pathwaysPerGene %in% ppg)){
              pathwaysPerGene <- pathwaysPerGene[pathwaysPerGene %in% ppg]
            }

            p2g <- equalize(inverseList(paths2genes))

            p2g$b <- ppg[p2g$b]
            p2g$a <- gpp[p2g$a]

            keep <- p2g$b %in% pathwaysPerGene
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
