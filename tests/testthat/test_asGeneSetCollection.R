context("Testing list to GeneSetCollection method")

test_that("info", {

  test <- as.GeneSetCollection(info, FALSE)
  sum <- info[sapply(info, function(x)all(!is.na(x)))]
  expect_true(class(test) == "GeneSetCollection")
  expect_equal(lengths(inverseList(geneIds(test))),
               lengths(sum))

})

test_that("as.GeneSetCollection", {
  l <-  inverseList(geneIds(gsc))
  gss2 <- as.GeneSetCollection(l)
  expect_equal(length(geneIds(gsc)), length(geneIds(gss2)))
  expect_true(all(names(gsc) %in% names(gss2)))
  expect_equal(length(gsc), length(gss2))
})
