---
template: _layouts/default.html
title: gh-pages branch of template
disqus: cboettig
---


This branch hosts the `.Rmd` source scripts and output `.md`
scripts produced by running analyses relevant to this project,
usually based on functions from the R package on the master branch.

Any markdown results in this repository will then be rendered at
`io.carlboettiger.info/<reponame>/<filepath>`.

This branch uses same top-level domain (carlboettiger.info) and
the CSS styling of my labnotebook to mantain a consistent look and
feel, but it is actually hosted independently from
the notebook itself.  My website proper lives on the `www` subdomain,
with all the HTML sources coming from the gh-pages branch of my
[labnotebook repo](https://github.com/cboettig/labnotebook/).

By setting my `cboettig.github.io` repo to the `io` subdomain
instead, all `gh-pages` branches of other repos are now served
from that subdomain, e.g. `io.carlboettiger.info/<reponame>`, instead
of `cboettig.github.io/<reponame>`.

This branch then contains its own copies of the labnotebook
`_layout` and `_includes` directories, which point to the `www` subdomain
for the css assets.  The `_config.yml` is quite minimal, just using
`redcarpet` to provide github-like parsing.


Using redcarpet means we lose the ability to have pandoc-like citations,
but can still add mathjax equations with `$$` (since markdown parser
ignores that delimiter)

$$ \int_0^{\infty} f(x) P(x) dx $$

though inline equations need `\(` syntax, which means escaping
the backtick in the markdown, such as: \\(F = ma \\).

## An `.Rmd` example

This repo contains an example `.Rmd` file, `001-minimal.Rmd`.
After knitting the file and commiting the output `.md`
and `figure/` directory, the results are visible at the URL:
[io.carlboettiger.info/template/001-miminal](http://io.carlboettiger.info/template/001-minimal)
(note that Github's internal `.htaccess` automatically
handles the `.html` extension if it is ommited).
The `.Rmd` file isn't parsed but is automatically available at
[io.carlboettiger.info/template/001-miminal.Rmd](http://io.carlboettiger.info/template/001-minimal.Rmd)
(for which the browser will probably prompt you to download the file
since it does not recognize the extension).

Of course the .Rmd is also avaiable at the standard Github page,
[github.com/cboettig/template/blob/gh-pages/001-minimal.Rmd](https://github.com/cboettig/template/blob/gh-pages/001-minimal.Rmd),
but the ability to just add `.Rmd` to the end of the URL may be a more
convenient way of exposing the source file than having to generate
the link.

Because we have used `svg` images, the markdown on the Github version,
[github.com/cboettig/template/blob/gh-pages/001-minimal.md](https://github.com/cboettig/template/blob/gh-pages/001-minimal.md),
does not show the images. We could solve this by telling knitr to use
full instead relative URLs,

```r
knit_opts$set(base.url = "http://cboettig.github.io/templates/")
```

but that is rather cumbersome to remember.  Worse, if we use Github.com
to look at older versions of the `.md` file, we would still see the
most recent image rather than the correct version.  Consequently, it
is probably better to use the simpler relative URLs and not worry about
the Github rendered version (which after all, doesn't have our nice CSS,
our mathjax support, disqus, and google analytics that we get from the
HTML solution).

## Accessing earlier versions

As mentioned above, while we can use Github's online version history to look at our rendered markdown,
images and equations will not display.  We do better to checkout the commit of interest from the
`gh-pages` branch, e.g.

```bash
git checkout gh-pages
git checkout 2e418b
jekyll serve
```

and view the site locally in the browser.  (not ideal for novice users, admittedly).

(and then remember to return to master gh-pages branch when we're done)

```bash
git checkout master
```


Creating project landing page
------------------------------

Consider using the `README.md` from the project's master branch as
a landing page for the project (e.g. appear at the project's base
url, `http://io.carlboettiger.info/<reponame>`.

To do so automatically, just grab the file and rename it `index.md`,
adding yaml layout if necessary; e.g.

```bash
wget -O index.md https://raw.githubusercontent.com/cboettig/template/master/README.md
(echo -en '---\nlayout: page\n---\n\n'; cat index.md) > tmp
mv tmp index.md
```


