
Contributing Guidelines
=======================



Repository structure
--------------------

This repository is structured as a standard R package
following the conventions outlined in the [Writing R
extensions](http://cran.r-project.org/doc/manuals/R-exts.html) manual.
A few additional files are provided that are not part of the built
R package and are listed in `.Rbuildignore`, such as `.travis.yml`,
which is used for continuous testing and integration.


Code
----

All code for this package is found in `R/`, (except compiled source
code, if used, which is in `/src`).  All functions should be thoroughly
documented with `roxygen2` notation; see Documentation.

Testing
-------

Any new feature or bug-fix should include a unit-test demonstrating the
change.  Unit tests follow the `testthat` framework with files in
`tests/testthat`.  Please make sure that the testing suite passes
before issuing a pull request.  This can be done by running `check()`
from the `devtools` package, which will also check for consistent
documentation, etc.


This package uses the [travis](https://github.com/craigcitro/r-travis)
continuous testing mechanism for R to ensure that the test suite is run
on each push to Github.  An icon at the top of the README.md indicates
whether or not the tests are currently passing.


Documentation
-------------

All of the function documentation is generated automatically.
Please do not edit any of the documentation files in `man/`
or the `NAMESPACE`.  Instead, construct the appropriate
[roxygen2](https://github.com/klutometis/roxygen) documentation in the
function files in `R/` themselves.  The documentation is then generated
by running the `document()` function from the `devtools` package.  Please
consult the [Advanced R programming](http://adv-r.had.co.nz/) guide if
this workflow is unfamiliar to you.  Note that functions should include
examples in the documentation. Please use `\dontrun` for examples that
take more than a few seconds to execute or require an internet connection.

Likewise, the README.md file in the base directory should not be edited
directly.  This file is created automatically from code that runs the
examples shown, helping to ensure that they are functioning as advertised
and consistent with the package README vignette.  Instead, edit the
`README.Rmd` source file and compile it with the RStudio knit 
button (ctrl+shift+k) or `rmarkdown::render()` . 


Manuscript
----------

The manuscript files are found in the vignettes directory.


Text should be hard-wrapped at less than 80 characters width when
possible. This allows git to better track real changes to the files
and improves the display of line-based diffs.  For this reason,
also avoid re-wrapping text frequently, or changing line end encodings,
etc.

**Embedding images**: Image generation is handled by the markdown
file, which will embed online png images published to imgur for the
`.md` output, and vector pdf graphics for the `.pdf` manuscript.

**Citations**: Citations should be added to the `.Rmd` file using
pandoc markdown notation, with the corresponding bibtex entries
added to `components/references.bib`. Citations can also be added as a standard
markdown link.


<!-- Just ship cache in Docker image? 

**Caching** To avoid rerunning potentially slow R code embedded in the
mansucript simply to view changes to the text, results from running the
code are cached in `cache` (see the knitr documentation for details on
how caching is used).  Run `make reset-cache` to erase the cache and clear
your workspace.  Recall that the Makefile will only rerun the relevant
command if the source file has changed.  Consequently, changes to to
the package functions themselves will not automatically cause make to
recompile the manuscript. If the package has an external archive of the
cache, it can be restored to the last published version with `make restore-cache`.
-->

<!-- Should add a utility that will generate citation metadata from
the mauscript.Rmd links using knitcitations.

Consider yaml-based citation format instead, see:
http://blog.martinfenner.org/2013/07/30/citeproc-yaml-for-bibliographies/#comment-1046228784
-->


Branches
--------

Please ensure that any pull requests are made to the relevant branch.


Questions or comments?
---------------------

Do not hesitate to open an issue in the issues tracker to raise any
questions or comments about the package or these guidelines.



