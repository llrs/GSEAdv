context("genesPerPathway")

test_that("default", {
  out <- genesPerPathway(Info)
  expect_equal(out, c(`1430728` = 2L, `156580` = 3L, `156582` = 2L,
                      `194840` = 2L, `211859` = 2L))

})

test_that("some pathway", {
  out <- genesPerPathway(Info, "1430728")
  expect_equal(out, c(`1430728` = 2L))

  out <- genesPerPathway(Info, c("1430728", "156580"))
  expect_equal(out, c(`1430728` = 2L, `156580` = 3L))

  expect_error(genesPerPathway(Info, "245"))
  expect_warning(genesPerPathway(Info, c("245", "156580")))
})
