Introduction to R
================

## R Markdown

In its most basic form, R can be used as a simple calculator. Consider
the following arithmetic operators:

-   Addition: `+`
-   Subtraction: `-`
-   Multiplication: `*`
-   Division: `/`
-   Exponentiation: `^`
-   Modulo: `%%`

The last two might need some explaining:

-   The `^` operator raises the number to its left to the power of the
    number to its right: for example `3^2` is 9.
-   The modulo returns the remainder of the division of the number to
    the left by the number on its right, for example 5 modulo 3 or
    `5 %% 3` is 2.

``` r
# An addition
5 + 5 
```

    ## [1] 10

``` r
#> [1] 10

# A subtraction
5 - 5 
```

    ## [1] 0

``` r
#> [1] 0

# A multiplication
3 * 5
```

    ## [1] 15

``` r
#> [1] 15

 # A division
(5 + 5) / 2 
```

    ## [1] 5

``` r
#> [1] 5

# Exponentiation
2^5
```

    ## [1] 32

``` r
#> [1] 32

# Modulo
28%%6
```

    ## [1] 4

``` r
#> [1] 4
```

<sup>Created on 2022-01-17 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

## Including Plots

You can also embed plots, for example:

![](readme_files/figure-gfm/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
