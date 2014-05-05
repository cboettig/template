#!/usr/bin/Rscript
args <- commandArgs(TRUE)
file <- args[1]

## FIXME add second argument to handle figure types

## Set the paths for cache and figure
library("methods")
library("knitr")
basename <- gsub(".Rmd", "", file) # knitr:::knit_concord$get('infile')) 
opts_chunk$set(fig.path = paste("components/figure/", basename, "-", sep=""),
               cache.path = paste("components/cache/", basename, "/", sep=""))
opts_chunk$set(cache = 1)
opts_chunk$set(tidy=FALSE, warning=FALSE, message=FALSE, comment = NA, verbose = TRUE)

# PDF-based figures
opts_chunk$set(dev='pdf')

# Better to use a temporary markdown file (best to not overwrite basename.md since that can be used to display on GitHub)
# For now use basename, since pandoc function in knitr 1.5 doesn't respect output name from config (fixed in knitr 1.5.32)
output <- paste(basename, ".md", sep="")

## Knit
knit(file, output)


