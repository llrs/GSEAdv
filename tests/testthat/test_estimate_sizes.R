context("estimate.n*")

test_that("estimate.nPathways works", {
  expect_length(estimate.nPathways(c(4, 5, 5, 5, 5, 5)), 2L)

})

test_that("estimate.nGenes works", {
  expect_length(estimate.nGenes(c(4, 5, 5, 5, 5, 5)), 2L)
})