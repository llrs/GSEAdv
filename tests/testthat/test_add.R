context("Testing adding method")

test_that("gene as character", {
  gsc <- add(Info, gene = "2", pathway = "1430728")

  expect_true("2" %in% names(inverseList(geneIds(gsc))))
  expect_equal(nGenes(gsc), nGenes(Info))

  gsc <- add(Info, gene = c("2", "9"), pathway = "1430728")
  expect_true(all(c("2", "9") %in% names(inverseList(geneIds(gsc)))))
  expect_equal(nGenes(gsc), nGenes(Info))
})

test_that("pathway as character", {
  gsc <- add(Info, gene = c("2", "5", "7"), pathway = "156581")

  expect_equal(nPathways(gsc), nPathways(Info) +1)
  expect_equal(nGenes(gsc), nGenes(Info) +2)

  expect_warning(gsc <- add(Info, gene = "2", pathway = c("156581")),
                 "Removing")
  expect_error(gsc <- add(Info, gene = c("2", "3"),
                          pathway = c("156581", "211")),
               "Please")
  gsc <- add(Info, gene = c("2", "3"), pathway = "156581")
  expect_equal(nPathways(gsc), nPathways(Info)+1)
})


test_that("pathway as character", {
  expect_warning(gsc <- add(Info, gene = "2",
                            pathway = c("156581", "211")),
                 "Removing")
  gsc <- add(Info, gene = "2", pathway = c("156580", "1430728"))
  expect_equal(genesPerPathway(gsc)["156580"], c(`156580` = 4L))
})
