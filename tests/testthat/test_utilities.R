context("Testing utilities method")

expect_warning(test <- as.GeneSetCollection(info))

test_that("collectionType", {
  expect_length(collectionType(test), 1L)
  expect_equal(collectionType(test), "NullCollection")
})

test_that("genesPerPathway", {
  gpp <- genesPerPathway(test)
  expect_equal(gpp,structure(c(2L, 3L, 2L, 2L, 2L),
                             .Names = c("1430728", "156580",
                                        "156582", "194840", "211859")))
  expect_equal(length(gpp), nPathways(test))
})

test_that("pathwaysPerGene", {
  ppg <- pathwaysPerGene(test)
  expect_equal(ppg, structure(c(4L, 1L, 2L, 4L),
                              .Names = c("10", "2", "3", "9")))
  expect_equal(length(ppg), nGenes(test))
})

test_that("geneIdType", {
  expect_length(geneIdType(test), 1L)
  expect_equal(geneIdType(test), "NullIdentifier")
})

test_that("nGenes", {
  expect_equal(nGenes(test), 4L)
})

test_that("nPathways", {
  expect_equal(nPathways(test), 5L)
})