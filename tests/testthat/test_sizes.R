context("Testing sizePathways and sizeGenes")

expect_warning(Info <- as.GeneSetCollection(info))

test_that("Genes per Pathway and sizePathways", {
  gpp <- genesPerPathway(Info)
  m <- sizePathways(Info)
  expect_equal(colSums(m), gpp)
  expect_equal(ncol(m), nPathways(Info))
  expect_equal(nrow(m), length(unique(pathwaysPerGene(Info))))
})

test_that("Pathway per Genes and sizeGenes", {
  m <- sizePathways(Info, c("156580", "156582"))
  expect_equal(nrow(m), 2L)
  expect_equal(ncol(m), 2L)
  expect_equal(names(dimnames(m)), c("pathwaysPerGene", "Pathway"))
  expect_warning(sizePathways(Info, c("156580", "156582", "a")))
  expect_error(sizePathways(Info, c("a", "b", "c")))
})


test_that("Pathway per Genes and sizeGenes", {
  ppg <- pathwaysPerGene(Info)
  m <- sizeGenes(Info)
  expect_equal(colSums(m), ppg)
  expect_equal(ncol(m), nGenes(Info))
  expect_equal(nrow(m), length(unique(genesPerPathway(Info))))
})

test_that("Pathway per Genes and sizeGenes", {
  m <- sizeGenes(Info, c("10", "2"))
  expect_equal(nrow(m), 1L)
  expect_equal(ncol(m), 2L)
  expect_equal(names(dimnames(m)), c("genePerPathway", "Gene"))
  expect_warning(sizeGenes(Info, c("10", "2", "a")))
  expect_error(sizeGenes(Info, c("a", "b", "c")))
})
