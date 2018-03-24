context("Testing utilities method")

expect_warning(test <- as.GeneSetCollection(info))

test_that("drop", {

  expect_warning(gsc <- drop(test, gene = "2"), "Removing ")

  expect_false("2" %in% names(inverseList(geneIds(gsc))))
})
