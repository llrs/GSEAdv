context("Testing fromSizeGenes_sizePathways")

sP_i <- sizePathways(Info)
sG_i <- sizeGenes(Info)

test_that("fromSizeGenes_sizePathways", {
  obj <- fromSizeGenes_sizePathways(sG_i, sP_i)
  expect_s4_class(obj, "GeneSetCollection")
  expect_equal(sizePathways(obj), sP_i)
  expect_equal(sizeGenes(obj), sG_i)
  })
