#' Simulate GeneSetCollection
#'
#' Simulates a GeneSetCollection following a distribution
#' @param ppg The number of pathways per genes of the desired GeneSetCollection
#' @return A GeneSetCollection
#' @export
y <- function(ppg) {
  # Check input
  if (any(ppg < 0) || !is.numeric(ppg)) {
    stop("Provide positive integer values for genes in the pathways")
  }

  # Remove empty genes without pathways
  if (any(ppg == 0)) {
    ppg <- ppg[ppg == 0]
  }

  # Set names to the genes
  if (is.null(names(ppg))) {
    genes <- paste0("G_", seq_along(ppg))
    names(ppg) <- genes
  } else {
    genes <- names(ppg)
  }

  # Compares the actual number of pathways with the possible outcome of
  if (choose(length(ppg), 2) < max(ppg)){
    stop("Impossible combination of genes and pathways")
  }

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

  # Calculate the data
  ppg_sim <- pathwaysPerGene(gsc)
  t_ppg_sim <- table(ppg_sim)
  t_ppg <- table(ppg)

  # Checking the output fits the rules for a pathwayª
  size <- length(ppg) == length(ppg_sim)
  tables <- length(t_ppg) == length(t_ppg_sim)
  if (tables) {
    repet <- all(names(t_ppg) == names(t_ppg_sim))
  } else {
    repet <- FALSE
  }
  iter <- 1

  while (size & tables & repet) {
    gsc <- helper(ppg, genes)

    # Calculate the data
    ppg_sim <- pathwaysPerGene(gsc)
    t_ppg_sim <- table(ppg_sim)
    t_ppg <- table(ppg)

    # Checking the output fits the rules for a pathwayª
    size <- length(ppg) == length(ppg_sim)
    tables <- length(t_ppg) == length(t_ppg_sim)
    if (tables) {
      repet <- all(names(t_ppg) == names(t_ppg_sim))
    } else {
      repet <- FALSE
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
#' @export
z <- function(gpp) {
  # Check input
  if (any(gpp < 0) || !is.numeric(gpp)) {
    stop("Provide positive integer values for pathways of the genes")
  }

  # Remove empty pathways or pathways of single genes
  if (any(gpp < 2)) {
    gpp <- gpp[!gpp < 2]
  }

  # Set names to the genes
  if (is.null(names(gpp))) {
    pathways <- paste0("GS_", seq_along(gpp))
    names(gpp) <- pathways
  } else {
    pathways <- names(gpp)
  }
  # max(gpp), sum(gpp)

  # Compares the actual number of pathways with the possible outcome of
  if (choose(length(gpp), 2) < max(gpp)){
    stop("Impossible combination of genes and pathways")
  }


  helper <- function(gpp, pathways){
    # For each pathway create a random group of genes
    # Could be done in parallel, as each gene doesn't depend on the previous
    genes2pathsG <- lapply(gpp, function(y) {
      lapply(seq_len(y), sample, x = pathways)
    })

    # Remove duplicate pathways
    genes2pathways <- unique(unlist(genes2pathsG, recursive = FALSE,
                                    use.names = FALSE))
    names(genes2pathways) <- paste0("G_", seq_along(genes2pathways))

    suppressWarnings(obj <- as(genes2pathways, "GeneSetCollection"))
    obj
  }

  obj <- helper(gpp, pathways)

  # Calculate the data
  gpp_sim <- genesPerPathway(obj)
  t_gpp_sim <- table(gpp_sim)
  t_gpp <- table(gpp)

  # Checking the output fits the rules for a pathwayª
  size <- length(gpp) == length(gpp_sim)
  tables <- length(t_gpp) == length(t_gpp_sim)
  if (tables) {
    repet <- all(names(t_gpp) == names(t_gpp_sim))
  } else {
    repet <- FALSE
  }

  iter <- 1

  while (size & tables & repet) {
    obj <- helper(gpp, pathways)
    iter <- iter +1

    # Calculate the data
    gpp_sim <- genesPerPathway(obj)
    t_gpp_sim <- table(gpp_sim)
    t_gpp <- table(gpp)

    # Checking the output fits the rules for a pathwayª
    size <- length(gpp) == length(gpp_sim)
    tables <- length(t_gpp) == length(t_gpp_sim)
    if (tables) {
      repet <- all(names(t_gpp) == names(t_gpp_sim))
    } else {
      repet <- FALSE
    }
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
#' @seealso \code{\link{w}}
#' @export
z2 <- function(gpp, nGenes) {

  stopifnot(nGenes >= max(gpp))
  stopifnot(nGenes > 2)

  if (any(gpp == 1)) {
    warning("Removing pathways of one gene")
    gpp <- gpp[gpp >= 2]
  }

  genes <- paste0("G_", seq_len(nGenes))
  if (is.null(names(gpp))) {
    names(gpp) <- paste0("GS", seq_along(gpp))
  }
  helper <- function(gpp, genes){
    paths2genes <- lapply(gpp, sample, x = genes)
    suppressWarnings(gsc <- as(inverseList(paths2genes), "GeneSetCollection"))
    gsc
  }
  obj <- helper(gpp, genes)
  i <- 1

  while(nGenes(gsc) != nGenes) {
    i <- i +1
    gsc <- helper(gpp, genes)
  }

  message("Iterations: ", i)
  gsc
}

#' Simulate a GeneSetCollection
#'
#' Creates a GeneSetCollection with the desired number of pathways per gene
#' given the number of pathways.
#' @param ppg Pathways per gene.
#' @param nPathways Number of genes.
#' @return A GeneSetCollection with those genes distributed in those pathways.
#' @seealso \code{\link{w}}
#' @export
w <- function(ppg, nPathways) {

  stopifnot(max(ppg) <= nPathways )
  stopifnot(nPathways > 2)

  if (is.null(names(ppg))) {
    names(ppg) <- paste0("G_", seq_along(ppg))
  }

  paths <- paste0("GS_", seq_len(nPathways))
  helper <- function(ppg, paths) {
    genes2paths <- sapply(ppg, sample, x = paths)
    suppressWarnings(obj <- as(genes2paths, "GeneSetCollection"))
    obj
  }

  gsc <- helper(ppg, paths)
  iter <- 1
  while(nPathways(gsc) != nPathways) {
    iter <- iter + 1
    gsc <- helper(ppg, paths)
  }

  message("Iterations: ", iter)
  obj
}


# TODO: FIXME
v <- function(ng, np) {
  genes <- paste0("G_", seq_len(ng))
  paths <- paste0("GS_", seq_len(np))

  count <- 0
  paths2genes <- vector("list", np)
  while(length(unique(paths2genes)) != np) {
    for (i in paths){
      x <- stats::rgeom(1, 0.25)
      if (x < length(genes)){
        paths2genes[[i]] <- sample(x = genes, size = x)
      }
    }
    count <- count + 1
  }
  message(count)
  paths2genes
}
