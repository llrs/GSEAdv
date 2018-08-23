context("Estimating numbers")

test_that("double.factorial works",{

  expect_equal(double.factorial(4L), 3L)
  expect_equal(double.factorial(5L), 15L)

})