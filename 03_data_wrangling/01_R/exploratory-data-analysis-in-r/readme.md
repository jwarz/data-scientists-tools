Exploratory Data Analysis in R
================
Joschka Schwarz

-   [1. Exploring Categorical Data](#1-exploring-categorical-data)
    -   [Exploring categorical data](#exploring-categorical-data)
    -   [Intro Bar charts](#intro-bar-charts)
    -   [table() / tabyl(): Contingency
        tables](#table--tabyl-contingency-tables)
    -   [droplevels() / fct_drop(): Dropping
        levels](#droplevels--fct_drop-dropping-levels)
    -   [Contingency table vs. side-by-side
        barcharts](#contingency-table-vs-side-by-side-barcharts)
    -   [prop.table() / tabyl(): Conditional
        proportions](#proptable--tabyl-conditional-proportions)
    -   [Barcharts: Counts
        vs. proportions](#barcharts-counts-vs-proportions)
    -   [Distribution of one variable](#distribution-of-one-variable)
    -   [fct_relevel() / fct_infreq(): Order
        Barcharts](#fct_relevel--fct_infreq-order-barcharts)
    -   [facet_wrap(): Conditional
        barchart](#facet_wrap-conditional-barchart)
-   [2. Exploring Numerical Data](#2-exploring-numerical-data)
    -   [Exploring numerical data](#exploring-numerical-data)
    -   [facet_wrap(): Faceted histogram](#facet_wrap-faceted-histogram)
    -   [geom_boxplot() & geom_density(): Boxplots and density
        plots](#geom_boxplot--geom_density-boxplots-and-density-plots)
    -   [Distribution of one variable](#distribution-of-one-variable-1)
    -   [geom_histogram(): Marginal and conditional
        histograms](#geom_histogram-marginal-and-conditional-histograms)
    -   [geom_histogram(): Binwidths](#geom_histogram-binwidths)
    -   [Box plots](#box-plots)
    -   [geom_boxplot(): Box plots for
        outliers](#geom_boxplot-box-plots-for-outliers)
    -   [geom_boxplot() vs. geom_density(): Plot
        selection](#geom_boxplot-vs-geom_density-plot-selection)
    -   [Visualization in higher
        dimensions](#visualization-in-higher-dimensions)
    -   [facet_grid(): 3 variable plot](#facet_grid-3-variable-plot)
-   [3. Numerical Summaries](#3-numerical-summaries)
    -   [Measures of center](#measures-of-center)
    -   [Choice of center measure](#choice-of-center-measure)
    -   [summarize(): Calculate center
        measures](#summarize-calculate-center-measures)
    -   [Measures of variability](#measures-of-variability)
    -   [Choice of spread measure](#choice-of-spread-measure)
    -   [sd(), IQR(), n(): Calculate spread
        measures](#sd-iqr-n-calculate-spread-measures)
    -   [Choose measures for center and
        spread](#choose-measures-for-center-and-spread)
    -   [Distribution shapes](#distribution-shapes)
    -   [Shape and transformations](#shape-and-transformations)
    -   [log(): Transformations](#log-transformations)
    -   [Outliers](#outliers)
    -   [Identify outliers](#identify-outliers)
-   [4. Case Study: Spam Emails](#4-case-study-spam-emails)
    -   [Introducing the data](#introducing-the-data)
    -   [Check-in 1](#check-in-1)
    -   [Check-in 2](#check-in-2)
    -   [Conclusion](#conclusion)

**Short Description**

Learn how to use graphical and numerical techniques for exploratory data
analysis while generating insightful and beautiful graphics in R.

**Long Description**

When your dataset is represented as a table or a database, it’s
difficult to observe much about it beyond its size and the types of
variables it contains. In this course, you’ll learn how to use graphical
and numerical techniques to begin uncovering the structure of your data.
Which variables suggest interesting relationships? Which observations
are unusual? By the end of the course, you’ll be able to answer these
questions and more, while generating graphics that are both insightful
and beautiful.

# 1. Exploring Categorical Data

In this section, you will learn how to create graphical and numerical
summaries of two categorical variables.

## Exploring categorical data

Theory. Coming soon …

**1. Exploring categorical data**

Hi, I’m Andrew Bray. I’m an Assistant Professor of Statistics at Reed
College and I’ll be your instructor for this course on Exploratory Data
Analysis or EDA.In this course, you’ll be exploring data from a wide
range of contexts. The first dataset comes from comic books.

**2. Comics dataset**

Two publishers, Marvel and DC, have created a host of superheroes that
have made their way into popular culture. You’re probably familiar with
Batman and Spiderman, but what about Mor the Mighty?The comics dataset
has information on all comic characters that have been introduced by DC
and Marvel. If we type the name of the dataset at the console, we get
the first few rows and columns. Here we see that each row, or case, is a
different character and each column, or variable, is a different
observation made on that character. At the top it tell us the dimensions
of this dataset: over 23,000 cases and 11 variables. Right under the
variable names, it tells us that all three of these are factors, R’s
preferred way to represent categorical variables. The first case is
Peter Parker, alias: Spiderman. The second column shows that his
personal identity is kept secret and the third column tell us that his
alignment is good; that he’s a superhero, not a super villain. At the
bottom we see that there are 8 additional variables that aren’t shown
here, including eye color and hair color, almost all of which are also
factors.We can learn the different levels of a particular factor by
using the levels function.

**3. Working with factors**

It’s clear that the alignment variable can be “good” or “neutral”, but
what other values are possible? If we run levels on the align column, we
learn that there are in fact four possible alignments, including
reformed criminal. I’m glad we checked that! If we do the same for
identity, we learn that there are five possible identities.A common way
to represent the number of cases that fall into each combination of
levels of two categorical variables, like these, is with a contingency
table. In R, this is done with the table command, which takes as
arguments the variables that you’re interested in. The output tells us
that the most common category, at a count of 4493, was bad characters
with secret identities.While tables of counts can be useful, you can get
the bigger picture by translating these counts into a graphic.

**4. Insert title here…**

The graphics that you’ll be making in this course utilize the ggplot2
package, which you got a glimpse of in the previous course. Every ggplot
requires that you specify three elements: the dataset, the variables
that you’re interested in, then layers to describe how those variables
are plotted.The dataset is the first argument in the ggplot function.
The variables are usually found inside the the aes function, which
stands for aesthetics. We’re interested in the relationship between two
categorical variables, which is represented well by a stacked bar chart.

**5. Insert title here…**

So we can specify that the want the id on the x axis, then the fill in
each segment of the bar to be colored by alignment. Finally, we add the
geometry layer to specify that this is a bar chart.

**6. Bar chart**

Let’s look carefully at how this is constructed: each colored bar
segment actually corresponds to a count in our table, with the x axis
and the fill color indicating the category that we’re looking at.
Several things pop out, like the fact that there are very few characters
whose identities are unknown, but there are many where we don’t have
data; that’s what the NAs mean. The single largest bar segment
corresponds to the most common category: characters with secret
identities that are also bad. We can look across the identity types,
though, and realize that bad is not always the largest category. This
indicates that there is indeed an association between alignment and
identity.

**7. Let’s practice!**

That should be enough to get started. Now it’s your turn to start
exploring the data.

## Intro Bar charts

Suppose you’ve asked 30 people, some young, some old, what their
preferred flavor of pie is: apple or pumpkin. That data could be
summarized in a side-by-side barchart. Here are three possibilities for
how it might look.

``` r
# Load packages
library(ggplot2)

d1 <- readRDS("data/d1.rds")
d2 <- readRDS("data/d2.rds")
d3 <- readRDS("data/d3.rds")

p1 <- d1 |> 
  ggplot(aes(age, fill = flavor)) +
    geom_bar() +
    ggtitle("Plot 1")

p2 <- d2 |> 
  ggplot(aes(age, fill = flavor)) +
  geom_bar() +
    ggtitle("Plot 2")

p3 <- d3 |> 
  ggplot(aes(age, fill = flavor)) +
  geom_bar() +
    ggtitle("Plot 3")

library(patchwork)
p1 + p2 + p3
```

![](readme_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

> ## *Question*
>
> Which one of the barcharts shows no relationship between `age` and
> `flavor`? In other words, which shows that pie preference is the same
> for both young and old?<br> <br> ✅ Plot 1<br> ⬜ Plot 2<br> ⬜ Plot
> 2<br>

## table() / tabyl(): Contingency tables

**Data**

-   `comics`

In this section you’ll working with the `comics` dataset. This is a
collection of characteristics on all of the superheroes created by
Marvel and DC comics in the last 80 years.

Let’s start by creating a contingency table, which is a useful way to
represent the total counts of observations that fall into each
combination of the levels of categorical variables.

**Packages**

-   `readr`
-   `forcats`
-   `janitor`

**Steps**

The dataset has been loaded into your workspace as `comics`.

1.  Type the name of the dataset to look at the rows and columns of the
    dataset.

``` r
# Load packages
library(readr)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(forcats)

# Read all columns as factors
comics <- read_csv("data/comics.csv", col_types = cols(.default = "f")) |> 
  
            # Convert "NA" levels to real missing values
            mutate(across(where(is.factor), fct_recode, NULL = "NA")) |> 
  
            # Relevel columns
            mutate(align  = align  |> fct_relevel(levels = "Bad", "Good", "Neutral")) |> 
            mutate(gender = gender |> fct_relevel(levels = "Female", "Male", "Other"))

# Print the first rows of the data
comics
```

    ## # A tibble: 23,272 × 11
    ##    name     id     align eye   hair  gender gsm   alive appearances first_appear
    ##    <fct>    <fct>  <fct> <fct> <fct> <fct>  <fct> <fct> <fct>       <fct>       
    ##  1 "Spider… Secret Good  Haze… Brow… Male   <NA>  Livi… 4043        Aug-62      
    ##  2 "Captai… Public Good  Blue… Whit… Male   <NA>  Livi… 3360        Mar-41      
    ##  3 "Wolver… Public Neut… Blue… Blac… Male   <NA>  Livi… 3061        Oct-74      
    ##  4 "Iron M… Public Good  Blue… Blac… Male   <NA>  Livi… 2961        Mar-63      
    ##  5 "Thor (… No Du… Good  Blue… Blon… Male   <NA>  Livi… 2258        Nov-50      
    ##  6 "Benjam… Public Good  Blue… No H… Male   <NA>  Livi… 2255        Nov-61      
    ##  7 "Reed R… Public Good  Brow… Brow… Male   <NA>  Livi… 2072        Nov-61      
    ##  8 "Hulk (… Public Good  Brow… Brow… Male   <NA>  Livi… 2017        May-62      
    ##  9 "Scott … Public Neut… Brow… Brow… Male   <NA>  Livi… 1955        Sep-63      
    ## 10 "Jonath… Public Good  Blue… Blon… Male   <NA>  Livi… 1934        Nov-61      
    ## # … with 23,262 more rows, and 1 more variable: publisher <fct>

2.  View the `levels()` that the `align` variable can take.

``` r
# Check levels of align
levels(comics$align)
```

    ## [1] "Bad"                "Good"               "Neutral"           
    ## [4] "Reformed Criminals"

3.  View the `levels()` that the `gender` variable can take.

``` r
# Check the levels of gender
levels(comics$gender)
```

    ## [1] "Female" "Male"   "Other"

4.  Create a contingency table of the same two variables.

``` r
# Create a 2-way contingency table
tab <- table(comics$align, comics$gender)
tab
```

    ##                     
    ##                      Female Male Other
    ##   Bad                  1573 7561    32
    ##   Good                 2490 4809    17
    ##   Neutral               836 1799    17
    ##   Reformed Criminals      1    2     0

NA are displayed per default with the `tabyl()` function from the
`janitor` package.

``` r
comics |> 
  janitor::tabyl(align, gender)
```

    ##               align Female Male Other NA_
    ##                 Bad   1573 7561    32 449
    ##                Good   2490 4809    17 152
    ##             Neutral    836 1799    17 121
    ##  Reformed Criminals      1    2     0   0
    ##                <NA>    904 2250     2 257

``` r
# Identical to
# table(comics$align, comics$gender, useNA = "always")
```

## droplevels() / fct_drop(): Dropping levels

The contingency table from the last exercise revealed that there are
some levels that have very low counts. To simplify the analysis, it
often helps to drop such levels.

In R, this requires two steps: first filtering out any rows with the
levels that have very low counts, then removing these levels from the
factor variable with `droplevels()`. This is because the `droplevels()`
function would keep levels that have just 1 or 2 counts; it only drops
levels that don’t exist in a dataset.

**Steps**

1.1 Use `filter()` to filter out all rows of `comics` with that level,
then drop the unused level with `droplevels()`. Save the simplified
dataset as `comics_filtered`. 1.2 Alternatively, this can be done with
the `forcats` package and the `fct_drop()` function.

**Solution:**

``` r
# 1.1 Base r: Remove align level
comics_filtered <- comics %>%
  filter(align != "Reformed Criminals") %>%
  droplevels()

# 1.2 forcats: Remove align level
# comics_filtered <- comics %>%
#   filter(align != "Reformed Criminals") |> 
#   mutate(across(where(is.factor), fct_drop))

# See the result
comics_filtered
```

    ## # A tibble: 19,856 × 11
    ##    name     id     align eye   hair  gender gsm   alive appearances first_appear
    ##    <fct>    <fct>  <fct> <fct> <fct> <fct>  <fct> <fct> <fct>       <fct>       
    ##  1 "Spider… Secret Good  Haze… Brow… Male   <NA>  Livi… 4043        Aug-62      
    ##  2 "Captai… Public Good  Blue… Whit… Male   <NA>  Livi… 3360        Mar-41      
    ##  3 "Wolver… Public Neut… Blue… Blac… Male   <NA>  Livi… 3061        Oct-74      
    ##  4 "Iron M… Public Good  Blue… Blac… Male   <NA>  Livi… 2961        Mar-63      
    ##  5 "Thor (… No Du… Good  Blue… Blon… Male   <NA>  Livi… 2258        Nov-50      
    ##  6 "Benjam… Public Good  Blue… No H… Male   <NA>  Livi… 2255        Nov-61      
    ##  7 "Reed R… Public Good  Brow… Brow… Male   <NA>  Livi… 2072        Nov-61      
    ##  8 "Hulk (… Public Good  Brow… Brow… Male   <NA>  Livi… 2017        May-62      
    ##  9 "Scott … Public Neut… Brow… Brow… Male   <NA>  Livi… 1955        Sep-63      
    ## 10 "Jonath… Public Good  Blue… Blon… Male   <NA>  Livi… 1934        Nov-61      
    ## # … with 19,846 more rows, and 1 more variable: publisher <fct>

## Contingency table vs. side-by-side barcharts

While a contingency table represents the counts numerically, it’s often
more useful to represent them graphically.

**Steps**

Here you’ll construct two side-by-side barcharts of the `comics` data.
This shows that there can often be two or more options for presenting
the same data. Passing the argument `position = "dodge"` to `geom_bar()`
says that you want a side-by-side (i.e. not stacked) barchart.

1.  Create a side-by-side barchart with `align` on the x-axis and
    `gender` as the `fill` aesthetic.

``` r
# Create side-by-side barchart of gender by alignment
ggplot(comics_filtered, aes(x = align, fill = gender)) + 
  geom_bar(position = "dodge")
```

![](readme_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

2.  Create another side-by-side barchart with `gender` on the x-axis and
    `align` as the `fill` aesthetic. Rotate the axis labels 90 degrees
    to help readability.

``` r
# Create side-by-side barchart of alignment by gender
ggplot(comics_filtered, aes(x = gender, fill = align)) + 
  geom_bar(position = "dodge") +
  theme(axis.text.x = element_text(angle = 90))
```

![](readme_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->

> ## *Question*
>
> Which of the following interpretations of the bar charts to your right
> is **not** valid?<br> <br> ⬜ Among characters with “Neutral”
> alignment, males are the most common.<br> ⬜ In general, there is an
> association between gender and alignment.<br> ✅ Across all genders,
> “Bad” is the most common alignment.<br> ⬜ There are more male
> characters than female characters in this dataset.<br>

**1. Counts vs. proportions**

You may have noticed in the last exercises that sometimes raw counts of
cases can be useful, but often it’s the proportions that are more
interesting. We can do our best to compute these proportions in our head
or we could do it explicitly.

**2. From counts to proportions**

Let’s return to our table of counts of cases by identity and alignment.
If we wanted to instead get a sense of the proportion of all cases that
fell into each category, we can take the original table of counts, saved
as tab underscore cnt, and provide it as input to the prop dot table
function. We see here that the single largest category are characters
that are bad and secret at about 29% of characters. Also note that
because these are all proportions out of the whole dataset, the sum of
all of these proportions is 1.

**3. Conditional proportions**

If we’re curious about systematic associations between variables, we
should look to conditional proportions. An example of a conditional
proportion is the proportion of public identity characters that are
good. To build a table of these conditional proportions, add a 1 as the
second argument, specifying that you’d like to condition on the rows. We
see here that around 57% of all secret characters are bad. Because we’re
conditioning on identity, it’s every row that now sums to one. To
condition on the columns instead, change that argument to 2. Now it’s
the columns that sum to one and we learn, for example, that the
proportion of bad characters that are secret is around 63%. As the
number of cells in these tables gets large, it becomes much easier to
make sense of your data using graphics. The bar chart is still a good
choice, but we’re going to need to add some options.

**4. Insert title here…**

Here is the code for the bar chart based on counts. We want to condition
on whatever is on the x axis and stretch those bars to each add up to a
total proportion of 1,

**5. Insert title here…**

so we add the position equals fill option to the geom bar function.
Let’s add one additional layer:

**6. Insert title here…**

a change to our y axis to indicate we’re looking at proportions.

**7. Conditional bar chart**

When we run this code at the console, we get a plot that reflects our
table of proportions after we had conditioned on id.

**8. Conditional bar chart**

While the proportion of secret characters that are bad is still large,
it’s actually less than

**9. Conditional bar chart**

the proportion of bad characters in those that are listed as unknown. We
get a very different picture if we condition instead on alignment.

**10. Conditional bar chart**

The only change needed in the code is to swap the positions of the names
of the variables. This results in a plot where we’ve conditioned on
alignment and we learn that within characters that are bad,

**11. Conditional bar chart**

the greatest proportion of those are indeed secret. This might seem
paradoxical, but it’s just a result of having different numbers of cases
in each single level.

## prop.table() / tabyl(): Conditional proportions

The following code generates tables of joint and conditional
proportions, respectively:

*base r*

``` r
tab <- table(comics_filtered$align, comics_filtered$gender)
options(scipen = 999, digits = 3) # Print fewer digits
prop.table(tab)     # Joint proportions
```

    ##          
    ##             Female     Male    Other
    ##   Bad     0.082210 0.395160 0.001672
    ##   Good    0.130135 0.251333 0.000888
    ##   Neutral 0.043692 0.094021 0.000888

``` r
prop.table(tab, 2)  # Conditional on columns
```

    ##          
    ##           Female  Male Other
    ##   Bad      0.321 0.534 0.485
    ##   Good     0.508 0.339 0.258
    ##   Neutral  0.171 0.127 0.258

*janitor*

``` r
# Load packages
library(janitor)
```

    ## 
    ## Attaching package: 'janitor'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     chisq.test, fisher.test

``` r
comics_filtered |> 
  tabyl(align, gender) |> 
  
  # Conditional on columns
  adorn_percentages("col") |> 
  # Format
  adorn_pct_formatting(digits = 0) #|> 
```

    ##    align Female Male Other NA_
    ##      Bad    32%  53%   48% 62%
    ##     Good    51%  34%   26% 21%
    ##  Neutral    17%  13%   26% 17%

``` r
  # Add back the underlying Ns
  # adorn_ns()
```

> ## *Question*
>
> Approximately what proportion of all female characters are good?<br>
> <br> ⬜ 44%<br> ⬜ 1.3%<br> ⬜ 13%<br> ✅ 51%<br>

Nice! To answer this question, you needed to look at how align was
distributed within each gender. That is, you wanted to condition on the
gender variable.

## Barcharts: Counts vs. proportions

Bar charts can tell dramatically different stories depending on whether
they represent counts or proportions and, if proportions, what the
proportions are conditioned on. To demonstrate this difference, you’ll
construct two barcharts in this section: one of counts and one of
proportions.

**Steps**

1.  Create a stacked barchart of `gender` *counts* with `align` on the
    x-axis.

``` r
# Plot of gender by align
comics_filtered |> 
  
  # Reorder levels corresponding to count
  ggplot(aes(x = align, fill = gender)) +
    geom_bar()
```

![](readme_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

2.  Create a stacked barchart of `gender` *proportions* with `align` on
    the x-axis by setting the `position` argument to `geom_bar()` equal
    to `"fill"`.

``` r
# Plot proportion of gender, conditional on align
comics_filtered |> 
  
  # Reorder levels corresponding to count
  ggplot(aes(x = align, fill = gender)) + 
  geom_bar(position = "fill") +
  ylab("proportion")
```

![](readme_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

Excellent work! By adding `position = "fill"` to `geom_bar()`, you are
saying you want the bars to fill the entire height of the plotting
window, thus displaying proportions and not raw counts.

## Distribution of one variable

Theory. Coming soon …

**1. Distribution of one variable**

You might not have noticed, but already you’ve been creating plots that
illustrate the relationship between two variables in your dataset. It’s
a bit unusual to lead with this, but it gets you thinking early about
the multivariate structure that is found in most real datasets. Now,
let’s zoom in on working with just a single variable.

**2. Marginal distribution**

To compute a table of counts for a single variable like id, just provide
vector into into the table function by the sole argument. One way to
think of what we’ve done is to take the original two-way table and then,
sum the cells across each level of align. Since we’ve summed over the
margins of the other variables, this is sometimes known as a marginal
distribution.

**3. Simple barchart**

The syntax to create the simple bar chart is straightforward as well,
just remove the fill equals align argument.

**4. Faceting**

Another useful way to form the distribution of a single variable is to
condition on a particular value of another variable. We might be
interested, for example, in the distribution of id for all neutral
characters. We could either filter the dataset and build a barchart
using only cases where alignment was neutral, or we could use a
technique called faceting. Faceting breaks the data into subsets based
on the levels of a categorical variable and then constructs a plot for
each.

**5. Faceted barcharts**

To implement this in ggplot2, we just need to add a faceting layer: the
facet wrap function, then a tilde, which can be read as “broken down by”
and then our variable “align”. The result is three simple bar charts
side-by-side, the first one corresponding to the distribution of id
within all cases that have a bad alignment, and so on, for good and
neutral alignments.If this plot feels familiar, it should.

**6. Faceting vs. stacking**

In essence, it’s a rearrangement of the stacked bar charts that we
considered at the beginning of the chapter.

**7. Faceting vs. stacking**

Each facet in the plot on the left corresponds to a single stacked bar
in the plot on the right. They allow you to get a sense the distribution
of a single variable,

**8. Faceting vs. stacking**

by looking at a single facet or a single stacked bar or

**9. Faceting vs. stacking**

the association between the variables, by looking across facets or
across stacked bars.

**10. Faceting vs. stacking**

A discussion of plots for categorical data wouldn’t be complete without
some mention of the pie chart.

**11. Pie chart vs. bar chart**

The pie chart is a common way to display categorical data where the size
of the slice corresponds to the proportion of cases that are in that
level. Here is a pie chart for the identity variable and it looks
pleasing enough. The problem with pie charts, though, is that it can be
difficult to assess the relative size of the slices. Here, is the green
public slice or the grey NA slice bigger?

**12. Pie chart vs. bar chart**

If we represent this data using a barchart the answer is obvious:

**13. Pie chart vs. bar chart**

the proportion of public is greater. For that reason, it’s generally a
good idea to stick to barcharts.

**14. Let’s practice!**

Ok, now it’s your turn to practice with simple barcharts and faceting.

## fct_relevel() / fct_infreq(): Order Barcharts

### fct_relevel()

If you are interested in the distribution of alignment of *all*
superheroes, it makes sense to construct a barchart for just that single
variable.

You can improve the interpretability of the plot, though, by
implementing some sensible ordering. Superheroes that are `"Neutral"`
show an alignment between `"Good"` and `"Bad"`, so it makes sense to put
that bar in the middle.

**Steps**

1.  Reorder the levels of `align` using the
    <a href="https://www.rdocumentation.org/packages/base/topics/factor" target="_blank" rel="noopener noreferrer">`factor()`</a>
    or
    <a href="https://forcats.tidyverse.org/reference/fct_relevel.html" target="_blank" rel="noopener noreferrer">`fct_relevel()`</a>
    function so that printing them reads `"Bad"`, `"Neutral"`, then
    `"Good"`.
2.  Create a barchart of counts of the `align` variable.

*base r*

``` r
# 1. Change the order of the levels in align
comics_filtered$align <- factor(comics_filtered$align, 
                                levels = c("Bad", "Neutral", "Good"))

# 2. Create plot of align
ggplot(comics_filtered, aes(x = align)) + 
  geom_bar()
```

*forcats*

``` r
# 1. Change the order of the levels in align
comics_releveled <- comics_filtered |> 
  mutate(align = align |> fct_relevel(levels = "Bad", "Neutral", "Good"))

# 2. Create plot of align
comics_releveled |> 
  ggplot(aes(x = align)) + 
    geom_bar()
```

![](readme_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

### fct_infreq()

The piechart is a very common way to represent the distribution of a
single categorical variable, but they can be more difficult to interpret
than barcharts.

``` r
pies <- readRDS("data/pies.rds")
pies |> 
  count(flavor) |> 
  ggplot(aes(x="", y=n, fill=flavor)) +
    geom_bar(stat="identity", width=1, color="white") +
    coord_polar("y", start=0) +
    theme_void()
```

![](readme_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

This is a piechart of a dataset called `pies` that contains the favorite
pie flavors of 98 people. Improve the representation of these data by
constructing a *barchart* that is ordered in descending order of count.

**Data**

-   `pies`

**Steps**

1.  Use the code provided to reorder the levels of `flavor` so that
    they’re in descending order by count.
2.  Create a barchart of `flavor` and orient the labels vertically so
    that they’re easier to read. The default coloring may look drab by
    comparison, so change the `fill` of the bars to `"chartreuse"`.

*base r*

``` r
# Put levels of flavor in descending order
# lev <- c("apple", "key lime", "boston creme", "blueberry", "cherry", "pumpkin", "strawberry")
# pies$flavor <- factor(pies$flavor, levels = lev)
```

*forcats*

``` r
# Put levels of flavor in descending order
pies |> 
  mutate(flavor = flavor |> fct_infreq()) |> 

# Create barchart of flavor
ggplot(aes(x = flavor)) + 
  geom_bar(fill = "chartreuse") + 
  theme(axis.text.x = element_text(angle = 90))
```

![](readme_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

## facet_wrap(): Conditional barchart

Now, if you want to break down the distribution of alignment based on
gender, you’re looking for conditional distributions.

You could make these by creating multiple filtered datasets (one for
each gender) or by faceting the plot of alignment based on gender.

**Steps**

1.  Create a barchart of `align` faceted by `gender`.

``` r
# Plot of alignment broken down by gender
comics_releveled |> 

ggplot(aes(x = align)) + 
  geom_bar() +
  facet_wrap(~ gender)
```

![](readme_files/figure-gfm/unnamed-chunk-19-1.png)<!-- -->

# 2. Exploring Numerical Data

In this section, you will learn how to graphically summarize numerical
data.

## Exploring numerical data

Theory. Coming soon …

**1. Exploring numerical data**

In this chapter, we’ll broaden our tool box of exploratory techniques to
encompass numerical data. Numerical data are data that take the form of
number, but where those numbers actually represent a value on the number
line.The dataset that we’ll be working with is one that has information
on the cars that were for sale in the US in a certain year.

**2. Cars dataset**

We can use the structure function, s-t-r, to learn more about each of
the variables. We learn that we have 428 observations, or cases, and 19
variables. Unlike most displays of data, the structure function puts
each of the variables as a row, with its name followed by its data type,
followed by the first several values.The car names are character
strings, which are like factors, except its common for every case to
take a unique value. L-o-g-i, that’s for logical variables, another
simple case of a categorical variable where there are only two levels.
For example, each car will take either TRUE or FALSE depending on if it
is a sports car. We can see that the last set of variables are all
either i-n-t for integer or n-u-m for numerical. They’re actually both
numerical variables, but the integers are discrete and the numerical is
continuous. If you look at ncyl, that’s the number of cylinders, it’s
listed as an integer, but there are only a few different values that it
can take, so it actually behaves a bit like categorical variable.Let’s
construct some plots to help us explore this data.

**3. Dotplot**

The most direct way to represent numerical data is with a dot plot,
where each case is a dot that’s placed at it’s appropriate value on the
x axis, then stacked as other cases take similar values. This is a form
of graphic where there is zero information loss; you could actually
rebuild the dataset perfectly if you were given this plot. As you can
imagine, though, these plots start to get difficult to read as the
number of cases gets very large.

**4. Histogram**

One of the most common plots to use is a histogram, which solves this
problem by aggregating the dots into bins on the x axis, then mapping
the height of the bar to the number of cases that fall into that bin.
Because of the binning, it’s not possible to perfectly reconstruct the
dataset: what we gain is a bigger picture of the shape of the
distribution.If the stepwise nature of the histogram irks you, then
you’ll like the density plot.

**5. Density plot**

The density plot represents the shape of the histogram using a smooth
line. This provides an ever bigger picture representation of the shape
of the distribution, so you’ll only want to use it when you have a large
number of cases.If you’d prefer a more abstracted sense of this
distribution, we could identify the center of the distribution,

**6. Density plot**

the values that mark off the middle half of the data,

**7. Density plot**

and the values that mark off the vast majority of the data.

**8. Boxplot**

These values can be used to construct a boxplot,

**9. Boxplot**

where the box represents the central bulk of the data,

**10. Boxplot**

the whiskers contain almost all the data,

**11. Boxplot**

and the extreme values are represented as points. You’ll see the syntax
for this is a bit different: we’ll discuss why later on in the chapter.

**12. Faceted histogram**

Let’s use a histogram to look at the distribution of highway mileage
faceted based on whether or not the car is a pickup truck by adding a
facet wrap layer. It gives us a message, letting us know that it has
picked a binwidth for us and a warning that there were 14 missing
values. The plot that it provides is informative: it’s clear that are
many more non-pickups than pickups.

**13. Faceted histogram**

It also shows that the typical pickup gets much lower mileage than the
typical non-pickup.

**14. Faceted histogram**

We also see that non-pickups have more variability than do the pickups.

**15. Let’s practice!**

Keep an eye on these two components: a typical observation and the
variability of a distribution as you practice exploring this numerical
data.

## facet_wrap(): Faceted histogram

**Data**

-   `cars`

In this section, you’ll be working with the `cars` dataset, which
records characteristics on all of the new models of cars for sale in the
US in a certain year.

You will investigate the distribution of mileage across a categorical
variable, but before you get there, you’ll want to familiarize yourself
with the dataset.

**Steps**

1.  View the size of the data and the variable types using `str()`.

``` r
cars <- read_csv("data/cars.csv", col_types = cols(name = col_factor()))

# Learn data structure
str(cars)
```

    ## spec_tbl_df [428 × 19] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ name       : Factor w/ 425 levels "Chevrolet Aveo 4dr",..: 1 2 3 4 5 6 7 8 9 10 ...
    ##  $ sports_car : logi [1:428] FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ suv        : logi [1:428] FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ wagon      : logi [1:428] FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ minivan    : logi [1:428] FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ pickup     : logi [1:428] FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ all_wheel  : logi [1:428] FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ rear_wheel : logi [1:428] FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ msrp       : num [1:428] 11690 12585 14610 14810 16385 ...
    ##  $ dealer_cost: num [1:428] 10965 11802 13697 13884 15357 ...
    ##  $ eng_size   : num [1:428] 1.6 1.6 2.2 2.2 2.2 2 2 2 2 2 ...
    ##  $ ncyl       : num [1:428] 4 4 4 4 4 4 4 4 4 4 ...
    ##  $ horsepwr   : num [1:428] 103 103 140 140 140 132 132 130 110 130 ...
    ##  $ city_mpg   : num [1:428] 28 28 26 26 26 29 29 26 27 26 ...
    ##  $ hwy_mpg    : num [1:428] 34 34 37 37 37 36 36 33 36 33 ...
    ##  $ weight     : num [1:428] 2370 2348 2617 2676 2617 ...
    ##  $ wheel_base : num [1:428] 98 98 104 104 104 105 105 103 103 103 ...
    ##  $ length     : num [1:428] 167 153 183 183 183 174 174 168 168 168 ...
    ##  $ width      : num [1:428] 66 66 69 68 69 67 67 67 67 67 ...
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   name = col_factor(levels = NULL, ordered = FALSE, include_na = FALSE),
    ##   ..   sports_car = col_logical(),
    ##   ..   suv = col_logical(),
    ##   ..   wagon = col_logical(),
    ##   ..   minivan = col_logical(),
    ##   ..   pickup = col_logical(),
    ##   ..   all_wheel = col_logical(),
    ##   ..   rear_wheel = col_logical(),
    ##   ..   msrp = col_double(),
    ##   ..   dealer_cost = col_double(),
    ##   ..   eng_size = col_double(),
    ##   ..   ncyl = col_double(),
    ##   ..   horsepwr = col_double(),
    ##   ..   city_mpg = col_double(),
    ##   ..   hwy_mpg = col_double(),
    ##   ..   weight = col_double(),
    ##   ..   wheel_base = col_double(),
    ##   ..   length = col_double(),
    ##   ..   width = col_double()
    ##   .. )
    ##  - attr(*, "problems")=<externalptr>

2.  Plot a histogram of `city_mpg` faceted by `suv`, a logical variable
    indicating whether the car is an SUV or not.

``` r
# Create faceted histogram
ggplot(cars, aes(x = city_mpg)) +
  geom_histogram() +
  facet_wrap(~ suv)
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

    ## Warning: Removed 14 rows containing non-finite values (stat_bin).

![](readme_files/figure-gfm/unnamed-chunk-21-1.png)<!-- -->

In this step, you faceted by the `suv` variable, but it’s important to
note that you can facet a plot by any categorical variable using
`facet_wrap()`.

## geom_boxplot() & geom_density(): Boxplots and density plots

The mileage of a car tends to be associated with the size of its engine
(as measured by the number of cylinders). To explore the relationship
between these two variables, you could stick to using histograms, but in
this exercise you’ll try your hand at two alternatives:

-   box plot
-   density plot.

**Steps**

A quick look at `unique(cars$ncyl)` shows that there are more possible
levels of `ncyl` than you might think. Here, restrict your attention to
the most common levels.

1.  Filter `cars` to include only cars with 4, 6, or 8 cylinders and
    save the result as `common_cyl`. The `%in%` operator may prove
    useful here.
2.  Create side-by-side box plots of `city_mpg` separated out by `ncyl`.

``` r
# 1. Filter cars with 4, 6, 8 cylinders
common_cyl <- cars |> 
                filter(ncyl %in% c(4,6,8))

# 2. Create box plots of city mpg by ncyl
common_cyl |> 
  ggplot(aes(x = as.factor(ncyl), y = city_mpg)) +
    geom_boxplot()
```

    ## Warning: Removed 11 rows containing non-finite values (stat_boxplot).

![](readme_files/figure-gfm/unnamed-chunk-22-1.png)<!-- -->

3.  Create overlaid density plots of `city_mpg` colored by `ncyl`.

``` r
# 3. Create overlaid density plots for same data
common_cyl |> 
  ggplot(aes(x = city_mpg, fill = as.factor(ncyl))) +
    geom_density(alpha = .3)
```

    ## Warning: Removed 11 rows containing non-finite values (stat_density).

![](readme_files/figure-gfm/unnamed-chunk-23-1.png)<!-- -->

> ## *Question*
>
> Which of the following interpretations of the plot **is not**
> valid?<br> <br> ⬜ The highest mileage cars have 4 cylinders.<br> ⬜
> The typical 4 cylinder car gets better mileage than the typical 6
> cylinder car, which gets better mileage than the typical 8 cylinder
> car.<br> ⬜ Most of the 4 cylinder cars get better mileage than even
> the most efficient 8 cylinder cars.<br> ✅ The variability in mileage
> of 8 cylinder cars is similar to the variability in mileage of 4
> cylinder cars.<br>

The variability in mileage of 8 cylinder cars seem much smaller than
that of 4 cylinder cars.

## Distribution of one variable

Theory. Coming soon …

**1. Distribution of one variable**

If you’re interested in the distribution of just a single numerical
variable, there are three ways you can get there. The first is to look
at the marginal distribution, like,

**2. Marginal vs. conditional**

for example, the simple distribution of highway mileage. If we want to
look at the distribution on a different subset of the data,

**3. Marginal vs. conditional**

say cars that are pickup trucks, we can add a facet wrap layer to see
the distribution for both pickups and non-pickups.

**4. Building a data pipeline**

There’s another scenario, though, in which we’d want to look at the
distribution of this variable on a more specific subset of the data, say
the cars which have engines less than 2 (point) 0 liters in size. Since
engine size is numerical, it won’t work to simply use facets. Instead,
we have to filter. Filter is a function in the dplyr package used to
keep only the rows that meet a particular condition. In this case, we
want the rows where the engine size variable is less than 2 (point) 0.
Notice that we’re using the pipe operator, which takes the output of
whatever is before it, and pipes it as input into the next function.
Then we save this filtered dataset into a new dataset called cars2. The
second step is then to construct the plot using this new dataset.This
construction is a bit inefficient though, since we save this
intermediate dataset, cars2, which we’re not really interested in.

**5. Building a data pipeline**

We can solve this by linking this two components into a continuous data
pipeline. We start with the raw data, which we pipe into the filter, the
result of which gets piped into the ggplot function, which then adds a
layer to complete the plot. This is a powerful and very general
paradigm: you can start with a raw dataset, process that dataset using
dplyr linked by pipes, then visualize it by adding up layers of a
ggplot.

**6. Filtered and faceted histogram**

Let’s run that code in the console. The resulting plot makes some sense.
These are cars with small engines that we’re looking at and small
engines are usually more efficient, so we’re seeing higher mileages than
when we looked at the whole dataset.One thing that’s important to know
about histograms like this one is that your sense of the shape of the
distribution can change depending on the bin width that is selected.

**7. Wide bin width**

ggplot2 does its best to select a sensible bin width, but you can
override that option by specifying it yourself. If we use a binwidth of
5, the result is a histogram that’s much smoother.The same principle
holds for density plots.

**8. Density plot**

Let’s pull up a density plot for the same data. It looks reasonably
smooth, but if we wanted to make it smoother, we can increase what’s
known as the bandwidth of plot.

**9. Wide bandwidth**

When we increase that to 5, we get a plot that smooths over the blip on
the right side a bit more.But how do we decide what the “best” binwidth
or bandwidth is for our plots? Usually the defaults are sensible, but
it’s good practice to tinker with both smoother and less-smooth versions
of the plots to focus on different scales of structure in the data.

**10. Let’s practice!**

Let’s try putting these techniques into practice.

## geom_histogram(): Marginal and conditional histograms

Now, turn your attention to a new variable: `horsepwr`. The goal is to
get a sense of the marginal distribution of this variable and then
compare it to the distribution of horsepower conditional on the price of
the car being less than $25,000.

You’ll be making two plots using the “data pipeline” paradigm, where you
start with the raw data and end with the plot.

**Steps**

1.  Create a histogram of the distribution of `horsepwr` across all cars
    and add an appropriate title. Start by piping in the raw dataset.

``` r
# Create hist of horsepwr
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram() +
  ggtitle("hist horsepwr")
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](readme_files/figure-gfm/unnamed-chunk-24-1.png)<!-- -->

2.  Create a second histogram of the distribution of horsepower, but
    only for those cars that have an `msrp` less than $25,000. Keep the
    limits of the x-axis so that they’re similar to that of the first
    plot, and add a descriptive title.

``` r
# Create hist of horsepwr for affordable cars
cars %>% 
  filter(msrp < 25000) %>%
  ggplot(aes(horsepwr)) +
  geom_histogram() +
  xlim(c(90, 550)) +
  ggtitle("hist horsepwr < 25000 msrp")
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

    ## Warning: Removed 1 rows containing non-finite values (stat_bin).

    ## Warning: Removed 2 rows containing missing values (geom_bar).

![](readme_files/figure-gfm/unnamed-chunk-25-1.png)<!-- -->

> ## *Question*
>
> Observe the two histograms. Which of the following **is** a valid
> interpretation.<br> <br> ⬜ Cars with around 300 horsepower are more
> common than cars with around 200 horsepower.<br> ✅ The highest
> horsepower car in the less expensive range has just under 250
> horsepower.<br> ⬜ Most cars under $25,000 vary from roughly 100
> horsepower to roughly 350 horsepower.<br>

## geom_histogram(): Binwidths

Before you take these plots for granted, it’s a good idea to see how
things change when you alter the binwidth. The binwidth determines how
smooth your distribution will appear: the smaller the binwidth, the more
jagged your distribution becomes. It’s good practice to consider several
binwidths in order to detect different types of structure in your data.

**Steps**

Create the following three plots, adding a title to each to indicate the
binwidth used:

1.  A histogram of horsepower (i.e. `horsepwr`) with a `binwidth` of 3.

``` r
# Create hist of horsepwr with binwidth of 3
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram(binwidth = 3) +
  ggtitle("binwidth 3")
```

![](readme_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->

2.  A second histogram of horsepower with a `binwidth` of 30.

``` r
# Create hist of horsepwr with binwidth of 30
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram(binwidth = 30) +
  ggtitle("binwidth 30")
```

![](readme_files/figure-gfm/unnamed-chunk-27-1.png)<!-- -->

3.  A third histogram of horsepower with a `binwidth` of 60.

``` r
# Create hist of horsepwr with binwidth of 60
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram(binwidth = 60) +
  ggtitle("binwidth 60")
```

![](readme_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->

> ## *Question*
>
> What feature is present in Plot A that’s not found in B or C?<br> <br>
> ⬜ The most common horsepower is around 200.br\> ✅ There is a
> tendency for cars to have horsepower right at 200 or 300
> horsepower.br\> ⬜ There is a second mode around 300 horsepower.br\>

Plot A is the only histogram that shows the count for cars with exactly
200 and 300 horsepower.

## Box plots

Theory. Coming soon …

**1. Box plots**

By now you’ve had quite a bit of experience using box plots to visualize
the distribution of numerical data, but let’s dig deeper to understand
how exactly they are constructed by starting with a dot plot.

**2. Insert title here…**

The box plot is based around three summary statistics:

**3. Insert title here…**

the first quartile of the data,

**4. Insert title here…**

the second quartile,

**5. Insert title here…**

and the third quartile. You might be more familiar with the

**6. Insert title here…**

second quartile as the median, the value that’s in the middle of the
dataset. It’s the second quartile because two quarters, or half, of the
data is below it, and half is above it.

**7. Insert title here…**

The first quartile, then, has only one quarter of the data below it and

**8. Insert title here…**

the third quartile has three quarters of the data below it.

**9. Insert title here…**

These three numbers form the box in the box plot,

**10. Insert title here…**

with the median in the middle and the first and third quartiles as the
edges. One thing you always know when looking at a box plot is that the
middle half of the data is inside this box. There are various rules for
where to draw the whiskers, the lines that extend out from the box.

**11. Insert title here…**

The one used by ggplot2 is to draw it out 1 (point) 5 times the length
of the box, then draw it into the first observation that is encountered.
The particular rule is less important than the interpretation, which is
that the whiskers should encompass nearly all of the data.

**12. Insert title here…**

Any data that is not encompassed by either the box or the whiskers is
represented by a point. This is one of the handy features of a box plot:
it flags for you points that are far away from the bulk of the data, a
form of automated outlier detection.

**13. Insert title here…**

**14. Side-by-side box plots**

Let’s revisit the side-by-side box plots that you constructed in your
exercise. This shows the distribution of city mileage broken down by
cars that have 4 cylinders, 6 cylinders, and 8 cylinders. We can look to
the heavy line in the boxes and learn that that median mileage is
greatest for 4 cylinders and less for 6 cylinders. For 8 cylinder cars,
something odd is going on: the median is very close to the third
quartile.In terms of variability, the 4 cylinder cars again have the
widest box and whiskers that extend the farthest. The middle half of the
data in 6 cylinder cars spans a very small range of values, shown by the
narrow box. Finally we see some outliers: one 6 cylinder car with low
mileage and several 4 cylinder cars with high mileage.

**15. Side-by-side box plots**

If you’re wondering about that highest outlier in the 4 cylinder
category, that is indeed a hybrid vehicle.

**16. Side-by-side box plots**

Notice that in terms of syntax, ggplot actually expects you to be
plotting several box plots side-by-side. If you want to see just a
single one, you can just set the x argument to 1.Box plots really shine
in situations where you need to compare several distributions at once
and also as a means to detect outliers. One of their weaknesses though
is that they have no capacity to indicate when a distribution has more
than one hump or “mode”.

**17. Insert title here…**

Consider the density plot here, there are two distinct modes.

**18. Insert title here…**

If we construct a box plot of the same distribution, it sweeps this
important structure under the rug and will always only provide a single
box.

**19. Let’s practice!**

Now that you know a bit more about how box plots are constructed, it’s
time for you to construct some yourself.

## geom_boxplot(): Box plots for outliers

In addition to indicating the center and spread of a distribution, a box
plot provides a graphical means to detect outliers. You can apply this
method to the `msrp` column (manufacturer’s suggested retail price) to
detect if there are unusually expensive or cheap cars.

**Steps**

1.  Construct a box plot of `msrp`.

``` r
# Construct box plot of msrp
cars %>%
  ggplot(aes(x = 1, y = msrp)) +
  geom_boxplot()
```

![](readme_files/figure-gfm/unnamed-chunk-29-1.png)<!-- -->

2.  Exclude the largest 3-5 outliers by filtering the rows to retain
    cars less than $100,000. Save this reduced dataset as `cars_no_out`.
3.  Construct a similar box plot of `msrp` using this reduced dataset.
    Compare the two plots.

``` r
# Exclude outliers from data
cars_no_out <- cars %>%
                filter(msrp < 100000)

# Construct box plot of msrp using the reduced dataset
cars_no_out %>%
  ggplot(aes(x = 1, y = msrp)) +
  geom_boxplot()
```

![](readme_files/figure-gfm/unnamed-chunk-30-1.png)<!-- -->

## geom_boxplot() vs. geom_density(): Plot selection

Consider two other columns in the `cars` dataset: `city_mpg` and
`width`. Which is the most appropriate plot for displaying the important
features of their distributions? Remember, both density plots and box
plots display the central tendency and spread of the data, but the box
plot is more robust to outliers.

**Steps**

Use density plots or box plots to construct the following
visualizations. For each variable, try both plots and submit the one
that is better at capturing the important structure.

1.  Display the distribution of `city_mpg`.

``` r
# Create plot of city_mpg
cars %>%
  ggplot(aes(x = 1, y = city_mpg)) +
  geom_boxplot()
```

    ## Warning: Removed 14 rows containing non-finite values (stat_boxplot).

![](readme_files/figure-gfm/unnamed-chunk-31-1.png)<!-- -->

2.  Display the distribution of `width`.

``` r
# Create plot of width
cars %>% 
  ggplot(aes(x = width)) +
  geom_density()
```

    ## Warning: Removed 28 rows containing non-finite values (stat_density).

![](readme_files/figure-gfm/unnamed-chunk-32-1.png)<!-- -->

Because the `city_mpg` variable has a much wider range with its
outliers, it’s best to display its distribution as a box plot.

## Visualization in higher dimensions

Theory. Coming soon …

**1. Visualization in higher dimensions**

In this course, we’ve been encouraging you to think about the question
of “what is the association between this variable and that one” and “if
you condition on one level of this variable, how does the distribution
of another change”. The answers to these questions require multivariate
thinking and it is an essential skill in reasoning about the structure
of real data. But why stop at only two variables?

**2. Plots for 3 variables**

One simple extension that allows you to plot the association between
three variables is the facet grid. Let’s build a plot that can tell us
about msrp, the manufacturer’s suggested retail price. Since that
variable is numerical, there are several plots we could use. Let’s go
with a density plot. By adding a facet grid layer, we can break that
distribution down by two categorical variables, separated by a tilde.
Whichever variable you put before the tilde will go in the rows of the
grid and the the one that goes after will form the columns. When we run
this code, we get a grid of four density plots, one for every
combination of levels of the two categorical variables. Unfortunately,
this plot is difficult to interpret since it doesn’t remind us which
variable is on the rows versus columns. We can solve this by adding an
option to the facet grid layer:

**3. Plots for 3 variables**

labeller is equal to label both.OK, now we can learn something. If we
look at rear wheel drive pickups, there appear to actually be two modes,
but in general, they’re a bit cheaper than front wheel drive pickups. In
non-pickups, however, its the rear-wheel drive ones that are generally
pricier.

**4. Plots for 3 variables**

One thing we should check before moving on is the number of cases that
go into each of these 4 plots. If we form a contingency table of rear
wheel and pickup, we learn that there are relatively few rear wheel
drive cars in this dataset. While this would be plainly obvious had we
used histograms, density plots normalize each distribution so that they
have the same area. The take home message is that our interpretation is
still valid, but when we’re making comparisons across the rear wheel
variable, there are fewer cases to compare.

**5. Higher dimensional plots**

This is just the tip of the iceberg of high dimensional data graphics.
Anything you can discern visually, things like shape, size, color,
pattern, movement, in addition to relative location, can be mapped to a
variable and plotted alongside other variables.

**6. Let’s practice!**

Alright, now it’s your turn to practice.

## facet_grid(): 3 variable plot

Faceting is a valuable technique for looking at several conditional
distributions at the same time. If the faceted distributions are laid
out in a grid, you can consider the association between a variable and
two others, one on the rows of the grid and the other on the columns.

**Steps**

Use `common_cyl`, which you created to contain only cars with 4, 6, or 8
cylinders.

1.  Using `common_cyl`, create a histogram of `hwy_mpg`.
2.  Grid-facet the plot rowwise by `ncyl` and columnwise by `suv`.
3.  Add a title to your plot to indicate what variables are being
    faceted on.

**Solution:**

``` r
# Facet hists using hwy mileage and ncyl
common_cyl %>%
  ggplot(aes(x = hwy_mpg)) +
  geom_histogram() +
  facet_grid(ncyl ~ suv) +
  ggtitle("Mileage by suv and ncyl")
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

    ## Warning: Removed 11 rows containing non-finite values (stat_bin).

![](readme_files/figure-gfm/unnamed-chunk-33-1.png)<!-- -->

> ## *Question*
>
> Which of the following interpretations of the plot **is** valid?<br>
> <br> ✅ Across both SUVs and non-SUVs, mileage tends to decrease as
> the number of cylinders increases.<br> ⬜ There are more SUVs than
> non-SUVs across all cylinder types.<br> ⬜ There is more variability
> in 6-cylinder non-SUVs than in any other type of car.<br>

# 3. Numerical Summaries

Now that we’ve looked at exploring categorical and numerical data,
you’ll learn some useful statistics for describing distributions of
data.

## Measures of center

Theory. Coming soon …

**1. Measures of center**

What do we mean by a typical observation? For example, it sounds
perfectly fine to state a statistic like: the typical life expectancy in
the US is 77 (point) 6 years, but where does that number come from?
Before we answer that question, let’s make this more concrete by
introducing a dataset that we’ll be working with throughout the chapter.

**2. County demographics**

Researchers in public health have compiled data on the demographics of
every county in the US. We see here that we have 4 variables: the state
name, the county name, then the average life expectancy, and the median
income. Let’s focus on the life expectancy in the first 11 counties in
this dataset, all in the state of Alabama.

**3. Center: mean**

I’m going to simplify and extract those 11 numbers by rounding the
values of expectancy, when looking at the first 11 cases. The result, x,
is 11 integers, all in the mid 70s.OK, so let’s ask the question again:
what is a typical value for this set of 11 numbers?

**4. Center: mean**

The most common answer is the mean, which is the sum of all of the
observations divided by the number of observations. We learn that the
mean life expectancy in these 11 counties is around 74 (point) 5 years.
We can also use the built-in function mean.If we visualize “x” as a dot
plot,

**5. Center: mean**

we can represent the mean as a vertical red line.Another measure of
“typical” or “center” is the median.

**6. Center: mean, median**

The median is the middle value in the sorted dataset. So if we sort x,
the middle value is 74. We can also use the built-in function median.
Let’s draw that line in blue.

**7. Center: mean, median**

A third measure of center is the mode.

**8. Center: mean, median, mode**

The mode is simply the most common observation in the set. We can look
at the dot plot and see that it is 74. We can also run the table
function to see that the greatest count was 3 at 74. Let’s plot the mode
right next to the median in gold.

**9. Center: mean, median, mode**

The mode is the highest point on a plot of the distribution, while the
median divides the dataset into a lower half and an upper half. In this
case, those values are the same, but that is often not the case. The
mean can be thought of as the balance point of the data and it tends to
be drawn towards the longer tail of a distribution. This highlights an
important feature of the mean: its sensitivity to extreme values. For
this reason, when working with skewed distributions, the median is often
a more appropriate measure of center.Now that we have some sensible
measures of center, we can answer questions like: is the typical county
life expectancy on the West Coast similar to the typical life expectancy
in the rest of the country?

**10. Groupwise means**

To answer this, we start by creating a new variable that will be TRUE if
the state value is one of “California”, “Oregon”, or “Washington”, and
FALSE otherwise, and save it back to the original dataset. To compute
groupwise means, we pipe the dataset into the group by function
indicating that we’d like to establish groups based on our new variable.
Then we can summarize those groups, West Coast counties and non- West
Coast counties, by taking the mean and median of their life
expectancies. We learn that looking at both mean and median, the typical
West Coast county has a slightly higher average life expectancy than
counties not on the West Coast.

**11. Without group_by()**

Group by and summarize form a powerful pair of functions, so let’s look
into how they work. Let’s look at a slice of 8 rows in the middle of the
dataset and remove the group by line. This will summarize the expectancy
variable by taking its mean across all 8 rows.

**12. With group_by()**

If we add a line to group by West Coast, it’s effectively breaking the
dataset into two groups and calculating the mean of the expectancy
variable for each one separately.group by and summarize open up lots of
possibilities for analysis, so let’s get started.

**13. Let’s practice!**

In all of the exercises for this chapter, you’ll be working with similar
data, but on a global scale, in the Gapminder data.

## Choice of center measure

The choice of measure for center can have a dramatic impact on what we
consider to be a typical observation, so it is important that you
consider the shape of the distribution before deciding on the measure.

``` r
distributions <- readRDS("data/distributions.rds")

distributions |> 
  ggplot(aes(x = x, fill = distribution)) +
  geom_density(alpha = .3)
```

![](readme_files/figure-gfm/unnamed-chunk-34-1.png)<!-- -->

> ## *Question*
>
> Which set of measures of central tendency would be *worst* for
> describing the two distributions shown here?<br> <br> ⬜ A: mode, B:
> median<br> ✅ A: mean, B: mode<br> ⬜ A: median, B: mean<br> ⬜ A:
> median, B: median<br>

## summarize(): Calculate center measures

**Data**

Throughout this section, you will use data from `gapminder`, which
tracks demographic data in countries of the world over time. To learn
more about it, you can bring up the help file with `?gapminder`.

For this part, focus on how the life expectancy differs from continent
to continent. This requires that you conduct your analysis not at the
country level, but aggregated up to the continent level. This is made
possible by the one-two punch of `group_by()` and `summarize()`, a very
powerful syntax for carrying out the same analysis on different subsets
of the full dataset.

**Steps**

1.  Create a dataset called `gap2007` that contains only data from the
    year 2007.
2.  Using `gap2007`, calculate the mean and median life expectancy for
    each continent. Don’t worry about naming the new columns produced by
    `summarize()`.

``` r
# Create dataset of 2007 data
gap2007 <- filter(gapminder::gapminder, year == 2007)

# Compute groupwise mean and median lifeExp
gap2007 %>%
  group_by(continent) %>%
  summarize(mean(lifeExp),
            median(lifeExp))
```

    ## # A tibble: 5 × 3
    ##   continent `mean(lifeExp)` `median(lifeExp)`
    ##   <fct>               <dbl>             <dbl>
    ## 1 Africa               54.8              52.9
    ## 2 Americas             73.6              72.9
    ## 3 Asia                 70.7              72.4
    ## 4 Europe               77.6              78.6
    ## 5 Oceania              80.7              80.7

3.  Confirm the trends that you see in the medians by generating
    side-by-side box plots of life expectancy for each continent.

``` r
# Generate box plots of lifeExp for each continent
gap2007 %>%
  ggplot(aes(x = continent, y = lifeExp)) +
  geom_boxplot()
```

![](readme_files/figure-gfm/unnamed-chunk-36-1.png)<!-- -->

## Measures of variability

Theory. Coming soon …

**1. Measures of variability**

How do you summarize the variability that you see in a set of numbers?

**2. Insert title here…**

Let’s consider the life expectancies in those first 11 counties in the
US county-level dataset, which we saved to the object x. Most methods
have us thinking about variability along the lines of how much the data
is spread out from the center.

**3. Insert title here…**

Let’s choose to define the center by the mean and then, quantify the
distance from the mean by taking the difference between each observation
and that mean. That results in 11 differences, some positive, some
negative. We’d like to reduce all of these differences to a single
measure of variability, so let’s add them up. This is R’s scientific
notation, saying the sum is -1 (point) 42 times 10 to the -14. That
number is essentially zero. Clearly something has gone wrong because we
can tell that there is variability in this dataset, but our measure
hasn’t detected it. The problem is that the positives and negatives have
canceled each other out. This is easy to fix: you can square each
difference to get rid of the negatives. This new measure is better, but
it has an undesirable property: it will just keep getting bigger the
more data that you add. You can fix this by dividing this number by the
number of observations, 11. OK, now this looks like a useful measure:
you find the center of the data, then find the squared distance between
the observations and that mean averaged across whole dataset. If you
change the n to an n-1, you are left with what’s called the sample
variance, one of the most useful measures of the spread of a
distribution. In R, this statistic is wrapped up into the function v-a-r
for variance.

**4. Insert title here…**

Another useful measure is the square root of this number, which is
called the sample standard deviation or just sd in R. The convenient
thing about the sample standard deviation is that, once computed, it is
in the same units as the original data. In this case we can say that the
standard deviation of these 11 counties’ life expectancies is 1 (point)
69 years. By comparison, the variance of this sample is 2 (point) 87
years squared, which is a unit that we have no real intuition
about.There are two more measures of spread that are good to know about.
The interquartile range, or IQR, is the distance between the two numbers
that cut-off the middle 50% of your data. This should sound familiar
from the discussion of box plots: the height of the box is exactly the
IQR. We can either get the first and third quartiles from the summary
function and take their difference or we can use the built-in IQR
function.The final measure is simply the range of the data: the distance
between the maximum and the minimum. max and min are indeed functions in
R, but you can also use the nested diffrangex.For any dataset, you can
compute all four of these statistics, but which ones are the most
meaningful? The most commonly used in practice is the standard
deviation, so that’s often a good place to start. But what happens if
the dataset has some extreme observations?

**5. Insert title here…**

Let’s say that Baldwin County, Alabama, the county with a life
expectancy around 78, instead had a life expectancy of 97. If you
recompute the variance and the standard deviation, you see that they’ve
both gone through the roof. These measures are sensitive to extreme
values in the same way that the mean is as a measure of center. If you
recompute the range, it will certainly increase because it is completely
determined by the extreme values. For this reason, the range is not
often used.If you recompute the IQR, however, you see that it hasn’t
budged. Because that observation is still the highest, the quartiles
didn’t move. This reveals a good reason for using the IQR: in situations
where your dataset is heavily skewed or has extreme observations.

**6. Let’s practice!**

You’ll put your understanding of variability to use in the next
exercises.

## Choice of spread measure

The choice of measure for spread can dramatically impact how variable we
consider our data to be, so it is important that you consider the shape
of the distribution before deciding on the measure.

``` r
distributions |> 
  ggplot(aes(x = x, fill = distribution)) +
  geom_density(alpha = .3)
```

![](readme_files/figure-gfm/unnamed-chunk-37-1.png)<!-- -->

> ## *Question*
>
> Which set of measures of spread would be *worst* for describing the
> two distributions shown here?<br> <br> ⬜ A: IQR, B: IQR<br> ⬜ A: SD,
> B: IQR<br> ✅ A: Variance, B: Range<br>

## sd(), IQR(), n(): Calculate spread measures

Let’s extend the powerful `group_by()` and `summarize()` syntax to
measures of spread. If you’re unsure whether you’re working with
symmetric or skewed distributions, it’s a good idea to consider a robust
measure like IQR in addition to the usual measures of variance or
standard deviation.

**Steps**

1.  For each continent in `gap2007`, summarize life expectancies using
    the `sd()`, the `IQR()`, and the count of countries, `n()`. No need
    to name the new columns produced here. The `n()` function within
    your `summarize()` call does not take any arguments.

**Solution:**

``` r
# Compute groupwise measures of spread
gap2007 %>%
  group_by(continent) %>%
  summarize(sd(lifeExp),
            IQR(lifeExp),
            n())
```

    ## # A tibble: 5 × 4
    ##   continent `sd(lifeExp)` `IQR(lifeExp)` `n()`
    ##   <fct>             <dbl>          <dbl> <int>
    ## 1 Africa            9.63          11.6      52
    ## 2 Americas          4.44           4.63     25
    ## 3 Asia              7.96          10.2      33
    ## 4 Europe            2.98           4.78     30
    ## 5 Oceania           0.729          0.516     2

2.  Graphically compare the spread of these distributions by
    constructing overlaid density plots of life expectancy broken down
    by continent.

``` r
# Generate overlaid density plots
gap2007 %>%
  ggplot(aes(x = lifeExp, fill = continent)) +
  geom_density(alpha = 0.3)
```

![](readme_files/figure-gfm/unnamed-chunk-39-1.png)<!-- -->

## Choose measures for center and spread

Consider the density plots shown here. What are the most appropriate
measures to describe their centers and spreads? In this exercise, you’ll
select the measures and then calculate them.

**Steps**

Using the shapes of the density plots, calculate the most appropriate
measures of center and spread for the following:

1.  The distribution of life expectancy in the countries of the
    Americas. Note you’ll need to apply a filter here.

``` r
# Compute stats for lifeExp in Americas
gap2007 %>%
  filter(continent == "Americas") %>%
  summarize(mean(lifeExp),
            sd(lifeExp))
```

    ## # A tibble: 1 × 2
    ##   `mean(lifeExp)` `sd(lifeExp)`
    ##             <dbl>         <dbl>
    ## 1            73.6          4.44

2.  The distribution of country *populations* across the entire
    `gap2007` dataset.

``` r
# Compute stats for population
gap2007 %>%
  summarize(median(pop),
            IQR(pop))
```

    ## # A tibble: 1 × 2
    ##   `median(pop)` `IQR(pop)`
    ##           <dbl>      <dbl>
    ## 1      10517531  26702008.

## Distribution shapes

``` r
distributions2 <- readRDS("data/distributions2.rds")

distributions2 |> 
  ggplot(aes(x = x, y = y)) +
  geom_line() +
  facet_wrap(~plot, scales = "free") +
  labs(x = "", y = "") + 
  theme(axis.title = element_blank(),
        axis.text  = element_blank(),
        axis.ticks = element_blank())
```

![](readme_files/figure-gfm/unnamed-chunk-42-1.png)<!-- -->

## Shape and transformations

Theory. Coming soon …

**1. Shape and transformations**

There are generally four characteristics of distributions that are of
interest. The first two we’ve covered already: the center and the spread
or variability of the distribution. The third is the shape of the
distribution, which can be described in terms of the modality and the
skew.

**2. Modality**

The modality of a distribution is the number of prominent humps that
show up in the distribution. If there is a single mode, as in a
bell-curve, it’s called unimodal. If there are two prominent modes, it’s
called bimodal. If it has three modes or more, the convention is to
refer to it as multimodal. There is one last case: when there is no
distinct mode. Because the distribution is flat across all values, it is
referred to as uniform.The other aspect to the shape of the distribution
concerns its skew.

**3. Skew**

If a distribution has a long tail that stretches out to the right, it’s
referred to as “right-skewed”.

**4. Skew**

If that long tail stretches out to the left, its referred to as
“left-skewed”.If you have trouble remembering which is which, just
remember that the skew is where the long tail is.

**5. Skew**

If neither tail is longer than the other, the distribution is called
“symmetric”.

**6. Shape of income**

Let’s compare the distributions of median personal income at the county
level on the West Coast and in the rest of the country to see what shape
these distributions take. There are several plot types that we could use
here. Let’s use an overlaid density plot by putting income along the x
axis, filling the two curves with color according to whether or not
they’re on the West Coast, then adding a density later and specifying an
alpha level of (point) 3. This allows the colors to be somewhat
transparent so that we can see where they overlap.The plot that results
shows two curves, the blue representing the West Coast distribution and
the pink representing counties not on the West Coast. Each distribution
has a single prominent mode, so we can say that each distribution is
unimodal. You might argue that the little bump around 100,000 dollars is
a second mode, but we’re generally looking for larger-scale structure
than that.It’s difficult to compare these distributions because they are
both heavily right-skewed, that is, there are a few counties in each
group that have very high incomes. One way to remedy this is to
construct a plot of a transformed version of this variable.

**7. Shape of income**

Since income has a heavy right skew, either the square-root or
log-transform will do a good job of drawing in the right tail and
spreading out the lower values so that we can see what’s going on. We
can perform the transformation by wrapping income in the log function,
which will take the natural log. The result is a picture that’s a bit
easier to interpret: the typical income in West Coast counties is indeed
greater than that in the rest of the country and the second very small
mode of high income counties in the West Coast is not present in the
other distribution.

**8. Let’s practice!**

Let’s turn to some exercises to explore the shape of the Gapminder data.

> ## *Question*
>
> To build some familiarity with distributions of different shapes,
> consider the four that are plotted here. Which of the following
> options does the best job of describing their shape in terms of
> modality and skew/symmetry?<br> <br> ⬜ A: bimodal symmetric; B:
> unimodal symmetric; C: unimodal left-skewed, D: bimodal
> right-skewed.<br> ✅ A: unimodal left-skewed; B: unimodal symmetric;
> C: unimodal right-skewed, D: bimodal symmetric.<br> ⬜ A: unimodal
> right-skewed; B: unimodal left-skewed; C: unimodal left-skewed; D:
> bimodal symmetric.<br> ⬜ A: unimodal left-skewed; B: bimodal
> symmetric; C: unimodal right-skewed, D: unimodal symmetric.<br>

## log(): Transformations

Highly skewed distributions can make it very difficult to learn anything
from a visualization. Transformations can be helpful in revealing the
more subtle structure.

Here you’ll focus on the population variable, which exhibits strong
right skew, and transform it with the natural logarithm function
(`log()` in R).

**Steps**

Using the `gap2007` data:

1.  Create a density plot of the population variable.

``` r
# Create density plot of old variable
gap2007 %>%
  ggplot(aes(x = pop)) +
  geom_density()
```

![](readme_files/figure-gfm/unnamed-chunk-43-1.png)<!-- -->

2.  Mutate a new column called `log_pop` that is the natural log of the
    population and save it back into `gap2007`.
3.  Create a density plot of your transformed variable.

``` r
# Transform the skewed pop variable
gap2007 <- gap2007 %>%
  mutate(log_pop = log(pop))

# Create density plot of new variable
gap2007 %>%
  ggplot(aes(x = log_pop)) +
  geom_density()
```

![](readme_files/figure-gfm/unnamed-chunk-44-1.png)<!-- -->

## Outliers

Theory. Coming soon …

**1. Outliers**

We’ve discussed three different aspects of a distribution that are
important to note

**2. Characteristics of a distribution**

when conducting an exploratory data analysis: center, variability, and
shape. A fourth and final thing to look for are outliers. These are
observations that have extreme values far from the bulk of the
distribution. They’re often very interesting cases, but they’re also
good to know about before proceeding with more formal analysis.

**3. Insert title here…**

We saw some extreme values when we plotted the distribution of income
for counties on the West Coast. What are we to make of this blip of
counties? One thing we can do is try this as a box plot. Here I’ve added
an additional layer that flips the coordinates so that they boxes are
stretched out horizontally to make the comparison with the density plot
easier. What we see is interesting: the box plot flags many counties as
outliers, both along the West Coast but in the rest of the country as
well. So why was the blip more apparent on the West Coast? It has to do
with sample size. There are far fewer counties in the West Coast group,
so these few outliers had an outsized effect on the density plot. In the
case of the non West Coast group, there are many many more counties that
were able to wash out the effect of these outliers in the density plot.

**4. Indicating outliers**

It is often useful to consider outliers separately from the rest of the
data, so lets create a new column to store whether or not a given case
is an outlier. This requires that we mutate a new column called is
outlier that is TRUE if the income is greater than some threshold and
FALSE otherwise. In this case, we’ve picked a threshold for outliers as
counties with incomes greater than $75,000.We can actually inspect the
outliers by filtering the dataset to only include outliers, then arrange
them in decreasing order of income. Because we didn’t save this dplyr
chain back to an object, it just prints the sorted outliers to the
console. We learn that the top income county is actually Teton County,
in Wyoming, and that three of the top ten counties are in Texas and two
are in Nebraska.We can also try rebuilding the density plots without the
outliers.

**5. Plotting without outliers**

To do this, we form a dplyr chain where the first step is to filter on
those counties that are not outliers. Recall that is outlier is a vector
of TRUEs and FALSEs. Those values can be reversed using an exclamation
point, forming a variable that indicates the counties that are not
outliers. We then pipe this into the same code we used for the overlaid
density plots.The result is a plot that focuses much more on the body of
the distribution. You can contrast that with the original plot, which
was dominated by the strong right skew caused by the extreme values.
Note that neither of these plots is right or wrong, but they tell
different stories of the structure in this data, both of which are
valuable.

**6. Let’s practice!**

OK, now it’s your turn to practice exploring outliers in the Gapminder
data.

## Identify outliers

Consider the distribution, shown here, of the life expectancies of the
countries in Asia. The box plot identifies one clear outlier: a country
with a notably low life expectancy. Do you have a guess as to which
country this might be? Test your guess in the console using either
`min()` or `filter()`, then proceed to building a plot with that country
removed.

**Steps**

1.  Apply a filter so that it only contains observations from Asia, then
    create a new variable called `is_outlier` that is `TRUE` for
    countries with life expectancy less than 50. Assign the result to
    `gap_asia`.
2.  Filter `gap_asia` to remove all outliers, then create another box
    plot of the remaining life expectancies.

``` r
# Filter for Asia, add column indicating outliers
gap_asia <- gap2007 %>%
  filter(continent == "Asia") %>%
  mutate(is_outlier = lifeExp < 50)

# Remove outliers, create box plot of lifeExp
gap_asia %>%
  filter(!is_outlier) %>%
  ggplot(aes(x = 1, y = lifeExp)) +
  geom_boxplot()
```

![](readme_files/figure-gfm/unnamed-chunk-45-1.png)<!-- -->

# 4. Case Study: Spam Emails

Apply what you’ve learned to explore and summarize a real world dataset
in this case study of email spam.

## Introducing the data

Theory. Coming soon …

**1. Introducing the data**

In this chapter, you’ll get a chance to put to use what you know about
EDA in exploring a new dataset.

**2. Email data set**

The email dataset contains information on all of the emails received by
a single email account in a single month. Each email is a case, so we
see that this email account received 3,921 emails. Twenty-one different
variables were recorded on each email, some of which are numerical,
others are categorical. Of primary interest is the first column, a
categorical variable indicating whether or not the email is spam. This
was created by actually reading through each email individually and
deciding if it looked like spam or not. The subsequent columns were
easier to create. to multiple is TRUE if the email was addressed to more
than one recipient and FALSE otherwise. image is the number of images
attached in the email. It’s important that you have a full sense of what
each of the variables mean, so you’ll want to start your exercises by
reading about them in the help file.One of your guiding questions
throughout this chapter is: what characteristics of an email are
associated with it being spam? Numerical and graphical summaries are a
great way of starting to answer that question. Let’s review the main
graphical tools that we have for numerical data.

**3. Histograms**

Histograms take continuous data and aggregate it into bins, then draw a
bar to a height that corresponds to the number of cases in that bin.
They have a tuning parameter that you should play with, the binwidth, to
explore the shape of the distribution at different scales.

**4. Histograms**

If you’re interested in building histograms broken down based on a
categorical variable, they’re a good candidate for faceting, which can
be done with the facet wrap layer.

**5. Boxplots**

Box plots excel at comparing multiple distributions and this is
reflected in the ggplot syntax that requires you to put something on the
x axis. If variable has two levels, you’ll get two side-by-side box
plots. The box plot uses robust measures, the median and the IQR, to
draw the box, and also flags potential outliers for you. A downside,
however, is that it can hide more complicated shapes, such as a bimodal
distribution.

**6. Boxplots**

To get a single box plot, just map x to the number 1.

**7. Density plots**

Density plots summarize the data by drawing a smooth line to represent
its shape. Similar to histograms, you can change the smoothness of a
density plot by changing the bandwidth parameter, which you can add to
the geom density function. These can be faceted just like histograms, or
they can be overlaid on one another,

**8. Density plots**

by mapping the color of the fill of the distribution to a second
variable. If you want the colors to be somewhat transparent, specify an
alpha parameter between 0 and 1.

**9. Let’s practice!**

With that brief introduction, let’s dive into this new dataset.

### Spam and num_char

Is there an association between spam and the length of an email? You
could imagine a story either way:

-   *Spam is more likely to be a short message tempting me to click on a
    link*, or
-   *My normal email is likely shorter since I exchange brief emails
    with my friends all the time*.

Here, you’ll use the `email` dataset to settle that question. Begin by
bringing up the help file and learning about all the variables with
`?email`.

As you explore the association between spam and the length of an email,
use this opportunity to try out linking a `dplyr` chain with the layers
in a `ggplot2` object.

**Data**

-   `email` (from the `openintro` package)

**Steps**

1.  Compute appropriate measures of the center and spread of `num_char`
    for both spam and not-spam using `group_by()` and `summarize()`. No
    need to name the new columns created by `summarize()`.

``` r
# Load packages
library(openintro)
```

    ## Loading required package: airports

    ## Loading required package: cherryblossom

    ## Loading required package: usdata

``` r
# Compute summary statistics
email %>%
  group_by(spam) %>%
  summarise(median(num_char),
            IQR(num_char))
```

    ## # A tibble: 2 × 3
    ##   spam  `median(num_char)` `IQR(num_char)`
    ##   <fct>              <dbl>           <dbl>
    ## 1 0                   6.83           13.6 
    ## 2 1                   1.05            2.82

2.  Construct side-by-side box plots to visualize the association
    between the same two variables. It will be useful to `mutate()` a
    new column containing a log-transformed version of `num_char`.

``` r
# Create plot
email %>%
  mutate(log_num_char = log(num_char)) %>%
  ggplot(aes(x = spam, y = log_num_char)) +
  geom_boxplot()
```

![](readme_files/figure-gfm/unnamed-chunk-47-1.png)<!-- -->

> ## *Question*
>
> Which of the following interpretations of the plot is valid?<br> <br>
> ⬜ The shortest email in this dataset was not spam.<br> ✅ The median
> length of not-spam emails is greater than that of spam emails.<br> ⬜
> The IQR of email length of spam is greater than that of not-spam.<br>

### Spam and !!!

Let’s look at a more obvious indicator of spam: exclamation marks.
`exclaim_mess` contains the number of exclamation marks in each message.
Using summary statistics and visualization, see if there is a
relationship between this variable and whether or not a message is spam.

Experiment with different types of plots until you find one that is the
most informative. Recall that you’ve seen:

-   Side-by-side box plots
-   Faceted histograms
-   Overlaid density plots

**Steps**

1.  Calculate appropriate measures of the center and spread of
    `exclaim_mess` for both spam and not-spam using `group_by()` and
    `summarize()`.

``` r
# Compute center and spread for exclaim_mess by spam
email %>%
    group_by(spam) %>%
    summarise(mean(exclaim_mess),
              sd(exclaim_mess))
```

    ## # A tibble: 2 × 3
    ##   spam  `mean(exclaim_mess)` `sd(exclaim_mess)`
    ##   <fct>                <dbl>              <dbl>
    ## 1 0                     6.51               47.6
    ## 2 1                     7.32               79.9

2.  Construct an appropriate plot to visualize the association between
    the same two variables, adding in a log-transformation step if
    necessary.
3.  If you decide to use a log transformation, remember that `log(0)` is
    `-Inf` in R, which isn’t a very useful value! You can get around
    this by adding a small number (like `0.01`) to the quantity inside
    the `log()` function. This way, your value is never zero. This small
    shift to the right won’t affect your results.

``` r
# Create plot for spam and exclaim_mess
email %>%
    mutate(log_exclaim_mess = log(exclaim_mess + 0.01)) %>%
    ggplot(aes(x = log_exclaim_mess, fill = spam)) +
    geom_density(alpha = 0.3)
```

![](readme_files/figure-gfm/unnamed-chunk-49-1.png)<!-- -->

``` r
email %>%
  mutate(spam = spam |> fct_recode(`not-spam` = "0", spam = "1")) |> 
  mutate(log_exclaim_mess = log(exclaim_mess + 0.01)) |> 
  ggplot(aes(x = log_exclaim_mess)) +
  geom_histogram(binwidth = 0.4) +
  facet_wrap(~spam)
```

![](readme_files/figure-gfm/unnamed-chunk-50-1.png)<!-- -->

> ## *Question*
>
> Which interpretation of these faceted histograms **is not**
> correct?<br> <br> ⬜ The most common value of exclaim_mess in both
> classes of email is zero (a log(exclaim_mess) of -4.6 after adding
> .01).<br> ✅ There are more cases of spam in this dataset than
> not-spam.<br> ⬜ Even after a transformation, the distribution of
> exclaim_mess in both classes of email is right-skewed.<br> ⬜ The
> typical number of exclamations in the not-spam group appears to be
> slightly higher than in the spam group.<br>

## Check-in 1

Theory. Coming soon …

**1. Check-in 1**

Let’s review what you learned in the last several exercises.

**2. Review**

The box plots show the association between whether or not an email is
spam and the length of the email, as measured by the log number of
characters. In this dataset, the typical spam message is considerably
shorter than the non-spam message, but there is still a reasonable
amount of overlap in the two distributions of length.

**3. Review**

When you looked at the distribution of spam and the number of
exclamation marks used, you found that both distributions are heavily
right skewed: there only a few instances of many exclamation marks being
using and many many more of 0 or 1 being used. It also bucks the
expectation that spam messages will be filled with emphatic exclamation
marks to entice you to click on their links. If anything, here it’s
actually not-spam that typically has more exclamation marks.The dominant
feature of the exclaim mess variable, though, is the large proportion of
cases that report zero or on this log scale, -4 (point) 6 exclamation
marks. This is a common occurrence in data analysis that is often termed
“zero-inflation”, and there are several common ways to think about those
zeros.

**4. Zero inflation strategies**

One approach says that there are two mechanisms going on: one generating
the zeros and the other generating the non-zeros, so we will analyze
these two groups separately. A simpler approach is the one that thinks
of the variable as actually only taking two values, zero or not-zero,
and treating it like a categorical variable.If you want to take the
latter approach, the first step will be to mutate this new variable.
Here, our condition is simply that the exclaim mess variable is zero.
Then we can pipe that new variable into a bar chart and facet it based
on spam. In the resulting plot, yes, we’ve lost a lot of information.
But it’s become very clear

**5. Zero inflation strategies**

that spam is more likely to contain no exclamation marks, while in spam,
the opposite is true.Speaking of bar charts, let’s review their layout.

**6. Zero inflation strategies**

One way to view associations between multiple categorical variables is
like this, with faceting.

**7. Barchart options**

Another way that we’ve seen is using a stacked bar chart. For that plot,
you move the second variable from the facet layer to the fill argument
inside the aesthetics function. The other consideration you have to make
is if you’re more interested in counts or proportions. If the latter,
you’ll want to normalize the plot,

**8. Barchart options**

which you can do by adding the position equals fill argument to the bar
geom. The result is a series of conditional proportions, where you’re
conditioning on whichever variable you’re in.

**9. Let’s practice!**

OK, let’s get back to exploring the email dataset.

### Collapsing levels

If it was difficult to work with the heavy skew of `exclaim_mess`, the
number of images attached to each email (`image`) poses even more of a
challenge. Run the following code at the console to get a sense of its
distribution:

``` r
table(email$image)
```

    ## 
    ##    0    1    2    3    4    5    9   20 
    ## 3811   76   17   11    2    2    1    1

Recall that this tabulates the number of cases in each category (so
there were 3811 emails with 0 images, for example). Given the very low
counts at the higher number of images, let’s collapse `image` into a
categorical variable that indicates whether or not the email had at
least one image. In this exercise, you’ll create this new variable and
explore its association with spam.

**Steps**

Starting with `email`, form a continuous chain that links together the
following tasks:

1.  Create a new variable called `has_image` that is `TRUE` where the
    number of images is greater than zero and `FALSE` otherwise.
2.  Create an appropriate plot with `email` to visualize the
    relationship between `has_image` and `spam`.

**Solution:**

``` r
# Create plot of proportion of spam by image
email %>%
  mutate(spam = spam |> fct_recode(`not-spam` = "0", spam = "1")) |> 
  mutate(has_image = image > 0) %>%
  ggplot(aes(x = has_image, fill = spam)) +
  geom_bar(position = "fill")
```

![](readme_files/figure-gfm/unnamed-chunk-52-1.png)<!-- -->

> ## *Question*
>
> Which of the following interpretations of the plot **is** valid?<br>
> <br> ⬜ There are more emails with images than without images.<br> ⬜
> Emails with images have a higher proportion that are spam than do
> emails without images.<br> ✅ An email without an image is more likely
> to be not-spam than spam.<br>

### Data Integrity

In the process of exploring a dataset, you’ll sometimes come across
something that will lead you to question how the data were compiled. For
example, the variable `num_char` contains the number of characters in
the email, in thousands, so it could take decimal values, but it
certainly shouldn’t take negative values.

You can formulate a test to ensure this variable is behaving as we
expect:

``` r
email$num_char < 0
```

If you run this code at the console, you’ll get a long vector of logical
values indicating for each case in the dataset whether that condition is
`TRUE`. Here, the first 1000 values all appear to be `FALSE`. To verify
that *all* of the cases indeed have non-negative values for `num_char`,
we can take the *sum* of this vector:

``` r
sum(email$num_char < 0)
```

    ## [1] 0

This is a handy shortcut. When you do arithmetic on logical values, R
treats `TRUE` as `1` and `FALSE` as `0`. Since the sum over the whole
vector is zero, you learn that every case in the dataset took a value of
`FALSE` in the test. That is, the `num_char` column is behaving as we
expect and taking only non-negative values.

**Steps**

Consider the variables `image` and `attach`. You can read about them
with `?email`, but the help file is ambiguous: do attached images count
as attached files in this dataset?

Design a simple test to determine if images count as attached files.
This involves creating a logical condition to compare the values of the
two variables, then using `sum()` to assess every case in the dataset.
Recall that the logical operators are `<` for *less than*, `<=` for
*less than or equal to*, `>` for *greater than*, `>=` for *greater than
or equal to*, and `==` for *equal to*.

``` r
# Test if images count as attachments
sum(email$attach < email$image)
```

    ## [1] 0

### Answering questions with chains

When you have a specific question about a dataset, you can find your way
to an answer by carefully constructing the appropriate chain of R code.
For example, consider the following question: “Within non-spam emails,
is the typical length of emails shorter for those that were sent to
multiple people?”

This can be answered with the following chain:

``` r
email %>%
   mutate(spam = spam |> fct_recode(`not-spam` = "0", spam = "1")) |> 
   filter(spam == "not-spam") %>%
   group_by(to_multiple) %>%
   summarize(median(num_char))
```

    ## # A tibble: 2 × 2
    ##   to_multiple `median(num_char)`
    ##   <fct>                    <dbl>
    ## 1 0                         7.20
    ## 2 1                         5.36

The code makes it clear that you are using `num_char` to measure the
length of an email and `median()` as the measure of what is typical. If
you run this code, you’ll learn that the answer to the question is
“yes”: the typical length of non-spam sent to multiple people is a bit
lower than those sent to only one person.

This chain concluded with summary statistics, but others might end in a
plot; it all depends on the question that you’re trying to answer.

**Steps**

Build a chain to answer each of the following questions, both about the
variable `dollar`.

1.  For emails containing the word “dollar”, does the typical spam email
    contain a greater number of occurrences of the word than the typical
    non-spam email? Create a summary statistic that answers this
    question.

``` r
# Question 1
email %>%
  mutate(spam = spam |> fct_recode(`not-spam` = "0", spam = "1")) |> 
  filter(dollar > 0) %>%
  group_by(spam) %>%
  summarize(median(dollar))
```

    ## # A tibble: 2 × 2
    ##   spam     `median(dollar)`
    ##   <fct>               <dbl>
    ## 1 not-spam                4
    ## 2 spam                    2

2.  If you encounter an email with greater than 10 occurrences of the
    word `dollar`, is it more likely to be spam or not-spam? Create a
    barchart that answers this question.

``` r
# Question 2
email %>%
  mutate(spam = spam |> fct_recode(`not-spam` = "0", spam = "1")) |> 
  filter(dollar > 10) %>%
  ggplot(aes(x = spam)) +
  geom_bar()
```

![](readme_files/figure-gfm/unnamed-chunk-58-1.png)<!-- -->

## Check-in 2

Theory. Coming soon …

**1. Check-in 2**

Let’s revisit the exercise where you explored the association between

**2. Spam and images**

whether an email has an image and whether or not its spam. The plot you
created was this bar chart of proportions. I want to emphasize an
important, but subtle distinction when discussing proportions like this.
This plot shows the proportions of spam or not-spam within the subsets
of emails that either have an image or do not. Said another way, they
are conditioned on the has image variable. We get a slightly different
story if we exchange the variables so that we condition on spam. Among
emails that are spam, almost none of them have an image, while the
proportion within non-spam is larger, but still less than 5%. If you’re
building a spam filter, a situation where you don’t actually get to see
the value of spam, it’d make more sense to think about conditioning on
the has image variable.

**3. Spam and images**

In this case, we can tell that this variable would be an awful spam
filter by itself.

**4. Ordering bars**

When we’re working with bar charts, you can often make them more readily
interpretable if you give them a sensible ordering. Recall how in the
last video, we collapsed all emails with at least one exclamation mark
into a single level of a new two-level categorical variable.

**5. Ordering bars**

That led to this bar chart, which was informative, but you might caused
you to do a double-take when you first saw it. The plot on the left gets
us used to seeing the bar for the zeroes on the left, while in the plot
on the right, that bar is on the right side.

**6. Ordering bars**

Let’s go through how we would flip the ordering of those bars so that
they agree with the plot on the left.

**7. Ordering bars**

The first step is to save the mutated categorical variable back into the
dataset. The ordering of the bars isn’t determined within the code for
the plot, but in the way that R represents that variable. If we call
levels on the new variable, it returns NULL. This is because this
variable is actually a logical variable, not a factor. To set the
ordering of the levels, let’s convert it to a factor with the factor
function, provide We can then save this variable back into the dataset.

**8. Ordering bars**

Now, when we go to make the plot with the same code,

**9. Ordering bars..**

it exchanges the order of the bars for us.Here, we decided to order the
bars so that it cohered with the structure of another plot. In other
circumstances, you might use other criteria to choose the order
including a natural ordering of the levels, arranging the bars in
increasing or decreasing order of the height of the bars or alphabetical
order, which is the default. In making this decision, you’re thinking
about emphasizing a particular interpretation of the plot and
transitioning from purely exploratory graphics to expository graphics,
where you seek to communicate a particular idea. This is a natural
development as you continue along the process of your data analysis.

**10. Let’s practice!**

OK, let’s return back to the case study.

### What’s in a number?

Turn your attention to the variable called `number`. Read more about it
by pulling up the help file with `?email`.

To explore the association between this variable and `spam`, select and
construct an informative plot. For illustrating relationships between
categorical variables, you’ve seen

-   Faceted barcharts
-   Side-by-side barcharts
-   Stacked and normalized barcharts.

Let’s practice constructing a faceted barchart.

**Steps**

1.  Reorder the levels of `number` so that they preserve the natural
    ordering of `"none"`, then `"small"`, then `"big"`, saving to a
    `number_reordered` column.
2.  Construct a faceted barchart of the association between `number` and
    `spam`.

``` r
# Reorder levels
# base r
# email$number_reordered <- factor(email$number, levels = c("none", "small", "big"))

# forcats
email |> 
  mutate(spam = spam |> fct_recode(`not-spam` = "0", spam = "1")) |> 
  mutate(number_reordered = number |> fct_relevel(levels = "none", "small", "big")) |> 

  # Construct plot of number_reordered
  ggplot(aes(x = number_reordered, fill = spam)) +
    geom_bar() +
    facet_wrap(~spam)
```

![](readme_files/figure-gfm/unnamed-chunk-59-1.png)<!-- -->

> ## *Question*
>
> Which of the following interpretations of the plot **is not**
> valid?<br> <br> ⬜ Given that an email contains a small number, it is
> more likely to be not-spam.<br> ✅ Given that an email contains no
> number, it is more likely to be spam.<br> ⬜ Given that an email
> contains a big number, it is more likely to be not-spam.<br> ⬜ Within
> both spam and not-spam, the most common number is a small one.<br>

## Conclusion

Theory. Coming soon …

**1. Conclusion**

In this course on Exploratory Data Analysis, our goal was to get you
comfortable wading into a new dataset and provide a sense of the
considerations and techniques needed to find the most important
structure in your data.

**2. Pie chart vs. bar chart**

We started with categorical data, often the domain of the pie chart, and
hopefully convinced you that bar charts are a useful tool in finding
associations between variables and comparing levels to one another.

**3. Faceting vs. stacking**

We saw how the story can change, depending on if we’re visualizing
counts or proportions.

**4. Histogram**

From there, we moved on to numerical data and a collection of graphical
techniques that are important: the histogram,

**5. Density plot**

the density plot, and the

**6. Side-by-side box plots**

box plot. Each has its strengths and weaknesses.

**7. Center: mean, median, mode**

In the third chapter, we discussed the common numerical measures of a
distribution: measures of center, variability,

**8. Shape of income**

shape, plus the presence of outliers. Our life was made much easier by
using the combination

**9. With group_by()**

of group by and summarize to compute statistics on different subsets of
our data.

**10. Spam and exclamation points**

In the final chapter, we explored an email dataset to learn about the
aspects of an email that are

**11. Spam and images**

associated with it being spam.

**12. Let’s practice!**

It’s been my pleasure to be your instructor and I hope you’ll continue
on with the next course in this intro stats series.
