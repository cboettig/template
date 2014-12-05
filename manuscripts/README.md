# Instructions for compiling manuscripts #



# About the `.Rmd` format #

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

