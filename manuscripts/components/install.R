#!/usr/bin/Rscript
library("methods")
# Install packrat if not available
options(repos=c(CRAN="http://cran.rstudio.com"))
if(!require("devtools")) install.packages("devtools")
if(!require("packrat")) devtools::install_github("rstudio/packrat")
packrat::packify()
packrat::restore()



