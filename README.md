---
layout: page

---

gh-pages branch of template
===========================


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

though inline equations need `\(` syntax, like \(F = ma \).



Getting started
----------------

Consider copying the README.md on the master branch to index.md on this
branch to provide an overview of this project, adding yaml layout if
necessary; e.g.

```bash
wget -O index.md https://raw.githubusercontent.com/cboettig/template/master/README.md
(echo -en '---\nlayout: page\n---\n\n'; cat index.md) > tmp
mv tmp index.md
```


