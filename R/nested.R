all_in <- function(x, y) {
  if (length(x) > length(y)) {
    0
  } else {
    ifelse(all(x %in% y), 1, 0)
  }
}

all_in_vec <- Vectorize(all_in, vectorize.args = c("x", "y"))

#' @describeIn nested Check if pathways are included in another pathway.
#' @export
setMethod("nested",
          signature(object = "GeneSetCollection"),
          function(object) {
  paths2genes <- geneIds(object)

  outer(paths2genes, paths2genes, all_in_vec)
}
)

#' @describeIn compare Check which pathways are described in both
#' GeneSetCollections
#' @export
setMethod("compare",
          signature(object1 = "GeneSetCollection", object2 = "GeneSetCollection"),
          function(object1, object2) {

            nam1 <- deparse(substitute(object1))
            nam2 <- deparse(substitute(object2))

            paths2genes1 <- geneIds(object1)
            paths2genes2 <- geneIds(object2)



            m1_in2 <- outer(paths2genes1, paths2genes2, all_in_vec)
            m2_in1 <- outer(paths2genes2, paths2genes1, all_in_vec)
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
)


