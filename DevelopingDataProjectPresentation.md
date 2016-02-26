mtcars Regression Analysis
========================================================
author: Samer 
date: 02-21-2016

What variables have an effect on Miles Per Gallon (MPG)?
========================================================

- Goal: Provide an interactive environment for doing regression analysis to find out which variables have an effect on MPG.
- Data Set: mtcars data 
- Predictor: MPG is the predictor
- Regressors: all the other variables in the mtcars dataset can be selected as regressors.
- User Interface: The user interface gives the user the choice to select one of more regressors. The regression formula is dynamically created and passed to the lm function.
- Plots: I provided the standard plot to analyze regressions using the plot function.
- Table: I provided the standard results provided by the lm function including the coefficient results, R-Squared, and Sigma.


Exploring the Correlation Between the Variables
========================================================


```r
pairs(mtcars)
```

![plot of chunk unnamed-chunk-1](DevelopingDataProjectPresentation-figure/unnamed-chunk-1-1.png) 

Sample Regression using am+wt as Regressors
========================================================
if the pvalue indicated by (Pr(>|t|) is less than 0.05, then results show that there is signficant difference between the distrubtion of mpg results and the values of the chosen regressor(s) (am and wt) in this case.

```r
fit <- with(mtcars, lm(mpg ~ am+wt))
summary(fit)$coeff
```

```
               Estimate Std. Error     t value     Pr(>|t|)
(Intercept) 37.32155131  3.0546385 12.21799285 5.843477e-13
am          -0.02361522  1.5456453 -0.01527855 9.879146e-01
wt          -5.35281145  0.7882438 -6.79080719 1.867415e-07
```

Plot the Regression Result
========================================================


```r
par(mfrow=c(2,2))
plot(fit)
```

![plot of chunk unnamed-chunk-3](DevelopingDataProjectPresentation-figure/unnamed-chunk-3-1.png) 
