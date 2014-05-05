#!/usr/bin/R

library("utils")

# restore cache file
archive <- "template-manuscript-cache.tar.gz"

setwd("components")
download.file(paste0("http://two.ucdavis.edu/~cboettig/data/", archive), archive)
untar(archive)
unlink(archive)
setwd("..")


