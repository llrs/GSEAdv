Tests and Coverage
================
27 agosto, 2018 16:18:22

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by [covrpage](https://github.com/yonicd/covrpage).

Coverage
--------

Coverage summary is created using the [covr](https://github.com/r-lib/covr) package.

| Object                                                               | Coverage (%) |
|:---------------------------------------------------------------------|:------------:|
| GSEAdv                                                               |     77.33    |
| [R/completness.R](../R/completness.R)                                |     0.00     |
| [R/expand.R](../R/expand.R)                                          |     0.00     |
| [R/summary.R](../R/summary.R)                                        |     0.00     |
| [R/pathwaysPerGene.R](../R/pathwaysPerGene.R)                        |     14.29    |
| [R/calc-nPathways.R](../R/calc-nPathways.R)                          |     33.33    |
| [R/simulateGSC.R](../R/simulateGSC.R)                                |     36.30    |
| [R/check-GSC.R](../R/check-GSC.R)                                    |     59.52    |
| [R/keep.R](../R/keep.R)                                              |     72.00    |
| [R/simulate2GSC.R](../R/simulate2GSC.R)                              |     78.38    |
| [R/fromSizeGenes\_sizePathways.R](../R/fromSizeGenes_sizePathways.R) |     78.57    |
| [R/as\_GeneSetCollection.R](../R/as_GeneSetCollection.R)             |     83.33    |
| [R/sizesPer.R](../R/sizesPer.R)                                      |     86.11    |
| [R/AllGenerics.R](../R/AllGenerics.R)                                |     90.24    |
| [R/genesPerGene.R](../R/genesPerGene.R)                              |     90.32    |
| [R/cond.R](../R/cond.R)                                              |     90.91    |
| [R/fromSizePathways.R](../R/fromSizePathways.R)                      |     92.50    |
| [R/add.R](../R/add.R)                                                |     92.59    |
| [R/pathway.R](../R/pathway.R)                                        |     94.64    |
| [R/remove.R](../R/remove.R)                                          |     95.65    |
| [R/nested.R](../R/nested.R)                                          |     97.14    |
| [R/duplicated.R](../R/duplicated.R)                                  |    100.00    |
| [R/estimate\_sizes.R](../R/estimate_sizes.R)                         |    100.00    |
| [R/fromSizeGenes.R](../R/fromSizeGenes.R)                            |    100.00    |
| [R/gene.R](../R/gene.R)                                              |    100.00    |
| [R/genesPerPathway.R](../R/genesPerPathway.R)                        |    100.00    |
| [R/modify.R](../R/modify.R)                                          |    100.00    |
| [R/n\_functions.R](../R/n_functions.R)                               |    100.00    |
| [R/sizes.R](../R/sizes.R)                                            |    100.00    |
| [R/utilities.R](../R/utilities.R)                                    |    100.00    |
| [R/zzz.R](../R/zzz.R)                                                |    100.00    |

<br>

Unit Tests
----------

Unit Test summary is created using the [testthat](https://github.com/r-lib/testthat) package.

|                             | file                                                               |    n|   time|  error|  failed|  skipped|  warning|
|-----------------------------|:-------------------------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| test\_add.R                 | [test\_add.R](testthat/test_add.R)                                 |    0|  0.003|      3|       0|        0|        0|
| test\_asGeneSetCollection.R | [test\_asGeneSetCollection.R](testthat/test_asGeneSetCollection.R) |    0|  0.003|      2|       0|        0|        0|
| test\_calcnPathways.R       | [test\_calcnPathways.R](testthat/test_calcnPathways.R)             |    0|  0.001|      1|       0|        0|        0|
| test\_check.R               | [test\_check.R](testthat/test_check.R)                             |    0|  0.001|      1|       0|        0|        0|
| test\_completness.R         | [test\_completness.R](testthat/test_completness.R)                 |    0|  0.009|      1|       0|        0|        0|
| test\_condPer.R             | [test\_condPer.R](testthat/test_condPer.R)                         |    0|  0.005|      4|       0|        0|        0|

<details open> <summary> Show Detailed Test Results </summary>

| file                                                                   | context                                  | test                     | status |    n|   time|
|:-----------------------------------------------------------------------|:-----------------------------------------|:-------------------------|:-------|----:|------:|
| [test\_add.R](testthat/test_add.R#L4)                                  | Testing adding method                    | gene as character        | ERROR  |    0|  0.001|
| [test\_add.R](testthat/test_add.R#L15)                                 | Testing adding method                    | pathway as character     | ERROR  |    0|  0.001|
| [test\_add.R](testthat/test_add.R#L31_L33)                             | Testing adding method                    | pathway as character     | ERROR  |    0|  0.001|
| [test\_asGeneSetCollection.R](testthat/test_asGeneSetCollection.R#L5)  | Testing list to GeneSetCollection method | info                     | ERROR  |    0|  0.002|
| [test\_asGeneSetCollection.R](testthat/test_asGeneSetCollection.R#L14) | Testing list to GeneSetCollection method | as.GeneSetCollection     | ERROR  |    0|  0.001|
| [test\_calcnPathways.R](testthat/test_calcnPathways.R#L6)              | calc.nPathways                           | works                    | ERROR  |    0|  0.001|
| [test\_check.R](testthat/test_check.R#L4)                              | Testing check-GSC methods                | isolation                | ERROR  |    0|  0.001|
| [test\_completness.R](testthat/test_completness.R#L9)                  | Testing utilities method                 | completness              | ERROR  |    0|  0.009|
| [test\_condPer.R](testthat/test_condPer.R#L5)                          | Testing cond\* method                    | condPerGenes missing     | ERROR  |    0|  0.001|
| [test\_condPer.R](testthat/test_condPer.R#L14)                         | Testing cond\* method                    | condPerGenes specific    | ERROR  |    0|  0.002|
| [test\_condPer.R](testthat/test_condPer.R#L23)                         | Testing cond\* method                    | condPerPathways missing  | ERROR  |    0|  0.001|
| [test\_condPer.R](testthat/test_condPer.R#L33)                         | Testing cond\* method                    | condPerPathways specific | ERROR  |    0|  0.001|

</details>

<details> <summary> Session Info </summary>

| Field    | Value                         |
|:---------|:------------------------------|
| Version  | R version 3.5.1 (2018-07-02)  |
| Platform | x86\_64-pc-linux-gnu (64-bit) |
| Running  | Ubuntu 16.04.5 LTS            |
| Language | en\_US                        |
| Timezone | Europe/Madrid                 |

| Package  | Version |
|:---------|:--------|
| testthat | 2.0.0   |
| covr     | 3.1.0   |
| covrpage | 0.0.52  |

</details>

<!--- Final Status : error/failed --->
