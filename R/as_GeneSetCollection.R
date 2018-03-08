#' Convert a list or a Bimap interface into GeneSetCollections
#'
#' Transform the list or Bimap structure into a GeneSetCollection with unique
#' gene identifiers an pathnames.
#' @param object A list of genes and their pathways or an AnnDbBimap.
#' @param filter A logical
#' @param ... Other unused parameters passed down.
#' @return A GeneSetCollection
#' @author Lluís Revilla
#' @export as.GeneSetCollection
#' @seealso \code{\link[GSEABase]{GeneSetCollection}}
setGeneric("as.GeneSetCollection", function(object, filter, ...)
  standardGeneric("as.GeneSetCollection")
)

#' @describeIn as.GeneSetCollection Convert a list to a GeneSetCollection object
#' @export as.GeneSetCollection
setMethod("as.GeneSetCollection", signature(object = "list"),
          function(object, filter, ...){
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