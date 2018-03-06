
<!-- README.md is generated from README.Rmd. Please edit that file -->
GSEAdv
======

[![Travis build status](https://travis-ci.org/llrs/GSEAdv.svg?branch=master)](https://travis-ci.org/llrs/GSEAdv) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/llrs/GSEAdv?branch=master&svg=true)](https://ci.appveyor.com/project/llrs/GSEAdv) [![Coverage status](https://codecov.io/gh/llrs/GSEAdv/branch/master/graph/badge.svg)](https://codecov.io/github/llrs/GSEAdv?branch=master) [![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental) [![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](http://www.repostatus.org/badges/latest/concept.svg)](http://www.repostatus.org/#concept)

The goal of GSEAdv is to provide tools for better methods with gene sets collections.

GSEAdv is based on the relationship between genes and gene sets under this schema: ![Schema of gene sets](./vignettes/GSEAdv.jpg)

And provides methods to understand the relationships between each property of the schema and as a whole.

Installation
------------

It is an R package you can install it from the Bioconductor project with:

``` r
## try http:// if https:// URLs are not supported
## source("https://bioconductor.org/biocLite.R")
## biocLite("GSEAdv")
```

You can install this version of *GSEAdv* with:

``` r
## library("devtools")
devtools::install_github("llrs/GSEAdv")
```

How does it work?
=================

It is simple, load the package and learn about your data!

``` r
# Load some data
library("GSEAdv")
fl <- system.file("extdata", "Broad.xml", package = "GSEABase")
gss <- getBroadSets(fl)
gss
## GeneSetCollection
##   names: chr5q23, chr16q24 (2 total)
##   unique identifiers: ZNF474, CCDC100, ..., TRAPPC2L (215 total)
##   types in collection:
##     geneIdType: SymbolIdentifier (1 total)
##     collectionType: BroadCollection (1 total)
summary(gss)
## Genes: 215 
##  Gene in more pathways: 1 pathways
##  h-index: 0 genes with at least 0 pathways.
## Pathways: 2 
##  Biggest pathway: 129 genes
##  h-index: 1 pathways with at least 1 genes.
## IC(genesPerPathway): 1 ( 1 of the maximum)
## IC(pathwaysPerGene) 0 ( NaN of the maximum)
```

Which tells us that each gene in the GeneSetCollection is only on one gene set.

If we want to explore the human pathways of [REACTOME](https://reactome.org/)

``` r
library("reactome.db")
genesReact <- as.list(reactomeEXTID2PATHID)
# Remove genes and pathways which are not from human pathways 
human <- sapply(genesReact, function(x){all(grepl(pattern = "R-HSA-", x))})
genesReact <- genesReact[human]
genesReact <- as.GeneSetCollection(genesReact, filter = TRUE)
barplot(table(genesPerPathway(genesReact)), main = "Genes per pathway")
```

![Genes per pathways in humans](man/figures/README-unnamed-chunk-3-1.png)

and the number of pathways

``` r
barplot(table(pathwaysPerGene(genesReact)), main = "Pathways per gene")
```

![Pathways per human gene](man/figures/README-unnamed-chunk-4-1.png)

Who will use this repo or project?
==================================

It is intended for bioinformaticians, both people interested in *comparing* groups of gene sets or databases and people *developing* analysis using the information provided by *GSEAdv*.

How to use GSEAdv?
==================

See the vignette.

What is the goal of this project?
=================================

The goal of this project is to be able to understand the gene sets collections available.

What can be *GSEAdv* used for?
==============================

-   Compare pathway database:
    By comparing the differences between them.
-   Select the gene set collection of interest: By testing their properties.

Contributing
============

Please read [how to contribute](.github/CONTRIBUTING.md) for details on the code of conduct, and the process for submitting pull requests.

Acknowledgments
===============

The ideas of this package were developed after a colleague asked a question in a poster presentation of my other package [BioCor](https://github.com/llrs/BioCor).
