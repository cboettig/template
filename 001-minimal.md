---
layout: page

---

# A minimal R Markdown example


## graphics



```r
opts_knit$set(base.url="http://cboettig.github.io/")
```


```r
library(ggplot2)
qplot(mpg, wt, data=mtcars, colour=cyl)
```

![plot of chunk unnamed-chunk-2](http://cboettig.github.io/figure/unnamed-chunk-21.svg) 

```r
qplot(mpg, wt, data=mtcars, size=cyl)
```

![plot of chunk unnamed-chunk-2](http://cboettig.github.io/figure/unnamed-chunk-22.svg) 

## inline code

Yes I know the value of pi is 3.1416, and 2 times pi is 6.2832.

## math

Sigh. You cannot live without math equations. OK, here we go: $\alpha+\beta=\gamma$. 


