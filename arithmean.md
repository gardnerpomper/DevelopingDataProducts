## Description

The arithmetic mean $\bar x$ is the sum of the values divided by the number of values. 

When trying to model a large statistical population, the values of x
are from a sampling of the that population.
 
$$\bar x = \frac{\sum x}{n}$$

## R method
```{r}
mean(x, trim=0, na.RM = FALSE, ...)
```

## Example
```{r}
data <- c(1,1,5,6,3,4,3,4)
mean(data)
```
