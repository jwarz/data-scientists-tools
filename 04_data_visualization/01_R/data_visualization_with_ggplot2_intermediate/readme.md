Intermediate Data Visualization with ggplot2
================
Joschka Schwarz

-   [1. Statistics](#1-statistics)
    -   [Stats with geoms](#stats-with-geoms)
    -   [Smoothing](#smoothing)
    -   [Grouping variables](#grouping-variables)
    -   [Modifying stat_smooth](#modifying-stat_smooth)
    -   [Modifying stat_smooth (2)](#modifying-stat_smooth-2)
    -   [Stats: sum and quantile](#stats-sum-and-quantile)
    -   [Quantiles](#quantiles)
    -   [Using stat_sum](#using-stat_sum)
    -   [Stats outside geoms](#stats-outside-geoms)
    -   [Preparations](#preparations)
    -   [Using position objects](#using-position-objects)
    -   [Plotting variations](#plotting-variations)
-   [2. Coordinates](#2-coordinates)
    -   [Coordinates](#coordinates)
    -   [Zooming In](#zooming-in)
    -   [Aspect ratio I: 1:1 ratios](#aspect-ratio-i-11-ratios)
    -   [Aspect ratio II: setting
        ratios](#aspect-ratio-ii-setting-ratios)
    -   [Expand and clip](#expand-and-clip)
    -   [Coordinates vs. scales](#coordinates-vs-scales)
    -   [Log-transforming scales](#log-transforming-scales)
    -   [Adding stats to transformed
        scales](#adding-stats-to-transformed-scales)
    -   [Double and flipped axes](#double-and-flipped-axes)
    -   [Useful double axes](#useful-double-axes)
    -   [Flipping axes I](#flipping-axes-i)
    -   [Flipping axes II](#flipping-axes-ii)
    -   [Polar coordinates](#polar-coordinates)
    -   [Pie charts](#pie-charts)
    -   [Wind rose plots](#wind-rose-plots)
-   [3. Facets](#3-facets)
    -   [The facets layer](#the-facets-layer)
    -   [Facet layer basics](#facet-layer-basics)
    -   [Many variables](#many-variables)
    -   [Formula notation](#formula-notation)
    -   [Facet labels and order](#facet-labels-and-order)
    -   [Labeling facets](#labeling-facets)
    -   [Setting order](#setting-order)
    -   [Facet plotting spaces](#facet-plotting-spaces)
    -   [Variable plotting spaces I: continuous
        variables](#variable-plotting-spaces-i-continuous-variables)
    -   [Variable plotting spaces II: categorical
        variables](#variable-plotting-spaces-ii-categorical-variables)
    -   [Facet wrap & margins](#facet-wrap--margins)
    -   [Wrapping for many levels](#wrapping-for-many-levels)
    -   [Margin plots](#margin-plots)
-   [4. Best Practices](#4-best-practices)
    -   [Best practices: bar plots](#best-practices-bar-plots)
    -   [Bar plots: dynamite plots](#bar-plots-dynamite-plots)
    -   [Bar plots: position dodging](#bar-plots-position-dodging)
    -   [Bar plots: Using aggregated
        data](#bar-plots-using-aggregated-data)
    -   [Heatmaps use case scenario](#heatmaps-use-case-scenario)
    -   [Heat maps](#heat-maps)
    -   [Useful heat maps](#useful-heat-maps)
    -   [Heat map alternatives](#heat-map-alternatives)
    -   [When good data makes bad
        plots](#when-good-data-makes-bad-plots)
    -   [Suppression of the origin](#suppression-of-the-origin)
    -   [Color blindness](#color-blindness)
    -   [Typical problems](#typical-problems)

**Short Description**

Learn to use facets, coordinate systems and statistics in ggplot2 to
create meaningful explanatory plots.

**Long Description**

This ggplot2 course builds on your knowledge from the introductory
course to produce meaningful explanatory plots. Statistics will be
calculated on the fly and you’ll see how Coordinates and Facets aid in
communication. You’ll also explore details of data visualization best
practices with ggplot2 to help make sure you have a sound understanding
of what works and why. By the end of the course, you’ll have all the
tools needed to make a custom plotting function to explore a large data
set, combining statistics and excellent visuals.

# 1. Statistics

A picture paints a thousand words, which is why R ggplot2 is such a
powerful tool for graphical data analysis. In this chapter, you’ll
progress from simply plotting data to applying a variety of statistical
methods. These include a variety of linear models, descriptive and
inferential statistics (mean, standard deviation and confidence
intervals) and custom functions.

## Stats with geoms

Theory. Coming soon …

**1. Stats with geoms**

Welcome to the second ggplot2 course on data visualization! Here, we’re
going to build on the skills you learned in the first course to develop
a wide variety of plots that are not only appealing, but also
meaningful.

**2. ggplot2, course 2**

We’ll examine the following three layers in detail: statistics,
coordinates, and facets, plus, we’ll review some data viz tips so that
you can make the most of your new skill-set.Let’s get started with the
stats layer.

**3. Statistics layer**

There are two broad categories of functions in this family: those that
are called from within a geom and those that are called independently.As
you may have guessed, all the statistical functions begin with “stats”,
followed by an underscore. Even those called from within the geom layer
can be accessed independently in this way.

**4. geom\_ \<-\> stat\_**

We already saw a stats function when we used geom_histogram. Recall that
under the hood, this called stat_bin to summarize the total count in
each group.

**5. geom\_ \<-\> stat\_**

You may also remember that when we discussed geom_bar, I mentioned that
it’s default stat is set to “bin” – so we could have produced the same
result if we use geom_bar!

**6. geom\_ \<-\> stat\_**

The same thing happens with geom_bar, which just calls stat_count under
the hood. If we called stat_count directly, we’d get the same plot since
it would call geom_bar.

**7. The geom\_/stat\_ connection**

So we can see that specific geoms and stat functions are related.

**8. stat_smooth()**

stat_smooth can accessed with geom_smooth, shown here. The standard
error, which is shown as a gray ribbon behind our smooth, is by default,
a 95% confidence interval.

**9. stat_smooth(se = FALSE)**

We can remove this by setting the se argument to FALSE.We know we are
calling stat_smooth because of another warning message: “geom_smooth is
using method equal to loess, and formula y dependent on x”.LOESS is a
non-parametric smoothing algorithm that is used when we have less than
1000 observations. It works by calculating a weighted mean by passing a
sliding window along the x-axis and is a valuable tool in exploratory
data analysis.

**10. geom_smooth(span = 0.4)**

The span argument controls the degree of smoothing, which is the size of
the sliding window. Smaller spans are more noisy, as we can see here.

**11. geom_smooth(method = “lm”)**

The method argument can also define parametric models, such as “lm”, as
shown here, or “glm”, “rlm” and “gam”. For groups larger than one
thousand, the method defaults to gam. Notice that in both the LOESS and
LM examples, the model is calculated on groups defined by color. We’ll
look at how to override this in the exercises.

**12. geom_smooth(fullrange = TRUE)**

By default, each model is bound to the limits of its own group, but for
parametric methods, we can use the fullrange argument to make
predictions over the entire range. Just as we’d expect, the error
increases the further away from our data set we attempt to define an
estimate.

**13. The geom\_/stat\_ connection**

We can access smoothing using the geom smooth function or the stat
smooth function.

**14. Other stat\_ functions**

There are many other stats functions which we will encounter throughout
the rest of the data visualization courses, some of which are
particularly useful for summarizing data, like boxplots,

**15. Other stat\_ functions**

or dealing with very large data sets, such as bindot, binhex, bin2d and
contour - we’ll encounter those in the next course when we consider
graphics of large datasets.

**16. Other stat\_ functions**

We’ll encounter other functions throughout the exercises.In general, you
won’t have to call these functions directly, but it is worth knowing
about the relationship between geoms and their respective statistics.
You’ll understand warning and error messages better and the help pages
for the stats functions are often more informative if you need to adjust
any parameters.

**17. Let’s practice!**

OK, let’s see how stat functions work in practice in the exercises.

## Smoothing

To practice on the remaining layers (statistics, coordinates and
facets), we’ll continue working on several datasets.

The `mtcars` dataset contains information for 32 cars from Motor Trends
magazine from 1974. This dataset is small, intuitive, and contains a
variety of continuous and categorical (both nominal and ordinal)
variables.

In the previous course you learned how to effectively use some basic
geometries, such as point, bar and line. In the first chapter of this
course you’ll explore statistics associated with specific geoms, for
example, smoothing and lines.

**Steps**

1.  Look at the structure of `mtcars`.

``` r
# View the structure of mtcars
str(mtcars)
```

    ## 'data.frame':    32 obs. of  11 variables:
    ##  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
    ##  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
    ##  $ disp: num  160 160 108 258 360 ...
    ##  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
    ##  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
    ##  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
    ##  $ qsec: num  16.5 17 18.6 19.4 17 ...
    ##  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
    ##  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
    ##  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
    ##  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...

2.  Using `mtcars`, draw a scatter plot of `mpg` vs. `wt`.

``` r
# Using mtcars, draw a scatter plot of mpg vs. wt
library(magrittr)
library(ggplot2)
mtcars %>% 
    ggplot(aes(wt, mpg)) +
    geom_point()
```

![](readme_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

3.  Update the plot to add a smooth trend line. Use the default method,
    which uses the LOESS model to fit the curve.

``` r
# Amend the plot to add a smooth layer
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

4.  Update the smooth layer. Apply a linear model by setting `method` to
    `"lm"`, and turn off the model’s 95% confidence interval (the
    ribbon) by setting `se` to `FALSE`.

``` r
# Amend the plot. Use lin. reg. smoothing; turn off std err ribbon
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)
```

    ## `geom_smooth()` using formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

5.  Draw the same plot again, swapping `geom_smooth()` for
    `stat_smooth()`.

``` r
# Amend the plot. Swap geom_smooth() for stat_smooth().
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE)
```

    ## `geom_smooth()` using formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

Good job! You can use either
[`stat_smooth()`](http://www.rdocumentation.org/packages/ggplot2/functions/geom_smooth)
or
[`geom_smooth()`](http://www.rdocumentation.org/packages/ggplot2/functions/geom_smooth)
to apply a linear model. Remember to always think about how the examples
and concepts we discuss throughout the data viz courses can be applied
to your own datasets!

## Grouping variables

We’ll continue with the previous exercise by considering the situation
of looking at sub-groups in our dataset. For this we’ll encounter the
invisible `group` aesthetic.

`mtcars` has been given an extra column, `fcyl`, that is the `cyl`
column converted to a proper factor variable.

**Steps**

1.  Using `mtcars`, plot `mpg` vs. `wt`, colored by `fcyl`.

    -   Add a point layer.
    -   Add a smooth stat using a linear model, and don’t show the `se`
        ribbon.

``` r
# data
library(dplyr, warn.conflicts = F)
library(forcats)
mtcars <- mtcars |> 
            mutate(fcyl = as_factor(cyl))

# Using mtcars, plot mpg vs. wt, colored by fcyl
ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
  # Add a point layer
  geom_point() +
  # Add a smooth lin reg stat, no ribbon
  stat_smooth(method = "lm", se=F)
```

    ## `geom_smooth()` using formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

2.  Update the plot to add a second smooth stat.

    -   Add a dummy `group` aesthetic to this layer, setting the value
        to `1`.
    -   Use the same `method` and `se` values as the first stat smooth
        layer.

``` r
# Amend the plot to add another smooth layer with dummy grouping
ggplot(mtcars, aes(x = wt, y = mpg, color = fcyl)) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE) +
  stat_smooth(aes(group = 1), method = "lm", se = FALSE)
```

    ## `geom_smooth()` using formula 'y ~ x'
    ## `geom_smooth()` using formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

Good job! Notice that the color aesthetic defined an invisible group
aesthetic. Defining the group aesthetic for a specific geom means we can
overwrite that. Here, we use a dummy variable to calculate the smoothing
model for all values.

## Modifying stat_smooth

In the previous exercise we used `se = FALSE` in `stat_smooth()` to
remove the 95% Confidence Interval. Here we’ll consider another
argument, `span`, used in LOESS smoothing, and we’ll take a look at a
nice scenario of properly mapping different models.

**Steps**

1.  Explore the effect of the `span` argument on LOESS curves. Add three
    smooth LOESS stats, each without the standard error ribbon.

    -   Color the 1st one `"red"`; set its `span` to `0.9`.
    -   Color the 2nd one `"green"`; set its `span` to `0.6`.
    -   Color the 3rd one `"blue"`; set its `span` to `0.3`.

``` r
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  # Add 3 smooth LOESS stats, varying span & color
  stat_smooth(se = F, color = "red", span = 0.9) +
  stat_smooth(se = F, color = "green", span = 0.6) +
  stat_smooth(se = F, color = "blue", span = 0.3)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'
    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'
    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

2.  Compare LOESS and linear regression smoothing on small regions of
    data.

    -   Add a smooth LOESS stat, without the standard error ribbon.
    -   Add a smooth linear regression stat, again without the standard
        error ribbon.

``` r
# Amend the plot to color by fcyl
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  # Add a smooth LOESS stat, no ribbon
  stat_smooth(se=F) +
  # Add a smooth lin. reg. stat, no ribbon
  stat_smooth(method = "lm", se=F)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    ## `geom_smooth()` using formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->

3.  LOESS isn’t great on very short sections of data; compare the pieces
    of linear regression to LOESS over the whole thing.

    -   Amend the smooth LOESS stat to map `color` to a dummy variable,
        `"All"`.

``` r
# Amend the plot
ggplot(mtcars, aes(x = wt, y = mpg, color = fcyl)) +
  geom_point() +
  # Map color to dummy variable "All"
  stat_smooth(aes(color = "All"), se = FALSE) +
  stat_smooth(method = "lm", se = FALSE)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

    ## `geom_smooth()` using formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-10-1.png)<!-- -->

Spantastic! The default span for LOESS is 0.9. A lower span will result
in a better fit with more detail; but don’t overdo it or you’ll end up
over-fitting!

## Modifying stat_smooth (2)

In this exercise we’ll take a look at the standard error ribbons, which
show the 95% confidence interval of smoothing models. `ggplot2` and the
`Vocab` data frame are already loaded for you.

`Vocab` has been given an extra column, `year_group`, splitting the
dates into before and after 1995.

**Steps**

1.  Using `Vocab`, plot `vocabulary` vs. `education`, colored by
    `year_group`.

    -   Use `geom_jitter()` to add jittered points with transparency
        `0.25`.
    -   Add a smooth linear regression stat (with the standard error
        ribbon).

``` r
# data
library(car,warn.conflicts = F, quietly = T)
data(Vocab)
# Splitting the dates into before and after 1995. 
Vocab <- Vocab |> 
            as_tibble() |> 
            mutate(year_group = cut(year, breaks = c(1974, 1995, 2016), dig.lab = 4, include.lowest = T))

# Using Vocab, plot vocabulary vs. education, colored by year group
ggplot(Vocab, aes(x = education, y = vocabulary, color = year_group)) +
  # Add jittered points with transparency 0.25
  geom_jitter(alpha = 0.25) +
  # Add a smooth lin. reg. line (with ribbon)
  stat_smooth(method = "lm")
```

    ## `geom_smooth()` using formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-11-1.png)<!-- -->

2.  It’s easier to read the plot if the standard error ribbons match the
    lines, and the lines have more emphasis.

    -   Update the smooth stat.
        -   Map the fill color to `year_group`.
        -   Set the line size to `2`.

``` r
# Amend the plot
ggplot(Vocab, aes(x = education, y = vocabulary, color = year_group)) +
  geom_jitter(alpha = 0.25) +
  # Map the fill color to year_group, set the line size to 2
  stat_smooth(aes(fill = year_group), method = "lm", size = 2)
```

    ## `geom_smooth()` using formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

You have a vast plotting vocabulary! Notice that since 1995, education
has relatively smaller effect on increasing vocabulary.

## Stats: sum and quantile

Theory. Coming soon …

**1. Stats: sum and quantile**

Let’s wrap up our discussion of stats called from within geoms by
looking at two more useful functions: geom_count and geom_quantile

**2. Recall from course 1**

In the first course we saw that over-plotting is always a concern
whenever we use geom point. Every data point must be visible. We
discussed four ways in which our visualizations may mislead us.

**3. Plot counts to overcome over-plotting**

We can now add a new geom function to our solutions for low precision
and integer data: geom_count plot the count at each location. In course
3, we’ll see even more elegant solutions that can be applied to all four
situations.Let’s look at an example with geom_count.

**4. Low precision (& integer) data**

In the iris data set, where we have low-precision data, jittering gives
the impression that we have more precision that we actually do.

**5. Jittering may give a wrong impressions**

We should always mention that we’ve jittered our data because of this.

**6. geom_count()**

To avoid this problem, we can use another variant of geom_point.
geom_count counts the number of observations at each location and then
maps the count onto size as the point area.Our data is mapped onto the
area of the circle, as opposed to its radius, since we more intuitively
perceive area than radius.

**7. The geom/stat connection**

Remember that these geoms are associated with stats functions that can
be called directly, as shown here.

**8. stat_sum()**

Calling the stat function gives the exact same plot.We’ll see this trick
used with integer data in the exercises, which is a very common use.

**9. Over-plotting can still be a problem!**

But be careful here, you’ll still encounter over-plotting if the points
are colored according to another variable. This makes it particularly
difficult to read the plot!

**10. geom_quantile()**

The last function I want to look at in this section is geom_quantile.
It’s another great tool for describing our data. This method allows us
to model quantiles, which are robust, as opposed to linear models, which
model the non-robust mean.We can choose any quantile we’re interested
in, such as the median, which is just the second quartile. A typical
case of using quantile regression would be when you have
heteroscedasticity, that is the variance across the predictor variable
is not consistent, in which case linear models may not be valid.

**11. Dealing with heteroscedasticity**

Here’s an example of heteroscedasticity from a dataset of economics
journals from the AER package. We won’t get into the details of the
data, but you can see that variance on the y axis is not consistent as
we move along x axis.

**12. Using geom_quantiles**

Here, we can use geom_quantile to model the 5th and the 95th percentile
as well as the median, the 50th percentile.

**13. The geom/stat connection**

Just like the previous geoms, this is also associated with a stats
function that we can actually call directly.

**14. Ready for exercises!**

Let’s take these functions for a spin with some exercises!

## Quantiles

Here, we’ll continue with the `Vocab` dataset and use
<a href="http://www.rdocumentation.org/packages/ggplot2/functions/geom_quantile" target="_blank" rel="noopener noreferrer">`stat_quantile()`</a>
to apply a quantile regression.

Linear regression predicts the mean response from the explanatory
variables, quantile regression predicts a quantile response (e.g. the
median) from the explanatory variables. Specific quantiles can be
specified with the `quantiles` argument.

Specifying many quantiles *and* color your models according to year can
make plots too busy. We’ll explore ways of dealing with this in the next
chapter.

**Steps**

1.  Update the plot to add a quantile regression stat, at `quantiles`
    `0.05`, `0.5`, and `0.95`.

``` r
ggplot(Vocab, aes(x = education, y = vocabulary)) +
  geom_jitter(alpha = 0.25) +
  # Add a quantile stat, at 0.05, 0.5, and 0.95
  stat_quantile(quantiles = c(0.05, 0.5, 0.95))
```

    ## Smoothing formula not specified. Using: y ~ x

![](readme_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

2.  Amend the plot to color according to `year_group`.

``` r
# Amend the plot to color by year_group
ggplot(Vocab, aes(x = education, y = vocabulary, color = year_group)) +
  geom_jitter(alpha = 0.25) +
  stat_quantile(aes(color = year_group), quantiles = c(0.05, 0.5, 0.95))
```

    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x

    ## Warning in rq.fit.br(wx, wy, tau = tau, ...): Solution may be nonunique

![](readme_files/figure-gfm/unnamed-chunk-14-1.png)<!-- -->

Quick quantiles! Quantile regression is a great tool for getting a more
detailed overview of a large dataset.

## Using stat_sum

In the `Vocab` dataset, `education` and `vocabulary` are integer
variables. In the first course, you saw that this is one of the four
causes of overplotting. You’d get a single point at each intersection
between the two variables.

One solution, shown in the step 1, is jittering with transparency.
Another solution is to use
<a href="http://www.rdocumentation.org/packages/ggplot2/functions/geom_count" target="_blank" rel="noopener noreferrer">`stat_sum()`</a>,
which calculates the total number of overlapping observations and maps
that onto the `size` aesthetic.

`stat_sum()` allows a special variable, `..prop..`, to show the
*proportion* of values within the dataset.

**Steps**

1.  Run the code to see how jittering & transparency solves
    overplotting.
2.  Replace the jittered points with a sum stat, using `stat_sum()`.

``` r
# Run this, look at the plot, then update it
ggplot(Vocab, aes(x = education, y = vocabulary)) +
  # Replace this with a sum stat
  stat_sum(alpha = 0.25)
```

![](readme_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

3.  Modify the size *aesthetic* with the appropriate scale function.

    -   Add a `scale_size()` function to set the `range` from `1` to
        `10`.

``` r
ggplot(Vocab, aes(x = education, y = vocabulary)) +
  stat_sum() +
  # Add a size scale, from 1 to 10
  scale_size(range=c(1,10))
```

![](readme_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

4.  Inside `stat_sum()`, set `size` to `..prop..` so circle size
    represents the proportion of the whole dataset.

``` r
# Amend the stat to use proportion sizes
ggplot(Vocab, aes(x = education, y = vocabulary)) +
  stat_sum(aes(size = ..prop..))
```

![](readme_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

5.  Update the plot to group by `education`, so that circle size
    represents the proportion of the group.

``` r
# Amend the plot to group by education
ggplot(Vocab, aes(x = education, y = vocabulary, group = education)) +
  stat_sum(aes(size = ..prop..))
```

![](readme_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

Superb stat summing! If a few data points overlap, jittering is great.
When you have lots of overlaps (particularly where continuous data has
been rounded), using `stat_sum()` to count the overlaps is more useful.

## Stats outside geoms

Theory. Coming soon …

**1. Stats outside geoms**

Let’s take a look at some statistics that we call directly.

**2. Basic plot**

In this plot of the iris dataset, sepal length is described by
species.What can we do with this data?

**3. Calculating statistics**

A typical way to summarize this data would be to take the mean and
standard deviation or the 95% confidence interval.We can calculate these
values manually, or we can do it directly in ggplot2.Let’s see how it
works.

**4. Calculating statistics**

The function smean-dot-sdl from the Hmisc package returns the mean plus
or minus one standard deviation as a named vector. By setting the mult
argument to 1, we specify 1 standard deviation.In ggplot2, the function
mean_sdl converts this vector to a data frame, renaming the variables to
match ggplot2 aesthetics.

**5. stat_summary()**

We call mean_sdl using the fun.data argument of the stat_summary
function. By default we get geom_pointrange, which requires y, ymin and
ymax, exactly what is returned by mean_sdl.

**6. stat_summary()**

For errorbars, we can just calculate the mean and use “point” as the
geom, then we can call mean_sdl using the “errorbar” geom, where we can
also set the width of the error bars.

**7. stat_summary()**

But notice that we could have also made a typical bar plot with error
bars, by simply calling the bar geom - but this is NOT RECOMMENDED!
We’ll learn why when we get to data viz best practices later on!

**8. 95% confidence interval**

The 95% CI is also straight forward. mean_cl_normal returns the mean and
the upper and lower bounds of the 95% confidence interval, calculated
using the t-distribution.

**9. Other stat\_ functions**

Two other useful stat_layer functions are stat_function and stat_qq.
These are particularly useful if we want to look at
distributions.Statisticians typically use visual cues to get an idea of
the distribution of their data instead of relying only on numbers.

**10. MASS::mammals**

To see this in action let’s return to the first example we used in the
first course - the mammalian body and brain weights stored in the
mammals data frame. We mentioned that our linear model fitted the log10
transformed data reasonably well. What we mean is that the log
transformed data appears to be normally distributed, so let’s take a
look at that in detail.

**11. Normal distribution**

For stat_function, we can specify any function and produce the
theoretical probability distribution as a line. Here, we call a normal
distribution, that’s dnorm, and add arguments as a list to centered it
on our distribution, that’s the mean and the sd). This allows us to
compare how well our data is normally distributed. The log10 mammalian
body weight is described by a log normal curve very well. Notice that we
have another geom here, geom_rug, which adds those little tick marks on
the bottom of the plot. This is a handy way of seeing the actual values
in combination with a summary distribution.An empirical density plot,
would be an nice alternative to the histogram, but we’ll get to that in
the next course.

**12. QQ plot**

QQ plots also allows us to compare our data to a distribution. In this
case, we plot our sample against the theoretical distribution, like the
normal, and draw a line intersecting the scatter plot at the first and
third quartiles. The closer that our data aligns to this line, the more
closely it matches the theoretical distribution in question.

**13. Your turn!**

There are more stat\_ functions which are available for you to explore
during the exercises, so let’s take a look.

## Preparations

In the following exercises, we’ll aim to make the plot shown in the
viewer. Here, we’ll establish our positions and base layer of the plot.

Establishing these items as independent objects will allow us to recycle
them easily in many layers, or plots.

-   <a href="http://www.rdocumentation.org/packages/ggplot2/functions/position_jitter" target="_blank" rel="noopener noreferrer">`position_jitter()`</a>
    adds *jittering* (e.g. for points).
-   <a href="http://www.rdocumentation.org/packages/ggplot2/functions/position_dodge" target="_blank" rel="noopener noreferrer">`position_dodge()`</a>
    *dodges* geoms, (e.g. bar, col, boxplot, violin, errorbar,
    pointrange).
-   <a href="http://www.rdocumentation.org/packages/ggplot2/functions/position_jitterdodge" target="_blank" rel="noopener noreferrer">`position_jitterdodge()`</a>
    *jitters* **and** *dodges* geoms, (e.g. points).

As before, we’ll use `mtcars`, where `fcyl` and `fam` are proper factor
variables of the original `cyl` and `am` variables.

**Steps**

1.  Using these three functions, define these position objects:

    -   `posn_j`: will *jitter* with a `width` of `0.2`.
    -   `posn_d`: will *dodge* with a `width` of `0.1`.
    -   `posn_jd` will *jitter* **and** *dodge* with a `jitter.width` of
        `0.2` and a `dodge.width` of `0.1`.

``` r
# Define position objects
# 1. Jitter with width 0.2
posn_j <- position_jitter(width = 0.2)

# 2. Dodge with width 0.1
posn_d <- position_dodge(width = 0.1)   

# 3. Jitter-dodge with jitter.width 0.2 and dodge.width 0.1
posn_jd <- position_jitterdodge(jitter.width = 0.2, dodge.width = 0.1)
```

2.  Plot `wt` vs. `fcyl`, colored by `fam`. Assign this base layer to
    `p_wt_vs_fcyl_by_fam`.

    -   Plot the data using `geom_point()`.

``` r
#data
mtcars <- mtcars |> 
            mutate(fam = as_factor(am))

# Create the plot base: wt vs. fcyl, colored by fam
p_wt_vs_fcyl_by_fam <- ggplot(mtcars, aes(fcyl, wt, color = fam))

# Add a point layer
p_wt_vs_fcyl_by_fam +
  geom_point()
```

![](readme_files/figure-gfm/unnamed-chunk-20-1.png)<!-- -->

Patient preparation! The default positioning of the points is highly
susceptible to overplotting.

## Using position objects

Now that the position objects have been created, you can apply them to
the base plot to see their effects. You do this by adding a point geom
and setting the `position` argument to the position object.

The variables from the last exercise, `posn_j`, `posn_d`, `posn_jd`, and
`p_wt_vs_fcyl_by_fam` are available in your workspace.

**Steps**

1.  Apply the jitter position, `posn_j`, to the base plot.

``` r
# Add jittering only
p_wt_vs_fcyl_by_fam +
  geom_point(position = posn_j) 
```

![](readme_files/figure-gfm/unnamed-chunk-21-1.png)<!-- -->

2.  Apply the dodge position, `posn_d`, to the base plot.

``` r
# Add dodging only
p_wt_vs_fcyl_by_fam +
  geom_point(position = posn_d)
```

![](readme_files/figure-gfm/unnamed-chunk-22-1.png)<!-- -->

3.  Apply the jitter-dodge position, `posn_jd`, to the base plot.

``` r
# Add jittering and dodging
p_wt_vs_fcyl_by_fam +
  geom_point(position = posn_jd)
```

![](readme_files/figure-gfm/unnamed-chunk-23-1.png)<!-- -->

Perfect positioning! Although you can set position by setting the
`position` argument to a string (for example `position = "dodge"`),
defining objects promotes consistency between layers.

## Plotting variations

The preparation is done; now let’s explore
<a href="http://www.rdocumentation.org/packages/ggplot2/functions/stat_summary" target="_blank" rel="noopener noreferrer">`stat_summary()`</a>.

*Summary statistics* refers to a combination of *location* (mean or
median) and *spread* (standard deviation or confidence interval).

These metrics are calculated in `stat_summary()` by passing a function
to the `fun.data` argument. `mean_sdl()`, calculates multiples of the
standard deviation and `mean_cl_normal()` calculates the t-corrected 95%
CI.

Arguments to the data function are passed to `stat_summary()`’s
`fun.args` argument as a list.

The position object, `posn_d`, and the plot with jittered points,
`p_wt_vs_fcyl_by_fam_jit`, are available.

**Steps**

1.  Add error bars representing the standard deviation.

    -   Set the data function to `mean_sdl` (without parentheses).
    -   Draw 1 standard deviation each side of the mean, pass arguments
        to the `mean_sdl()` function by assigning them to `fun.args` in
        the form of a list.
    -   Use `posn_d` to set the position.

``` r
# data
p_wt_vs_fcyl_by_fam_jit <- p_wt_vs_fcyl_by_fam +
                            geom_jitter(width = 0.2)

p_wt_vs_fcyl_by_fam_jit +
  # Add a summary stat of std deviation limits
  stat_summary(
    fun.data = mean_sdl,
    fun.args = list(1),
    position = posn_d

  )
```

![](readme_files/figure-gfm/unnamed-chunk-24-1.png)<!-- -->

2.  The default geom for `stat_summary()` is `"pointrange"` which is
    already great.

    -   Update the summary stat to use an `"errorbar"` geom by assigning
        it to the `geom` argument.

``` r
p_wt_vs_fcyl_by_fam_jit +
  # Change the geom to be an errorbar
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), position = posn_d, geom = "errorbar")
```

![](readme_files/figure-gfm/unnamed-chunk-25-1.png)<!-- -->

3.  Update the plot to add a summary stat of 95% confidence limits.

    -   Set the data function to `mean_cl_normal` (without parentheses).
    -   Again, use the dodge position.

``` r
p_wt_vs_fcyl_by_fam_jit +
  # Add a summary stat of normal confidence limits
  stat_summary(
    fun.data = mean_cl_normal,
    position=posn_d
  )
```

![](readme_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->

Good job! You can always assign your own function to the `fun.data`
argument as long as the result is a data frame and the variable names
match the aesthetics that you will need for the geom layer.

# 2. Coordinates

The Coordinates layers offer specific and very useful tools for
efficiently and accurately communicating data. Here we’ll look at the
various ways of effectively using these layers, so you can clearly
visualize lognormal datasets, variables with units, and periodic data.

## Coordinates

Theory. Coming soon …

**1. The Coordinates Layer**

The coord layer controls the dimensions of your plot.

**2. Coordinates layer**

The coord layer is composed of functions named coord\_. Let’s explore
their propertiesThe most commonly used function is coord_cartesian,
which controls the x-y Cartesian plane of your plot.

**3. Zooming in**

We can use coord_cartesian to zoom in on a specific part of a plot.
Alternatively, we could set the limits argument in scale_x\_continuous
or scale_y\_continuous, or use an xlim or ylim function directly.

**4. Original plot**

Consider the following plot of the iris data. We’ve seen this plot in
previous lessons. It plots sepal width against sepal length and draws a
loess curve for each of our three iris species.

**5. scale_x\_continuous()**

When we “zoomed in” to a small part of the x-axis using
scale_x\_continuous, we’re presented with some important warning
messages. 95 rows have been removed. This happened because the limits we
set in scale_x\_continuous were a smaller range than the data and thus
values were filtered out.

**6. scale_x\_continuous()**

We can see this on the new zoomed-in plot, since the LOESS model is only
defined for the points shown, although there is data beyond this region.
That’s also why the models look different.

**7. xlim()**

A quick and dirty alternative is to call xlim as a function itself. It
has the same effect.

**8. coord_cartesian()**

Contrast this to really zooming in using the coord_cartesian function.
You can see the zoom because the LOESS curve continues past the data
presented, and the models look the same as in the original plot.We
haven’t filtered the data set, so if we did inadvertently cut off data
values, it would not be clear simply from looking at the plot – unless
we had some indicator such as a smoothing function.Changing the x and y
limits can lead to unexpected consequences and should always be used
with caution. Don’t recycle or hard code axis limits until you’ve seen
the raw data.

**9. Aspect ratio**

Aside from zooming in, another common role that you’ll achieve with the
coordinates layer is changing the aspect ratio. When we say ‘aspect
ratio’, we are referring to the height-to-width aspect ratio.Changing
the aspect ratio of a plot is one of the most common ways in which
people either inadvertently or purposely deceive – or are deceived –
with visualizations. There is no systematic method for choosing an
appropriate aspect ratio.The only rule to follow in this area is that,
typically, we should use a 1:1 aspect ratio when the units of measure
are the same, although there are some exceptions to this rule - for
example, when the scales are the same, but their ranges differ
widely.The aspect ratio is particularly important when it changes our
perception or interpretation of the data.

**10. Sunspots**

In this plot of over 250 years of sun spots data, there are three key
trends. First, sun spots follow an 11-year oscillating cycle. Second,
sun spot numbers also change over longer periods.However there is a
third and subtle patten present in this time series, but it’s very
difficult to see in this format.The aspect ratio here is 1:1, there are
250 units on the y and 265 units on the x. The physical distance for
each unit in the same.

**11. Sunspots**

However, if we reduce the aspect ratio to something very low, like
0.055, we flatten the entire plot and notice something else.Sunspots
arise more quickly than they disappear, a pattern that is more prevalent
the higher the peak intensity in a given cycle is. Different trends are
emphasized and the aspect ratio depends on what we are investigating or
communicating.

**12. Practice time!**

OK, let’s head over to the exercises and look at coordinates in more
detail.

## Zooming In

In the video, you saw different ways of using the coordinates layer to
zoom in. In this exercise, we’ll compare zooming by changing scales and
by changing coordinates.

The big difference is that the scale functions change the underlying
dataset, which affects calculations made by computed geoms (like
histograms or smooth trend lines), whereas coordinate functions make no
changes to the dataset.

A scatter plot using `mtcars` with a LOESS smoothed trend line is
provided. Take a look at this before updating it.

**Steps**

1.  Update the plot by adding (`+`) a continuous x scale with `limits`
    from `3` to `6`. *Spoiler: this will cause a problem!*

``` r
# Run the code, view the plot, then update it
ggplot(mtcars, aes(x = wt, y = hp, color = fam)) +
  geom_point() +
  geom_smooth() 
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-27-1.png)<!-- -->

``` r
  # Add a continuous x scale from 3 to 6
  scale_x_continuous(limits = c(3, 6))
```

    ## <ScaleContinuousPosition>
    ##  Range:  
    ##  Limits:    3 --    6

2.  Update the plot by adding a Cartesian coordinate system with x
    limits, `xlim`, from `3` to `6`.

``` r
ggplot(mtcars, aes(x = wt, y = hp, color = fam)) +
  geom_point() +
  geom_smooth() +
  # Add Cartesian coordinates with x limits from 3 to 6
  coord_cartesian(xlim = c(3,6))
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->

Zesty zooming! Using the scale function to zoom in meant that there
wasn’t enough data to calculate the trend line, and `geom_smooth()`
failed. When `coord_cartesian()` was applied, the full dataset was used
for the trend calculation.

## Aspect ratio I: 1:1 ratios

We can set the aspect ratio of a plot with
<a href="http://www.rdocumentation.org/packages/ggplot2/functions/coord_fixed" target="_blank" rel="noopener noreferrer">`coord_fixed()`</a>,
which uses `ratio = 1` as a default. A 1:1 aspect ratio is most
appropriate when two continuous variables are on the same scale, as with
the `iris` dataset.

All variables are measured in centimeters, so it only makes sense that
one unit on the plot should be the same physical distance on each axis.
This gives a more truthful depiction of the relationship between the two
variables since the aspect ratio can change the angle of our smoothing
line. This would give an erroneous impression of the data. Of course the
underlying linear models don’t change, but our perception can be
influenced by the angle drawn.

A plot using the `iris` dataset, of sepal width vs. sepal length colored
by species, is shown in the viewer.

**Steps**

1.  Add a fixed coordinate layer to force a 1:1 aspect ratio.

``` r
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_jitter() +
  geom_smooth(method = "lm", se = FALSE) +
  # Fix the coordinate ratio
  coord_fixed(ratio = 1)
```

    ## `geom_smooth()` using formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-29-1.png)<!-- -->

Awe-inspiring aspect alteration! A 1:1 aspect ratio is helpful when your
axes show the same scales.

## Aspect ratio II: setting ratios

When values are not on the same scale it can be a bit tricky to set an
appropriate aspect ratio. A classic William Cleveland (inventor of dot
plots) example is the `sunspots` data set. We have 3200 observations
from 1750 to 2016.

`sun_plot` is a plot *without* any set aspect ratio. It fills up the
graphics device.

To make aspect ratios clear, we’ve drawn an orange box that is 75 units
high and 75 *years* wide. Using a 1:1 aspect ratio would make the box
square. That aspect ratio would make things harder to see the
oscillations: it is better to force a wider ratio.

``` r
sunspots <- readRDS("data/sunspots.rds")
sun_plot <- sunspots %>%
  ggplot(aes(x = Date, y = Mean)) +
  geom_line(color="skyblue") +
  labs(y = "Sunspots", x = "Date") +
  geom_rect(aes(ymin = 310, ymax = 385), xmin = -40177, xmax = -12784, alpha = 0.75, colour = "orange", fill = NA)
sun_plot
```

![](readme_files/figure-gfm/unnamed-chunk-30-1.png)<!-- --> REWORK
NECESSARY!

**Steps**

1.  Fix the coordinates to a 1:1 aspect ratio.

``` r
# Fix the aspect ratio to 1:1
sun_plot +
  coord_fixed()
```

![](readme_files/figure-gfm/unnamed-chunk-31-1.png)<!-- -->

2.  The `y` axis is now unreadably small. Make it bigger!

    -   Change the aspect `ratio` to 20:1. This is the aspect ratio
        recommended by Cleveland to help make the trend among
        oscillations easiest to see.

``` r
# Change the aspect ratio to 20:1
sun_plot +
  coord_fixed(ratio = 20)
```

![](readme_files/figure-gfm/unnamed-chunk-32-1.png)<!-- -->

## Expand and clip

The `coord_*()` layer functions offer two useful arguments that work
well together: `expand` and `clip`.

-   `expand` sets a buffer margin around the plot, so data and axes
    don’t overlap. Setting `expand` to `0` draws the axes to the limits
    of the data.
-   `clip` decides whether plot elements that would lie outside the plot
    panel are displayed or ignored (“clipped”).

When done properly this can make a great visual effect! We’ll use
`theme_classic()` and modify the axis lines in this example.

**Steps**

1.  Add Cartesian coordinates with zero expansion, to remove all buffer
    margins on both the x and y axes.

``` r
ggplot(mtcars, aes(wt, mpg)) +
  geom_point(size = 2) +
  # Add Cartesian coordinates with zero expansion
  coord_cartesian(expand = 0) +
  theme_classic()
```

![](readme_files/figure-gfm/unnamed-chunk-33-1.png)<!-- -->

2.  Setting `expand` to `0` caused points at the edge of the plot panel
    to be cut off.

    -   Set the `clip` argument to `"off"` to prevent this.
    -   Remove the axis lines by setting the `axis.line` argument to
        `element_blank()` in the `theme()` layer function.

``` r
ggplot(mtcars, aes(wt, mpg)) +
  geom_point(size = 2) +
  # Turn clipping off
  coord_cartesian(expand = 0, clip = "off") +
  theme_classic() +
  # Remove axis lines
  theme(axis.line = element_blank())
```

![](readme_files/figure-gfm/unnamed-chunk-34-1.png)<!-- -->

Cool clipping! These arguments make clean and accurate plots by not
cutting off data.

## Coordinates vs. scales

Theory. Coming soon …

**1. Coordinates vs. scales**

In the next set of exercises, I want to look at how to use the
coordinate layer to perform transformations, and how that differs from
using the scale functions.

**2. Plot the raw data**

For these examples, I’m going to use the body weight variable from the
msleep data set. I made more adjustments than what’s shown here, but
this is the basic code to get this univariate plot. We can see that this
variable has a strong positive skew.In the first course, we saw how we
can use the scale functions to modify things like the x-axis limits and
breaks.Let’s consider three ways in which we can transform our data. A
common transformation for positively skewed data is a natural, base e,
logarithm, or the more intuitive common, base 10, logarithm.

**3. Transform the raw data**

We can transform the data before we begin plotting, and update the
actual data frame, or we can transform the variable on-the-fly when we
specify it in the aes function, as shown here. The result is the same.So
far, so good! Notice that the axis labels are the log-transformed
values, where zero is the log 10 of 1 kilograms, and 4 is the log 10 of
10000 kilograms.This is a very common solution, but it is a bit
misleading in that the transformed scale is linear and we have to do
some mental arithmetic to get back to the original values. So we’ve lost
a bit of precision here.

**4. Add logtick annotation**

We could add log annotation tick marks using the annotation_logticks
function. This highlights that the data is a log transformation.However,
another solution is to have the data on a log scale, and label it with
the actual original body weight value.We can do this in two ways.

\*\*5. Use scale\_\*\_log10()\*\*

The first method uses the scale_x\_log10 function. This transformed the
data and then calculates any statistics needed.

\*\*6. Compare direct transform and scale\_\*\_log10() output\*\*

The plots are almost identical, but pay attention to the axis labeling
in the second plot using the scale_x\_log10 function. The labels
correspond to the actual value in the data set. This is the default
output, we saw how to clean up axis labels in the first course.

**7. Use coord_trans()**

As you could imagine, we also have a function in the coordinate layer:
coord_trans, which is actually more flexible in that we can apply any
transformation we’d like.

\*\*8. Compare scale\_\*\_log10() and coord_trans() output\*\*

Using coord_trans and setting the x argument to “log10” results in the
same plot as with the scale function. The default labels happen to be
different, but the plot is the same.

**9. Adjusting labels**

As a final step, we can add the actual values of the data on the axis.
This is a really nice way to show the transformed values in relation to
the original value on the axis labels.This may give you the impression
that scale and coord functions work in the same way, but just like
zooming, there are some fundamental differences under the hood when
applying transformations. We’ll take a look at those in the exercises.

**10. Time for exercises**

Alright, now that you know how to use the scale and coord functions to
apply transformations, let’s look at bivariate plots and see how these
functions affect our statistics.

## Log-transforming scales

Using `scale_y_log10()` and `scale_x_log10()` is equivalent to
transforming our actual dataset *before* getting to `ggplot2`.

Using `coord_trans()`, setting `x = "log10"` and/or `y = "log10"`
arguments, transforms the data *after* statistics have been calculated.
The plot will look the same as with using `scale_*_log10()`, but the
scales will be different, meaning that we’ll see the original values on
our log10 transformed axes. This can be useful since log scales can be
somewhat unintuitive.

Let’s see this in action with positively skewed data - the brain and
body weight of 51 mammals from the `msleep` dataset.

**Steps**

1.  Using the `msleep` dataset, plot the raw values of `brainwt` against
    `bodywt` values as a scatter plot.

``` r
# Produce a scatter plot of brainwt vs. bodywt
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  ggtitle("Raw Values")
```

2.  Add the `scale_x_log10()` and `scale_y_log10()` layers with default
    values to transform the data before plotting.

``` r
# Add scale_*_*() functions
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  scale_x_log10() +
  scale_y_log10() +
  ggtitle("Scale_ functions")
```

    ## Warning: Removed 27 rows containing missing values (geom_point).

![](readme_files/figure-gfm/unnamed-chunk-36-1.png)<!-- -->

3.  Use `coord_trans()` to apply a `"log10"` transformation to both the
    `x` and `y` scales.

``` r
# Perform a log10 coordinate system transformation
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  coord_trans(
      x = "log10",
      y = "log10"
  )
```

    ## Warning: Removed 27 rows containing missing values (geom_point).

![](readme_files/figure-gfm/unnamed-chunk-37-1.png)<!-- -->

Terrific transformations! Each transformation method has implications
for the plot’s interpretability. Think about your audience when choosing
a method for applying transformations.

## Adding stats to transformed scales

In the last exercise, we saw the usefulness of the `coord_trans()`
function, but be careful! Remember that statistics are calculated on the
untransformed data. A linear model may end up looking not-so-linear
after an axis transformation. Let’s revisit the two plots from the
previous exercise and compare their linear models.

**Steps**

1.  Add log10 transformed scales to the x and y axes.

``` r
# Plot with a scale_*_*() function:
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  # Add a log10 x scale
  scale_x_log10() +
  # Add a log10 y scale
  scale_y_log10() +
  ggtitle("Scale functions")
```

    ## `geom_smooth()` using formula 'y ~ x'

    ## Warning: Removed 27 rows containing non-finite values (stat_smooth).

    ## Warning: Removed 27 rows containing missing values (geom_point).

![](readme_files/figure-gfm/unnamed-chunk-38-1.png)<!-- -->

2.  Add a log10 coordinate transformation for both the x and y axes.

``` r
# Plot with transformed coordinates
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  # Add a log10 coordinate transformation for x and y axes
  coord_trans(
      x = "log10",
      y = "log10"
  )
```

    ## `geom_smooth()` using formula 'y ~ x'

    ## Warning: Removed 27 rows containing non-finite values (stat_smooth).

    ## Warning: Removed 27 rows containing missing values (geom_point).

![](readme_files/figure-gfm/unnamed-chunk-39-1.png)<!-- -->

Loopy lines! The smooth trend line is calculated after scale
transformations but not coordinate transformations, so the second plot
doesn’t make sense. Be careful when using the `coord_trans()` function!

## Double and flipped axes

Theory. Coming soon …

**1. Double and flipped axes**

So far we’ve seen two ways in which we can modify our axes.

**2. Typical axis modifications**

First we saw that we can change the aspect ratio to obtain the best
perspective.In the last video we saw how we can also apply appropriate
transformation functions.Here, I want to take a look at two more common
modifications.

**3. Typical axis modifications**

Let’s begin with having double x or y axes.Actually, having a double x
or y axis is strongly discouraged. I’ll discuss when it can go wrong in
chapter 4.Here, I want to give show you when double axes can actually
work really well.

**4. Double axes**

We ended the last video with this plot. It displays log10 transformed
values. One problem with presenting transformed values is that we are an
additional step further removed from the raw data.

**5. Adding raw and transformed axes**

To make the plot easier to read, we can include the raw and the
log10-transformed values on one plot. This is a beautiful use case since
the double axis adds more information to an existing variable.

**6. Typical axis modifications**

Let’s take a look at one more typical modification. Flipping axes. This
can be useful for changing the direction of dependencies, but also when
we need to adjust the geometry’s orientation. We’ll look at the first
case in the video and you’ll explore the second in the exercises.

**7. Flipping axes**

We saw this plot of the iris dataset in the first video of this course.
It uses geom smooth to add three linear models to a scatter plot. In
this case, both sepal width and length are dependent variables. That is,
they are dependent on the species, which is the independent variable.
Statistically, it doesn’t really matter which is mapped to the x or
y.But in some cases it does. Our models are read as “y as a function of
x” since we typically map the dependent variable onto the y axis and the
independent variable onto the x axis.If we ever decide that our
orientation is incorrect, we can either change our code to remap our
variables, or

**8. coord_flip()**

we can use quick and easy coord flip function. In this way, we don’t
need to manually adjust all our code.You can only use one coord layer
function in each plot, so we don’t have the possibility to set the
aspect ratio anymore.

**9. Let’s practice!**

Alright, we’ve seen four different ways in which we can modify our axes.
Let’s practice with some exercises.

## Useful double axes

Double x and y-axes are a contentious topic in data visualization. We’ll
revisit that discussion at the end of chapter 4. Here, I want to review
a great use case where double axes actually do add value to a plot.

Our goal plot is displayed in the viewer. The two axes are the raw
temperature values on a Fahrenheit scale and the transformed values on a
Celsius scale.

You can imagine a similar scenario for Log-transformed and original
values, miles and kilometers, or pounds and kilograms. A scale that is
unintuitive for many people can be made easier by adding a
transformation as a double axis.

**Steps**

1.  Begin with a standard line plot, of `Temp` described by `Date` in
    the `airquality` dataset.

``` r
# data
airquality <- airquality |> 
    bind_cols(Date = seq(as.Date("1973-05-01"), as.Date("1973-09-30"), "days"))

# Using airquality, plot Temp vs. Date
ggplot(airquality, aes(Date, Temp)) +
  # Add a line layer
  geom_line() +
  labs(x = "Date (1973)", y = "Fahrenheit")
```

![](readme_files/figure-gfm/unnamed-chunk-40-1.png)<!-- -->

2.  Convert `y_breaks` from Fahrenheit to Celsius (subtract 32, then
    multiply by 5, then divide by 9).
3.  Define the secondary y-axis using `sec_axis()`. Use the `identity`
    transformation. Set the `breaks` and `labels` to the defined objects
    `y_breaks` and `y_labels`, respectively.

``` r
# Define breaks (Fahrenheit)
y_breaks <- c(59, 68, 77, 86, 95, 104)

# Convert y_breaks from Fahrenheit to Celsius
y_labels <- (y_breaks - 32) * 5 / 9

# Create a secondary x-axis
secondary_y_axis <- sec_axis(
  # Use identity transformation
  trans = identity,
  name = "Celsius",
  # Define breaks and labels as above
  breaks = y_breaks,
  labels = y_labels
)

# Examine the object
secondary_y_axis
```

    ## <ggproto object: Class AxisSecondary, gg>
    ##     axis: NULL
    ##     break_info: function
    ##     breaks: 59 68 77 86 95 104
    ##     create_scale: function
    ##     detail: 1000
    ##     empty: function
    ##     guide: waiver
    ##     init: function
    ##     labels: 15 20 25 30 35 40
    ##     make_title: function
    ##     mono_test: function
    ##     name: Celsius
    ##     trans: function
    ##     transform_range: function
    ##     super:  <ggproto object: Class AxisSecondary, gg>

4.  Add your secondary y-axis to the `sec.axis` argument of
    `scale_y_continuous()`.

``` r
# Update the plot
ggplot(airquality, aes(Date, Temp)) +
  geom_line() +
  # Add the secondary y-axis 
  scale_y_continuous(sec.axis = secondary_y_axis) +
  labs(x = "Date (1973)", y = "Fahrenheit")
```

![](readme_files/figure-gfm/unnamed-chunk-42-1.png)<!-- -->

Dazzling double axes! Double axes are most useful when you want to
display the same value in two differnt units.

## Flipping axes I

*Flipping* axes means to reverse the variables mapped onto the `x` and
`y` aesthetics. We can just change the mappings in `aes()`, but we can
also use the `coord_flip()` layer function.

There are two reasons to use this function:

-   We want a vertical geom to be horizontal, or
-   We’ve completed a long series of plotting functions and want to flip
    it without having to rewrite all our commands.

**Steps**

1.  Create a side-by-side (“dodged”) bar chart of `fam`, filled
    according to `fcyl`.

``` r
# Plot fcyl bars, filled by fam
ggplot(mtcars, aes(fill = fam, x = fcyl)) +
  # Place bars side by side
  geom_bar(position = "dodge")
```

![](readme_files/figure-gfm/unnamed-chunk-43-1.png)<!-- -->

2.  To get horizontal bars, add a `coord_flip()` function.

``` r
ggplot(mtcars, aes(fcyl, fill = fam)) +
  geom_bar(position = "dodge") +
  # Flip the x and y coordinates
  coord_flip()
```

![](readme_files/figure-gfm/unnamed-chunk-44-1.png)<!-- -->

3.  Partially overlapping bars are popular with “infoviz” in magazines.
    Update the `position` argument to use `position_dodge()` with a
    width of `0.5`.

``` r
ggplot(mtcars, aes(fcyl, fill = fam)) +
  # Set a dodge width of 0.5 for partially overlapping bars
  geom_bar(position = position_dodge(width = 0.5)) +
  coord_flip()
```

![](readme_files/figure-gfm/unnamed-chunk-45-1.png)<!-- -->

Flipping fantastic! Horizontal bars are especially useful when the axis
labels are long.

## Flipping axes II

In this exercise, we’ll continue to use the `coord_flip()` layer
function to reverse the variables mapped onto the `x` and `y`
aesthetics.

Within the `mtcars` dataset, `car` is the name of the car and `wt` is
its weight.

**Steps**

1.  Create a scatter plot of `wt` versus `car` using the `mtcars`
    dataset. We’ll flip the axes in the next step.

``` r
# data
mtcars <- mtcars |> tibble::rownames_to_column(var = "car")

# Plot of wt vs. car
ggplot(mtcars, aes(car, wt)) +
  # Add a point layer
  geom_point() +
  labs(x = "car", y = "weight")
```

![](readme_files/figure-gfm/unnamed-chunk-46-1.png)<!-- -->

2.  It would be easier to read if `car` was mapped to the y axis. Flip
    the coordinates. *Notice that the labels also get flipped!*

``` r
# Flip the axes to set car to the y axis
ggplot(mtcars, aes(car, wt)) +
  geom_point() +
  labs(x = "car", y = "weight") +
  coord_flip()
```

![](readme_files/figure-gfm/unnamed-chunk-47-1.png)<!-- -->

Even funkier flips! Notice how much more interpretable the plot is after
flipping the axes.

## Polar coordinates

Theory. Coming soon …

**1. Polar coordinates**

Every plot we’ve made so far has used a Cartesian coordinate space.

**2. Projections control perception**

For two dimensions, this just means two orthogonal axes composed of
straight lines.We can control how our data is perceived, by changing the
limits of each axis and the aspect ratio, which we’ve covered already.

**3. Projections control perception**

However, another aspect that controls how we perceive data is the
plotting projection.An example of this is with maps. We’ll cover this in
detail in the next course, but it’s worth mentioning here in the context
of projections.

**4. A preview of map projections**

There are many projections that we can use to present a 3D object, such
as the Earth, on a 2D space, like a map. Some projections are better
than others. For example the Mercator projection, on the left, is known
to engross regions at the poles and diminish regions around the equator.
The Conic projection is an alternative, but still suffers from the
problem of projecting a 3D object in 2D.

**5. Polar coordinates**

The same applies to the Cartesian coordinate system. One of the most
common projections is a polar transformation.

**6. coord_polar()**

Which can be seen here. In this case, theta, the axis which will be
presented around the circumference, defaults to the x axis. Imagine that
we just take the x axis on the left and bend it until it loops back on
itself, while expanding the top side as we go along. We’d end up with
the plot on the right.

**7. coord_polar(theta = “y”)**

a more common transformation is to place the y-axis on the circumference
by setting theta to y.Actually, this is exactly what we’d do with a bar
chart to convert it to a pie chart. As we’ll see in the exercises, a pie
chart is simply a bar chart transformed onto a polar coordinate
system.In the first course I mentioned how good data Visualization uses
encoding elements for the data that allows the more efficient and
accurate decoding by the viewer. According to that definition, polar
coordinates should be used with extreme caution since they considerably
distort that data. However, there are some specific use cases of polar
coordinates, and we’ll explore these in the exercises.

**8. Let’s practice!**

Alright, let’s head over to the exercise and take a look at polar
coordinates!

## Pie charts

The
<a href="http://www.rdocumentation.org/packages/ggplot2/functions/coord_polar" target="_blank" rel="noopener noreferrer">`coord_polar()`</a>
function converts a planar x-y Cartesian plot to polar coordinates. This
can be useful if you are producing pie charts.

We can imagine two forms for pie charts - the typical filled circle, or
a colored ring.

Typical pie charts omit all of the non-data ink, which we saw in the
themes chapter of the last course. Pie charts are not really better than
stacked bar charts, but we’ll come back to this point in the next
chapter.

A bar plot using `mtcars` of the number of cylinders (as a factor),
`fcyl`, is shown in the plot viewer.

**Steps**

1.  *Run the code to see the stacked bar plot.*
2.  Add (`+`) a polar coordinate system, mapping the angle to the `y`
    variable by setting `theta` to `"y"`.

``` r
# Run the code, view the plot, then update it
ggplot(mtcars, aes(x = 1, fill = fcyl)) +
  geom_bar() +
  # Add a polar coordinate system
  coord_polar(theta = "y")
```

![](readme_files/figure-gfm/unnamed-chunk-48-1.png)<!-- -->

3.  Reduce the `width` of the bars to `0.1`.
4.  Make it a ring plot by adding a continuous x scale with limits from
    `0.5` to `1.5`.

``` r
ggplot(mtcars, aes(x = 1, fill = fcyl)) +
  # Reduce the bar width to 0.1
  geom_bar(width = 0.1) +
  coord_polar(theta = "y") +
  # Add a continuous x scale from 0.5 to 1.5
  scale_x_continuous(
    limits = c(0.5, 1.5)
  )
```

![](readme_files/figure-gfm/unnamed-chunk-49-1.png)<!-- -->

Super-fly pie! Polar coordinates are particularly useful if you are
dealing with a cycle, like yearly data, that you would like to see
represented as such.

## Wind rose plots

Polar coordinate plots are well-suited to scales like compass direction
or time of day. A popular example is the “wind rose”.

The `wind` dataset is taken from the `openair` package and contains
hourly measurements for windspeed (`ws`) and direction (`wd`) from
London in 2003. Both variables are factors.

``` r
library(openair)
library(dplyr)
library(forcats)
library(purrr, warn.conflicts = F)

data("mydata", package = "openair")
wind <- mydata |> 
            filter(lubridate::year(date) == 2003) |> 
            mutate(wsf = cut(ws, breaks         = c(seq(0,20,2), Inf), 
                                 labels         = c(seq(0,18,2) |> map_chr(function(x) { paste0(x," - ",x + 2) }), "20+"),
                                 include.lowest = T) |> fct_rev()) |> 
            mutate(wdf = cut(wd, breaks = seq(0, 360 , by=22.5),
                                 include.lowest = T,
                                 labels = c("N","NNE","NE", "ENE", "E", "ESE", "SE", "SSE", 
                                            "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW")))
```

**Steps**

1.  Make a classic bar plot mapping `wdf` onto the `x` aesthetic and
    `wsf` onto `fill`.
2.  Use a `geom_bar()` layer, since we want to aggregate over all date
    values, and set the `width` argument to 1, to eliminate any spaces
    between the bars.

``` r
# Using wind, plot wd filled by ws
ggplot(wind, aes(wdf, fill = wsf)) +
  # Add a bar layer with width 1
  geom_bar(width = 1)
```

![](readme_files/figure-gfm/unnamed-chunk-51-1.png)<!-- -->

3.  Convert the Cartesian coordinate space into a polar coordinate space
    with `coord_polar()`.

``` r
# Convert to polar coordinates:
ggplot(wind, aes(wdf, fill = wsf)) +
  geom_bar(width = 1) +
  coord_polar()
```

![](readme_files/figure-gfm/unnamed-chunk-52-1.png)<!-- -->

4.  Set the `start` argument to `-pi/16` to position North at the top of
    the plot.

``` r
# Convert to polar coordinates:
ggplot(wind, aes(wdf, fill = wsf)) +
  geom_bar(width = 1) +
  coord_polar(start = -pi/16)
```

![](readme_files/figure-gfm/unnamed-chunk-53-1.png)<!-- -->

Perfect polar coordinates! They are not common, but polar coordinate
plots are really useful.

# 3. Facets

Facets let you split plots into multiple panes, each displaying subsets
of the dataset. Here you’ll learn how to wrap facets and arrange them in
a grid, as well as providing custom labeling.

## The facets layer

Theory. Coming soon …

**1. The facets layer**

The next layer we’ll take a look at is the the facets layer.

**2. Facets**

Facets are a pretty straight-forward and very useful tool in data
visualization. They are based on the concept of small multiples,
popularized by Edward Tufte in his 1983 book the Visualization of
Quantitative Information.

**3. The idea behind facets**

The idea is that we can split up a large, complex plot, to produce
multiple smaller plots

**4. The idea behind facets**

that have the exact same coordinate system. On each plot we present
different data sets so as to compare them more easily.

**5. iris.wide**

Here we use the iris.wide data frame to produce a scatter plot. We have
information on each of the species, so we can add a facet_grid layer to
add another variable to our plot.

**6. iris.wide & facet_grid()**

facet_grid has arguments for splitting plots into rows or columns
according to a variable provided in the var function. Here, we’re
splitting according to columns using the cols argument.

**7. Formula notation**

The same result can be achieved by using the formula notation which you
may be familiar with from defining linear models with the lm function.
Everything on the left of the tilde (\~) will split according to rows,
and everything on the right will split according to columns.So the
primary use of facets is to add another categorical variable to your
plot, but they also aid in visual perception.

**8. iris.wide2**

For example, we already saw where this is very useful in the first
course, when we talked about data structure. We used the iris.wide2 data
frame to produce three different plots. The issue was that each plot was
drawn on a separate y-axis, and we had to use three different plotting
functions to get these plots.

**9. iris.tidy**

When we use the iris.tidy data set, we can take advantage of the
facet_grid layer to solve both of theses problems. The trick in both of
these examples is to understand that facets are simply splitting up our
overall data set according to the levels in a categorical factor
variable. If our data is in the right format we can achieve this easily
using either columns or rows.

**10. iris.tidy done wrong**

In this case it doesn’t make sense to split according to rows because
the whole point is to aid in visual perception and to make comparisons.
When we split along columns, it allowed us to read our plots from left
to right along a single axis.

**11. Other options**

So the choice depends on what type of data you are using. Of course you
can also split according to both columns and rows, using two different
variables, and if you have many levels in your categorical variable, you
can wrap the subplots into a defined number of columns.

**12. Let’s practice!**

Alright, let’s explore these details and some further subtleties in the
exercises.

## Facet layer basics

Faceting splits the data up into groups, according to a categorical
variable, then plots each group in its own panel. For splitting the data
by one or two categorical variables,
<a href="http://www.rdocumentation.org/packages/ggplot2/functions/facet_grid" target="_blank" rel="noopener noreferrer">`facet_grid()`</a>
is best.

Given categorical variables `A` and `B`, the code pattern is

``` r
facet_grid(rows = vars(A), cols = vars(B))
```

This draws a panel for each pairwise combination of the values of `A`
and `B`.

Here, we’ll use the `mtcars` data set to practice. Although `cyl` and
`am` are not encoded as factor variables in the data set, `ggplot2` will
coerce variables to factors when used in facets.

**Steps**

1.  Facet the plot in a grid, with each `am` value in its own row.

``` r
ggplot(mtcars, aes(wt, mpg)) + 
  geom_point() +
  # Facet rows by am
  facet_grid(rows = vars(am))
```

2.  Facet the plot in a grid, with each `cyl` value in its own column.

``` r
ggplot(mtcars, aes(wt, mpg)) + 
  geom_point() +
  # Facet columns by cyl
  facet_grid(cols = vars(cyl))
```

![](readme_files/figure-gfm/unnamed-chunk-56-1.png)<!-- -->

3.  Facet the plot in a grid, with each `am` value in its own row and
    each `cyl` value in its own column.

``` r
ggplot(mtcars, aes(wt, mpg)) + 
  geom_point() +
  # Facet rows by am and columns by cyl
  facet_grid(rows = vars(am), 
             cols = vars(cyl))
```

![](readme_files/figure-gfm/unnamed-chunk-57-1.png)<!-- -->

Fantastic faceting! Compare the different plots that result and see
which one makes most sense.

## Many variables

In addition to aesthetics, facets are another way of encoding factor
(i.e. categorical) variables. They can be used to reduce the complexity
of plots with many variables.

Our goal is the plot in the viewer, which contains 7 variables.

Two variables are mapped onto the color aesthetic, using hue and
lightness. To achieve this we combined `fcyl` and `fam` into a single
<a href="https://www.rdocumentation.org/packages/base/topics/interaction" target="_blank" rel="noopener noreferrer">interaction</a>
variable, `fcyl_fam`. This will allow us to take advantage of Color
Brewer’s *Paired* color palette.

**Steps**

1.  Map `fcyl_fam` onto the a `color` aesthetic.
2.  Add a `scale_color_brewer()` layer and set `"Paired"` as the
    `palette`.

``` r
# data
mtcars <- mtcars |> 
            mutate(fcyl_fam = interaction(fcyl, fam, sep = ":"))

# See the interaction column
mtcars$fcyl_fam
```

    ##  [1] 6:1 6:1 4:1 6:0 8:0 6:0 8:0 4:0 4:0 6:0 6:0 8:0 8:0 8:0 8:0 8:0 8:0 4:1 4:1
    ## [20] 4:1 4:0 8:0 8:0 8:0 8:0 4:1 4:1 4:1 8:1 6:1 8:1 4:1
    ## Levels: 4:0 6:0 8:0 4:1 6:1 8:1

``` r
# Color the points by fcyl_fam
ggplot(mtcars, aes(x = wt, y = mpg, color = fcyl_fam)) +
  geom_point() +
  # Use a paired color palette
  scale_color_brewer(palette = "Paired")
```

![](readme_files/figure-gfm/unnamed-chunk-58-1.png)<!-- -->

3.  Map `disp`, the displacement volume from each cylinder, onto the
    `size` aesthetic.

``` r
# Update the plot to map disp to size
ggplot(mtcars, aes(x = wt, y = mpg, color = fcyl_fam, size = disp)) +
  geom_point() +
  scale_color_brewer(palette = "Paired")
```

![](readme_files/figure-gfm/unnamed-chunk-59-1.png)<!-- -->

4.  Add a `facet_grid()` layer, faceting the plot according to `gear` on
    rows and `vs` on columns.

``` r
# Update the plot
ggplot(mtcars, aes(x = wt, y = mpg, color = fcyl_fam, size = disp)) +
  geom_point() +
  scale_color_brewer(palette = "Paired") +
  # Grid facet on gear and vs
  facet_grid(rows = vars(gear), cols = vars(vs))
```

![](readme_files/figure-gfm/unnamed-chunk-60-1.png)<!-- -->

Good job! The last plot you’ve created contains 7 variables (4
categorical, 3 continuous). Useful combinations of aesthetics and facets
help to achieve this.

## Formula notation

As well as the `vars()` notation for specifying which variables should
be used to split the dataset into facets, there is also a traditional
formula notation. The three cases are shown in the table.

| Modern notation                              | Formula notation    |
|:---------------------------------------------|:--------------------|
| `facet_grid(rows = vars(A))`                 | `facet_grid(A ~ .)` |
| `facet_grid(cols = vars(B))`                 | `facet_grid(. ~ B)` |
| `facet_grid(rows = vars(A), cols = vars(B))` | `facet_grid(A ~ B)` |

`mpg_by_wt` is available again. Rework the previous plots, this time
using formula notation.

**Steps**

1.  Facet the plot in a grid, with each `am` value in its own row.

``` r
ggplot(mtcars, aes(wt, mpg)) + 
  geom_point() +
  # Facet rows by am using formula notation
  facet_grid(am ~ .)
```

2.  Facet the plot in a grid, with each `cyl` value in its own column.

``` r
ggplot(mtcars, aes(wt, mpg)) + 
  geom_point() +
  # Facet columns by cyl using formula notation
  facet_grid(. ~ cyl)
```

![](readme_files/figure-gfm/unnamed-chunk-62-1.png)<!-- -->

3.  Facet the plot in a grid, with each `am` value in its own row and
    each `cyl` value in its own column.

``` r
ggplot(mtcars, aes(wt, mpg)) + 
  geom_point() +
  # Facet rows by am and columns by cyl using formula notation
  facet_grid(am ~ cyl)
```

![](readme_files/figure-gfm/unnamed-chunk-63-1.png)<!-- -->

Fortunate formula formulation! While many ggplots still use the
traditional formula notation, using `vars()` is now preferred.

## Facet labels and order

Theory. Coming soon …

**1. Facet labels and order**

Now that you understand how to use facets for one or more categorical
variables, let’s take a look at labeling and arranging facets properly.

**2. A new dataframe**

We’ll begin with a modified version of the msleep dataframe from ggplot2
that I’ve called msleep2. msleep2 contains the log10 transformed body
and brain weights of 51 animals, which I’ve plotted as a scatterplot
here.

**3. A new dataframe, with facets**

Another variable, called vore contains information on eating behavior,
which we can use to facet the plot. There are four eating habits:
Herbivore, Carnivore, Insectivore and Omnivore.

**4. A new dataframe, with facets**

To make sure you can read the labels we’ll periodically zoom in, which
means that the entire plot may not be shown.

**5. Poor labels and order**

Two typical problems with facets are that they are often poorly labeled
or that they have a wrong or inappropriate order.

**6. Poor labels and order**

We can fix up some of the labels inside ggplot2, but some things are
better done on the actual data before plotting. Let’s take a look at
both.

**7. The labeller argument**

The facet layer functions have a labeller argument, which defaults to
label_value.

**8. Using label_both adds the variable name**

A more useful argument is to use label_both, which puts both the name of
the variable and the level value.

**9. Two variables on one side**

In the exercises, we saw that we can use multiple variables on rows or
columns, like I’ve done here with the conservation status.

**10. Using label_context avoids ambiguity**

In this case we can use the label_context argument which will add the
variable name only if the labels may be ambiguous. If each variable has
a small number of labels, this works well, as we’ll see in the
exercises. Unfortunately, this plot is already pretty overloaded and you
can see that the labels are too long for the space given!

**11. Use rows and columns when appropriate**

Let’s switch to faceting on both rows and columns, in which case
label_context defaults to label_value,

**12. Use rows and columns when appropriate**

which means we can just leave it out.

**13. Use rows and columns when appropriate**

Here, all the labels fit nicely inside the alloted space.Let’s take a
look at the actual facet labels and positions. To change these we need
to go to the data set directly.

**14. Relabeling and reordering factors**

The forcats package in the tidyverse collection contains some really
useful functions here. I like fct_recode, as shown here, for relabeling
level names in a factor variable.

**15. Reinitialize plot with new labels**

If we reinitialize our plot, we’ll see the new, informative, labels.

**16. Reinitialize plot with new labels**

Nonetheless, we may still want them in a different order than
alphabetical.

**17. Changing the order of levels**

The fct_relevel function makes this really easy, as the second argument
we just need to put the levels in our desired order.

**18. Reinitialize plot with new order**

Now when we reinitialize out plot, our facets are in an appropriate
order.

**19. Let’s practice!**

Let’s try this out on a few exercises with the mtcars dataframe.

## Labeling facets

If your factor levels are not clear, your facet labels may be confusing.
You can assign proper labels in your original data *before* plotting
(see next exercise), or you can use the `labeller` argument in the facet
layer.

The default value is

-   `label_value`: Default, displays only the value

Common alternatives are:

-   `label_both`: Displays both the value and the variable name
-   `label_context`: Displays only the values or both the values and
    variables depending on whether multiple factors are faceted

**Steps**

1.  Add a `facet_grid()` layer and facet `cols` according to the `cyl`
    using `vars()`. There is no labeling.

``` r
# Plot wt by mpg
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # The default is label_value
  facet_grid(cols = vars(cyl))
```

![](readme_files/figure-gfm/unnamed-chunk-64-1.png)<!-- -->

2.  Apply `label_both` to the `labeller` argument and check the output.

``` r
# Plot wt by mpg
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Displaying both the values and the variables
  facet_grid(cols = vars(cyl), labeller = label_both)
```

![](readme_files/figure-gfm/unnamed-chunk-65-1.png)<!-- -->

3.  Apply `label_context` to the `labeller` argument and check the
    output.

``` r
# Plot wt by mpg
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Label context
  facet_grid(cols     = vars(cyl), 
             labeller = label_context)
```

![](readme_files/figure-gfm/unnamed-chunk-66-1.png)<!-- -->

4.  In addition to `label_context`, let’s facet by one more variable:
    `vs`.

``` r
# Plot wt by mpg
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Two variables
  facet_grid(cols = vars(vs, cyl), labeller = label_context)
```

![](readme_files/figure-gfm/unnamed-chunk-67-1.png)<!-- -->

Lovely labels! Make sure there is no ambiguity in interpreting plots by
using proper labels.

## Setting order

If you want to change the order of your facets, it’s best to properly
define your factor variables *before* plotting.

Let’s see this in action with the `mtcars` transmission variable `am`.
In this case, `0` = “automatic” and `1` = “manual”.

Here, we’ll make `am` a factor variable and relabel the numbers to
proper names. The default order is alphabetical. To rearrange them we’ll
call `fct_rev()` from the `forcats` package to reverse the order.

**Steps**

1.  Explicitly label the `0` and `1` values of the `am` column as
    `"automatic"` and `"manual"`, respectively.

``` r
# Make factor, set proper labels explictly
mtcars$fam <- factor(mtcars$am, labels = c(`0` = "automatic",
                                           `1` = "manual"))

# Default order is alphabetical
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  facet_grid(cols = vars(fam))
```

![](readme_files/figure-gfm/unnamed-chunk-68-1.png)<!-- -->

2.  Define a specific order using separate `levels` and `labels`
    arguments. Recall that `1` is `"manual"` and `0` is `"automatic"`.

``` r
# Make factor, set proper labels explictly, and
# manually set the label order
mtcars$fam <- factor(mtcars$am,
                     levels = c(1, 0),
                     labels = fct_rev(c("manual", "automatic")))

# View again
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  facet_grid(cols = vars(fam))
```

![](readme_files/figure-gfm/unnamed-chunk-69-1.png)<!-- -->

Outstanding ordering! Arrange your facets in an intuitive order for your
data.

## Facet plotting spaces

Theory. Coming soon …

**1. Facet plotting spaces**

The major advantage of facets is that every plot is drawn on the same
plotting space. This makes them all directly comparable.

**2. Facets and variable plotting spaces**

Nonetheless, you may encounter situations in which you actually don’t
want this. For example in continuous variables, if the faceted subsets
have wildly different ranges you’ll just be adding a lot of white space.
In the case of categorical data, it’s common that each subset may have
different groups, so it may not be necessary, or even appropriate to
list all groups in each of the faceted plots.

**3. Adjusting the plotting space…**

Let’s look at this with the plot we ended the last video with. We used
facet_grid to create rows according to eating habit and columns
according to conservation status. To adjust the plotting space, we can
use the scales argument.

**4. … but not with fixed scales**

If we set this argument to “free_x” we’ll allow each column of plot to
have their own x axis. However, here we run into a typical problem. We
can’t use a fixed coordinate space and have free axes as the same time.

**5. Adjusting the plotting space**

Once we remove the fixed coordinate space, then we can adjust the x axis
for each column.

**6. Adjusting the plotting space**

We can do the same for the y axis by setting the scales argument to
“free_y” instead.

**7. Adjusting the plotting space**

We can adjust both the x and y axes by setting the scales argument to
“free”. Note that each column and row has at least a common x and y axis
respectively.

**8. Adjusting the plotting space**

Let’s take a look at how this works with categorical variables. Each
animal has only one eating behavior, stored in the vore variable. If we
plotted the bodyweight of each animal in the name variable and facet
according to `vore`, we would repeat the full name list in each
sub-plot.This occurs when a categorical variable has many levels, like
the name, that are not all present in each sub-group of another
variable, like vore.

**9. Adjusting the plotting space**

If we set the scales to free_y, we’ll have only those names present in
each facet, but the size of each plot is the still the same.

**10. Adjusting the plotting space**

This behavior can be changed with the spaces argument , which works in
the same way as scales: “free_x” allows different sized facets on the
x-axis, “free_y” allows different sized facets on the y-axis, and “free”
allows different sizes in both directions. Here, we need to use
“free_y”.This plot already looks great! But there is one more thing we
may want to change.

**11. Final adjustments**

We can rearrange the data frame according to the weight and then
redefine the factor levels according to the order in which they appear.
This will arrange them in the same way in the plot.Thinking about the
order of the names in this case makes the plot more intuitive.

**12. Let’s practice!**

Great, let’s head over to the exercises and see this all in action.

## Variable plotting spaces I: continuous variables

By default every facet of a plot has the same axes. If the data ranges
vary wildly between facets, it can be clearer if each facet has its own
scale. This is achieved with the `scales` argument to `facet_grid()`.

-   `"fixed"` (default): axes are shared between facets.
-   `free`: each facet has its own axes.
-   `free_x`: each facet has its own x-axis, but the y-axis is shared.
-   `free_y`: each facet has its own y-axis, but the x-axis is shared.

When faceting by columns, `"free_y"` has no effect, but we can adjust
the x-axis. In contrast, when faceting by rows, `"free_x"` has no
effect, but we can adjust the y-axis.

**Steps**

1.  Update the plot to facet columns by `cyl`.

``` r
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() + 
  # Facet columns by cyl 
  facet_grid(cols = vars(cyl))
```

![](readme_files/figure-gfm/unnamed-chunk-70-1.png)<!-- -->

2.  Update the faceting to free the x-axis scales.

``` r
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() + 
  # Update the faceting to free the x-axis scales
  facet_grid(cols = vars(cyl),
            scales = "free_x")
```

![](readme_files/figure-gfm/unnamed-chunk-71-1.png)<!-- -->

3.  Facet **rows** by `cyl` (rather than columns).
4.  Free the **y**-axis scales (instead of x).

``` r
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() + 
  # Swap cols for rows; free the y-axis scales
  facet_grid(rows = vars(cyl), scales = "free_y")
```

![](readme_files/figure-gfm/unnamed-chunk-72-1.png)<!-- -->

Freedom! Shared scales make it easy to compare between facets, but can
be confusing if the data ranges are very different. In that case, used
free scales.

## Variable plotting spaces II: categorical variables

When you have a categorical variable with many levels which are not all
present in each sub-group of another variable, it’s usually desirable to
drop the unused levels.

By default, each facet of a plot is the same size. This behavior can be
changed with the `spaces` argument, which works in the same way as
`scales`: `"free_x"` allows different sized facets on the x-axis,
`"free_y"`, allows different sized facets on the y-axis, `"free"` allows
different sizes in both directions.

**Steps**

1.  Facet the plot by rows according to `gear` using `vars()`. Notice
    that *every* car is listed in *every* facet, resulting in many lines
    without data.

``` r
ggplot(mtcars, aes(x = mpg, y = car, color = fam)) +
  geom_point() +
  # Facet rows by gear
  facet_grid(rows = vars(gear))
```

![](readme_files/figure-gfm/unnamed-chunk-73-1.png)<!-- -->

2.  To remove blank lines, set the `scales` and `space` arguments in
    `facet_grid()` to `free_y`.

``` r
ggplot(mtcars, aes(x = mpg, y = car, color = fam)) +
  geom_point() +
  # Free the y scales and space
  facet_grid(rows   = vars(gear),
             scales = "free_y",
             space  = "free_y")
```

![](readme_files/figure-gfm/unnamed-chunk-74-1.png)<!-- -->

Super spaces! Freeing the y-scale to remove blank lines helps focus
attention on the actual data present.

## Facet wrap & margins

Theory. Coming soon …

**1. Facet wrap & margins**

In the last video we explored facet_grid() for splitting up a plot
according to a categorical variable.

**2. Adjusting the plotting space**

We saw that this allowed us to set a free x axis for all plots the same
column and a free y axis for all plots in the same row. That’s alright,
but wouldn’t it be great if each plot can also have it’s own x and y
axes dependent on their data? Actually, it kind of defeats the purpose
of having small multiples, but it can be useful if we have distinct
ranges.To achieve this, we can take advantage of another useful function
in this layer: facet_wrap

**3. Using facet_wrap()**

There are a couple use cases for this function.First, as I just
mentioned, when we want each plot to have its own plotting space, but we
still want to take advantage of tidy data structure and ggplot2 to
generate all those plots as facets of a larger plot, and not as
individual plots.

**4. Using facet_wrap() - Scenario 1**

For facet_wrap, we specify one or more faceting variables with a single
call to the vars function. facet_wrap will automatically choose an
appropriate number of columns and rows.So this gets the job done, but
you can see that it is more difficult to keep track of each plot and
variable compared to facet_grid, so use this with caution.

**5. Using facet_wrap()**

Second, and what is a more typical scenario, is when our categorical
variable has many groups, so that faceting along only rows or only
columns is overwhelming.

**6. Using facet_wrap() - Scenario 2**

For example, here, our 51 animals belong to 13 taxonomic orders which is
nicely displayed with facet wrap. Using facet grid would produce a
single row or column with 13 plots, which would be impractical.

**7. Using margin plots**

Before we wrap up with facets, let’s look at one more adjustment we can
make with this layer. We can present each facet *and* a composite plot
with all categories together. These are called margin plots.This was our
original facetted plot, but

**8. Using margin plots**

if we add the margins argument to the facet layer, we can add margin
plots for both the rows and columns that display all points together.
Notice that in the lower right corner, we have the complete data set in
one facet.

**9. Using margin plots**

We can also specify one one variable to produce the margin plots.

**10. Let’s practice!**

So far so good. We’ve seen that there is a lot more to the facet layer
than just splitting up your plots. Let’s explore these last concepts in
the exercises.

## Wrapping for many levels

`facet_grid()` is fantastic for categorical variables with a small
number of levels. Although it is possible to facet variables with many
levels, the resulting plot will be very wide or very tall, which can
make it difficult to view.

The solution is to use `facet_wrap()` which separates levels along one
axis but wraps all the subsets across a given number of rows or columns.

For this plot, we’ll use the `Vocab` dataset that we’ve already seen.
The base layer is provided.

Since we have many `years`, it doesn’t make sense to use `facet_grid()`,
so let’s try `facet_wrap()` instead.

**Steps**

1.  Add a facet_wrap() layer and specify:

    -   The `year` variable with an argument using the `vars()`
        function,

``` r
ggplot(Vocab, aes(x = education, y = vocabulary)) +
  stat_smooth(method = "lm", se = FALSE) +
  # Create facets, wrapping by year, using vars()
  facet_wrap(vars(year))
```

    ## `geom_smooth()` using formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-75-1.png)<!-- -->

2.  Add a `facet_wrap()` layer and specify the `year` variable with a
    formula notation (`~`).

``` r
ggplot(Vocab, aes(x = education, y = vocabulary)) +
  stat_smooth(method = "lm", se = FALSE) +
  # Create facets, wrapping by year, using a formula
  facet_wrap(~ year)
```

    ## `geom_smooth()` using formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-76-1.png)<!-- -->

3.  Add a `facet_wrap()` layer and specify:

    -   Formula notation as before, and `ncol` set to `11`.

``` r
ggplot(Vocab, aes(x = education, y = vocabulary)) +
  stat_smooth(method = "lm", se = FALSE) +
  # Update the facet layout, using 11 columns
  facet_wrap(~ year, ncol = 11)
```

    ## `geom_smooth()` using formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-77-1.png)<!-- -->

It’s a wrap! Start experimenting with facets in your own plots.

## Margin plots

Facets are great for seeing subsets in a variable, but sometimes you
want to see *both* those subsets *and* all values in a variable.

Here, the `margins` argument to `facet_grid()` is your friend.

-   `FALSE` (default): no margins.
-   `TRUE`: add margins to every variable being faceted by.
-   `c("variable1", "variable2")`: only add margins to the variables
    listed.

To make it easier to follow the facets, we’ve created two factor
variables with proper labels — `fam` for the transmission type, and
`fvs` for the engine type, respectively.

*Zoom the graphics window to better view your plots.*

**Steps**

1.  Update the plot to facet the rows by `fvs` and `fam`, and columns by
    `gear`.

``` r
# data
mtcars <- mtcars |> 
           mutate(fvs = as_factor(vs))

# Plot
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point() +
  # Facet rows by fvs and cols by fam
  facet_grid(rows = vars(fvs, fam), 
             cols = vars(gear))
```

![](readme_files/figure-gfm/unnamed-chunk-78-1.png)<!-- -->

2.  Add all possible margins to the plot.

``` r
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point() +
  # Update the facets to add margins
  facet_grid(rows = vars(fvs, fam), 
             cols = vars(gear),
             margins = T)
```

![](readme_files/figure-gfm/unnamed-chunk-79-1.png)<!-- -->

3.  Update the facets to only show margins on `"fam"`.

``` r
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point() +
  # Update the facets to only show margins on fam
  facet_grid(rows = vars(fvs, fam), 
             cols = vars(gear), 
             margins = "fam")
```

![](readme_files/figure-gfm/unnamed-chunk-80-1.png)<!-- -->

4.  Update the facets to only show margins on `"gear"` and `"fvs"`.

``` r
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point() +
  # Update the facets to only show margins on gear and fvs
  facet_grid(rows = vars(fvs, fam), cols = vars(gear), margins = c("gear", "fvs"))
```

![](readme_files/figure-gfm/unnamed-chunk-81-1.png)<!-- -->

Magic margins! It can be really helpful to show the full margin plots!

# 4. Best Practices

Now that you have the technical skills to make great visualizations,
it’s important that you make them as meaningful as possible. In this
chapter, you’ll review three plot types that are commonly discouraged in
the data viz community: heat maps, pie charts, and dynamite plots.
You’ll learn the pitfalls with these plots and how to avoid making these
mistakes yourself.

## Best practices: bar plots

Theory. Coming soon …

**1. Best practices: bar plots**

Knowing how to efficiently use ggplot is a good first step,

**2. In this chapter**

but now we need to consider what is the best way to graphically
represent our data, what are the common pitfalls and what is the best
way to represent our data.

**3. Bar plots**

There are two common types of bar plots. The first is simply showing an
absolute count value. The second is a distribution, which is as terrible
as it is common. Why is that?

**4. Mammalian sleep**

Let’s return to the mammalian sleep data set. We have eating habits of
several mammals along with the time they spend sleeping and how much of
that time is REM sleep.

**5. Dynamite plot**

We map vore and sleep onto the x and y aesthetics, respectively, and
draw the error bars as discussed in chapter one.So far so good, but we
have no idea how many observations we have in each category!This plot
also suggests that our data is normally distributed. If our data is not
normally distributed it’s not appropriate to represent it in this way.A
further perceptual problem is that our bars give the impression of
having data where there is no data. There for sure are no mammals which
sleep 0 hours a day! Yet the bars begin showing data at 0, plus, the
region above the mean contains values but no ink! What could be a better
way?

**6. Individual data points**

Well first off, we can simply show the individual data points. This is
first off necessary for ourselves, to really see what our data looks
like, but it may actually already be a pretty good end point! Note that
here we used geom_point and set the position to jitter with the
position_jitter function so that we can control the width of the
jittering. alpha is also set to 0.6 in case there is any residual over
plotting.ok, so now we can start to see some strange patterns in our
data set! First off, it’s pretty clear that we don’t have that much data
for Insectivores, and that it anyways looks pretty strange. We can’t
really say much about them, but if we had to say something it looks like
they are bimodal. We’d need some more data to make better conclusions.
Omnivores also look pretty interesting, it appears as though this data
is positively skewed. So we can start drawing conclusions that were
previously impossible to see.

**7. geom_errorbar()**

Of course we could still plot both the individual data points and the
summary statistics with the geom errorbar

**8. geom_pointrange()**

or the geom pointrange.

**9. Without data points**

And it’s obvious that we could have simply shown these summary
statistics by themselves.

**10. Bars are not necessary**

Notice that the error bars with points are a much cleaner representation
of the data. The bars are simply not necessary! Now, none of these
summary plots are particularly useful in this specific case, mostly
because we know now that the insectivore and omnivore data sets are not
suitable. Nonetheless they may be perfectly good alternatives for your
data, so they are worth mentioning.There are some more plotting
geometries that we’ll discuss in the next course when we get into
statistical plots, such as box plots and violin plots are. Here I just
want to mention that they are also alternatives, in general, but not
necessarily in this situation.

**11. Ready for exercises!**

OK, let’s explore these concepts in more detail in the exercises.

## Bar plots: dynamite plots

In the video we saw many reasons why “dynamite plots” (bar plots with
error bars) are *not* well suited for their intended purpose of
depicting distributions. If you *really* want error bars on bar plots,
you can of course get them, but you’ll need to set the positions
manually. A point geom will typically serve you much better.

Nonetheless, you should know how to handle these kinds of plots, so
let’s give it a try.

**Steps**

1.  Using `mtcars,`, plot `wt` versus `fcyl`.
2.  Add a bar summary stat, aggregating the `wt`s by their mean, filling
    the bars in a skyblue color.
3.  Add an errorbar summary stat, aggregating the `wt`s by `mean_sdl`.

``` r
# Plot wt vs. fcyl
ggplot(mtcars, aes(x = fcyl, y = wt)) +
  # Add a bar summary stat of means, colored skyblue
  stat_summary(fun = mean, geom = "bar", fill = "skyblue") +
  # Add an errorbar summary stat std deviation limits
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = 0.1)
```

![](readme_files/figure-gfm/unnamed-chunk-82-1.png)<!-- -->

Excellent errors! Remember, we can specify any function in `fun.data` or
`fun.y` and we can also specify any `geom`, as long as it’s appropriate
to the data type.

## Bar plots: position dodging

In the previous exercise we used the `mtcars` dataset to draw a dynamite
plot about the weight of the cars per cylinder type.

In this exercise we will add a distinction between transmission type,
`fam`, for the dynamite plots and explore position dodging (where bars
are side-by-side).

**Steps**

1.  Add two more aesthetics so the bars are `color`ed and `fill`ed by
    `fam`.

``` r
# Update the aesthetics to color and fill by fam
ggplot(mtcars, aes(x = fcyl, y = wt, color = fam, fill = fam)) +
  stat_summary(fun = mean, geom = "bar") +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = 0.1)
```

![](readme_files/figure-gfm/unnamed-chunk-83-1.png)<!-- -->

2.  The stacked bars are tricky to interpret. Make them transparent and
    side-by-side.

    -   Make the bar summary statistic transparent by setting `alpha` to
        `0.5`.
    -   For each of the summary statistics, set the bars’ position to
        `"dodge"`.

``` r
# Set alpha for the first and set position for each stat summary function
ggplot(mtcars, aes(x = fcyl, y = wt, color = fam, fill = fam)) +
  stat_summary(
    fun = mean, 
    geom = "bar", 
    position = "dodge", 
    alpha = 0.5) +
  stat_summary(
    fun.data = mean_sdl, 
    fun.args = list(mult = 1), 
    geom     = "errorbar", 
    position = "dodge", 
    width    = 0.1)
```

![](readme_files/figure-gfm/unnamed-chunk-84-1.png)<!-- -->

3.  The error bars are incorrectly positioned. Use a position object.

    -   Define a dodge position object with width `0.9`, assigned to
        `posn_d`.
    -   For each of the summary statistics, set the bars’ position to
        `posn_d`.

``` r
# Define a dodge position object with width 0.9
posn_d <- position_dodge(width=0.9)

# For each summary stat, update the position to posn_d
ggplot(mtcars, aes(x     = fcyl, 
                   y     = wt, 
                   color = fam, 
                   fill  = fam)) +
  stat_summary(
    fun      = mean, 
    geom     = "bar", 
    position = posn_d, 
    alpha    = 0.5) +
  stat_summary(
    fun.data = mean_sdl, 
    fun.args = list(mult = 1), 
    width    = 0.1, 
    position = posn_d, 
    geom     = "errorbar")
```

![](readme_files/figure-gfm/unnamed-chunk-85-1.png)<!-- -->

Bar plots 2.0! slightly overlapping bar plots are common in the popular
press and add a bit of style to your data viz.

## Bar plots: Using aggregated data

If it *is* appropriate to use bar plots (see the video!), then it nice
to give an impression of the number of values in each group.

`stat_summary()` doesn’t keep track of the count.
<a href="http://www.rdocumentation.org/packages/ggplot2/functions/geom_count" target="_blank" rel="noopener noreferrer">`stat_sum()`</a>
does (that’s the whole point), but it’s difficult to access. It’s more
straightforward to calculate exactly what we want to plot ourselves.

Here, we’ve created a summary data frame called `mtcars_by_cyl` which
contains the average (`mean_wt`), standard deviations (`sd_wt`) and
count (`n_wt`) of car weights, for each cylinder group, `cyl`. It also
contains the proportion (`prop`) of each cylinder represented in the
entire dataset. Use the console to familiarize yourself with the
`mtcars_by_cyl` data frame.

**Steps**

1.  Draw a bar plot with `geom_bar()`.

    -   Using `mtcars_by_cyl`, plot `mean_wt` versus `cyl`.
    -   Add a bar layer, with `stat` set to `"identity"` an fill-color
        `"skyblue"`.

``` r
# data
mtcars_by_cyl <- mtcars |> 
  group_by(cyl) |> 
  summarise(mean_wt = mean(wt),
            sd_wt   = sd(wt),
            n_wt    = n()) |> 
  mutate(prop =  n_wt/sum(n_wt))

# Using mtcars_cyl, plot mean_wt vs. cyl
ggplot(mtcars_by_cyl, aes(cyl, mean_wt)) +
  # Add a bar layer with identity stat, filled skyblue
  geom_bar(stat="identity", fill="skyblue")
```

![](readme_files/figure-gfm/unnamed-chunk-86-1.png)<!-- -->

2.  Draw the same plot with `geom_col()`.

    -   Replace `geom_bar()` with `geom_col()`.
    -   Remove the `stat` argument.

``` r
ggplot(mtcars_by_cyl, aes(x = cyl, y = mean_wt)) +
  # Swap geom_bar() for geom_col()
  geom_col(fill = "skyblue")
```

![](readme_files/figure-gfm/unnamed-chunk-87-1.png)<!-- -->

3.  Change the bar widths to reflect the proportion of data they
    contain.

    -   Add a `width` aesthetic to `geom_col()`, set to `prop`. (*Ignore
        the warning from ggplot2.*)

``` r
ggplot(mtcars_by_cyl, aes(x = cyl, y = mean_wt)) +
  # Set the width aesthetic to prop
  geom_col(fill = "skyblue",
           aes(width = prop))
```

    ## Warning: Ignoring unknown aesthetics: width

![](readme_files/figure-gfm/unnamed-chunk-88-1.png)<!-- -->

4.  Add `geom_errorbar()`.

    -   Set the `ymin` aesthetic to `mean_wt` minus `sd_wt`. Set the
        `ymax` aesthetic to the mean weight plus the standard deviation
        of the weight.
    -   Set the width to `0.1`.

``` r
ggplot(mtcars_by_cyl, aes(x = cyl, y = mean_wt)) +
  geom_col(aes(width = prop), fill = "skyblue") +
  # Add an errorbar layer
  geom_errorbar(
    # ... at mean weight plus or minus 1 std dev
    aes(ymin = mean_wt - sd_wt,
        ymax = mean_wt + sd_wt),
    # with width 0.1
    width = 0.1
  )
```

    ## Warning: Ignoring unknown aesthetics: width

![](readme_files/figure-gfm/unnamed-chunk-89-1.png)<!-- -->

Awesome Aggregrates! This is a good start, but it’s difficult to adjust
the spacing between the bars.

## Heatmaps use case scenario

Theory. Coming soon …

**1. Heatmaps use case scenario**

I briefly mentioned before that heat maps are a poor data visualization
method. It’s surprising, since they are really popular among scientists
of all stripes. Let’s take a closer look.

**2. The barley dataset**

Our dataset is a classic in data visualization. We have four variables:
The yield of 10 different barley varieties measured at two years and at
10 different sites.

**3. A basic heat map**

Our heat map is basically a colored table. Our three categorical
variables are mapped onto x, y and fill. The continuous variable, yield,
is mapped onto fill.So what’s wrong with this plot?Well, although there
are some exceptions, color on a continuous scale is problematic. Color
perception depends on context. Here, each color appears in a different
background, which means that heat maps are not well-suited for seeing
individual results. If our categories were clustered in a way the brings
out overall trends, then we may make the case for a heat map, because it
would at least communicate something. Often times this is not the
case.Many times, heat maps look complex and try to impress the viewer
with a meaningless “wow” factor.What would be a better alternative?

**4. A dot plot**

Here, we can switch the mapping of yield onto the x and year onto the
color scale.Now we can ask very pointed questions, such as which variety
performed best in a given year. How does a particular variety perform at
a given site? To answer these questions, we use a process of slow
table-look up type perception. It’s slow and time-consuming, but very
useful.We can also start to see some trends. First, red, 1931, is mostly
greater than blue, 1932. Second, the farms are arranged from lowest
overall average, Grand Rapids, to highest, Waseca. Third, we can also
notice a difference in spread among the farms. These large overall
trends are discernible from this visualization, but they take a bit of
time to see. How about an alternative?

**5. As a time series**

Typically, when you have a time scale, the key question is change over
time. How do yields differ between the two years?This line plot shows
that change for each variety over time. It has all the same information
as the previous plot but it’s more difficult to answer the precise
questions from before. However, it is an easier way to see the general
trends in the data set. We’ve increased the speed of our
perception.Notice that there are 10 colors for the 10 varieties. It’s
getting pretty difficult to distinguish all the colors and we’re at the
limits of visual perception. It still kind-of works, but it’s starting
to push it.

**6. Using dodged error bars**

We can aggregate all the varieties by using their mean, and focus on the
farms. We saw how to do this in the stat_summary section. Here I’ve used
errorbars with some dodging.

**7. Using ribbons for error**

Alternatively, we could have also used ribbons without dodging. Both
dodged error bars and overlapping ribbons work for showing uncertainty,
the choice depends on the density of your data and your audience.In
summary, there are many good alternatives to heat maps, depending on the
research question and our take-home message.

**8. Coding Time!**

Let’s explore how to produce these plots in the exercises.

## Heat maps

Since heat maps encode *color* on a continuous scale, they are difficult
to accurately *decode*, a topic we discussed in the first course. Hence,
heat maps are most useful if you have a small number of boxes and/or a
clear pattern that allows you to overcome decoding difficulties.

To produce them, map two categorical variables onto the `x` and `y`
aesthetics, along with a continuous variable onto `fill`. The
<a href="http://www.rdocumentation.org/packages/ggplot2/functions/geom_tile" target="_blank" rel="noopener noreferrer">`geom_tile()`</a>
layer adds the boxes.

We’ll produce the heat map we saw in the video (in the viewer) with the
built-in `barley` dataset. The `barley` dataset is in the `lattice`
package and has already been loaded for you. Use
<a href="http://www.rdocumentation.org/packages/utils/functions/str" target="_blank" rel="noopener noreferrer">`str()`</a>
to explore the structure.

**Steps**

1.  Using `barley`, plot `variety` versus `year`, filled by `yield`.
2.  Add a
    <a href="http://www.rdocumentation.org/packages/ggplot2/functions/geom_tile" target="_blank" rel="noopener noreferrer">`geom_tile()`</a>
    layer.

``` r
# data
library(lattice)

# Using barley, plot variety vs. year, filled by yield
ggplot(barley, aes(year, variety, fill = yield)) +
  # Add a tile geom
  geom_tile()
```

![](readme_files/figure-gfm/unnamed-chunk-90-1.png)<!-- -->

3.. Add a
<a href="http://www.rdocumentation.org/packages/ggplot2/functions/facet_wrap" target="_blank" rel="noopener noreferrer">`facet_wrap()`</a>
function with facets as `vars(site)` and `ncol = 1`. *Strip names will
be above the panels, not to the side (as with `facet_grid()`).* 4. Give
the heat maps a 2-color palette using
<a href="http://www.rdocumentation.org/packages/ggplot2/functions/scale_gradient" target="_blank" rel="noopener noreferrer">`scale_fill_gradient()`</a>.
Set `low` and `high` to `"white"` and `"red"`, respectively.

``` r
# Previously defined
ggplot(barley, aes(x = year, y = variety, fill = yield)) +
  geom_tile() + 
  # Facet, wrapping by site, with 1 column
  facet_wrap(facets = vars(site), ncol = 1) +
  # Add a fill scale using an 2-color gradient
  scale_fill_gradient(low = "white", high = "red")
```

![](readme_files/figure-gfm/unnamed-chunk-91-1.png)<!-- -->

5.  A color palette of 9 reds, made with
    <a href="http://www.rdocumentation.org/packages/RColorBrewer/functions/ColorBrewer" target="_blank" rel="noopener noreferrer">`brewer.pal()`</a>,
    is provided as `red_brewer_palette`.

    -   Update the fill scale to use an *n*-color gradient with
        <a href="http://www.rdocumentation.org/packages/ggplot2/functions/scale_gradient" target="_blank" rel="noopener noreferrer">`scale_fill_gradientn()`</a>
        (note the `n`). Set the scale `colors` to the red brewer
        palette.

``` r
# A palette of 9 reds
library(RColorBrewer)
red_brewer_palette <- brewer.pal(9, "Reds")

# Update the plot
ggplot(barley, aes(x = year, y = variety, fill = yield)) +
  geom_tile() + 
  facet_wrap(facets = vars(site), ncol = 1) +
  # Update scale to use n-colors from red_brewer_palette
  scale_fill_gradientn(colors = red_brewer_palette)
```

![](readme_files/figure-gfm/unnamed-chunk-92-1.png)<!-- -->

Good job! You can continue by using breaks, limits and labels to modify
the fill scale and update the theme, but this is a pretty good start.

## Useful heat maps

> ## *Question*
>
> Heat maps are often a poor data viz solution because they typically
> don’t convey useful information. We saw a nice alternative in the last
> exercise. But sometimes they *are* really good. Which of the following
> scenarios is *not* one of those times?<br> <br> ⬜ When data has been
> sorted, e.g. according to a clustering algorithm, and we can see clear
> trends.<br> ⬜ When there are few groups with large differences.<br>
> ✅ When we have a large data set and we want to impress our colleagues
> with how complex our work is!<br> ⬜ When using explanatory plots to
> communicate a clear message to a non-scientific audience.<br>

Yes. This is typical and it’s why many people dislike heatmaps.

## Heat map alternatives

There are several alternatives to heat maps. The best choice really
depends on the data and the story you want to tell with this data. If
there is a time component, the most obvious choice is a line plot.

``` r
# The heat map we want to replace
# Don't remove, it's here to help you!
ggplot(barley, aes(x = year, y = variety, fill = yield)) +
  geom_tile() +
  facet_wrap( ~ site, ncol = 1) +
  scale_fill_gradientn(colors = brewer.pal(9, "Reds"))
```

![](readme_files/figure-gfm/unnamed-chunk-93-1.png)<!-- -->

**Steps**

1.  Using `barley`, plot `yield` versus `year`, colored and grouped by
    `variety`.
2.  Add a line layer.
3.  Facet, wrapping by `site`, with 1 row.

``` r
# Using barley, plot yield vs. year, colored and grouped by variety
ggplot(barley, aes(year, yield, color = variety, group = variety)) +
  # Add a line layer
  geom_line() +
  # Facet, wrapping by site, with 1 row
  facet_wrap( ~ site, nrow = 1)
```

![](readme_files/figure-gfm/unnamed-chunk-94-1.png)<!-- -->

4.  Display only means and ribbons for spread.

    -   Map `site` onto `color`, `group` and `fill`.
    -   Add a
        <a href="http://www.rdocumentation.org/packages/ggplot2/functions/stat_summary" target="_blank" rel="noopener noreferrer">`stat_summary()`</a>
        layer. set `fun.y = mean`, and `geom = "line"`.
    -   In the second
        <a href="http://www.rdocumentation.org/packages/ggplot2/functions/stat_summary" target="_blank" rel="noopener noreferrer">`stat_summary()`</a>,
        set `geom = "ribbon"`, `color = NA` and `alpha = 0.1`.

``` r
# Using barely, plot yield vs. year, colored, grouped, and filled by site
ggplot(barley, aes(x = year, 
                   y = yield, 
                   color = site, 
                   group = site, 
                   fill  = site)) +
  # Add a line summary stat aggregated by mean
  stat_summary(fun.y = mean, geom = "line") +
  # Add a ribbon summary stat with 10% opacity, no color
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "ribbon", alpha = 0.1, color = NA)
```

    ## Warning: `fun.y` is deprecated. Use `fun` instead.

![](readme_files/figure-gfm/unnamed-chunk-95-1.png)<!-- -->

Good job! Whenever you see a heat map, ask yourself it it’s really
necessary. Many people use them because they look fancy and
complicated - signs of poor communication skills.

## When good data makes bad plots

Theory. Coming soon …

**1. When good data makes bad plots**

So far, we’ve focused on making good plots, but it’s worthwhile to be
able to identify and correct bad plots.

**2. Bad plots: style**

There are many ways in which we can have bad plots. Simple formatting
errors like poor color and text choices make it difficult to read the
data correctly or even make our plots look ugly. All text should also
serve a purpose and be legible for our audience. Pause the video and
take a minute to review the items listed here. You’ve probably seen them
already in the wild.

**3. Bad plots: structure and content**

Deeper problems occur with structure and content. As the domain expert
it’s your job to know if you are overloading a plot with too much
information to simply impress your viewers, or if you are producing a
useless plot just to fill us space.The axes, statistics and geometries
must also be used effectively. It doesn’t hurt to reduce non-data ink
and, finally, 3D plots should be avoided. Pause the video again and take
a minute to review these topics before continuing.Let’s take a look at
some common data viz pitfalls.

**4. Wrong orientation**

We typically read the y axis of a plot as a function of x, denoted f(x).
That means that the variable on the y axis is a dependent variable of
the independent x axis variable. Flipping the axes is confusing.

**5. Wrong orientation?**

But, actually, sometimes it works great! We saw this at the end of the
last course,

**6. Wrong orientation?**

and in the last video. In both cases the axes were flipped to make them
easier to read.

**7. Broken y-axes**

Broken y-axes are also popular. This compensates for a large range in
the data set with a large gap between the high and low
values.Unfortunately, the upper and lower parts are on different scales!

**8. Broken y-axes, replace with transformed data**

We would rather transform the scales. For example using a log 10
transformation, as shown here, or,

**9. Broken y-axes, use facets**

or more typically, use facets with free scales.

**10. 3D plots, without data on the 3rd axis**

The 3D plot is another favorite but often, the 3rd axis actually serves
no purpose but to confuse the audience as to which part of the geometry
should be read on the scale.

**11. 3D plots, with data on the 3rd axis**

Sometimes 3D plots really do contain information in the 3rd axis, like
3D scatter plots. But can you figure out the position of each dot in
this plot? It just adds to obscuring our data. Ideally we’d like to
provide this as an interactive object or else as a series of two
dimensional plots.

**12. Double y-axes**

Double y-axes are also problematic but popular.Perceptual challenges in
reading the data make this difficult, and it also invites suspicious
activity since the scales are independent and the visual message can be
manipulated to emphasis or diminish the perceived correlation by
changing the range of values on the scale.If the two values are to be
correlated then we should have an x-y plot that shows the correlation.

**13. Double y-axis for transformations**

We did actually see a great example of double x and y-axes in the second
chapter, when we had a raw and transformed scale.

**14. Guidelines not rules**

But, remember, there are very few rules in data visualization, which is
what makes it so interesting and difficult.Just use your common sense –
if anything on your plot obscures communication it is at worst unethical
and at best poor execution.I hope that by now you are also a critical
consumer of data visualization and are not so easily fooled by other
people’s poor judgement or purposeful misdirection.

**15. Let’s practice!**

We’ll explore the bits that we can fix in ggplot2 in the exercises, so
let’s get started.

## Suppression of the origin

> ## *Question*
>
> Suppression of the origin refers to *not* showing 0 on a continuous
> scale. When is it inappropriate to suppress the origin?<br> <br> ✅
> When the scale *has* a natural zero, like height or distance.<br> ⬜
> When the scale *doesn’t have* a natural zero, like temperature (in C
> or F).<br> ⬜ When there is a large amount of whitespace between the
> origin and the actual data.<br> ⬜ When it does not obscure the shape
> of the data.<br>

Correct. This would be a good reason to begin at 0, but it’s not
strictly necessary and not always appropriate.

## Color blindness

Red-Green color blindness is surprisingly prevalent, which means that
part of your audience will not be able to ready your plot if you are
relying on color aesthetics.

> ## *Question*
>
> Why would it be appropriate to use red and green in a plot?<br> <br>
> ⬜ When red and green are the actual colors in the sample
> (e.g. fluorescence in biological assays).<br> ⬜ When red means
> stop/bad and green means go/good.<br> ⬜ Because red and green are
> complimentary colors and look great together.<br> ✅ When red and
> green have different intensities (e.g. light red and dark green).<br>

If you really want to use red and green, this is a way to make them
accessible to color blind people, since they sill still be able to
distinguish intensity. It’s not as salient as hue, but it still works.

## Typical problems

When you first encounter a data visualization, either from yourself or a
colleague, you always want to critically ask if it’s obscuring the data
in any way.

Let’s take a look at the steps we could take to produce and improve the
plot in the view.

The data comes from an experiment where the effect of two different
types of vitamin C sources, orange juice or ascorbic acid, were tested
on the growth of the odontoblasts (cells responsible for tooth growth)
in 60 guinea pigs.

The data is stored in the `TG` data frame, which contains three
variables: `dose`, `len`, and `supp`.

**Steps**

1.  The first plot contains purposely illegible labels. It’s a common
    problem that can occur when resizing plots. There is also too much
    non-data ink.

    -   Change `theme_gray(3)` to `theme_classic()`.

``` r
# data
data("ToothGrowth")
TG <- ToothGrowth

# Initial plot
growth_by_dose <- ggplot(TG, aes(dose, len, color = supp)) +
  stat_summary(fun.data = mean_sdl,
               fun.args = list(mult = 1),
               position = position_dodge(0.1)) +
  theme_classic()

# View plot
growth_by_dose
```

![](readme_files/figure-gfm/unnamed-chunk-96-1.png)<!-- -->

2.  Our previous plot still has a major problem, `dose` is stored as a
    `factor` variable. That’s why the spacing is off between the levels.

    -   Use `as.character()` wrapped in `as.numeric()` to convert the
        factor variable to real (continuous) numbers.

``` r
# Change type
TG$dose <- as.numeric(as.character(TG$dose))

# Plot
growth_by_dose <- ggplot(TG, aes(dose, len, color = supp)) +
  stat_summary(fun.data = mean_sdl,
               fun.args = list(mult = 1),
               position = position_dodge(0.2)) +
  theme_classic()

# View plot
growth_by_dose
```

![](readme_files/figure-gfm/unnamed-chunk-97-1.png)<!-- -->

3.  Use the appropriate geometry for the data:

    -   In the new `stat_summary()` function, set `fun.y` to to
        calculate the `mean` and the `geom` to a `"line"` to connect the
        points at their mean values.

``` r
# Change type
TG$dose <- as.numeric(as.character(TG$dose))

# Plot
growth_by_dose <- ggplot(TG, aes(dose, len, color = supp)) +
  stat_summary(fun.data = mean_sdl,
               fun.args = list(mult = 1),
               position = position_dodge(0.2)) +
  # Use the right geometry
  stat_summary(fun.y = mean,
               geom = "line",
               position = position_dodge(0.1)) +
  theme_classic()
```

    ## Warning: `fun.y` is deprecated. Use `fun` instead.

``` r
# View plot
growth_by_dose
```

![](readme_files/figure-gfm/unnamed-chunk-98-1.png)<!-- -->

4.  Make sure the labels are informative:

    -   Add the units `"(mg/day)"` and `"(mean, standard deviation)"` to
        the x and y labels, respectively.
    -   Use the `"Set1"` palette.
    -   Set the legend labels to `"Orange juice"` and `"Ascorbic acid"`.

``` r
# Change type
TG$dose <- as.numeric(as.character(TG$dose))

# Plot
growth_by_dose <- ggplot(TG, aes(dose, len, color = supp)) +
  stat_summary(fun.data = mean_sdl,
               fun.args = list(mult = 1),
               position = position_dodge(0.2)) +
  stat_summary(fun.y = mean,
               geom = "line",
               position = position_dodge(0.1)) +
  theme_classic() +
  # Adjust labels and colors:
  labs(x = "Dose (mg/day)", y = "Odontoblasts length (mean, standard deviation)", color = 
"Supplement") +
  scale_color_brewer(palette = "Set1", labels = c("Orange juice", "Ascorbic acid")) +
  scale_y_continuous(limits = c(0,35), breaks = seq(0, 35, 5), expand = c(0,0))
```

    ## Warning: `fun.y` is deprecated. Use `fun` instead.

``` r
# View plot
growth_by_dose
```

![](readme_files/figure-gfm/unnamed-chunk-99-1.png)<!-- -->
