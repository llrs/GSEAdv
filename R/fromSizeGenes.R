
#' Simulate a GeneSetCollection
#'
#' Given a matrix of the size of the pathways where a gene is involved it simulates
#' a GeneSetCollection
#' @param sizeGenes The distribution of genes by size of the pathways they are in
#' @return A GeneSetCollection with this genes and relationships
#' @export
fromSizeGenes <- function(sizeGenes){
  # Initial conditions
  ppg <- colSums(sizeGenes)
  genes <- colnames(sizeGenes)
  pathSizes <- rowSums(sizeGenes)
  sizes <- as.numeric(names(pathSizes))
  pathways <- rep(sizes, pathSizes/sizes)
  pathways <- names_vec(pathways, "GS_")
  nPaths <- length(pathways)


  stopifnot(all(pathSizes != 0))
  stopifnot(all(ppg != 0))
  stopifnot(min(sizes) >= 2)

  m2 <- prop.table(sizeGenes, 1L)
  helper <- function(){
    paths2genes <- sapply(pathways, function(x){
      unique(sample(colnames(sizeGenes), x, prob = m2[as.character(x), ]))
    })

    genes2paths <- inverseList(paths2genes)
   suppressWarnings(as(genes2paths, "GeneSetCollection"))
  }

  gsc <- helper()
  iter <- 1

  check_gsc <- function(gsc, m){

    pathSizes <- rowSums(m)
    sizes <- as.numeric(names(pathSizes))
    nPaths <- sum(pathSizes/sizes)
    t_gpp <- table(genesPerPathway(gsc))


    if (nGenes(gsc) == ncol(m)) {
      if (nPathways(gsc) == nPaths) {
        if (all(t_gpp == pathSizes/sizes)) {
          if (all(pathwaysPerGene(gsc) == colSums(m))) {
            return(TRUE)
          }
        }
      }
    }
    FALSE

  }

  while(!check_gsc(gsc, sizeGenes)) {
    iter <- iter + 1
    gsc <- helper()
  }
  message("Iterations: ", iter)
  gsc
}
