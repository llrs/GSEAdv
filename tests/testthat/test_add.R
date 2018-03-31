context("Testing add method")

expect_warning(Info <- as.GeneSetCollection(info))

test_that("gene as character", {
  gsc <- add(test, gene = "2", pathway = "1430728")

  expect_true("2" %in% names(inverseList(geneIds(gsc))))
  expect_equal(nGenes(gsc), nGenes(test))

  gsc <- add(test, gene = c("2", "9"), pathway = "1430728")
  expect_true(all(c("2", "9") %in% names(inverseList(geneIds(gsc)))))
  expect_equal(nGenes(gsc), nGenes(test))
})

test_that("pathway as character", {
  gsc <- add(test, gene = "2", pathway = "156581")

  expect_equal(nPathways(gsc), nPathways(test))

  expect_warning(gsc <- add(test, gene = "2", pathway = c("156581")),
                 "Removing")
  expect_error(gsc <- add(test, gene = c("2", "3"),
                          pathway = c("156581", "211")),
               "Please")
  gsc <- add(test, gene = c("2", "3"), pathway = "156581")
  expect_equal(nPathways(gsc), nPathways(test)+1)
})
