context("Testing modify method")

test_that("gene as character", {
  gsc <- modify(Info, gene = "2", pathway = "1430728")

  expect_true("2" %in% names(inverseList(geneIds(gsc))))
  expect_equal(nGenes(gsc), nGenes(Info))

  gsc <- modify(gsc, gene = "2", pathway = "1430728")

  expect_true("2" %in% names(inverseList(geneIds(gsc))))
  expect_equal(nGenes(gsc), nGenes(Info))

  gsc <- modify(Info, gene = c("2", "9"), pathway = "1430728")
  expect_true(all(c("2", "9") %in% names(inverseList(geneIds(gsc)))))
  expect_equal(nGenes(gsc), nGenes(Info))
})

test_that("pathway as character", {
  gsc <- modify(Info, gene = "2", pathway = "156580")

  expect_equal(nPathways(gsc), nPathways(Info))

  expect_warning(gsc <- modify(Info, gene = "2", pathway = c("156581")),
                 "Impossible to add")
  expect_error(gsc <- modify(Info, gene = c("2", "3"),
                          pathway = c("156581", "211")),
               "Please")
  gsc <- modify(Info, gene = c("2", "3"), pathway = "156581")
  expect_equal(nPathways(gsc), nPathways(Info)+1)
})



test_that("pathway as character", {
  expect_warning(gsc <- modify(Info, gene = "2", pathway = c("156581", "211")),
                 "Removing")

  gsc <- modify(Info, gene = "11", pathway = c("156580", "156582"))
  expect_equal(nGenes(gsc), nGenes(Info) + 1 )
})
