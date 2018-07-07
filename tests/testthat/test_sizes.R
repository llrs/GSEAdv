context("Testing sizePathways and sizeGenes")

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
  expect_equal(nrow(m), 2L)
  expect_equal(ncol(m), 2L)
  expect_equal(names(dimnames(m)), c("genePerPathway", "Gene"))
  expect_warning(sizeGenes(Info, c("10", "2", "a")))
  expect_error(sizeGenes(Info, c("a", "b", "c")))
})


test_that("Same output sizeGenes", {
  out1 <- sizeGenes(Info, "2")
  out2 <- sizeGenes(Info, c("2", "3"))
  out3 <- sizeGenes(Info)
  expect_true(out1["2", "2"] == out2["2", "2"])
  expect_true(out2["2", "2"] == out3["2", "2"])
  expect_equal(out2[, "3"], out3[, "3"])
})


test_that("Same output sizePathways", {
  out1 <- sizePathways(Info, "1430728")
  out2 <- sizePathways(Info, c("1430728", "156580"))
  out3 <- sizePathways(Info)
  expect_true(out1["4", "1430728"] == out2["4", "1430728"])
  expect_true(out2["2", "1430728"] == out3["2", "1430728"])
  expect_equal(out2[c("2", "4"),"156580"], out3[c("2", "4"), "156580"])
})
