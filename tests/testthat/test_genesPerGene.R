context("Testing genePerGene")


test_that("gene as character", {
  test <- genesPerGene(Info)
  expect_equal(test, c(`10` = 2, `2` = 1, `3` = 3, `9` = 2))
  test2 <- genesPerGene(Info, unique = FALSE)
  expect_equal(test2, c(`10` = 5, `2` = 1, `3` = 3, `9` = 5))
})


test_that("gene as character", {
  test <- genesPerGene(Info, gene = "10")
  expect_equal(test, c(`10` = 2))
  test2 <- genesPerGene(Info, gene = "10", unique = FALSE)
  expect_equal(test2, c(`10` = 5))
})



test_that("gene as character", {
  test <- genesPerGene(Info, gene = c("10", "2"))
  expect_equal(test, c(`10` = 2, `2` = 1))
  test2 <- genesPerGene(Info, gene = c("10", "2"), unique = FALSE)
  expect_equal(test2, c(`10` = 5, `2` = 1))
})
