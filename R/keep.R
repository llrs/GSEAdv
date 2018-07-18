# keep Methods that look for variations over a given GSC

# Calculates the possibilities of swapping genes between pathways
keep <- function(gsc){
 i <- incidence(gsc)
 shared <- i %*% t(i)

 gpp <- genesPerPathway(gsc)
 o <- abs(sweep(shared, 1, gpp))
 # unique genes https://stats.stackexchange.com/a/181979/105234
 # Add the unique genes of one triangle of the matrix to the upper triangle
 sing <- o[upper.tri(o)]+t(o)[upper.tri(t(o))]

 o2 <- as.data.frame(which(upper.tri(o), arr.ind = TRUE))
 o2$row <- colnames(o)[o2$row]
 o2$col <- colnames(o)[o2$col]
 o2$pathway1 <- gpp[o2$row]
 o2$pathway2 <- gpp[o2$col]
 o2$unique <- sing

 checking <- apply(o2[, c("pathway1", "pathway2")], 1, sum)
 if (any(sing > checking)) {
   stop("Error unique genes greater than the genes present in both pathways")
 }
 o2 <- o2[o2$unique > 1, ]
 o2$pos <- choose(o2$unique, o2$pathway1)
 # o2
 sum(o2$pos)
}
