context("Testing nested method")

test_that("nested", {

  n <- nested(Info)
  expect_true(all(diag(n) == 1L))
  expect_equal(n[1, 2], 1L)
})


test_that("compare", {
  expect_message(comp <- GSEAdv::compare(Info, genesKegg),
                 "pathways are the same")
  expect_equal(comp, 0L)
  expect_message(comp <- GSEAdv::compare(Info, Info))
  expect_true(is(comp, "matrix"))
  expect_equal(ncol(comp), 2L)
  expect_equal(nrow(comp), 11L)
})
