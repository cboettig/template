#!/usr/bin/Rscript
args <- commandArgs(TRUE)
file <- args[1]
content <- readLines(file)
content <- gsub('```r', '```coffee', content)
writeLines(content, file)
