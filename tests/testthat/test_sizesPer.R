test_that("sizePathways", {
  test <- sizesPerPathway(Info)
  expect_length(test, 5L)
  expect_equal(test[1], sizesPerPathway(Info, "1430728"))

})


test_that("sizeGenes", {
  test <- sizesPerGene(Info)
  expect_length(test, 4L)
  expect_equal(test[1], sizesPerGene(Info, "10"))
})


test_that("sizePathways equivalent", {
  test <- sizesPerPathway(Info)
  expect_equal(test, apply(sizePathways(Info), 2, function(x){sum(x != 0)}))
})



test_that("sizePathways equivalent", {
  test <- sizesPerGene(Info)
  expect_equal(test, apply(sizeGenes(Info), 2, function(x){sum(x != 0)}))
})
