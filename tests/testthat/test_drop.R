context("Testing drop method")

test_that("gene as character", {
  set.seed(501)
  expect_warning(gsc <- drop(Info, gene = "2"), "Removing ")

  expect_false("2" %in% names(inverseList(geneIds(gsc))))
  expect_equal(nGenes(gsc), nGenes(Info) -1)

  expect_warning(gsc <- drop(Info, gene = c("2", "9")), "Removing ")
  expect_false(all(c("2", "9") %in% names(inverseList(geneIds(gsc)))))
  expect_equal(nGenes(gsc), nGenes(Info) -2)
})


test_that("drop gene as numeric", {
  set.seed(1054)
  expect_warning(gsc <- drop(Info, gene = 2), "Removing ")
  #
  expect_equal(nGenes(gsc), nGenes(Info) - 2)

  expect_error(gsc <- drop(Info, gene = 3), "All pathways ")
})


test_that("pathway as character", {
  set.seed(501)
  gsc <- drop(Info, pathway = "156580")

  expect_false("2" %in% names(geneIds(gsc)))
  expect_equal(nPathways(gsc), nPathways(Info) -1)
})


test_that("drop pathway as numeric", {
  set.seed(501)
  gsc <- drop(Info, pathway = 2)

  expect_equal(nPathways(gsc), nPathways(Info) - 2)
})
