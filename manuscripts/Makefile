MANUSCRIPT=manuscript

all:
	make install
	make render

install: components/install.R
	Rscript components/install.R

restore-cache:  
	make components/cache

$(MANUSCRIPT).pdf: $(MANUSCRIPT).Rmd
	Rscript -e "rmarkdown::render('$(MANUSCRIPT).Rmd')"


# Non portable, just for me to update the source cache
# Must be on same line to use cd (to get paths right)
deploy-cache:
	cd components; tar -pczf template-cache.tar.gz cache; scp template-cache.tar.gz ten:~/public_html/data/

clean:
	rm -rf $(MANUSCRIPT).md 
	make clear-packrat
	make clear-cache

clear-packrat: 
	rm -rf .Rprofile packrat/lib packrat/src packrat/bootstrap.R

clear-cache:
	rm -rf components/cache


# Only runs if cache has been cleared
components/cache: components/restore-cache.R
	Rscript components/restore-cache.R



