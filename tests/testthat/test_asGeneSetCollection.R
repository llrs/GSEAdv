context("Testing list to GeneSetCollection method")

test_that("info", {

  expect_warning(Info <- as.GeneSetCollection(info))
  expect_true(class(Info) == "GeneSetCollection")
  expect_equal(length(geneIds(Info)), length(Info))
  expect_equal(length(geneIds(Info)), nPathways(Info))
  expect_equal(lengths(inverseList(geneIds(Info)))[["2"]], 1)

})

test_that("as.GeneSetCollection", {
  l <-  inverseList(geneIds(gsc))
  gss2 <- as.GeneSetCollection(l)
  expect_equal(length(geneIds(gsc)), length(geneIds(gss2)))
  expect_true(all(names(gsc) %in% names(gss2)))
  expect_equal(length(gsc), length(gss2))
})
