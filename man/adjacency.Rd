% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/adjacency.R
\docType{methods}
\name{adjacency}
\alias{adjacency}
\alias{adjacency,GeneSetCollection-method}
\title{Adjacency of genes in GeneSetCollections}
\usage{
adjacency(object)

\S4method{adjacency}{GeneSetCollection}(object)
}
\arguments{
\item{object}{A \code{GeneSetCollection}}
}
\value{
A matrix
}
\description{
An adjacency matrix summarizes the connection between genes.
The diagonal is set to 1.
}
\section{Methods (by class)}{
\itemize{
\item \code{GeneSetCollection}: Adjacency between genes
}}

\examples{
adjacency(Info)
}
\seealso{
\link[GSEABase]{incidence}
}
\author{
Lluís Revilla Sancho
}
