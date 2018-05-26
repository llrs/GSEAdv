context("Testing gene method")

test_that("gene", {
  test <- gene(Info)
  expect_true(is(test, "data.frame"))
  expect_equal(ncol(test), 5)
  expect_equal(nrow(test), 4)
  })


test_that("pathway", {
  expect_output(tes <- gene(Info, "10"))
  expect_true(is(tes, "numeric"))

  expect_error(gene(Info, c("1430728", "156580")), "use just one gene")

  expect_error(gene(Info, "1432728"),
               "Gene provided is not in the GeneSetCollection.")
})
