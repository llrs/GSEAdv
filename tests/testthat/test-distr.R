context("test-distr")

test_that("distrGenes works", {
  out <- distrGenes(Info)
  expect_true(all(colSums(out) == (ncol(out) - 1)))
  expect_equal(ncol(out), nGenes(Info))
})

test_that("distrPathways works", {
  out <- distrPathways(Info)
  expect_true(all(colSums(out) == (ncol(out) - 1)))
  expect_equal(ncol(out), nPathways(Info))
})
