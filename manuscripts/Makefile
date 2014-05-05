BIBFILE = components/references.bib
CSL = components/methods-in-ecology-and-evolution.csl
TEMPLATE = components/elsarticle.latex


all:
	make tutorial.md
	make ../README.md
	make ../vignettes/tutorial.Rmd
	make manuscript.pdf

# Tutorial, used as README and vignette
tutorial.md: tutorial.Rmd 
	Rscript -e 'require(knitr); opts_knit[["set"]](upload.fun = imgur_upload); knit("tutorial.Rmd")'

../README.md: tutorial.md
	cp tutorial.md ../README.md
	Rscript components/github_highlighting.R ../README.md

../vignettes/tutorial.Rmd: tutorial.Rmd
	cp tutorial.Rmd ../vignettes/




manuscript.pdf: manuscript.Rmd
	Rscript components/make_pdf.R manuscript.Rmd	


clear-cache:
	rm -rf components/cache

## FIXME use default R utils for this 
restore-cache:

clean:


# Doesn't reset ../vignettes/* or ../README.md
clean-reset:
	rm -f manuscript.md manuscript.pdf tutorial.md 
