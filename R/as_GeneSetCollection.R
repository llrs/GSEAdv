
#' @describeIn as.GeneSetCollection Convert a list to a GeneSetCollection object
#' @export as.GeneSetCollection
setMethod("as.GeneSetCollection", signature(object = "list"),
          function(object, ...){
            keep <- vapply(object, function(x){
              all(is(x, "character"))
            }, FUN.VALUE = logical(1))
            object <- object[keep]
            paths2gene <- inverseList(object)
            paths2gene <- lapply(paths2gene, unique)
            gsl <- sapply(names(paths2gene), function(x){
              GeneSet(paths2gene[[x]], setName = x)})
            check(GeneSetCollection(gsl))
          }
)

#' @describeIn as.GeneSetCollection Convert AnnDbBimap to GeneSetCollections
#' @export as.GeneSetCollection
setMethod("as.GeneSetCollection",
          signature(object = "AnnDbBimap"),
          function(object, ...) {
            check(as.GeneSetCollection(as.list(object), ...))
          }
)

setAs("list", "GeneSetCollection",
      function(from) { as.GeneSetCollection(from)}
)

setAs("AnnDbBimap", "GeneSetCollection",
      function(from) { as.GeneSetCollection(from)}
)