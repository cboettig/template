all:
	make manuscript.pdf
	make ../README.md



manuscript.md: manuscript.Rmd
	Rscript components/knit.R manuscript.Rmd	

manuscript.pdf: manuscript.md
	Rscript components/pandoc.R manuscript.md	
	
# Note: This manuscript.md has pdf graphics and no references, 
# not good for Github display. Should probably be deleted after use.   


clear-cache:
	rm -rf components/cache

restore-cache:
	Rscript components/restore-cache.R

clean:
	rm -f manuscript.md manuscript.pdf 




# Make package README from vignettes/tutorial (makefile command here just for convenience; since Makefiles in `vignettes/` are intended for building vignette output by tex etc, 
../README.md: ../vignettes/tutorial.Rmd
	Rscript -e 'require(knitr); opts_knit[["set"]](upload.fun = imgur_upload); knit("../vignettes/tutorial.Rmd", "../README.md")'
	Rscript components/github_highlighting.R ../README.md


