context("Testing nested method")

test_that("nested", {

  n <- nested(Info)
  expect_true(all(diag(n) == 1L))
  expect_equal(n[1, 2], 1L)
})
