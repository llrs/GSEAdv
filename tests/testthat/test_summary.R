context("Testing utilities method")

expect_warning(test <- as.GeneSetCollection(info))

test_that("summary", {
  expect_output(summary(test), "Genes:")
  expect_output(summary(test), "Pathways:")
})