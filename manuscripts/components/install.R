#!/usr/bin/Rscript

if(!require("template")){
#  install.packages("devtools")
#  library("devtools")
#  install_github("reshape")
  install.packages("..", repos =NULL, dependencies = c("Depends", "Imports", "Suggests"))
}
