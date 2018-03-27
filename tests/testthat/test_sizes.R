context("Testing sizePathways and sizeGenes")

expect_warning(test <- as.GeneSetCollection(info))

test_that("Genes per Pathway and sizePathways", {
  gpp <- genesPerPathway(test)
  m <- sizePathways(test)
  expect_equal(colSums(m), gpp)
  expect_equal(ncol(m), nPathways(test))
  expect_equal(nrow(m), length(unique(pathwaysPerGene(test))))
})



test_that("Pathway per Genes and sizeGenes", {
  ppg <- pathwaysPerGene(test)
  m <- sizeGenes(test)
  expect_equal(colSums(m), ppg)
  expect_equal(ncol(m), nGenes(test))
  expect_equal(nrow(m), length(unique(genesPerPathway(test))))
})
