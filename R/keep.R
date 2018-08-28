# keep Methods that look for variations over a given GSC




# x is the input matrix either genes x genes or pathways x pathways
comb_symm_dif <- function(x, nDistr) {
  # unique genes https://stats.stackexchange.com/a/358062/105234
  pairwise <- as.data.frame(which(upper.tri(x), arr.ind = TRUE))
  pairwise$row <- colnames(x)[pairwise$row]
  pairwise$col <- colnames(x)[pairwise$col]
  pairwise$size1 <- nDistr[pairwise$row]
  pairwise$size2 <- nDistr[pairwise$col]
  pairwise$shared <- x[upper.tri(x)]

  pairwise$pos <- choose(pairwise$size1 + pairwise$size2 - 2*pairwise$shared, pairwise$size1 - pairwise$shared)
  # sum(pairwise$pos)
  pairwise[pairwise$pos != 0, ]
  # pairwise
}

keepGPP <- function(gsc){
  i <- incidence(gsc)
  shared <- i %*% t(i)
  gpp <- genesPerPathway(gsc)
  comb_symm_dif(shared, gpp)
}


keepPPG <- function(gsc){
  i <- incidence(gsc)
  shared <- t(i) %*% i
  ppg <- pathwaysPerGene(gsc)
  comb_symm_dif(shared, ppg)
}

#' @describeIn combnPPG Estimate the combinations of pathways per gene
#' @export
#' @examples
#' combnPPG(Info)
setMethod("combnPPG",
          signature(object = "GeneSetCollection"),
          function(object) {
            double.factorial(nGenes(object))
          })


#' @describeIn combnGPP Estimate the combinations of genes per pathways
#' @export
#' @examples
#' combnGPP(Info)
setMethod("combnGPP",
          signature(object = "GeneSetCollection"),
          function(object) {
            double.factorial(nPathways(object))
          })

#' Double factorial
#'
#' Calculates the double factorial of the numbers, ie the product of all the
#' numbers that appear in the pair position.
#' @param x The number of which the double factorial is wanted
#' @return The double factorial of the number
#' @export
#' @examples
#' double.factorial(4)
#' double.factorial(5)
double.factorial <- function(x) {
  if (!is.numeric(x)) {
    x <- length(x)
  }

  # If pair get the odd value closer
  if ( x %% 2 == 0) {
    x <- x -1
  }

  seq_total <- seq_len(x)

  keep <- seq_total %% 2 == 1
  prod(seq_total[keep])
}


