context("Testing duplications")
doble_dup <- structure(list(G_1 = c("GS_1", "GS_4"),
                            G_2 = c("GS_2", "GS_3"),
                            G_3 = c("GS_2", "GS_3"),
                            G_4 = c("GS_1", "GS_4")),
                       .Names = c("G_1", "G_2", "G_3", "G_4"))

doble_dup <- as(doble_dup, "GeneSetCollection")

test_that("duplicatedPathways", {
  expect_true(duplicatedPathways(doble_dup))
  expect_true(duplicatedPathways(Info))
  expect_false(duplicatedPathways(gsc))
})

test_that("duplicatedGenes", {
  expect_true(duplicatedGenes(doble_dup))
  expect_true(duplicatedGenes(Info))
  expect_true(duplicatedGenes(gsc))
})
