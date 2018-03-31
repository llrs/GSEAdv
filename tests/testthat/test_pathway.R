context("Testing pathway method")

expect_warning(Info <- as.GeneSetCollection(info))

test_that("pathway", {
  test <- pathway(Info)
  expect_true(is(test, "data.frame"))
  expect_equal(ncol(test), 5)
  expect_equal(nrow(test), 5)
})
