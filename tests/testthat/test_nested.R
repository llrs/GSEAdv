context("Testing nested method")

expect_warning(test <- as.GeneSetCollection(info))

test_that("nested", {

  n <- nested(test)
  expect_true(all(diag(n) == 1L))
  expect_equal(n[1, 2], 1L)
})
