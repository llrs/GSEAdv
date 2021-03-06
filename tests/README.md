Tests and Coverage
================
25 noviembre, 2018 16:26:28

-   [Coverage](#coverage)
-   [Unit Tests](#unit-tests)

This output is created by [covrpage](https://github.com/yonicd/covrpage).

Coverage
--------

Coverage summary is created using the [covr](https://github.com/r-lib/covr) package.

| Object                                                               | Coverage (%) |
|:---------------------------------------------------------------------|:------------:|
| GSEAdv                                                               |     79.27    |
| [R/expand.R](../R/expand.R)                                          |     0.00     |
| [R/summary.R](../R/summary.R)                                        |     0.00     |
| [R/pathwaysPerGene.R](../R/pathwaysPerGene.R)                        |     14.29    |
| [R/calc-nPathways.R](../R/calc-nPathways.R)                          |     20.00    |
| [R/simulateGSC.R](../R/simulateGSC.R)                                |     39.26    |
| [R/check-GSC.R](../R/check-GSC.R)                                    |     71.43    |
| [R/estimate.R](../R/estimate.R)                                      |     73.08    |
| [R/simulate2GSC.R](../R/simulate2GSC.R)                              |     78.38    |
| [R/fromSizeGenes\_sizePathways.R](../R/fromSizeGenes_sizePathways.R) |     78.57    |
| [R/as\_GeneSetCollection.R](../R/as_GeneSetCollection.R)             |     83.33    |
| [R/sizesPer.R](../R/sizesPer.R)                                      |     86.11    |
| [R/keep.R](../R/keep.R)                                              |     88.00    |
| [R/AllGenerics.R](../R/AllGenerics.R)                                |     89.09    |
| [R/genesPerGene.R](../R/genesPerGene.R)                              |     90.32    |
| [R/cond.R](../R/cond.R)                                              |     90.91    |
| [R/fromSizePathways.R](../R/fromSizePathways.R)                      |     92.50    |
| [R/pathway.R](../R/pathway.R)                                        |     94.64    |
| [R/remove.R](../R/remove.R)                                          |     95.35    |
| [R/add.R](../R/add.R)                                                |     96.30    |
| [R/nested.R](../R/nested.R)                                          |     97.14    |
| [R/adjacency.R](../R/adjacency.R)                                    |    100.00    |
| [R/completness.R](../R/completness.R)                                |    100.00    |
| [R/distr.R](../R/distr.R)                                            |    100.00    |
| [R/duplicated.R](../R/duplicated.R)                                  |    100.00    |
| [R/edges.R](../R/edges.R)                                            |    100.00    |
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

| file                                                                              |    n|   time|  error|  failed|  skipped|  warning|
|:----------------------------------------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test\_add.R](testthat/test_add.R)                                                |   11|  0.093|      0|       0|        0|        0|
| [test\_asGeneSetCollection.R](testthat/test_asGeneSetCollection.R)                |    8|  0.040|      0|       0|        0|        0|
| [test\_calcnPathways.R](testthat/test_calcnPathways.R)                            |    1|  0.003|      0|       0|        0|        0|
| [test\_check.R](testthat/test_check.R)                                            |    1|  0.003|      0|       0|        0|        0|
| [test\_completness.R](testthat/test_completness.R)                                |    1|  0.001|      0|       0|        0|        0|
| [test\_condPer.R](testthat/test_condPer.R)                                        |   16|  0.042|      0|       0|        0|        0|
| [test\_drop.R](testthat/test_drop.R)                                              |   21|  0.111|      0|       0|        0|        0|
| [test\_duplicates.R](testthat/test_duplicates.R)                                  |    6|  0.010|      0|       0|        0|        0|
| [test\_estimate\_sizes.R](testthat/test_estimate_sizes.R)                         |    2|  0.004|      0|       0|        0|        0|
| [test\_fromSizeGenes\_sizePathways.R](testthat/test_fromSizeGenes_sizePathways.R) |    3|  0.014|      0|       0|        0|        0|
| [test\_fromSizeGenes.R](testthat/test_fromSizeGenes.R)                            |    2|  0.042|      0|       0|        0|        0|
| [test\_fromSizePathways.R](testthat/test_fromSizePathways.R)                      |    2|  0.015|      0|       0|        0|        0|
| [test\_gene.R](testthat/test_gene.R)                                              |    7|  0.039|      0|       0|        0|        0|
| [test\_genesPerGene.R](testthat/test_genesPerGene.R)                              |    6|  0.027|      0|       0|        0|        0|
| [test\_genesPerPathway.R](testthat/test_genesPerPathway.R)                        |    5|  0.008|      0|       0|        0|        0|
| [test\_keep.R](testthat/test_keep.R)                                              |    2|  0.003|      0|       0|        0|        0|
| [test\_keeps.R](testthat/test_keeps.R)                                            |    2|  0.015|      0|       0|        0|        0|
| [test\_modify.R](testthat/test_modify.R)                                          |   12|  0.062|      0|       0|        0|        0|
| [test\_nested.R](testthat/test_nested.R)                                          |    8|  0.066|      0|       0|        0|        0|
| [test\_pathway.R](testthat/test_pathway.R)                                        |    7|  0.033|      0|       0|        0|        0|
| [test\_simulations.R](testthat/test_simulations.R)                                |   13|  0.266|      0|       0|        0|        0|
| [test\_sizes.R](testthat/test_sizes.R)                                            |   22|  0.054|      0|       0|        0|        0|
| [test\_sizesPer.R](testthat/test_sizesPer.R)                                      |    6|  0.015|      0|       0|        0|        0|
| [test\_summary.R](testthat/test_summary.R)                                        |    1|  0.003|      0|       0|        0|        0|
| [test\_utilities.R](testthat/test_utilities.R)                                    |   21|  0.034|      0|       0|        0|        0|
| [test-adjacency.R](testthat/test-adjacency.R)                                     |    2|  0.003|      0|       0|        0|        0|
| [test-distr.R](testthat/test-distr.R)                                             |    4|  0.007|      0|       0|        0|        0|
| [test-edges.R](testthat/test-edges.R)                                             |    3|  0.004|      0|       0|        0|        0|
| [test-estimate.R](testthat/test-estimate.R)                                       |    5|  0.006|      0|       0|        0|        0|

<details closed> <summary> Show Detailed Test Results </summary>

| file                                                                                 | context                                          | test                               | status |    n|   time|
|:-------------------------------------------------------------------------------------|:-------------------------------------------------|:-----------------------------------|:-------|----:|------:|
| [test\_add.R](testthat/test_add.R#L6)                                                | Testing adding method                            | gene as character                  | PASS   |    4|  0.049|
| [test\_add.R](testthat/test_add.R#L17)                                               | Testing adding method                            | pathway as character               | PASS   |    5|  0.027|
| [test\_add.R](testthat/test_add.R#L31_L33)                                           | Testing adding method                            | pathway as character               | PASS   |    2|  0.017|
| [test\_asGeneSetCollection.R](testthat/test_asGeneSetCollection.R#L5)                | Testing list to GeneSetCollection method         | info                               | PASS   |    5|  0.029|
| [test\_asGeneSetCollection.R](testthat/test_asGeneSetCollection.R#L16)               | Testing list to GeneSetCollection method         | as.GeneSetCollection               | PASS   |    3|  0.011|
| [test\_calcnPathways.R](testthat/test_calcnPathways.R#L6)                            | calc.nPathways                                   | works                              | PASS   |    1|  0.003|
| [test\_check.R](testthat/test_check.R#L4)                                            | Testing check-GSC methods                        | isolation                          | PASS   |    1|  0.003|
| [test\_completness.R](testthat/test_completness.R#L9)                                | Testing utilities method                         | completness                        | PASS   |    1|  0.001|
| [test\_condPer.R](testthat/test_condPer.R#L6)                                        | Testing cond\* method                            | condPerGenes missing               | PASS   |    4|  0.009|
| [test\_condPer.R](testthat/test_condPer.R#L15)                                       | Testing cond\* method                            | condPerGenes specific              | PASS   |    4|  0.020|
| [test\_condPer.R](testthat/test_condPer.R#L24)                                       | Testing cond\* method                            | condPerPathways missing            | PASS   |    4|  0.006|
| [test\_condPer.R](testthat/test_condPer.R#L34)                                       | Testing cond\* method                            | condPerPathways specific           | PASS   |    4|  0.007|
| [test\_drop.R](testthat/test_drop.R#L5)                                              | Testing drop method                              | gene as character                  | PASS   |    6|  0.025|
| [test\_drop.R](testthat/test_drop.R#L18)                                             | Testing drop method                              | drop gene as numeric               | PASS   |    3|  0.014|
| [test\_drop.R](testthat/test_drop.R#L30)                                             | Testing drop method                              | pathway as character               | PASS   |    2|  0.033|
| [test\_drop.R](testthat/test_drop.R#L39)                                             | Testing drop method                              | drop pathway as numeric            | PASS   |    1|  0.009|
| [test\_drop.R](testthat/test_drop.R#L45)                                             | Testing drop method                              | pathway as character               | PASS   |    3|  0.012|
| [test\_drop.R](testthat/test_drop.R#L52)                                             | Testing drop method                              | pathway as character               | PASS   |    3|  0.010|
| [test\_drop.R](testthat/test_drop.R#L60)                                             | Testing drop method                              | dropRel                            | PASS   |    3|  0.008|
| [test\_duplicates.R](testthat/test_duplicates.R#L11)                                 | Testing duplications                             | duplicatedPathways                 | PASS   |    3|  0.005|
| [test\_duplicates.R](testthat/test_duplicates.R#L17)                                 | Testing duplications                             | duplicatedGenes                    | PASS   |    3|  0.005|
| [test\_estimate\_sizes.R](testthat/test_estimate_sizes.R#L4)                         | estimate.n\*                                     | estimate.nPathways works           | PASS   |    1|  0.002|
| [test\_estimate\_sizes.R](testthat/test_estimate_sizes.R#L9)                         | estimate.n\*                                     | estimate.nGenes works              | PASS   |    1|  0.002|
| [test\_fromSizeGenes\_sizePathways.R](testthat/test_fromSizeGenes_sizePathways.R#L8) | Testing fromSizeGenes\_sizePathways              | fromSizeGenes\_sizePathways        | PASS   |    3|  0.014|
| [test\_fromSizeGenes.R](testthat/test_fromSizeGenes.R#L6)                            | Testing fromSizeGenes method                     | fromSizeGenes                      | PASS   |    2|  0.042|
| [test\_fromSizePathways.R](testthat/test_fromSizePathways.R#L6)                      | Testing fromSizePathways method                  | fromSizePathways                   | PASS   |    2|  0.015|
| [test\_gene.R](testthat/test_gene.R#L5)                                              | Testing gene method                              | gene                               | PASS   |    3|  0.007|
| [test\_gene.R](testthat/test_gene.R#L12)                                             | Testing gene method                              | pathway                            | PASS   |    4|  0.032|
| [test\_genesPerGene.R](testthat/test_genesPerGene.R#L6)                              | Testing genePerGene                              | gene as character                  | PASS   |    2|  0.005|
| [test\_genesPerGene.R](testthat/test_genesPerGene.R#L14)                             | Testing genePerGene                              | gene as character                  | PASS   |    2|  0.018|
| [test\_genesPerGene.R](testthat/test_genesPerGene.R#L23)                             | Testing genePerGene                              | gene as character                  | PASS   |    2|  0.004|
| [test\_genesPerPathway.R](testthat/test_genesPerPathway.R#L5_L6)                     | genesPerPathway                                  | default                            | PASS   |    1|  0.002|
| [test\_genesPerPathway.R](testthat/test_genesPerPathway.R#L12)                       | genesPerPathway                                  | some pathway                       | PASS   |    4|  0.006|
| [test\_keep.R](testthat/test_keep.R#L5)                                              | Estimating numbers                               | double.factorial works             | PASS   |    2|  0.003|
| [test\_keeps.R](testthat/test_keeps.R#L5)                                            | keep.R                                           | keepPPG works                      | PASS   |    1|  0.003|
| [test\_keeps.R](testthat/test_keeps.R#L10)                                           | keep.R                                           | keepGPP works                      | PASS   |    1|  0.012|
| [test\_modify.R](testthat/test_modify.R#L6)                                          | Testing modify method                            | gene as character                  | PASS   |    6|  0.021|
| [test\_modify.R](testthat/test_modify.R#L22)                                         | Testing modify method                            | pathway as character               | PASS   |    4|  0.026|
| [test\_modify.R](testthat/test_modify.R#L36_L37)                                     | Testing modify method                            | pathway as character               | PASS   |    2|  0.015|
| [test\_nested.R](testthat/test_nested.R#L6)                                          | Testing nested method                            | nested                             | PASS   |    2|  0.003|
| [test\_nested.R](testthat/test_nested.R#L12_L13)                                     | Testing nested method                            | compare                            | PASS   |    6|  0.063|
| [test\_pathway.R](testthat/test_pathway.R#L5)                                        | Testing pathway method                           | pathway                            | PASS   |    3|  0.007|
| [test\_pathway.R](testthat/test_pathway.R#L11)                                       | Testing pathway method                           | pathway                            | PASS   |    4|  0.026|
| [test\_simulations.R](testthat/test_simulations.R#L5)                                | Testing simulations to create GeneSetCollections | fromGPP\_nGenes                    | PASS   |    4|  0.035|
| [test\_simulations.R](testthat/test_simulations.R#L16)                               | Testing simulations to create GeneSetCollections | fromPPG\_nPathways                 | PASS   |    5|  0.128|
| [test\_simulations.R](testthat/test_simulations.R#L42)                               | Testing simulations to create GeneSetCollections | fromPPG\_GPP                       | PASS   |    4|  0.103|
| [test\_sizes.R](testthat/test_sizes.R#L6)                                            | Testing sizePathways and sizeGenes               | Genes per Pathway and sizePathways | PASS   |    3|  0.006|
| [test\_sizes.R](testthat/test_sizes.R#L13)                                           | Testing sizePathways and sizeGenes               | Pathway per Genes and sizeGenes    | PASS   |    5|  0.010|
| [test\_sizes.R](testthat/test_sizes.R#L24)                                           | Testing sizePathways and sizeGenes               | Pathway per Genes and sizeGenes    | PASS   |    3|  0.006|
| [test\_sizes.R](testthat/test_sizes.R#L31)                                           | Testing sizePathways and sizeGenes               | Pathway per Genes and sizeGenes    | PASS   |    5|  0.018|
| [test\_sizes.R](testthat/test_sizes.R#L43)                                           | Testing sizePathways and sizeGenes               | Same output sizeGenes              | PASS   |    3|  0.007|
| [test\_sizes.R](testthat/test_sizes.R#L53)                                           | Testing sizePathways and sizeGenes               | Same output sizePathways           | PASS   |    3|  0.007|
| [test\_sizesPer.R](testthat/test_sizesPer.R#L3)                                      |                                                  | sizePathways                       | PASS   |    2|  0.004|
| [test\_sizesPer.R](testthat/test_sizesPer.R#L11)                                     |                                                  | sizeGenes                          | PASS   |    2|  0.004|
| [test\_sizesPer.R](testthat/test_sizesPer.R#L18)                                     |                                                  | sizePathways equivalent            | PASS   |    1|  0.004|
| [test\_sizesPer.R](testthat/test_sizesPer.R#L25)                                     |                                                  | sizePathways equivalent            | PASS   |    1|  0.003|
| [test\_summary.R](testthat/test_summary.R#L5)                                        | Testing summary method                           | summary                            | PASS   |    1|  0.003|
| [test\_utilities.R](testthat/test_utilities.R#L4)                                    | Testing utilities method                         | collectionType                     | PASS   |    2|  0.002|
| [test\_utilities.R](testthat/test_utilities.R#L9)                                    | Testing utilities method                         | genesPerPathway                    | PASS   |    3|  0.011|
| [test\_utilities.R](testthat/test_utilities.R#L19_L20)                               | Testing utilities method                         | pathwaysPerGene                    | PASS   |    2|  0.003|
| [test\_utilities.R](testthat/test_utilities.R#L25)                                   | Testing utilities method                         | geneIdType                         | PASS   |    2|  0.003|
| [test\_utilities.R](testthat/test_utilities.R#L30)                                   | Testing utilities method                         | nGenes                             | PASS   |    1|  0.001|
| [test\_utilities.R](testthat/test_utilities.R#L34)                                   | Testing utilities method                         | nPathways                          | PASS   |    1|  0.001|
| [test\_utilities.R](testthat/test_utilities.R#L39)                                   | Testing utilities method                         | h\_index                           | PASS   |    4|  0.005|
| [test\_utilities.R](testthat/test_utilities.R#L76)                                   | Testing utilities method                         | IC                                 | PASS   |    4|  0.006|
| [test\_utilities.R](testthat/test_utilities.R#L88)                                   | Testing utilities method                         | inverseList                        | PASS   |    1|  0.001|
| [test\_utilities.R](testthat/test_utilities.R#L94)                                   | Testing utilities method                         | names\_vec                         | PASS   |    1|  0.001|
| [test-adjacency.R](testthat/test-adjacency.R#L5)                                     | test-adjacency                                   | adjacency works                    | PASS   |    2|  0.003|
| [test-distr.R](testthat/test-distr.R#L5)                                             | test-distr                                       | distrGenes works                   | PASS   |    2|  0.004|
| [test-distr.R](testthat/test-distr.R#L11)                                            | test-distr                                       | distrPathways works                | PASS   |    2|  0.003|
| [test-edges.R](testthat/test-edges.R#L4)                                             | test-edges                                       | edges works                        | PASS   |    1|  0.002|
| [test-edges.R](testthat/test-edges.R#L8)                                             | test-edges                                       | nEdges works                       | PASS   |    1|  0.001|
| [test-edges.R](testthat/test-edges.R#L13)                                            | test-edges                                       | edges and nEdges match             | PASS   |    1|  0.001|
| [test-estimate.R](testthat/test-estimate.R#L5)                                       | test-estimate                                    | estimate works                     | PASS   |    5|  0.006|

</details>

<details> <summary> Session Info </summary>

| Field    | Value                         |
|:---------|:------------------------------|
| Version  | R version 3.5.1 (2018-07-02)  |
| Platform | x86\_64-pc-linux-gnu (64-bit) |
| Running  | Ubuntu 18.04.1 LTS            |
| Language | en\_US                        |
| Timezone | Europe/Madrid                 |

| Package  | Version |
|:---------|:--------|
| testthat | 2.0.1   |
| covr     | 3.2.1   |
| covrpage | 0.0.65  |

</details>

<!--- Final Status : pass --->
