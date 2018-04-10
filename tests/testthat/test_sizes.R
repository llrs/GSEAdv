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
  expect_s3_class(m[[1]], "table")
  expect_length(m, 2L)
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
  expect_s3_class(m[[1]], "table")
  expect_length(m, 2L)
})
