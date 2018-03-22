sizeGenes <- function(object) {
  object <- check(object)

  gpp <- genesPerPathway(object)
  ppg <- pathwaysPerGene(object)

  uPPG <- unique(ppg)
  uGPP <- unique(gpp)

  paths2genes <- GSEABase::geneIds(object)
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


sizePaths <- function(object) {
  object <- check(object)

  gpp <- genesPerPathway(object)
  ppg <- pathwaysPerGene(object)

  uPPG <- unique(ppg)
  uGPP <- unique(gpp)

  paths2genes <- GSEABase::geneIds(object)
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
