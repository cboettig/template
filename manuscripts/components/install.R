#!/usr/bin/Rscript
library("methods")

if(!require("template")){
#  install.packages("devtools")
#  library("devtools")
#  install_github("reshape")
  install.packages("..", repos =NULL, dependencies = c("Depends", "Imports", "Suggests"))
}

# Use the packrat.lock file to verify dependencies. 
library("packrat")
packrat::packify(".")
source(".Rprofile")
readRenviron(".Renviron")
packrat::restore()



