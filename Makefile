HTML_FILES := $(patsubst %.Rmd, %.html ,$(wildcard *.Rmd)) \
              $(patsubst %.md, %.html ,$(wildcard *.md))

all: clean html


html: $(HTML_FILES)

## If rmarkdown::render supported the use of `metadata.yaml`, this workflow
## could just call a render function.  Since it does not, we have to call
## pandoc manually, which also means calling knitr::knit to start off so 
## that we don't lose our yaml headers before pandoc even gets to them.  

## once rmarkdown supports metadata.yaml, all this will be much cleaner (and identical for both extensions).

%.html: %.Rmd
	R --vanilla --slave -e "knitr::knit('$<')"
	pandoc --template _layouts/default.html metadata.yaml -o $@ $(basename $<).md
	rm $(basename $<).md

%.html: %.md
	pandoc --template _layouts/default.html metadata.yaml -o $@ $< 


.PHONY: clean
clean:
	$(RM) $(HTML_FILES)
