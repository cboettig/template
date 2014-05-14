#!/usr/bin/R
setwd("components")
archive <- "template-manuscript-cache.tar.gz"


library("utils")
library("httr")
# restore cache file
target <- paste0("http://two.ucdavis.edu/~cboettig/data/", archive)
cache <- GET(target)
if(cache$status_code != 404){
  writeBin(content(cache, "raw"), archive)
  untar(archive)
  unlink(archive)
}

setwd("..")


