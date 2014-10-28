HTML_FILES := $(patsubst %.Rmd, %.html ,$(wildcard *.Rmd)) \
              $(patsubst %.md, %.html ,$(wildcard *.md))

all: clean html


html: $(HTML_FILES)

%.html: %.Rmd
	R --vanilla --slave -e "rmarkdown::render('$<')"
	pandoc --template _layouts/default.html metadata.yaml -o $@ $(basename $<).md
	rm $(basename $<).md

%.html: %.md
	pandoc --template _layouts/default.html metadata.yaml -o $@ $< 


.PHONY: clean
clean:
	$(RM) $(HTML_FILES)
