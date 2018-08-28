context("Testing utilities method")

test_that("completness", {

  genesPerPathway <- c(2, 4, 5, 8, 5, 8)
  out <- structure(c(6, 15, 20, 15, 6, 1, 0, 0),
                   .Names = c("1", "2",
                              "3", "4", "5", "6", "7", "8"))
  expect_equal(completness(genesPerPathway), out)
})
