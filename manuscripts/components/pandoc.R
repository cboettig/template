#!/usr/bin/Rscript

## NOTE: Arguments to pandoc are set in the config file, pandoc_config.txt

args <- commandArgs(TRUE)
file <- args[1]
library("knitr")

## Call pandoc
knitr::pandoc(file, format="latex", config="components/pandoc_config.txt")

# Note that path is relative to where the Rscript is called
# (manuscripts/), not where the source script lives (manuscripts/components)

