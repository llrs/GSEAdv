context("Testing drop method")

expect_warning(test <- as.GeneSetCollection(info))

test_that("gene as character", {
  set.seed(501)
  expect_warning(gsc <- drop(test, gene = "2"), "Removing ")

  expect_false("2" %in% names(inverseList(geneIds(gsc))))
  expect_equal(nGenes(gsc), nGenes(test) -1)

  expect_warning(gsc <- drop(test, gene = c("2", "9")), "Removing ")
  expect_false(all(c("2", "9") %in% names(inverseList(geneIds(gsc)))))
  expect_equal(nGenes(gsc), nGenes(test) -2)
})


test_that("drop gene as numeric", {
  # TODO: FIXME: Only 50% of time it will work, set a seed or somethin
  # expect_warning(gsc <- drop(test, gene = 2), "Removing ")
  #
  # expect_equal(nGenes(gsc), nGenes(test) - 2)

  expect_error(gsc <- drop(test, gene = 3), "All pathways ")
})


test_that("pathway as character", {
  set.seed(501)
  gsc <- drop(test, pathway = "156580")

  expect_false("2" %in% names(geneIds(gsc)))
  expect_equal(nPathways(gsc), nPathways(test) -1)
})


test_that("drop pathway as numeric", {
  set.seed(501)
  gsc <- drop(test, pathway = 2)

  expect_equal(nPathways(gsc), nPathways(test) - 2)
})
