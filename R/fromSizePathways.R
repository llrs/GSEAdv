
#' Simulate a GeneSetCollection
#'
#' Given a matrix of the number of the pathways where a gene is involved it
#' simulates a GeneSetCollection
#' @param sizePathways The distribution of pathways by number of the pathways
#' their genes are in
#' @return A GeneSetCollection with this genes and relationships
#' @export
fromSizePathways <- function(sizePathways){
  # Initial conditions
  paths <- colnames(sizePathways)
  genesSizes <- rowSums(sizePathways)
  sizes <- as.numeric(rownames(sizePathways))
  genes <- rep(sizes, genesSizes/sizes)
  genes <- names_vec(genes, "G_")
  nGenes <- length(genes)

  stopifnot(all(genesSizes != 0))
  stopifnot(all(sizes != 0))
  stopifnot(min(sizes) >= 1)

  helper <- function(){
    genes2paths <- lapply(genes, function(x){
      unique(sample(colnames(sizePathways), x,
                    prob = sizePathways[as.character(x), ]))
    })

    suppressWarnings(as(genes2paths, "GeneSetCollection"))
  }

  gsc <- helper()
  iter <- 1

  check_gsc <- function(gsc, m){

    genesSizes <- rowSums(m)
    sizes <- as.numeric(names(genesSizes))
    nGenes <- sum(genesSizes/sizes)
    t_ppg <- table(pathwaysPerGene(gsc))


    if (nPathways(gsc) == ncol(m)) {
      if (nGenes(gsc) == nGenes) {
        if (all(t_ppg == genesSizes/sizes)) {
          if (all(genesPerPathway(gsc) == colSums(m))) {
            return(TRUE)
          }
        }
      }
    }
    FALSE

  }

  while(!check_gsc(gsc, sizePathways)) {
    iter <- iter + 1
    gsc <- helper()
  }
  message("Iterations: ", iter)
  gsc


  # TODO: FIXME check what happens with genesKegg size pathways
}
