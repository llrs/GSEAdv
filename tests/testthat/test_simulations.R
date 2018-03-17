context("Testing simulations to create GeneSetCollections")

test_that("z2", {
  gpp <- c(4, 5, 5, 8, 8, 6, 7, 2, 4)
  expect_message(test <- z2(gpp, 15), "Iterations: ")

  expect_true(all(table(genesPerPathway(test)) == table(gpp)))
  names(gpp) <- letters[seq_along(gpp)]
  expect_message(test <- z2(gpp, 15), "Iterations: ")
  expect_true(all(table(genesPerPathway(test)) == table(gpp)))

})

test_that("w", {
  ppg <- c(4, 5, 5, 8, 8, 6, 7, 2, 4)
  expect_message(test <- w(ppg, 15), "Iterations: ")
  expect_equal(nPathways(test), 15)
  expect_equal(nGenes(test), length(ppg))
  expect_false(is.null(names(genesPerPathway(test))))

  expect_true(all(table(pathwaysPerGene(test)) == table(ppg)))
})


test_that("z", {
  gpp <- c(3, 7, 8, 5, 4, 9, 8, 4, 3, 2, 6, 5)
  expect_message(test <- z(gpp), "Iterations: ")
  expect_equal(nPathways(test), length(gpp))
})


test_that("y", {
  ppg <- c(3, 7, 8, 5, 4, 9, 8, 4, 3, 2, 6, 5)
  expect_message(test <- y(ppg), "Iterations: ")
  expect_equal(nGenes(test), length(ppg))
})


test_that("yz", {
  ppg <- c(3, 7, 8, 5, 4, 9, 8, 4, 3, 2, 6, 5)
  gpp <- c(3, 7, 8, 5, 4, 9, 8, 4, 3, 2, 6, 5)
  test <- yz(ppg, gpp)
  expect_error(test <- yz(ppg, c(4, 5, 5, 9, 4)))
    # expect_equal(length(genesPerPathway(test)), length(gpp))
  # expect_equal(genesPerPathway(test), gpp)

})
