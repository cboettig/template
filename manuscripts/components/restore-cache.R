#!/usr/bin/R
library("methods")
library("utils")
library("httr")

setwd("components")
archive <- "template-manuscript-cache.tar.gz"

# restore cache file
target <- paste0("http://two.ucdavis.edu/~cboettig/data/", archive)
cache <- GET(target)
if(cache$status_code != 404){
  writeBin(content(cache, "raw"), archive)
  untar(archive)
  unlink(archive)
}

setwd("..")


