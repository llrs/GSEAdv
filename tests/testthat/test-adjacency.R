context("test-adjacency")

test_that("adjacency works", {
  adja <- adjacency(Info)
  expect_false(any(adja > 1))
  expect_true(isSymmetric(adja))
})
