context("Testing drop method")

expect_warning(test <- as.GeneSetCollection(info))

test_that("gene as character", {

  expect_warning(gsc <- drop(test, gene = "2"), "Removing ")

  expect_false("2" %in% names(inverseList(geneIds(gsc))))
  expect_equal(nGenes(gsc), nGenes(test) -1)
})


test_that("drop gene as numeric", {

  expect_warning(gsc <- drop(test, gene = 2), "Removing ")

  expect_equal(nGenes(gsc), nGenes(test) - 2)
})


test_that("pathway as character", {

  gsc <- drop(test, pathway = "156580")

  expect_false("2" %in% names(geneIds(gsc)))
  expect_equal(nPathways(gsc), nPathways(test) -1)
})


test_that("drop pathway as numeric", {

  gsc <- drop(test, pathway = 2)

  expect_equal(nPathways(gsc), nPathways(test) - 2)
})
