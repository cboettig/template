<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/cboettig/template.png?branch=master)](https://travis-ci.org/cboettig/template)

The template can be initialized with functions from devtools:

``` r
devtools::install_github("hadley/devtools")
library("devtools")
```

Configure some default options for `devtools`, see `package?devtools`:

``` r
options(devtools.name = "Carl Boettiger", 
        devtools.desc.author = "Carl Boettiger <cboettig@gmail.com> [aut, cre]",
        devtools.desc.license = "MIT + file LICENSE")
```

Run devtools templating tools

``` r
setup()
use_testthat()
use_vignette("intro")
use_travis()
use_package_doc()
use_cran_comments()
use_readme_rmd()
```

Additional modifications and things not yet automated by `devtools`:

-   Add the now-required LICENSE template data
-   add `covr` to the suggests list

``` r
writeLines(paste("YEAR: ", format(Sys.Date(), "%Y"), "\n", 
                 "COPYRIGHT HOLDER: ", getOption("devtools.name"), sep=""),
           con="LICENSE")

use_package("covr", "suggests")

write(
"
r_binary_packages:
  - testthat
  - knitr

r_github_packages:
  - jimhester/covr

after_success:
  - Rscript -e 'library(covr); coveralls()'",
file=".travis.yml", append=TRUE)
```

### Manual modifications

Further steps aren't yet automated in devtools or by me; as it's easier to add these manually to the template and then use the template when starting a new project.

-   add the travis shield to README, (as prompted to do by `add_travis()`)
-   Turn on repo at coveralls.io and add the shield to README
-   adding additional dependencies to DESCRIPTION with `use_package`, and also add to `.travis.yml` manually, e.g. under `r_binary_packages:`, `r_github_packages`, or `r_packages`
