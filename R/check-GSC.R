check_collectionType <- function(object) {
  typeGS <- lapply(object, collectionType)
  cl <- sapply(typeGS, class)
  equal <- length(unique(cl, use.names = TRUE))

  if (equal > 1) {
    warning("Several collections origins detected.",
            "Are you sure they are in the same id?")
  }

  if (any(cl %in% "GOCollection")) {
    warning("Gene Ontologies are not pathways
            (They have some complex dependencies).",
            "Proceed only if you want to compare the methods in GO data.")
  }
  invisible(TRUE)
}

check_geneIdType <- function(object) {
  typeGS <- lapply(object, geneIdType)
  cl <- vapply(typeGS, class, FUN.VALUE = character(1))
  equal <- length(table(cl))

  if (equal > 1) {
    stop("Several gene ID types detected.
          Use the same identifier for all the gene sets.")
  }
  invisible(TRUE)
}

check_size <- function(object){
  ids <- geneIds(object)
  ids <- lapply(ids, unique, use.name = FALSE)
  keep <- lengths(ids) >= 2
  if (sum(!keep) > 0 ){
    warning("!Removing ", sum(!keep), "gene sets with less than one gene.")
    if (sum(!keep) == length(object)) {
      stop("All pathways removed!")
    }
    return(as(inverseList(ids[keep]), "GeneSetCollection"))
  } else {
    object
  }
}

#' @describeIn check Applies the checks
#' @export
#' @examples
#' data(sample.ExpressionSet)
#' ai <- AnnotationIdentifier(annotation(sample.ExpressionSet))
#' gs3 <- GeneSet(geneIds=geneIds, type=ai,
#'                setName="sample1", setIdentifier="102")
#' uprotIds <- c("Q9Y6Q1", "A6NJZ7", "Q9BXI6", "Q15035", "A1X283",
#'               "P55957")
#' gs4 <- GeneSet(uprotIds, geneIdType=UniprotIdentifier())
#' gsc <- GeneSetCollection(list(gs3, gs4))
#' gsc
#' check(gsc)
setMethod("check",
          signature(object = "GeneSetCollection"),
          function(object) {
            check_collectionType(object)
            check_geneIdType(object)
            check_size(object)
          }
)