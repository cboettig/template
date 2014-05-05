<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{An Introduction to the template package}
-->

template
========


This repository is simply a template for my projects. It is structured as an [R package],
with a few additions:

- Development and version history hosted on [Github]
- a [manuscripts] directory, for writing R-markdown manuscripts and
building them into pdfs and other formats using [pandoc]. 
- Continuous integration and testing using [Travis CI]. 

(These are excluded when building the R package, see .Rbuildignore)



At this time, most of the template is dedicated to functions for dynamic
documentation of the manuscript.  See [manuscripts/README] for more
details about this functionality.  



[manuscripts]: http://github.com/cboettig/template/manuscripts/
[manuscripts/README]: http://github.com/cboettig/template/manuscripts/README.md
[R package]: http://cran.r-project.org/doc/manuals/R-exts.html "Writing R Extensions"
[pandoc]: http://johnmacfarlane.net/pandoc 
[Github]: http://github.com
[Travis CI]: https://travis-ci.org/
