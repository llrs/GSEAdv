#' @importMethodsFrom GSEABase collectionType
check_collectionType <- function(object) {
  typeGS <- lapply(object, collectionType)
  cl <- sapply(typeGS, class)
  equal <- length(table(cl))

  if (equal > 1) {
    warning("Several collections origins detected.",
            "Are you sure they are in the same id?")
  }

  if (any(cl %in% "GOCollection")) {
    warning("Gene Ontologies are not pathways
            (They have some complex dependencies).",
            "Proceed only if you want to compare the methods in GO data.")
  }
}

#' @importMethodsFrom GSEABase geneIdType
check_geneIdType <- function(object) {
  typeGS <- lapply(object, geneIdType)
  cl <- vapply(typeGS, class, FUN.VALUE = character(1))
  equal <- length(table(cl))

  if (equal > 1) {
    stop("Several gene ID types detected.\nUse the same identifier for all
             the gene sets.")
  }
}

# Checks that the GeneSetCollection is not from class GeneOntology
# Checks that the identifiers are not mixed as self reported
check <- function(object) {
  check_collectionType(object)
  check_geneIdType(object)
}