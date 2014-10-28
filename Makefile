
HTML_FILES := $(patsubst %.Rmd, %.html ,$(wildcard *.Rmd)) \
              $(patsubst %.md, %.html ,$(wildcard *.md))

all: clean html


html: $(HTML_FILES)

%.html: %.Rmd
	R --vanilla --slave -e "rmarkdown::render('$<')"

%.html: %.md
	pandoc --include-before-body _includes/navbar.html --include-after-body _includes/footer.html --template _layouts/default.html metadata.yaml -o $@ $< 


.PHONY: clean
clean:
	$(RM) $(HTML_FILES)
