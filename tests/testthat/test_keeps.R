context("keep.R")

test_that("keepGPP works", {

})

test_that("keepGPP works", {
  out <- keepGPP(Info)
  expect_equal(ncol(out), 5L)
})
