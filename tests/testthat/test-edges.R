context("test-edges")

test_that("edges works", {
  expect_true(nrow(edges(Info)) > 3)
})

test_that("nEdges works", {
  expect_equal(nEdges(Info), 4L)
})


test_that("edges and nEdges match", {
  expect_equal(nEdges(Info), nrow(edges(Info)))
})
