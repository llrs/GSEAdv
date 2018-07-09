# Compare if the elements of one list  are in another list
# from https://codereview.stackexchange.com/a/192423/36067
all_in_outer <- function(list_x, list_y) {
  uniq_x <- unique(unlist(list_x, use.names = FALSE))
  len_x <- lengths(list_x)

  as_mat <- function(list_a, ids = uniq_x) {
    vec <- unlist(list_a, use.names = FALSE)
    len <- lengths(list_a)
    idx <- rep(seq_along(list_a), len)
    mat <- matrix(0L, nrow = length(list_a), ncol = length(ids),
                  dimnames = list(names(list_a), ids))
    mat[cbind(idx, match(vec, ids))] <- 1L
    mat
  }

  (as_mat(list_x) %*% t(as_mat(list_y)) == len_x) * 1
}

#' @describeIn nested Check if pathways are included in another pathway.
#' @examples
#' nested(Info)
#' @export
setMethod("nested",
          signature(object = "GeneSetCollection"),
          function(object) {
  paths2genes <- geneIds(object)

  all_in_outer(paths2genes, paths2genes)
}
)


#' Pathways equal between two GeneSetCollections
#'
#' Check how many pathways are inside another geneSetCollection
#' @param object1,object2 A GeneSetCollection
#' @return The names of the pathways that are equivalent.
#' @examples
#' compare(Info, genesKegg)
#' @export compare
compare <- function(object1, object2) {
  obj1 <- is(object1, "GeneSetCollection")
  obj2 <- is(object2, "GeneSetCollection")

  nam1 <- deparse(substitute(object1))
  nam2 <- deparse(substitute(object2))

  if (!obj1 & !obj2) {
    stop("Both ", nam1, " and ", nam2, " should be GeneSetCollections.")
  }

  paths2genes1 <- geneIds(object1)
  paths2genes2 <- geneIds(object2)

  m1_in2 <- all_in_outer(paths2genes1, paths2genes2)
  m2_in1 <- all_in_outer(paths2genes2, paths2genes1)
  m <- t(m2_in1) + m1_in2
  equal <- sum(m == 2)
  message(equal, " pathways are the same")
  if (equal >= 1 ){
    out <- which(m == 2, arr.ind = TRUE)
    out[, 1] <- rownames(out)
    out[, 2] <- colnames(m)[as.numeric(out[, 2])]
    rownames(out) <- seq_len(nrow(out))
    colnames(out) <- c(nam1, nam2)
  } else {
    return(0)
  }
  out
}


