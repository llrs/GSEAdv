Tests and Coverage
================
01 mayo, 2018 20:27:35

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by [covrpage](https://github.com/yonicd/covrpage).

Coverage
--------

Coverage summary is created using the [covr](https://github.com/r-lib/covr) package.

| Object                                                               | Coverage (%) |
|:---------------------------------------------------------------------|:------------:|
| GSEAdv                                                               |     62.81    |
| [R/expand.R](../R/expand.R)                                          |     0.00     |
| [R/summary.R](../R/summary.R)                                        |     0.00     |
| [R/simulateGSC.R](../R/simulateGSC.R)                                |     33.88    |
| [R/nested.R](../R/nested.R)                                          |     36.84    |
| [R/pathway.R](../R/pathway.R)                                        |     45.76    |
| [R/gene.R](../R/gene.R)                                              |     49.12    |
| [R/genesPerPathway.R](../R/genesPerPathway.R)                        |     50.00    |
| [R/remove.R](../R/remove.R)                                          |     50.00    |
| [R/check-GSC.R](../R/check-GSC.R)                                    |     60.78    |
| [R/add.R](../R/add.R)                                                |     66.67    |
| [R/pathwaysPerGene.R](../R/pathwaysPerGene.R)                        |     66.67    |
| [R/modify.R](../R/modify.R)                                          |     70.83    |
| [R/fromSizeGenes\_sizePathways.R](../R/fromSizeGenes_sizePathways.R) |     80.65    |
| [R/simulate2GSC.R](../R/simulate2GSC.R)                              |     82.61    |
| [R/as\_GeneSetCollection.R](../R/as_GeneSetCollection.R)             |     83.33    |
| [R/AllGenerics.R](../R/AllGenerics.R)                                |     87.88    |
| [R/fromSizePathways.R](../R/fromSizePathways.R)                      |     93.33    |
| [R/cond.R](../R/cond.R)                                              |     98.33    |
| [R/completness.R](../R/completness.R)                                |    100.00    |
| [R/duplicated.R](../R/duplicated.R)                                  |    100.00    |
| [R/fromSizeGenes.R](../R/fromSizeGenes.R)                            |    100.00    |
| [R/n\_functions.R](../R/n_functions.R)                               |    100.00    |
| [R/sizes.R](../R/sizes.R)                                            |    100.00    |
| [R/utilities.R](../R/utilities.R)                                    |    100.00    |
| [R/zzz.R](../R/zzz.R)                                                |    100.00    |

<br>

Unit Tests
----------

Unit Test summary is created using the [testthat](https://github.com/r-lib/testthat) package.

| file                                                                              |    n|   time|  error|  failed|  skipped|  warning|
|:----------------------------------------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test\_add.R](testthat/test_add.R)                                                |    9|  0.068|      0|       0|        0|        0|
| [test\_asGeneSetCollection.R](testthat/test_asGeneSetCollection.R)                |    8|  0.030|      0|       0|        0|        0|
| [test\_completness.R](testthat/test_completness.R)                                |    1|  0.001|      0|       0|        0|        0|
| [test\_condPer.R](testthat/test_condPer.R)                                        |   16|  0.047|      0|       0|        0|        0|
| [test\_drop.R](testthat/test_drop.R)                                              |   12|  0.087|      0|       0|        0|        0|
| [test\_duplicates.R](testthat/test_duplicates.R)                                  |    6|  0.012|      0|       0|        0|        0|
| [test\_fromSizeGenes.R](testthat/test_fromSizeGenes.R)                            |    2|  0.215|      0|       0|        0|        0|
| [test\_fromSizeGenes\_sizePathways.R](testthat/test_fromSizeGenes_sizePathways.R) |    3|  0.042|      0|       0|        0|        0|
| [test\_fromSizePathways.R](testthat/test_fromSizePathways.R)                      |    2|  0.014|      0|       0|        0|        0|
| [test\_gene.R](testthat/test_gene.R)                                              |    3|  0.009|      0|       0|        0|        0|
| [test\_modify.R](testthat/test_modify.R)                                          |   10|  0.062|      0|       0|        0|        0|
| [test\_nested.R](testthat/test_nested.R)                                          |    2|  0.003|      0|       0|        0|        0|
| [test\_pathway.R](testthat/test_pathway.R)                                        |    3|  0.008|      0|       0|        0|        0|
| [test\_simulations.R](testthat/test_simulations.R)                                |   13|  0.843|      0|       0|        0|        0|
| [test\_sizes.R](testthat/test_sizes.R)                                            |   16|  0.089|      0|       0|        0|        0|
| [test\_summary.R](testthat/test_summary.R)                                        |    1|  0.009|      0|       0|        0|        0|
| [test\_utilities.R](testthat/test_utilities.R)                                    |   20|  0.044|      0|       0|        0|        0|

| file                                                                              | test                               | context                                          | status |    n|   time|
|:----------------------------------------------------------------------------------|:-----------------------------------|:-------------------------------------------------|:-------|----:|------:|
| [test\_add.R](testthat/test_add.R)                                                | gene as character                  | Testing add method                               | PASS   |    4|  0.017|
| [test\_add.R](testthat/test_add.R)                                                | pathway as character               | Testing add method                               | PASS   |    5|  0.051|
| [test\_asGeneSetCollection.R](testthat/test_asGeneSetCollection.R)                | info                               | Testing list to GeneSetCollection method         | PASS   |    5|  0.021|
| [test\_asGeneSetCollection.R](testthat/test_asGeneSetCollection.R)                | as.GeneSetCollection               | Testing list to GeneSetCollection method         | PASS   |    3|  0.009|
| [test\_completness.R](testthat/test_completness.R)                                | completness                        | Testing utilities method                         | PASS   |    1|  0.001|
| [test\_condPer.R](testthat/test_condPer.R)                                        | condPerGenes missing               | Testing cond\* method                            | PASS   |    4|  0.009|
| [test\_condPer.R](testthat/test_condPer.R)                                        | condPerGenes specific              | Testing cond\* method                            | PASS   |    4|  0.021|
| [test\_condPer.R](testthat/test_condPer.R)                                        | condPerPathways missing            | Testing cond\* method                            | PASS   |    4|  0.009|
| [test\_condPer.R](testthat/test_condPer.R)                                        | condPerPathways specific           | Testing cond\* method                            | PASS   |    4|  0.008|
| [test\_drop.R](testthat/test_drop.R)                                              | gene as character                  | Testing drop method                              | PASS   |    6|  0.029|
| [test\_drop.R](testthat/test_drop.R)                                              | drop gene as numeric               | Testing drop method                              | PASS   |    3|  0.044|
| [test\_drop.R](testthat/test_drop.R)                                              | pathway as character               | Testing drop method                              | PASS   |    2|  0.008|
| [test\_drop.R](testthat/test_drop.R)                                              | drop pathway as numeric            | Testing drop method                              | PASS   |    1|  0.006|
| [test\_duplicates.R](testthat/test_duplicates.R)                                  | duplicatedPathways                 | Testing duplications                             | PASS   |    3|  0.006|
| [test\_duplicates.R](testthat/test_duplicates.R)                                  | duplicatedGenes                    | Testing duplications                             | PASS   |    3|  0.006|
| [test\_fromSizeGenes.R](testthat/test_fromSizeGenes.R)                            | fromSizeGenes                      | Testing drop method                              | PASS   |    2|  0.215|
| [test\_fromSizeGenes\_sizePathways.R](testthat/test_fromSizeGenes_sizePathways.R) | fromSizeGenes\_sizePathways        | Testing fromSizeGenes\_sizePathways              | PASS   |    3|  0.042|
| [test\_fromSizePathways.R](testthat/test_fromSizePathways.R)                      | fromSizePathways                   | Testing drop method                              | PASS   |    2|  0.014|
| [test\_gene.R](testthat/test_gene.R)                                              | gene                               | Testing gene method                              | PASS   |    3|  0.009|
| [test\_modify.R](testthat/test_modify.R)                                          | gene as character                  | Testing modify method                            | PASS   |    6|  0.026|
| [test\_modify.R](testthat/test_modify.R)                                          | pathway as character               | Testing modify method                            | PASS   |    4|  0.036|
| [test\_nested.R](testthat/test_nested.R)                                          | nested                             | Testing nested method                            | PASS   |    2|  0.003|
| [test\_pathway.R](testthat/test_pathway.R)                                        | pathway                            | Testing pathway method                           | PASS   |    3|  0.008|
| [test\_simulations.R](testthat/test_simulations.R)                                | fromGPP\_nGenes                    | Testing simulations to create GeneSetCollections | PASS   |    4|  0.058|
| [test\_simulations.R](testthat/test_simulations.R)                                | fromPPG\_nPathways                 | Testing simulations to create GeneSetCollections | PASS   |    5|  0.091|
| [test\_simulations.R](testthat/test_simulations.R)                                | fromPPG\_GPP                       | Testing simulations to create GeneSetCollections | PASS   |    4|  0.694|
| [test\_sizes.R](testthat/test_sizes.R)                                            | Genes per Pathway and sizePathways | Testing sizePathways and sizeGenes               | PASS   |    3|  0.010|
| [test\_sizes.R](testthat/test_sizes.R)                                            | Pathway per Genes and sizeGenes    | Testing sizePathways and sizeGenes               | PASS   |    5|  0.036|
| [test\_sizes.R](testthat/test_sizes.R)                                            | Pathway per Genes and sizeGenes    | Testing sizePathways and sizeGenes               | PASS   |    3|  0.012|
| [test\_sizes.R](testthat/test_sizes.R)                                            | Pathway per Genes and sizeGenes    | Testing sizePathways and sizeGenes               | PASS   |    5|  0.031|
| [test\_summary.R](testthat/test_summary.R)                                        | summary                            | Testing summary method                           | PASS   |    1|  0.009|
| [test\_utilities.R](testthat/test_utilities.R)                                    | collectionType                     | Testing utilities method                         | PASS   |    2|  0.007|
| [test\_utilities.R](testthat/test_utilities.R)                                    | genesPerPathway                    | Testing utilities method                         | PASS   |    2|  0.005|
| [test\_utilities.R](testthat/test_utilities.R)                                    | pathwaysPerGene                    | Testing utilities method                         | PASS   |    2|  0.005|
| [test\_utilities.R](testthat/test_utilities.R)                                    | geneIdType                         | Testing utilities method                         | PASS   |    2|  0.003|
| [test\_utilities.R](testthat/test_utilities.R)                                    | nGenes                             | Testing utilities method                         | PASS   |    1|  0.003|
| [test\_utilities.R](testthat/test_utilities.R)                                    | nPathways                          | Testing utilities method                         | PASS   |    1|  0.002|
| [test\_utilities.R](testthat/test_utilities.R)                                    | h\_index                           | Testing utilities method                         | PASS   |    4|  0.008|
| [test\_utilities.R](testthat/test_utilities.R)                                    | IC                                 | Testing utilities method                         | PASS   |    4|  0.008|
| [test\_utilities.R](testthat/test_utilities.R)                                    | inverseList                        | Testing utilities method                         | PASS   |    1|  0.002|
| [test\_utilities.R](testthat/test_utilities.R)                                    | names\_vec                         | Testing utilities method                         | PASS   |    1|  0.001|
