FROM cboettig/ropensci:latest
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Remain current
RUN apt-get update -qq && apt-get dist-upgrade -y

## LaTeX dependencies for building the manuscript
RUN apt-get install -y texlive-humanities lmodern texlive-fonts-recommended texlive-latex-extra

## Install package, with dependencies and suggests
RUN Rscript -e 'devtools::install_github("cboettig/template")'

ADD . /home/rstudio/template
RUN chmod -R 777 /home/rstudio/RNeXML



