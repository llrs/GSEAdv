context("Testing cond* method")

test_that("condPerGenes missing", {

  n <- condPerGenes(Info)
  expect_equal(dim(n), c(3L, 2L))
  expect_true(all(colSums(n) == 1L))
  expect_equal(names(dimnames(n)), c("pathwaysPerGene", "genesPerPathway"))
  expect_equal(n["1", "3"], 0L)
})

test_that("condPerGenes specific", {

  n <- condPerGenes(Info, 2)
  expect_equal(dim(n), c(3L, 1L))
  expect_true(all(colSums(n) == 1L))
  expect_equal(names(dimnames(n)), c("pathwaysPerGene", "genesPerPathway"))
  expect_equal(n["1", "2"], 0.125)
})

test_that("condPerPathways missing", {

  n <- condPerPathways(Info)
  expect_equal(dim(n), c(2L, 3L))
  expect_true(all(colSums(n) == 1L))
  expect_equal(names(dimnames(n)), c("genesPerPathway", "pathwaysPerGene"))
  expect_equal(n["3", "1"], 0L)
})


test_that("condPerPathways specific", {

  n <- condPerPathways(Info, c(1, 2))
  expect_equal(dim(n), c(2L, 2L))
  expect_true(all(colSums(n) == 1L))
  expect_equal(names(dimnames(n)), c("genesPerPathway", "pathwaysPerGene"))
  expect_equal(n["3", "1"], 0)
})
