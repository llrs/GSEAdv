context("Testing utilities method")

test_that("collectionType", {
  expect_length(collectionType(Info), 1L)
  expect_equal(collectionType(Info), "NullCollection")
})

test_that("genesPerPathway", {
  expect_error(genesPerPathway("a"))
  gpp <- genesPerPathway(Info)
  expect_equal(gpp,structure(c(2L, 3L, 2L, 2L, 2L),
                             .Names = c("1430728", "156580",
                                        "156582", "194840", "211859")))
  expect_equal(length(gpp), nPathways(Info))
})

test_that("pathwaysPerGene", {
  ppg <- pathwaysPerGene(Info)
  expect_equal(ppg, structure(c(4L, 1L, 2L, 4L),
                              .Names = c("10", "2", "3", "9")))
  expect_equal(length(ppg), nGenes(Info))
})

test_that("geneIdType", {
  expect_length(geneIdType(Info), 1L)
  expect_equal(geneIdType(Info), "NullIdentifier")
})

test_that("nGenes", {
  expect_equal(nGenes(Info), 4L)
})

test_that("nPathways", {
  expect_equal(nPathways(Info), 5L)
})

test_that("h_index", {
  a <- c(2, 2, 2, 2)
  expect_equal(h_index(a), 2L)
  b <- c(2, 2, 3, 3)
  expect_equal(h_index(b), 2L)
  d <- c(2, 2, 3, 3, 3, 4)
  expect_equal(h_index(d), 3L)

  tab <- structure(c(1L, 2L, 2L, 2L, 2L, 3L, 1L, 1L, 2L, 3L, 2L, 1L, 3L,2L, 4L,
                     2L, 2L, 1L, 1L, 3L, 4L, 3L, 2L, 3L, 3L, 1L, 4L, 5L, 4L, 1L,
                     1L, 3L, 6L, 1L, 2L, 2L, 3L, 3L, 7L, 2L, 1L, 3L, 1L, 2L, 1L,
                     5L, 1L, 4L, 2L, 4L, 2L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 3L, 1L,
                     7L, 5L, 1L, 3L, 2L, 1L, 2L, 1L, 1L, 2L, 2L, 1L, 2L, 1L, 2L,
                     1L, 2L, 1L, 2L, 2L, 2L, 1L, 1L, 3L, 1L, 1L, 1L, 1L, 1L, 2L,
                     1L, 1L, 2L, 1L, 1L, 1L, 3L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 1L,
                     1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
                     1L), .Dim = 121L, .Dimnames = structure(list(
                       c("2", "3", "4", "5", "6", "7", "8", "9", "10", "11",
                         "13", "14", "15", "16", "17", "18", "19", "20", "21",
                         "22", "23", "24", "25", "26", "27", "28", "29", "30",
                         "32", "33", "34", "35", "36", "37", "40", "41", "42",
                         "43", "44", "46", "47", "48", "49", "50", "51", "52",
                         "53", "54", "55", "56", "57", "58", "59", "61", "62",
                         "63", "64", "65", "68", "69", "70", "71", "72", "73",
                         "74", "75", "76", "77", "78", "79", "80", "81", "83",
                         "84", "85", "86", "87", "88", "89", "90", "91", "94",
                         "99", "101", "102", "104", "106", "108", "112", "116",
                         "121", "124", "127", "128", "129", "130", "132", "133",
                         "134", "135", "136", "138", "150", "151", "153", "155",
                         "162", "165", "167", "177", "183", "189", "200", "201",
                         "213", "265", "268", "272", "326", "388", "1130")),
                       .Names = ""), class = "table")
  expect_equal(h_index(tab), 0L)

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
