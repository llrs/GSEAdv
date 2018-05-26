context("Testing pathway method")

test_that("pathway", {
  test <- pathway(Info)
  expect_true(is(test, "data.frame"))
  expect_equal(ncol(test), 5)
  expect_equal(nrow(test), 5)
})

test_that("pathway", {
  expect_output(tes <- pathway(Info, "1430728"))
  expect_true(is(tes, "numeric"))

  expect_error(pathway(Info, c("1430728", "156580")), "use only one pathway")

  expect_error(pathway(Info, "1432728"),
               "Pathway provided is not in the GeneSetCollection.")
})
