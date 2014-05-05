Instructions for compiling manuscripts
======================================

**Quickstart**:

Edit the corresponding `.Rmd` file to change either text or code.  To build, just use:

```bash
make
```

Installation requirements
-------------------------

- pandoc (>= 1.12), pandoc-citeproc
- LaTeX environment

**Note**: Pandoc options (bib file, csl file, etc) are all set in the
(debian control formatted) file [components/config_pandoc.txt].

Manuscripts in this package are written in [knitr]'s R Markdown format
(`.Rmd` files), and compiled into PDFs using [pandoc] with [LaTeX]. Thanks
to pandoc, this workflow can easily produce alternative formats, such
as Microsoft Office's `.docx` (or open standard `.odt`), HTML, various
flavors of `.tex` (for journal submission engines) or pure markdown
(e.g. to be rendered by Github). Because markdown is platform independent
plain text and easier to learn than LaTeX, the hope is that this workflow
is relatively portable across users.  Markdown also does a better job than
most alternatives (tex included) at separating content from formatting,
freeing the writer to just write.

[knitr]: http://yihui.name/knitr
[pandoc]: http://johnmacfarlane.net/pandoc/
[LaTeX]: http://www.latex-project.org/
[components/config_pandoc.txt]: http://github.com/cboettig/template/tree/master/manuscripts/components/config_pandoc.txt

Caching
-------

I've also enabled caching.  It can be annoying to have to have to rerun
all the R code just to make a textual change to the manuscript or readme.
The cache is ignored by git so the first time you run `make` all the
code will run, and thereafter you will have the cache. The caching is
modestly intelligent, in that if you edit a chunk it will be rerun by
default, (as will chunks with declared dependencies on it). See `knitr`'s
[caching documentation] for details.

You can clear the cache by deleting it, or just use `make clear-cache`.

**Restoring the default cache**

You can obtain my current cache by using `make restore-cache`.

**Picking up at a particular chunk**

For the sake of modular reproducibility, it can also be desirable
to pick up from somewhere in the middle of the manuscript and not
want to have to run all the previous code just to try out one line
(not really an issue in this paper, but more generally).  Caching is
therefore modular by chunk, allowing you to restore the results
of a particular chunk to investigate. Again see `knitr`'s [caching
documentation] for details.


[caching documentation]: http://yihui.name/knitr/demo/cache/
