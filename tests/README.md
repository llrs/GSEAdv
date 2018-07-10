Tests and Coverage
================
10 julio, 2018 22:28:27

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by [covrpage](https://github.com/yonicd/covrpage).

Coverage
--------

Coverage summary is created using the [covr](https://github.com/r-lib/covr) package.

| Object                                                               | Coverage (%) |
|:---------------------------------------------------------------------|:------------:|
| GSEAdv                                                               |     78.82    |
| [R/expand.R](../R/expand.R)                                          |     0.00     |
| [R/summary.R](../R/summary.R)                                        |     0.00     |
| [R/pathwaysPerGene.R](../R/pathwaysPerGene.R)                        |     14.29    |
| [R/simulateGSC.R](../R/simulateGSC.R)                                |     36.57    |
| [R/check-GSC.R](../R/check-GSC.R)                                    |     71.43    |
| [R/simulate2GSC.R](../R/simulate2GSC.R)                              |     78.38    |
| [R/fromSizeGenes\_sizePathways.R](../R/fromSizeGenes_sizePathways.R) |     78.57    |
| [R/as\_GeneSetCollection.R](../R/as_GeneSetCollection.R)             |     83.33    |
| [R/sizesPer.R](../R/sizesPer.R)                                      |     86.11    |
| [R/genesPerGene.R](../R/genesPerGene.R)                              |     90.32    |
| [R/cond.R](../R/cond.R)                                              |     90.91    |
| [R/fromSizePathways.R](../R/fromSizePathways.R)                      |     92.50    |
| [R/pathway.R](../R/pathway.R)                                        |     94.64    |
| [R/AllGenerics.R](../R/AllGenerics.R)                                |     95.12    |
| [R/remove.R](../R/remove.R)                                          |     95.65    |
| [R/add.R](../R/add.R)                                                |     96.30    |
| [R/nested.R](../R/nested.R)                                          |     97.14    |
| [R/completness.R](../R/completness.R)                                |    100.00    |
| [R/duplicated.R](../R/duplicated.R)                                  |    100.00    |
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

| file                                                                              |    n|   time|  error|  failed|  skipped|  warning|
|:----------------------------------------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test\_add.R](testthat/test_add.R)                                                |   11|  0.383|      0|       0|        0|        0|
| [test\_asGeneSetCollection.R](testthat/test_asGeneSetCollection.R)                |    8|  0.030|      0|       0|        0|        0|
| [test\_check.R](testthat/test_check.R)                                            |    1|  0.002|      0|       0|        0|        0|
| [test\_completness.R](testthat/test_completness.R)                                |    1|  0.002|      0|       0|        0|        0|
| [test\_condPer.R](testthat/test_condPer.R)                                        |   16|  0.051|      0|       0|        0|        0|
| [test\_drop.R](testthat/test_drop.R)                                              |   22|  0.083|      0|       0|        0|        0|
| [test\_duplicates.R](testthat/test_duplicates.R)                                  |    6|  0.011|      0|       0|        0|        0|
| [test\_fromSizeGenes.R](testthat/test_fromSizeGenes.R)                            |    2|  4.032|      0|       0|        0|        0|
| [test\_fromSizeGenes\_sizePathways.R](testthat/test_fromSizeGenes_sizePathways.R) |    3|  0.064|      0|       0|        0|        0|
| [test\_fromSizePathways.R](testthat/test_fromSizePathways.R)                      |    2|  0.050|      0|       0|        0|        0|
| [test\_gene.R](testthat/test_gene.R)                                              |    7|  0.032|      0|       0|        0|        0|
| [test\_genesPerGene.R](testthat/test_genesPerGene.R)                              |    6|  0.013|      0|       0|        0|        0|
| [test\_genesPerPathway.R](testthat/test_genesPerPathway.R)                        |    5|  0.008|      0|       0|        0|        0|
| [test\_modify.R](testthat/test_modify.R)                                          |   12|  0.059|      0|       0|        0|        0|
| [test\_nested.R](testthat/test_nested.R)                                          |    8|  0.033|      0|       0|        0|        0|
| [test\_pathway.R](testthat/test_pathway.R)                                        |    7|  0.032|      0|       0|        0|        0|
| [test\_simulations.R](testthat/test_simulations.R)                                |   13|  0.358|      0|       0|        0|        0|
| [test\_sizesPer.R](testthat/test_sizesPer.R)                                      |    6|  0.015|      0|       0|        0|        0|
| [test\_sizes.R](testthat/test_sizes.R)                                            |   22|  0.044|      0|       0|        0|        0|
| [test\_summary.R](testthat/test_summary.R)                                        |    1|  0.018|      0|       0|        0|        0|
| [test\_utilities.R](testthat/test_utilities.R)                                    |   21|  0.027|      0|       0|        0|        0|

| file                                                                              | test                               | context                                          | status |    n|   time|
|:----------------------------------------------------------------------------------|:-----------------------------------|:-------------------------------------------------|:-------|----:|------:|
| [test\_add.R](testthat/test_add.R)                                                | gene as character                  | Testing adding method                            | PASS   |    4|  0.021|
| [test\_add.R](testthat/test_add.R)                                                | pathway as character               | Testing adding method                            | PASS   |    5|  0.342|
| [test\_add.R](testthat/test_add.R)                                                | pathway as character               | Testing adding method                            | PASS   |    2|  0.020|
| [test\_asGeneSetCollection.R](testthat/test_asGeneSetCollection.R)                | info                               | Testing list to GeneSetCollection method         | PASS   |    5|  0.021|
| [test\_asGeneSetCollection.R](testthat/test_asGeneSetCollection.R)                | as.GeneSetCollection               | Testing list to GeneSetCollection method         | PASS   |    3|  0.009|
| [test\_check.R](testthat/test_check.R)                                            | isolation                          | Testing check-GSC methods                        | PASS   |    1|  0.002|
| [test\_completness.R](testthat/test_completness.R)                                | completness                        | Testing utilities method                         | PASS   |    1|  0.002|
| [test\_condPer.R](testthat/test_condPer.R)                                        | condPerGenes missing               | Testing cond\* method                            | PASS   |    4|  0.006|
| [test\_condPer.R](testthat/test_condPer.R)                                        | condPerGenes specific              | Testing cond\* method                            | PASS   |    4|  0.020|
| [test\_condPer.R](testthat/test_condPer.R)                                        | condPerPathways missing            | Testing cond\* method                            | PASS   |    4|  0.006|
| [test\_condPer.R](testthat/test_condPer.R)                                        | condPerPathways specific           | Testing cond\* method                            | PASS   |    4|  0.019|
| [test\_drop.R](testthat/test_drop.R)                                              | gene as character                  | Testing drop method                              | PASS   |    6|  0.023|
| [test\_drop.R](testthat/test_drop.R)                                              | drop gene as numeric               | Testing drop method                              | PASS   |    3|  0.013|
| [test\_drop.R](testthat/test_drop.R)                                              | pathway as character               | Testing drop method                              | PASS   |    2|  0.006|
| [test\_drop.R](testthat/test_drop.R)                                              | drop pathway as numeric            | Testing drop method                              | PASS   |    1|  0.005|
| [test\_drop.R](testthat/test_drop.R)                                              | pathway as character               | Testing drop method                              | PASS   |    3|  0.011|
| [test\_drop.R](testthat/test_drop.R)                                              | pathway as character               | Testing drop method                              | PASS   |    3|  0.009|
| [test\_drop.R](testthat/test_drop.R)                                              | dropRel                            | Testing drop method                              | PASS   |    4|  0.016|
| [test\_duplicates.R](testthat/test_duplicates.R)                                  | duplicatedPathways                 | Testing duplications                             | PASS   |    3|  0.005|
| [test\_duplicates.R](testthat/test_duplicates.R)                                  | duplicatedGenes                    | Testing duplications                             | PASS   |    3|  0.006|
| [test\_fromSizeGenes.R](testthat/test_fromSizeGenes.R)                            | fromSizeGenes                      | Testing fromSizeGenes method                     | PASS   |    2|  4.032|
| [test\_fromSizeGenes\_sizePathways.R](testthat/test_fromSizeGenes_sizePathways.R) | fromSizeGenes\_sizePathways        | Testing fromSizeGenes\_sizePathways              | PASS   |    3|  0.064|
| [test\_fromSizePathways.R](testthat/test_fromSizePathways.R)                      | fromSizePathways                   | Testing fromSizePathways method                  | PASS   |    2|  0.050|
| [test\_gene.R](testthat/test_gene.R)                                              | gene                               | Testing gene method                              | PASS   |    3|  0.022|
| [test\_gene.R](testthat/test_gene.R)                                              | pathway                            | Testing gene method                              | PASS   |    4|  0.010|
| [test\_genesPerGene.R](testthat/test_genesPerGene.R)                              | gene as character                  | Testing genePerGene                              | PASS   |    2|  0.005|
| [test\_genesPerGene.R](testthat/test_genesPerGene.R)                              | gene as character                  | Testing genePerGene                              | PASS   |    2|  0.004|
| [test\_genesPerGene.R](testthat/test_genesPerGene.R)                              | gene as character                  | Testing genePerGene                              | PASS   |    2|  0.004|
| [test\_genesPerPathway.R](testthat/test_genesPerPathway.R)                        | default                            | genesPerPathway                                  | PASS   |    1|  0.002|
| [test\_genesPerPathway.R](testthat/test_genesPerPathway.R)                        | some pathway                       | genesPerPathway                                  | PASS   |    4|  0.006|
| [test\_modify.R](testthat/test_modify.R)                                          | gene as character                  | Testing modify method                            | PASS   |    6|  0.022|
| [test\_modify.R](testthat/test_modify.R)                                          | pathway as character               | Testing modify method                            | PASS   |    4|  0.019|
| [test\_modify.R](testthat/test_modify.R)                                          | pathway as character               | Testing modify method                            | PASS   |    2|  0.018|
| [test\_nested.R](testthat/test_nested.R)                                          | nested                             | Testing nested method                            | PASS   |    2|  0.003|
| [test\_nested.R](testthat/test_nested.R)                                          | compare                            | Testing nested method                            | PASS   |    6|  0.030|
| [test\_pathway.R](testthat/test_pathway.R)                                        | pathway                            | Testing pathway method                           | PASS   |    3|  0.022|
| [test\_pathway.R](testthat/test_pathway.R)                                        | pathway                            | Testing pathway method                           | PASS   |    4|  0.010|
| [test\_simulations.R](testthat/test_simulations.R)                                | fromGPP\_nGenes                    | Testing simulations to create GeneSetCollections | PASS   |    4|  0.020|
| [test\_simulations.R](testthat/test_simulations.R)                                | fromPPG\_nPathways                 | Testing simulations to create GeneSetCollections | PASS   |    5|  0.032|
| [test\_simulations.R](testthat/test_simulations.R)                                | fromPPG\_GPP                       | Testing simulations to create GeneSetCollections | PASS   |    4|  0.306|
| [test\_sizesPer.R](testthat/test_sizesPer.R)                                      | sizePathways                       |                                                  | PASS   |    2|  0.004|
| [test\_sizesPer.R](testthat/test_sizesPer.R)                                      | sizeGenes                          |                                                  | PASS   |    2|  0.004|
| [test\_sizesPer.R](testthat/test_sizesPer.R)                                      | sizePathways equivalent            |                                                  | PASS   |    1|  0.004|
| [test\_sizesPer.R](testthat/test_sizesPer.R)                                      | sizePathways equivalent            |                                                  | PASS   |    1|  0.003|
| [test\_sizes.R](testthat/test_sizes.R)                                            | Genes per Pathway and sizePathways | Testing sizePathways and sizeGenes               | PASS   |    3|  0.005|
| [test\_sizes.R](testthat/test_sizes.R)                                            | Pathway per Genes and sizeGenes    | Testing sizePathways and sizeGenes               | PASS   |    5|  0.009|
| [test\_sizes.R](testthat/test_sizes.R)                                            | Pathway per Genes and sizeGenes    | Testing sizePathways and sizeGenes               | PASS   |    3|  0.006|
| [test\_sizes.R](testthat/test_sizes.R)                                            | Pathway per Genes and sizeGenes    | Testing sizePathways and sizeGenes               | PASS   |    5|  0.011|
| [test\_sizes.R](testthat/test_sizes.R)                                            | Same output sizeGenes              | Testing sizePathways and sizeGenes               | PASS   |    3|  0.007|
| [test\_sizes.R](testthat/test_sizes.R)                                            | Same output sizePathways           | Testing sizePathways and sizeGenes               | PASS   |    3|  0.006|
| [test\_summary.R](testthat/test_summary.R)                                        | summary                            | Testing summary method                           | PASS   |    1|  0.018|
| [test\_utilities.R](testthat/test_utilities.R)                                    | collectionType                     | Testing utilities method                         | PASS   |    2|  0.002|
| [test\_utilities.R](testthat/test_utilities.R)                                    | genesPerPathway                    | Testing utilities method                         | PASS   |    3|  0.004|
| [test\_utilities.R](testthat/test_utilities.R)                                    | pathwaysPerGene                    | Testing utilities method                         | PASS   |    2|  0.003|
| [test\_utilities.R](testthat/test_utilities.R)                                    | geneIdType                         | Testing utilities method                         | PASS   |    2|  0.003|
| [test\_utilities.R](testthat/test_utilities.R)                                    | nGenes                             | Testing utilities method                         | PASS   |    1|  0.002|
| [test\_utilities.R](testthat/test_utilities.R)                                    | nPathways                          | Testing utilities method                         | PASS   |    1|  0.001|
| [test\_utilities.R](testthat/test_utilities.R)                                    | h\_index                           | Testing utilities method                         | PASS   |    4|  0.005|
| [test\_utilities.R](testthat/test_utilities.R)                                    | IC                                 | Testing utilities method                         | PASS   |    4|  0.005|
| [test\_utilities.R](testthat/test_utilities.R)                                    | inverseList                        | Testing utilities method                         | PASS   |    1|  0.001|
| [test\_utilities.R](testthat/test_utilities.R)                                    | names\_vec                         | Testing utilities method                         | PASS   |    1|  0.001|
