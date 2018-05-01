# Sample data for test

info <- structure(list(`1` = NA_character_,
                       `10` = c("1430728", "156580", "156582", "211859"),
                       `2` = c("109582", "114608", "140837", "140877",
                               "1474228", "1474244", "162582", "194315",
                               "194840", "76002", "76005"),
                       `3` = c("194840", "156580"), `4` = NA_character_,
                       `5` = NA_character_, `6` = NA_character_,
                       `7` = NA_character_, `8` = NA_character_,
                       `9` = c("1430728", "156580", "156582", "211859")),
                  .Names = c("1", "10", "2", "3", "4", "5", "6", "7", "8", "9"))

fl <- system.file("extdata", "Broad.xml", package="GSEABase")
gsc <- GSEABase::getBroadSets(fl) # GeneSetCollection of 2 sets