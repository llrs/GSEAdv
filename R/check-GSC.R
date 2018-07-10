check_collectionType <- function(object) {
  typeGS <- collectionType(object)
  equal <- length(typeGS)

  if (equal > 1) {
    warning("Several collections origins detected.",
            "Are you sure they are in the same id?")
    invisible(NA)
  }

  if (any(typeGS %in% "GOCollection")) {
    warning("Gene Ontologies are not pathways
            (They have some complex dependencies).",
            "Proceed only if you want to compare the methods in GO data.")
    return(invisible(FALSE))
  }
  invisible(TRUE)
}

check_geneIdType <- function(object) {
  typeGS <- geneIdType(object)
  equal <- length(typeGS)

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
    if (sum(!keep) == length(object)) {
      stop("All pathways would be removed!")
    }
    warning("Removing ", sum(!keep), " genes sets with only one gene.\n")
    return(as(inverseList(ids[keep]), "GeneSetCollection"))
  } else {
    object
  }
}

# https://cran.r-project.org/web/packages/roxygen2/vignettes/rd.html
#' @describeIn isolation Checks if a gene set is isolated.
#' @export
#' @examples
#' fl <- system.file("extdata", "Broad.xml", package = "GSEABase")
#' gss <- getBroadSets(fl)
#' # Warning
#' \donttest{isolation(gss)}
setMethod("isolation",
          signature(object = "GeneSetCollection"),
          function(object) {
            paths2genes <- geneIds(object)
            ppg <- pathwaysPerGene(object)
            keep <- vapply(paths2genes, function(y){all(ppg[y] == 1)}, logical(1))
            if (any(keep)) {
              TRUE
            }
            FALSE
          }
)

#' @describeIn independence Checks if a all the genes are in a single pathway
#' @export
#' @examples
#' fl <- system.file("extdata", "Broad.xml", package = "GSEABase")
#' gss <- getBroadSets(fl)
#' independence(gss)
setMethod("independence",
          signature(object = "GeneSetCollection"),
          function(object) {
            ppg <- pathwaysPerGene(object)
            all(ppg == 1)
          }
)

#' @describeIn check Applies the checks
#' @export
#' @examples
#' data(sample.ExpressionSet)
#' ai <- AnnotationIdentifier(annotation(sample.ExpressionSet))
#' geneIds <- featureNames(sample.ExpressionSet)[100:109]
#' gs3 <- GeneSet(geneIds=geneIds, type=ai,
#'                setName="sample1", setIdentifier="102")
#' uprotIds <- c("Q9Y6Q1", "A6NJZ7", "Q9BXI6", "Q15035", "A1X283",
#'               "P55957")
#' gs4 <- GeneSet(uprotIds, geneIdType=UniprotIdentifier())
#' gsc <- GeneSetCollection(list(gs3, gs4))
#' gsc
#' \donttest{check(gsc)}
setMethod("check",
          signature(object = "GeneSetCollection"),
          function(object) {
            check_collectionType(object)
            check_geneIdType(object)
            check_size(object)
          }
)

#' @describeIn check Returns the geneIdType present in the GeneSetCollection
#' @examples
#' geneIdType(Info)
#' @export
setMethod("geneIdType",
          signature( object = "GeneSetCollection"),
          function(object) {
            typeGS <- lapply(object, geneIdType)
            unique(vapply(typeGS, class, FUN.VALUE = character(1)))
          }
)

#' @describeIn check Returns the collectionType present in the GeneSetCollection
#' @examples
#' collectionType(Info)
#' @export
setMethod("collectionType",
          signature( object = "GeneSetCollection"),
          function(object) {
            typeGS <- lapply(object, collectionType)
            unique(vapply(typeGS, class, FUN.VALUE = character(1)))
          }
)