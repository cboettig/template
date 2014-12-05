Working through quick-start example in [nimble manual](http://r-nimble.org/manuals/NimbleUserManual.pdf)




The manual gives essentially no introduction to what appears to be a classic BUGS example model for stochastically failing pumps.  


```r
library(nimble)
```

```
## 
## Attaching package: 'nimble'
## 
## The following object is masked from 'package:stats':
## 
##     simulate
```

```r
pumpCode <- modelCode({
  for (i in 1:N){
    theta[i] ~ dgamma(alpha,beta)
    lambda[i] <- theta[i]*t[i]
    x[i] ~ dpois(lambda[i])
  }
  alpha ~ dexp(1.0)
  beta ~ dgamma(0.1,1.0)
})
```


```r
pumpConsts <- list(N = 10, 
                   t = c(94.3, 15.7, 62.9, 126, 5.24,
                         31.4, 1.05, 1.05, 2.1, 10.5))
pumpData <- list(x = c(5, 1, 5, 14, 3, 19, 1, 1, 4, 22))
```


```r
pumpInits <- list(alpha = 1, 
                  beta = 1,
                  theta = rep(0.1, pumpConsts$N))
```



```r
pump <- nimbleModel(code = pumpCode, 
                    name = 'pump', 
                    constants = pumpConsts,
                    data = pumpData, 
                    inits = pumpInits)
```

```
## Error in modelDefClass$new: could not find function "loadMethod"
```

```r
pump$getNodeNames()
```

```
## Error in eval(expr, envir, enclos): object 'pump' not found
```

Note that we can see `theta` has our initial conditions, while `lambda` has not yet been initialized:


```r
pump$theta
```

```
## Error in eval(expr, envir, enclos): object 'pump' not found
```

```r
pump$lambda
```

```
## Error in eval(expr, envir, enclos): object 'pump' not found
```

Hmm, initially we cannot simulate `theta` values though (or rather, we just get NaNs and warnings if we do). At the moment I'm not clear on why, though seems to be due to the lifted node:


```r
simulate(pump, 'theta')
```

```
## Error in inherits(model, "modelBaseClass"): object 'pump' not found
```

```r
pump$theta
```

```
## Error in eval(expr, envir, enclos): object 'pump' not found
```


```r
pump$lifted_d1_over_beta
```

```
## Error in eval(expr, envir, enclos): object 'pump' not found
```



If we calculate the log probability density of the determinstic dependencies of alpha and beta nodes (i.e. the lifted node) then we're okay: 


```r
set.seed(0) ## This makes the simulations here reproducible
calculate(pump, pump$getDependencies(c('alpha', 'beta'), determOnly = TRUE))
```

```
## Error in inherits(model, "modelBaseClass"): object 'pump' not found
```

```r
simulate(pump, 'theta')
```

```
## Error in inherits(model, "modelBaseClass"): object 'pump' not found
```


```r
pump$theta
```

```
## Error in eval(expr, envir, enclos): object 'pump' not found
```

We still need to initialize lambda, e.g. by calculating the probability density on those nodes:


```r
calculate(pump, 'lambda')
```

```
## Error in inherits(model, "modelBaseClass"): object 'pump' not found
```

```r
pump$lambda
```

```
## Error in eval(expr, envir, enclos): object 'pump' not found
```

though not entirely clear to me why the guide prefers to do this as the dependencies of theta (which clearly include lambda, but also other things).  Also not clear if these `calculate` steps are necessary to proceed with the `MCMCspec` and `buildMCMC`, or compile steps.  Let's reset the model[^1] and find out:

[^1]: Not completely certain that this destroys anything connected to the object as C pointers from before, but seems like it should. 


```r
pump <- nimbleModel(code = pumpCode, 
                    name = 'pump', 
                    constants = pumpConsts,
                    data = pumpData, 
                    inits = pumpInits)
```

```
## Error in modelDefClass$new: could not find function "loadMethod"
```

```r
pump$theta
```

```
## Error in eval(expr, envir, enclos): object 'pump' not found
```

```r
pump$lambda
```

```
## Error in eval(expr, envir, enclos): object 'pump' not found
```


Good, we're reset. Now we try:


```r
Cpump <- compileNimble(pump)
```

```
## Error in compileNimble(pump): object 'pump' not found
```

```r
pumpSpec <- MCMCspec(pump)
```

```
## Error in .Object$initialize: could not find function "loadMethod"
```

```r
pumpSpec$addMonitors(c('alpha', 'beta', 'theta'))
```

```
## Error in eval(expr, envir, enclos): object 'pumpSpec' not found
```



```r
pumpMCMC <- buildMCMC(pumpSpec)
```

```
## Error in buildMCMC(pumpSpec): object 'pumpSpec' not found
```

```r
CpumpMCMC <- compileNimble(pumpMCMC, project = pump)
```

```
## Error in compileNimble(pumpMCMC, project = pump): object 'pumpMCMC' not found
```


```r
CpumpMCMC(1000)
```

```
## Error in eval(expr, envir, enclos): could not find function "CpumpMCMC"
```

```r
samples <- as.matrix(nfVar(CpumpMCMC, 'mvSamples'))
```

```
## Error in is.nfGenerator(f): object 'CpumpMCMC' not found
```


```r
plot(samples[ , 'alpha'], type = 'l', xlab = 'iteration',
ylab = expression(alpha))
```

```
## Error in plot(samples[, "alpha"], type = "l", xlab = "iteration", ylab = expression(alpha)): object 'samples' not found
```

```r
plot(samples[ , 'beta'], type = 'l', xlab = 'iteration',
ylab = expression(beta))
```

```
## Error in plot(samples[, "beta"], type = "l", xlab = "iteration", ylab = expression(beta)): object 'samples' not found
```

```r
plot(samples[ , 'alpha'], samples[ , 'beta'], xlab = expression(alpha),
ylab = expression(beta))
```

```
## Error in plot(samples[, "alpha"], samples[, "beta"], xlab = expression(alpha), : object 'samples' not found
```



