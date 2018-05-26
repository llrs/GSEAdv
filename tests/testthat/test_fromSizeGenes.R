context("Testing fromSizeGenes method")

test_that("fromSizeGenes", {
  sG <- sizeGenes(Info)

  expect_message(test <- fromSizeGenes(sG), "Iterations: ")
  expect_equal(sG, sizeGenes(test))
})

# test_that("fromSizeGenes", {
#   sG <- sizeGenes(genesKegg)
#
#   expect_message(test <- fromSizeGenes(sG), "Iterations: ")
#   expect_equal(sG, sizeGenes(test))
# })
