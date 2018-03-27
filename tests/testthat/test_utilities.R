context("Testing utilities method")

expect_warning(test <- as.GeneSetCollection(info))

test_that("collectionType", {
  expect_length(collectionType(test), 1L)
  expect_equal(collectionType(test), "NullCollection")
})

test_that("genesPerPathway", {
  gpp <- genesPerPathway(test)
  expect_equal(gpp,structure(c(2L, 3L, 2L, 2L, 2L),
                             .Names = c("1430728", "156580",
                                        "156582", "194840", "211859")))
  expect_equal(length(gpp), nPathways(test))
})

test_that("pathwaysPerGene", {
  ppg <- pathwaysPerGene(test)
  expect_equal(ppg, structure(c(4L, 1L, 2L, 4L),
                              .Names = c("10", "2", "3", "9")))
  expect_equal(length(ppg), nGenes(test))
})

test_that("geneIdType", {
  expect_length(geneIdType(test), 1L)
  expect_equal(geneIdType(test), "NullIdentifier")
})

test_that("nGenes", {
  expect_equal(nGenes(test), 4L)
})

test_that("nPathways", {
  expect_equal(nPathways(test), 5L)
})

test_that("h_index", {
  a <- c(2, 2, 2, 2)
  expect_equal(h_index(a), 2L)
  b <- c(2, 2, 3, 3)
  expect_equal(h_index(b), 2L)
  d <- c(2, 2, 3, 3, 3, 4)
  expect_equal(h_index(d), 3L)
})


test_that("IC", {
  a <- c(2, 2, 2, 2)
  expect_equal(IC(a), 0L)
  expect_equal(maxIC(a), 0L)
  b <- c(2, 2, 3, 3)
  expect_equal(IC(b), 1)

  expect_equal(maxIC(b), IC(b))
})


test_that("inverseList",  {
  l <- list( A = letters[1:5], B = letters[2:3])
  li <- list("a" = "A", "b" = c("A", "B"), "c" = c("A", "B"), "d" = "A", "e" = "A")
  expect_equal(inverseList(l), li)
})


test_that("names_vec",  {
  a <- c(2, 2, 20)
  expect_false(is.null(names(names_vec(a, "G_"))))
})

