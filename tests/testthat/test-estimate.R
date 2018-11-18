context("test-estimate")

test_that("estimate works", {
  out <- estimate(nGenes = 100)
  expect_s3_class(out, "data.frame")
  expect_equal(colnames(out), c("estimate", "max", "min"))
  expect_equal(out[1, "min"], 2L)
  expect_equal(out[2, "max"], 100L)
  expect_equal(out[2, "min"], 3L)
})