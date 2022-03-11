Introduction to the tidyverse
================
Joschka Schwarz

-   [1. Data Wrangling](#1-data-wrangling)
    -   [The gapminder dataset](#the-gapminder-dataset)
    -   [Loading the gapminder and dplyr
        packages](#loading-the-gapminder-and-dplyr-packages)
    -   [Understanding a data frame](#understanding-a-data-frame)
    -   [The filter verb](#the-filter-verb)
    -   [Filtering for one year](#filtering-for-one-year)
    -   [Filtering for one country and one
        year](#filtering-for-one-country-and-one-year)
    -   [The arrange verb](#the-arrange-verb)
    -   [Arranging observations by life
        expectancy](#arranging-observations-by-life-expectancy)
    -   [Filtering and arranging](#filtering-and-arranging)
    -   [The mutate verb](#the-mutate-verb)
    -   [Using mutate to change or create a
        column](#using-mutate-to-change-or-create-a-column)
    -   [Combining filter, mutate, and
        arrange](#combining-filter-mutate-and-arrange)
-   [2. Data visualization](#2-data-visualization)
    -   [Visualizing with ggplot2](#visualizing-with-ggplot2)
    -   [Variable assignment](#variable-assignment)
    -   [Comparing population and GDP per
        capita](#comparing-population-and-gdp-per-capita)
    -   [Comparing population and life
        expectancy](#comparing-population-and-life-expectancy)
    -   [Log scales](#log-scales)
    -   [Putting the x-axis on a log
        scale](#putting-the-x-axis-on-a-log-scale)
    -   [Putting the x- and y- axes on a log
        scale](#putting-the-x--and-y--axes-on-a-log-scale)
    -   [Additional aesthetics](#additional-aesthetics)
    -   [Adding color to a scatter
        plot](#adding-color-to-a-scatter-plot)
    -   [Adding size and color to a
        plot](#adding-size-and-color-to-a-plot)
    -   [Faceting](#faceting)
    -   [Creating a subgraph for each
        continent](#creating-a-subgraph-for-each-continent)
    -   [Faceting by year](#faceting-by-year)
-   [3. Grouping and summarizing](#3-grouping-and-summarizing)
    -   [The summarize verb](#the-summarize-verb)
    -   [Summarizing the median life
        expectancy](#summarizing-the-median-life-expectancy)
    -   [Summarizing the median life expectancy in
        1957](#summarizing-the-median-life-expectancy-in-1957)
    -   [Summarizing multiple variables in
        1957](#summarizing-multiple-variables-in-1957)
    -   [The group_by verb](#the-group_by-verb)
    -   [Summarizing by year](#summarizing-by-year)
    -   [Summarizing by continent](#summarizing-by-continent)
    -   [Summarizing by continent and
        year](#summarizing-by-continent-and-year)
    -   [Visualizing summarized data](#visualizing-summarized-data)
    -   [Visualizing median life expectancy over
        time](#visualizing-median-life-expectancy-over-time)
    -   [Visualizing median GDP per capita per continent over
        time](#visualizing-median-gdp-per-capita-per-continent-over-time)
    -   [Comparing median life expectancy and median GDP per continent
        in
        2007](#comparing-median-life-expectancy-and-median-gdp-per-continent-in-2007)
-   [4. Types of visualizations](#4-types-of-visualizations)
    -   [Line plots](#line-plots)
    -   [Visualizing median GDP per capita over
        time](#visualizing-median-gdp-per-capita-over-time)
    -   [Visualizing median GDP per capita per continent over
        time](#visualizing-median-gdp-per-capita-per-continent-over-time-1)
    -   [Comparing median life expectancy and median GDP per continent
        in
        2007](#comparing-median-life-expectancy-and-median-gdp-per-continent-in-2007-1)
    -   [Visualizing median GDP per capita over
        time](#visualizing-median-gdp-per-capita-over-time-1)
    -   [Visualizing median GDP per capita by continent over
        time](#visualizing-median-gdp-per-capita-by-continent-over-time)
    -   [Bar plots](#bar-plots)
    -   [Visualizing median GDP per capita by
        continent](#visualizing-median-gdp-per-capita-by-continent)
    -   [Visualizing GDP per capita by country in
        Oceania](#visualizing-gdp-per-capita-by-country-in-oceania)
    -   [Histograms](#histograms)
    -   [Visualizing population](#visualizing-population)
    -   [Visualizing population with x-axis on a log
        scale](#visualizing-population-with-x-axis-on-a-log-scale)
    -   [Boxplots](#boxplots)
    -   [Comparing GDP per capita across
        continents](#comparing-gdp-per-capita-across-continents)
    -   [Adding a title to your graph](#adding-a-title-to-your-graph)
    -   [Conclusion](#conclusion)

**Short Description**

Get started on the path to exploring and visualizing your own data with
the tidyverse, a powerful and popular collection of data science tools
within R. Discover the fundamentals of the Tidyverse, and learn all
about renaming and reordering variables, while becoming familiar with
binomial distribution.

**Long Description**

This is an introduction to the programming language R, focused on a
powerful set of tools known as the Tidyverse. You’ll learn the
intertwined processes of data manipulation and visualization using the
tools dplyr and ggplot2. You’ll learn to manipulate data by filtering,
sorting, and summarizing a real dataset of historical country data in
order to answer exploratory questions. You’ll then learn to turn this
processed data into informative line plots, bar plots, histograms, and
more with the ggplot2 package. You’ll get a taste of the value of
exploratory data analysis and the power of Tidyverse tools. This is a
suitable introduction for those who have no previous experience in R and
are interested in performing data analysis.

# 1. Data Wrangling

In this chapter, you’ll learn to do three things with a table: filter
for particular observations, arrange the observations in a desired
order, and mutate to add or change a column. You’ll see how each of
these steps allows you to answer questions about your data.

## The gapminder dataset

Theory. Coming soon …

**1. The gapminder dataset**

Hi, I’m Dave Robinson and I’ll be your instructor. I’m a data scientist
and I love using R to dive into a dataset and discover interesting
things. This course will get you started on the path to exploring and
visualizing your own data with the R programming language. This course
introduces you to gapminder.

**2. Tidyverse**

to the tidyverse, a collection of data science tools within R for
transforming and visualizing data. This is not the only set of tools in
R, but it’s a powerful and popular approach for exploring data. At every
step, you’ll be analyzing a real dataset called

**3. Gapminder**

Gapminder. Gapminder tracks economic and social indicators like life
expectancy and the GDP per capita of countries over time. The experience
you gain on this example will help you in analyzing your own data.
You’ll learn to draw specific insights and

**4. 4 Plots**

communicate them through informative visualizations with the ggplot2
package. This course is interactive: between the short videos you’ll
complete exercises by typing in code, with help from us along the way.
The

**5. Loading packages**

first code you’ll write is to load two R packages, which is done by
writing “library parenthesis, the name of the package, then end
parenthesis”. R packages are tools that aren’t built into the language,
but were created later by other programmers. Each of them provides tools
that you don’t have to write yourself.The first package is gapminder,
created by Jenny Bryan, which contains the dataset that you’ll be
analyzing. The second package is dplyr, created by Hadley Wickham, which
provides step-by-step tools for transforming this data, such as
filtering, sorting, and summarizing it. You type

**6. The gapminder dataset**

gapminder to display the contents of the gapminder object, which is
structured as a data frame. A data frame keeps rectangular data in rows
and columns, similar to a spreadsheet, or a table in a SQL database.
Most data analyses in R, and everything you’ll do in this course, are
centered around data frames. As described in the first line of the
output, this is a special type of data frame called a tibble, though for
now you don’t have to worry about the difference.R displays the first
ten rows so that you can get a glimpse of it, and you can see a short
description in the first line. This tells you the tibble has one
thousand seven hundred and four rows, each of which we call an
observation. It has six columns, each of which we call a variable.It’s
important in an analysis to understand what each observation, or row,
represents. Here, each represents a unique pair of a country and a year.
For example, the first observation represents country statistics for
Afghanistan in 1952, the second for Afghanistan in 1957, and so on.For
each combination of a country and year, the dataset contains several
variables, or columns, describing the country’s demographics. We see the
continent - in this case, Asia - the life expectancy in years, the
population, and the GDP per capita. The GDP per capita is the country’s
total economic output (Gross Domestic Product) divided by its
population, and it’s a common measure of how wealthy a country is. Each
variable is of one consistent data type: some are numbers, like life
expectancy and population, and some are categorical, like country and
continent.Even with this small glimpse of the data, you can extract a
few insights. For example, you can see that Afghanistan’s life
expectancy and population have both gone up from 1952 to 1997, but that
its GDP per capita has wavered. In the rest of this course, you’ll learn
to use R to draw many conclusions about the social and economic history
of countries around the world.

## Loading the gapminder and dplyr packages

Before you can work with the `gapminder` dataset, you’ll need to load
two R packages that contain the tools for working with it, then display
the `gapminder` dataset so that you can see what it contains.

To your right, you’ll see two windows inside which you can enter code:
The `script.R` window, and the R Console. All of your code to solve each
exercise must go inside `script.R`.

If you hit *Submit Answer*, your R script is executed and the output is
shown in the R Console. DataCamp checks whether your submission is
correct and gives you feedback. You can hit *Submit Answer* as often as
you want. If you’re stuck, you can ask for a hint or a solution.

You can use the R Console interactively by simply typing R code and
hitting Enter. When you work in the console directly, your code will not
be checked for correctness so it is a great way to experiment and
explore.

*This course introduces a lot of new concepts, so if you ever need a
quick refresher, download the
<a href="https://datacamp-community-prod.s3.amazonaws.com/e63a8f6b-2aa3-4006-89e0-badc294b179c" target="_blank" rel="noopener noreferrer">tidyverse
for beginners Cheat Sheet</a> and keep it handy!*

**Steps**

1.  Use the `library()` function to load the `dplyr` package, just like
    we’ve loaded the `gapminder` package for you.
2.  Type `gapminder`, on its own line, to look at the gapminder dataset.

``` r
# Load the gapminder package
library(gapminder)

# Load the dplyr package
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
# Look at the gapminder dataset
gapminder
```

    ## # A tibble: 1,704 × 6
    ##    country     continent  year lifeExp      pop gdpPercap
    ##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
    ##  1 Afghanistan Asia       1952    28.8  8425333      779.
    ##  2 Afghanistan Asia       1957    30.3  9240934      821.
    ##  3 Afghanistan Asia       1962    32.0 10267083      853.
    ##  4 Afghanistan Asia       1967    34.0 11537966      836.
    ##  5 Afghanistan Asia       1972    36.1 13079460      740.
    ##  6 Afghanistan Asia       1977    38.4 14880372      786.
    ##  7 Afghanistan Asia       1982    39.9 12881816      978.
    ##  8 Afghanistan Asia       1987    40.8 13867957      852.
    ##  9 Afghanistan Asia       1992    41.7 16317921      649.
    ## 10 Afghanistan Asia       1997    41.8 22227415      635.
    ## # … with 1,694 more rows

Great job! Notice that you can see the gapminder dataset in the output.
This is called ‘printing’ a dataset.

## Understanding a data frame

Now that you’ve loaded the `gapminder` dataset, you can start examining
and understanding it.

We’ve already loaded the `gapminder` and `dplyr` packages. Type
`gapminder` in the console, to display the object.

> ## *Question*
>
> How many observations (rows) are in the dataset?<br> <br> ✅ 1704<br>
> ⬜ 6<br> ⬜ 1694<br> ⬜ 1952<br>

## The filter verb

Theory. Coming soon …

**1. The filter verb**

Now that you’ve been introduced to the gapminder data, you’ll learn the
tools to work with it. In the rest of this chapter you’ll learn about
the “verbs” in the dplyr package - these are the atomic steps you use to
transform data. The first verb you’ll use is filter.

**2. The filter verb**

You use filter when you want to look only at a subset of your
observations, based on a particular condition. Filtering data is a
common first step in an analysis. Every time you apply a verb, you’ll
use a pipe.

**3. Filtering for one year**

A pipe is a percent, greater than, percent. It says “take whatever is
before it, and feed it into the next step.”After the pipe, we can
perform our first verb. We have data on many years, but we’d like to
filter for just one. Let’s say we filter for 2007, the most recent data
in the dataset.The “year equals equals 2007” is the condition we are
using to filter observations. The “equals equals” may be surprising:
it’s what we call a “logical equals”- an operation to compare two
values: each year, and the number 2007. A single equals here would mean
something different in R, which you’ll see later.Here, we’re saying we
want to filter for only the observations from 2007. Let’s see what this
code outputs. Notice that now, we have only 142 rows: that’s how many
countries are in the dataset.It’s important to note that you’re not
removing any rows from the original gapminder data. You can still use
the gapminder object for other analyses, and it won’t be any different
than it was before. Instead, filter is returning a new dataset, one with
fewer rows, that then gets printed to the screen. You could choose
another condition to filter on,

**4. Filtering for one country**

besides the year. For example, suppose we wanted to get only the
observations from the United States.We would write this as “filter
country equals equals quote United States endquote”, resulting in only
the 12 observations from that country.The quotes around United States
are important: otherwise R won’t understand that the words “United” and
“States” are the content of a text variable, as opposed to variable
names. You didn’t need quotes around a number like 2007, but you do
around text. Finally,

**5. Filtering for two variables**

we can specify multiple conditions in the filter.Each of the conditions
is separated by a comma: here we are saying we want only the one
observation for the year 2007, comma, where the country is the United
States. Each of these equals equals expressions is called an
argument.This kind of double filter is useful for extracting a single
observation you’re interested in. You’ll be able to practice this in the
exercises.

## Filtering for one year

The `filter` verb extracts particular observations based on a condition.
In this exercise you’ll filter for observations from a particular year.

**Steps**

1.  Add a `filter()` line after the pipe (`%>%`) to extract only the
    observations from the year 1957. Remember that you use `==` to
    compare two values.

``` r
# Filter the gapminder dataset for the year 1957
gapminder %>% filter(year == 1957)
```

    ## # A tibble: 142 × 6
    ##    country     continent  year lifeExp      pop gdpPercap
    ##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
    ##  1 Afghanistan Asia       1957    30.3  9240934      821.
    ##  2 Albania     Europe     1957    59.3  1476505     1942.
    ##  3 Algeria     Africa     1957    45.7 10270856     3014.
    ##  4 Angola      Africa     1957    32.0  4561361     3828.
    ##  5 Argentina   Americas   1957    64.4 19610538     6857.
    ##  6 Australia   Oceania    1957    70.3  9712569    10950.
    ##  7 Austria     Europe     1957    67.5  6965860     8843.
    ##  8 Bahrain     Asia       1957    53.8   138655    11636.
    ##  9 Bangladesh  Asia       1957    39.3 51365468      662.
    ## 10 Belgium     Europe     1957    69.2  8989111     9715.
    ## # … with 132 more rows

That’s right! Notice that all the observations in the output have the
year 1957.

## Filtering for one country and one year

You can also use the `filter()` verb to set two conditions, which could
retrieve a single observation.

Just like in the last exercise, you can do this in two lines of code,
starting with `gapminder %>%` and having the `filter()` on the second
line. Keeping one verb on each line helps keep the code readable. Note
that each time, you’ll put the pipe `%>%` at the end of the first line
(like `gapminder %>%`); putting the pipe at the beginning of the second
line will throw an error.

**Steps**

1.  Filter the `gapminder` data to retrieve only the observation from
    China in the year 2002.

``` r
# Filter for China in 2002
gapminder %>% 
  filter(country == "China") %>%
  filter(year == 2002)
```

    ## # A tibble: 1 × 6
    ##   country continent  year lifeExp        pop gdpPercap
    ##   <fct>   <fct>     <int>   <dbl>      <int>     <dbl>
    ## 1 China   Asia       2002    72.0 1280400000     3119.

Good work! This is a useful way to grab a single observation you’re
interested in.

## The arrange verb

Theory. Coming soon …

**1. The arrange verb**

In the last video you learned the filter verb, for extracting a subset
of your observations based on a condition. Now you’ll learn the arrange
verb.

**2. The arrange verb**

arrange sorts the observations in a dataset, in ascending or descending
order based on one of its variables. This is useful, for example, when
you want to know the most extreme values in a dataset.

**3. Sorting with arrange**

Just like filter, you use the arrange verb after the pipe operator. You
would type gapminder, then the pipe operator- percent, greater than,
percent- and then arrange. Within those parentheses, you tell it what
column you want to arrange by.The observations are now sorted in
ascending order, with the lowest GDP per capita appearing first. Look at
the rightmost column: notice that it starts with 241, the smallest value
in the dataset, then keeps increasing. You can see that the country-year
pair with the lowest GDP per capita was the Democratic Republic of the
Congo in 2002.Just like with filter, the gapminder object itself is
unchanged: arrange is just giving you a new, sorted dataset. Arrange
also lets you sort in descending order.

**4. Sorting in descending order**

To do that, you’d put the D-E-S-C- for descending- around the variable
you’re sorting by.This lets us see that the country-year pair with the
highest GDP per capita was Kuwait in the year 1957. Looking across all
countries and all years might not be that useful. Suppose you wanted to
find the highest GDP-per-capita countries in just one year.

**5. Filtering then arranging**

To do that, you can combine the two verbs you’ve already learned:
filter, and arrange.You start with the gapminder dataset, then a pipe to
give the dataset to filter. Then you specify that you want to filter for
year equals equals 2007. Then you use another pipe. This takes the
result of the filter, and gives it to arrange. You specify that you want
to sort in descending order of GDP per capita.This shows you that the
countries with the highest GDP per capita in 2007 were Norway, Kuwait,
Singapore, and the United States.We can explore many such questions with
various combinations of dplyr verbs. Over the course of these lessons,
you’ll learn to pipe together multiple simple operations to create a
rich and informative data analysis.

## Arranging observations by life expectancy

You use `arrange()` to sort observations in ascending or descending
order of a particular variable. In this case, you’ll sort the dataset
based on the `lifeExp` variable.

**Steps**

1.  Sort the `gapminder` dataset in ascending order of life expectancy
    (`lifeExp`).

``` r
# Sort in ascending order of lifeExp
gapminder %>% arrange(lifeExp)
```

    ## # A tibble: 1,704 × 6
    ##    country      continent  year lifeExp     pop gdpPercap
    ##    <fct>        <fct>     <int>   <dbl>   <int>     <dbl>
    ##  1 Rwanda       Africa     1992    23.6 7290203      737.
    ##  2 Afghanistan  Asia       1952    28.8 8425333      779.
    ##  3 Gambia       Africa     1952    30    284320      485.
    ##  4 Angola       Africa     1952    30.0 4232095     3521.
    ##  5 Sierra Leone Africa     1952    30.3 2143249      880.
    ##  6 Afghanistan  Asia       1957    30.3 9240934      821.
    ##  7 Cambodia     Asia       1977    31.2 6978607      525.
    ##  8 Mozambique   Africa     1952    31.3 6446316      469.
    ##  9 Sierra Leone Africa     1957    31.6 2295678     1004.
    ## 10 Burkina Faso Africa     1952    32.0 4469979      543.
    ## # … with 1,694 more rows

2.  Sort the `gapminder` dataset in descending order of life expectancy.

``` r
# Sort in descending order of lifeExp
gapminder %>% arrange(desc(lifeExp))
```

    ## # A tibble: 1,704 × 6
    ##    country          continent  year lifeExp       pop gdpPercap
    ##    <fct>            <fct>     <int>   <dbl>     <int>     <dbl>
    ##  1 Japan            Asia       2007    82.6 127467972    31656.
    ##  2 Hong Kong, China Asia       2007    82.2   6980412    39725.
    ##  3 Japan            Asia       2002    82   127065841    28605.
    ##  4 Iceland          Europe     2007    81.8    301931    36181.
    ##  5 Switzerland      Europe     2007    81.7   7554661    37506.
    ##  6 Hong Kong, China Asia       2002    81.5   6762476    30209.
    ##  7 Australia        Oceania    2007    81.2  20434176    34435.
    ##  8 Spain            Europe     2007    80.9  40448191    28821.
    ##  9 Sweden           Europe     2007    80.9   9031088    33860.
    ## 10 Israel           Asia       2007    80.7   6426679    25523.
    ## # … with 1,694 more rows

That’s right! Take a look at the countries with the highest and lowest
life expectancy- is it similar to what you expected?

## Filtering and arranging

You’ll often need to use the pipe operator (`%>%`) to combine multiple
dplyr verbs in a row. In this case, you’ll combine a `filter()` with an
`arrange()` to find the highest population countries in a particular
year.

**Steps**

1.  Use `filter()` to extract observations from just the year 1957, then
    use `arrange()` to sort in descending order of population (`pop`).

``` r
# Filter for the year 1957, then arrange in descending order of population
gapminder %>% 
  filter(year == 1957) %>%
  arrange(desc(pop))
```

    ## # A tibble: 142 × 6
    ##    country        continent  year lifeExp       pop gdpPercap
    ##    <fct>          <fct>     <int>   <dbl>     <int>     <dbl>
    ##  1 China          Asia       1957    50.5 637408000      576.
    ##  2 India          Asia       1957    40.2 409000000      590.
    ##  3 United States  Americas   1957    69.5 171984000    14847.
    ##  4 Japan          Asia       1957    65.5  91563009     4318.
    ##  5 Indonesia      Asia       1957    39.9  90124000      859.
    ##  6 Germany        Europe     1957    69.1  71019069    10188.
    ##  7 Brazil         Americas   1957    53.3  65551171     2487.
    ##  8 United Kingdom Europe     1957    70.4  51430000    11283.
    ##  9 Bangladesh     Asia       1957    39.3  51365468      662.
    ## 10 Italy          Europe     1957    67.8  49182000     6249.
    ## # … with 132 more rows

Great work! A lot of the exercises in this course will involve combining
multiple steps with the `%>%` operator.

## The mutate verb

Theory. Coming soon …

**1. The mutate verb**

You’ve already learned two verbs for manipulating data: filter for
extracting a subset of the observations, and arrange for sorting them.
Suppose

**2. The mutate verb**

you want to change one of the variables in your dataset, based on the
other ones. Or suppose you want to add a new variable. For that, you
would use the mutate verb. First you’ll learn how to change an existing
variable.

**3. Using mutate to change a variable**

You use mutate like you would filter or arrange, after a pipe operator.
Inside this mutate statement, what’s on the right of the equals sign is
what’s being calculated, and what’s on the left is what’s being
replaced. Here, you’re calculating pop slash one million. The slash in R
performs division, so “population divided by one million”. On the left,
you’re saying you want to replace the existing pop column, by writing
pop equals.The result is the same table, but with pop replaced with a
new value, one that’s much smaller than it was before. This is how you
manipulate existing variables in the table. That’s often necessary
during data processing and cleaning.Just like filter and arrange, you’re
not altering the original gapminder data, you’re just changing the value
in this new data frame that’s being returned. Alternatively,

**4. Using mutate to add a new variable**

you may want to add a new variable. For instance, you currently have the
GDP per capita: that’s the Gross Domestic Product of the country divided
by the current population. But in your analysis, you may want to know
the total GDP. You’d have to multiply the population by the GDP per
capita to find this.You would use mutate in almost the same way. You
pipe your gapminder data to the mutate verb. The asterisk in R
represents multiplication, so you write gdpPercap asterisk pop to
multiply the two columns. Notice that to be informative, we have named
the column gdp, that’s what’s to the left of the equals sign in our
code. Column names need to be one word like this: you can’t use
spaces.Notice that in the results, there’s a brand new gdp column, which
is much larger than the gdp per capita.

**5. Combining verbs**

Let’s put together the three verbs you learned in this chapter to answer
a question about our data. Suppose we wanted to know the countries with
the highest total GDP in the year 2007. We would do this in three steps-
create the column, filter for 2007, then sort.We use mutate to create
the total GDP column. Then we’d use filter to restrict our analysis to
only the year 2007. Then we’d use arrange to sort the data in descending
order of our new GDP variable.This gives us the answer we’re looking
for. The United States was the country with the highest total GDP in
2007, with a GDP of 13 trillion dollars. The US is followed by China,
Japan, India, and Germany as the highest GDP countries.Once you become
comfortable with dplyr, you’ll be able to find answers like these, and
answer much more complicated questions, on your own data.

## Using mutate to change or create a column

Suppose we want life expectancy to be measured in months instead of
years: you’d have to multiply the existing value by 12. You can use the
`mutate()` verb to change this column, or to create a new column that’s
calculated this way.

**Steps**

1.  Use `mutate()` to change the existing `lifeExp` column, by
    multiplying it by 12: `12 * lifeExp`.

``` r
# Use mutate to change lifeExp to be in months
gapminder %>% 
  mutate(lifeExp = 12 * lifeExp)
```

    ## # A tibble: 1,704 × 6
    ##    country     continent  year lifeExp      pop gdpPercap
    ##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
    ##  1 Afghanistan Asia       1952    346.  8425333      779.
    ##  2 Afghanistan Asia       1957    364.  9240934      821.
    ##  3 Afghanistan Asia       1962    384. 10267083      853.
    ##  4 Afghanistan Asia       1967    408. 11537966      836.
    ##  5 Afghanistan Asia       1972    433. 13079460      740.
    ##  6 Afghanistan Asia       1977    461. 14880372      786.
    ##  7 Afghanistan Asia       1982    478. 12881816      978.
    ##  8 Afghanistan Asia       1987    490. 13867957      852.
    ##  9 Afghanistan Asia       1992    500. 16317921      649.
    ## 10 Afghanistan Asia       1997    501. 22227415      635.
    ## # … with 1,694 more rows

2.  Use `mutate()` to add a new column, called `lifeExpMonths`,
    calculated as `12 * lifeExp`.

``` r
# Use mutate to create a new column called lifeExpMonths
gapminder %>%
  mutate(lifeExpMonths = 12 * lifeExp )
```

    ## # A tibble: 1,704 × 7
    ##    country     continent  year lifeExp      pop gdpPercap lifeExpMonths
    ##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>         <dbl>
    ##  1 Afghanistan Asia       1952    28.8  8425333      779.          346.
    ##  2 Afghanistan Asia       1957    30.3  9240934      821.          364.
    ##  3 Afghanistan Asia       1962    32.0 10267083      853.          384.
    ##  4 Afghanistan Asia       1967    34.0 11537966      836.          408.
    ##  5 Afghanistan Asia       1972    36.1 13079460      740.          433.
    ##  6 Afghanistan Asia       1977    38.4 14880372      786.          461.
    ##  7 Afghanistan Asia       1982    39.9 12881816      978.          478.
    ##  8 Afghanistan Asia       1987    40.8 13867957      852.          490.
    ##  9 Afghanistan Asia       1992    41.7 16317921      649.          500.
    ## 10 Afghanistan Asia       1997    41.8 22227415      635.          501.
    ## # … with 1,694 more rows

## Combining filter, mutate, and arrange

In this exercise, you’ll combine all three of the verbs you’ve learned
in this chapter, to find the countries with the highest life expectancy,
in months, in the year 2007.

**Steps**

1.  In one sequence of pipes on the `gapminder` dataset:
2.  `filter()` for observations from the year 2007,
3.  `mutate()` to create a column `lifeExpMonths`, calculated as
    `12 * lifeExp`, and
4.  `arrange()` in descending order of that new column

``` r
# Filter, mutate, and arrange the gapminder dataset
gapminder %>% 
  filter(year == 2007) %>%
  mutate(lifeExpMonths = 12 * lifeExp) %>%
  arrange(desc(lifeExpMonths))
```

    ## # A tibble: 142 × 7
    ##    country          continent  year lifeExp       pop gdpPercap lifeExpMonths
    ##    <fct>            <fct>     <int>   <dbl>     <int>     <dbl>         <dbl>
    ##  1 Japan            Asia       2007    82.6 127467972    31656.          991.
    ##  2 Hong Kong, China Asia       2007    82.2   6980412    39725.          986.
    ##  3 Iceland          Europe     2007    81.8    301931    36181.          981.
    ##  4 Switzerland      Europe     2007    81.7   7554661    37506.          980.
    ##  5 Australia        Oceania    2007    81.2  20434176    34435.          975.
    ##  6 Spain            Europe     2007    80.9  40448191    28821.          971.
    ##  7 Sweden           Europe     2007    80.9   9031088    33860.          971.
    ##  8 Israel           Asia       2007    80.7   6426679    25523.          969.
    ##  9 France           Europe     2007    80.7  61083916    30470.          968.
    ## 10 Canada           Americas   2007    80.7  33390141    36319.          968.
    ## # … with 132 more rows

Great work! Notice how you can combine several `dplyr` operations to
answer a more complicated question like this.

# 2. Data visualization

Often a better way to understand and present data as a graph. In this
chapter, you’ll learn the essential skills of data visualization using
the ggplot2 package, and you’ll see how the dplyr and ggplot2 packages
work closely together to create informative graphs.

## Visualizing with ggplot2

Theory. Coming soon …

**1. Visualizing with ggplot2**

In the last chapter, you used the dplyr package to answer some questions
about the gapminder dataset. You’ve been able to filter for particular
observations, arrange to find the highest or lowest values, and mutate
to add new columns.However, so far you’ve engaged with the results only
as a table printed out from your code. Often a better way to understand
and present this kind of data is as a graph.

**2. Data visualization**

In this chapter, you’ll learn the essential skill of data visualization
using the ggplot2 package. In particular, this chapter will show you how
to create scatterplots, like the one you see here, that compare two
variables on an x- and y- axis.Visualization and data wrangling are
often intertwined, so you’ll see how the dplyr and ggplot2 packages work
closely together to create informative graphs.

**3. Variable Assignment**

In this chapter, you’ll mostly be visualizing subsets of the gapminder
dataset. For example, you’ll often be visualizing only data from 2007.
When you’re working with just that subset, it’s useful to save the
filtered data, as a new data frame.To do this, you use the assignment
operator. This is a less then and a minus sign, like an arrow facing to
the left. In this operation, you’re taking the gapminder dataset,
filtering it for the observations from the year 2007, and then saving
it- with that arrow going to the left- into a dataset called gapminder
underscore 2007.Now if you print the gapminder_2007 dataset, we can see
that it’s another table. But this one has only 142 rows, and they come
only from the year 2007. Now that you’ve saved this variable, you can
use it to create our visualization.

**4. Visualizing with ggplot2**

Suppose you want to examine the relationship between a country’s wealth
and its life expectancy. You could do this with a scatterplot comparing
two variables in our gapminder dataset: GDP per capita on the X axis and
life expectancy on the y-axis.You’ll be creating this plot using the
ggplot2 package. Just like the gapminder and dplyr packages, you’ll have
to load it with library parentheses ggplot2 end parentheses first.This
is the code to create this scatterplot. There are three parts to a
ggplot graph. First is the data that we’re visualizing. In this case,
that is the gapminder_2007 variable you just created.Second is the
mapping of variables in your dataset to aesthetics in your graph. An
aesthetic is a visual dimension of a graph that can be used to
communicate information. In a scatterplot, your two dimensions are the x
axis and the y axis, so you write aes (for “aesthetic”), parentheses, x
equals gdpPerCap, y = lifeExp, telling it which variables to place on
which axes.The third step is specifying the type of graph you’re
creating. You do that by adding a layer to the graph: use a plus after
the ggplot, and then geom underscore point. The “geom” means you’re
adding a type of geometric object to the graph, the “point” indicates
it’s a scatter plot, where each observation corresponds to one point.
Together, these three parts of the code- the data, the aesthetic
mapping, and the layer- construct the scatter plot you see here.In the
exercises, you’ll practice creating other scatter plots to compare
variables across countries, and in the rest of this chapter you’ll learn
more ways to communicate information in a graph.

## Variable assignment

Throughout the exercises in this chapter, you’ll be visualizing a subset
of the gapminder data from the year 1952. First, you’ll have to load the
ggplot2 package, and create a `gapminder_1952` dataset to visualize.

*By the way, if you haven’t downloaded it already, check out the
<a href="https://datacamp-community-prod.s3.amazonaws.com/c1fae72f-d2d7-4646-9dce-dd0f8fb5c5e8" target="_blank" rel="noopener noreferrer">tidyverse
for beginners Cheat Sheet</a>. It includes an overview of the most
important concepts, functions and methods and might come in handy if you
ever need a quick refresher!*

**Steps**

1.  Load the `ggplot2` package after the gapminder and dplyr packages.
2.  Filter `gapminder` for observations from the year 1952, and assign
    it to a new dataset `gapminder_1952` using the assignment operator
    (`<-`).

``` r
# Load the ggplot2 package as well
library(ggplot2)

# Create gapminder_1952
gapminder_1952 <- gapminder %>%
                    filter(year == 1952)
```

Great! If you typed `gapminder_1952` now, you’d see the filtered
dataset.

## Comparing population and GDP per capita

In the video you learned to create a scatter plot with GDP per capita on
the x-axis and life expectancy on the y-axis (the code for that graph
has been provided in the exercise code). When you’re exploring data
visually, you’ll often need to try different combinations of variables
and aesthetics.

**Steps**

1.  Change the scatter plot of `gapminder_1952` so that (`pop`) is on
    the x-axis and GDP per capita (`gdpPercap`) is on the y-axis.

``` r
# Change to put pop on the x-axis and gdpPercap on the y-axis
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) +
  geom_point()
```

![](readme_files/figure-gfm/unnamed-chunk-11-1.png)<!-- -->

Great work on your first graph! Each point represents a country: can you
guess which country any of the points are?

## Comparing population and life expectancy

In this exercise, you’ll use `ggplot2` to create a scatter plot from
scratch, to compare each country’s population with its life expectancy
in the year 1952.

**Steps**

1.  Create a scatter plot of `gapminder_1952` with population (`pop`) is
    on the x-axis and life expectancy (`lifeExp`) on the y-axis.

``` r
# Create a scatter plot with pop on the x-axis and lifeExp on the y-axis
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point()
```

![](readme_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

Great! You might notice the points are crowded towards the left side of
the plot, making them hard to distinguish. This next video will help
solve that problem.

## Log scales

Theory. Coming soon …

## Putting the x-axis on a log scale

You previously created a scatter plot with population on the x-axis and
life expectancy on the y-axis. Since population is spread over several
orders of magnitude, with some countries having a much higher population
than others, it’s a good idea to put the x-axis on a log scale.

**Steps**

1.  Change the existing scatter plot (code provided) to put the x-axis
    (representing population) on a log scale.

``` r
# Change this plot to put the x-axis on a log scale
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() + 
  scale_x_log10()
```

![](readme_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

Great! Notice the points are more spread out on the x-axis. This makes
it easy to see that there isn’t a correlation between population and
life expectancy.

## Putting the x- and y- axes on a log scale

Suppose you want to create a scatter plot with population on the x-axis
and GDP per capita on the y-axis. Both population and GDP per-capita are
better represented with log scales, since they vary over many orders of
magnitude.

**Steps**

1.  Create a scatter plot with population (`pop`) on the x-axis and GDP
    per capita (`gdpPercap`) on the y-axis. Put **both** the x- and y-
    axes on a log scale.

``` r
# Scatter plot comparing pop and gdpPercap, with both axes on a log scale
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) +
  geom_point() +
  scale_x_log10() + 
  scale_y_log10()
```

![](readme_files/figure-gfm/unnamed-chunk-14-1.png)<!-- -->

Great! Notice that the y-axis goes from 1e3 (1000) to 1e4 (10,000) to
1e5 (100,000) in equal increments.

## Additional aesthetics

Theory. Coming soon …

**1. Additional aesthetics**

You’ve learned how to create a scatter plot to compare

**2. Scatter plots**

two variables within your data using two visual aesthetics: GDP per
capita on the x-axis, and life expectancy on the y-axis. But

**3. Additional variables**

these aren’t the only variables in the gapminder dataset: for example,
you also have continent and population. You may want to examine
relationships among all these variables in the same plot. You already
used the x-axis to represent GDP per capita and the y-axis to represent
life expectancy. Now you’ll learn to add two more aesthetics- color and
size- to communicate even more information in your scatter plot.
Continent is a categorical variable: it has a few specific values, such
as Asia and Europe. A good way to represent a categorical variable in a
scatterplot

**4. The color aesthetic**

is the color of your points, like you see here. To use this aesthetic,
you add color equals continent inside the aes, next to x equals
gdpPercap and y equals life expectancy. The code is otherwise the same,
including the plus geom_point and the + scale x log10. Notice that that
ggplot2 automatically adds a legend to the plot, indicating which color
represents which continent. This communicates a lot about differences
between continents. The average life expectancy and GDP per capita tends
to be lowest for African countries, shown in red, and highest for
European countries, shown in blue. Another variable you may want to
include in the graph is population, represented by the pop variable in
the dataset. This is a numeric variable, so a good way to represent it
is with the size

**5. The size aesthestic**

of the points in the scatterplot, with higher population countries
getting larger points. Just like x, y, and color, you add size = pop
within the aes parentheses. Note that to keep the length of each of the
code lines reasonable, we put the size aesthetic on a second line, but
this doesn’t make any difference, and you don’t have to do that in the
exercises.

**6. Aesthetics**

You’ve now learned to use four aesthetics in a plot: x, y, color, and
size: to communicate information about four variables in your dataset.
In the exercises,

**7. Let’s practice!**

you’ll learn to mix and match aesthetics and variables to further
explore the statistical state of the world within one year.

## Adding color to a scatter plot

In this lesson you learned how to use the color aesthetic, which can be
used to show which continent each point in a scatter plot represents.

**Steps**

1.  Create a scatter plot with population (`pop`) on the x-axis, life
    expectancy (`lifeExp`) on the y-axis, and with continent
    (`continent`) represented by the color of the points. Put the x-axis
    on a log scale.

``` r
# Scatter plot comparing pop and lifeExp, with color representing continent
ggplot(gapminder_1952, aes(x = pop, y = lifeExp, color = continent)) +
  geom_point() +
  scale_x_log10() +
  scale_y_log10()
```

![](readme_files/figure-gfm/unnamed-chunk-15-1.png)<!-- -->

Good work! What differences can you see between continents, in terms of
their population and life expectancy?

## Adding size and color to a plot

In the last exercise, you created a scatter plot communicating
information about each country’s population, life expectancy, and
continent. Now you’ll use the size of the points to communicate even
more.

**Steps**

1.  Modify the scatter plot so that the size of the points represents
    each country’s GDP per capita (`gdpPercap`).

``` r
# Add the size aesthetic to represent a country's gdpPercap
ggplot(gapminder_1952, aes(x = pop, y = lifeExp, color = continent, size = gdpPercap)) +
  geom_point() +
  scale_x_log10()
```

![](readme_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

Good work! Are you able to guess which point represents your own
country?

## Faceting

Theory. Coming soon …

**1. Faceting**

You’ve learned to use color

**2. Plot Life Expectancy vs GDP**

to distinguish the five continents within your scatterplot. Now you’ll
learn about another way to explore your data in terms of this kind of
categorical variable.

**3. Faceting**

ggplot2 lets you divide your plot into subplots to get one smaller graph
for each continent: Africa, the Americas, and so on. This is called
faceting, and it’s another powerful way to communicate relationships
within your data. You facet a plot by adding another option, with a +,
to the end of your code, after geom_point and scale_x\_log10. You add
facet underscore wrap, then “tilde continent” within the parentheses. In
R, the tilde symbol typically means “by”, meaning that we’re splitting
the plot by continent, and you can usually find it on the upper left of
your keyboard. This tells ggplot2 to divide the data into subplots based
on the continent variable. Faceting is a powerful tool, and in

**4. Faceting Plots**

the exercises you’ll see how you can use faceting not just to compare
among continents, but to compare between all of the years in our
dataset.

## Creating a subgraph for each continent

You’ve learned to use faceting to divide a graph into subplots based on
one of its variables, such as the continent.

**Steps**

1.  Create a scatter plot of `gapminder_1952` with the x-axis
    representing population (`pop`), the y-axis representing life
    expectancy (`lifeExp`), and faceted to have one subplot per
    continent (`continent`). Put the x-axis on a log scale.

``` r
# Scatter plot comparing pop and lifeExp, faceted by continent
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() + 
  scale_x_log10() + 
  facet_wrap(~ continent)
```

![](readme_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

Great work! Faceting is a powerful way to understand subsets of your
data separately.

## Faceting by year

All of the graphs in this chapter have been visualizing statistics
within one year. Now that you’re able to use faceting, however, you can
create a graph showing **all** the country-level data from 1952 to 2007,
to understand how global statistics have changed over time.

**Steps**

1.  Create a scatter plot of the `gapminder` data:
2.  Put GDP per capita (`gdpPercap`) on the x-axis and life expectancy
    (`lifeExp`) on the y-axis, with continent (`continent`) represented
    by color and population (`pop`) represented by size.
3.  Put the x-axis on a log scale
4.  Facet by the `year` variable

``` r
# Scatter plot comparing gdpPercap and lifeExp, with color representing continent
# and size representing population, faceted by year
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) + 
  geom_point() +
  scale_x_log10() + 
  facet_wrap(~ year)
```

![](readme_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

Awesome! That’s a lot of information you’re now able to share in one
graph.

# 3. Grouping and summarizing

So far you’ve been answering questions about individual country-year
pairs, but you may be interested in aggregations of the data, such as
the average life expectancy of all countries within each year. Here
you’ll learn to use the group by and summarize verbs, which collapse
large datasets into manageable summaries.

## The summarize verb

Theory. Coming soon …

**1. The summarize verb**

In this chapter, you’ll return to the topic of data transformation with
dplyr to learn more ways to explore your data.

**2. Data transformation and visualization**

Analyses will usually involve a cycle between these steps of data
transformation and visualization, as well as additional components of
the data science workflow, like modeling, that you’ll learn about in
other DataCamp courses.Once you’ve learned these new verbs, you’ll be
able to create a much larger variety of informative visualizations with
ggplot2. You’ve learned to use the

**3. Extracting data**

filter verb to pull out individual observations, such as statistics for
the United States in 2007. Now you’ll learn how to summarize many
observations into a single data point.

**4. The summarize verb**

For example, suppose you want to know the average life expectancy across
all countries and years in the dataset.You would do this with the
summarize verb. Take your gapminder data, pipe it into summarize, and
specify that you’re creating a summary column called meanLifeExp. The
“mean parentheses lifeexp end parentheses” there is worth examining.
This is calling the function mean on the variable lifeExp. The mean
function takes the average of a set of values, and R comes with many
built-in functions like this.Notice that summarize collapses the entire
table down into one row. In the output, we see the answer to our
question: the mean life expectancy was about 59.47 years.If you think
about it, it doesn’t really make sense to summarize across all countries
and across all years. It may make more sense to ask questions about
averages in a particular year, such as 2007.

**5. Summarizing one year**

To answer this, you can combine the summarize verb with filter: filter
your data for a particular year first, then summarize the result. This
shows you that the average life expectancy in the year 2007 was about 67
years. You can create multiple summaries at once with the summarize
verb.

**6. Summarizing into multiple columns**

For example, suppose that along with finding the average life expectancy
in 2007, you want to find the total population in that year.To do that,
you add a comma after the mean of the life expectancy, and specify
another column that you’re creating. You could give it a useful name
like totalPop, and say that it’s equal to the sum- that’s another
built-in function- of the pop variable.

**7. Functions you can use for summarizing**

mean and sum are just two of the built-in functions you could use to
summarize a variable within a dataset. Another example is median: the
median represents the point in a set of numbers where half the numbers
are above that point and half of the numbers are below. Two others are
min, for minimum, and max, for maximum. In the exercises, you’ll use
several of these functions to answer questions about the gapminder
dataset.

## Summarizing the median life expectancy

You’ve seen how to find the mean life expectancy and the total
population across a set of observations, but `mean()` and `sum()` are
only two of the functions R provides for summarizing a collection of
numbers. Here, you’ll learn to use the `median()` function in
combination with `summarize()`.

By the way, `dplyr` displays some messages when it’s loaded that we’ve
been hiding so far. They’ll show up in red and start with:

``` r
`Attaching package: 'dplyr'

The following objects are masked from 'package:stats':
```

This will occur in future exercises each time you load `dplyr`: it’s
mentioning some built-in functions that are overwritten by `dplyr`. You
won’t need to worry about this message within this course.

**Steps**

1.  Use the `median()` function within a `summarize()` to find the
    median life expectancy. Save it into a column called
    `medianLifeExp`.

``` r
# Summarize to find the median life expectancy
gapminder %>% 
    summarize(medianLifeExp = median(lifeExp))
```

    ## # A tibble: 1 × 1
    ##   medianLifeExp
    ##           <dbl>
    ## 1          60.7

That’s right! Note that this is the median across all countries and all
years in the dataset.

## Summarizing the median life expectancy in 1957

Rather than summarizing the entire dataset, you may want to find the
median life expectancy for only one particular year. In this case,
you’ll find the median in the year 1957.

**Steps**

1.  Filter for the year 1957, then use the `median()` function within a
    `summarize()` to calculate the median life expectancy into a column
    called `medianLifeExp`.

``` r
# Filter for 1957 then summarize the median life expectancy
gapminder %>% 
  filter(year == 1957) %>%
  summarize(medianLifeExp = median(lifeExp))
```

    ## # A tibble: 1 × 1
    ##   medianLifeExp
    ##           <dbl>
    ## 1          48.4

Great! Just like in Chapter 1, this chapter will often involve
performing multiple `dplyr` steps in a row.

## Summarizing multiple variables in 1957

The `summarize()` verb allows you to summarize multiple variables at
once. In this case, you’ll use the `median()` function to find the
median life expectancy and the `max()` function to find the maximum GDP
per capita.

**Steps**

1.  Find both the median life expectancy (`lifeExp`) and the maximum GDP
    per capita (`gdpPercap`) in the year 1957, calling them
    `medianLifeExp` and `maxGdpPercap` respectively. You can use the
    `max()` function to find the maximum.

``` r
# Filter for 1957 then summarize the median life expectancy and the maximum GDP per capita
gapminder %>% 
  filter(year == 1957) %>%
  summarize(medianLifeExp = median(lifeExp), 
            maxGdpPercap  = max(gdpPercap))
```

    ## # A tibble: 1 × 2
    ##   medianLifeExp maxGdpPercap
    ##           <dbl>        <dbl>
    ## 1          48.4      113523.

That’s right! Think about what other kinds of information about
countries you might want to summarize within one year.

## The group_by verb

Theory. Coming soon …

**1. The group_by verb**

In the last set of exercises, you learned to use the

**2. The summarize verb**

summarize verb to answer questions about the entire dataset, or about a
particular year. For example, here you’re finding the average life
expectancy and the total population in the year 2007. What if we weren’t
interested just in the average for the year 2007, but for each of the
years in the dataset? You could rerun this code and change the year each
time, but that’s very tedious. Instead, you can use the group_by verb,
which tells dplyr to summarize within groups instead of summarizing the
entire dataset.

**3. Summarizing by year**

Notice that this replaces the filter year equals 2007 with group_by
year. group_by(year) tells the summarize step that it should perform the
summary within each year: within 1952, then within 1957, then within
1962, and combine the results. Instead of getting one row overall, you
now get one row for each year. There’s now a year variable along with
the new meanLifeExp and totalPop variables. This shows us that the total
population started at 2-point-4 billion, and went up to 6-point-25
billion in 2007. We can also see that average life expectancy went up
from 49 years in 1952 to 67. You can summarize by other variables
besides year. Suppose you’re

**4. Summarizing by continent**

interested in the average life expectancy and the total population in
2007 within each continent. You can find this by first filtering for the
year 2007, grouping by continent (instead of year), and then performing
your summary. This results in a table with one row for each continent,
with columns for mean life expectancy and total population. We can see
that Europe and Oceania have the highest life expectancy, and that Asia
and Africa are lower. Now that you’ve calculated these statistics for
each continent in 2007, you might be interested in how they changed for
each continent over time.

**5. Summarizing by continent and year**

To do so, you can summarize by both year and continent, by adding year
comma continent within the group by. Now the output has one row for each
combination of a year and continent. For example, we see the total
population and average life expectancy in 1952 for Africa, the Americas,
Asia, Europe, and Oceania, followed by each of the continent-level
summaries for 1957. In the next video, you’ll learn how to visualize
this per-year, per-continent data to understand trends over time.

## Summarizing by year

In a previous exercise, you found the median life expectancy and the
maximum GDP per capita in the year 1957. Now, you’ll perform those two
summaries within each year in the dataset, using the `group_by` verb.

**Steps**

1.  Find the median life expectancy (`lifeExp`) and maximum GDP per
    capita (`gdpPercap`) **within each year**, saving them into
    `medianLifeExp` and `maxGdpPercap`, respectively.

``` r
# Find median life expectancy and maximum GDP per capita in each year
gapminder %>% 
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp), 
            maxGdpPercap  = max(gdpPercap))
```

    ## # A tibble: 12 × 3
    ##     year medianLifeExp maxGdpPercap
    ##    <int>         <dbl>        <dbl>
    ##  1  1952          45.1      108382.
    ##  2  1957          48.4      113523.
    ##  3  1962          50.9       95458.
    ##  4  1967          53.8       80895.
    ##  5  1972          56.5      109348.
    ##  6  1977          59.7       59265.
    ##  7  1982          62.4       33693.
    ##  8  1987          65.8       31541.
    ##  9  1992          67.7       34933.
    ## 10  1997          69.4       41283.
    ## 11  2002          70.8       44684.
    ## 12  2007          71.9       49357.

Great! Interesting: notice that median life expectancy across countries
is generally going up over time, but maximum GDP per capita is not.

## Summarizing by continent

You can group by any variable in your dataset to create a summary.
Rather than comparing across time, you might be interested in comparing
among continents. You’ll want to do that within one year of the dataset:
let’s use 1957.

**Steps**

1.  Filter the `gapminder` data for the year 1957. Then find the median
    life expectancy (`lifeExp`) and maximum GDP per capita (`gdpPercap`)
    **within each continent**, saving them into `medianLifeExp` and
    `maxGdpPercap`, respectively.

``` r
# Find median life expectancy and maximum GDP per capita in each continent in 1957
gapminder %>%
  filter(year == 1957) %>%
  group_by(continent) %>%
  summarize(medianLifeExp = median(lifeExp), 
            maxGdpPercap  = max(gdpPercap))
```

    ## # A tibble: 5 × 3
    ##   continent medianLifeExp maxGdpPercap
    ##   <fct>             <dbl>        <dbl>
    ## 1 Africa             40.6        5487.
    ## 2 Americas           56.1       14847.
    ## 3 Asia               48.3      113523.
    ## 4 Europe             67.6       17909.
    ## 5 Oceania            70.3       12247.

Great work! Which continent had the highest median life expectancy in
1957?

## Summarizing by continent and year

Instead of grouping just by year, or just by continent, you’ll now group
by both continent and year to summarize within each.

**Steps**

1.  Find the median life expectancy (`lifeExp`) and maximum GDP per
    capita (`gdpPercap`) **within each combination of continent and
    year**, saving them into `medianLifeExp` and `maxGdpPercap`,
    respectively.

``` r
# Find median life expectancy and maximum GDP per capita in each continent/year combination
gapminder %>%
  group_by(continent, year) %>%
  summarise(medianLifeExp = median(lifeExp),
            maxGdpPercap  = max(gdpPercap))
```

    ## `summarise()` has grouped output by 'continent'. You can override using the
    ## `.groups` argument.

    ## # A tibble: 60 × 4
    ## # Groups:   continent [5]
    ##    continent  year medianLifeExp maxGdpPercap
    ##    <fct>     <int>         <dbl>        <dbl>
    ##  1 Africa     1952          38.8        4725.
    ##  2 Africa     1957          40.6        5487.
    ##  3 Africa     1962          42.6        6757.
    ##  4 Africa     1967          44.7       18773.
    ##  5 Africa     1972          47.0       21011.
    ##  6 Africa     1977          49.3       21951.
    ##  7 Africa     1982          50.8       17364.
    ##  8 Africa     1987          51.6       11864.
    ##  9 Africa     1992          52.4       13522.
    ## 10 Africa     1997          52.8       14723.
    ## # … with 50 more rows

Excellent! In the next chapter, you’ll learn to turn this data into an
informative graph.

## Visualizing summarized data

Theory. Coming soon …

**1. Visualizing summarized data**

In this chapter you learned to use the group by and summarize verbs to
summarize the gapminder data by year, by continent, or by both. Now
you’ll learn how to turn those summaries into informative
visualizations, by returning to the ggplot2 package from Chapter 2.

**2. Summarizing by year**

In the last video we summarized data by year, to find the change in
population and in mean life expectancy over time. Now instead of viewing
the summarized data as a table, let’s save it as an object called
by_year, so you can visualize the data using ggplot2. You would

**3. Visualizing population over time**

construct the graph with the three steps of ggplot2: the data, which is
by_year. The aesthetics, which puts year on the x-axis and total
population on the y-axis. And the type of graph, which in this case is a
scatter plot, represented by geom_point. Notice that the steps are the
same as when you were graphing countries in a scatter plot, even though
it’s a new dataset. The resulting graph of population by year shows the
change in the total population, which is going up over time. ggplot2
puts the y-axis is in scientific notation, since showing it with nine
zeros would be hard to read. The global starts a little under 3 times 10
to the 9th power- that’s three billion- and goes up to more than 6
billion. You might notice that the graph is a little misleading because
it doesn’t include zero: you don’t have a sense of how much the
population grew relative to where it was when it started. This is a good
time to introduce another graphing option.

**4. Starting y-axis at zero**

By adding “expand underscore limits y = 0” to the end of the ggplot
call, you can specify that you want the y-axis to start at zero. Notice
that you added it to the end just like you would with scale_x\_log10, or
facet_wrap. Now the graph makes it clearer that the population is almost
tripling during this time. You could have created other graphs of
summarized data, such as a graph of the average life expectancy over
time, by changing the y aesthetic. So

**5. Summarizing by year and continent**

far you’ve been graphing the by-year summarized data. But you have also
learned to summarize after grouping by both year and continent, to see
how the changes in population have occurred separately within each
continent. Since you now have data over time within each continent, you
need a way to separate it in a visualization. To do that you can use the
color aesthetic

**6. Visualizing population by year and continent**

you learned about in chapter two. By setting color equals continent, you
can show five separate trends on the same graph. This lets us see that
Asia was always the most populated continent and has been growing the
most rapidly, that Europe has a slower rate of growth, and that Africa
has grown to surpass both Europe and the Americas in terms of
population. In Chapter 4 you’ll learn to turn these into line plots that
are a bit better for presenting data over time. You’ll often combine
dplyr verbs and ggplot2 visualizations as part of an exploratory
analysis, so it’s important to get into the habit of visualizing
summarized or processed data.

## Visualizing median life expectancy over time

In the last chapter, you summarized the gapminder data to calculate the
median life expectancy within each year. This code is provided for you,
and is saved (with `<-`) as the `by_year` dataset.

Now you can use the ggplot2 package to turn this into a visualization of
changing life expectancy over time.

**Steps**

1.  Use the `by_year` dataset to create a scatter plot showing the
    change of median life expectancy over time, with `year` on the
    x-axis and `medianLifeExp` on the y-axis. Be sure to add
    `expand_limits(y = 0)` to make sure the plot’s y-axis includes zero.

``` r
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))

# Create a scatter plot showing the change in medianLifeExp over time
ggplot(by_year, aes(x = year, y = medianLifeExp)) +
  geom_point() +
  expand_limits(y = 0)
```

Great! It looks like median life expectancy across countries is
increasing over time.

## Visualizing median GDP per capita per continent over time

In the last exercise you were able to see how the median life expectancy
of countries changed over time. Now you’ll examine the median GDP per
capita instead, and see how the trend differs among continents.

**Steps**

1.  Summarize the gapminder dataset by continent and year, finding the
    median GDP per capita (`gdpPercap`) within each and putting it into
    a column called `medianGdpPercap`. Use the assignment operator \`
2.  Create a scatter plot showing the change in `medianGdpPercap` by
    continent over time. Use color to distinguish between continents,
    and be sure to add `expand_limits(y = 0)` so that the y-axis starts
    at zero.

``` r
# Summarize medianGdpPercap within each continent within each year: by_year_continent
by_year_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Plot the change in medianGdpPercap in each continent over time
ggplot(by_year_continent, aes(x = year, y = medianGdpPercap, color = continent)) +
  geom_point() +
  expand_limits(y = 0)
```

Great! You might be wondering how you can connect these points with
lines. You’ll learn that in Chapter 4!

## Comparing median life expectancy and median GDP per continent in 2007

In these exercises you’ve generally created plots that show change over
time. But as another way of exploring your data visually, you can also
use ggplot2 to plot summarized data to compare continents within a
single year.

**Steps**

1.  Filter the gapminder dataset for the year 2007, then summarize the
    median GDP per capita and the median life expectancy **within each
    continent**, into columns called `medianLifeExp` and
    `medianGdpPercap`. Save this as `by_continent_2007`.
2.  Use the `by_continent_2007` data to create a scatterplot comparing
    these summary statistics for continents in 2007, putting the median
    GDP per capita on the x-axis to the median life expectancy on the
    y-axis. Color the scatter plot by `continent`. You don’t need to add
    `expand_limits(y = 0)` for this plot.

``` r
# Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap),
            medianLifeExp = median(lifeExp))

# Use a scatter plot to compare the median GDP and median life expectancy
ggplot(by_continent_2007, aes(x = medianGdpPercap, y = medianLifeExp, color = continent)) +
  geom_point()
```

Great work! Scatter plots are a very flexible tool for examining
relationships.

# 4. Types of visualizations

In this chapter, you’ll learn how to create line plots, bar plots,
histograms, and boxplots. You’ll see how each plot requires different
methods of data manipulation and preparation, and you’ll understand how
each of these plot types plays a different role in data analysis.

## Line plots

Theory. Coming soon …

**1. Line plots**

The graphs you’ve made so far in this course have all been

**2. Life Expectancy vs GDP**

scatter plots, like this one. These are useful for comparing two
variables, such as GDP per capita and life expectancy, with each point
representing one observation.But there are many other types of graphs
you can make with ggplot2, each of which is useful for visualizing a
particular type of data. In

**3. Types of plots**

this chapter, you’ll learn to make four more types of graphs.You’ll make
line plots, which are useful for showing change over time. You’ll create
bar plots, which are good at comparing statistics for each of several
categories. You’ll learn to make histograms, which describe the
distribution of a one-dimensional numeric variable. And you’ll make box
plots, which compare the distribution of a numeric variable among
several categories.You’ll see how the R code to create each is similar
to a scatter plot, where you map variables in your data, like life
expectancy and GDP, to visual aesthetics, such as x and y. Once you
master this approach, you’ll be able to visualize your data in many ways
besides the ones taught in this course.

**4. Scatter vs line plot**

You’ll start by making a line plot, for visualizing a change over time.
In the last chapter, you created a plot like this to show the mean life
expectancy in each continent in each year. You can get a sense of the
trends from this plot. But it’s a bit easier to understand as a line
plot, where the observations within each continent are connected. This
makes it clearer that what we care about is the upward or downward trend
over time.The way you make a line plot is to change one part of the
code. geom_point was the part of the code that specified you were making
a scatter plot. Simply change that to geom_line to make a line plot. So
this is

**5. Line plot**

how you make a line plot. Most of it looks exactly the same as a scatter
plot: provide the data you’re plotting, the aesthetics of x, y, and
color, and end with expand_limits(y = 0). The only difference is the
type of plot: geom underscore line.In the exercises, you’ll use code
like this to generate several visualizations of change over time.

## Visualizing median GDP per capita over time

A line plot is useful for visualizing trends over time. In this
exercise, you’ll examine how the median GDP per capita has changed over
time.

**Steps**

1.  Use `group_by()` and `summarize()` to find the median GDP per capita
    **within each year**, calling the output column `medianGdpPercap`.
    Use the assignment operator \`
2.  Use the `by_year` dataset to create a line plot showing the change
    in median GDP per capita over time. **Be sure** to use
    `expand_limits(y = 0)` to include 0 on the y-axis.

``` r
# Summarize the median gdpPercap by year, then save it as by_year
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Create a line plot showing the change in medianGdpPercap over time
ggplot(by_year, aes(x = year, y = medianGdpPercap)) +
  geom_line() +
  expand_limits(y = 0)
```

![](readme_files/figure-gfm/unnamed-chunk-29-1.png)<!-- -->

Great! Looks like median GDP per capita across countries has gone up
over time.

## Visualizing median GDP per capita per continent over time

In the last exercise you were able to see how the median life expectancy
of countries changed over time. Now you’ll examine the median GDP per
capita instead, and see how the trend differs among continents.

**Steps**

1.  Summarize the gapminder dataset by continent and year, finding the
    median GDP per capita (`gdpPercap`) within each and putting it into
    a column called `medianGdpPercap`. Use the assignment operator `<-`
    to save this summarized data as `by_year_continent`.
2.  Create a scatter plot showing the change in `medianGdpPercap` by
    continent over time. Use color to distinguish between continents,
    and be sure to add `expand_limits(y = 0)` so that the y-axis starts
    at zero.

``` r
# Summarize medianGdpPercap within each continent within each year: by_year_continent
by_year_continent <- gapminder %>%
  group_by(continent, year) %>%
  summarize(medianGdpPercap = median(gdpPercap))
```

    ## `summarise()` has grouped output by 'continent'. You can override using the
    ## `.groups` argument.

``` r
# Plot the change in medianGdpPercap in each continent over time
ggplot(by_year_continent, aes(x = year, y = medianGdpPercap, color = continent)) + 
  geom_point() + 
  expand_limits(y = 0)
```

![](readme_files/figure-gfm/unnamed-chunk-30-1.png)<!-- -->

Excellent work! Take a look at the plot: did the growth in median GDP
per capita differ between continents?

## Comparing median life expectancy and median GDP per continent in 2007

In these exercises you’ve generally created plots that show change over
time. But as another way of exploring your data visually, you can also
use ggplot2 to plot summarized data to compare continents within a
single year.

**Steps**

-   Filter the gapminder dataset for the year 2007, then summarize the
    median GDP per capita and the median life expectancy **within each
    continent**, into columns called `medianLifeExp` and
    `medianGdpPercap`. Save this as `by_continent_2007`.
-   Use the `by_continent_2007` data to create a scatterplot comparing
    these summary statistics for continents in 2007, putting the median
    GDP per capita on the x-axis to the median life expectancy on the
    y-axis. Color the scatter plot by `continent`. You don’t need to add
    `expand_limits(y = 0)` for this plot.

``` r
# Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 <- gapminder %>% 
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(medianLifeExp = median(lifeExp), medianGdpPercap = median(gdpPercap))

# Use a scatter plot to compare the median GDP and median life expectancy
ggplot(by_continent_2007, aes(x = medianGdpPercap, y = medianLifeExp, color = continent)) + 
  geom_point() + 
  expand_limits(y = 0)
```

![](readme_files/figure-gfm/unnamed-chunk-31-1.png)<!-- -->

## Visualizing median GDP per capita over time

A line plot is useful for visualizing trends over time. In this
exercise, you’ll examine how the median GDP per capita has changed over
time.

**Steps**

-   Use `group_by()` and `summarize()` to find the median GDP per capita
    **within each year**, calling the output column `medianGdpPercap`.
    Use the assignment operator `<-` to save it to a dataset called
    `by_year`.
-   Use the `by_year` dataset to create a line plot showing the change
    in median GDP per capita over time. **Be sure** to use
    `expand_limits(y = 0)` to include 0 on the y-axis.

``` r
# Summarize the median gdpPercap by year, then save it as by_year
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Create a line plot showing the change in medianGdpPercap over time
ggplot(by_year, aes(x = year, y = medianGdpPercap)) +
  geom_line() +
  expand_limits(y = 0)
```

![](readme_files/figure-gfm/unnamed-chunk-32-1.png)<!-- -->

## Visualizing median GDP per capita by continent over time

In the last exercise you used a line plot to visualize the increase in
median GDP per capita over time. Now you’ll examine the change within
each continent.

**Steps**

-   Use `group_by()` and `summarize()` to find the median GDP per capita
    **within each year and continent**, calling the output column
    `medianGdpPercap`. Use the assignment operator `<-` to save it to a
    dataset called `by_year_continent`.
-   Use the `by_year_continent` dataset to create a line plot showing
    the change in median GDP per capita over time, with color
    representing continent. **Be sure** to use `expand_limits(y = 0)` to
    include 0 on the y-axis.

``` r
# Summarize the median gdpPercap by year & continent, save as by_year_continent
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))
```

    ## `summarise()` has grouped output by 'year'. You can override using the `.groups`
    ## argument.

``` r
# Create a line plot showing the change in medianGdpPercap by continent over time
ggplot(by_year_continent, aes(x = year, y = medianGdpPercap, color = continent)) +
  geom_line() +
  expand_limits(y = 0)
```

![](readme_files/figure-gfm/unnamed-chunk-33-1.png)<!-- -->

Excellent work! Take a look at the plot: did the growth in median GDP
per capita differ between continents?

## Bar plots

Theory. Coming soon …

**1. Bar plots**

The next kind of plot you’ll learn to make is a bar plot. Bar plots are
useful for comparing values across discrete categories, such as
continents.

**2. Summarizing by continent**

In the last chapter, you learned to calculate summarized values within
groups. For example, this code finds the average life expectancy within
each continent in the year 2007. That creates a table that looks like
this, with one observation for each continent.Instead of just printing
the table, you might want to represent the summary visually. For that,
you would use a

**3. Bar plot**

bar plot. This kind of plot represents the data using one bar for each
continent, with the height of the bar representing the mean life
expectancy.To create a bar plot, you use geom underscore col, short for
“column”. There are two aesthetics in a bar plot. X is the categorical
variable: in this case, the continent. Y is the variable that determines
the height of the bars: the mean life expectancy. This makes it easy to
see which continents have higher life expectancy than others.Notice that
unlike scatter plots or line plots, bar plots always start at zero.

**4. Let’s practice!**

In the exercises, you’ll summarize other statistics within each
continent, and then use bar plots to compare them visually.

## Visualizing median GDP per capita by continent

A bar plot is useful for visualizing summary statistics, such as the
median GDP in each continent.

**Steps**

1.  Use `group_by()` and `summarize()` to find the median GDP per capita
    **within each continent** in the year 1952, calling the output
    column `medianGdpPercap`. Use the assignment operator `<-` to save
    it to a dataset called `by_continent`.
2.  Use the `by_continent` dataset to create a bar plot showing the
    median GDP per capita in each continent.

``` r
# Summarize the median gdpPercap by year and continent in 1952
by_continent <- gapminder %>%
  filter(year == 1952) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Create a bar plot showing medianGdp by continent
ggplot(by_continent, aes(x = continent, y = medianGdpPercap)) + 
  geom_col()
```

![](readme_files/figure-gfm/unnamed-chunk-34-1.png)<!-- -->

Excellent! That’s three kinds of plots you’re now able to make with
ggplot2.

## Visualizing GDP per capita by country in Oceania

You’ve created a plot where each bar represents one continent, showing
the median GDP per capita for each. But the x-axis of the bar plot
doesn’t have to be the continent: you can instead create a bar plot
where each bar represents a country.

In this exercise, you’ll create a bar plot comparing the GDP per capita
between the two countries in the Oceania continent (Australia and New
Zealand).

**Steps**

1.  Filter for observations in the **Oceania** continent in the
    year 1952. Save this as `oceania_1952`.
2.  Use the `oceania_1952` dataset to create a bar plot, with country on
    the x-axis and `gdpPercap` on the y-axis.

``` r
# Filter for observations in the Oceania continent in 1952
oceania_1952 <- gapminder %>%
  filter(year == 1952, continent == "Oceania")
  
# Create a bar plot of gdpPercap by country
ggplot(oceania_1952, aes(x = country, y = gdpPercap)) +
  geom_col()
```

![](readme_files/figure-gfm/unnamed-chunk-35-1.png)<!-- -->

Good work! Looks like the GDP per capita of these two countries was
similar in 1952.

## Histograms

Theory. Coming soon …

**1. Histograms**

Each kind of graph offers a different way to investigate your data. So
far we’ve been looking at relationships between two or more variables.
But we can instead investigate one dimension of the data at a time,
using a histogram.

**2. Histogram**

A histogram shows a distribution. In this case, it’s the distribution of
life expectancy across countries in the year 2007. Every bar represents
a bin of life expectancies, and the height represents how many countries
fall into that bin. This lets you get a sense of the distribution based
on the histogram’s shape. We can see that most countries have a life
expectancy between 70 to 80 years, but that another set of countries
have life expectancies between 40 and 65.A histogram is created with
geom underscore histogram. It has only one aesthetic: the x-axis, the
variable whose distribution you are examining.The width of each bin in
the histogram is chosen automatically, and it has a large effect on how
the histogram communicates the distribution. You may need to customize
that width. You can

**3. Adjusting bin width**

do so with the binwidth option, which is set inside the parentheses of
the geom underscore histogram layer. Setting binwidth equals 5 means
that each of the bars in the histograms represents a width of five
years. Setting a wide binwidth like this makes the histogram a bit
blockier, which focuses on the general shape more than the small
details. As you gain experience with histograms, you’ll learn how to
customize this to give the clearest picture of your data. In some cases,
you may need to put the x-axis of a histogram on a log scale for it to
be understandable, just like you did in several of the scatter plots in
Chapter 2.

**4. Log x-axis**

Recall that you do this by adding a scale underscore x underscore log10
to the graph. You’ll practice doing so in the exercises.

## Visualizing population

A histogram is useful for examining the distribution of a numeric
variable. In this exercise, you’ll create a histogram showing the
distribution of country populations (by millions) in the year 1952.

Code for generating this dataset, `gapminder_1952`, is provided.

**Steps**

1.  Use the `gapminder_1952` dataset to create a histogram of country
    population (`pop_by_mil`) in the year 1952. Inside the histogram
    geom, set the number of `bins` to `50`.

``` r
gapminder_1952 <- gapminder %>%
  filter(year == 1952) %>%
  mutate(pop_by_mil = pop / 1000000)

# Create a histogram of population (pop_by_mil)
ggplot(gapminder_1952, aes(x = pop_by_mil)) +
  geom_histogram(bins = 50)
```

![](readme_files/figure-gfm/unnamed-chunk-36-1.png)<!-- -->

That’s right! Notice that most of the distribution is in the smallest
(leftmost) bins. In the next exercise you’ll put the x-axis on a log
scale.

## Visualizing population with x-axis on a log scale

In the last exercise you created a histogram of populations across
countries. You might have noticed that there were several countries with
a much higher population than others, which causes the distribution to
be very skewed, with most of the distribution crammed into a small part
of the graph. (Consider that it’s hard to tell the median or the minimum
population from that histogram).

To make the histogram more informative, you can try putting the x-axis
on a log scale.

**Steps**

1.  Use the `gapminder_1952` dataset (code is provided) to create a
    histogram of country population (`pop`) in the year 1952, putting
    the x-axis on a log scale with `scale_x_log10()`.

``` r
gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a histogram of population (pop), with x on a log scale
ggplot(gapminder_1952, aes(x = pop)) +
  geom_histogram() +
  scale_x_log10()
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](readme_files/figure-gfm/unnamed-chunk-37-1.png)<!-- -->

Great! Notice that on a log scale, the distribution of country
populations is approximately symmetrical.

## Boxplots

Theory. Coming soon …

**1. Box plots**

In this final lesson, you’ll learn how to make one more type of graph: a
box plot. Recall that we used

**2. Histograms**

a histogram when we wanted to examine the distribution of one variable,
such as life expectancy, across all countries. Notice that a histogram
combines all the life expectancies across all continents, without
distinguishing them. But what if your goal is to compare the
distribution of life expectancies among continents?

**3. Box plots**

This is a box plot, which shows the distribution of life expectancies
within each continent, so that you can compare them. It is created with
geom underscore boxplot, and it has two aesthetics- x is the category
(continent), and y is the values that we’re comparing, which in this
case is life expectancy. A box plot takes a bit of practice to
interpret, so here’s what each of the components means. The black line
in the middle of each white box is the median of that continent’s
distribution. The top and bottom of each box represent the 75th
percentile and the 25th percentile of that group, meaning half of the
distribution lies within that box. The lines going up and down from the
box, called “whiskers”, cover additional countries. The two dots below
the whiskers for Asia and the Americas represent outliers: countries
with unusually low life expectancy relative to the rest of the
distribution. So there’s a lot that this plot tells us about differences
in life expectancy across continents. We can see that the median life
expectancy of Europe is one of the highest, and that the two countries
in Oceana (Australia and New Zealand) both have very high values. We can
also see that the distribution for Africa is unusually low, with about
half of its countries having a life expectancy between 50 and 60 years.

**4. Histogram vs box plot**

A boxplot helps give more context to the shape of the earlier histogram,
where there were two bumps: one for countries between 65 and 80
representing most of Europe, Asia, and the Americas, and another, lower
distribution. You’ll use boxplots to examine other differences in
distribution between continents in the final exercises.

## Comparing GDP per capita across continents

A boxplot is useful for comparing a distribution of values across
several groups. In this exercise, you’ll examine the distribution of GDP
per capita by continent. Since GDP per capita varies across several
orders of magnitude, you’ll need to put the y-axis on a log scale.

**Steps**

1.  Use the `gapminder_1952` dataset (code is provided) to create a
    boxplot comparing GDP per capita (`gdpPercap`) among continents. Put
    the y-axis on a log scale with `scale_y_log10()`.

``` r
# Create a boxplot comparing gdpPercap among continents
ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10()
```

![](readme_files/figure-gfm/unnamed-chunk-38-1.png)<!-- -->

Looks good! What continents had countries with the highest GDP per
capita?

## Adding a title to your graph

There are many other options for customizing a `ggplot2` graph, which
you can learn about in other DataCamp courses. You can also learn about
them from online resources, which is an important skill to develop.

As the final exercise in this course, you’ll practice looking up
`ggplot2` instructions by completing a task we haven’t shown you how to
do.

**Steps**

1.  Add a title to the graph: **Comparing GDP per capita across
    continents**. Use a search engine, such as Google or Bing, to learn
    how to do so.
2.  After this exercise you are almost done with your course. If you
    enjoyed the material, feel free to send Dave a thank you via
    twitter. He’ll appreciate it.
    <a href="http://twitter.com/home?status=Thoroughly%20enjoyed%20the%20Introduction%20to%20the%20Tidyverse%20course%20%40DataCamp%20by%20%40drob.%20Great%20instructor!%20https%3A%2F%2Fbit.ly%2F2AmGt3t%0A" target="_blank" rel="noopener noreferrer">Tweet
    to Dave</a>

``` r
# Add a title to this graph: "Comparing GDP per capita across continents"
ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10() +
  ggtitle("Comparing GDP per capita across continents")
```

![](readme_files/figure-gfm/unnamed-chunk-39-1.png)<!-- -->

Brilliant! Now you know how to look up additional methods for
customizing graphs. That will be very useful in your career as an R
user!<br><br><i> Don’t forget to download the
<a href='https://datacamp-community-prod.s3.amazonaws.com/c1fae72f-d2d7-4646-9dce-dd0f8fb5c5e8'>Cheat
Sheet</a> for this course to keep track of what you’ve learned today!
<i>

## Conclusion

**1. Conclusion**

Congratulations on completing this Introduction to R via the Tidyverse.
You’ve been introduced to the principles

**2. Transforming and visualizing data with R**

of transforming and visualizing data with R, and in the process learned
some real insights from the Gapminder dataset. This course forms a great
foundation for other DataCamp courses where you can continue learning
how to use these powerful tools to explore data. You can take

**3. Next steps: Data visualization**

courses about ggplot2 to learn to create more informative and customized
data visualizations. You can learn much more about using dplyr to
transform your data, such as how to join multiple tables together. To
analyze other data that you’re interested in, you can take the course on
importing and cleaning datasets. And you can practice your data
wrangling and visualization skills in my own course “Exploratory Data
Analysis with R”, which offers a case study of analyzing United Nations
voting over time. These are just a few of the many resources you have to
continue learning about data science and R.

**4. Enjoy your data science journey!**

I hope you had fun in this course, and continue to enjoy your data
science journey!
