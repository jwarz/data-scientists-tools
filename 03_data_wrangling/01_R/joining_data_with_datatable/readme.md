Joining Data with data.table in R
================
Joschka Schwarz

-   [1. Joining Multiple data.tables](#1-joining-multiple-datatables)
    -   [Welcome to the course](#welcome-to-the-course)
    -   [Exploring data.tables](#exploring-datatables)
    -   [Identifying join keys](#identifying-join-keys)
    -   [Multiple data.tables, multiple
        keys](#multiple-datatables-multiple-keys)
    -   [The merge function](#the-merge-function)
    -   [Inner join](#inner-join)
    -   [Full join](#full-join)
    -   [Left and right joins](#left-and-right-joins)
    -   [Left join](#left-join)
    -   [Right join](#right-join)
    -   [Mastering simple joins](#mastering-simple-joins)
-   [2. Joins Using data.table Syntax](#2-joins-using-datatable-syntax)
    -   [Joins using data.table syntax](#joins-using-datatable-syntax)
    -   [Right join with the data.table
        syntax](#right-join-with-the-datatable-syntax)
    -   [Inner join with the data.table
        syntax](#inner-join-with-the-datatable-syntax)
    -   [Anti-joins](#anti-joins)
    -   [Setting and viewing data.table
        keys](#setting-and-viewing-datatable-keys)
    -   [Setting keys](#setting-keys)
    -   [Getting keys](#getting-keys)
    -   [Incorporating joins into your data.table
        workflow](#incorporating-joins-into-your-datatable-workflow)
    -   [Exploring the Australian
        population](#exploring-the-australian-population)
    -   [Finding multiple matches](#finding-multiple-matches)
    -   [Exploring world life
        expectancy](#exploring-world-life-expectancy)
-   [3. Diagnosing and Fixing Common Join
    Problems](#3-diagnosing-and-fixing-common-join-problems)
    -   [Complex keys](#complex-keys)
    -   [Keys with different names](#keys-with-different-names)
    -   [Multi-column keys](#multi-column-keys)
    -   [Multi-key, single-key](#multi-key-single-key)
    -   [Tricky columns](#tricky-columns)
    -   [Column name suffixes](#column-name-suffixes)
    -   [Joining a data.frame](#joining-a-dataframe)
    -   [Duplicate matches](#duplicate-matches)
    -   [Joining with missing values](#joining-with-missing-values)
    -   [Filtering duplicates](#filtering-duplicates)
    -   [Joining and filtering
        duplicates](#joining-and-filtering-duplicates)
-   [4. Concatenating and Reshaping
    data.tables](#4-concatenating-and-reshaping-datatables)
    -   [Concatenating two or more
        data.tables](#concatenating-two-or-more-datatables)
    -   [Concatenating data.table
        variables](#concatenating-datatable-variables)
    -   [Concatenating a list of
        data.tables](#concatenating-a-list-of-datatables)
    -   [Set operations](#set-operations)
    -   [Identifying observations shared by multiple
        tables](#identifying-observations-shared-by-multiple-tables)
    -   [Removing duplicates while combining
        tables](#removing-duplicates-while-combining-tables)
    -   [Identifying observations unique to a
        table](#identifying-observations-unique-to-a-table)
    -   [Melting data.tables](#melting-datatables)
    -   [Melting a wide table](#melting-a-wide-table)
    -   [More melts](#more-melts)
    -   [Casting data.tables](#casting-datatables)
    -   [Casting a long table](#casting-a-long-table)
    -   [Casting multiple columns](#casting-multiple-columns)
    -   [Splitting by multiple groups](#splitting-by-multiple-groups)

**Short Description**

This course will show you how to combine and merge datasets with
data.table.

**Long Description**

In the real world, data sets typically come split across many tables
while most data analysis functions in R are designed to work with single
tables of data. In this course, you’ll learn how to effectively combine
data sets into single tables using data.table. You’ll learn how to add
columns from one table to another table,to filter a table based on
observations in another table, and how to identify records across
multiple tables matching complex criteria. Along the way, you’ll learn
how to troubleshoot failed join operations and best practices for
working with complex data sets. After completing this course you’ll be
well on your way to be a data.table master!

# 1. Joining Multiple data.tables

This chapter will show you how to perform simple joins that will enable
you to combine information spread across multiple tables.

## Welcome to the course

Theory. Coming soon …

**1. Welcome to the course**

Hi, my name is Scott Ritchie. I’ll be your instructor for this course on
joining data in R with data table. Welcome, and I look forward to seeing
you in the course.

**2. Joining data.tables**

A join describes the action of combining information from two different
data tables into a single data table. This is a fundamental skill when
working with multiple data sources. The majority of R’s functions for
analyzing and visualizing data are designed to work on a single data
frame or data table. But, you’ll often find data you want to analyze is
spread across multiple datasets, that may come from different sources.
For example, you might be working with two data tables in your customer
database. One containing their demographic information, shown in blue,
and another containing their shipping address, shown in orange. The
question is: how do you build a single data table containing all the
information about each customer? Joins are an efficient and reliable way
of solving this type of problem.

**3. Course overview**

In chapter one of the course, you’ll learn how to use the merge function
to perform four types of joins that you can find in any data-driven
language. In chapter two you’ll learn how to incorporate joins directly
into your data table workflows. In chapter three, you’ll learn how to
diagnose and avoid common join errors. Finally, in chapter four you’ll
learn how to concatenate data tables that have the same columns, and how
to transform them between wide and long formats.

**4. Table keys**

The first skill you need to learn is to identify the join key columns.
These are the columns you need in each data table to match the rows
between them for a join. No matter what type of join you want to do, you
will always need to know which columns to use as join keys. Returning to
the customer database example, to match the rows between the two data
tables you would need to use the values stored in the name column, as
you can see from their highlighted matching values.

**5. Inspecting `data.tables` in your R session**

To identify join keys, you will need to learn about the contents of the
data tables you are working with. There are a few different ways you can
do this. The first way is using the tables() function. It will show you
all data tables in your R session, along with their number of rows,
their number and names of their columns, and how much space they occupy
in terms of memory. It will also tell you any columns you have set as
their keys, which you’ll learn in the next chapter.

**6. Inspecting `data.tables` in your R session**

Another way is using the str() function. This is a general purpose
function that will show you the type of data stored in any R object, in
this case, a data table along with the types and first few entries of
each column.

**7. Inspecting `data.tables` in your R session**

Finally, typing in the variable name and hitting enter in the console
will show you the values stored in a data table. If it has more than 100
rows, only the first and last five rows are displayed by default.

**8. Let’s practice!**

Now lets explore some of the data tables you will be using in this
course.

## Exploring data.tables

In this exercise, you will explore two `data.table`s:

-   `netflix`: contains information about some of the
    <a href="https://www.netflix.com">Netflix</a> original series
    released in 2017
-   `imdb`: contains ratings for some TV shows and movies obtained from
    <a href="https://www.imdb.com">IMDB</a>

*This course touches on a lot of concepts you may have forgotten, so if
you ever need a quick refresher, download the
<a href="https://datacamp-community-prod.s3.amazonaws.com/6fdf799f-76ba-45b1-b8d8-39c4d4211c31">data.table
Cheat Sheet</a> and keep it handy!*

**Steps**

1.  Use the `tables()` function to show all the `data.tables`s in your R
    session (along with their number of rows, columns and other info).
2.  Use the `head()` function to print the first 6 rows of `netflix` and
    `imdb`.
3.  Print the `str()`ucture of `netflix` and `imdb`.

``` r
# Load package
library(data.table)

# Load data
netflix <- fread("data/netflix_2017.csv")
imdb    <- fread("data/imdb_ratings.csv")

# What data.tables are in my R session?
tables()
```

    ##       NAME NROW NCOL MB                        COLS KEY
    ## 1:    imdb   11    2  0                title,rating    
    ## 2: netflix    8    3  0 title,episodes,release_date    
    ## Total: 0MB

``` r
# View the first six rows 
head(netflix)
```

    ##                             title episodes release_date
    ## 1: A Series of Unfortunate Events        8    13-Jan-17
    ## 2:                 13 Reasons Why       13    31-Mar-17
    ## 3:                          Gypsy       10    30-Jun-17
    ## 4:                          Ozark       10    21-Jul-17
    ## 5:                     Mindhunter       10    13-Oct-17
    ## 6:                       Longmire       10    17-Nov-17

``` r
head(imdb)
```

    ##             title rating
    ## 1:    The Orville    7.7
    ## 2:      Big Mouth    8.3
    ## 3:     The Gifted    8.2
    ## 4:          Gypsy    7.0
    ## 5:       Inhumans    5.4
    ## 6: 13 Reasons Why    8.4

``` r
# Print the structure
str(netflix)
```

    ## Classes 'data.table' and 'data.frame':   8 obs. of  3 variables:
    ##  $ title       : chr  "A Series of Unfortunate Events" "13 Reasons Why" "Gypsy" "Ozark" ...
    ##  $ episodes    : int  8 13 10 10 10 10 6 10
    ##  $ release_date: chr  "13-Jan-17" "31-Mar-17" "30-Jun-17" "21-Jul-17" ...
    ##  - attr(*, ".internal.selfref")=<externalptr>

``` r
str(imdb)
```

    ## Classes 'data.table' and 'data.frame':   11 obs. of  2 variables:
    ##  $ title : chr  "The Orville" "Big Mouth" "The Gifted" "Gypsy" ...
    ##  $ rating: num  7.7 8.3 8.2 7 5.4 8.4 7.3 8.9 8.4 8.5 ...
    ##  - attr(*, ".internal.selfref")=<externalptr>

Nice work! Let’s take a closer look at these `data.table`s!

## Identifying join keys

The `netflix` and `imdb` `data.table`s from the previous exercise have
been loaded into your workspace.

> ## *Question*
>
> Which columns can be used to match the rows across these two
> `data.table`s?<br> <br> ⬜ The `"release_date"` column in `netflix`
> and the `"title"` column in `imdb`.<br> ⬜ The `"episodes"` column in
> `netflix` and the `"rating"` column in `imdb`.<br> ✅ The `"title"`
> column in both `netflix` and `imdb`.<br>

Well done! Remember that columns that link observations across
`data.table`s are known as “join keys”.

## Multiple data.tables, multiple keys

Three new `data.table`s are available in your workspace: `area`,
`capitals`, and `population`, containing basic statistics about the
geography and demographics of Australia.

> ## *Question*
>
> Which columns can be used to match rows across these three
> `data.table`s?<br> <br> ⬜ None, because no column is present in all
> three `data.table`s.<br> ⬜ The `"state"` column in `area` and
> `capitals`. But no key can uniquely identify rows in `population` and
> `capitals`.<br> ✅ The `"state"` column for joining `area` and
> `capitals`, and the `"city"` column for `capitals` and
> `population`.<br>

Excellent! A `data.table` may have different join key columns depending
on the other `data.table` it is joined to.

## The merge function

Theory. Coming soon …

**1. The merge function**

Now that you can successfully identify join keys, it’s time to learn how
to perform joins using the merge() function.

**2. Joins**

In this chapter, you will learn four different joins. The inner join,
the full join, the left join, and the right join. Each of these joins
give a different result, based on what observations are present in one
data table but not in the other.All four are standard joins that
originally come from database query languages, such as SQL. So the
concepts and skills you will learn in this chapter are widely
applicable, not just for the data table package in R. In this chapter,
you will learn how to do these joins using the merge() function. This
function comes from base R but is extended in the data table package to
work efficiently with data tables.

**3. Inner join**

An inner join combines the columns of two data tables, keeping only the
observations present in both data tables, that is, rows whose value in
the join key column can be found in both data tables.Returning to our
example customer database, an inner join of the demographics data table,
shown in blue, to the shipping addresses data table, shown in orange,
creates a new data table containing all the columns from both data
tables, containing just the people with entries in both; those
highlighted in pink, yellow, and green. An inner join is the default
behavior of the merge() function. It takes two data tables as inputs,
one to its x and one to its y arguments, along with the name of the key
column in each data table to the by.x and by.y arguments respectively.

**4. The by argument**

When the key columns have the same name in both data tables, you can use
the by argument instead to avoid typing the column name twice.

**5. Full join**

If you want to keep all observations that are present in either data
table you can supply an additional argument to the merge() function;
setting the all argument to be equal to TRUE. This is known as a full
join or a full outer join. Observations which were present in only one
data table will have missing values in the columns from the other data
table, as shown in the white cells in the result.

**6. Let’s practice!**

In the next lesson, you will learn about left joins and right joins. But
now, it’s time for you to practice inner joins and full joins.

## Inner join

Two `data.table`s are available in your workspace:

-   `netflix`: contains a selection of original series released by
    <a href="https://www.netflix.com">Netflix</a> in 2017
-   `imdb`: contains average user ratings for a selection of TV shows
    and movies from <a href="https://www.imdb.com">IMDB</a>. Your goal
    is use the
    <a href="https://www.rdocumentation.org/packages/data.table/topics/merge">`merge()`</a>
    function to perform an inner join to build a new `data.table`
    containing all series from `netflix` that have a rating in `imdb`.

**Steps**

1.  Remind yourself of the contents of both `data.table`s by printing
    them.

``` r
# Print the data.tables in your R session
netflix
```

    ##                             title episodes release_date
    ## 1: A Series of Unfortunate Events        8    13-Jan-17
    ## 2:                 13 Reasons Why       13    31-Mar-17
    ## 3:                          Gypsy       10    30-Jun-17
    ## 4:                          Ozark       10    21-Jul-17
    ## 5:                     Mindhunter       10    13-Oct-17
    ## 6:                       Longmire       10    17-Nov-17
    ## 7:                        Godless        6    22-Nov-17
    ## 8:                           Dark       10     1-Dec-17

``` r
imdb
```

    ##                                        title rating
    ##  1:                              The Orville    7.7
    ##  2:                                Big Mouth    8.3
    ##  3:                               The Gifted    8.2
    ##  4:                                    Gypsy    7.0
    ##  5:                                 Inhumans    5.4
    ##  6:                           13 Reasons Why    8.4
    ##  7:                     Star Trek: Discovery    7.3
    ##  8:                               Mindhunter    8.9
    ##  9: Mystery Science Theatre 3000: The Return    8.4
    ## 10:                                    Ozark    8.5
    ## 11:           A Series of Unfortunate Events    7.9

2.  Use the correct column to inner join `netflix` and `imdb` using the
    `merge()` function.

``` r
# Inner join netflix and imdb
merge(netflix, imdb, by = "title")
```

    ##                             title episodes release_date rating
    ## 1:                 13 Reasons Why       13    31-Mar-17    8.4
    ## 2: A Series of Unfortunate Events        8    13-Jan-17    7.9
    ## 3:                          Gypsy       10    30-Jun-17    7.0
    ## 4:                     Mindhunter       10    13-Oct-17    8.9
    ## 5:                          Ozark       10    21-Jul-17    8.5

Great job! Inner joins are useful when you want to build a complete set
of information for observations that are present in both `data.table`s.

## Full join

Using the same `data.table`s as the previous exercise, this time use
`merge()` to perform a full join to build a new `data.table` containing
all rows present in either `netflix` or `imdb`.

**Steps**

1.  Use the `merge()` function to full join the `netflix` and `imdb`
    `data.table`s.

``` r
# Full join netflix and imdb
merge(netflix, imdb, by = "title", all = TRUE)
```

    ##                                        title episodes release_date rating
    ##  1:                           13 Reasons Why       13    31-Mar-17    8.4
    ##  2:           A Series of Unfortunate Events        8    13-Jan-17    7.9
    ##  3:                                Big Mouth       NA         <NA>    8.3
    ##  4:                                     Dark       10     1-Dec-17     NA
    ##  5:                                  Godless        6    22-Nov-17     NA
    ##  6:                                    Gypsy       10    30-Jun-17    7.0
    ##  7:                                 Inhumans       NA         <NA>    5.4
    ##  8:                                 Longmire       10    17-Nov-17     NA
    ##  9:                               Mindhunter       10    13-Oct-17    8.9
    ## 10: Mystery Science Theatre 3000: The Return       NA         <NA>    8.4
    ## 11:                                    Ozark       10    21-Jul-17    8.5
    ## 12:                     Star Trek: Discovery       NA         <NA>    7.3
    ## 13:                               The Gifted       NA         <NA>    8.2
    ## 14:                              The Orville       NA         <NA>    7.7

2.  Try swapping the order of the `netflix` and `imdb` `data.table`s in
    the merge function to see what changes!

``` r
# Full join imdb and netflix
merge(imdb, netflix, by = "title", all = TRUE)
```

    ##                                        title rating episodes release_date
    ##  1:                           13 Reasons Why    8.4       13    31-Mar-17
    ##  2:           A Series of Unfortunate Events    7.9        8    13-Jan-17
    ##  3:                                Big Mouth    8.3       NA         <NA>
    ##  4:                                     Dark     NA       10     1-Dec-17
    ##  5:                                  Godless     NA        6    22-Nov-17
    ##  6:                                    Gypsy    7.0       10    30-Jun-17
    ##  7:                                 Inhumans    5.4       NA         <NA>
    ##  8:                                 Longmire     NA       10    17-Nov-17
    ##  9:                               Mindhunter    8.9       10    13-Oct-17
    ## 10: Mystery Science Theatre 3000: The Return    8.4       NA         <NA>
    ## 11:                                    Ozark    8.5       10    21-Jul-17
    ## 12:                     Star Trek: Discovery    7.3       NA         <NA>
    ## 13:                               The Gifted    8.2       NA         <NA>
    ## 14:                              The Orville    7.7       NA         <NA>

Nice work! The new `data.table` contains all TV shows and movies listed
in either `netflix` or `imdb`.

## Left and right joins

Theory. Coming soon …

**1. Left and right joins**

There are two more joins you can perform using the merge() function,
left joins and the right joins.

**2. Left joins**

A left join keeps only the observations that are present in the data
table on the left side of the join. In other words, a left join will add
information from the data table on the right to the data table on the
left. This is useful when you have two data tables from different
sources, but you’re really only interested in the observations from
one.The data table on the left side of the join is the data table given
to the x argument of the merge() function. To perform a left join with
the merge() function, you set the argument all.x to be equal to TRUE.

**3. Right joins**

Conversely, a right join keeps only the observations that are present in
the data table on the right side of the join. The data table on the
right side of the join is the data table given to the y argument of the
merge() function. To perform a right join with the merge() function you
set the argument all.y to be equal to TRUE.

**4. Right joins - Left joins**

The outcome is the same as swapping the order of the data tables in the
merge() function and performing a left join. Most people find one or the
other to fit more naturally when thinking about data and stick to that.
Its only in rare cases when joining multiple data tables in a sequence
of joins where you might need to use both left and right joins.

**5. Default values**

Any arguments you don’t specify in a function call in R take on their
default values. For example, the arguments all, all.x, and all.y for the
merge() function have a default value of FALSE. You can look up the
default values for any function’s arguments by using the help()
function.

**6. Exercise instructions**

In the code exercises throughout the rest of the course, you will be
instructed to join one data table to another using the wording you see
on the slide. Regardless of the type of join, the data table that you
see after the word “to” should always be placed on the left side of the
join in your code.So if we ask you to join the shipping data.table to
the demographics data table, the demographics data table should always
be on the left side of the join: the first argument to the merge
function.

**7. Let’s practice!**

Go ahead and code some left and right joins.

## Left join

In this exercise, you will practice left joins! In a left join, rows
from only the left (or the first) `data.table` will be retained.

Both `netflix` and `imdb` are available in your workspace.

**Steps**

1.  Use the `merge()` function to left join `imdb` *to* `netflix`.

``` r
# Left join imdb to netflix
merge(netflix, imdb, by = "title", all.x = TRUE)
```

    ##                             title episodes release_date rating
    ## 1:                 13 Reasons Why       13    31-Mar-17    8.4
    ## 2: A Series of Unfortunate Events        8    13-Jan-17    7.9
    ## 3:                           Dark       10     1-Dec-17     NA
    ## 4:                        Godless        6    22-Nov-17     NA
    ## 5:                          Gypsy       10    30-Jun-17    7.0
    ## 6:                       Longmire       10    17-Nov-17     NA
    ## 7:                     Mindhunter       10    13-Oct-17    8.9
    ## 8:                          Ozark       10    21-Jul-17    8.5

Fantastic! Did you notice that missing information for observations that
are not present in the right table of the join contain `NA`s for the
right `data.table`’s columns?

## Right join

In this exercise, you will right join `imdb` *to* `netflix`. The
resulting `data.table` should contain all entries from `imdb` with the
release date and the number of episodes added for titles that are also
listed in the `netflix` `data.table`.

**Steps**

1.  Use the `merge()` function to right join `imdb` *to* `netflix`.

``` r
# Right join imdb to netflix
merge(netflix, imdb, by = "title", all.y = TRUE)
```

    ##                                        title episodes release_date rating
    ##  1:                           13 Reasons Why       13    31-Mar-17    8.4
    ##  2:           A Series of Unfortunate Events        8    13-Jan-17    7.9
    ##  3:                                Big Mouth       NA         <NA>    8.3
    ##  4:                                    Gypsy       10    30-Jun-17    7.0
    ##  5:                                 Inhumans       NA         <NA>    5.4
    ##  6:                               Mindhunter       10    13-Oct-17    8.9
    ##  7: Mystery Science Theatre 3000: The Return       NA         <NA>    8.4
    ##  8:                                    Ozark       10    21-Jul-17    8.5
    ##  9:                     Star Trek: Discovery       NA         <NA>    7.3
    ## 10:                               The Gifted       NA         <NA>    8.2
    ## 11:                              The Orville       NA         <NA>    7.7

2.  Compare the right join you performed in the previous step to the
    left join of `netflix` *to* `imdb`.

``` r
# Compare to a left join of netflix to imdb
merge(imdb, netflix, by = "title", all.x = TRUE)
```

    ##                                        title rating episodes release_date
    ##  1:                           13 Reasons Why    8.4       13    31-Mar-17
    ##  2:           A Series of Unfortunate Events    7.9        8    13-Jan-17
    ##  3:                                Big Mouth    8.3       NA         <NA>
    ##  4:                                    Gypsy    7.0       10    30-Jun-17
    ##  5:                                 Inhumans    5.4       NA         <NA>
    ##  6:                               Mindhunter    8.9       10    13-Oct-17
    ##  7: Mystery Science Theatre 3000: The Return    8.4       NA         <NA>
    ##  8:                                    Ozark    8.5       10    21-Jul-17
    ##  9:                     Star Trek: Discovery    7.3       NA         <NA>
    ## 10:                               The Gifted    8.2       NA         <NA>
    ## 11:                              The Orville    7.7       NA         <NA>

Nicely done! Right joins and left joins are essentially the same, with
the order of input `data.table`s swapped in the join.

## Mastering simple joins

Three new `data.tables` have been loaded into your R session containing
information about the geography and population of Australia: `area`,
`capitals`, and `population`. Your goal is to perform a sequence of
joins to build a single `data.table` containing information about the
geographical area of each Australian state and the population of its
capital city, storing the final result in a new variable:
`australia_stats`. There are three `data.tables` so you will need to
perform two joins. First, you will join `capitals` and `population`, and
then you will join the resulting `data.table` to the `area`.

**Steps**

1.  Identify the key column so you can join `capitals` and `population`.
    Assign the column name as a string to `capitals_population_key`.
2.  Using this key, left join `population` to `capitals`.

``` r
# Load data
capitals   <- fread("data/australia_population/australia_capitals.csv")
population <- fread("data/australia_population/australia_cities_top20.csv", drop = "percentage") 
area       <- fread("data/australia_population/australia_area.csv",         drop = "precentage")
```

    ## Warning in fread("data/australia_population/australia_area.csv", drop =
    ## "precentage"): Column name 'precentage' (drop[1]) not found

``` r
# Identify the key for joining capitals and population
capitals_population_key <- "city"

# Left join population to capitals
capital_pop <- merge(capitals, population, by = capitals_population_key, all.x = TRUE)
capital_pop
```

    ##                   city                        state   country population
    ## 1:            Adelaide              South Australia Australia    1324279
    ## 2:            Brisbane                   Queensland Australia    2360241
    ## 3: Canberra–Queanbeyan Australian Capital Territory Australia         NA
    ## 4:              Darwin           Northern Territory Australia     145916
    ## 5:              Hobart                     Tasmania Australia     224462
    ## 6:           Melbourne                     Victoria Australia    4725316
    ## 7:               Perth            Western Australia Australia    2022044
    ## 8:              Sydney              New South Wales Australia    5029768

3.  Identify the key column so you can join `capital_pop` and `area`.
    Assign the column name as a string to `capital_pop_area_key`.
4.  Using this key, inner join `area` to `capital_pop`.

``` r
# Identify the key for joining capital_pop and area
capital_pop_area_key <- "state"

# Inner join area to capital pop
australia_stats <- merge(capital_pop, area, by = capital_pop_area_key)

# Print the final result
australia_stats
```

    ##                           state                city   country population
    ## 1: Australian Capital Territory Canberra–Queanbeyan Australia         NA
    ## 2:              New South Wales              Sydney Australia    5029768
    ## 3:           Northern Territory              Darwin Australia     145916
    ## 4:                   Queensland            Brisbane Australia    2360241
    ## 5:              South Australia            Adelaide Australia    1324279
    ## 6:                     Tasmania              Hobart Australia     224462
    ## 7:                     Victoria           Melbourne Australia    4725316
    ## 8:            Western Australia               Perth Australia    2022044
    ##    area_km2 percentage
    ## 1:     2358     0.0003
    ## 2:   800641     0.1041
    ## 3:  1349129     0.1754
    ## 4:  1730647     0.2250
    ## 5:   983482     0.1279
    ## 6:    68401     0.0089
    ## 7:   227416     0.0296
    ## 8:  2529875     0.3289

Well done! Mastering these joins enables you to combine information in
many different ways to build the right `data.table` to ask your data
science questions of interest.

# 2. Joins Using data.table Syntax

In this chapter you will perform joins using the data.table syntax, set
and view data.table keys, and perform anti-joins.

## Joins using data.table syntax

Theory. Coming soon …

**1. data.table syntax**

Congratulations on completing the first chapter and welcome back. In
this lesson, you will perform joins using the data table syntax.

**2. Recap of the data.table syntax**

The general form of a data table is shown here. It can be read out loud
as “Take DT, filter its rows in i, then compute on columns j grouped by
values in columns by.

**3. Joins**

To perform a join using this syntax, you pass another data table to the
i argument. This can be read out loud as “Join DT to i using the column
in on as the join key”.You can think of it as just any other filter
operation in i, except here you’re filtering the rows in DT based on
those that have matches to rows in i.

**4. Right joins**

This naturally leads to the definition of a right join. Like any other
subset operation in R, values that have no match return missing values.
So here, rows from the data table you are subsetting on in the i
argument are kept in the result, with missing values where there was no
match in the main data table.

**5. The on argument**

Join key columns are supplied to the on argument. This follows similar
rules to the j and by arguments in the data table syntax. If you use the
list function or its alias you can enter the join key column name as if
it was a variable.You can also use a character vector to specify the
join key. This also allows you to store the join key in a variable that
you pass to the on argument. Note that here we haven’t used the list
function or its alias, so the data table syntax looks for the join
underscore key variable, not for a column with the same name.

**6. Left joins**

To perform a left join you can swap the order of the data tables, so
that the data table on the left side of the join is passed to the i
argument. To left join the demographics data table shown in blue to the
shipping data table shown in orange we swap the order of data tables
from the previous slide and perform a right join on the demographics
data table.

**7. Inner joins**

To perform an inner join you supply an additional argument, nomatch
equals zero. This tells the data table syntax to ignore rows that cannot
be matched between the two data tables, giving you an inner join.

**8. Full joins**

It is not possible to perform a full join with the data table syntax, so
you will need to rely on the merge function you learned in chapter 1.
Remember to set all equal to TRUE to perform a full join!

**9. Anti-joins**

Finally, another type of join you can perform using the data table
syntax is an anti-join. This filters the main data table on the left so
that it contains only rows that have no match in the data table on the
right.Anti joins are performed by adding an exclamation mark, known as
the “not” operator, before the data table you want to filter on in the i
argument.

**10. Let’s practice!**

Later on in this chapter you will learn how to use the other
functionality of the data table syntax while joining data tables. For
now, its your turn to try out joins using the data table syntax.

## Right join with the data.table syntax

`capitals` and `population`, the two `data.table`s containing
information about the geography and population of Australia are
available in your workspace. Your goal is to add the state of each city
to the `population` by performing a right join using the `data.table`
syntax.

**Steps**

1.  Right join `population` to `capitals` using the `data.table` syntax.

``` r
# Right join population to capitals using data.table syntax
capitals[population, on = .(city)]
```

    ##                       city              state   country population
    ##  1:                 Sydney    New South Wales Australia    5029768
    ##  2:              Melbourne           Victoria Australia    4725316
    ##  3:               Brisbane         Queensland Australia    2360241
    ##  4:                  Perth  Western Australia Australia    2022044
    ##  5:               Adelaide    South Australia Australia    1324279
    ##  6: Gold Coast-Tweed Heads               <NA>      <NA>     646983
    ##  7:     Newcastle-Maitland               <NA>      <NA>     436171
    ##  8:    Canberra-Queanbeyan               <NA>      <NA>     435019
    ##  9:         Sunshine Coast               <NA>      <NA>     317404
    ## 10:             Wollongong               <NA>      <NA>     295669
    ## 11:                 Hobart           Tasmania Australia     224462
    ## 12:                Geelong               <NA>      <NA>     192393
    ## 13:             Townsville               <NA>      <NA>     178864
    ## 14:                 Cairns               <NA>      <NA>     150041
    ## 15:                 Darwin Northern Territory Australia     145916
    ## 16:              Toowoomba               <NA>      <NA>     114024
    ## 17:               Ballarat               <NA>      <NA>     101588
    ## 18:                Bendigo               <NA>      <NA>      95587
    ## 19:         Albury-Wodonga               <NA>      <NA>      90576
    ## 20:             Launceston               <NA>      <NA>      86335

2.  To compare the output, right join `population` to `capitals` using
    the `merge()` function.

``` r
# Right join using merge
merge(capitals, population, by = "city", all.y = TRUE)
```

    ##                       city              state   country population
    ##  1:               Adelaide    South Australia Australia    1324279
    ##  2:         Albury-Wodonga               <NA>      <NA>      90576
    ##  3:               Ballarat               <NA>      <NA>     101588
    ##  4:                Bendigo               <NA>      <NA>      95587
    ##  5:               Brisbane         Queensland Australia    2360241
    ##  6:                 Cairns               <NA>      <NA>     150041
    ##  7:    Canberra-Queanbeyan               <NA>      <NA>     435019
    ##  8:                 Darwin Northern Territory Australia     145916
    ##  9:                Geelong               <NA>      <NA>     192393
    ## 10: Gold Coast-Tweed Heads               <NA>      <NA>     646983
    ## 11:                 Hobart           Tasmania Australia     224462
    ## 12:             Launceston               <NA>      <NA>      86335
    ## 13:              Melbourne           Victoria Australia    4725316
    ## 14:     Newcastle-Maitland               <NA>      <NA>     436171
    ## 15:                  Perth  Western Australia Australia    2022044
    ## 16:         Sunshine Coast               <NA>      <NA>     317404
    ## 17:                 Sydney    New South Wales Australia    5029768
    ## 18:              Toowoomba               <NA>      <NA>     114024
    ## 19:             Townsville               <NA>      <NA>     178864
    ## 20:             Wollongong               <NA>      <NA>     295669

Nice work! Did you notice the difference in row ordering in the result?
This is because joins using the `data.table` syntax treat the `i`
argument like a subset operation, so it returns rows in the order they
appear in the `data.table` given to the `i` argument, while the
`merge()` function sorts rows based on the values in the key column.

## Inner join with the data.table syntax

In the last exercise, you right joined `population` to `capitals`. The
result contained all rows from `population` and had some `NA`s. In this
exercise, you will perform an inner join instead, retaining rows only
from both the tables.

**Steps**

1.  Inner join `population` to `capitals` using the `data.table` syntax.

``` r
# Inner join with the data.table syntax
capitals[population, on = .(city), nomatch = 0]
```

    ##         city              state   country population
    ## 1:    Sydney    New South Wales Australia    5029768
    ## 2: Melbourne           Victoria Australia    4725316
    ## 3:  Brisbane         Queensland Australia    2360241
    ## 4:     Perth  Western Australia Australia    2022044
    ## 5:  Adelaide    South Australia Australia    1324279
    ## 6:    Hobart           Tasmania Australia     224462
    ## 7:    Darwin Northern Territory Australia     145916

Great job! If you are performing many inner joins, you can change the
default behaviour of `nomatch` by setting
`options(datatable.nomatch = 0)` in your R session.

## Anti-joins

Anti-joins are useful when you want to filter rows in one table not
found in the other. Your goal is to filter the `population` so that it
does not contain the state capitals, and filter the `area` so that it
only contains administrative areas, not the major Australian states.

**Steps**

1.  Filter `population` so the result doesn’t contain any rows from
    `capitals`.

``` r
# Anti-join capitals to population
population[!capitals, on = .(city)]
```

    ##                       city population
    ##  1: Gold Coast-Tweed Heads     646983
    ##  2:     Newcastle-Maitland     436171
    ##  3:    Canberra-Queanbeyan     435019
    ##  4:         Sunshine Coast     317404
    ##  5:             Wollongong     295669
    ##  6:                Geelong     192393
    ##  7:             Townsville     178864
    ##  8:                 Cairns     150041
    ##  9:              Toowoomba     114024
    ## 10:               Ballarat     101588
    ## 11:                Bendigo      95587
    ## 12:         Albury-Wodonga      90576
    ## 13:             Launceston      86335

2.  Filter `area` so the result doesn’t contain any rows from
    `capitals`.

``` r
# Anti-join capitals to area
area[!capitals, on = .(state)]
```

    ##                                state area_km2 percentage
    ## 1:    Australian Antarctic Territory  5896500         NA
    ## 2: Heard Island and McDonald Islands      372          0
    ## 3:       Ashmore and Cartier Islands      199          0
    ## 4:                  Christmas Island      135          0
    ## 5:              Jervis Bay Territory       73          0
    ## 6:                    Norfolk Island       35          0
    ## 7:           Cocos (Keeling) Islands       14          0
    ## 8:                 Coral Sea Islands       10          0

Nicely done! Anti-joins are a useful way of identifying rows that have
no match in another `data.table`.

## Setting and viewing data.table keys

Theory. Coming soon …

**1. Setting and viewing data.table keys**

In this lesson, you will learn how to set and view the keys of a data
table.

**2. Setting `data.table` keys**

In the previous lesson you learned how to perform joins using the data
table syntax. In each case, you had to use the on argument to specify
how to match rows between the two data tables. However, it is possible
to tell R which columns are keys for each data table in advance of a
join, removing the need for the on argument. This is useful if you find
yourself performing several different joins with a single data
table.Setting a key will also sort a data table by that column in
memory, which makes joining and filtering operations on that columns
much faster for large data tables.With that in mind, its useful to know
you can set multiple key columns for a single data table. You’ll learn
more about joins that require multiple keys in the next chapter.

**3. The `setkey()` function**

The setkey() function is used for this purpose.It takes a single data
table as its first argument, then any number of key column names as its
remaining arguments.These can be entered as if they were variables, or
can be wrapped inside quotes, either will work.If you don’t provide any
column names to the setkey() function, it will use all columns of the
data table as its keys!

**4. The `setkey()` function**

When keys are set for two data tables, you can use the data table syntax
without the on argument for performing joins.

**5. Setting keys programmatically**

You can also use the setkeyv() function to set the keys of a data table
by passing in a character vector of the key column names. This is useful
if you want to set the keys of a data table programmatically, where your
key column names are stored in another variable.

**6. Getting keys**

You can check whether a data table has any key columns set by using the
haskey() function, and get the key you’ve set by using the key()
function.

**7. Getting keys**

If you haven’t set the key for a data table then the haskey() function
will return FALSE and the key() function will return NULL.

**8. Viewing all `data.tables` and their keys**

The tables() function you learned about in the very first lesson will
also show you the keys you have set for any data tables in your R
session.

**9. Let’s practice!**

Now it’s your turn to play with keys.

## Setting keys

The `netflix` and `imdb` `data.table`s are available in your workspace.
Your goal is to set the keys for both `data.table`s so that you can
perform a series of joins without needing to specify the join keys each
time.

**Steps**

1.  Set `title` as the key of both `netflix` and `imdb` using
    `setkey()`.
2.  Inner join `imdb` to `netflix` without specifying the `on` argument.

``` r
# Set the keys
setkey(netflix, "title")
setkey(imdb, "title")

# Inner join
netflix[imdb, nomatch = 0]
```

    ##                             title episodes release_date rating
    ## 1:                 13 Reasons Why       13    31-Mar-17    8.4
    ## 2: A Series of Unfortunate Events        8    13-Jan-17    7.9
    ## 3:                          Gypsy       10    30-Jun-17    7.0
    ## 4:                     Mindhunter       10    13-Oct-17    8.9
    ## 5:                          Ozark       10    21-Jul-17    8.5

Good job! Using `setkey()` will also sort the rows of a `data.table` by
the key columns. This makes joins and filter operations on the keys more
efficient, and can be much faster for large `data.tables`.

## Getting keys

You can also get and set the keys programmatically. In this exercise,
only one of `netflix` and `imdb` has their key set. Your job is to find
out which `data.table` has had their key set, then use that to set the
key for the other `data.table`.

**Steps**

1.  Check whether `netflix` and `imdb` have had any key set.
2.  Assign the key of the `data.table` which has a key to `the_key`.
3.  Set the key of the other `data.table` using `the_key`.

``` r
# Check for keys
haskey(netflix)
```

    ## [1] TRUE

``` r
haskey(imdb)
```

    ## [1] TRUE

``` r
# Find the key
the_key <- key(netflix)

# Set the key for the other data.table
setkeyv(imdb, the_key)
```

Fantastic! The `key()` function is a useful way of reducing typing
errors that can happen when manually typing long keys or multiple keys
over and over again. This can be used together with the `haskey()` and
`setkeyv()` functions for programmatic key checking and setting.

## Incorporating joins into your data.table workflow

Theory. Coming soon …

**1. Incorporating joins into your data.table workflow**

The real power of using the data table syntax for performing joins is
that it allows you to incorporate joins into your other data table
workflows. This enables you to perform rapid data analysis when your
data is spread across multiple data tables.

**2. Chaining data.table expressions**

The most flexible way of incorporating joins into your data table
workflows is by chaining data table expressions.In the first expression,
you perform your join operation. Then the second data table expression
allows you to work on the result with any of the other data table
expression functionality you’ve learned in the previous course.The
general form on the slide can be read as “Join DT1 to DT2 using the
column in on as the join key. Then in the result, filter by rows in i,
compute on columns j grouped by values in columns by.”

**3. Join then compute**

Here’s an example. We have two data tables, one filled with information
about the business’s customers,

**4. Join then compute**

and a second with details of the purchase history.

**5. Join then compute**

To get the average spent per sale for return customers grouped by
gender, we chain two data table expressions. In the first, we join
customers to purchases, then in the second, we filter to customers with
more than 1 sale, calculate the average spent per sale in j, grouped by
the gender column in by.

**6. Computation with joins**

You can also use the j argument to compute on columns in the same data
table expression as a join. This is a memory efficient way to perform
calculations on the result of a join because the data table expression
will create only the join result for the columns used in j in memory.
This can save a lot of time and memory for large data tables!

**7. Joining and column creation**

Column creation can also be performed in the same data table expression
as a join. The new column will be added to the main data table on the
left side of the join. In the example on the slide, after joining
purchases to customers, we are adding a new column, return_customers to
the customers data table, which is computed based on the sales column
from the purchases data table in the result of the join.

**8. Grouping by matches**

The by argument gains a special symbol, .EACHI, when used in a join
expression. This lets you group computation in j by each row in the data
table on the right side of the join.This can be read as “Join DT1 to
DT2, then for each row in DT2 group calculations in j by the matching
rows in DT1.”

**9. Grouping by matches**

In this example, we used by = .EACHI to count the number of shipping
addresses associated with each person in the customers data table.

**10. Grouping by columns with joins**

The by argument also works slightly differently than normal when used in
a join expression.It can only be provided columns from the main data
table on the left side of the join, and you can only perform computation
on columns from the main data table.

**11. Grouping by columns with joins**

For example, you could left join shipping to customers to calculate the
average age, grouped by gender, of customers with shipping addresses,
because both the age and gender columns are in the customers data table.

**12. Let’s practice!**

Now its time for you to join data tables while doing some computations!

## Exploring the Australian population

Your goal is to calculate the total percentage of people living in major
cities of Australia (listed in `capitals`). For this exercise,
`population` has a new column (`"percentage"`) containing the percentage
of people living in each of its listed cities.

**Steps**

1.  First, inner join `capitals` to `population`.

``` r
# read data
population <- fread("data/australia_population/australia_cities_top20.csv")

# Inner join capitals to population
population[capitals, on = .(city), nomatch = 0]
```

    ##         city population percentage              state   country
    ## 1:    Sydney    5029768     0.2074    New South Wales Australia
    ## 2: Melbourne    4725316     0.1924           Victoria Australia
    ## 3:  Brisbane    2360241     0.0974         Queensland Australia
    ## 4:     Perth    2022044     0.0856  Western Australia Australia
    ## 5:  Adelaide    1324279     0.0550    South Australia Australia
    ## 6:    Hobart     224462     0.0092           Tasmania Australia
    ## 7:    Darwin     145916     0.0060 Northern Territory Australia

2.  In the same `data.table` expression,
    <a href="https://www.rdocumentation.org/packages/base/topics/sum">`sum()`</a>
    the `"percentage"` column to calculate the total percentage of
    people living in major Australian cities.

``` r
# Join and sum
population[capitals, on = .(city), nomatch = 0,
           j = sum(percentage)]
```

    ## [1] 0.653

Well done! Using the `j` argument to compute information from the result
of the join will allow you to quickly ask and answer questions about
your data. Here in a single command you’ve learnt roughly 65% of
Australians live in one of its major cities.

## Finding multiple matches

Two new `data.table`s have been loaded in your workspace:

-   `life_exp`: contains the life expectancy of each country in 2010
    sourced from the <a href="https://www.gapminder.org">Gapminder
    foundation</a>
-   `continents`: contains a mapping between each country and the
    continent(s) they are part of built from information provided by
    <a href="https://www.countries-ofthe-world.com/">Countries-ofthe-World.com</a>.
    In this exercise, you will find the countries that are listed in
    more than one continent

**Steps**

1.  Complete the code to build a `data.table` containing the *number of
    matches* in `continents` for each row in `life_exp`.

``` r
# Load data
life_exp   <- fread("data/life_expectancy/gapminder_life_expectancy_2010.csv")
continents <- fread("data/life_expectancy/continents.csv") 

# How many continents is each country listed in?
continents[life_exp, on = .(country), .N, 
           by = .EACHI]
```

    ##                    country N
    ##   1:           Afghanistan 1
    ##   2:               Albania 1
    ##   3:               Algeria 1
    ##   4:        American Samoa 0
    ##   5:               Andorra 1
    ##  ---                        
    ## 204: Virgin Islands (U.S.) 0
    ## 205:                 Yemen 1
    ## 206:                Zambia 1
    ## 207:              Zimbabwe 1
    ## 208:           South Sudan 1

2.  Chain a second `data.table[]` expression to the first to filter the
    result of the previous step to contain just countries with more than
    one match between `life_exp` and `continents`.

``` r
# What countries are listed in multiple continents?
continents[life_exp, on = .(country), .N, 
           by = .EACHI][N > 1]
```

    ##       country N
    ## 1:    Armenia 2
    ## 2: Azerbaijan 2
    ## 3:     Cyprus 2
    ## 4:    Georgia 2
    ## 5: Kazakhstan 2
    ## 6:     Russia 2
    ## 7:     Turkey 2

## Exploring world life expectancy

The two `data.table`s from the previous exercise have been loaded into
your workspace:

-   `life_exp`: contains the life expectancy of each country in 2010
    sourced from the <a href="https://www.gapminder.org">Gapminder
    foundation</a>
-   `continents`: contains a mapping between each country and the
    continent(s) they are part of built from information provided by
    <a href="https://www.countries-ofthe-world.com/">Countries-ofthe-World.com</a>.
    Your goal this time is to calculate the average life expectancy
    across countries within each continent.

**Steps**

1.  Inner join `life_exp` to `continents` and calculate the
    <a href="https://www.rdocumentation.org/packages/base/topics/mean">`mean()`</a>
    `"years"` of life expectancy grouped by the `"continent"` column.

``` r
# Change names
setnames(life_exp, old = "life_expectancy", new = "years")

# Calculate average life expectancy per continent:
avg_life_expectancy <- continents[life_exp, on = .(country), 
                                  nomatch = 0][, j = mean(years), 
                                               by = .(continent)]
avg_life_expectancy
```

    ##        continent       V1
    ## 1:          asia 73.27039
    ## 2:        europe 77.43404
    ## 3:        africa 61.00556
    ## 4: north_america 73.73964
    ## 5: south_america 74.41000
    ## 6:       oceania 69.56077

Excellent work! Using `by = .EACHI` is a useful way of checking your
join has the number of matches you expect, and finding rows that may
cause problems in downstream analysis. Remember if you want to use `by=`
to group computations in `j` by another column you will need to chain a
second `data.table[]` expression.

# 3. Diagnosing and Fixing Common Join Problems

This chapter will discuss common problems and errors encountered when
performing data.table joins and show you how to troubleshoot and avoid
them.

## Complex keys

Theory. Coming soon …

**1. Complex keys**

Welcome back. In this lesson, you’ll learn how to diagnose misspecified
joins, and how to use more complex join keys.

**2. Misspecified joins**

A misspecified join is one where you don’t use the correct join keys.
This can lead to a variety of errors and malformed data tables.All of
these are good indicators you need to go back and double-check your join
keys.

**3. Column type mismatch**

If you see an error message with the word “bmerge” and “typeof” it means
that the join key columns you’ve specified have different types, so they
can’t be matched.You might be using the wrong columns,

**4. Column type mismatch**

Or the columns may have been loaded in as different types and need
converting so that both have the same type.

**5. Malformed full joins - no common key values**

If the columns have the same type, then the output and difficulty of
diagnosing the problem will depend on the type of join, and whether the
columns coincidentally have any values in common. If the columns have no
values in common then a full join will lead to the two data tables being
stacked, and filled with missing values.

**6. Malformed right and left joins - no common key values**

A right or left join will just return the rows from one of the data
tables, with columns from the other filled entirely with missing values.

**7. Malformed inner joins - no common key values**

And an inner join will have zero rows.

**8. Malformed joins - coincidental common key values**

If you use the wrong key, but the columns coincidentally share some
common values, the problem can be much harder to pick up. So its
important to check that the result of your join makes sense.

**9. Avoiding misspecified joins**

The best way to avoid misspecified joins is to take the time to learn
about the information each column contains so that you can critically
reason about how to match rows before attempting a join.There are
several factors that can make identifying join keys more difficult than
the examples you’ve encountered in previous lessons.

**10. Keys with different column names**

Sometimes the join keys might have different column names in each data
table.In these cases, you use the by dot x and by dot y arguments in the
merge() function,and in the data table join syntax you use an equals
operator in the on argument, or in the character vector supplied to the
on argument.

**11. Multi-column keys**

You may also need multiple columns to match rows between data tables.
This can be because the information that uniquely identifies rows is
split across multiple columns,

**12. Multi-column keys**

or because there are multiple entries for each entity.

**13. Specifying multiple keys with merge()**

In the merge() function, multiple key columns are supplied as a
character vector to the by argument.If one or more of these keys has
different column names in both data tables, you will need to supply a
character vector to both the by dot x and by dot y arguments. Join key
column names are matched in the order they appear in each character
vector.

**14. Specifying multiple keys with the data.table syntax**

When using the data table syntax, multiple keys can be supplied
separated by commas.Columns that have different names are specified
using an equals sign.

**15. Final Slide**

Now, its your turn to practice with complex keys.

## Keys with different names

You have been contracted by a local school to perform some analysis
using their internal databases. Two of those datasets are available in
your R session:

-   `students`: contains information about the students attending the
    school
-   `guardians`: contains information about the adult who is the primary
    point of contact for the school for each student. Your goal is to
    build a new `data.table` containing all the information about the
    guardian for each student.

**Steps**

1.  Use the `merge()` function to full join `guardians` to `students`
    using the `"name"` column as the join key. Do the results look
    correct?

``` r
# Load data
students  <- fread("data/school_db/school_db_students.tsv")
guardians <- fread("data/school_db/school_db_guardians.tsv")

# Full join
merge(students, guardians, by = "name", all = TRUE)
```

    ##        name sex.x age.x guardian sex.y age.y          phone
    ##  1:  Aciano  <NA>    NA     <NA>     M    44 0163-680-95557
    ##  2:   Adara     F    16    Kiana  <NA>    NA           <NA>
    ##  3:   Caleb     M    15    Tyler  <NA>    NA           <NA>
    ##  4:  Cierra     F    17    Kiana  <NA>    NA           <NA>
    ##  5:    Elsa     F    17     John  <NA>    NA           <NA>
    ##  6:    John  <NA>    NA     <NA>     M    34 0163-745-07369
    ##  7:  Kalvin     M    17     John  <NA>    NA           <NA>
    ##  8:   Kiana  <NA>    NA     <NA>     F    38 0163-875-41705
    ##  9: Makaela     F    17   Nicole  <NA>    NA           <NA>
    ## 10:  Nicole  <NA>    NA     <NA>     F    26 0163-266-89055
    ## 11:   Tyler  <NA>    NA     <NA>     M    48 0165-526-80087
    ## 12:  Yelena     F    17   Aciano  <NA>    NA           <NA>

2.  Now see what happens when you left join `guardians` to `students`
    with the `merge()` function using `"name"` as the join key.

``` r
# Left join
merge(students, guardians, by = "name", all.x = TRUE)
```

    ##       name sex.x age.x guardian sex.y age.y phone
    ## 1:   Adara     F    16    Kiana  <NA>    NA  <NA>
    ## 2:   Caleb     M    15    Tyler  <NA>    NA  <NA>
    ## 3:  Cierra     F    17    Kiana  <NA>    NA  <NA>
    ## 4:    Elsa     F    17     John  <NA>    NA  <NA>
    ## 5:  Kalvin     M    17     John  <NA>    NA  <NA>
    ## 6: Makaela     F    17   Nicole  <NA>    NA  <NA>
    ## 7:  Yelena     F    17   Aciano  <NA>    NA  <NA>

3.  Perform an inner join using the `data.table` syntax.

``` r
# Inner join
students[guardians, on = .(name), nomatch = 0]
```

    ## Empty data.table (0 rows and 7 cols): name,sex,age,guardian,i.sex,i.age...

4.  Explore the `data.table`s in your console to find the column in each
    of `students` and `guardians` that matches rows between them, then
    modify the code to use these column names to perform an inner join.

``` r
# What are the correct join key columns?
students[guardians, on = .(guardian = name), nomatch = 0]
```

    ##       name sex age guardian i.sex i.age          phone
    ## 1:  Kalvin   M  17     John     M    34 0163-745-07369
    ## 2:    Elsa   F  17     John     M    34 0163-745-07369
    ## 3:   Adara   F  16    Kiana     F    38 0163-875-41705
    ## 4:  Cierra   F  17    Kiana     F    38 0163-875-41705
    ## 5:   Caleb   M  15    Tyler     M    48 0165-526-80087
    ## 6: Makaela   F  17   Nicole     F    26 0163-266-89055
    ## 7:  Yelena   F  17   Aciano     M    44 0163-680-95557

Nice work! Knowing what to expect when a join goes wrong will help you
quickly catch and diagnose problems in the future. Remember, join keys
can have different column names in each `data.table`.

## Multi-column keys

Two new datasets are available in your R session:

-   `subjects`: contains the subject each student is taking each
    semester this year
-   `locations`: contains the room allocations for each subject Your
    goal is to build a new `data.table` with the locations of each
    subject for each student.

**Steps**

1.  Right join `locations` to `subjects` using the `"subject"` and
    `"semester"` columns in both `data.tables` as two separate join key
    columns. You should get an error.

``` r
# Load data
subjects  <- fread("data/school_db/school_db_subjects.tsv")
setnames(subjects, old = "class", new = "subject")

locations <- fread("data/school_db/school_db_locations.tsv")
setnames(locations, old = "class", new = "subject")
locations[, semester := as.character(semester)]

# Right join
subjects[locations, on = .(subject, semester)]
```

    ## Error in bmerge(i, x, leftcols, rightcols, roll, rollends, nomatch, mult, : Incompatible join types: x.semester (integer) and i.semester (character)

2.  Print the `str()`ucture of `subjects` and `locations`.
3.  Is the class of the `semester` column same in both? If yes, assign
    `TRUE` to `same_class`, else assign `FALSE`.

``` r
# Structure 
str(subjects)
```

    ## Classes 'data.table' and 'data.frame':   28 obs. of  3 variables:
    ##  $ name    : chr  "Yelena" "Yelena" "Yelena" "Yelena" ...
    ##  $ semester: int  1 1 2 2 1 1 2 2 1 1 ...
    ##  $ subject : chr  "Mathematics" "Programming" "Language" "Art" ...
    ##  - attr(*, ".internal.selfref")=<externalptr>

``` r
str(locations)
```

    ## Classes 'data.table' and 'data.frame':   16 obs. of  4 variables:
    ##  $ subject : chr  "English" "Mathematics" "Art" "Programming" ...
    ##  $ semester: chr  "1" "1" "1" "1" ...
    ##  $ building: chr  "Block B" "Block C" "Block B" "Block A" ...
    ##  $ room    : chr  "Room 103" "Room 104" "Room 102" "Room 102" ...
    ##  - attr(*, ".internal.selfref")=<externalptr>

``` r
# Does semester have the same class? 
same_class <- FALSE
```

4.  Use the `as.integer()` function to change the class of the
    `"semester"` column in `locations`.
5.  Right join `locations` to `subjects` again, using the `data.table`
    syntax.

``` r
# Fix the column class
locations[, semester := as.integer(semester)]

# Right join
subjects[locations, on = .(subject, semester)]
```

    ##        name semester     subject building     room
    ##  1:   Adara        1     English  Block B Room 103
    ##  2:  Cierra        1     English  Block B Room 103
    ##  3:  Yelena        1 Mathematics  Block C Room 104
    ##  4:    Elsa        1 Mathematics  Block C Room 104
    ##  5:    <NA>        1         Art  Block B Room 102
    ##  6:  Yelena        1 Programming  Block A Room 102
    ##  7: Makaela        1 Programming  Block A Room 102
    ##  8:   Caleb        1 Programming  Block A Room 102
    ##  9:  Kalvin        1     History  Block B Room 101
    ## 10:   Adara        1   Geography  Block A Room 101
    ## 11:   Caleb        1   Geography  Block A Room 101
    ## 12:    Elsa        1    Politics  Block A Room 104
    ## 13: Makaela        1    Politics  Block A Room 104
    ## 14:  Kalvin        1    Language  Block C Room 103
    ## 15:  Cierra        1    Language  Block C Room 103
    ## 16:    <NA>        2     English  Block A Room 104
    ## 17:   Caleb        2 Mathematics  Block A Room 102
    ## 18:  Yelena        2         Art  Block B Room 102
    ## 19:  Cierra        2         Art  Block B Room 102
    ## 20: Makaela        2 Programming  Block C Room 104
    ## 21:    Elsa        2     History  Block A Room 103
    ## 22:   Adara        2   Geography  Block C Room 103
    ## 23:   Caleb        2   Geography  Block C Room 103
    ## 24:  Kalvin        2    Politics  Block C Room 102
    ## 25:    Elsa        2    Politics  Block C Room 102
    ## 26:   Adara        2    Politics  Block C Room 102
    ## 27:  Cierra        2    Politics  Block C Room 102
    ## 28:  Yelena        2    Language  Block B Room 103
    ## 29:  Kalvin        2    Language  Block B Room 103
    ## 30: Makaela        2    Language  Block B Room 103
    ##        name semester     subject building     room

Great job! Sometimes you will need to make the column types consistent
to perform a successful join.

## Multi-key, single-key

In addition to `locations`, you will work with the `teachers` dataset in
this exercise. It contains information about the teacher for each
subject. The teacher of each subject does not change between semesters.
Your goal is to build a new `data.table` containing the room allocation
for each subject, using the `teachers` and `locations` `data.table`s.

**Steps**

1.  Identify the key column(s) for joining `teachers` and `locations`
    and assign it as a character vector in the form
    `c("teachers_join_key" = "locations_join_key")` to the `join_key`
    variable.
2.  Using the `data.table` syntax, right join `locations` to `teachers`
    using the `join_key` variable.

``` r
# Load data
teachers <- fread("data/school_db/school_db_teachers.tsv")
setnames(teachers, old = "subject", new = "topic")

# Identify and set the keys
join_key <- c("topic" = "subject")

# Right join
teachers[locations, on = join_key]
```

    ##          teacher       topic semester building     room
    ##  1:  Mr. Marquez     English        1  Block B Room 103
    ##  2:   Ms. Schoon Mathematics        1  Block C Room 104
    ##  3:   Ms. Harris         Art        1  Block B Room 102
    ##  4:   Ms. Homann Programming        1  Block A Room 102
    ##  5:  Mr. Santoyo     History        1  Block B Room 101
    ##  6: Mr. Carbajal   Geography        1  Block A Room 101
    ##  7: Ms. Limitone    Politics        1  Block A Room 104
    ##  8:      Ms. Low    Language        1  Block C Room 103
    ##  9:  Mr. Marquez     English        2  Block A Room 104
    ## 10:   Ms. Schoon Mathematics        2  Block A Room 102
    ## 11:   Ms. Harris         Art        2  Block B Room 102
    ## 12:   Ms. Homann Programming        2  Block C Room 104
    ## 13:  Mr. Santoyo     History        2  Block A Room 103
    ## 14: Mr. Carbajal   Geography        2  Block C Room 103
    ## 15: Ms. Limitone    Politics        2  Block C Room 102
    ## 16:      Ms. Low    Language        2  Block B Room 103

Fantastic job! Even though the previous exercise required the
`\\"subject\\"` and `\\"semester\\"` columns from `locations` as the
join key, here only the `\\"subject\\"` column was required to match its
rows to `teachers`. Remember the join keys depend on the two
`data.tables` in the join!

## Tricky columns

Theory. Coming soon …

**1. Problem columns**

In the last lesson you learned how to work with complex join keys, and
how to diagnose and fix problems arising from misspecified joins. In
this lesson you will learn how to diagnose common problems you may
encounter with data table columns when joining.

**2. Common column names**

When joining two data tables you may sometimes find that they share
column names which are not the join keys.An example is shown on the
slide. Both data tables have “name”, “gender”, and “age” columns, and
you can see that to join these two data tables, you would need to match
the name and parent columns for the join keys.Common column names like
this pose two challenges: they make it harder to correctly identify the
join keys and they make it harder to interpret the result of the join.

**3. Common column names**

So what happens to these columns in a join?With the data table syntax,
columns from the data table passed to the i argument will have “i dot”
added to the start of their column names.

**4. Common column names with merge()**

When using the merge() function, these common column names will instead
have “dot x” or “dot y” added to the end, denoting which of the input
data tables they came from.

**5. Adding context with your own suffixes**

The suffixes argument to the merge() function allows you to use
different suffixes than just “dot x” and “dot y”. This is a useful way
of providing helpful context to the result of the join.

**6. Renaming columns**

Another solution is to rename these columns, either before or after the
join. This can be done with the setnames() function.You can either give
it a single character vector to give new names to all the columns in a
data table, or two character vectors to rename a subset of columns.

**7. Joining with `data.frames`**

Another problem you may run into is mixing of data tables and data
frames in your R session. The merge() function also works for data
frames, and can also be used to join a data frame with a data
table.Sometimes, data frames store the unique identifying information
about their rows in the rownames. You will need to extract these if you
want to use them as the join keys or want to keep that information in
the result of the join.The simplest way to do this is to convert it to a
data table using the as dot data dot table function along with the keep
dot rownames argument to convert this into a column with the column name
of your choice.

**8. Let’s practice!**

It’s time to join data tables with tricky columns.

## Column name suffixes

The three `data.table`s containing information about the geography and
population of Australia have been loaded into your R session:
`capitals`, `area`, and `population`. Both `area` and `population` now
have a column named `"percentage"`. The `"percentage"` column in `area`
contains the percentage of total land mass each state occupies. The
`"percentage"` column in `population` contains the percentage of the
total population living in each `city`.

**Steps**

1.  Use the `merge()` function to inner join `population` to `capitals`
    and save the result to `capital_pop`.
2.  Use the `merge()` function to left join `area` to `capital_pop` and
    view the result.

``` r
# Inner join
capital_pop <- merge(capitals, population, by = "city")

# Left join
merge(capital_pop, area, by = "state", all.x = TRUE)
```

    ##                 state      city   country population percentage.x area_km2
    ## 1:    New South Wales    Sydney Australia    5029768       0.2074   800641
    ## 2: Northern Territory    Darwin Australia     145916       0.0060  1349129
    ## 3:         Queensland  Brisbane Australia    2360241       0.0974  1730647
    ## 4:    South Australia  Adelaide Australia    1324279       0.0550   983482
    ## 5:           Tasmania    Hobart Australia     224462       0.0092    68401
    ## 6:           Victoria Melbourne Australia    4725316       0.1924   227416
    ## 7:  Western Australia     Perth Australia    2022044       0.0856  2529875
    ##    percentage.y
    ## 1:       0.1041
    ## 2:       0.1754
    ## 3:       0.2250
    ## 4:       0.1279
    ## 5:       0.0089
    ## 6:       0.0296
    ## 7:       0.3289

3.  This time, left join `area` to `capital_pop` changing the suffixes
    of the two `"percentage"` columns to `".pop"` and `".area"`.

``` r
# Inner join from step 1
capital_pop <- merge(capitals, population, by = "city")

# Left join with suffixes
merge(capital_pop, area, by = "state", all.x = TRUE, suffixes = c(".pop", ".area"))
```

    ##                 state      city   country population percentage.pop area_km2
    ## 1:    New South Wales    Sydney Australia    5029768         0.2074   800641
    ## 2: Northern Territory    Darwin Australia     145916         0.0060  1349129
    ## 3:         Queensland  Brisbane Australia    2360241         0.0974  1730647
    ## 4:    South Australia  Adelaide Australia    1324279         0.0550   983482
    ## 5:           Tasmania    Hobart Australia     224462         0.0092    68401
    ## 6:           Victoria Melbourne Australia    4725316         0.1924   227416
    ## 7:  Western Australia     Perth Australia    2022044         0.0856  2529875
    ##    percentage.area
    ## 1:          0.1041
    ## 2:          0.1754
    ## 3:          0.2250
    ## 4:          0.1279
    ## 5:          0.0089
    ## 6:          0.0296
    ## 7:          0.3289

Good job! Changing the suffixes is good practice because it makes it
easier to know what each column represents when you come back to the
joined `data.table` at a later time.

## Joining a data.frame

The `netflix` and `imdb` datasets have been loaded into your R session.
Your goal is to add IMBD ratings to all series in the `netflix` dataset,
but this time `netflix` has been loaded in as a `data.frame` instead of
a `data.table`.

**Steps**

1.  Convert `netflix` to a `data.table` using the `as.data.table()`
    function so that its rownames become a column named `"series"`.
2.  Right join the new `data.table` you’ve just created,`netflix_dt`, to
    `imdb` using the `data.table` join syntax.

``` r
# load data
netflix <- netflix |> tibble::column_to_rownames("title")

# Convert netflix to a data.table
netflix_dt <- as.data.table(netflix, keep.rownames = "series")

# Right join
imdb[netflix_dt, on = .(title = series)]
```

    ##                             title rating episodes release_date
    ## 1:                 13 Reasons Why    8.4       13    31-Mar-17
    ## 2: A Series of Unfortunate Events    7.9        8    13-Jan-17
    ## 3:                           Dark     NA       10     1-Dec-17
    ## 4:                        Godless     NA        6    22-Nov-17
    ## 5:                          Gypsy    7.0       10    30-Jun-17
    ## 6:                       Longmire     NA       10    17-Nov-17
    ## 7:                     Mindhunter    8.9       10    13-Oct-17
    ## 8:                          Ozark    8.5       10    21-Jul-17

Nice one! You can use the `merge()` function to join a `data.frame`, but
if you want to use the row names you will need to convert it into a
column first.

## Duplicate matches

Theory. Coming soon …

**1. Duplicate matches**

The last set of join problems you will commonly encounter arise from
duplicate matches in the join key values.

**2. Join key duplicates**

Sometimes you will want to join two data tables based on columns with
duplicate entries. In the example shown on the slide, we are joining two
data tables containing data we’ve measured on the microbial content of
soil at two different farm sites. We’ve used multiple methods to try to
quantify whether a bacterial genus is present, and if so, by how much?
We then might want to join these two data tables to get a list of
bacteria that could be found at both sites using any method, so we join
the two data tables using the genus column as the join key.This leads to
multiplicative matches. Each row in the site2_ecology data table will
match two rows in the site1 ecology_data table, leading to 12 matches
all up, six for each bacteria shown.

**3. Error from multiplicative matches**

If you try to run this code, you will get a long error as shown here
warning you that the result will have more rows than both data tables
combined.This error is shown to protect you from making unexpectedly
large data tables by accident because multiplicative matches are a
common problem in misspecified joins, which you learnt about in the
first lesson of this chapter.

**4. Allowing multiplicative matches**

When you do a join like this intentionally, you can set allow dot
cartesian equals TRUE to let the join proceed.This argument is found in
both the data table syntax and the merge() function.

**5. Allowing multiplicative matches**

With data table syntax, you will get the following data table as a
result

**6. Missing values**

If you have missing values in your join key column, then these can also
lead to multiplicative matches, because they will match all other
missing values in the join.

**7. Filtering missing values**

To remove these matches, which are likely meaningless, you can filter
out rows with missing values in the join key columns using the is dot na
function along with not operator.

**8. Keeping only the first match**

In some cases, you may want to join two data tables where each value in
the join key column has multiple matches, but you only want to keep the
first match. For example, we might have multiple collections at site 1,
but when matching to the site2_ecology data table we only want to match
the most recent collection.To do this you can set mult equals first to
keep only the first matching row in the main data table on the left side
of the join.

**9. Keeping only the last match**

Conversely, you can set mult equals last to keep only the last matching
row.

**10. Identifying and removing duplicates**

You can also use the duplicated() and unique() functions to identify and
remove duplicates.

**11. The duplicated() function**

The duplicated() function from the the data table package will tell you
which rows are duplicates. It returns a vector of TRUE and FALSE values,
where each entry corresponds to a row in the data table. A value of TRUE
means that row has the same values as one of the previous rows in the
data table.An additional argument, “by”, can be used to restrict those
checks to only a subset of columns, for example looking for duplicates
in just the join key column.

**12. The unique() function**

The unique() function takes the same arguments, but instead returns the
data table without the rows that were determined to be duplicates.

**13. Changing the search order**

You can also change the direction the duplicated() and unique()
functions search for and remove duplicates by specifying fromLast equals
TRUE.

**14. Let’s practice!**

Now it’s your turn to practice handling duplicate matches.

## Joining with missing values

Two new `data.tables` have been loaded into your R session: `heart` and
`cardio`. Each one contains a set of
<a href="https://en.wikipedia.org/wiki/DNA_microarray">microarray
probes</a> you have found to be associated with heart disease in two
separate studies\*. Each probe measures the
<a href="https://en.wikipedia.org/wiki/Gene_expression">expression
levels</a> of a gene. Each gene can be measured by one or more probes,
and some probes do not have any known gene annotation in the
<a href="https://www.ncbi.nlm.nih.gov/refseq/">human genome reference
sequence</a>. The two studies have used different microarray platforms
that use different probes to measure each gene. Your goal is to find
which genes had reproducible associations with heart disease in both
studies.

-   Note: associations are randomly generated, not representative of any
    true biological finding or real dataset.

**Steps**

1.  Using the `merge()` function, inner join `cardio` to `heart` with
    the appropriate argument to override any errors that you encounter.
2.  Remove the probes from both `data.tables` with no gene annotation
    (i.e., remove rows with missing values in the `gene` column).
3.  Repeat the inner join with the new `data.tables` to get a
    `data.table` of reproducible associations between genes and heart
    disease.

``` r
# Load data
heart  <- fread("data/heart_data/illumina_chd_genes.csv",  na.strings  = "")
cardio <- fread("data/heart_data/affymetrix_chd_genes.csv", na.strings = "") 

# Try an inner join
merge(heart, cardio, by = "gene", allow.cartesian = TRUE)
```

    ##        gene   ilmn_probe change.x pvalue.x       affy_probe change.y pvalue.y
    ##  1:    <NA> ILMN_1772594     1.26  8.7e-06 PSR06035179.hg.1     1.16  3.4e-05
    ##  2:    <NA> ILMN_1772594     1.26  8.7e-06 PSR01070675.hg.1     1.10  7.2e-05
    ##  3:    <NA> ILMN_1772594     1.26  8.7e-06 JUC05011543.hg.1     1.09  8.3e-05
    ##  4:    <NA> ILMN_1772594     1.26  8.7e-06 PSR08024619.hg.1     1.05  1.5e-04
    ##  5:    <NA> ILMN_1772594     1.26  8.7e-06 PSR20002720.hg.1     1.04  1.6e-04
    ##  6:    <NA> ILMN_3206475     1.16  3.3e-05 PSR06035179.hg.1     1.16  3.4e-05
    ##  7:    <NA> ILMN_3206475     1.16  3.3e-05 PSR01070675.hg.1     1.10  7.2e-05
    ##  8:    <NA> ILMN_3206475     1.16  3.3e-05 JUC05011543.hg.1     1.09  8.3e-05
    ##  9:    <NA> ILMN_3206475     1.16  3.3e-05 PSR08024619.hg.1     1.05  1.5e-04
    ## 10:    <NA> ILMN_3206475     1.16  3.3e-05 PSR20002720.hg.1     1.04  1.6e-04
    ## 11:    <NA> ILMN_1689153     1.11  6.4e-05 PSR06035179.hg.1     1.16  3.4e-05
    ## 12:    <NA> ILMN_1689153     1.11  6.4e-05 PSR01070675.hg.1     1.10  7.2e-05
    ## 13:    <NA> ILMN_1689153     1.11  6.4e-05 JUC05011543.hg.1     1.09  8.3e-05
    ## 14:    <NA> ILMN_1689153     1.11  6.4e-05 PSR08024619.hg.1     1.05  1.5e-04
    ## 15:    <NA> ILMN_1689153     1.11  6.4e-05 PSR20002720.hg.1     1.04  1.6e-04
    ## 16:    <NA> ILMN_3282983     1.10  7.3e-05 PSR06035179.hg.1     1.16  3.4e-05
    ## 17:    <NA> ILMN_3282983     1.10  7.3e-05 PSR01070675.hg.1     1.10  7.2e-05
    ## 18:    <NA> ILMN_3282983     1.10  7.3e-05 JUC05011543.hg.1     1.09  8.3e-05
    ## 19:    <NA> ILMN_3282983     1.10  7.3e-05 PSR08024619.hg.1     1.05  1.5e-04
    ## 20:    <NA> ILMN_3282983     1.10  7.3e-05 PSR20002720.hg.1     1.04  1.6e-04
    ## 21:    <NA> ILMN_1708533    -1.07  1.1e-04 PSR06035179.hg.1     1.16  3.4e-05
    ## 22:    <NA> ILMN_1708533    -1.07  1.1e-04 PSR01070675.hg.1     1.10  7.2e-05
    ## 23:    <NA> ILMN_1708533    -1.07  1.1e-04 JUC05011543.hg.1     1.09  8.3e-05
    ## 24:    <NA> ILMN_1708533    -1.07  1.1e-04 PSR08024619.hg.1     1.05  1.5e-04
    ## 25:    <NA> ILMN_1708533    -1.07  1.1e-04 PSR20002720.hg.1     1.04  1.6e-04
    ## 26:    <NA> ILMN_1723249     1.06  1.3e-04 PSR06035179.hg.1     1.16  3.4e-05
    ## 27:    <NA> ILMN_1723249     1.06  1.3e-04 PSR01070675.hg.1     1.10  7.2e-05
    ## 28:    <NA> ILMN_1723249     1.06  1.3e-04 JUC05011543.hg.1     1.09  8.3e-05
    ## 29:    <NA> ILMN_1723249     1.06  1.3e-04 PSR08024619.hg.1     1.05  1.5e-04
    ## 30:    <NA> ILMN_1723249     1.06  1.3e-04 PSR20002720.hg.1     1.04  1.6e-04
    ## 31:    <NA> ILMN_3206111     1.06  1.4e-04 PSR06035179.hg.1     1.16  3.4e-05
    ## 32:    <NA> ILMN_3206111     1.06  1.4e-04 PSR01070675.hg.1     1.10  7.2e-05
    ## 33:    <NA> ILMN_3206111     1.06  1.4e-04 JUC05011543.hg.1     1.09  8.3e-05
    ## 34:    <NA> ILMN_3206111     1.06  1.4e-04 PSR08024619.hg.1     1.05  1.5e-04
    ## 35:    <NA> ILMN_3206111     1.06  1.4e-04 PSR20002720.hg.1     1.04  1.6e-04
    ## 36:  ABCB10 ILMN_1665730     1.05  1.4e-04 JUC01031346.hg.1    -1.11  6.4e-05
    ## 37:  ABCB10 ILMN_1665730     1.05  1.4e-04 JUC01031349.hg.1    -1.08  9.9e-05
    ## 38:  ABCB10 ILMN_1665730     1.05  1.4e-04 JUC01031353.hg.1     1.07  1.1e-04
    ## 39:  ABCB10 ILMN_1665730     1.05  1.4e-04 PSR01059893.hg.1     1.04  1.6e-04
    ## 40:    CIB2 ILMN_1714489     1.19  2.4e-05 PSR15016581.hg.1    -1.05  1.5e-04
    ## 41:   FABP4 ILMN_1773006    -1.09  9.2e-05 PSR08017600.hg.1     1.22  1.6e-05
    ## 42:   FABP4 ILMN_1773006    -1.09  9.2e-05 PSR08017606.hg.1     1.20  2.0e-05
    ## 43: FOXD4L4 ILMN_3238576     1.10  7.6e-05 PSR09002806.hg.1    -1.15  3.9e-05
    ## 44: FOXD4L4 ILMN_3238576     1.10  7.6e-05 PSR09002801.hg.1    -1.11  6.4e-05
    ## 45: FOXD4L4 ILMN_3238576     1.10  7.6e-05 PSR09015126.hg.1     1.07  1.1e-04
    ## 46: FOXD4L4 ILMN_3238576     1.06  1.2e-04 PSR09002806.hg.1    -1.15  3.9e-05
    ## 47: FOXD4L4 ILMN_3238576     1.06  1.2e-04 PSR09002801.hg.1    -1.11  6.4e-05
    ## 48: FOXD4L4 ILMN_3238576     1.06  1.2e-04 PSR09015126.hg.1     1.07  1.1e-04
    ## 49:    GYPB ILMN_1683093     1.15  4.1e-05 PSR04029411.hg.1     1.13  5.1e-05
    ## 50:    GYPB ILMN_1683093     1.15  4.1e-05 PSR04029413.hg.1     1.12  6.1e-05
    ## 51:    GZMB ILMN_2109489     1.10  8.0e-05 PSR14011271.hg.1     1.08  1.0e-04
    ## 52:    ISCU ILMN_2409062     1.11  6.4e-05 JUC12005887.hg.1    -1.09  8.3e-05
    ## 53:    ISCU ILMN_2409062     1.11  6.4e-05 JUC12005889.hg.1     1.05  1.5e-04
    ## 54:    ISCU ILMN_1735432     1.08  1.0e-04 JUC12005887.hg.1    -1.09  8.3e-05
    ## 55:    ISCU ILMN_1735432     1.08  1.0e-04 JUC12005889.hg.1     1.05  1.5e-04
    ## 56:  SEPHS1 ILMN_2176768    -1.16  3.3e-05 PSR10013017.hg.1    -1.18  2.6e-05
    ## 57:  SEPHS1 ILMN_2176768    -1.16  3.3e-05 JUC10007537.hg.1     1.12  6.0e-05
    ## 58:  SEPHS1 ILMN_2176768    -1.16  3.3e-05 JUC10007538.hg.1    -1.11  6.5e-05
    ## 59:  SEPHS1 ILMN_1673369     1.09  8.2e-05 PSR10013017.hg.1    -1.18  2.6e-05
    ## 60:  SEPHS1 ILMN_1673369     1.09  8.2e-05 JUC10007537.hg.1     1.12  6.0e-05
    ## 61:  SEPHS1 ILMN_1673369     1.09  8.2e-05 JUC10007538.hg.1    -1.11  6.5e-05
    ## 62:   TSTA3 ILMN_1697777     1.09  9.1e-05 JUC08011706.hg.1    -1.14  4.2e-05
    ## 63:  ZDHHC2 ILMN_1769783     1.04  1.6e-04 JUC08000597.hg.1     1.12  5.9e-05
    ##        gene   ilmn_probe change.x pvalue.x       affy_probe change.y pvalue.y

``` r
# Filter missing values
heart_2  <- heart[!is.na(gene)]
cardio_2 <- cardio[!is.na(gene)]

# Inner join the filtered data.tables
merge(heart_2, cardio_2, by = "gene")
```

    ##        gene   ilmn_probe change.x pvalue.x       affy_probe change.y pvalue.y
    ##  1:  ABCB10 ILMN_1665730     1.05  1.4e-04 JUC01031346.hg.1    -1.11  6.4e-05
    ##  2:  ABCB10 ILMN_1665730     1.05  1.4e-04 JUC01031349.hg.1    -1.08  9.9e-05
    ##  3:  ABCB10 ILMN_1665730     1.05  1.4e-04 JUC01031353.hg.1     1.07  1.1e-04
    ##  4:  ABCB10 ILMN_1665730     1.05  1.4e-04 PSR01059893.hg.1     1.04  1.6e-04
    ##  5:    CIB2 ILMN_1714489     1.19  2.4e-05 PSR15016581.hg.1    -1.05  1.5e-04
    ##  6:   FABP4 ILMN_1773006    -1.09  9.2e-05 PSR08017600.hg.1     1.22  1.6e-05
    ##  7:   FABP4 ILMN_1773006    -1.09  9.2e-05 PSR08017606.hg.1     1.20  2.0e-05
    ##  8: FOXD4L4 ILMN_3238576     1.10  7.6e-05 PSR09002806.hg.1    -1.15  3.9e-05
    ##  9: FOXD4L4 ILMN_3238576     1.10  7.6e-05 PSR09002801.hg.1    -1.11  6.4e-05
    ## 10: FOXD4L4 ILMN_3238576     1.10  7.6e-05 PSR09015126.hg.1     1.07  1.1e-04
    ## 11: FOXD4L4 ILMN_3238576     1.06  1.2e-04 PSR09002806.hg.1    -1.15  3.9e-05
    ## 12: FOXD4L4 ILMN_3238576     1.06  1.2e-04 PSR09002801.hg.1    -1.11  6.4e-05
    ## 13: FOXD4L4 ILMN_3238576     1.06  1.2e-04 PSR09015126.hg.1     1.07  1.1e-04
    ## 14:    GYPB ILMN_1683093     1.15  4.1e-05 PSR04029411.hg.1     1.13  5.1e-05
    ## 15:    GYPB ILMN_1683093     1.15  4.1e-05 PSR04029413.hg.1     1.12  6.1e-05
    ## 16:    GZMB ILMN_2109489     1.10  8.0e-05 PSR14011271.hg.1     1.08  1.0e-04
    ## 17:    ISCU ILMN_2409062     1.11  6.4e-05 JUC12005887.hg.1    -1.09  8.3e-05
    ## 18:    ISCU ILMN_2409062     1.11  6.4e-05 JUC12005889.hg.1     1.05  1.5e-04
    ## 19:    ISCU ILMN_1735432     1.08  1.0e-04 JUC12005887.hg.1    -1.09  8.3e-05
    ## 20:    ISCU ILMN_1735432     1.08  1.0e-04 JUC12005889.hg.1     1.05  1.5e-04
    ## 21:  SEPHS1 ILMN_2176768    -1.16  3.3e-05 PSR10013017.hg.1    -1.18  2.6e-05
    ## 22:  SEPHS1 ILMN_2176768    -1.16  3.3e-05 JUC10007537.hg.1     1.12  6.0e-05
    ## 23:  SEPHS1 ILMN_2176768    -1.16  3.3e-05 JUC10007538.hg.1    -1.11  6.5e-05
    ## 24:  SEPHS1 ILMN_1673369     1.09  8.2e-05 PSR10013017.hg.1    -1.18  2.6e-05
    ## 25:  SEPHS1 ILMN_1673369     1.09  8.2e-05 JUC10007537.hg.1     1.12  6.0e-05
    ## 26:  SEPHS1 ILMN_1673369     1.09  8.2e-05 JUC10007538.hg.1    -1.11  6.5e-05
    ## 27:   TSTA3 ILMN_1697777     1.09  9.1e-05 JUC08011706.hg.1    -1.14  4.2e-05
    ## 28:  ZDHHC2 ILMN_1769783     1.04  1.6e-04 JUC08000597.hg.1     1.12  5.9e-05
    ##        gene   ilmn_probe change.x pvalue.x       affy_probe change.y pvalue.y

Nice work! If the only columns that have the same name across two
data.tables are the join keys, you can drop the `by` argument from
`merge()` - it will find and use these columns as the join keys
automatically!

## Filtering duplicates

The `heart_2` and `cardio_2` data tables you filtered for missing values
are available in your workspace. Your goal is to select one
representative probe per gene in each `data.table` so that each gene has
only a single entry in the join result. You want to select the probe
with the weakest association to get a conservative estimate of
reproducibility. The `"change"` column contains the fold change in
expression levels for each probe between the healthy subjects and those
with heart disease\*. The `"pvalue"` column contains the p-value for the
association strength. Rows are ordered by decreasing order of
association strength (by increasing P-value).

-   Note: associations are randomly generated, not representative of any
    true biological finding or real dataset.

**Steps**

1.  Use the `unique()` function to remove duplicate entries in the
    `"gene"` column in both `heart_2` and `cardio_2`. Keep only the
    *last* row for each gene.  
2.  Inner join `cardio_3` to `heart_3` using the `merge()` function.
    Append `".heart"` and `".cardio"` as suffixes to the `"change"` and
    `"pvalue"` columns.

``` r
# Keep only the last probe for each gene
heart_3  <- unique(heart_2,  by = "gene", fromLast = TRUE)
cardio_3 <- unique(cardio_2, by = "gene", fromLast = TRUE)

# Inner join
reproducible <- merge(heart_3, cardio_3, by = "gene", suffixes = c(".heart", ".cardio"))
reproducible
```

    ##        gene   ilmn_probe change.heart pvalue.heart       affy_probe
    ##  1:  ABCB10 ILMN_1665730         1.05      1.4e-04 PSR01059893.hg.1
    ##  2:    CIB2 ILMN_1714489         1.19      2.4e-05 PSR15016581.hg.1
    ##  3:   FABP4 ILMN_1773006        -1.09      9.2e-05 PSR08017606.hg.1
    ##  4: FOXD4L4 ILMN_3238576         1.06      1.2e-04 PSR09015126.hg.1
    ##  5:    GYPB ILMN_1683093         1.15      4.1e-05 PSR04029413.hg.1
    ##  6:    GZMB ILMN_2109489         1.10      8.0e-05 PSR14011271.hg.1
    ##  7:    ISCU ILMN_1735432         1.08      1.0e-04 JUC12005889.hg.1
    ##  8:  SEPHS1 ILMN_1673369         1.09      8.2e-05 JUC10007538.hg.1
    ##  9:   TSTA3 ILMN_1697777         1.09      9.1e-05 JUC08011706.hg.1
    ## 10:  ZDHHC2 ILMN_1769783         1.04      1.6e-04 JUC08000597.hg.1
    ##     change.cardio pvalue.cardio
    ##  1:          1.04       1.6e-04
    ##  2:         -1.05       1.5e-04
    ##  3:          1.20       2.0e-05
    ##  4:          1.07       1.1e-04
    ##  5:          1.12       6.1e-05
    ##  6:          1.08       1.0e-04
    ##  7:          1.05       1.5e-04
    ##  8:         -1.11       6.5e-05
    ##  9:         -1.14       4.2e-05
    ## 10:          1.12       5.9e-05

Great job! You could also have filtered duplicates using the
`duplicated()` function:
`heart <- heart[!duplicated(heart, by=\\"gene\\", fromLast = TRUE)]`.

## Joining and filtering duplicates

Another `data.table` has been loaded into your R session, `framingham`,
containing a set of 35 genes and their associations with heart disease
from an open access study
<a href="https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3684247/">by
Joehanes R. *et al.* published in 2013</a>. Your goal is to compare the
results of this study to the results from each of your studies. The
`cardio_2` and `heart_2` `data.table`s filtered for missing values, but
still containing multiple probes for each gene, have been loaded into
your R session. The `data.table` of reproducible associations you
created in the last exercise, `reproducible`, has also been loaded into
your R session.

**Steps**

1.  Using the `data.table` syntax, right join `framingham` to `heart_2`,
    taking the first probe for each gene in `heart_2`.
2.  Anti-join `framingham` to `reproducible` to see whether you found
    any genes that have not previously been seen to have an association
    with heart disease.

``` r
# Load data
framingham <- fread("data/heart_data/framingham_chd_genes.csv", na.strings = "")

# Right join taking the first match
heart_2[framingham, on = .(gene), mult = "first"]
```

    ##       ilmn_probe              gene change  pvalue i.change i.pvalue
    ##  1:         <NA>             SGIP1     NA      NA     1.06  8.1e-06
    ##  2: ILMN_2109489              GZMB   1.10 8.0e-05    -1.14  1.4e-05
    ##  3:         <NA>           SLC7A11     NA      NA     1.09  2.8e-05
    ##  4: ILMN_1725594           FAM188A  -1.18 2.8e-05     1.07  3.2e-05
    ##  5:         <NA> CCDC144B/CCDC144A     NA      NA     1.26  3.8e-05
    ##  6:         <NA>             TMTC2     NA      NA     1.07  4.7e-05
    ##  7: ILMN_1712400          SERPINB6   1.17 3.0e-05    -1.06  1.5e-04
    ##  8: ILMN_2344204             PRR13   1.14 4.6e-05     1.11  1.8e-04
    ##  9:         <NA>            TMEM56     NA      NA     1.12  2.3e-04
    ## 10:         <NA>          C20orf20     NA      NA     1.08  2.9e-04
    ## 11:         <NA>              GATS     NA      NA    -1.05  3.1e-04
    ## 12: ILMN_1665730            ABCB10   1.05 1.4e-04     1.09  3.5e-04
    ## 13: ILMN_2409062              ISCU   1.11 6.4e-05     1.08  3.6e-04
    ## 14:         <NA>             PAGE1     NA      NA     1.08  4.0e-04
    ## 15: ILMN_1769783            ZDHHC2   1.04 1.6e-04     1.10  4.0e-04
    ## 16: ILMN_1714489              CIB2   1.19 2.4e-05    -1.07  4.1e-04
    ## 17:         <NA>             CRYGB     NA      NA    -1.08  4.4e-04
    ## 18: ILMN_1773006             FABP4  -1.09 9.2e-05     1.09  4.7e-04
    ## 19:         <NA>              FIS1     NA      NA     1.11  5.5e-04
    ## 20: ILMN_1657680            CCDC69  -1.05 1.5e-04    -1.05  5.5e-04
    ## 21: ILMN_1683093              GYPB   1.15 4.1e-05     1.12  5.8e-04
    ## 22:         <NA>             DLEU2     NA      NA     1.09  6.6e-04
    ## 23:         <NA>             RBM24     NA      NA     1.05  6.9e-04
    ## 24:         <NA>               HBM     NA      NA     1.11  7.6e-04
    ## 25: ILMN_1697777             TSTA3   1.09 9.1e-05     1.11  7.7e-04
    ## 26: ILMN_1749930            TMEM48  -1.06 1.3e-04     1.06  8.0e-04
    ## 27:         <NA>         GABARAPL2     NA      NA     1.08  8.0e-04
    ## 28:         <NA>            MAPRE2     NA      NA    -1.05  8.1e-04
    ## 29: ILMN_1794306             USP28  -1.10 7.3e-05    -1.08  8.1e-04
    ## 30:         <NA>              DAD1     NA      NA     1.05  8.4e-04
    ## 31: ILMN_1793410             SNTB1   1.23 1.2e-05     1.04  8.5e-04
    ## 32:         <NA>             STX1B     NA      NA     1.07  8.6e-04
    ## 33:         <NA>             PRPF3     NA      NA    -1.05  8.8e-04
    ## 34:         <NA>              GUK1     NA      NA     1.12  9.1e-04
    ## 35:         <NA>             CHPT1     NA      NA     1.09  9.7e-04
    ##       ilmn_probe              gene change  pvalue i.change i.pvalue

``` r
# Anti-join
reproducible[!framingham, on = .(gene)]
```

    ##       gene   ilmn_probe change.heart pvalue.heart       affy_probe
    ## 1: FOXD4L4 ILMN_3238576         1.06      1.2e-04 PSR09015126.hg.1
    ## 2:  SEPHS1 ILMN_1673369         1.09      8.2e-05 JUC10007538.hg.1
    ##    change.cardio pvalue.cardio
    ## 1:          1.07       1.1e-04
    ## 2:         -1.11       6.5e-05

Excellent work! You could also select the last probe per gene by setting
`mult = \\"last\\"`.

# 4. Concatenating and Reshaping data.tables

In the last chapter of this course you’ll learn how to concatenate
observations from multiple tables together, how to identify observations
present in one table but not another, and how to reshape tables between
long and wide formats.

## Concatenating two or more data.tables

Theory. Coming soon …

**1. Concatenating data.tables**

Welcome back! In this lesson you will learn how to work with datasets
whose rows are spread across multiple data tables by concatenating them
into a single data table.

**2. Same columns, different data.tables**

Sometimes datasets you want to work with are split across multiple data
tables, usually because they’ve been read in from multiple files. You
may want to concatenate these rows into a single data table.

**3. Concatenation functions**

There are two functions you can use to concatenate data tables. The
rbind() function, and the rbindlist() function.

**4. The rbind() function**

The rbind() function takes any number of data tables as inputs, and
concatenates their rows into a single data table.

**5. Adding an identifier column**

Each of these variables can be given names using the equals operator,
and an extra argument “idcol” will tell rbind() to use these names to
create an extra column in the result that indicates each row’s data
table of origin.

**6. Adding an identifier column**

If you use the idcol argument without naming the variables the data
tables will be numbered instead.

**7. Adding an identifier column**

And if you don’t supply a column name to idcol and just set it to true,
the column will be named “dot id”.

**8. Handling missing columns**

When the input data tables each have a different number of columns, you
will need to set the fill argument to TRUE. This will fill the missing
columns with NAs in the result.

**9. Handling missing columns**

If you don’t do this, the code will result in an error that looks like
this, telling you that the column numbers are inconsistent.

**10. The rbindlist() function**

You can use the rbindlist() function if your data tables are stored as
elements of a single list.An example of where you might find this useful
is when you have several files you want to import into a single data
table. Rather than reading each file into separate variables, you could
load these into a list by lapply()-ing the fread() function over a
vector of file names, and then use the rbindlist() function to
concatenate their rows into a single data table.

**11. Adding an identifier column**

When using the rbindlist() function, the idcol argument uses the names
of the list elements when creating the additional identifier column.

**12. Handling different column orders**

Finally, the use dot names argument in both rbind() and rbindlist()
functions matches columns by their names when concatenating data tables.

**13. `data.tables` with different column names**

Setting use dot names to false allows you to concatenate data tables
whose columns have different names.

**14. Pitfalls of `use.names = FALSE`**

But, you need to be careful because it will mean columns are always
concatenated in the order they are found.

**15. Differing defaults**

The use dot names argument has different defaults in the rbind() and
rbindlist() functions.By default it is true in the rbind() function, but
in the rbindlist() function its default is FALSE, and changes to TRUE if
you set fill equal to TRUE.

**16. Let’s practice!**

Now it’s your turn to see how these functions work in practice.

## Concatenating data.table variables

Three `data.table`s containing Ebola case numbers
<a href="http://apps.who.int/gho/data/node.ebola-sitrep">reported in
Guinea to the World Health Organisation</a> for three weeks at the
height of the 2014 Ebola outbreak have been loaded into your R session:
`ebola_W50`, `ebola_W51`, and `ebola_W52`. Your goal is to create a
single `data.table` containing the case numbers in each region of Guinea
across all three weeks.

**Steps**

``` r
# Load data
ebola_W50 <- fread("data/ebola_cases/ebola_2014_W50.csv")
ebola_W51 <- fread("data/ebola_cases/ebola_2014_W51.csv")
ebola_W52 <- fread("data/ebola_cases/ebola_2014_W52.csv")
```

1.  Concatenate `ebola_W50` and `ebola_W51` (in that order) using the
    <a href="https://www.rdocumentation.org/packages/data.table/topics/rbindlist">`rbind()`</a>
    function.

``` r
# Concatenate case numbers from weeks 50 and 51
rbind(ebola_W50, ebola_W51)
```

    ##        Location period_code     period_start       period_end Confirmed
    ##  1:     CONAKRY    2014-W50 08 December 2014 14 December 2014        37
    ##  2:       COYAH    2014-W50 08 December 2014 14 December 2014        31
    ##  3:      DABOLA    2014-W50 08 December 2014 14 December 2014         2
    ##  4:     DUBREKA    2014-W50 08 December 2014 14 December 2014         6
    ##  5:     FARANAH    2014-W50 08 December 2014 14 December 2014         0
    ##  6:  FORECARIAH    2014-W50 08 December 2014 14 December 2014        22
    ##  7:   GUECKEDOU    2014-W50 08 December 2014 14 December 2014         3
    ##  8:      KANKAN    2014-W50 08 December 2014 14 December 2014         2
    ##  9:    KEROUANE    2014-W50 08 December 2014 14 December 2014         9
    ## 10:      KINDIA    2014-W50 08 December 2014 14 December 2014         1
    ## 11: KISSIDOUGOU    2014-W50 08 December 2014 14 December 2014         2
    ## 12:   KOUROUSSA    2014-W50 08 December 2014 14 December 2014         3
    ## 13:        LOLA    2014-W50 08 December 2014 14 December 2014         4
    ## 14:     MACENTA    2014-W50 08 December 2014 14 December 2014         6
    ## 15:  N'ZEREKORE    2014-W50 08 December 2014 14 December 2014        13
    ## 16:     SIGUIRI    2014-W50 08 December 2014 14 December 2014         0
    ## 17:    TELIMELE    2014-W50 08 December 2014 14 December 2014        10
    ## 18:       BEYLA    2014-W51 15 December 2014 21 December 2014         3
    ## 19:     CONAKRY    2014-W51 15 December 2014 21 December 2014        39
    ## 20:       COYAH    2014-W51 15 December 2014 21 December 2014        35
    ## 21:      DABOLA    2014-W51 15 December 2014 21 December 2014         1
    ## 22:     DUBREKA    2014-W51 15 December 2014 21 December 2014         5
    ## 23:  FORECARIAH    2014-W51 15 December 2014 21 December 2014        15
    ## 24:        FRIA    2014-W51 15 December 2014 21 December 2014         1
    ## 25:   GUECKEDOU    2014-W51 15 December 2014 21 December 2014         7
    ## 26:      KANKAN    2014-W51 15 December 2014 21 December 2014         2
    ## 27:    KEROUANE    2014-W51 15 December 2014 21 December 2014        17
    ## 28:      KINDIA    2014-W51 15 December 2014 21 December 2014        21
    ## 29: KISSIDOUGOU    2014-W51 15 December 2014 21 December 2014       117
    ## 30:        LOLA    2014-W51 15 December 2014 21 December 2014        14
    ## 31:     MACENTA    2014-W51 15 December 2014 21 December 2014        24
    ## 32:  N'ZEREKORE    2014-W51 15 December 2014 21 December 2014        18
    ## 33:    TELIMELE    2014-W51 15 December 2014 21 December 2014         6
    ##        Location period_code     period_start       period_end Confirmed
    ##     Probable
    ##  1:        6
    ##  2:        5
    ##  3:        0
    ##  4:        3
    ##  5:       14
    ##  6:        1
    ##  7:        0
    ##  8:        0
    ##  9:        0
    ## 10:       24
    ## 11:        0
    ## 12:        0
    ## 13:        0
    ## 14:        0
    ## 15:        0
    ## 16:        4
    ## 17:        0
    ## 18:        0
    ## 19:        6
    ## 20:        0
    ## 21:        0
    ## 22:        1
    ## 23:        0
    ## 24:        0
    ## 25:        0
    ## 26:        0
    ## 27:        0
    ## 28:        6
    ## 29:       31
    ## 30:        1
    ## 31:        2
    ## 32:        0
    ## 33:        0
    ##     Probable

2.  Modify your call to `rbind()` to also concatenate `ebola_W52`. You
    should get an error.

``` r
# Concatenate case numbers from all three weeks
rbind(ebola_W50, ebola_W51, ebola_W52)
```

    ## Error in rbindlist(l, use.names, fill, idcol): Item 3 has 5 columns, inconsistent with item 1 which has 6 columns. To fill missing columns use fill=TRUE.

3.  Fix your call to `rbind()` so that the three `data.tables` are
    successfully concatenated.

``` r
# Modify the code
rbind(ebola_W50, ebola_W51, ebola_W52, fill = TRUE)
```

    ##        Location period_code     period_start       period_end Confirmed
    ##  1:     CONAKRY    2014-W50 08 December 2014 14 December 2014        37
    ##  2:       COYAH    2014-W50 08 December 2014 14 December 2014        31
    ##  3:      DABOLA    2014-W50 08 December 2014 14 December 2014         2
    ##  4:     DUBREKA    2014-W50 08 December 2014 14 December 2014         6
    ##  5:     FARANAH    2014-W50 08 December 2014 14 December 2014         0
    ##  6:  FORECARIAH    2014-W50 08 December 2014 14 December 2014        22
    ##  7:   GUECKEDOU    2014-W50 08 December 2014 14 December 2014         3
    ##  8:      KANKAN    2014-W50 08 December 2014 14 December 2014         2
    ##  9:    KEROUANE    2014-W50 08 December 2014 14 December 2014         9
    ## 10:      KINDIA    2014-W50 08 December 2014 14 December 2014         1
    ## 11: KISSIDOUGOU    2014-W50 08 December 2014 14 December 2014         2
    ## 12:   KOUROUSSA    2014-W50 08 December 2014 14 December 2014         3
    ## 13:        LOLA    2014-W50 08 December 2014 14 December 2014         4
    ## 14:     MACENTA    2014-W50 08 December 2014 14 December 2014         6
    ## 15:  N'ZEREKORE    2014-W50 08 December 2014 14 December 2014        13
    ## 16:     SIGUIRI    2014-W50 08 December 2014 14 December 2014         0
    ## 17:    TELIMELE    2014-W50 08 December 2014 14 December 2014        10
    ## 18:       BEYLA    2014-W51 15 December 2014 21 December 2014         3
    ## 19:     CONAKRY    2014-W51 15 December 2014 21 December 2014        39
    ## 20:       COYAH    2014-W51 15 December 2014 21 December 2014        35
    ## 21:      DABOLA    2014-W51 15 December 2014 21 December 2014         1
    ## 22:     DUBREKA    2014-W51 15 December 2014 21 December 2014         5
    ## 23:  FORECARIAH    2014-W51 15 December 2014 21 December 2014        15
    ## 24:        FRIA    2014-W51 15 December 2014 21 December 2014         1
    ## 25:   GUECKEDOU    2014-W51 15 December 2014 21 December 2014         7
    ## 26:      KANKAN    2014-W51 15 December 2014 21 December 2014         2
    ## 27:    KEROUANE    2014-W51 15 December 2014 21 December 2014        17
    ## 28:      KINDIA    2014-W51 15 December 2014 21 December 2014        21
    ## 29: KISSIDOUGOU    2014-W51 15 December 2014 21 December 2014       117
    ## 30:        LOLA    2014-W51 15 December 2014 21 December 2014        14
    ## 31:     MACENTA    2014-W51 15 December 2014 21 December 2014        24
    ## 32:  N'ZEREKORE    2014-W51 15 December 2014 21 December 2014        18
    ## 33:    TELIMELE    2014-W51 15 December 2014 21 December 2014         6
    ## 34:       BEYLA    2014-W52 22 December 2014 28 December 2014         1
    ## 35:     CONAKRY    2014-W52 22 December 2014 28 December 2014        46
    ## 36:       COYAH    2014-W52 22 December 2014 28 December 2014        23
    ## 37:      DABOLA    2014-W52 22 December 2014 28 December 2014         2
    ## 38:     DUBREKA    2014-W52 22 December 2014 28 December 2014        36
    ## 39:     FARANAH    2014-W52 22 December 2014 28 December 2014         4
    ## 40:  FORECARIAH    2014-W52 22 December 2014 28 December 2014         2
    ## 41:   GUECKEDOU    2014-W52 22 December 2014 28 December 2014         1
    ## 42:      KANKAN    2014-W52 22 December 2014 28 December 2014         3
    ## 43:    KEROUANE    2014-W52 22 December 2014 28 December 2014         4
    ## 44:      KINDIA    2014-W52 22 December 2014 28 December 2014        31
    ## 45: KISSIDOUGOU    2014-W52 22 December 2014 28 December 2014        26
    ## 46:   KOUROUSSA    2014-W52 22 December 2014 28 December 2014         1
    ## 47:        LOLA    2014-W52 22 December 2014 28 December 2014        17
    ## 48:     MACENTA    2014-W52 22 December 2014 28 December 2014         4
    ## 49:  N'ZEREKORE    2014-W52 22 December 2014 28 December 2014         5
    ## 50:     SIGUIRI    2014-W52 22 December 2014 28 December 2014         2
    ## 51:    TELIMELE    2014-W52 22 December 2014 28 December 2014        10
    ##        Location period_code     period_start       period_end Confirmed
    ##     Probable
    ##  1:        6
    ##  2:        5
    ##  3:        0
    ##  4:        3
    ##  5:       14
    ##  6:        1
    ##  7:        0
    ##  8:        0
    ##  9:        0
    ## 10:       24
    ## 11:        0
    ## 12:        0
    ## 13:        0
    ## 14:        0
    ## 15:        0
    ## 16:        4
    ## 17:        0
    ## 18:        0
    ## 19:        6
    ## 20:        0
    ## 21:        0
    ## 22:        1
    ## 23:        0
    ## 24:        0
    ## 25:        0
    ## 26:        0
    ## 27:        0
    ## 28:        6
    ## 29:       31
    ## 30:        1
    ## 31:        2
    ## 32:        0
    ## 33:        0
    ## 34:       NA
    ## 35:       NA
    ## 36:       NA
    ## 37:       NA
    ## 38:       NA
    ## 39:       NA
    ## 40:       NA
    ## 41:       NA
    ## 42:       NA
    ## 43:       NA
    ## 44:       NA
    ## 45:       NA
    ## 46:       NA
    ## 47:       NA
    ## 48:       NA
    ## 49:       NA
    ## 50:       NA
    ## 51:       NA
    ##     Probable

Good job! Datasets with regular updates may come in separate files. The
`rbind()` function enables you to reliably and efficiently concatenate
these into a single `data.table` once they have been loaded into your R
session with `fread()`.

## Concatenating a list of data.tables

A list of `data.table`s has been loaded into your R session: `gdp`. Its
elements contain a `data.table` for each continent, each `data.table`
containing the gross domestic product (gdp) in the year 2000 for the
countries in each continent (data sourced from the
<a href="https://www.gapminder.org">Gapminder foundation</a>). Your goal
is to build a new `data.table` containing the observations from all
`data.table`s in the `gdp` `list`

**Steps**

1.  Concatenate all `data.table`s in the `gdp` `list`, saving the result
    to `gdp_all_1`.

*Column 2 \[‘country’\] of item 3 appears in position 1 in item 2. Set
use.names=TRUE to match by column name, or use.names=FALSE to ignore
column names. use.names=‘check’ (default from v1.12.2) emits this
message and proceeds as if use.names=FALSE for backwards compatibility.
See news item 5 in v1.12.2 for options to control this message.*

``` r
# Load packages
library(stringr)
library(purrr)
```

    ## 
    ## Attaching package: 'purrr'

    ## The following object is masked from 'package:data.table':
    ## 
    ##     transpose

``` r
# Load data
gdp <- list.files("data/gdp/", full.names = T, pattern = ".*_2000.csv") %>%
            .[!(. |> str_detect("middle_east"))] %>%
            map(fread) |> 
            set_names(c("africa","asia","europe","north_america","oceania","south_america"))

# Concatenate its data.tables
gdp_all_1 <- rbindlist(gdp, use.names = FALSE)
```

2.  Modify the code so that a new column, `"continent"` is created in
    the result stored in `gdp_all_2`, which contains the continent(s)
    each country is located in.
3.  Inspect the result in your console.

``` r
# Concatenate its data.tables
gdp_all_2 <- rbindlist(gdp, idcol = "continent", use.names = FALSE)
```

4.  In your console run the code to check the result of your previous
    call to `rbindlist()`. Can you see any problems?
5.  Modify your call to `rbindlist()` to fix any problems you have
    found, saving the result in `gdp_all_3`.

``` r
# Run this code to inspect gdp_all_2
gdp_all_2 <- rbindlist(gdp, idcol = "continent")
```

    ## Column 2 ['country'] of item 3 appears in position 1 in item 2. Set use.names=TRUE to match by column name, or use.names=FALSE to ignore column names. use.names='check' (default from v1.12.2) emits this message and proceeds as if use.names=FALSE for  backwards compatibility. See news item 5 in v1.12.2 for options to control this message.

``` r
str(gdp_all_2)
```

    ## Classes 'data.table' and 'data.frame':   207 obs. of  6 variables:
    ##  $ continent     : chr  "africa" "africa" "africa" "africa" ...
    ##  $ country       : chr  "Algeria" "Angola" "Benin" "Botswana" ...
    ##  $ year          : chr  "2000" "2000" "2000" "2000" ...
    ##  $ gdp_per_capita: num  1794 298 346 3204 212 ...
    ##  $ population    : int  31183658 15058638 6949366 1736579 11607944 6767073 15927713 438737 3726048 8343321 ...
    ##  $ total_gdp     : num  5.60e+10 4.49e+09 2.40e+09 5.56e+09 2.47e+09 ...
    ##  - attr(*, ".internal.selfref")=<externalptr>

``` r
gdp_all_2[95:105]
```

    ##     continent              country       year gdp_per_capita population
    ##  1:      asia         Turkmenistan       2000       645.2771    4501419
    ##  2:      asia United Arab Emirates       2000     34395.1491    3050128
    ##  3:      asia           Uzbekistan       2000       558.2211   24518222
    ##  4:      asia              Vietnam       2000       401.5478   80285563
    ##  5:      asia   West Bank and Gaza       2000      1369.1930    3223781
    ##  6:      asia                Yemen       2000       543.7139   17795219
    ##  7:    europe              3121965    Albania      1200.1374       2000
    ##  8:    europe                65399    Andorra     17539.4420       2000
    ##  9:    europe              3076098    Armenia       621.4248       2000
    ## 10:    europe              8050884    Austria     23974.1831       2000
    ## 11:    europe              8117742 Azerbaijan       655.0974       2000
    ##        total_gdp
    ##  1:   2904662605
    ##  2: 104909607426
    ##  3:  13686589934
    ##  4:  32238491363
    ##  5:   4413978466
    ##  6:   9675507618
    ##  7:   3746787074
    ##  8:   1147061967
    ##  9:   1911563665
    ## 10: 193013366891
    ## 11:   5317911943

``` r
# Fix the problem
gdp_all_3 <- rbindlist(gdp, idcol = "continent", use.names = TRUE)
gdp_all_3
```

    ##          continent      country year gdp_per_capita population    total_gdp
    ##   1:        africa      Algeria 2000      1794.4052   31183658  55956119099
    ##   2:        africa       Angola 2000       298.4058   15058638   4493585565
    ##   3:        africa        Benin 2000       345.9504    6949366   2404135636
    ##   4:        africa     Botswana 2000      3204.1155    1736579   5564199661
    ##   5:        africa Burkina Faso 2000       212.3754   11607944   2465241592
    ##  ---                                                                       
    ## 203: south_america     Paraguay 2000      1323.4819    5302703   7018031622
    ## 204: south_america         Peru 2000      2060.5763   25914875  53399576128
    ## 205: south_america     Suriname 2000      1911.0463     480751    918737427
    ## 206: south_america      Uruguay 2000      6914.3626    3321242  22964271411
    ## 207: south_america    Venezuela 2000      4818.7082   24481477 117969093478

Fantastic! Remember to check the data tables created by `rbind()` or
`rbindlist()` for correctness: these functions do not throw an error if
the wrong columns are concatenated!

## Set operations

Theory. Coming soon …

**1. Set operations**

In this lesson, you will learn how to use set operations to compare and
combine the rows of two data tables that have the same columns.

**2. Set operation functions**

This group of three functions will enable you to identify rows that are
duplicated across two data tables, those unique to either data table,
and concatenate two data tables keeping only the unique rows in both.

**3. Set operations: `fintersect()`**

The fintersect() function takes two data tables that have the same
columns as its inputs and returns a new data table containing the set of
rows that can be found in both data tables. You can see in the example
running fintersect() on these two data tables will return just the
highlighted rows.

**4. `fintersect()` and duplicate rows**

By default only one copy of each row is returned, even if there are
multiple copies in each data table.

**5. `fintersect()` and duplicate rows**

You can set all equals TRUE to keep all pairs of matching duplicates. In
the example, two copies of the yellow lion row can be found in both dt1
and dt2, so there are two copies in the result. The extra copy in dt1 is
ignored, because it doesn’t have another copy it can match to in dt2.

**6. Set operations: `fsetdiff()`**

The fsetdiff() function takes two data tables that have the same columns
as its inputs, and returns a new data table containing the set of rows
that are only found in the data table supplied as its first argument.In
the example here, you can see fsetdiff() returns the rows from dt1
highlighted in blue. These are the rows that are unique to dt1.

**7. `fsetdiff()` and duplicates**

When there are duplicate rows, only one copy of each row is returned in
the result by default.

**8. `fsetdiff()` and duplicates**

When you set all equals TRUE, any copies unique to the first data table
are also returned.Here, not only do we keep both copies of the
“antelope” row highlighted in purple, but one of the “lion” rows
highlighted in yellow is also included in the result. This is because
there are three copies of this row in dt1, and only two in dt2, so the
extra copy in dt1 is returned because it does not have a matching pair
in dt2.

**9. Set operations: `funion()`**

The funion() function takes two data tables that have the same columns
as its inputs and returns a new data table containing the set of all
unique rows found in either data table.

**10. `funion()` and duplicates**

By default, duplicate rows are ignored. The result will only contain one
copy of each unique row.

**11. `funion()` and duplicates**

Setting all equals TRUE will keep all copies of each row. The result is
equivalent to using the rbind function to concatenate the two data
tables.

**12. Removing duplicates when combining many `data.tables`**

The funion() function is a useful way to concatenate two data tables
while removing duplicate rows.When working with more than two data
tables, you can concatenate them all using the rbind() or rbindlist()
functions, and then use the duplicated() and unique() functions to
identify or remove the duplicate rows.

**13. Let’s practice!**

Now, its your turn to practice set operations.

## Identifying observations shared by multiple tables

The list of data tables, `gdp`, is available in your workspace. Your
goal is to find the countries that are located in more than one
continent, *i.e.*, rows that are present in more than one `data.table`
in `gdp`.

**Steps**

1.  Use the `fintersect()` function to build a new `data.table`
    containing countries located in both Europe and Asia.
2.  Concatenate all `data.table`s in `gdp` and assign it to `gdp_all`.  
3.  Use the `duplicated()` function to filter `gdp_all` to rows that are
    duplicates to find all countries located in more than one continent.

``` r
# Load proper data
# Load data
gdp <- list.files("data/gdp/", full.names = T, pattern = ".*_2000.csv") %>%
            .[!(. |> str_detect("middle_east"))] %>%
            str_replace("gdp_europe_2000", "gdp_europe_2000_original") %>%
            purrr::map(fread) |> 
            set_names(c("africa","asia","europe","north_america","oceania","south_america"))

# Obtain countries in both Asia and Europe
fintersect(gdp$asia, gdp$europe)
```

    ##       country year gdp_per_capita population    total_gdp
    ## 1:    Armenia 2000       621.4248    3076098   1911563665
    ## 2: Azerbaijan 2000       655.0974    8117742   5317911943
    ## 3:     Cyprus 2000     13421.6554     943287  12660473076
    ## 4:    Georgia 2000       691.9977    4743591   3282554086
    ## 5: Kazakhstan 2000      1229.0010   14956769  18381883430
    ## 6:     Russia 2000      1775.1413  146400951 259882373162
    ## 7:     Turkey 2000      4189.4781   63240157 264943250389

``` r
# Concatenate all data tables
gdp_all <- rbindlist(gdp)

# Find all countries that span multiple continents
gdp_all[duplicated(gdp_all)]
```

    ##       country year gdp_per_capita population    total_gdp
    ## 1:    Armenia 2000       621.4248    3076098   1911563665
    ## 2: Azerbaijan 2000       655.0974    8117742   5317911943
    ## 3:     Cyprus 2000     13421.6554     943287  12660473076
    ## 4:    Georgia 2000       691.9977    4743591   3282554086
    ## 5: Kazakhstan 2000      1229.0010   14956769  18381883430
    ## 6:     Russia 2000      1775.1413  146400951 259882373162
    ## 7:     Turkey 2000      4189.4781   63240157 264943250389

Nicely done! Did you know base R provides set operation functions that
work on vectors? For example the `intersect()` function will find the
common elements of two vectors.

## Removing duplicates while combining tables

The same list of data tables as the last exercise, `gdp`, is available
in your workspace. Your goal this time is to build a `data.table` in
which each country appears only once, even if it is located in more than
one continent.

**Steps**

1.  Use the `funion()` function to build a new `data.table` containing
    all countries in either Europe or Asia, with each country appearing
    only once in the result.
2.  Concatenate all `data.table`s in `gdp` and assign it to `gdp_all`.  
3.  Use the `unique()` function to remove duplicate rows from`gdp_all`
    so that each country occurs only once in the result.

``` r
# Get all countries in either Asia or Europe
funion(gdp$asia, gdp$europe)
```

    ##                    country year gdp_per_capita population    total_gdp
    ##  1:                Armenia 2000       621.4248    3076098 1.911564e+09
    ##  2:             Azerbaijan 2000       655.0974    8117742 5.317912e+09
    ##  3:                Bahrain 2000     12489.4677     666855 8.328664e+09
    ##  4:             Bangladesh 2000       363.6399  131280739 4.773892e+10
    ##  5:                 Bhutan 2000       768.7510     564187 4.337193e+08
    ##  6:                 Brunei 2000     18350.1306     330554 6.065709e+09
    ##  7:               Cambodia 2000       293.5685   12197905 3.580920e+09
    ##  8:                  China 2000       949.1781 1269974572 1.205432e+12
    ##  9:                 Cyprus 2000     13421.6554     943287 1.266047e+10
    ## 10:                Georgia 2000       691.9977    4743591 3.282554e+09
    ## 11:       Hong Kong, China 2000     25756.6638    6783502 1.747204e+11
    ## 12:                  India 2000       450.4151 1053481072 4.745038e+11
    ## 13:              Indonesia 2000       773.3110  211540428 1.635865e+11
    ## 14:                   Iran 2000      1550.0906   65850062 1.020736e+11
    ## 15:                   Iraq 2000      1063.4815   23574751 2.507131e+10
    ## 16:                 Israel 2000     19859.3021    6013711 1.194281e+11
    ## 17:                  Japan 2000     37291.7062  125714674 4.688115e+12
    ## 18:                 Jordan 2000      1764.2299    4767476 8.410924e+09
    ## 19:             Kazakhstan 2000      1229.0010   14956769 1.838188e+10
    ## 20:                 Kuwait 2000     19434.4000    1929470 3.749809e+10
    ## 21:        Kyrgyz Republic 2000       279.6203    4954850 1.385477e+09
    ## 22:                    Lao 2000       325.5931    5342879 1.739605e+09
    ## 23:                Lebanon 2000      4612.1987    3235380 1.492222e+10
    ## 24:           Macao, China 2000     14128.8752     431907 6.102360e+09
    ## 25:               Malaysia 2000      4005.5563   23420751 9.381314e+10
    ## 26:               Maldives 2000      2284.9740     280384 6.406701e+08
    ## 27:               Mongolia 2000       471.4733    2397438 1.130328e+09
    ## 28:                  Nepal 2000       225.1687   23740145 5.345537e+09
    ## 29:                   Oman 2000      8774.9338    2239403 1.965061e+10
    ## 30:               Pakistan 2000       511.7026  138250487 7.074313e+10
    ## 31:            Philippines 2000      1048.0705   77932247 8.167849e+10
    ## 32:                  Qatar 2000     30052.7612     593453 1.783490e+10
    ## 33:                 Russia 2000      1775.1413  146400951 2.598824e+11
    ## 34:           Saudi Arabia 2000      9400.8117   21392273 2.011047e+11
    ## 35:              Singapore 2000     23814.5566    3918183 9.330979e+10
    ## 36:            South Korea 2000     11346.6650   46206271 5.242871e+11
    ## 37:              Sri Lanka 2000       854.9267   18783745 1.605873e+10
    ## 38:                  Syria 2000      1208.7346   16354050 1.976771e+10
    ## 39:             Tajikistan 2000       139.4099    6186152 8.624107e+08
    ## 40:               Thailand 2000      1943.2379   62693322 1.218280e+11
    ## 41:            Timor-Leste 2000       380.9230     847185 3.227123e+08
    ## 42:                 Turkey 2000      4189.4781   63240157 2.649433e+11
    ## 43:           Turkmenistan 2000       645.2771    4501419 2.904663e+09
    ## 44:   United Arab Emirates 2000     34395.1491    3050128 1.049096e+11
    ## 45:             Uzbekistan 2000       558.2211   24518222 1.368659e+10
    ## 46:                Vietnam 2000       401.5478   80285563 3.223849e+10
    ## 47:     West Bank and Gaza 2000      1369.1930    3223781 4.413978e+09
    ## 48:                  Yemen 2000       543.7139   17795219 9.675508e+09
    ## 49:                Albania 2000      1200.1374    3121965 3.746787e+09
    ## 50:                Andorra 2000     17539.4420      65399 1.147062e+09
    ## 51:                Austria 2000     23974.1831    8050884 1.930134e+11
    ## 52:                Belarus 2000      1273.0491    9952055 1.266945e+10
    ## 53:                Belgium 2000     22697.0123   10268380 2.330615e+11
    ## 54: Bosnia and Herzegovina 2000      1490.6428    3792878 5.653826e+09
    ## 55:               Bulgaria 2000      1579.3482    8000510 1.263559e+10
    ## 56:        Channel Islands 2000     44310.9023     148725 6.590139e+09
    ## 57:                Croatia 2000      4861.6775    4428069 2.152784e+10
    ## 58:         Czech Republic 2000      5724.8375   10263010 5.875406e+10
    ## 59:                Denmark 2000     29980.1555    5338283 1.600426e+11
    ## 60:                Estonia 2000      4143.9272    1399145 5.797955e+09
    ## 61:         Faeroe Islands 2000     23224.0986      46491 1.079712e+09
    ## 62:                Finland 2000     23529.5385    5176482 1.218002e+11
    ## 63:                 France 2000     21774.9930   59387183 1.293155e+12
    ## 64:                Germany 2000     22945.7088   81895925 1.879160e+12
    ## 65:                 Greece 2000     11396.2326   10954032 1.248347e+11
    ## 66:                Hungary 2000      4542.7207   10224113 4.644529e+10
    ## 67:                Iceland 2000     30928.6756     281214 8.697577e+09
    ## 68:                Ireland 2000     25629.6501    3841574 9.845820e+10
    ## 69:            Isle of Man 2000     20359.4625      76806 1.563729e+09
    ## 70:                  Italy 2000     19388.2788   57147081 1.107984e+12
    ## 71:                 Kosovo 2000      1087.7624    2608347 2.837262e+09
    ## 72:                 Latvia 2000      3300.9347    2371481 7.828104e+09
    ## 73:          Liechtenstein 2000     75606.2032      33282 2.516326e+09
    ## 74:              Lithuania 2000      3267.3474    3486373 1.139119e+10
    ## 75:             Luxembourg 2000     46453.2458     436107 2.025859e+10
    ## 76:         Macedonia, FYR 2000      1785.3268    2012051 3.592169e+09
    ## 77:                  Malta 2000     10377.0373     387180 4.017781e+09
    ## 78:                Moldova 2000       354.0017    4201088 1.487192e+09
    ## 79:                 Monaco 2000     75382.4466      32081 2.418344e+09
    ## 80:             Montenegro 2000      1555.9125     613557 9.546410e+08
    ## 81:            Netherlands 2000     24179.7314   15894016 3.843130e+11
    ## 82:                 Norway 2000     37472.6717    4491572 1.683112e+11
    ## 83:                 Poland 2000      4454.0802   38486305 1.714211e+11
    ## 84:               Portugal 2000     11470.8979   10278542 1.179041e+11
    ## 85:                Romania 2000      1650.9684   22128139 3.653286e+10
    ## 86:             San Marino 2000     28698.3217      27420 7.869080e+08
    ## 87:                 Serbia 2000       809.2751    9463306 7.658418e+09
    ## 88:        Slovak Republic 2000      5330.4016    5386065 2.870989e+10
    ## 89:               Slovenia 2000     10045.3601    1988652 1.997673e+10
    ## 90:                  Spain 2000     14413.7889   40749800 5.873590e+11
    ## 91:                 Sweden 2000     27869.3776    8872284 2.472650e+11
    ## 92:            Switzerland 2000     35639.4789    7165581 2.553776e+11
    ## 93:                Ukraine 2000       635.7090   48746269 3.098844e+10
    ## 94:         United Kingdom 2000     25057.6135   58867004 1.475067e+12
    ##                    country year gdp_per_capita population    total_gdp

``` r
# Concatenate all data tables
gdp_all <- rbindlist(gdp)

# Print all unique countries
unique(gdp_all)
```

    ##           country year gdp_per_capita population    total_gdp
    ##   1:      Algeria 2000      1794.4052   31183658  55956119099
    ##   2:       Angola 2000       298.4058   15058638   4493585565
    ##   3:        Benin 2000       345.9504    6949366   2404135636
    ##   4:     Botswana 2000      3204.1155    1736579   5564199661
    ##   5: Burkina Faso 2000       212.3754   11607944   2465241592
    ##  ---                                                         
    ## 196:     Paraguay 2000      1323.4819    5302703   7018031622
    ## 197:         Peru 2000      2060.5763   25914875  53399576128
    ## 198:     Suriname 2000      1911.0463     480751    918737427
    ## 199:      Uruguay 2000      6914.3626    3321242  22964271411
    ## 200:    Venezuela 2000      4818.7082   24481477 117969093478

Great job! Functions in R can be chained together in the same statement,
for example `gdp_all <- unique(rbindlist(gdp))`.

## Identifying observations unique to a table

An additional `data.table` has been loaded into your R session,
`middle_east`, along with the `gdp` list of data tables from the
previous exercise. The `middle_east` data table contains the set of
countries in the
<a href="https://en.wikipedia.org/wiki/Middle_East">Middle East</a>, a
geopolitical region which spans parts of Europe, Africa, and Asia. All
countries in the `middle_east` data table appear in one or more data
tables in the `gdp` list. Your goal is to print data tables containing
all countries in Africa, Europe, and Asia, that are not found in the
`middle_east`.

**Steps**

1.  Print a new `data.table` containing rows from `gdp$africa` that are
    not present in `middle_east`.
2.  Print a new `data.table` containing rows from `gdp$asia` that are
    not present in `middle_east`.
3.  Print a new `data.table` containing rows from `gdp$europe` that are
    not present in `middle_east`.

``` r
# Load data
middle_east <- fread("data/gdp/gdp_middle_east_2000.csv")

# Which countries are in Africa but not considered part of the middle east?
fsetdiff(gdp$africa, middle_east)
```

    ##                      country year gdp_per_capita population    total_gdp
    ##  1:                  Algeria 2000     1794.40523   31183658  55956119099
    ##  2:                   Angola 2000      298.40584   15058638   4493585565
    ##  3:                    Benin 2000      345.95036    6949366   2404135636
    ##  4:                 Botswana 2000     3204.11548    1736579   5564199661
    ##  5:             Burkina Faso 2000      212.37539   11607944   2465241592
    ##  6:                  Burundi 2000      131.04633    6767073    886800109
    ##  7:                 Cameroon 2000      592.37200   15927713   9435131210
    ##  8:               Cape Verde 2000     1233.25752     438737    541075706
    ##  9: Central African Republic 2000      247.02818    3726048    920438872
    ## 10:                     Chad 2000      168.45000    8343321   1405432403
    ## 11:                  Comoros 2000      358.95291     547696    196597072
    ## 12:         Congo, Dem. Rep. 2000       86.75451   48048664   4168438144
    ## 13:              Congo, Rep. 2000     1026.83155    3109269   3192695522
    ## 14:            Cote d'Ivoire 2000      628.22811   16517948  10377039332
    ## 15:                 Djibouti 2000      753.11965     722562    544175637
    ## 16:        Equatorial Guinea 2000     2388.34863     530896   1267964732
    ## 17:                  Eritrea 2000      172.75716    3535156    610723497
    ## 18:                 Ethiopia 2000      123.68092   66443603   8217805735
    ## 19:                    Gabon 2000     4102.62460    1231548   5052579123
    ## 20:                   Gambia 2000      603.59535    1228863    741735988
    ## 21:                    Ghana 2000      259.99069   18824994   4894323262
    ## 22:                   Guinea 2000      358.96291    8799165   3158573866
    ## 23:            Guinea-Bissau 2000      173.66269    1315455    228445460
    ## 24:                    Kenya 2000      406.52306   31065820  12628972195
    ## 25:                  Lesotho 2000      379.77562    1856225    704949005
    ## 26:                  Liberia 2000      185.81340    2891968    537366418
    ## 27:                    Libya 2000     6479.71252    5337264  34583936374
    ## 28:               Madagascar 2000      252.38252   15744811   3973715025
    ## 29:                   Malawi 2000      155.27154   11193230   1737990110
    ## 30:                     Mali 2000      214.46659   11046926   2369196569
    ## 31:               Mauritania 2000      489.51164    2711421   1327272154
    ## 32:                Mauritius 2000     3861.03854    1185143   4575882801
    ## 33:                  Morocco 2000     1271.81109   28950553  36819634425
    ## 34:               Mozambique 2000      233.43927   18264536   4263659870
    ## 35:                  Namibia 2000     2061.62097    1897953   3912859707
    ## 36:                    Niger 2000      164.64895   11224523   1848105899
    ## 37:                  Nigeria 2000      371.76808  122876723  45681643436
    ## 38:                   Rwanda 2000      214.23370    8021875   1718555953
    ## 39:    Sao Tome and Principe 2000      543.99904     137164     74617084
    ## 40:                  Senegal 2000      492.28623    9860578   4854226722
    ## 41:               Seychelles 2000     7578.85105      81154    615054078
    ## 42:             Sierra Leone 2000      153.47797    4060709    623229365
    ## 43:             South Africa 2000     3019.94637   44896856 135586097167
    ## 44:                    Sudan 2000      358.52920   28079664  10067379498
    ## 45:                Swaziland 2000     1508.18366    1063715   1604277582
    ## 46:                 Tanzania 2000      307.98615   33991590  10468939093
    ## 47:                     Togo 2000      270.00088    4874735   1316182721
    ## 48:                  Tunisia 2000     2245.33506    9699192  21777935842
    ## 49:                   Uganda 2000      255.78061   23757636   6076742657
    ## 50:                   Zambia 2000      318.92682   10585220   3375910577
    ## 51:                 Zimbabwe 2000      534.79115   12499981   6684879233
    ##                      country year gdp_per_capita population    total_gdp

``` r
# Which countries are in Asia but not considered part of the middle east?
fsetdiff(gdp$asia, middle_east)
```

    ##              country year gdp_per_capita population    total_gdp
    ##  1:          Armenia 2000       621.4248    3076098 1.911564e+09
    ##  2:       Azerbaijan 2000       655.0974    8117742 5.317912e+09
    ##  3:       Bangladesh 2000       363.6399  131280739 4.773892e+10
    ##  4:           Bhutan 2000       768.7510     564187 4.337193e+08
    ##  5:           Brunei 2000     18350.1306     330554 6.065709e+09
    ##  6:         Cambodia 2000       293.5685   12197905 3.580920e+09
    ##  7:            China 2000       949.1781 1269974572 1.205432e+12
    ##  8:          Georgia 2000       691.9977    4743591 3.282554e+09
    ##  9: Hong Kong, China 2000     25756.6638    6783502 1.747204e+11
    ## 10:            India 2000       450.4151 1053481072 4.745038e+11
    ## 11:        Indonesia 2000       773.3110  211540428 1.635865e+11
    ## 12:            Japan 2000     37291.7062  125714674 4.688115e+12
    ## 13:       Kazakhstan 2000      1229.0010   14956769 1.838188e+10
    ## 14:  Kyrgyz Republic 2000       279.6203    4954850 1.385477e+09
    ## 15:              Lao 2000       325.5931    5342879 1.739605e+09
    ## 16:     Macao, China 2000     14128.8752     431907 6.102360e+09
    ## 17:         Malaysia 2000      4005.5563   23420751 9.381314e+10
    ## 18:         Maldives 2000      2284.9740     280384 6.406701e+08
    ## 19:         Mongolia 2000       471.4733    2397438 1.130328e+09
    ## 20:            Nepal 2000       225.1687   23740145 5.345537e+09
    ## 21:         Pakistan 2000       511.7026  138250487 7.074313e+10
    ## 22:      Philippines 2000      1048.0705   77932247 8.167849e+10
    ## 23:           Russia 2000      1775.1413  146400951 2.598824e+11
    ## 24:        Singapore 2000     23814.5566    3918183 9.330979e+10
    ## 25:      South Korea 2000     11346.6650   46206271 5.242871e+11
    ## 26:        Sri Lanka 2000       854.9267   18783745 1.605873e+10
    ## 27:       Tajikistan 2000       139.4099    6186152 8.624107e+08
    ## 28:         Thailand 2000      1943.2379   62693322 1.218280e+11
    ## 29:      Timor-Leste 2000       380.9230     847185 3.227123e+08
    ## 30:     Turkmenistan 2000       645.2771    4501419 2.904663e+09
    ## 31:       Uzbekistan 2000       558.2211   24518222 1.368659e+10
    ## 32:          Vietnam 2000       401.5478   80285563 3.223849e+10
    ##              country year gdp_per_capita population    total_gdp

``` r
# Which countries are in Europe but not considered part of the middle east?
fsetdiff(gdp$europe, middle_east)
```

    ##                    country year gdp_per_capita population    total_gdp
    ##  1:                Albania 2000      1200.1374    3121965 3.746787e+09
    ##  2:                Andorra 2000     17539.4420      65399 1.147062e+09
    ##  3:                Armenia 2000       621.4248    3076098 1.911564e+09
    ##  4:                Austria 2000     23974.1831    8050884 1.930134e+11
    ##  5:             Azerbaijan 2000       655.0974    8117742 5.317912e+09
    ##  6:                Belarus 2000      1273.0491    9952055 1.266945e+10
    ##  7:                Belgium 2000     22697.0123   10268380 2.330615e+11
    ##  8: Bosnia and Herzegovina 2000      1490.6428    3792878 5.653826e+09
    ##  9:               Bulgaria 2000      1579.3482    8000510 1.263559e+10
    ## 10:        Channel Islands 2000     44310.9023     148725 6.590139e+09
    ## 11:                Croatia 2000      4861.6775    4428069 2.152784e+10
    ## 12:         Czech Republic 2000      5724.8375   10263010 5.875406e+10
    ## 13:                Denmark 2000     29980.1555    5338283 1.600426e+11
    ## 14:                Estonia 2000      4143.9272    1399145 5.797955e+09
    ## 15:         Faeroe Islands 2000     23224.0986      46491 1.079712e+09
    ## 16:                Finland 2000     23529.5385    5176482 1.218002e+11
    ## 17:                 France 2000     21774.9930   59387183 1.293155e+12
    ## 18:                Georgia 2000       691.9977    4743591 3.282554e+09
    ## 19:                Germany 2000     22945.7088   81895925 1.879160e+12
    ## 20:                 Greece 2000     11396.2326   10954032 1.248347e+11
    ## 21:                Hungary 2000      4542.7207   10224113 4.644529e+10
    ## 22:                Iceland 2000     30928.6756     281214 8.697577e+09
    ## 23:                Ireland 2000     25629.6501    3841574 9.845820e+10
    ## 24:            Isle of Man 2000     20359.4625      76806 1.563729e+09
    ## 25:                  Italy 2000     19388.2788   57147081 1.107984e+12
    ## 26:             Kazakhstan 2000      1229.0010   14956769 1.838188e+10
    ## 27:                 Kosovo 2000      1087.7624    2608347 2.837262e+09
    ## 28:                 Latvia 2000      3300.9347    2371481 7.828104e+09
    ## 29:          Liechtenstein 2000     75606.2032      33282 2.516326e+09
    ## 30:              Lithuania 2000      3267.3474    3486373 1.139119e+10
    ## 31:             Luxembourg 2000     46453.2458     436107 2.025859e+10
    ## 32:         Macedonia, FYR 2000      1785.3268    2012051 3.592169e+09
    ## 33:                  Malta 2000     10377.0373     387180 4.017781e+09
    ## 34:                Moldova 2000       354.0017    4201088 1.487192e+09
    ## 35:                 Monaco 2000     75382.4466      32081 2.418344e+09
    ## 36:             Montenegro 2000      1555.9125     613557 9.546410e+08
    ## 37:            Netherlands 2000     24179.7314   15894016 3.843130e+11
    ## 38:                 Norway 2000     37472.6717    4491572 1.683112e+11
    ## 39:                 Poland 2000      4454.0802   38486305 1.714211e+11
    ## 40:               Portugal 2000     11470.8979   10278542 1.179041e+11
    ## 41:                Romania 2000      1650.9684   22128139 3.653286e+10
    ## 42:                 Russia 2000      1775.1413  146400951 2.598824e+11
    ## 43:             San Marino 2000     28698.3217      27420 7.869080e+08
    ## 44:                 Serbia 2000       809.2751    9463306 7.658418e+09
    ## 45:        Slovak Republic 2000      5330.4016    5386065 2.870989e+10
    ## 46:               Slovenia 2000     10045.3601    1988652 1.997673e+10
    ## 47:                  Spain 2000     14413.7889   40749800 5.873590e+11
    ## 48:                 Sweden 2000     27869.3776    8872284 2.472650e+11
    ## 49:            Switzerland 2000     35639.4789    7165581 2.553776e+11
    ## 50:                Ukraine 2000       635.7090   48746269 3.098844e+10
    ## 51:         United Kingdom 2000     25057.6135   58867004 1.475067e+12
    ##                    country year gdp_per_capita population    total_gdp

Nice work! You can do this in one line of code:
`lapply(gdp, fsetdiff, middle_east)`.

## Melting data.tables

Theory. Coming soon …

**1. Melting data.tables**

In this lesson, you will learn how to melt data tables from wide to long
formats.

**2. Melting a wide data.table**

A wide format data table is one where a single variable is spread across
multiple columns corresponding to some grouping, such as in the example
data table on the left.This type of layout is common when working with
excel spreadsheets because it is a human friendly way of organising data
with regular groupings. However, when working with datasets in R, you
will often want to reshape this data into a long format, shown on the
right. In the long format these values occupy a single column, with
another column indicating group membership. This format allows you to
take full advantage of the functionality in the data table syntax like
grouping of calculations.

**3. The `melt()` function**

You can use the melt() function to reshape a wide data table to a long
data table.There are a few different ways you can use this
function.First, you can provide a vector of column names to the measure
dot vars argument. The melt() function will take these columns and stack
them on top of each other to create two new columns: “variable” and
“value”. The “value” column will contain the values of these stacked
columns while the “variable” column labels each row with the column name
from the original wide data table.

**4. The `melt()` function**

You can give these new columns any name you like using the variable dot
name and value dot name arguments.

**5. The `melt()` function**

You can also use the id dot vars argument instead of the measure dot
vars argument to tell the melt() function which columns you want to keep
aside as row identifiers in the new data table.The melt() function will
then stack all other columns into the new “value” column.

**6. The `melt()` function**

You can use both the id dot vars and measure dot vars arguments at the
same time. If you use both arguments, any columns you don’t provide to
either argument will be dropped in the result.

**7. Let’s practice!**

Now it’s your turn to see how melt() works in practice.

## Melting a wide table

A data table named `gdp_per_capita` containing the gross domestic
product (GDP) per capita for countries in Oceania every five years from
1990 to 2010 sourced from the
<a href="https://www.gapminder.org">Gapminder foundation</a> is
available in your workspace. Your goal is to reshape this data table to
the long format so that there is a single column containing all GDP per
capita values for each country and year.

**Steps**

1.  Print `gdp_per_capita` to learn about its contents.
2.  Use the `melt()` function to create a long format `data.table`
    stacking the values for each country’s column.

``` r
# Load & prepare data
gdp_per_capita <- fread("data/gdp/gdp_per_capita_oceania.csv", header = T)
gdp_per_capita <- data.table::transpose(gdp_per_capita, keep.names = "year", make.names = "country")

# Print gdp_per_capita
gdp_per_capita
```

    ##    year Australia     Fiji French Polynesia Kiribati Marshall Islands
    ## 1: 1990  17553.38 1833.184         14003.26 670.2639         2137.690
    ## 2: 1995  18690.44 1955.294         13608.05 661.5434         2581.130
    ## 3: 2000  21708.04 2074.747         14507.54 812.2821         2127.485
    ## 4: 2005  23929.16 2308.158               NA 785.3737         2368.149
    ## 5: 2010  25190.84 2218.147               NA 713.5625         2437.282
    ##    Micronesia, Fed. Sts. New Caledonia New Zealand    Palau Papua New Guinea
    ## 1:              1894.105      13562.65    11627.11       NA         566.8707
    ## 2:              2189.552      13601.46    12291.84 6355.627         754.7247
    ## 3:              2177.589      12579.60    13375.78 6251.982         654.6688
    ## 4:              2196.247            NA    15171.59 6429.586         626.3082
    ## 5:              2134.037            NA    14629.22 5756.811         744.2105
    ##       Samoa Solomon Islands    Tonga   Tuvalu  Vanuatu
    ## 1: 1191.783       1101.2480 1493.743 1128.078 1327.357
    ## 2: 1204.353       1403.8032 1785.211 1278.696 1358.466
    ## 3: 1391.214       1064.5147 1926.005 1458.950 1469.762
    ## 4: 1742.154        975.6054 2115.027 1426.191 1355.822
    ## 5: 1769.565       1143.7875 2069.226 1559.984 1522.384

``` r
# Reshape gdp_per_capita to the long format
melt(gdp_per_capita, id.vars = "year")
```

    ##     year              variable      value
    ##  1: 1990             Australia 17553.3768
    ##  2: 1995             Australia 18690.4366
    ##  3: 2000             Australia 21708.0373
    ##  4: 2005             Australia 23929.1644
    ##  5: 2010             Australia 25190.8399
    ##  6: 1990                  Fiji  1833.1844
    ##  7: 1995                  Fiji  1955.2939
    ##  8: 2000                  Fiji  2074.7473
    ##  9: 2005                  Fiji  2308.1583
    ## 10: 2010                  Fiji  2218.1470
    ## 11: 1990      French Polynesia 14003.2649
    ## 12: 1995      French Polynesia 13608.0520
    ## 13: 2000      French Polynesia 14507.5415
    ## 14: 2005      French Polynesia         NA
    ## 15: 2010      French Polynesia         NA
    ## 16: 1990              Kiribati   670.2639
    ## 17: 1995              Kiribati   661.5434
    ## 18: 2000              Kiribati   812.2821
    ## 19: 2005              Kiribati   785.3737
    ## 20: 2010              Kiribati   713.5625
    ## 21: 1990      Marshall Islands  2137.6897
    ## 22: 1995      Marshall Islands  2581.1304
    ## 23: 2000      Marshall Islands  2127.4855
    ## 24: 2005      Marshall Islands  2368.1488
    ## 25: 2010      Marshall Islands  2437.2824
    ## 26: 1990 Micronesia, Fed. Sts.  1894.1055
    ## 27: 1995 Micronesia, Fed. Sts.  2189.5520
    ## 28: 2000 Micronesia, Fed. Sts.  2177.5891
    ## 29: 2005 Micronesia, Fed. Sts.  2196.2472
    ## 30: 2010 Micronesia, Fed. Sts.  2134.0372
    ## 31: 1990         New Caledonia 13562.6526
    ## 32: 1995         New Caledonia 13601.4555
    ## 33: 2000         New Caledonia 12579.5951
    ## 34: 2005         New Caledonia         NA
    ## 35: 2010         New Caledonia         NA
    ## 36: 1990           New Zealand 11627.1065
    ## 37: 1995           New Zealand 12291.8376
    ## 38: 2000           New Zealand 13375.7805
    ## 39: 2005           New Zealand 15171.5943
    ## 40: 2010           New Zealand 14629.2181
    ## 41: 1990                 Palau         NA
    ## 42: 1995                 Palau  6355.6270
    ## 43: 2000                 Palau  6251.9821
    ## 44: 2005                 Palau  6429.5859
    ## 45: 2010                 Palau  5756.8105
    ## 46: 1990      Papua New Guinea   566.8707
    ## 47: 1995      Papua New Guinea   754.7247
    ## 48: 2000      Papua New Guinea   654.6688
    ## 49: 2005      Papua New Guinea   626.3082
    ## 50: 2010      Papua New Guinea   744.2105
    ## 51: 1990                 Samoa  1191.7833
    ## 52: 1995                 Samoa  1204.3528
    ## 53: 2000                 Samoa  1391.2144
    ## 54: 2005                 Samoa  1742.1545
    ## 55: 2010                 Samoa  1769.5650
    ## 56: 1990       Solomon Islands  1101.2480
    ## 57: 1995       Solomon Islands  1403.8032
    ## 58: 2000       Solomon Islands  1064.5147
    ## 59: 2005       Solomon Islands   975.6054
    ## 60: 2010       Solomon Islands  1143.7875
    ## 61: 1990                 Tonga  1493.7433
    ## 62: 1995                 Tonga  1785.2106
    ## 63: 2000                 Tonga  1926.0046
    ## 64: 2005                 Tonga  2115.0271
    ## 65: 2010                 Tonga  2069.2262
    ## 66: 1990                Tuvalu  1128.0776
    ## 67: 1995                Tuvalu  1278.6963
    ## 68: 2000                Tuvalu  1458.9496
    ## 69: 2005                Tuvalu  1426.1913
    ## 70: 2010                Tuvalu  1559.9837
    ## 71: 1990               Vanuatu  1327.3566
    ## 72: 1995               Vanuatu  1358.4658
    ## 73: 2000               Vanuatu  1469.7618
    ## 74: 2005               Vanuatu  1355.8217
    ## 75: 2010               Vanuatu  1522.3840
    ##     year              variable      value

3.  Within your call to `melt()`, name the new `"variable"` column as
    `"country"` and the new `"value"` column as `"gdp_pc"`.

``` r
# Rename the new columns
melt(gdp_per_capita, id.vars = "year", 
     variable.name = "country", value.name = "gdp_pc")
```

    ##     year               country     gdp_pc
    ##  1: 1990             Australia 17553.3768
    ##  2: 1995             Australia 18690.4366
    ##  3: 2000             Australia 21708.0373
    ##  4: 2005             Australia 23929.1644
    ##  5: 2010             Australia 25190.8399
    ##  6: 1990                  Fiji  1833.1844
    ##  7: 1995                  Fiji  1955.2939
    ##  8: 2000                  Fiji  2074.7473
    ##  9: 2005                  Fiji  2308.1583
    ## 10: 2010                  Fiji  2218.1470
    ## 11: 1990      French Polynesia 14003.2649
    ## 12: 1995      French Polynesia 13608.0520
    ## 13: 2000      French Polynesia 14507.5415
    ## 14: 2005      French Polynesia         NA
    ## 15: 2010      French Polynesia         NA
    ## 16: 1990              Kiribati   670.2639
    ## 17: 1995              Kiribati   661.5434
    ## 18: 2000              Kiribati   812.2821
    ## 19: 2005              Kiribati   785.3737
    ## 20: 2010              Kiribati   713.5625
    ## 21: 1990      Marshall Islands  2137.6897
    ## 22: 1995      Marshall Islands  2581.1304
    ## 23: 2000      Marshall Islands  2127.4855
    ## 24: 2005      Marshall Islands  2368.1488
    ## 25: 2010      Marshall Islands  2437.2824
    ## 26: 1990 Micronesia, Fed. Sts.  1894.1055
    ## 27: 1995 Micronesia, Fed. Sts.  2189.5520
    ## 28: 2000 Micronesia, Fed. Sts.  2177.5891
    ## 29: 2005 Micronesia, Fed. Sts.  2196.2472
    ## 30: 2010 Micronesia, Fed. Sts.  2134.0372
    ## 31: 1990         New Caledonia 13562.6526
    ## 32: 1995         New Caledonia 13601.4555
    ## 33: 2000         New Caledonia 12579.5951
    ## 34: 2005         New Caledonia         NA
    ## 35: 2010         New Caledonia         NA
    ## 36: 1990           New Zealand 11627.1065
    ## 37: 1995           New Zealand 12291.8376
    ## 38: 2000           New Zealand 13375.7805
    ## 39: 2005           New Zealand 15171.5943
    ## 40: 2010           New Zealand 14629.2181
    ## 41: 1990                 Palau         NA
    ## 42: 1995                 Palau  6355.6270
    ## 43: 2000                 Palau  6251.9821
    ## 44: 2005                 Palau  6429.5859
    ## 45: 2010                 Palau  5756.8105
    ## 46: 1990      Papua New Guinea   566.8707
    ## 47: 1995      Papua New Guinea   754.7247
    ## 48: 2000      Papua New Guinea   654.6688
    ## 49: 2005      Papua New Guinea   626.3082
    ## 50: 2010      Papua New Guinea   744.2105
    ## 51: 1990                 Samoa  1191.7833
    ## 52: 1995                 Samoa  1204.3528
    ## 53: 2000                 Samoa  1391.2144
    ## 54: 2005                 Samoa  1742.1545
    ## 55: 2010                 Samoa  1769.5650
    ## 56: 1990       Solomon Islands  1101.2480
    ## 57: 1995       Solomon Islands  1403.8032
    ## 58: 2000       Solomon Islands  1064.5147
    ## 59: 2005       Solomon Islands   975.6054
    ## 60: 2010       Solomon Islands  1143.7875
    ## 61: 1990                 Tonga  1493.7433
    ## 62: 1995                 Tonga  1785.2106
    ## 63: 2000                 Tonga  1926.0046
    ## 64: 2005                 Tonga  2115.0271
    ## 65: 2010                 Tonga  2069.2262
    ## 66: 1990                Tuvalu  1128.0776
    ## 67: 1995                Tuvalu  1278.6963
    ## 68: 2000                Tuvalu  1458.9496
    ## 69: 2005                Tuvalu  1426.1913
    ## 70: 2010                Tuvalu  1559.9837
    ## 71: 1990               Vanuatu  1327.3566
    ## 72: 1995               Vanuatu  1358.4658
    ## 73: 2000               Vanuatu  1469.7618
    ## 74: 2005               Vanuatu  1355.8217
    ## 75: 2010               Vanuatu  1522.3840
    ##     year               country     gdp_pc

Excellent! By default the `\\"variable\\"` column in the result will be
a `factor`. You can change this by setting `variable.factor = FALSE`.

## More melts

A data table containing confirmed Ebola case numbers from Guinea in
weeks 50 and 51 of the outbreak has been loaded into your R session.
Your goal is to melt `ebola_wide` into a long format data table
containing a single column for the case numbers variable.

**Steps**

1.  Use the `measure.vars` argument to stack the columns `"Week_50"` and
    `"Week_51"`. The new column containing its values should be called
    `"cases"`, and the new column of variable labels should be called
    `"period"`.

``` r
# Load package
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:data.table':
    ## 
    ##     between, first, last

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
# Prepare data
ebola_wide <- 

ebola_W50 |> 
  select(-c(period_code, Probable)) |> 
  rename("Week_50" = "Confirmed") |> 
  mutate(Week_51 = NA) |> 
  
  bind_rows(

ebola_W51 |> 
  select(-c(period_code, Probable)) |> 
  rename("Week_51" = "Confirmed") |> 
  mutate(Week_50 = NA)

  ) |> 
  arrange(Location)

# Print ebola_wide
ebola_wide
```

    ##        Location     period_start       period_end Week_50 Week_51
    ##  1:       BEYLA 15 December 2014 21 December 2014      NA       3
    ##  2:     CONAKRY 08 December 2014 14 December 2014      37      NA
    ##  3:     CONAKRY 15 December 2014 21 December 2014      NA      39
    ##  4:       COYAH 08 December 2014 14 December 2014      31      NA
    ##  5:       COYAH 15 December 2014 21 December 2014      NA      35
    ##  6:      DABOLA 08 December 2014 14 December 2014       2      NA
    ##  7:      DABOLA 15 December 2014 21 December 2014      NA       1
    ##  8:     DUBREKA 08 December 2014 14 December 2014       6      NA
    ##  9:     DUBREKA 15 December 2014 21 December 2014      NA       5
    ## 10:     FARANAH 08 December 2014 14 December 2014       0      NA
    ## 11:  FORECARIAH 08 December 2014 14 December 2014      22      NA
    ## 12:  FORECARIAH 15 December 2014 21 December 2014      NA      15
    ## 13:        FRIA 15 December 2014 21 December 2014      NA       1
    ## 14:   GUECKEDOU 08 December 2014 14 December 2014       3      NA
    ## 15:   GUECKEDOU 15 December 2014 21 December 2014      NA       7
    ## 16:      KANKAN 08 December 2014 14 December 2014       2      NA
    ## 17:      KANKAN 15 December 2014 21 December 2014      NA       2
    ## 18:    KEROUANE 08 December 2014 14 December 2014       9      NA
    ## 19:    KEROUANE 15 December 2014 21 December 2014      NA      17
    ## 20:      KINDIA 08 December 2014 14 December 2014       1      NA
    ## 21:      KINDIA 15 December 2014 21 December 2014      NA      21
    ## 22: KISSIDOUGOU 08 December 2014 14 December 2014       2      NA
    ## 23: KISSIDOUGOU 15 December 2014 21 December 2014      NA     117
    ## 24:   KOUROUSSA 08 December 2014 14 December 2014       3      NA
    ## 25:        LOLA 08 December 2014 14 December 2014       4      NA
    ## 26:        LOLA 15 December 2014 21 December 2014      NA      14
    ## 27:     MACENTA 08 December 2014 14 December 2014       6      NA
    ## 28:     MACENTA 15 December 2014 21 December 2014      NA      24
    ## 29:  N'ZEREKORE 08 December 2014 14 December 2014      13      NA
    ## 30:  N'ZEREKORE 15 December 2014 21 December 2014      NA      18
    ## 31:     SIGUIRI 08 December 2014 14 December 2014       0      NA
    ## 32:    TELIMELE 08 December 2014 14 December 2014      10      NA
    ## 33:    TELIMELE 15 December 2014 21 December 2014      NA       6
    ##        Location     period_start       period_end Week_50 Week_51

``` r
# Stack Week_50 and Week_51
melt(ebola_wide, measure.vars = c("Week_50", "Week_51"), 
     variable.name = "period", value.name = "cases")
```

    ##        Location     period_start       period_end  period cases
    ##  1:       BEYLA 15 December 2014 21 December 2014 Week_50    NA
    ##  2:     CONAKRY 08 December 2014 14 December 2014 Week_50    37
    ##  3:     CONAKRY 15 December 2014 21 December 2014 Week_50    NA
    ##  4:       COYAH 08 December 2014 14 December 2014 Week_50    31
    ##  5:       COYAH 15 December 2014 21 December 2014 Week_50    NA
    ##  6:      DABOLA 08 December 2014 14 December 2014 Week_50     2
    ##  7:      DABOLA 15 December 2014 21 December 2014 Week_50    NA
    ##  8:     DUBREKA 08 December 2014 14 December 2014 Week_50     6
    ##  9:     DUBREKA 15 December 2014 21 December 2014 Week_50    NA
    ## 10:     FARANAH 08 December 2014 14 December 2014 Week_50     0
    ## 11:  FORECARIAH 08 December 2014 14 December 2014 Week_50    22
    ## 12:  FORECARIAH 15 December 2014 21 December 2014 Week_50    NA
    ## 13:        FRIA 15 December 2014 21 December 2014 Week_50    NA
    ## 14:   GUECKEDOU 08 December 2014 14 December 2014 Week_50     3
    ## 15:   GUECKEDOU 15 December 2014 21 December 2014 Week_50    NA
    ## 16:      KANKAN 08 December 2014 14 December 2014 Week_50     2
    ## 17:      KANKAN 15 December 2014 21 December 2014 Week_50    NA
    ## 18:    KEROUANE 08 December 2014 14 December 2014 Week_50     9
    ## 19:    KEROUANE 15 December 2014 21 December 2014 Week_50    NA
    ## 20:      KINDIA 08 December 2014 14 December 2014 Week_50     1
    ## 21:      KINDIA 15 December 2014 21 December 2014 Week_50    NA
    ## 22: KISSIDOUGOU 08 December 2014 14 December 2014 Week_50     2
    ## 23: KISSIDOUGOU 15 December 2014 21 December 2014 Week_50    NA
    ## 24:   KOUROUSSA 08 December 2014 14 December 2014 Week_50     3
    ## 25:        LOLA 08 December 2014 14 December 2014 Week_50     4
    ## 26:        LOLA 15 December 2014 21 December 2014 Week_50    NA
    ## 27:     MACENTA 08 December 2014 14 December 2014 Week_50     6
    ## 28:     MACENTA 15 December 2014 21 December 2014 Week_50    NA
    ## 29:  N'ZEREKORE 08 December 2014 14 December 2014 Week_50    13
    ## 30:  N'ZEREKORE 15 December 2014 21 December 2014 Week_50    NA
    ## 31:     SIGUIRI 08 December 2014 14 December 2014 Week_50     0
    ## 32:    TELIMELE 08 December 2014 14 December 2014 Week_50    10
    ## 33:    TELIMELE 15 December 2014 21 December 2014 Week_50    NA
    ## 34:       BEYLA 15 December 2014 21 December 2014 Week_51     3
    ## 35:     CONAKRY 08 December 2014 14 December 2014 Week_51    NA
    ## 36:     CONAKRY 15 December 2014 21 December 2014 Week_51    39
    ## 37:       COYAH 08 December 2014 14 December 2014 Week_51    NA
    ## 38:       COYAH 15 December 2014 21 December 2014 Week_51    35
    ## 39:      DABOLA 08 December 2014 14 December 2014 Week_51    NA
    ## 40:      DABOLA 15 December 2014 21 December 2014 Week_51     1
    ## 41:     DUBREKA 08 December 2014 14 December 2014 Week_51    NA
    ## 42:     DUBREKA 15 December 2014 21 December 2014 Week_51     5
    ## 43:     FARANAH 08 December 2014 14 December 2014 Week_51    NA
    ## 44:  FORECARIAH 08 December 2014 14 December 2014 Week_51    NA
    ## 45:  FORECARIAH 15 December 2014 21 December 2014 Week_51    15
    ## 46:        FRIA 15 December 2014 21 December 2014 Week_51     1
    ## 47:   GUECKEDOU 08 December 2014 14 December 2014 Week_51    NA
    ## 48:   GUECKEDOU 15 December 2014 21 December 2014 Week_51     7
    ## 49:      KANKAN 08 December 2014 14 December 2014 Week_51    NA
    ## 50:      KANKAN 15 December 2014 21 December 2014 Week_51     2
    ## 51:    KEROUANE 08 December 2014 14 December 2014 Week_51    NA
    ## 52:    KEROUANE 15 December 2014 21 December 2014 Week_51    17
    ## 53:      KINDIA 08 December 2014 14 December 2014 Week_51    NA
    ## 54:      KINDIA 15 December 2014 21 December 2014 Week_51    21
    ## 55: KISSIDOUGOU 08 December 2014 14 December 2014 Week_51    NA
    ## 56: KISSIDOUGOU 15 December 2014 21 December 2014 Week_51   117
    ## 57:   KOUROUSSA 08 December 2014 14 December 2014 Week_51    NA
    ## 58:        LOLA 08 December 2014 14 December 2014 Week_51    NA
    ## 59:        LOLA 15 December 2014 21 December 2014 Week_51    14
    ## 60:     MACENTA 08 December 2014 14 December 2014 Week_51    NA
    ## 61:     MACENTA 15 December 2014 21 December 2014 Week_51    24
    ## 62:  N'ZEREKORE 08 December 2014 14 December 2014 Week_51    NA
    ## 63:  N'ZEREKORE 15 December 2014 21 December 2014 Week_51    18
    ## 64:     SIGUIRI 08 December 2014 14 December 2014 Week_51    NA
    ## 65:    TELIMELE 08 December 2014 14 December 2014 Week_51    NA
    ## 66:    TELIMELE 15 December 2014 21 December 2014 Week_51     6
    ##        Location     period_start       period_end  period cases

2.  Modify the call to `melt()` to also ask to keep only the
    `"Location"` column as row identifiers, dropping the
    `"period_start"` and `"period_end"` columns from the result.

``` r
# Modify the code
melt(ebola_wide, measure.vars = c("Week_50", "Week_51"), 
     variable.name = "period", value.name = "cases", 
     id.vars = "Location")
```

    ##        Location  period cases
    ##  1:       BEYLA Week_50    NA
    ##  2:     CONAKRY Week_50    37
    ##  3:     CONAKRY Week_50    NA
    ##  4:       COYAH Week_50    31
    ##  5:       COYAH Week_50    NA
    ##  6:      DABOLA Week_50     2
    ##  7:      DABOLA Week_50    NA
    ##  8:     DUBREKA Week_50     6
    ##  9:     DUBREKA Week_50    NA
    ## 10:     FARANAH Week_50     0
    ## 11:  FORECARIAH Week_50    22
    ## 12:  FORECARIAH Week_50    NA
    ## 13:        FRIA Week_50    NA
    ## 14:   GUECKEDOU Week_50     3
    ## 15:   GUECKEDOU Week_50    NA
    ## 16:      KANKAN Week_50     2
    ## 17:      KANKAN Week_50    NA
    ## 18:    KEROUANE Week_50     9
    ## 19:    KEROUANE Week_50    NA
    ## 20:      KINDIA Week_50     1
    ## 21:      KINDIA Week_50    NA
    ## 22: KISSIDOUGOU Week_50     2
    ## 23: KISSIDOUGOU Week_50    NA
    ## 24:   KOUROUSSA Week_50     3
    ## 25:        LOLA Week_50     4
    ## 26:        LOLA Week_50    NA
    ## 27:     MACENTA Week_50     6
    ## 28:     MACENTA Week_50    NA
    ## 29:  N'ZEREKORE Week_50    13
    ## 30:  N'ZEREKORE Week_50    NA
    ## 31:     SIGUIRI Week_50     0
    ## 32:    TELIMELE Week_50    10
    ## 33:    TELIMELE Week_50    NA
    ## 34:       BEYLA Week_51     3
    ## 35:     CONAKRY Week_51    NA
    ## 36:     CONAKRY Week_51    39
    ## 37:       COYAH Week_51    NA
    ## 38:       COYAH Week_51    35
    ## 39:      DABOLA Week_51    NA
    ## 40:      DABOLA Week_51     1
    ## 41:     DUBREKA Week_51    NA
    ## 42:     DUBREKA Week_51     5
    ## 43:     FARANAH Week_51    NA
    ## 44:  FORECARIAH Week_51    NA
    ## 45:  FORECARIAH Week_51    15
    ## 46:        FRIA Week_51     1
    ## 47:   GUECKEDOU Week_51    NA
    ## 48:   GUECKEDOU Week_51     7
    ## 49:      KANKAN Week_51    NA
    ## 50:      KANKAN Week_51     2
    ## 51:    KEROUANE Week_51    NA
    ## 52:    KEROUANE Week_51    17
    ## 53:      KINDIA Week_51    NA
    ## 54:      KINDIA Week_51    21
    ## 55: KISSIDOUGOU Week_51    NA
    ## 56: KISSIDOUGOU Week_51   117
    ## 57:   KOUROUSSA Week_51    NA
    ## 58:        LOLA Week_51    NA
    ## 59:        LOLA Week_51    14
    ## 60:     MACENTA Week_51    NA
    ## 61:     MACENTA Week_51    24
    ## 62:  N'ZEREKORE Week_51    NA
    ## 63:  N'ZEREKORE Week_51    18
    ## 64:     SIGUIRI Week_51    NA
    ## 65:    TELIMELE Week_51    NA
    ## 66:    TELIMELE Week_51     6
    ##        Location  period cases

Great job! Using `id.vars` together with `measure.vars` keeps only those
columns in the result.

## Casting data.tables

Theory. Coming soon …

## Casting a long table

`gdp_oceania` contains the population and GDP for every country in
Oceania for every five years from 1990 to 2010 and is available in your
workspace. Your goal is to create wide format `data.table`s containing
the population and total GDP for each country with each year having its
own column.

**Steps**

1.  Use
    <a href="https://www.rdocumentation.org/packages/data.table/topics/dcast.data.table">`dcast()`</a>
    to build a wide `data.table` containing the population of each
    country, with each country as a row and each year as a column.

``` r
# Load data
gdp_oceania <- fread("data/gdp/gdp_and_pop_oceania.csv")

# Split the population column by year
dcast(gdp_oceania, formula = country ~ year, value.var = "population")
```

    ##                   country     1990     1995     2000     2005     2010
    ##  1:             Australia 17096869 18124770 19107251 20274282 22162863
    ##  2:                  Fiji   728626   775498   811223   821820   859952
    ##  3:      French Polynesia   198370   215200   237267   254884   268065
    ##  4:              Kiribati    72411    77727    84406    92329   102648
    ##  5:      Marshall Islands    47300    51020    52161    52058    52428
    ##  6: Micronesia, Fed. Sts.    96331   107556   107430   106198   103619
    ##  7:         New Caledonia   168537   189198   209997   228683   246345
    ##  8:           New Zealand  3397534  3674886  3858234  4134699  4369027
    ##  9:                 Palau    15089    17255    19174    19907    20470
    ## 10:      Papua New Guinea  4157903  4715929  5374051  6086905  6847517
    ## 11:                 Samoa   162865   170158   174614   179928   186029
    ## 12:       Solomon Islands   311849   359236   412336   469306   526177
    ## 13:                 Tonga    95152    95889    97898   100858   103947
    ## 14:                Tuvalu     9004     9227     9419     9694     9827
    ## 15:               Vanuatu   146633   168236   185058   209375   236299

2.  Create another wide format `data.table` containing the GDP of each
    country with each year as a row and each country as a column.

``` r
# Split the gdp column by country
dcast(gdp_oceania, formula = year ~ country, value.var = "gdp")
```

    ##    year    Australia       Fiji French Polynesia Kiribati Marshall Islands
    ## 1: 1990 300107784341 1335705790       2777827650 48534476        101112724
    ## 2: 1995 338759864212 1516326476       2928452782 51419787        131689273
    ## 3: 2000 414780916644 1683082744       3442160840 68561481        110971769
    ## 4: 2005 485146627070 1896890618               NA 72512766        123281092
    ## 5: 2010 558301132672 1907499910               NA 73245763        127781844
    ##    Micronesia, Fed. Sts. New Caledonia New Zealand     Palau Papua New Guinea
    ## 1:             182461073    2285808773 39503489723        NA       2356993537
    ## 2:             235499455    2573368170 45171101764 109666344       3559227888
    ## 3:             233938394    2641677234 51606891179 119875504       3518223421
    ## 4:             233237060            NA 62729975739 127993766       3812278808
    ## 5:             221126797            NA 63915448868 117841911       5095994376
    ##        Samoa Solomon Islands     Tonga   Tuvalu   Vanuatu
    ## 1: 194099795       343423086 142132664 10157211 194634278
    ## 2: 204930258       504296634 171182064 11798530 228542854
    ## 3: 242925503       438937728 188551996 13741847 271991177
    ## 4: 313462373       457857482 213317400 13825499 283875173
    ## 5: 329190409       601834699 215089852 15329960 359737826

Nice work! One way to remember the dcast formula is that the column you
give to the left hand side will always be the left most column of row
identifiers in the result.

## Casting multiple columns

The data table from the previous exercise, `gdp_oceania`, is available
in your workspace. Your goal is to create a wide format data table,
splitting both the `"gdp"` and `"population"` columns by the `"year"`
column.

**Steps**

1.  Convert `gdp_oceania` to wide format with each country as a row, and
    splitting both the `"gdp"` and `"population"` columns into columns
    for each `"year"`.

``` r
# Modify data
gdp_oceania[,continent := "Oceania"]

# Split the gdp and population columns by year
dcast(gdp_oceania, formula = country ~ year, value.var = c("gdp", "population"))
```

    ##                   country     gdp_1990     gdp_1995     gdp_2000     gdp_2005
    ##  1:             Australia 300107784341 338759864212 414780916644 485146627070
    ##  2:                  Fiji   1335705790   1516326476   1683082744   1896890618
    ##  3:      French Polynesia   2777827650   2928452782   3442160840           NA
    ##  4:              Kiribati     48534476     51419787     68561481     72512766
    ##  5:      Marshall Islands    101112724    131689273    110971769    123281092
    ##  6: Micronesia, Fed. Sts.    182461073    235499455    233938394    233237060
    ##  7:         New Caledonia   2285808773   2573368170   2641677234           NA
    ##  8:           New Zealand  39503489723  45171101764  51606891179  62729975739
    ##  9:                 Palau           NA    109666344    119875504    127993766
    ## 10:      Papua New Guinea   2356993537   3559227888   3518223421   3812278808
    ## 11:                 Samoa    194099795    204930258    242925503    313462373
    ## 12:       Solomon Islands    343423086    504296634    438937728    457857482
    ## 13:                 Tonga    142132664    171182064    188551996    213317400
    ## 14:                Tuvalu     10157211     11798530     13741847     13825499
    ## 15:               Vanuatu    194634278    228542854    271991177    283875173
    ##         gdp_2010 population_1990 population_1995 population_2000
    ##  1: 558301132672        17096869        18124770        19107251
    ##  2:   1907499910          728626          775498          811223
    ##  3:           NA          198370          215200          237267
    ##  4:     73245763           72411           77727           84406
    ##  5:    127781844           47300           51020           52161
    ##  6:    221126797           96331          107556          107430
    ##  7:           NA          168537          189198          209997
    ##  8:  63915448868         3397534         3674886         3858234
    ##  9:    117841911           15089           17255           19174
    ## 10:   5095994376         4157903         4715929         5374051
    ## 11:    329190409          162865          170158          174614
    ## 12:    601834699          311849          359236          412336
    ## 13:    215089852           95152           95889           97898
    ## 14:     15329960            9004            9227            9419
    ## 15:    359737826          146633          168236          185058
    ##     population_2005 population_2010
    ##  1:        20274282        22162863
    ##  2:          821820          859952
    ##  3:          254884          268065
    ##  4:           92329          102648
    ##  5:           52058           52428
    ##  6:          106198          103619
    ##  7:          228683          246345
    ##  8:         4134699         4369027
    ##  9:           19907           20470
    ## 10:         6086905         6847517
    ## 11:          179928          186029
    ## 12:          469306          526177
    ## 13:          100858          103947
    ## 14:            9694            9827
    ## 15:          209375          236299

2.  Convert `wide` to a matrix using the `"country"` column as the
    matrix rownames.

``` r
# Reshape from wide to long format
wide <- dcast(gdp_oceania, formula = country ~ year, value.var = c("gdp", "population"))

# convert to a matrix
as.matrix(wide, rownames = "country")
```

    ##                           gdp_1990     gdp_1995     gdp_2000     gdp_2005
    ## Australia             300107784341 338759864212 414780916644 485146627070
    ## Fiji                    1335705790   1516326476   1683082744   1896890618
    ## French Polynesia        2777827650   2928452782   3442160840           NA
    ## Kiribati                  48534476     51419787     68561481     72512766
    ## Marshall Islands         101112724    131689273    110971769    123281092
    ## Micronesia, Fed. Sts.    182461073    235499455    233938394    233237060
    ## New Caledonia           2285808773   2573368170   2641677234           NA
    ## New Zealand            39503489723  45171101764  51606891179  62729975739
    ## Palau                           NA    109666344    119875504    127993766
    ## Papua New Guinea        2356993537   3559227888   3518223421   3812278808
    ## Samoa                    194099795    204930258    242925503    313462373
    ## Solomon Islands          343423086    504296634    438937728    457857482
    ## Tonga                    142132664    171182064    188551996    213317400
    ## Tuvalu                    10157211     11798530     13741847     13825499
    ## Vanuatu                  194634278    228542854    271991177    283875173
    ##                           gdp_2010 population_1990 population_1995
    ## Australia             558301132672        17096869        18124770
    ## Fiji                    1907499910          728626          775498
    ## French Polynesia                NA          198370          215200
    ## Kiribati                  73245763           72411           77727
    ## Marshall Islands         127781844           47300           51020
    ## Micronesia, Fed. Sts.    221126797           96331          107556
    ## New Caledonia                   NA          168537          189198
    ## New Zealand            63915448868         3397534         3674886
    ## Palau                    117841911           15089           17255
    ## Papua New Guinea        5095994376         4157903         4715929
    ## Samoa                    329190409          162865          170158
    ## Solomon Islands          601834699          311849          359236
    ## Tonga                    215089852           95152           95889
    ## Tuvalu                    15329960            9004            9227
    ## Vanuatu                  359737826          146633          168236
    ##                       population_2000 population_2005 population_2010
    ## Australia                    19107251        20274282        22162863
    ## Fiji                           811223          821820          859952
    ## French Polynesia               237267          254884          268065
    ## Kiribati                        84406           92329          102648
    ## Marshall Islands                52161           52058           52428
    ## Micronesia, Fed. Sts.          107430          106198          103619
    ## New Caledonia                  209997          228683          246345
    ## New Zealand                   3858234         4134699         4369027
    ## Palau                           19174           19907           20470
    ## Papua New Guinea              5374051         6086905         6847517
    ## Samoa                          174614          179928          186029
    ## Solomon Islands                412336          469306          526177
    ## Tonga                           97898          100858          103947
    ## Tuvalu                           9419            9694            9827
    ## Vanuatu                        185058          209375          236299

3.  Modify the call to `dcast()` so that the `"continent"` column is
    also kept aside as row identifiers.

``` r
# Modify your previous code
dcast(gdp_oceania, formula = country + continent ~ year, value.var = c("gdp", "population"))
```

    ##                   country continent     gdp_1990     gdp_1995     gdp_2000
    ##  1:             Australia   Oceania 300107784341 338759864212 414780916644
    ##  2:                  Fiji   Oceania   1335705790   1516326476   1683082744
    ##  3:      French Polynesia   Oceania   2777827650   2928452782   3442160840
    ##  4:              Kiribati   Oceania     48534476     51419787     68561481
    ##  5:      Marshall Islands   Oceania    101112724    131689273    110971769
    ##  6: Micronesia, Fed. Sts.   Oceania    182461073    235499455    233938394
    ##  7:         New Caledonia   Oceania   2285808773   2573368170   2641677234
    ##  8:           New Zealand   Oceania  39503489723  45171101764  51606891179
    ##  9:                 Palau   Oceania           NA    109666344    119875504
    ## 10:      Papua New Guinea   Oceania   2356993537   3559227888   3518223421
    ## 11:                 Samoa   Oceania    194099795    204930258    242925503
    ## 12:       Solomon Islands   Oceania    343423086    504296634    438937728
    ## 13:                 Tonga   Oceania    142132664    171182064    188551996
    ## 14:                Tuvalu   Oceania     10157211     11798530     13741847
    ## 15:               Vanuatu   Oceania    194634278    228542854    271991177
    ##         gdp_2005     gdp_2010 population_1990 population_1995 population_2000
    ##  1: 485146627070 558301132672        17096869        18124770        19107251
    ##  2:   1896890618   1907499910          728626          775498          811223
    ##  3:           NA           NA          198370          215200          237267
    ##  4:     72512766     73245763           72411           77727           84406
    ##  5:    123281092    127781844           47300           51020           52161
    ##  6:    233237060    221126797           96331          107556          107430
    ##  7:           NA           NA          168537          189198          209997
    ##  8:  62729975739  63915448868         3397534         3674886         3858234
    ##  9:    127993766    117841911           15089           17255           19174
    ## 10:   3812278808   5095994376         4157903         4715929         5374051
    ## 11:    313462373    329190409          162865          170158          174614
    ## 12:    457857482    601834699          311849          359236          412336
    ## 13:    213317400    215089852           95152           95889           97898
    ## 14:     13825499     15329960            9004            9227            9419
    ## 15:    283875173    359737826          146633          168236          185058
    ##     population_2005 population_2010
    ##  1:        20274282        22162863
    ##  2:          821820          859952
    ##  3:          254884          268065
    ##  4:           92329          102648
    ##  5:           52058           52428
    ##  6:          106198          103619
    ##  7:          228683          246345
    ##  8:         4134699         4369027
    ##  9:           19907           20470
    ## 10:         6086905         6847517
    ## 11:          179928          186029
    ## 12:          469306          526177
    ## 13:          100858          103947
    ## 14:            9694            9827
    ## 15:          209375          236299

Nicely done! If you don’t want to keep any columns as row identifiers in
the result, you can use the special symbol `.` in the formula.

## Splitting by multiple groups

`gdp_by_industry_oceania` contains the GDP generated by the agriculture
and tourism industries in both 1995 and 2010. Your goal is to create a
wide format `data.table` containing columns of GDP for each year and
industry.

**Steps**

1.  Print `gdp_by_industry_oceania`.
2.  Convert `gdp_by_industry_oceania` to a wide format with each country
    as a row, splitting the `"gdp"` column so that the result has
    columns containing the gdp for each industry and each year.

``` r
# Load data
gdp_by_industry_oceania <- fread("data/gdp/gdp_by_industry_oceania.tsv")

# Split gdp by industry and year
dcast(gdp_by_industry_oceania, country ~ industry + year, value.var = "gdp")
```

    ##                   country agriculture_1995 agriculture_2010 tourism_1995
    ##  1:             Australia     203255918527     251235509702  16937993211
    ##  2:                  Fiji        909795885        858374960     75816324
    ##  3:      French Polynesia       1757071669             <NA>    146422639
    ##  4:              Kiribati         30851872         32960593      2570989
    ##  5:      Marshall Islands         79013564         57501830      6584464
    ##  6: Micronesia, Fed. Sts.        141299673         99507059     11774973
    ##  7:         New Caledonia       1544020902             <NA>    128668409
    ##  8:           New Zealand      27102661058      28761951991   2258555088
    ##  9:                 Palau         65799806         53028860      5483317
    ## 10:      Papua New Guinea       2135536733       2293197469    177961394
    ## 11:                 Samoa        122958155        148135684     10246513
    ## 12:       Solomon Islands        302577980        270825615     25214832
    ## 13:                 Tonga        102709238         96790433      8559103
    ## 14:                Tuvalu          7079118          6898482       589927
    ## 15:               Vanuatu        137125712        161882022     11427143
    ##     tourism_2010
    ##  1:  83745169901
    ##  2:    286124987
    ##  3:         <NA>
    ##  4:     10986864
    ##  5:     19167277
    ##  6:     33169020
    ##  7:         <NA>
    ##  8:   9587317330
    ##  9:     17676287
    ## 10:    764399156
    ## 11:     49378561
    ## 12:     90275205
    ## 13:     32263478
    ## 14:      2299494
    ## 15:     53960674

Awesome job! For advanced use cases take a look at the `fill` argument
which controls how `dcast` handles group combinations that do not occur,
and the `fun.aggregate` argument which controls how dcast handles cases
where there are multiple values for different group combinations.
