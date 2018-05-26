context("Testing summary method")

test_that("summary", {
  r <- evaluate_promise(summary(Info))
  expect_true(is(r, "list"))
  # expect_output(GSEAdv::summary(Info))
})
