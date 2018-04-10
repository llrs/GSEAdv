context("Testing list to GeneSetCollection method")

test_that("info", {

  expect_warning(Info <- as.GeneSetCollection(info))
  sum <- Info[vapply(Info, function(x){all(!is.na(x))}, logical(1))]
  expect_true(class(Info) == "GeneSetCollection")
  expect_equal(length(inverseList(geneIds(Info))),
               length(sum))
  expect_equal(lengths(inverseList(geneIds(Info)))[["2"]], 1)

})

test_that("as.GeneSetCollection", {
  l <-  inverseList(geneIds(gsc))
  gss2 <- as.GeneSetCollection(l)
  expect_equal(length(geneIds(gsc)), length(geneIds(gss2)))
  expect_true(all(names(gsc) %in% names(gss2)))
  expect_equal(length(gsc), length(gss2))
})
