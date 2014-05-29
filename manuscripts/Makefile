# Fill these out
MANUSCRIPT=manuscript
BIBLIO=components/references.bib
CSL=components/methods-in-ecology-and-evolution.csl
TEMPLATE=components/elsarticle.latex


all:
	make install
	make restore-cache
	make $(MANUSCRIPT).pdf
	make $(MANUSCRIPT).tex
	make ../README.md

install: components/install.R
	Rscript components/install.R


$(MANUSCRIPT).md: $(MANUSCRIPT).Rmd
	Rscript components/knit.R $(MANUSCRIPT).Rmd	

## Customize template, latex engine, etc here
$(MANUSCRIPT).pdf: $(MANUSCRIPT).md
	pandoc -o $(MANUSCRIPT).pdf --template=$(TEMPLATE) --biblio $(BIBLIO) --csl $(CSL) $(MANUSCRIPT).md

$(MANUSCRIPT).tex: $(MANUSCRIPT).md
	pandoc -o $(MANUSCRIPT).tex --template=$(TEMPLATE) --biblio $(BIBLIO) --csl $(CSL) $(MANUSCRIPT).md


restore-cache:  
	make components/cache
	
clean:
	rm -rf $(MANUSCRIPT).md 
	make clear-packrat
	make clear-cache

clear-packrat: 
	rm -rf .Rprofile .Renviron library/ packrat.sources/ 

clear-cache:
	rm -rf components/cache


# Only runs if cache has been cleared
components/cache: components/restore-cache.R
	Rscript components/restore-cache.R



# Non portable, just for me to update the source cache
# Must be on same line to use cd. must use cd to get paths right
# when unpacking.  
deploy-cache:
	cd components; tar -pczf template-cache.tar.gz cache; scp template-cache.tar.gz ten:~/public_html/data/



# Make package README from vignettes/tutorial (makefile command here just for convenience; since Makefiles in `vignettes/` are intended for building vignette output by tex etc, 
../README.md: ../vignettes/tutorial.Rmd
	Rscript -e 'require(knitr); opts_knit[["set"]](upload.fun = imgur_upload); knit("../vignettes/tutorial.Rmd", "../README.md")'
	Rscript components/github_highlighting.R ../README.md


