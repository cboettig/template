---
template: _layouts/default.html
title: A minimal R Markdown example
disqus: cboettig
---


## graphics

<!--
We don't need to set the baseurl to the repository's production URL:


```r
#opts_knit$set(base.url="http://cboettig.github.io/template/")
```
-->





```r
library(ggplot2)
qplot(mpg, wt, data=mtcars, colour=cyl)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-21.svg) 

```r
qplot(mpg, wt, data=mtcars, size=cyl)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-22.svg) 

## inline code

Yes I know the value of pi is 3.1416, and 2 times pi is 6.2832.

## math

Sigh. You cannot live without math equations. OK, here we go: 

$$\alpha + \beta=\gamma$$  


