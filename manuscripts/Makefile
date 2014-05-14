all:
	make install
	make restore-cache
	make manuscript.pdf
	make clean
	make ../README.md

install: components/install.R
	Rscript components/install.R

manuscript.md: manuscript.Rmd
	Rscript components/knit.R manuscript.Rmd	

manuscript.pdf: manuscript.md
	Rscript components/pandoc.R manuscript.md	
# Note: This manuscript.md has pdf graphics and no references, 
# not good for Github display. Should probably be deleted after use.   

# Only runs if cache has been cleared
components/cache: components/restore-cache.R
	Rscript components/restore-cache.R

# just an alias 
restore-cache: 
	make components/cache
	
clear-cache:
	rm -rf components/cache

clean:
	rm -f manuscript.md 


# Non portable, just for me to update the source cache
# Must be on same line to use cd. must use cd to get paths right
# when unpacking.  
deploy-cache:
	cd components; tar -pczf template-cache.tar.gz cache; scp template-cache.tar.gz ten:~/public_html/data/



# Make package README from vignettes/tutorial (makefile command here just for convenience; since Makefiles in `vignettes/` are intended for building vignette output by tex etc, 
../README.md: ../vignettes/tutorial.Rmd
	Rscript -e 'require(knitr); opts_knit[["set"]](upload.fun = imgur_upload); knit("../vignettes/tutorial.Rmd", "../README.md")'
	Rscript components/github_highlighting.R ../README.md


