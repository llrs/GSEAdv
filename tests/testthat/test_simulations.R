context("Testing simulations to create GeneSetCollections")

test_that("fromGPP_nGenes", {
  gpp <- c(4, 5, 5, 8, 8, 6, 7, 2, 4)
  expect_message(test <- fromGPP_nGenes(gpp, 15), "Iterations: ")

  expect_true(all(table(genesPerPathway(test)) == table(gpp)))
  names(gpp) <- letters[seq_along(gpp)]
  expect_message(test <- fromGPP_nGenes(gpp, 15), "Iterations: ")
  expect_true(all(table(genesPerPathway(test)) == table(gpp)))

})

test_that("fromPPG_nPathways", {
  ppg <- c(4, 5, 5, 8, 8, 6, 7, 2, 4)
  expect_message(test <- fromPPG_nPathways(ppg, 15), "Iterations: ")
  expect_equal(nPathways(test), 15)
  expect_equal(nGenes(test), length(ppg))
  expect_false(is.null(names(genesPerPathway(test))))

  expect_true(all(table(pathwaysPerGene(test)) == table(ppg)))
})

# TOO long: Probability??
# test_that("fromGPP", {
#   gpp <- c(2, 2, 2, 2, 2, 2, 2, 2, 2)
#   expect_message(test <- fromGPP(gpp), "Iterations: ")
#   expect_equal(nPathways(test), length(gpp))
# })

#
# test_that("fromPPG", {
#   ppg <- c(4, 5, 5, 8, 8, 6, 7, 2, 4)
#   expect_message(test <- fromPPG(ppg), "Iterations: ")
#   expect_equal(nGenes(test), length(ppg))
# })


test_that("fromPPG_GPP", {
  ppg <- c(3, 7, 8, 5, 4, 9, 8, 4, 3, 2, 6, 5)
  gpp <- c(3, 7, 8, 5, 4, 9, 8, 4, 3, 2, 6, 5)
  expect_message(test <- fromPPG_GPP(ppg, gpp), "Iterations: ")
  expect_error(test <- fromPPG_GPP(ppg, c(4, 5, 5, 9, 4)))
  expect_true(check_vec(genesPerPathway(test), gpp))
  expect_true(check_vec(pathwaysPerGene(test), ppg))
})
