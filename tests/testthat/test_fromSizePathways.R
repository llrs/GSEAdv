context("Testing fromSizePathways method")

test_that("fromSizePathways", {
  sP <- sizePathways(Info)

  expect_message(test <- fromSizePathways(sP), "Iterations: ")
  expect_equal(sP, sizePathways(test))
})

# test_that("fromSizePathways", {
#   sP <- sizePathways(genesKegg)
#
#   expect_message(test <- fromSizePathways(sP), "Iterations: ")
#   expect_equal(sP, sizePathways(test))
# })
