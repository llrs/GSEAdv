context("keep.R")

test_that("keepPPG works", {
  out <- keepPPG(Info)
  expect_equal(ncol(out), 6L)
})

test_that("keepGPP works", {
  out <- keepGPP(Info)
  expect_equal(ncol(out), 6L)
})
