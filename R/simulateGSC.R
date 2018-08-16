check_vec <- function(ref, test) {
  # Check size
  lr <- length(ref)
  lt <- length(test)


  # Check
  tr <- table(ref)
  tt <- table(test)

  if (prodT(tr) == prodT(tt)) {
    if (lr == lt) {
      if (length(tr) == length(tt)) {
        if (all(names(tr) == names(tt)) & all(tt == tr)) {
          return(TRUE)
        }
      }
    }
  }
  FALSE
}

prodT <- function(x){
  nam <- as.numeric(names(x))
  sum(x*nam)
}

#' Simulate GeneSetCollection
#'
#' Simulates a GeneSetCollection following a distribution
#' @param ppg The number of pathways per genes of the desired GeneSetCollection
#' @note It might take some iterations to reach the desired output
#' @return A GeneSetCollection
#' @seealso \code{\link{fromGPP}}
#' @examples
#' fromPPG(c(2, 2, 3, 2, 2, 2, 2))
#' @export
fromPPG <- function(ppg) {
  # Check input
  if (!is.numeric(ppg)) {
    stop("Provide positive integer values for genes in the pathways")
  }
   if (any(ppg <= 0)){
     ppg <- ppg[ppg > 0]
     warning("Removing genes with 0 pathways")
   }

  # Remove empty genes without pathways
  if (any(ppg == 0)) {
    ppg <- ppg[ppg == 0]
  }

  # Set names to the genes
  ppg <- names_vec(ppg, "G_")
  genes <- names(ppg)

  min_paths <- max(ppg)

  # Workhorse of the function
  helper <- function(ppg, genes) {
    # For each gene create a random pathway of the size set ppg
    # Could be done in parallel, as each gene doesn't depend on the previous
    genes2pathsG <- lapply(ppg, function(y) {
      lapply(seq_len(y), sample, x = genes)
    })

    # Remove duplicate pathways
    pathways <- unique(unlist(genes2pathsG, recursive = FALSE,
                              use.names = FALSE))

    names(pathways) <- paste0("GS_", seq_along(pathways))
    genes2pathways <- inverseList(pathways)
    suppressWarnings(obj <- as(genes2pathways, "GeneSetCollection"))

    obj
  }

  gsc <- helper(ppg, genes)

  if (!is(gsc, "GeneSetCollection")) {
    pass <- FALSE
  } else {

    # Calculate the data
    ppg_sim <- pathwaysPerGene(gsc)
    pass <- check_vec(ppg, ppg_sim)
  }

  iter <- 1

  while (!pass) {
    gsc <- helper(ppg, genes)
    # message(iter)

    if (!is(gsc, "GeneSetCollection")) {
      pass <- FALSE
    } else {

      # Calculate the data
      ppg_sim <- pathwaysPerGene(gsc)
      pass <- check_vec(ppg, ppg_sim)
    }
    iter <- iter +1
  }
  message("Iterations: ", iter)
  gsc
}


#' Simulate GeneSetCollection
#'
#' Simulates a GeneSetCollection following the number of pathways per genes
#' introduced.
#' @param gpp The number of pathways per genes of the desired GeneSetCollection.
#' @return A GeneSetCollection
#' @seealso \code{\link{fromPPG}}
#' @export
fromGPP <- function(gpp) {
  # Check input
  if (any(gpp < 0) || !is.numeric(gpp)) {
    stop("Provide positive integer values for pathways of the genes")
  }

  # Remove empty pathways or pathways of single genes
  if (any(gpp < 2)) {
    gpp <- gpp[!gpp < 2]
  }

  # Set names to the genes
  gpp <- names_vec(gpp, "GS_")
  pathways <- names(gpp)

  nPaths <- length(gpp)

  min_genes <- min(c(max(gpp), 10^(10/3*nPaths)))

  helper <- function(gpp, pathways){
    # For each pathway create a random group of genes
    # Could be done in parallel, as each gene doesn't depend on the previous
    genes2pathsG <- lapply(gpp, function(y) {
      lapply(seq(from = 2, to = y, by = 1), sample, x = pathways)
    })

    # Remove duplicate pathways
    genes2pathways <- unique(unlist(genes2pathsG, recursive = FALSE,
                                    use.names = FALSE))
    genes2pathways <- genes2pathways[lengths(genes2pathways) >= 2]
    names(genes2pathways) <- paste0("G_", seq_along(genes2pathways))

    suppressWarnings(obj <- as(genes2pathways, "GeneSetCollection"))

    obj
  }



  obj <- tryCatch(helper(gpp, pathways), error = function(e){
    helper(gpp, pathways)
  })


  # Calculate the data
  gpp_sim <- genesPerPathway(obj)
  pass <- check_vec(gpp, gpp_sim)

  iter <- 1

  while (!pass) {

    obj <- tryCatch(helper(gpp, pathways), error = function(e){
      helper(gpp, pathways)
    })
    iter <- iter +1

    # Calculate the data
    gpp_sim <- genesPerPathway(obj)
    pass <- check_vec(gpp, gpp_sim)
    # if (iter %% 100) {
    #   message("Loading...")
    # }
    #
    # if (iter == 5000) {
    #   message("5000 itertions.\nTime to stop?")
    #   Sys.sleep(5)
    # }

  }
  message("Iterations: ", iter)
  obj

}

#' Simulate a GeneSetCollection
#'
#' Creates a GeneSetCollection with the desired number of genes per pathway
#' given the number of genes.
#' @param gpp Genes per pathway.
#' @param nGenes Number of genes.
#' @return A GeneSetCollection with those genes distributed in those pathways.
#' @seealso \code{\link{fromPPG_nPathways}}
#' @export
fromGPP_nGenes <- function(gpp, nGenes) {

  # Check input
  if (any(gpp < 0) || !is.numeric(gpp)) {
    stop("Provide integer values for pathways of the genes")
  }
  stopifnot(nGenes >= max(gpp))
  stopifnot(nGenes > 2)

  if (any(gpp == 1)) {
    warning("Removing pathways of one gene")
    gpp <- gpp[gpp >= 2]
  }

  genes <- paste0("G_", seq_len(nGenes))
  gpp <- names_vec(gpp, "GS_")

  helper <- function(gpp, genes){
    paths2genes <- lapply(gpp, sample, x = genes)
    suppressWarnings(gsc <- as(inverseList(paths2genes), "GeneSetCollection"))
    gsc
  }
  obj <- helper(gpp, genes)
  gpp_sim <- genesPerPathway(obj)
  pass <- check_vec(gpp, gpp_sim)

  i <- 1

  while(!(nGenes(obj) == nGenes & pass)) {
    i <- i +1
    obj <- helper(gpp, genes)
    gpp_sim <- genesPerPathway(obj)
    pass <- check_vec(gpp, gpp_sim)
  }

  message("Iterations: ", i)
  obj
}

#' Simulate a GeneSetCollection
#'
#' Creates a GeneSetCollection with the desired number of pathways per gene
#' given the number of pathways.
#' @param ppg Pathways per gene.
#' @param nPathways Number of genes.
#' @return A GeneSetCollection with those genes distributed in those pathways.
#' @seealso \code{\link{fromGPP_nGenes}}
#' @export
fromPPG_nPathways <- function(ppg, nPathways) {
  # Check input
  if (any(ppg < 0) || !is.numeric(ppg)) {
    stop("Provide integer values for genes in the pathways")
  }
  stopifnot(max(ppg) <= nPathways )
  stopifnot(nPathways > 2)

  ppg <- names_vec(ppg, "G_")
  paths <- paste0("GS_", seq_len(nPathways))

  helper <- function(ppg, paths) {
    genes2paths <- sapply(ppg, sample, x = paths)
    suppressWarnings(obj <- as(genes2paths, "GeneSetCollection"))
    obj
  }

  gsc <- helper(ppg, paths)
  ppg_sim <- pathwaysPerGene(gsc)
  pass <- check_vec(ppg, ppg_sim)

  iter <- 1

  while(!(nPathways(gsc) == nPathways & pass)) {
    iter <- iter + 1
    gsc <- helper(ppg, paths)

    ppg_sim <- pathwaysPerGene(gsc)
    pass <- check_vec(ppg, ppg_sim)
  }

  message("Iterations: ", iter)
  gsc
}
