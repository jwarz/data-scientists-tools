Data Manipulation with data.table in R
================
Joschka Schwarz

-   [1. Introduction to data.table](#1-introduction-to-datatable)
    -   [Welcome to the course!](#welcome-to-the-course)
    -   [data.table pop quiz](#datatable-pop-quiz)
    -   [Creating a data.table](#creating-a-datatable)
    -   [Introducing bikes data](#introducing-bikes-data)
    -   [Filtering rows in a data.table](#filtering-rows-in-a-datatable)
    -   [Filtering rows using positive
        integers](#filtering-rows-using-positive-integers)
    -   [Filtering rows using negative
        integers](#filtering-rows-using-negative-integers)
    -   [Filtering rows using logical
        vectors](#filtering-rows-using-logical-vectors)
    -   [Helpers for filtering](#helpers-for-filtering)
    -   [I %like% data.tables](#i-like-datatables)
    -   [Filtering with %in%](#filtering-with-in)
    -   [Filtering with %between% and
        %chin%](#filtering-with-between-and-chin)
-   [2. Selecting and Computing on
    Columns](#2-selecting-and-computing-on-columns)
    -   [Selecting columns from a
        data.table](#selecting-columns-from-a-datatable)
    -   [Selecting a single column](#selecting-a-single-column)
    -   [Selecting columns by name](#selecting-columns-by-name)
    -   [Deselecting specific columns](#deselecting-specific-columns)
    -   [Computing on columns the data.table
        way](#computing-on-columns-the-datatable-way)
    -   [Computing in j (I)](#computing-in-j-i)
    -   [Computing in j (II)](#computing-in-j-ii)
    -   [Advanced computations in j](#advanced-computations-in-j)
    -   [Computing in j (III)](#computing-in-j-iii)
    -   [Combining i and j](#combining-i-and-j)
-   [3. Groupwise Operations](#3-groupwise-operations)
    -   [Computations by groups](#computations-by-groups)
    -   [Computing stats by groups (I)](#computing-stats-by-groups-i)
    -   [Computing stats by groups (II)](#computing-stats-by-groups-ii)
    -   [Computing multiple stats](#computing-multiple-stats)
    -   [Chaining data.table
        expressions](#chaining-datatable-expressions)
    -   [Ordering rows](#ordering-rows)
    -   [What are the top 5
        destinations?](#what-are-the-top-5-destinations)
    -   [What is the most popular destination from each start
        station?](#what-is-the-most-popular-destination-from-each-start-station)
    -   [Combining i, j, and by (I)](#combining-i-j-and-by-i)
    -   [Computations in j using .SD](#computations-in-j-using-sd)
    -   [Using .SD (I)](#using-sd-i)
    -   [Using .SD (II)](#using-sd-ii)
-   [4. Reference Semantics](#4-reference-semantics)
    -   [Adding and updating columns by
        reference](#adding-and-updating-columns-by-reference)
    -   [Adding a new column](#adding-a-new-column)
    -   [Updating an existing column
        (I)](#updating-an-existing-column-i)
    -   [Updating an existing column
        (II)](#updating-an-existing-column-ii)
    -   [Grouped aggregations](#grouped-aggregations)
    -   [Adding columns by group](#adding-columns-by-group)
    -   [Updating columns by group](#updating-columns-by-group)
    -   [Advanced aggregations](#advanced-aggregations)
    -   [Adding multiple columns (I)](#adding-multiple-columns-i)
    -   [Adding multiple columns (II)](#adding-multiple-columns-ii)
    -   [Combining i, j, and by (II)](#combining-i-j-and-by-ii)
-   [5. Importing and Exporting Data](#5-importing-and-exporting-data)
    -   [Fast data reading with fread()](#fast-data-reading-with-fread)
    -   [Fast reading from disk](#fast-reading-from-disk)
    -   [Importing a CSV file](#importing-a-csv-file)
    -   [Importing selected columns](#importing-selected-columns)
    -   [Importing selected rows](#importing-selected-rows)
    -   [Advanced file reading](#advanced-file-reading)
    -   [Reading large integers](#reading-large-integers)
    -   [Specifying column classes](#specifying-column-classes)
    -   [Dealing with empty and incomplete
        lines](#dealing-with-empty-and-incomplete-lines)
    -   [Dealing with missing values](#dealing-with-missing-values)
    -   [Fast data writing with
        fwrite()](#fast-data-writing-with-fwrite)
    -   [Writing files to disk](#writing-files-to-disk)
    -   [Writing date and time columns](#writing-date-and-time-columns)
    -   [Fast writing to disk](#fast-writing-to-disk)

**Short Description**

Master core concepts about data manipulation such as filtering,
selecting and calculating groupwise statistics using data.table.

**Long Description**

The data.table package provides a high-performance version of base R’s
data.frame with syntax and feature enhancements for ease of use,
convenience and programming speed. This course shows you how to create,
subset, and manipulate data.tables. You’ll also learn about the
database-inspired features of data.tables, including built-in groupwise
operations. The course concludes with fast methods of importing and
exporting tabular text data such as CSV files. Upon completion of the
course, you will be able to use data.table in R for a more efficient
manipulation and analysis process. Throughout the course you’ll explore
the San Francisco Bay Area bike share trip dataset from 2014.

# 1. Introduction to data.table

This chapter introduces data.tables as a drop-in replacement for
data.frames and shows how to use data.table’s <i>i</i> argument to
filter rows.

## Welcome to the course!

Theory. Coming soon …

**1. Welcome to the course!**

Welcome to the new and renewed introductory course on R’s data table
package. I am Arun Srinivasan, a data scientist in the Finance industry.

**2. What is a data.table?**

We hope that you are already familiar with data frames at this point. A
data table is also a data frame but does so much more. Like data frames,
they are columnar data structures and all columns must be of equal
length. So why do you need data tables?

**3. Why use data.table?**

A data table is a 2-D data structure, the two dimensions being rows and
columns. However, most data analysis tasks require performing operations
by groups. It is quite common to consider grouping as a virtual third
dimension. The data table syntax is quite powerful because it provides
quick access to these dimensions in the form of placeholders for
operations on rows, columns, and groups. The first argument, ‘i’ allows
for filtering of required rows by accepting an expression or simply the
required row numbers. If the ‘i’ argument is empty, then no rows are
filtered. The second argument, ‘j’ operates on columns. In addition to
just selecting columns as in a data frame, it also allows for directly
computing on the columns as you will see in the next chapters. The last
argument ‘by’ allows you to operate on columns by groups.

**4. Why use data.table?**

data table is also very fast - many operations are parallelized
including filtering, ordering, grouping, file reading, writing etc.
Check out this link for up-to-date benchmarks on data table’s
performance against other common packages.

**5. Why use data.table?**

Finally, data table has many additional powerful features including
rolling, overlapping and non-equi joins, updating tables by reference,
fast reshaping, parallel file reading/writing, primary key based joins,
automatic creation of secondary keys for faster filtering and joins etc.
We will not cover joins in this course, but they are covered in great
detail in the Joining Data in R with data table course here on DataCamp.

**6. Creating a data.table**

There are at least three ways in which you can create data tables. In
this video, we will cover the first two - using the data table and as
data table functions. We will cover fread() in the final chapter of this
course.

**7. Creating a data.table**

You can use the data table function to create a data table from scratch
the same way you would use the data frame function. All you need to do
is pass vectors of the same length to the data table function.

**8. Creating a data.table**

To convert an existing R object to a data table, you can use the as data
table function. As you can see here, we converted the list y to a data
table.

**9. data.tables and data.frames (I)**

As mentioned earlier, a data table is also a data frame and you can
confirm that here from the output of class().

**10. data.tables and data.frames (II)**

And thus you can use all the functions you would use on a data frame on
a data table. nrow(), ncol(), and dim(), for example, return the number
of rows, columns, and dimensions of a data table, as it would on a data
frame.

**11. data.tables and data.frames (III)**

However, there are a few enhancements. Unlike a data frame, a data table
doesn’t automatically convert characters to factors thus preventing bugs
by avoiding unexpected behavior.

**12. data.tables and data.frames (IV)**

Also, a data table never sets or uses the row names. Finally, a minor
but useful feature is that when you print a data table, a colon (:) is
added after the row number to visually separate it from the first
column.

**13. Let’s practice!**

Now it’s your turn to create data tables!

## data.table pop quiz

> ## *Question*
>
> Which of the following statements are true about `data.table`s?<br>
> <br> 1. A data.table is a data.frame. It inherits and builds on top of
> it.<br> 2. data.tables can have columns of different lengths.<br> 3.
> Columns of data.tables cannot be of data type list.<br> 4. data.tables
> never use or need row names.<br> <br> ⬜ 1 and 3<br> ✅ 1 and 4<br> ⬜
> 2 and 3<br> ⬜ 2 and 4<br>

Correct! These are two of the several advantages of using `data.table`s
in R!

## Creating a data.table

Just like how the `data.frame()` function can be used to create a data
frame, you can create a `data.table` using the `data.table()` function.
In this exercise, you will create the following `data.table`:

``` r
X
   id value
1:  a   0.5
2:  b   1.0
3:  c   1.5
```

**Steps**

1.  Load the `data.table` package.
2.  Create the data.table `X` shown above. Note that the column `id` is
    of type `character` and `value` is of type `numeric`.

``` r
# Load data.table
library(data.table)

# Create the data.table X
X <- data.table(id = c("a", "b", "c"), value = c(0.5, 1.0, 1.5))

# View X
X
```

    ##    id value
    ## 1:  a   0.5
    ## 2:  b   1.0
    ## 3:  c   1.5

Well done! Check out the other arguments of `data.table()` to gain a
better understanding of how `data.table`s work.

## Introducing bikes data

Throughout the rest of the course, you will use the `batrips` dataset
from the
<a href="https://www.rdocumentation.org/packages/bikeshare14">`bikeshare14`</a>
package, which contains anonymous bike share data on bicycle trips
around San Francisco in 2014. Type `batrips` in the console and hit
enter. Note how `data.table` automatically limits printing to just the
top 5 and bottom 5 rows of the dataset along with column names and row
numbers.

Recall that since a `data.table` is a `data.frame`, you can use base R
functions like `ncol()`, `nrow()`, `head()`, `tail()` and `str()` for
exploring `data.table`s.

Unless otherwise mentioned, assume that both `data.table` and `batrips`
are loaded in your exercises.

**Steps**

1.  Get the number of columns in `batrips` and store it in `col_number`.

``` r
# Load package for the dataset
library(bikeshare14)
batrips <- as.data.table(batrips)

# Get number of columns in batrips
col_number <- ncol(batrips)
```

2.  Print the first eight rows of `batrips`.

``` r
# Print the first 8 rows
head(batrips, 8)
```

    ##    trip_id duration          start_date           start_station start_terminal
    ## 1:  139545      435 2014-01-01 00:14:00 San Francisco City Hall             58
    ## 2:  139546      432 2014-01-01 00:14:00 San Francisco City Hall             58
    ## 3:  139547     1523 2014-01-01 00:17:00  Embarcadero at Sansome             60
    ## 4:  139549     1620 2014-01-01 00:23:00       Steuart at Market             74
    ## 5:  139550     1617 2014-01-01 00:23:00       Steuart at Market             74
    ## 6:  139551      779 2014-01-01 00:24:00       Steuart at Market             74
    ## 7:  139552      784 2014-01-01 00:24:00       Steuart at Market             74
    ## 8:  139553      721 2014-01-01 00:25:00       Steuart at Market             74
    ##               end_date           end_station end_terminal bike_id
    ## 1: 2014-01-01 00:21:00       Townsend at 7th           65     473
    ## 2: 2014-01-01 00:21:00       Townsend at 7th           65     395
    ## 3: 2014-01-01 00:42:00       Beale at Market           56     331
    ## 4: 2014-01-01 00:50:00    Powell Street BART           39     605
    ## 5: 2014-01-01 00:50:00    Powell Street BART           39     453
    ## 6: 2014-01-01 00:37:00 Washington at Kearney           46     335
    ## 7: 2014-01-01 00:37:00 Washington at Kearney           46     580
    ## 8: 2014-01-01 00:37:00 Washington at Kearney           46     563
    ##    subscription_type zip_code
    ## 1:        Subscriber    94612
    ## 2:        Subscriber    94107
    ## 3:        Subscriber    94112
    ## 4:          Customer    92007
    ## 5:          Customer    92007
    ## 6:          Customer    94109
    ## 7:          Customer         
    ## 8:          Customer    94109

3.  Print the last eight rows using `tail()`.

``` r
# Print the last 8 rows
tail(batrips, 8)
```

    ##    trip_id duration          start_date                   start_station
    ## 1:  588907      770 2014-12-31 22:51:00                 Townsend at 7th
    ## 2:  588909      992 2014-12-31 23:06:00            Washington at Kearny
    ## 3:  588908     1004 2014-12-31 23:06:00            Washington at Kearny
    ## 4:  588910      437 2014-12-31 23:18:00              Powell Street BART
    ## 5:  588911      422 2014-12-31 23:19:00 Grant Avenue at Columbus Avenue
    ## 6:  588912     1487 2014-12-31 23:31:00        South Van Ness at Market
    ## 7:  588913     1458 2014-12-31 23:32:00        South Van Ness at Market
    ## 8:  588914      364 2014-12-31 23:33:00           Embarcadero at Bryant
    ##    start_terminal            end_date
    ## 1:             65 2014-12-31 23:04:00
    ## 2:             46 2014-12-31 23:23:00
    ## 3:             46 2014-12-31 23:23:00
    ## 4:             39 2014-12-31 23:25:00
    ## 5:             73 2014-12-31 23:26:00
    ## 6:             66 2014-12-31 23:56:00
    ## 7:             66 2014-12-31 23:56:00
    ## 8:             54 2014-12-31 23:40:00
    ##                                      end_station end_terminal bike_id
    ## 1:                                 Howard at 2nd           63     677
    ## 2:                        Embarcadero at Vallejo           48     485
    ## 3:                        Embarcadero at Vallejo           48     419
    ## 4:      San Francisco Caltrain (Townsend at 4th)           70     573
    ## 5: Yerba Buena Center of the Arts (3rd @ Howard)           68     604
    ## 6:                             Steuart at Market           74     480
    ## 7:                             Steuart at Market           74     277
    ## 8:                                 Howard at 2nd           63      56
    ##    subscription_type zip_code
    ## 1:        Subscriber    94107
    ## 2:          Customer    92104
    ## 3:          Customer    92104
    ## 4:        Subscriber    95050
    ## 5:        Subscriber    94133
    ## 6:          Customer    94109
    ## 7:          Customer    94109
    ## 8:        Subscriber    94105

4.  Print the structure of `batrips`.

``` r
# Print the structure of batrips
str(batrips)
```

    ## Classes 'data.table' and 'data.frame':   326339 obs. of  11 variables:
    ##  $ trip_id          : int  139545 139546 139547 139549 139550 139551 139552 139553 139554 139555 ...
    ##  $ duration         : int  435 432 1523 1620 1617 779 784 721 624 574 ...
    ##  $ start_date       : POSIXct, format: "2014-01-01 00:14:00" "2014-01-01 00:14:00" ...
    ##  $ start_station    : chr  "San Francisco City Hall" "San Francisco City Hall" "Embarcadero at Sansome" "Steuart at Market" ...
    ##  $ start_terminal   : int  58 58 60 74 74 74 74 74 57 57 ...
    ##  $ end_date         : POSIXct, format: "2014-01-01 00:21:00" "2014-01-01 00:21:00" ...
    ##  $ end_station      : chr  "Townsend at 7th" "Townsend at 7th" "Beale at Market" "Powell Street BART" ...
    ##  $ end_terminal     : int  65 65 56 39 39 46 46 46 68 68 ...
    ##  $ bike_id          : int  473 395 331 605 453 335 580 563 358 365 ...
    ##  $ subscription_type: chr  "Subscriber" "Subscriber" "Subscriber" "Customer" ...
    ##  $ zip_code         : chr  "94612" "94107" "94112" "92007" ...
    ##  - attr(*, ".internal.selfref")=<externalptr>

Amazing job! Make sure you are familiar with this dataset. We will be
using this throughout the course!

## Filtering rows in a data.table

Theory. Coming soon …

**1. Filtering rows in a data.table**

In this lesson, we will look at how to subset or filter rows from a data
table using row numbers and logical expressions.

**2. General form of data.table syntax**

The general form of a data table is DT square brackets, i, comma, j,
comma, by. It is read out loud as, “Take DT, filter rows in”i”, then
compute “j” grouped by “by”. We will look at the first argument “i”
here. The functionality is similar to data frames but more convenient
and enhanced.

**3. Row numbers**

Rows can be filtered using row numbers as you would do in a data frame,
except the first argument is always interpreted as a row operation
irrespective of whether or not you specify a comma. For example, to
subset the third and fourth rows, you can use the code as shown here. If
you want to exclude a set of rows, you can use the negative sign or the
exclamation mark as shown here.

**4. Special symbol .N**

data table contains a few handy special symbols (or variables) that make
many operations efficient. One such symbol is dot N which is an integer
vector of length one. When used in the “i” argument, it returns the
total number of rows in the data table. To get the last row, for
example, you can simply do batrips square brackets dot N. Similarly, to
get all but the last 10 rows, you can specify the “i” argument as 1
colon dot N minus 10. Since dot N is the total numbers of rows, you are
essentially creating a continuous sequence of integers from 1 to the
required row number.

**5. Logical expressions (I)**

You can also construct expressions resulting in a logical vector in the
“i” argument. This returns only those rows that evaluate to TRUE.
However, note how we refer to the columns in data table as if they are
variables. This is because within the scope of data table, that is,
within the two square brackets, columns are seen as if they are
variables. This avoids unnecessary repetition of the dollar sign when
referring to column names while constructing expressions and therefore
avoids subtle and hard to track bugs. Also, the resulting expression is
much cleaner and easier to read.

**6. Logical expressions (II)**

Here’s another example. In this example, we filter for rows where
start_terminal is 58 and end_terminal is not 65. Again, note the concise
and clear syntax of data table.

**7. Logical expressions (III)**

As mentioned in the first video, data table is fast! It automatically
creates an index (or key) of the columns used to subset the data so that
any subsequent operations on that column are incredibly faster. You can
have a look at all such indices using the indices() function. Let’s look
at an example. First, we create a data table dt with 10 million rows.
When we call indices() on dt, we can see that the result is NULL. Thus,
at this point, the data table has no indices. When we perform a subset
operation for the first time, we can see that it takes about 0-point-2
seconds. Now when we run indices of dt again, notice that x is an index.
So when we perform the same operation again, it takes only about
0-point-002 seconds.

**8. Let’s practice!**

It’s time for you to practice subsetting data tables.

## Filtering rows using positive integers

You can filter the required rows from a `data.table` by providing the
row indices to its first argument (`i`), just like when working with a
`data.frame`. However, unlike a `data.frame`, you don’t need to add a
comma (`,`) when filtering rows.

**Steps**

1.  Filter the third row from `batrips`, storing the result in `row_3`.

``` r
# Filter third row
row_3 <- batrips[3]
row_3
```

    ##    trip_id duration          start_date          start_station start_terminal
    ## 1:  139547     1523 2014-01-01 00:17:00 Embarcadero at Sansome             60
    ##               end_date     end_station end_terminal bike_id subscription_type
    ## 1: 2014-01-01 00:42:00 Beale at Market           56     331        Subscriber
    ##    zip_code
    ## 1:    94112

2.  Filter rows 10 through 20 (including both) from `batrips`, storing
    the result in `rows_10_20`.

``` r
# Filter rows 10 through 20
rows_10_20 <- batrips[10:20]
rows_10_20
```

    ##     trip_id duration          start_date                        start_station
    ##  1:  139555      574 2014-01-01 00:25:00                        5th at Howard
    ##  2:  139558     1600 2014-01-01 00:28:00 Harry Bridges Plaza (Ferry Building)
    ##  3:  139559     3691 2014-01-01 00:32:00                    Steuart at Market
    ##  4:  139560     3793 2014-01-01 00:32:00                    Steuart at Market
    ##  5:  139561     3788 2014-01-01 00:32:00                    Steuart at Market
    ##  6:  139562     3626 2014-01-01 00:33:00                    Steuart at Market
    ##  7:  139563      805 2014-01-01 00:33:00                    Steuart at Market
    ##  8:  139564      769 2014-01-01 00:34:00                    Steuart at Market
    ##  9:  139565     1157 2014-01-01 00:36:00                    Steuart at Market
    ## 10:  139566     1159 2014-01-01 00:37:00                    Steuart at Market
    ## 11:  139567      477 2014-01-01 00:39:00                      Beale at Market
    ##     start_terminal            end_date
    ##  1:             57 2014-01-01 00:35:00
    ##  2:             50 2014-01-01 00:54:00
    ##  3:             74 2014-01-01 01:33:00
    ##  4:             74 2014-01-01 01:35:00
    ##  5:             74 2014-01-01 01:35:00
    ##  6:             74 2014-01-01 01:33:00
    ##  7:             74 2014-01-01 00:47:00
    ##  8:             74 2014-01-01 00:47:00
    ##  9:             74 2014-01-01 00:56:00
    ## 10:             74 2014-01-01 00:56:00
    ## 11:             56 2014-01-01 00:47:00
    ##                                       end_station end_terminal bike_id
    ##  1: Yerba Buena Center of the Arts (3rd @ Howard)           68     365
    ##  2:                             Steuart at Market           74     413
    ##  3:                             Steuart at Market           74     619
    ##  4:                             Steuart at Market           74     311
    ##  5:                             Steuart at Market           74     577
    ##  6:                             Steuart at Market           74     271
    ##  7: Yerba Buena Center of the Arts (3rd @ Howard)           68     508
    ##  8: Yerba Buena Center of the Arts (3rd @ Howard)           68     384
    ##  9:             Civic Center BART (7th at Market)           72     276
    ## 10:             Civic Center BART (7th at Market)           72     423
    ## 11:                               Spear at Folsom           49     265
    ##     subscription_type zip_code
    ##  1:          Customer    94941
    ##  2:        Subscriber    94102
    ##  3:          Customer    94070
    ##  4:          Customer    55417
    ##  5:          Customer    55417
    ##  6:          Customer    94070
    ##  7:          Customer         
    ##  8:          Customer         
    ##  9:          Customer         
    ## 10:          Customer         
    ## 11:          Customer    94105

3.  Filter the 1st, 6th and 10th rows, in that order, from `batrips`.
    Store the result in `rows_1_6_10`.

``` r
# Filter the 1st, 6th and 10th rows
rows_1_6_10 <- batrips[c(1, 6, 10)]
rows_1_6_10
```

    ##    trip_id duration          start_date           start_station start_terminal
    ## 1:  139545      435 2014-01-01 00:14:00 San Francisco City Hall             58
    ## 2:  139551      779 2014-01-01 00:24:00       Steuart at Market             74
    ## 3:  139555      574 2014-01-01 00:25:00           5th at Howard             57
    ##               end_date                                   end_station
    ## 1: 2014-01-01 00:21:00                               Townsend at 7th
    ## 2: 2014-01-01 00:37:00                         Washington at Kearney
    ## 3: 2014-01-01 00:35:00 Yerba Buena Center of the Arts (3rd @ Howard)
    ##    end_terminal bike_id subscription_type zip_code
    ## 1:           65     473        Subscriber    94612
    ## 2:           46     335          Customer    94109
    ## 3:           68     365          Customer    94941

Nicely done! See how easy it is to filter rows using positive integers?

## Filtering rows using negative integers

Sometimes, instead of selecting all of the rows you want individually,
it makes sense to deselect the rows you do not want to include. Recall
that this can be done using either the `!` or the `-` operators.

For example, `dt[-(1:5)]` returns all rows *except* the first five.

Note: `dt[-(1:5)]` is equivalent to `dt[!(1:5)]`.

**Steps**

1.  Use negative indexing to exclude the first two rows in `batrips`.

``` r
# Select all rows except the first two
not_first_two <- batrips[-(1:2)]
not_first_two
```

    ##         trip_id duration          start_date                   start_station
    ##      1:  139547     1523 2014-01-01 00:17:00          Embarcadero at Sansome
    ##      2:  139549     1620 2014-01-01 00:23:00               Steuart at Market
    ##      3:  139550     1617 2014-01-01 00:23:00               Steuart at Market
    ##      4:  139551      779 2014-01-01 00:24:00               Steuart at Market
    ##      5:  139552      784 2014-01-01 00:24:00               Steuart at Market
    ##     ---                                                                     
    ## 326333:  588910      437 2014-12-31 23:18:00              Powell Street BART
    ## 326334:  588911      422 2014-12-31 23:19:00 Grant Avenue at Columbus Avenue
    ## 326335:  588912     1487 2014-12-31 23:31:00        South Van Ness at Market
    ## 326336:  588913     1458 2014-12-31 23:32:00        South Van Ness at Market
    ## 326337:  588914      364 2014-12-31 23:33:00           Embarcadero at Bryant
    ##         start_terminal            end_date
    ##      1:             60 2014-01-01 00:42:00
    ##      2:             74 2014-01-01 00:50:00
    ##      3:             74 2014-01-01 00:50:00
    ##      4:             74 2014-01-01 00:37:00
    ##      5:             74 2014-01-01 00:37:00
    ##     ---                                   
    ## 326333:             39 2014-12-31 23:25:00
    ## 326334:             73 2014-12-31 23:26:00
    ## 326335:             66 2014-12-31 23:56:00
    ## 326336:             66 2014-12-31 23:56:00
    ## 326337:             54 2014-12-31 23:40:00
    ##                                           end_station end_terminal bike_id
    ##      1:                               Beale at Market           56     331
    ##      2:                            Powell Street BART           39     605
    ##      3:                            Powell Street BART           39     453
    ##      4:                         Washington at Kearney           46     335
    ##      5:                         Washington at Kearney           46     580
    ##     ---                                                                   
    ## 326333:      San Francisco Caltrain (Townsend at 4th)           70     573
    ## 326334: Yerba Buena Center of the Arts (3rd @ Howard)           68     604
    ## 326335:                             Steuart at Market           74     480
    ## 326336:                             Steuart at Market           74     277
    ## 326337:                                 Howard at 2nd           63      56
    ##         subscription_type zip_code
    ##      1:        Subscriber    94112
    ##      2:          Customer    92007
    ##      3:          Customer    92007
    ##      4:          Customer    94109
    ##      5:          Customer         
    ##     ---                           
    ## 326333:        Subscriber    95050
    ## 326334:        Subscriber    94133
    ## 326335:          Customer    94109
    ## 326336:          Customer    94109
    ## 326337:        Subscriber    94105

2.  Use negative indexing to exclude rows 1 through 5 and 10 through 15
    in `batrips`.

``` r
# Select all rows except 1 through 5 and 10 through 15
exclude_some <- batrips[-c(1:5, 10:15)]
exclude_some
```

    ##         trip_id duration          start_date                   start_station
    ##      1:  139551      779 2014-01-01 00:24:00               Steuart at Market
    ##      2:  139552      784 2014-01-01 00:24:00               Steuart at Market
    ##      3:  139553      721 2014-01-01 00:25:00               Steuart at Market
    ##      4:  139554      624 2014-01-01 00:25:00                   5th at Howard
    ##      5:  139563      805 2014-01-01 00:33:00               Steuart at Market
    ##     ---                                                                     
    ## 326324:  588910      437 2014-12-31 23:18:00              Powell Street BART
    ## 326325:  588911      422 2014-12-31 23:19:00 Grant Avenue at Columbus Avenue
    ## 326326:  588912     1487 2014-12-31 23:31:00        South Van Ness at Market
    ## 326327:  588913     1458 2014-12-31 23:32:00        South Van Ness at Market
    ## 326328:  588914      364 2014-12-31 23:33:00           Embarcadero at Bryant
    ##         start_terminal            end_date
    ##      1:             74 2014-01-01 00:37:00
    ##      2:             74 2014-01-01 00:37:00
    ##      3:             74 2014-01-01 00:37:00
    ##      4:             57 2014-01-01 00:35:00
    ##      5:             74 2014-01-01 00:47:00
    ##     ---                                   
    ## 326324:             39 2014-12-31 23:25:00
    ## 326325:             73 2014-12-31 23:26:00
    ## 326326:             66 2014-12-31 23:56:00
    ## 326327:             66 2014-12-31 23:56:00
    ## 326328:             54 2014-12-31 23:40:00
    ##                                           end_station end_terminal bike_id
    ##      1:                         Washington at Kearney           46     335
    ##      2:                         Washington at Kearney           46     580
    ##      3:                         Washington at Kearney           46     563
    ##      4: Yerba Buena Center of the Arts (3rd @ Howard)           68     358
    ##      5: Yerba Buena Center of the Arts (3rd @ Howard)           68     508
    ##     ---                                                                   
    ## 326324:      San Francisco Caltrain (Townsend at 4th)           70     573
    ## 326325: Yerba Buena Center of the Arts (3rd @ Howard)           68     604
    ## 326326:                             Steuart at Market           74     480
    ## 326327:                             Steuart at Market           74     277
    ## 326328:                                 Howard at 2nd           63      56
    ##         subscription_type zip_code
    ##      1:          Customer    94109
    ##      2:          Customer         
    ##      3:          Customer    94109
    ##      4:          Customer    94941
    ##      5:          Customer         
    ##     ---                           
    ## 326324:        Subscriber    95050
    ## 326325:        Subscriber    94133
    ## 326326:          Customer    94109
    ## 326327:          Customer    94109
    ## 326328:        Subscriber    94105

3.  Use negative indexing to exclude the first and last rows in
    `batrips`.

``` r
# Select all rows except the first and last
not_first_last <- batrips[-c(1, .N)] # Or batrips[-c(1, nrow(batrips))]
not_first_last
```

    ##         trip_id duration          start_date                   start_station
    ##      1:  139546      432 2014-01-01 00:14:00         San Francisco City Hall
    ##      2:  139547     1523 2014-01-01 00:17:00          Embarcadero at Sansome
    ##      3:  139549     1620 2014-01-01 00:23:00               Steuart at Market
    ##      4:  139550     1617 2014-01-01 00:23:00               Steuart at Market
    ##      5:  139551      779 2014-01-01 00:24:00               Steuart at Market
    ##     ---                                                                     
    ## 326333:  588908     1004 2014-12-31 23:06:00            Washington at Kearny
    ## 326334:  588910      437 2014-12-31 23:18:00              Powell Street BART
    ## 326335:  588911      422 2014-12-31 23:19:00 Grant Avenue at Columbus Avenue
    ## 326336:  588912     1487 2014-12-31 23:31:00        South Van Ness at Market
    ## 326337:  588913     1458 2014-12-31 23:32:00        South Van Ness at Market
    ##         start_terminal            end_date
    ##      1:             58 2014-01-01 00:21:00
    ##      2:             60 2014-01-01 00:42:00
    ##      3:             74 2014-01-01 00:50:00
    ##      4:             74 2014-01-01 00:50:00
    ##      5:             74 2014-01-01 00:37:00
    ##     ---                                   
    ## 326333:             46 2014-12-31 23:23:00
    ## 326334:             39 2014-12-31 23:25:00
    ## 326335:             73 2014-12-31 23:26:00
    ## 326336:             66 2014-12-31 23:56:00
    ## 326337:             66 2014-12-31 23:56:00
    ##                                           end_station end_terminal bike_id
    ##      1:                               Townsend at 7th           65     395
    ##      2:                               Beale at Market           56     331
    ##      3:                            Powell Street BART           39     605
    ##      4:                            Powell Street BART           39     453
    ##      5:                         Washington at Kearney           46     335
    ##     ---                                                                   
    ## 326333:                        Embarcadero at Vallejo           48     419
    ## 326334:      San Francisco Caltrain (Townsend at 4th)           70     573
    ## 326335: Yerba Buena Center of the Arts (3rd @ Howard)           68     604
    ## 326336:                             Steuart at Market           74     480
    ## 326337:                             Steuart at Market           74     277
    ##         subscription_type zip_code
    ##      1:        Subscriber    94107
    ##      2:        Subscriber    94112
    ##      3:          Customer    92007
    ##      4:          Customer    92007
    ##      5:          Customer    94109
    ##     ---                           
    ## 326333:          Customer    92104
    ## 326334:        Subscriber    95050
    ## 326335:        Subscriber    94133
    ## 326336:          Customer    94109
    ## 326337:          Customer    94109

Wohoo! You now know how to select and drop rows using positive and
negative integers.

## Filtering rows using logical vectors

In this exercise, you’ll use expressions that evaluate to a *logical*
vector to filter rows in a `data.table`. All rows that evaluate to
`TRUE` will be returned.

Note that you can refer to column names directly, without the need for
the `$` operator.

**Steps**

1.  Filter all the rows where `start_station` is `"MLK Library"`.

``` r
# Filter all rows where start_station is "MLK Library"
trips_mlk <- batrips[start_station == "MLK Library"]
trips_mlk
```

    ##      trip_id duration          start_date start_station start_terminal
    ##   1:  140683      426 2014-01-02 16:07:00   MLK Library             11
    ##   2:  140787      333 2014-01-02 16:51:00   MLK Library             11
    ##   3:  141476      467 2014-01-03 10:08:00   MLK Library             11
    ##   4:  141641      246 2014-01-03 12:32:00   MLK Library             11
    ##   5:  141830      380 2014-01-03 15:56:00   MLK Library             11
    ##  ---                                                                  
    ## 831:  588367    34719 2014-12-31 01:08:00   MLK Library             11
    ## 832:  588366    34715 2014-12-31 01:08:00   MLK Library             11
    ## 833:  588368    34595 2014-12-31 01:10:00   MLK Library             11
    ## 834:  588429      692 2014-12-31 07:29:00   MLK Library             11
    ## 835:  588430      599 2014-12-31 07:30:00   MLK Library             11
    ##                 end_date                       end_station end_terminal bike_id
    ##   1: 2014-01-02 16:14:00 San Jose Diridon Caltrain Station            2     657
    ##   2: 2014-01-02 16:56:00                  Adobe on Almaden            5     140
    ##   3: 2014-01-03 10:15:00              Paseo de San Antonio            7     182
    ##   4: 2014-01-03 12:37:00               San Salvador at 1st            8     665
    ##   5: 2014-01-03 16:03:00 San Jose Diridon Caltrain Station            2     176
    ##  ---                                                                           
    ## 831: 2014-12-31 10:47:00                       MLK Library           11     128
    ## 832: 2014-12-31 10:47:00                       MLK Library           11     667
    ## 833: 2014-12-31 10:47:00                       MLK Library           11     241
    ## 834: 2014-12-31 07:40:00 San Jose Diridon Caltrain Station            2     180
    ## 835: 2014-12-31 07:40:00 San Jose Diridon Caltrain Station            2     682
    ##      subscription_type zip_code
    ##   1:        Subscriber    94043
    ##   2:        Subscriber    94536
    ##   3:        Subscriber    95035
    ##   4:        Subscriber    95112
    ##   5:        Subscriber    94043
    ##  ---                           
    ## 831:          Customer    95112
    ## 832:          Customer    95112
    ## 833:          Customer    95076
    ## 834:        Subscriber    95112
    ## 835:        Subscriber    95113

2.  Filter all rows where `start_station` is `"MLK Library"` *and*
    `duration` is greater than 1600.

``` r
# Filter all rows where start_station is "MLK Library" AND duration > 1600
trips_mlk_1600 <- batrips[start_station == "MLK Library" & duration > 1600]
trips_mlk_1600
```

    ##     trip_id duration          start_date start_station start_terminal
    ##  1:  147733     1744 2014-01-09 11:47:00   MLK Library             11
    ##  2:  158900    61848 2014-01-19 16:42:00   MLK Library             11
    ##  3:  159736     1665 2014-01-20 18:38:00   MLK Library             11
    ##  4:  159737     1671 2014-01-20 18:38:00   MLK Library             11
    ##  5:  166370     6125 2014-01-26 14:12:00   MLK Library             11
    ##  6:  166371     6039 2014-01-26 14:13:00   MLK Library             11
    ##  7:  171845     4629 2014-01-31 01:07:00   MLK Library             11
    ##  8:  176588     1781 2014-02-05 09:03:00   MLK Library             11
    ##  9:  180917    68778 2014-02-11 15:16:00   MLK Library             11
    ## 10:  207319     1615 2014-03-09 17:04:00   MLK Library             11
    ## 11:  207641     4490 2014-03-10 08:06:00   MLK Library             11
    ## 12:  215277     1652 2014-03-15 15:36:00   MLK Library             11
    ## 13:  215829    26719 2014-03-16 14:09:00   MLK Library             11
    ## 14:  215835    26606 2014-03-16 14:11:00   MLK Library             11
    ## 15:  224012     3553 2014-03-22 19:16:00   MLK Library             11
    ## 16:  224013     3204 2014-03-22 19:22:00   MLK Library             11
    ## 17:  224304     9506 2014-03-23 14:37:00   MLK Library             11
    ## 18:  224305     9362 2014-03-23 14:40:00   MLK Library             11
    ## 19:  231184     2336 2014-03-30 08:48:00   MLK Library             11
    ## 20:  231461     1839 2014-03-30 15:34:00   MLK Library             11
    ## 21:  233561     5145 2014-04-02 08:01:00   MLK Library             11
    ## 22:  237605     6406 2014-04-05 14:23:00   MLK Library             11
    ## 23:  238354     7041 2014-04-06 18:26:00   MLK Library             11
    ## 24:  238964     2474 2014-04-07 10:50:00   MLK Library             11
    ## 25:  243981    22350 2014-04-10 16:34:00   MLK Library             11
    ## 26:  244441    38525 2014-04-11 00:45:00   MLK Library             11
    ## 27:  245171     1727 2014-04-11 15:07:00   MLK Library             11
    ## 28:  245173     1682 2014-04-11 15:08:00   MLK Library             11
    ## 29:  245208     2245 2014-04-11 15:39:00   MLK Library             11
    ## 30:  245212     2149 2014-04-11 15:40:00   MLK Library             11
    ## 31:  245977    25692 2014-04-12 13:47:00   MLK Library             11
    ## 32:  258870     6557 2014-04-23 16:43:00   MLK Library             11
    ## 33:  262804     3582 2014-04-28 08:17:00   MLK Library             11
    ## 34:  271145     1631 2014-05-04 15:19:00   MLK Library             11
    ## 35:  275500   168395 2014-05-07 15:47:00   MLK Library             11
    ## 36:  275926     5390 2014-05-07 18:45:00   MLK Library             11
    ## 37:  275928     5332 2014-05-07 18:46:00   MLK Library             11
    ## 38:  276189     1705 2014-05-08 06:57:00   MLK Library             11
    ## 39:  278974    11620 2014-05-10 09:47:00   MLK Library             11
    ## 40:  286203     2105 2014-05-15 19:43:00   MLK Library             11
    ## 41:  287783    18184 2014-05-16 20:07:00   MLK Library             11
    ## 42:  302706     8035 2014-05-29 12:23:00   MLK Library             11
    ## 43:  302712     7860 2014-05-29 12:25:00   MLK Library             11
    ## 44:  305126     4874 2014-05-31 11:20:00   MLK Library             11
    ## 45:  305130     9338 2014-05-31 11:22:00   MLK Library             11
    ## 46:  315821    15235 2014-06-08 21:22:00   MLK Library             11
    ## 47:  316695     4403 2014-06-09 13:23:00   MLK Library             11
    ## 48:  316694     4398 2014-06-09 13:23:00   MLK Library             11
    ## 49:  324444     1723 2014-06-14 16:21:00   MLK Library             11
    ## 50:  324446     1700 2014-06-14 16:22:00   MLK Library             11
    ## 51:  325172     2964 2014-06-15 19:53:00   MLK Library             11
    ## 52:  325174     2796 2014-06-15 19:56:00   MLK Library             11
    ## 53:  326021     2477 2014-06-16 12:35:00   MLK Library             11
    ## 54:  329525     6966 2014-06-18 13:34:00   MLK Library             11
    ## 55:  331197    20671 2014-06-19 14:30:00   MLK Library             11
    ## 56:  331253    16797 2014-06-19 15:35:00   MLK Library             11
    ## 57:  331932     1913 2014-06-19 21:16:00   MLK Library             11
    ## 58:  336447     2626 2014-06-24 07:33:00   MLK Library             11
    ## 59:  339011    19511 2014-06-25 14:06:00   MLK Library             11
    ## 60:  339013    15690 2014-06-25 14:07:00   MLK Library             11
    ## 61:  345918     2579 2014-06-30 20:46:00   MLK Library             11
    ## 62:  346850     7419 2014-07-01 15:34:00   MLK Library             11
    ## 63:  351202    75126 2014-07-04 23:06:00   MLK Library             11
    ## 64:  370599    14793 2014-07-18 20:16:00   MLK Library             11
    ## 65:  391024     7450 2014-08-01 19:21:00   MLK Library             11
    ## 66:  391894     9001 2014-08-03 12:04:00   MLK Library             11
    ## 67:  407384     1920 2014-08-13 16:18:00   MLK Library             11
    ## 68:  407382     1928 2014-08-13 16:18:00   MLK Library             11
    ## 69:  410332     8303 2014-08-15 11:20:00   MLK Library             11
    ## 70:  410333     8210 2014-08-15 11:22:00   MLK Library             11
    ## 71:  410336     8066 2014-08-15 11:24:00   MLK Library             11
    ## 72:  411884     2431 2014-08-16 23:26:00   MLK Library             11
    ## 73:  412323    10611 2014-08-17 18:14:00   MLK Library             11
    ## 74:  427235    79197 2014-08-27 13:31:00   MLK Library             11
    ## 75:  428990    12149 2014-08-28 11:43:00   MLK Library             11
    ## 76:  428989    12148 2014-08-28 11:43:00   MLK Library             11
    ## 77:  461834    19167 2014-09-19 20:13:00   MLK Library             11
    ## 78:  461993    12590 2014-09-20 10:13:00   MLK Library             11
    ## 79:  468000     1711 2014-09-24 16:34:00   MLK Library             11
    ## 80:  469674     2859 2014-09-25 16:42:00   MLK Library             11
    ## 81:  476380     3250 2014-09-30 16:34:00   MLK Library             11
    ## 82:  495778     3015 2014-10-13 11:16:00   MLK Library             11
    ## 83:  505517     9848 2014-10-19 14:56:00   MLK Library             11
    ## 84:  506277     1812 2014-10-20 09:16:00   MLK Library             11
    ## 85:  509993     1985 2014-10-22 09:37:00   MLK Library             11
    ## 86:  514887     3298 2014-10-24 21:06:00   MLK Library             11
    ## 87:  534363     2229 2014-11-07 09:55:00   MLK Library             11
    ## 88:  569828     1691 2014-12-08 13:47:00   MLK Library             11
    ## 89:  588367    34719 2014-12-31 01:08:00   MLK Library             11
    ## 90:  588366    34715 2014-12-31 01:08:00   MLK Library             11
    ## 91:  588368    34595 2014-12-31 01:10:00   MLK Library             11
    ##     trip_id duration          start_date start_station start_terminal
    ##                end_date                       end_station end_terminal bike_id
    ##  1: 2014-01-09 12:16:00                San Jose City Hall           10     691
    ##  2: 2014-01-20 09:52:00             San Jose Civic Center            3      86
    ##  3: 2014-01-20 19:06:00                       MLK Library           11     175
    ##  4: 2014-01-20 19:06:00                       MLK Library           11     262
    ##  5: 2014-01-26 15:54:00                       MLK Library           11      11
    ##  6: 2014-01-26 15:54:00                       MLK Library           11     308
    ##  7: 2014-01-31 02:24:00        SJSU - San Salvador at 9th           16     307
    ##  8: 2014-02-05 09:33:00              Paseo de San Antonio            7     249
    ##  9: 2014-02-12 10:23:00                       MLK Library           11     140
    ## 10: 2014-03-09 17:31:00                       MLK Library           11     133
    ## 11: 2014-03-10 09:21:00              Paseo de San Antonio            7     133
    ## 12: 2014-03-15 16:04:00             San Jose Civic Center            3      59
    ## 13: 2014-03-16 21:35:00        SJSU - San Salvador at 9th           16     690
    ## 14: 2014-03-16 21:35:00        SJSU - San Salvador at 9th           16     666
    ## 15: 2014-03-22 20:15:00                  Adobe on Almaden            5     132
    ## 16: 2014-03-22 20:15:00                  Adobe on Almaden            5     176
    ## 17: 2014-03-23 17:16:00                  Adobe on Almaden            5     140
    ## 18: 2014-03-23 17:16:00                  Adobe on Almaden            5     668
    ## 19: 2014-03-30 09:27:00                     St James Park           13     175
    ## 20: 2014-03-30 16:04:00                       MLK Library           11     199
    ## 21: 2014-04-02 09:27:00              Paseo de San Antonio            7     154
    ## 22: 2014-04-05 16:10:00            SJSU 4th at San Carlos           12      62
    ## 23: 2014-04-06 20:23:00                       MLK Library           11     158
    ## 24: 2014-04-07 11:31:00 San Jose Diridon Caltrain Station            2     199
    ## 25: 2014-04-10 22:46:00                       MLK Library           11     168
    ## 26: 2014-04-11 11:27:00        SJSU - San Salvador at 9th           16      10
    ## 27: 2014-04-11 15:36:00                       MLK Library           11     112
    ## 28: 2014-04-11 15:36:00                       MLK Library           11     187
    ## 29: 2014-04-11 16:16:00             San Jose Civic Center            3     176
    ## 30: 2014-04-11 16:16:00             San Jose Civic Center            3     112
    ## 31: 2014-04-12 20:55:00                       MLK Library           11     247
    ## 32: 2014-04-23 18:32:00   Santa Clara County Civic Center           80     716
    ## 33: 2014-04-28 09:17:00              Paseo de San Antonio            7     130
    ## 34: 2014-05-04 15:46:00             San Jose Civic Center            3     132
    ## 35: 2014-05-09 14:34:00                San Jose City Hall           10      39
    ## 36: 2014-05-07 20:15:00                       MLK Library           11     164
    ## 37: 2014-05-07 20:15:00                       MLK Library           11     109
    ## 38: 2014-05-08 07:26:00                San Jose City Hall           10     257
    ## 39: 2014-05-10 13:00:00                       MLK Library           11     109
    ## 40: 2014-05-15 20:18:00                  San Pedro Square            6     658
    ## 41: 2014-05-17 01:10:00                       MLK Library           11     691
    ## 42: 2014-05-29 14:37:00                       MLK Library           11     227
    ## 43: 2014-05-29 14:36:00                       MLK Library           11      15
    ## 44: 2014-05-31 12:41:00            SJSU 4th at San Carlos           12     122
    ## 45: 2014-05-31 13:58:00            SJSU 4th at San Carlos           12     227
    ## 46: 2014-06-09 01:36:00                  Adobe on Almaden            5     711
    ## 47: 2014-06-09 14:36:00        SJSU - San Salvador at 9th           16      30
    ## 48: 2014-06-09 14:36:00        SJSU - San Salvador at 9th           16     227
    ## 49: 2014-06-14 16:50:00 San Jose Diridon Caltrain Station            2     150
    ## 50: 2014-06-14 16:50:00 San Jose Diridon Caltrain Station            2     164
    ## 51: 2014-06-15 20:42:00                       MLK Library           11     715
    ## 52: 2014-06-15 20:43:00                       MLK Library           11     646
    ## 53: 2014-06-16 13:16:00                San Jose City Hall           10     709
    ## 54: 2014-06-18 15:30:00                       MLK Library           11      45
    ## 55: 2014-06-19 20:15:00        SJSU - San Salvador at 9th           16     258
    ## 56: 2014-06-19 20:15:00        SJSU - San Salvador at 9th           16     646
    ## 57: 2014-06-19 21:48:00        SJSU - San Salvador at 9th           16     646
    ## 58: 2014-06-24 08:16:00                       MLK Library           11      96
    ## 59: 2014-06-25 19:31:00             San Jose Civic Center            3      62
    ## 60: 2014-06-25 18:28:00             San Jose Civic Center            3     711
    ## 61: 2014-06-30 21:29:00               San Salvador at 1st            8     128
    ## 62: 2014-07-01 17:38:00 San Jose Diridon Caltrain Station            2     188
    ## 63: 2014-07-05 19:58:00                       MLK Library           11      81
    ## 64: 2014-07-19 00:22:00            SJSU 4th at San Carlos           12     699
    ## 65: 2014-08-01 21:25:00 San Jose Diridon Caltrain Station            2      81
    ## 66: 2014-08-03 14:34:00                       MLK Library           11      41
    ## 67: 2014-08-13 16:50:00                San Jose City Hall           10     255
    ## 68: 2014-08-13 16:50:00                San Jose City Hall           10     648
    ## 69: 2014-08-15 13:39:00                       MLK Library           11     186
    ## 70: 2014-08-15 13:39:00                       MLK Library           11     223
    ## 71: 2014-08-15 13:39:00                       MLK Library           11     256
    ## 72: 2014-08-17 00:07:00                       MLK Library           11      23
    ## 73: 2014-08-17 21:11:00              Paseo de San Antonio            7     678
    ## 74: 2014-08-28 11:31:00                       MLK Library           11     128
    ## 75: 2014-08-28 15:06:00                       MLK Library           11      11
    ## 76: 2014-08-28 15:06:00                       MLK Library           11      93
    ## 77: 2014-09-20 01:33:00                       MLK Library           11     294
    ## 78: 2014-09-20 13:43:00              Paseo de San Antonio            7     298
    ## 79: 2014-09-24 17:02:00                       MLK Library           11     305
    ## 80: 2014-09-25 17:29:00                San Jose City Hall           10     197
    ## 81: 2014-09-30 17:28:00                San Jose City Hall           10     161
    ## 82: 2014-10-13 12:07:00                         Japantown            9     205
    ## 83: 2014-10-19 17:40:00                       MLK Library           11      30
    ## 84: 2014-10-20 09:46:00                         Japantown            9     107
    ## 85: 2014-10-22 10:10:00                         Japantown            9     301
    ## 86: 2014-10-24 22:01:00        SJSU - San Salvador at 9th           16     706
    ## 87: 2014-11-07 10:32:00                         Japantown            9      51
    ## 88: 2014-12-08 14:15:00                         Japantown            9     253
    ## 89: 2014-12-31 10:47:00                       MLK Library           11     128
    ## 90: 2014-12-31 10:47:00                       MLK Library           11     667
    ## 91: 2014-12-31 10:47:00                       MLK Library           11     241
    ##                end_date                       end_station end_terminal bike_id
    ##     subscription_type zip_code
    ##  1:        Subscriber    95112
    ##  2:          Customer    95608
    ##  3:          Customer    95166
    ##  4:          Customer    95166
    ##  5:          Customer    95117
    ##  6:          Customer    95117
    ##  7:          Customer    94510
    ##  8:        Subscriber    95126
    ##  9:        Subscriber    95112
    ## 10:          Customer    95112
    ## 11:        Subscriber    95126
    ## 12:          Customer    92646
    ## 13:          Customer    90278
    ## 14:          Customer    95112
    ## 15:          Customer    95122
    ## 16:          Customer    95122
    ## 17:          Customer     <NA>
    ## 18:          Customer    95112
    ## 19:          Customer    60613
    ## 20:          Customer     <NA>
    ## 21:        Subscriber    95126
    ## 22:        Subscriber    95126
    ## 23:          Customer    95112
    ## 24:        Subscriber    95112
    ## 25:          Customer     9539
    ## 26:          Customer    95131
    ## 27:          Customer     <NA>
    ## 28:          Customer     <NA>
    ## 29:          Customer     <NA>
    ## 30:          Customer     <NA>
    ## 31:          Customer    95112
    ## 32:          Customer    95054
    ## 33:        Subscriber    95126
    ## 34:          Customer    95123
    ## 35:          Customer     6473
    ## 36:          Customer     <NA>
    ## 37:          Customer     <NA>
    ## 38:        Subscriber    94041
    ## 39:          Customer    95125
    ## 40:          Customer    94089
    ## 41:          Customer   195127
    ## 42:          Customer    95112
    ## 43:          Customer    95112
    ## 44:          Customer    95476
    ## 45:          Customer    95476
    ## 46:          Customer    80526
    ## 47:          Customer    95116
    ## 48:          Customer    95116
    ## 49:          Customer    95112
    ## 50:          Customer    95112
    ## 51:          Customer    95123
    ## 52:          Customer    95123
    ## 53:        Subscriber    94010
    ## 54:          Customer     3102
    ## 55:          Customer    94704
    ## 56:          Customer    94708
    ## 57:          Customer    94708
    ## 58:          Customer    28801
    ## 59:          Customer     <NA>
    ## 60:          Customer    95113
    ## 61:          Customer    95133
    ## 62:        Subscriber    94002
    ## 63:          Customer     <NA>
    ## 64:          Customer    95037
    ## 65:          Customer    94606
    ## 66:          Customer    95112
    ## 67:          Customer    95110
    ## 68:          Customer    95110
    ## 69:          Customer    95139
    ## 70:          Customer    95139
    ## 71:          Customer    95139
    ## 72:        Subscriber    95112
    ## 73:          Customer     <NA>
    ## 74:        Subscriber    95112
    ## 75:          Customer    90621
    ## 76:          Customer    90621
    ## 77:          Customer    95116
    ## 78:          Customer    92105
    ## 79:          Customer    95112
    ## 80:          Customer    95112
    ## 81:          Customer    95112
    ## 82:        Subscriber    95122
    ## 83:          Customer   889503
    ## 84:        Subscriber    95122
    ## 85:        Subscriber    95122
    ## 86:        Subscriber    95122
    ## 87:        Subscriber    95122
    ## 88:        Subscriber    95122
    ## 89:          Customer    95112
    ## 90:          Customer    95112
    ## 91:          Customer    95076
    ##     subscription_type zip_code

3.  Filter all rows where the column `subscription_type` is not
    `"Subscriber"`.

``` r
# Filter all rows where `subscription_type` is not `"Subscriber"` 
customers <- batrips[subscription_type != "Subscriber"]
customers
```

    ##        trip_id duration          start_date            start_station
    ##     1:  139549     1620 2014-01-01 00:23:00        Steuart at Market
    ##     2:  139550     1617 2014-01-01 00:23:00        Steuart at Market
    ##     3:  139551      779 2014-01-01 00:24:00        Steuart at Market
    ##     4:  139552      784 2014-01-01 00:24:00        Steuart at Market
    ##     5:  139553      721 2014-01-01 00:25:00        Steuart at Market
    ##    ---                                                              
    ## 48572:  588900     1428 2014-12-31 22:06:00    Embarcadero at Bryant
    ## 48573:  588909      992 2014-12-31 23:06:00     Washington at Kearny
    ## 48574:  588908     1004 2014-12-31 23:06:00     Washington at Kearny
    ## 48575:  588912     1487 2014-12-31 23:31:00 South Van Ness at Market
    ## 48576:  588913     1458 2014-12-31 23:32:00 South Van Ness at Market
    ##        start_terminal            end_date            end_station end_terminal
    ##     1:             74 2014-01-01 00:50:00     Powell Street BART           39
    ##     2:             74 2014-01-01 00:50:00     Powell Street BART           39
    ##     3:             74 2014-01-01 00:37:00  Washington at Kearney           46
    ##     4:             74 2014-01-01 00:37:00  Washington at Kearney           46
    ##     5:             74 2014-01-01 00:37:00  Washington at Kearney           46
    ##    ---                                                                       
    ## 48572:             54 2014-12-31 22:30:00  Embarcadero at Folsom           51
    ## 48573:             46 2014-12-31 23:23:00 Embarcadero at Vallejo           48
    ## 48574:             46 2014-12-31 23:23:00 Embarcadero at Vallejo           48
    ## 48575:             66 2014-12-31 23:56:00      Steuart at Market           74
    ## 48576:             66 2014-12-31 23:56:00      Steuart at Market           74
    ##        bike_id subscription_type zip_code
    ##     1:     605          Customer    92007
    ##     2:     453          Customer    92007
    ##     3:     335          Customer    94109
    ##     4:     580          Customer         
    ##     5:     563          Customer    94109
    ##    ---                                   
    ## 48572:     502          Customer    94587
    ## 48573:     485          Customer    92104
    ## 48574:     419          Customer    92104
    ## 48575:     480          Customer    94109
    ## 48576:     277          Customer    94109

4.  Filter all rows where `start_station` is `"Ryland Park"` and
    `subscription_type` is not `"Customer"`.

``` r
# Filter all rows where start_station is "Ryland Park" AND subscription_type is not "Customer"
ryland_park_subscribers <- batrips[start_station == "Ryland Park" & subscription_type != "Customer"]
ryland_park_subscribers
```

    ##      trip_id duration          start_date start_station start_terminal
    ##   1:  243456      330 2014-04-10 09:10:00   Ryland Park             84
    ##   2:  244497      594 2014-04-11 07:28:00   Ryland Park             84
    ##   3:  245067      265 2014-04-11 13:38:00   Ryland Park             84
    ##   4:  246212      522 2014-04-12 17:25:00   Ryland Park             84
    ##   5:  246933      493 2014-04-14 07:30:00   Ryland Park             84
    ##  ---                                                                  
    ## 936:  587254      493 2014-12-29 13:27:00   Ryland Park             84
    ## 937:  587827      619 2014-12-30 08:35:00   Ryland Park             84
    ## 938:  588063      489 2014-12-30 13:29:00   Ryland Park             84
    ## 939:  588442      423 2014-12-31 07:48:00   Ryland Park             84
    ## 940:  588447      536 2014-12-31 07:56:00   Ryland Park             84
    ##                 end_date                       end_station end_terminal bike_id
    ##   1: 2014-04-10 09:16:00                         Japantown            9      23
    ##   2: 2014-04-11 07:38:00 San Jose Diridon Caltrain Station            2      54
    ##   3: 2014-04-11 13:43:00                  San Pedro Square            6      62
    ##   4: 2014-04-12 17:34:00               San Salvador at 1st            8     144
    ##   5: 2014-04-14 07:38:00 San Jose Diridon Caltrain Station            2     643
    ##  ---                                                                           
    ## 936: 2014-12-29 13:36:00   Santa Clara County Civic Center           80     126
    ## 937: 2014-12-30 08:45:00   Santa Clara County Civic Center           80     126
    ## 938: 2014-12-30 13:37:00   Santa Clara County Civic Center           80     126
    ## 939: 2014-12-31 07:55:00             San Jose Civic Center            3     710
    ## 940: 2014-12-31 08:05:00   Santa Clara County Civic Center           80      75
    ##      subscription_type zip_code
    ##   1:        Subscriber    95110
    ##   2:        Subscriber    95110
    ##   3:        Subscriber    95110
    ##   4:        Subscriber    95110
    ##   5:        Subscriber    95110
    ##  ---                           
    ## 936:        Subscriber    95112
    ## 937:        Subscriber    95112
    ## 938:        Subscriber    95112
    ## 939:        Subscriber     5112
    ## 940:        Subscriber    95112

You are phenomenal! Filtering rows using boolean expressions is
extremely common and you aced it.

## Helpers for filtering

Theory. Coming soon …

**1. Helpers for filtering**

In this lesson, we will look at three functions that make subsetting
operations far more convenient in data tables.

**2. %like%**

A commonly occurring subsetting operation is to look for all rows that
match a pattern in a column. data table provides a convenience function
percent like percent that is concise and also makes the actual operation
easier to understand. In this example, we are looking for all the rows
where start_station starts with the string San Francisco. The
meta-character caret (^) specifies that you are looking for a pattern at
the beginning of a string.

**3. %between%**

Percent between percent is a helper function that works on numeric
columns. It searches for all values in the closed interval val1 and
val2, that is, it finds all values that are greater than or equal to
val1 and less than or equal to val2. It is also internally optimized to
run in parallel wherever possible. Here we subset all rows where
duration is between 2000 and 3000.

**4. %chin%**

Percent chin percent is another helper function which is a much more
efficient version of percent in percent but only for character vectors.
You can use it to look for specific strings in a vector. For example,
here we subset all rows where start_station is either “Japantown”,
“Mezes Park”, or “MLK Library”.

**5. Let’s practice!**

Go ahead and practice using these helper functions.

## I %like% data.tables

`%like%` is a very useful function to filter rows from `data.table`s
that match a pattern, as opposed to *exact* matches as seen in the
previous exercise. It can be used independently on a vector as well, for
example:

``` r
x <- c("aaba", "aaba", "baca")

# Search for "aa" anywhere in the string
x %like% "aa"
[1]  TRUE  TRUE FALSE

# Search for "ba" at the end of a string
x %like% "ba$"
[1]  TRUE  TRUE FALSE
```

The metacharacter `$` indicates that you are searching for the string
that ends with a specific pattern.

**Steps**

1.  Use `%like%` to filter all rows where `end_station` contains the
    text `"Market"`.

``` r
# Filter all rows where end_station contains "Market"
any_markets <- batrips[end_station %like% "Market"]
any_markets
```

    ##        trip_id duration          start_date
    ##     1:  139547     1523 2014-01-01 00:17:00
    ##     2:  139558     1600 2014-01-01 00:28:00
    ##     3:  139559     3691 2014-01-01 00:32:00
    ##     4:  139560     3793 2014-01-01 00:32:00
    ##     5:  139561     3788 2014-01-01 00:32:00
    ##    ---                                     
    ## 69120:  588882     1714 2014-12-31 19:14:00
    ## 69121:  588888      726 2014-12-31 20:05:00
    ## 69122:  588901      531 2014-12-31 22:08:00
    ## 69123:  588912     1487 2014-12-31 23:31:00
    ## 69124:  588913     1458 2014-12-31 23:32:00
    ##                               start_station start_terminal            end_date
    ##     1:               Embarcadero at Sansome             60 2014-01-01 00:42:00
    ##     2: Harry Bridges Plaza (Ferry Building)             50 2014-01-01 00:54:00
    ##     3:                    Steuart at Market             74 2014-01-01 01:33:00
    ##     4:                    Steuart at Market             74 2014-01-01 01:35:00
    ##     5:                    Steuart at Market             74 2014-01-01 01:35:00
    ##    ---                                                                        
    ## 69120:               Embarcadero at Sansome             60 2014-12-31 19:43:00
    ## 69121:                   Powell Street BART             39 2014-12-31 20:17:00
    ## 69122:               Embarcadero at Sansome             60 2014-12-31 22:17:00
    ## 69123:             South Van Ness at Market             66 2014-12-31 23:56:00
    ## 69124:             South Van Ness at Market             66 2014-12-31 23:56:00
    ##                              end_station end_terminal bike_id subscription_type
    ##     1:                   Beale at Market           56     331        Subscriber
    ##     2:                 Steuart at Market           74     413        Subscriber
    ##     3:                 Steuart at Market           74     619          Customer
    ##     4:                 Steuart at Market           74     311          Customer
    ##     5:                 Steuart at Market           74     577          Customer
    ##    ---                                                                         
    ## 69120:                     Market at 4th           76     328          Customer
    ## 69121: Civic Center BART (7th at Market)           72     475        Subscriber
    ## 69122:                 Steuart at Market           74     360        Subscriber
    ## 69123:                 Steuart at Market           74     480          Customer
    ## 69124:                 Steuart at Market           74     277          Customer
    ##        zip_code
    ##     1:    94112
    ##     2:    94102
    ##     3:    94070
    ##     4:    55417
    ##     5:    55417
    ##    ---         
    ## 69120:     <NA>
    ## 69121:    94112
    ## 69122:    94107
    ## 69123:    94109
    ## 69124:    94109

2.  Use `%like%` to filter all rows where `end_station` *ends* the text
    `"Market"`.

``` r
# Filter all rows where end_station ends with "Market"
end_markets <- batrips[end_station %like% "Market$"]
end_markets
```

    ##        trip_id duration          start_date
    ##     1:  139547     1523 2014-01-01 00:17:00
    ##     2:  139558     1600 2014-01-01 00:28:00
    ##     3:  139559     3691 2014-01-01 00:32:00
    ##     4:  139560     3793 2014-01-01 00:32:00
    ##     5:  139561     3788 2014-01-01 00:32:00
    ##    ---                                     
    ## 23352:  588841      308 2014-12-31 17:27:00
    ## 23353:  588855      229 2014-12-31 17:51:00
    ## 23354:  588901      531 2014-12-31 22:08:00
    ## 23355:  588912     1487 2014-12-31 23:31:00
    ## 23356:  588913     1458 2014-12-31 23:32:00
    ##                               start_station start_terminal            end_date
    ##     1:               Embarcadero at Sansome             60 2014-01-01 00:42:00
    ##     2: Harry Bridges Plaza (Ferry Building)             50 2014-01-01 00:54:00
    ##     3:                    Steuart at Market             74 2014-01-01 01:33:00
    ##     4:                    Steuart at Market             74 2014-01-01 01:35:00
    ##     5:                    Steuart at Market             74 2014-01-01 01:35:00
    ##    ---                                                                        
    ## 23352:               Embarcadero at Sansome             60 2014-12-31 17:32:00
    ## 23353:            Broadway St at Battery St             82 2014-12-31 17:55:00
    ## 23354:               Embarcadero at Sansome             60 2014-12-31 22:17:00
    ## 23355:             South Van Ness at Market             66 2014-12-31 23:56:00
    ## 23356:             South Van Ness at Market             66 2014-12-31 23:56:00
    ##              end_station end_terminal bike_id subscription_type zip_code
    ##     1:   Beale at Market           56     331        Subscriber    94112
    ##     2: Steuart at Market           74     413        Subscriber    94102
    ##     3: Steuart at Market           74     619          Customer    94070
    ##     4: Steuart at Market           74     311          Customer    55417
    ##     5: Steuart at Market           74     577          Customer    55417
    ##    ---                                                                  
    ## 23352: Steuart at Market           74     395        Subscriber    94102
    ## 23353:   Beale at Market           56      86        Subscriber    94131
    ## 23354: Steuart at Market           74     360        Subscriber    94107
    ## 23355: Steuart at Market           74     480          Customer    94109
    ## 23356: Steuart at Market           74     277          Customer    94109

Excellent! By the way, there are many more things to %like% about data
tables.

## Filtering with %in%

`%in%` allows selecting rows that exactly matches one or more values,
for example:

``` r
c("a", "b", "c", "d") %in% c("d", "a")
[1]  TRUE FALSE FALSE  TRUE
```

**Steps**

1.  Filter all rows where `trip_id` is equal to 588841, 139560, or
    139562.

``` r
# Filter all rows where trip_id is 588841, 139560, or 139562
filter_trip_ids <- batrips[trip_id %in% c(588841, 139560, 139562)]
filter_trip_ids
```

    ##    trip_id duration          start_date          start_station start_terminal
    ## 1:  139560     3793 2014-01-01 00:32:00      Steuart at Market             74
    ## 2:  139562     3626 2014-01-01 00:33:00      Steuart at Market             74
    ## 3:  588841      308 2014-12-31 17:27:00 Embarcadero at Sansome             60
    ##               end_date       end_station end_terminal bike_id subscription_type
    ## 1: 2014-01-01 01:35:00 Steuart at Market           74     311          Customer
    ## 2: 2014-01-01 01:33:00 Steuart at Market           74     271          Customer
    ## 3: 2014-12-31 17:32:00 Steuart at Market           74     395        Subscriber
    ##    zip_code
    ## 1:    55417
    ## 2:    94070
    ## 3:    94102

You are tremendous! Although you can `%in%` it to filter character
columns as well, `data.table` provides a much faster version of `%in%`
for characters which you will see in the next exercise.

## Filtering with %between% and %chin%

Two other functions that can come in handy when filtering rows are
`%between%` and `%chin%`.

-   `%between%` works only on numeric columns and can be used to filter
    values in the closed interval \[val1, val2\].
-   `%chin%` works only on character columns and is an efficient version
    of `%in%`. You can use it to look for specific strings in a vector.

**Steps**

1.  Use `%between%` to filter all rows where `duration` is between
    \[5000, 6000\].

``` r
# Filter all rows where duration is between [5000, 6000]
duration_5k_6k <- batrips[duration %between% c(5000, 6000)]
duration_5k_6k
```

    ##       trip_id duration          start_date                   start_station
    ##    1:  139607     5987 2014-01-01 07:57:00               Market at Sansome
    ##    2:  139608     5974 2014-01-01 07:57:00               Market at Sansome
    ##    3:  139663     5114 2014-01-01 11:29:00           Embarcadero at Bryant
    ##    4:  139664     5040 2014-01-01 11:30:00           Embarcadero at Bryant
    ##    5:  139887     5023 2014-01-01 16:08:00                Davis at Jackson
    ##   ---                                                                     
    ## 1042:  586297     5425 2014-12-27 14:02:00        South Van Ness at Market
    ## 1043:  586673     5849 2014-12-28 14:50:00          University and Emerson
    ## 1044:  586707     5162 2014-12-28 15:50:00     San Antonio Shopping Center
    ## 1045:  586795     5886 2014-12-28 20:05:00   Powell at Post (Union Square)
    ## 1046:  588370     5850 2014-12-31 02:46:00 Grant Avenue at Columbus Avenue
    ##       start_terminal            end_date                     end_station
    ##    1:             77 2014-01-01 09:37:00 Grant Avenue at Columbus Avenue
    ##    2:             77 2014-01-01 09:37:00 Grant Avenue at Columbus Avenue
    ##    3:             54 2014-01-01 12:55:00           Embarcadero at Bryant
    ##    4:             54 2014-01-01 12:54:00           Embarcadero at Bryant
    ##    5:             42 2014-01-01 17:31:00 Grant Avenue at Columbus Avenue
    ##   ---                                                                   
    ## 1042:             66 2014-12-27 15:32:00        South Van Ness at Market
    ## 1043:             35 2014-12-28 16:27:00          University and Emerson
    ## 1044:             31 2014-12-28 17:16:00    San Antonio Caltrain Station
    ## 1045:             71 2014-12-28 21:43:00   Powell at Post (Union Square)
    ## 1046:             73 2014-12-31 04:23:00   Powell at Post (Union Square)
    ##       end_terminal bike_id subscription_type zip_code
    ##    1:           73     591          Customer    75201
    ##    2:           73     596          Customer    75201
    ##    3:           54     604          Customer    94513
    ##    4:           54     281          Customer    94513
    ##    5:           73     329          Customer    89117
    ##   ---                                                
    ## 1042:           66     314          Customer    94306
    ## 1043:           35     254          Customer        1
    ## 1044:           29     680          Customer    95616
    ## 1045:           71     394          Customer    60616
    ## 1046:           71     401          Customer     <NA>

2.  Use `%chin%` to filter all rows where `start_station` is either
    `"San Francisco City Hall"` or `"Embarcadero at Sansome"`.

``` r
# Filter all rows with specific start stations
two_stations <- batrips[start_station %chin% c("San Francisco City Hall", "Embarcadero at Sansome")]
two_stations
```

    ##        trip_id duration          start_date           start_station
    ##     1:  139545      435 2014-01-01 00:14:00 San Francisco City Hall
    ##     2:  139546      432 2014-01-01 00:14:00 San Francisco City Hall
    ##     3:  139547     1523 2014-01-01 00:17:00  Embarcadero at Sansome
    ##     4:  139583      903 2014-01-01 01:34:00  Embarcadero at Sansome
    ##     5:  139584      873 2014-01-01 01:35:00  Embarcadero at Sansome
    ##    ---                                                             
    ## 15020:  588881     1800 2014-12-31 19:12:00  Embarcadero at Sansome
    ## 15021:  588882     1714 2014-12-31 19:14:00  Embarcadero at Sansome
    ## 15022:  588887      274 2014-12-31 20:02:00  Embarcadero at Sansome
    ## 15023:  588898      979 2014-12-31 22:06:00 San Francisco City Hall
    ## 15024:  588901      531 2014-12-31 22:08:00  Embarcadero at Sansome
    ##        start_terminal            end_date
    ##     1:             58 2014-01-01 00:21:00
    ##     2:             58 2014-01-01 00:21:00
    ##     3:             60 2014-01-01 00:42:00
    ##     4:             60 2014-01-01 01:49:00
    ##     5:             60 2014-01-01 01:49:00
    ##    ---                                   
    ## 15020:             60 2014-12-31 19:42:00
    ## 15021:             60 2014-12-31 19:43:00
    ## 15022:             60 2014-12-31 20:07:00
    ## 15023:             58 2014-12-31 22:22:00
    ## 15024:             60 2014-12-31 22:17:00
    ##                                     end_station end_terminal bike_id
    ##     1:                          Townsend at 7th           65     473
    ##     2:                          Townsend at 7th           65     395
    ##     3:                          Beale at Market           56     331
    ##     4: San Francisco Caltrain (Townsend at 4th)           70     278
    ##     5: San Francisco Caltrain (Townsend at 4th)           70     336
    ##    ---                                                              
    ## 15020:                            Market at 4th           76     313
    ## 15021:                            Market at 4th           76     328
    ## 15022:     Harry Bridges Plaza (Ferry Building)           50     358
    ## 15023:                          Clay at Battery           41     385
    ## 15024:                        Steuart at Market           74     360
    ##        subscription_type zip_code
    ##     1:        Subscriber    94612
    ##     2:        Subscriber    94107
    ##     3:        Subscriber    94112
    ##     4:          Customer     9406
    ##     5:          Customer     9406
    ##    ---                           
    ## 15020:          Customer     <NA>
    ## 15021:          Customer     <NA>
    ## 15022:        Subscriber    94111
    ## 15023:        Subscriber    94111
    ## 15024:        Subscriber    94107

This marks the end of chapter 1! Now that you know how to filter rows,
in the next chapter, you will see how to select and compute on columns
in `data.table`s.

# 2. Selecting and Computing on Columns

Just as the <i>i</i> argument lets you filter rows, the <i>j</i>
argument of data.table lets you select columns and also perform
computations. The syntax is far more convenient and flexible when
compared to data.frames.

## Selecting columns from a data.table

Theory. Coming soon …

**1. Selecting columns from a data.table**

**2. General form of data.table syntax (Recap)**

Here’s the general form of the data table syntax, shown again for
convenience. It is read out loud as “Take DT, filter rows in”i”, then
compute “j” grouped by “by”. In this chapter, you will work with the “j”
argument which is used for selecting and computing on columns.data table
provides several convenient ways for both selecting and directly
computing on columns which makes it easier to write and perform complex
calculations with much cleaner code. Additionally, you can also use the
data frame syntax for selecting columns from a data table.

**3. Using column names to select columns**

Similar to data frames, you can pass a character vector of column names
as the second argument to data table to select the relevant columns.

**4. Using column names to select columns**

One thing to note here is the difference in result when selecting a
single column from a data frame vs a data table. When you select a
single column from a data frame, the result is no longer a data frame,
but a vector. Whereas when you select a single column from a data table,
the result is still a data table. This consistency in the output avoids
accidental errors in code.

**5. Using column numbers to select columns**

You can also select columns using column numbers. Here we select the
second and fourth columns in batrips. However, we do not recommend this
approach except when having a quick look at the data interactively.
Using column numbers is considered bad practice. A typical project
consists of one or more packages with lots of R code that is constantly
updated and/or improved, and also typically by multiple contributors. An
inadvertent change to the original column structure can lead to
incorrect results and bugs.Hence, you should always use column names
wherever possible.

**6. Deselecting columns with character vectors**

You can use a negative sign prefix with a character vector to exclude a
set of columns from your result. You can also use the not-operator to
obtain the same result.

**7. Selecting columns the data.table way**

So far you have selected columns using the data frame way. One
limitation of this approach is that it only allows you to select
columns. However, in order to compute on columns and perform advanced
data manipulations, you will have to tweak the “j” argument using the
data table approach. Recall how you could filter rows in “i” by
referring to columns directly as if they are variables? You can do the
same in “j”. Since we usually need to select more than one column, “j”
accepts a list of columns. For example, you can select “trip_id” and
“duration” columns as shown here. Notice that there are no quotes around
column names. Also note that since “j” accepts a list, we can also
rename columns while selecting, e.g., “duration” column is renamed to
“dur”.

**8. Selecting columns the data.table way**

If you want to select only one column, you can choose to return the
result as a 1-column data table or a vector. Wrapping the column name
within “list()” always returns a data table. If you provide just a
single column name in “j”, it will return a vector.

**9. Selecting columns the data.table way**

Since we like to write concise, convenient and clear code in data table,
we created dot parentheses as an alias for “list()”. They both behave in
exactly the same way, but the dot parentheses results in less typing and
helps you focus on the actual columns being selected.

**10. Let’s practice!**

Time for you to select columns from a data table!

## Selecting a single column

> ## *Question*
>
> Which of the following options *does not return* a `data.table`?
> (*Note: `batrips` is a `data.table`.*)<br> <br> ⬜
> `batrips[, "duration"]`<br> ⬜ `batrips[, .(duration)]`<br> ⬜
> `batrips[, list(duration)]`<br> ✅ `batrips[, duration]`<br>

Well done! If you don’t wrap the column name either in quotes or inside
`list()`, the result is a vector.

## Selecting columns by name

`DT[, c("col1", "col2")]` returns a `data.table` with two columns, just
like a `data.frame`.

Alternatively, you can also select columns by passing a `list` with each
element referring to the column name as if it were a variable, i.e.,
`DT[, .(col1, col2)]`. Note the absence of quotes, i.e., `""` around
column names here.

**Steps**

1.  Use a character vector to select the `bike_id` and `trip_id` columns
    (in that order) from `batrips`.

``` r
# Select bike_id and trip_id using a character vector
df_way <- batrips[, c("bike_id", "trip_id")]
df_way
```

    ##         bike_id trip_id
    ##      1:     473  139545
    ##      2:     395  139546
    ##      3:     331  139547
    ##      4:     605  139549
    ##      5:     453  139550
    ##     ---                
    ## 326335:     573  588910
    ## 326336:     604  588911
    ## 326337:     480  588912
    ## 326338:     277  588913
    ## 326339:      56  588914

2.  *Without* using a character vector, select the `start_station` and
    `end_station` columns (in that order) from `batrips`.

``` r
# Select start_station and end_station cols without a character vector
dt_way <- batrips[, .(start_station, end_station)]
dt_way
```

    ##                           start_station
    ##      1:         San Francisco City Hall
    ##      2:         San Francisco City Hall
    ##      3:          Embarcadero at Sansome
    ##      4:               Steuart at Market
    ##      5:               Steuart at Market
    ##     ---                                
    ## 326335:              Powell Street BART
    ## 326336: Grant Avenue at Columbus Avenue
    ## 326337:        South Van Ness at Market
    ## 326338:        South Van Ness at Market
    ## 326339:           Embarcadero at Bryant
    ##                                           end_station
    ##      1:                               Townsend at 7th
    ##      2:                               Townsend at 7th
    ##      3:                               Beale at Market
    ##      4:                            Powell Street BART
    ##      5:                            Powell Street BART
    ##     ---                                              
    ## 326335:      San Francisco Caltrain (Townsend at 4th)
    ## 326336: Yerba Buena Center of the Arts (3rd @ Howard)
    ## 326337:                             Steuart at Market
    ## 326338:                             Steuart at Market
    ## 326339:                                 Howard at 2nd

Nice. As you saw, selecting columns from a `data.table` is *easy*!

## Deselecting specific columns

You can also drop or deselect columns by prepending the character vector
of column names with the `-` or `!` operators. For e.g.,
`dt[, -c("col1", "col2")]` or `dt[, !c("col1", "col2")]` would both
return all columns *except* `col1` and `col2`.

**Steps**

1.  Deselect the columns `start_terminal` and `end_terminal` from
    `batrips`.

``` r
# Deselect start_terminal and end_terminal columns
drop_terminal_cols <- batrips[, !c("start_terminal", "end_terminal")]
drop_terminal_cols
```

    ##         trip_id duration          start_date                   start_station
    ##      1:  139545      435 2014-01-01 00:14:00         San Francisco City Hall
    ##      2:  139546      432 2014-01-01 00:14:00         San Francisco City Hall
    ##      3:  139547     1523 2014-01-01 00:17:00          Embarcadero at Sansome
    ##      4:  139549     1620 2014-01-01 00:23:00               Steuart at Market
    ##      5:  139550     1617 2014-01-01 00:23:00               Steuart at Market
    ##     ---                                                                     
    ## 326335:  588910      437 2014-12-31 23:18:00              Powell Street BART
    ## 326336:  588911      422 2014-12-31 23:19:00 Grant Avenue at Columbus Avenue
    ## 326337:  588912     1487 2014-12-31 23:31:00        South Van Ness at Market
    ## 326338:  588913     1458 2014-12-31 23:32:00        South Van Ness at Market
    ## 326339:  588914      364 2014-12-31 23:33:00           Embarcadero at Bryant
    ##                    end_date                                   end_station
    ##      1: 2014-01-01 00:21:00                               Townsend at 7th
    ##      2: 2014-01-01 00:21:00                               Townsend at 7th
    ##      3: 2014-01-01 00:42:00                               Beale at Market
    ##      4: 2014-01-01 00:50:00                            Powell Street BART
    ##      5: 2014-01-01 00:50:00                            Powell Street BART
    ##     ---                                                                  
    ## 326335: 2014-12-31 23:25:00      San Francisco Caltrain (Townsend at 4th)
    ## 326336: 2014-12-31 23:26:00 Yerba Buena Center of the Arts (3rd @ Howard)
    ## 326337: 2014-12-31 23:56:00                             Steuart at Market
    ## 326338: 2014-12-31 23:56:00                             Steuart at Market
    ## 326339: 2014-12-31 23:40:00                                 Howard at 2nd
    ##         bike_id subscription_type zip_code
    ##      1:     473        Subscriber    94612
    ##      2:     395        Subscriber    94107
    ##      3:     331        Subscriber    94112
    ##      4:     605          Customer    92007
    ##      5:     453          Customer    92007
    ##     ---                                   
    ## 326335:     573        Subscriber    95050
    ## 326336:     604        Subscriber    94133
    ## 326337:     480          Customer    94109
    ## 326338:     277          Customer    94109
    ## 326339:      56        Subscriber    94105

You are an expert in selecting and dropping columns! Now it’s time to
perform computations in `j`.

## Computing on columns the data.table way

Theory. Coming soon …

**1. Computing on columns the data.table way**

In this lesson, we will see the advantages of being able to use column
names as variables in “j”, which makes data analysis operations
intuitive and succinct.

**2. Computing on columns**

The reason “j” is extended to allow column names to be seen as variables
is so that we can perform computations on columns directly in “j”.For
example, if you want to compute the mean of “duration” column, all you
need to do is to write “mean(duration)” in “j”. mean() returns a single
value. If you recall from the last lesson, since “j” is not wrapped
inside “list()”, the result is a vector.Now compare this to how you
would do this in the data frame way. You will first select the column
and then pass the result to the mean() function as an argument. The data
table way of computing directly on columns allows for clear, convenient
and concise code and can be easily extended to calculate statistics on
multiple columns, which you will see in the next video.

**3. Computing on rows and columns**

You filtered rows using the “i” argument in the last chapter. Let’s say
you would like to compute the mean duration for those trips where start
station is “Japantown”. You can now do this combining the “i” and “j”
arguments as shown here. First, you filter rows where start_station
equals “Japantown” in “i” and then compute the mean duration in “j”.This
is possible because “j” is computed on the rows returned by the
filtering operation.

**4. Special symbol .N in j**

Remember the special symbol dot N you used in the “i” argument that
holds the number of rows in a data table in the last chapter? You can
use it in “j” too. Suppose you want to calculate the number of trips
that started from Japantown. You can do this by filtering rows where
start_station == “Japantown” and then specifying dot N in the “j”
argument. Since “j” is calculated on the result of “i”, you get the
total number of rows in the filtered data table. In other words, it
returns the total trips that were made from Japantown. To get an idea of
how convenient and efficient the data table way is, let’s compare this
to the data frame equivalent. This code shows the most common way of
performing the same operation. In this approach, you first return all
the columns for the filtered data only to compute the total number of
rows. Imagine if your original data was 50GB! The filtering operation
alone would take incredible amount of memory and be very slow.In the
data table version, no column is actually selected. The expression in
“i” helps identify the rows to be extracted. Looking at “j” it is clear
that no columns are required but only the total number of rows filtered
and therefore it is very efficient both in terms of memory and run time.

**5. Let’s practice!**

Go ahead and practice computing in “j”!

## Computing in j (I)

Since columns can be treated as variables inside `data.table`’s square
brackets (`[ ]`), you can compute on the columns directly in `j`.

**Steps**

1.  Using the `j` argument, find the median `duration` (the result
    should be a vector of length 1).

``` r
# Calculate median duration using the j argument
median_duration <- batrips[, median(duration)]
median_duration
```

    ## [1] 511

2.  Now, find the median `duration` where `end_station` is
    `"Market at 10th"` for all subscribers.

``` r
# Get median duration after filtering
median_duration_filter <- batrips[end_station == "Market at 10th" & subscription_type == "Subscriber", median(duration)]
median_duration_filter
```

    ## [1] 651

You are fabulous! Remember that `data.table` first filters the rows in
`i` and then computes in `j`.

## Computing in j (II)

In the last exercise, you performed computations in `j` which returned
only a single value, a vector of length one. However, you often perform
computations which return more than one value. The good news is that the
syntax for these calculations is still the same!

You will use the
<a href="https://www.rdocumentation.org/packages/base/topics/difftime">`difftime()`</a>
function in this exercise to calculate the difference in minutes between
the trips. `difftime()` needs two required arguments, `time1` and
`time2` to calculate the difference (`time1 - time2`). To calculate the
difference in minutes, set the `units` argument to `"min"`:

``` r
date1 <- "2018-12-20 11:30:00 EST"
date2 <- "2018-12-20 11:20:00 EST"
difftime(date1, date2, units = "min")

Time difference of 10 mins
```

**Steps**

1.  Calculate the difference in minutes between `end_date` and
    `start_date`.

``` r
# Compute duration of all trips
trip_duration <- batrips[, difftime(end_date, start_date, units = "min")]
head(trip_duration)
```

    ## Time differences in mins
    ## [1]  7  7 25 27 27 13

Isn’t this amazing? You can perform any computations you want inside
`data.table`’s square brackets.

## Advanced computations in j

Theory. Coming soon …

**1. Advanced computations in j**

In this lesson, you will see how you can perform multiple computations
in “j”.

**2. Compute in j and return a data.table**

Remember you can select and rename multiple columns using dot
parentheses? You can use this approach to perform computations too. As
an example, here we compute the mean and median of duration column. You
can perform any computation you would like on any number of columns
using this approach within the dot parentheses.

**3. Question**

If you are curious, try and figure out how you would perform this
computation using the data frame way. How do you find that approach? Is
your code straightforward and clear?

**4. Combining with i**

Even when you have multiple computations or selections, you can combine
it with “i” the same way as before. data table will restrict the
computation or selection to only those rows filtered in “i”. Remember,
“j” operates on the rows after “i” is processed.In order to compute the
mean and median of trips that start from “Japantown”, you can simply
provide the expression to filter those rows in “i” and then compute the
mean and median of duration in “j”, as shown here.

**5. Question**

Once again, think about how you’d go about accomplishing this task with
a data frame!Being able to manipulate on the rows and columns within the
square brackets, makes the code much more clearer, straightforward and
efficient. It also results in much less typing.

**6. Let’s practice!**

It’s your turn to practice multiple computations the data table way.

## Computing in j (III)

In the previous exercise, you were able to pass expressions in `j` that
returned a vector. Recall that if you want to return a `data.table`
instead, wrap the expression with `list()` (or it’s alias, `.()`). This
lets you:

-   Rename the column result
-   Compute more than one expression on a column
-   Compute on more than one column

**Steps**

1.  Calculate the average `duration` as a one-column `data.table` with
    the column name `mean_durn`.

``` r
# Calculate the average duration as mean_durn
mean_duration <- batrips[, .(mean_durn = mean(duration))]
mean_duration
```

    ##    mean_durn
    ## 1:  1131.967

2.  Calculate the minimum and maximum `duration` (don’t rename the
    columns).

``` r
# Get the min and max duration values
min_max_duration <- batrips[, .(min(duration), max(duration))]
min_max_duration
```

    ##    V1       V2
    ## 1: 60 17270400

3.  Find the average duration and the date of the last ride (using the
    `end_date` column). Name these columns `mean_duration` and
    `last_ride`, respectively.

``` r
# Calculate the average duration and the date of the last ride
other_stats <- batrips[, .(mean_duration = mean(duration), 
                           last_ride = max(end_date))]
other_stats
```

    ##    mean_duration           last_ride
    ## 1:      1131.967 2015-06-24 20:18:00

You now know that calculating multiple stats is as easy as calculating
one!

## Combining i and j

As you saw in an earlier exercise when you combine `i` and `j`,
`data.table` first filters the rows in `i` and then applies the
computation in `j`. This applies when calculating multiple stats as
well.

Additionally, you can also specify `plot()`, `hist()` or any other
plotting functions in the `j` argument.

**Steps**

1.  Calculate the minimum and maximum `duration` for all trips where the
    `start_station` is `"Townsend at 7th"` and the `duration` is less
    than 500. Rename these columns to `min_dur` and `max_dur`,
    respectively.

``` r
duration_stats <- batrips[start_station == "Townsend at 7th" & duration < 500, 
                          .(min_dur = min(duration), 
                            max_dur = max(duration))]
duration_stats
```

    ##    min_dur max_dur
    ## 1:      62     499

2.  Now for the same subset of data, plot a histogram of `duration`.

``` r
# Plot the histogram of duration based on conditions
batrips[start_station == "Townsend at 7th" & duration < 500, hist(duration)]
```

![](readme_files/figure-gfm/unnamed-chunk-35-1.png)<!-- -->

    ## $breaks
    ##  [1]  50 100 150 200 250 300 350 400 450 500
    ## 
    ## $counts
    ## [1]   28   15  792 2042  920  314  314  497  538
    ## 
    ## $density
    ## [1] 1.025641e-04 5.494505e-05 2.901099e-03 7.479853e-03 3.369963e-03
    ## [6] 1.150183e-03 1.150183e-03 1.820513e-03 1.970696e-03
    ## 
    ## $mids
    ## [1]  75 125 175 225 275 325 375 425 475
    ## 
    ## $xname
    ## [1] "duration"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

You are doing great! You can filter rows, select columns, and perform
computations with columns. What’s next? Computations *by groups*!

# 3. Groupwise Operations

This chapter introduces data.table’s <i>by</i> argument that lets you
perform computations <i>by groups</i>. By the end of this chapter, you
will master the concise <b>DT\[i, j, by\]</b> syntax of data.table.

## Computations by groups

Theory. Coming soon …

**1. Computations by groups**

In this lesson, you will put together all the things you have seen so
far to perform computations by group. You will now fully realize the
potential of data table’s \[i, j, by\] syntax.

**2. The by argument**

Most data wrangling tasks require doing the same computation on several
groups of data. For example, how would you calculate the total number of
trips for each start_station? This can be done using the “by” argument
data table provides. Specifying by equals start_station groups the data
by that column. The expression in “j”, here dot-N, is computed for each
group. Dot-N is the special symbol that contains the total number of
rows, if you recall. When performing a grouping operation, it contains
the number of rows for each group.Note the columns in the resulting data
table. Firstly, the column corresponding to the total rows computed
using the special symbol dot-N is automatically named capital “N”, for
convenience. Additionally, the column used in “by” is retained in the
result. Also note that the column by which you group your data is always
returned as the first column.

**3. The by argument**

In the previous example, we provided a character vector to the “by”
argument, but it also accepts a list of variables/expressions as shown
here.Once again, dot parenthesis and list parenthesis are both
identical. Dot parenthesis is used here for convenience.By equals
start_station from the previous slide and by equals dot parenthesis
start_station are just different ways to obtain the same result.

**4. The by argument**

However, just as we saw in the earlier chapter, dot parenthesis has its
advantages. It allows for naming the columns in the resulting data table
on the fly. As shown in here, by equals dot parenthesis start equals
start_station results in the grouping column being renamed to “start”.
Similarly, dot parenthesis no_trips equals dot N results in the column
being named as “no_trips”. If no name was provided, it would have been
automatically renamed to “N” as shown in the last example.

**5. Expressions in by**

You should be quite familiar now that dot parenthesis notation, in
addition to naming the columns on the fly, also allows for computations
to be performed on the columns on the fly.Suppose you’d like to get the
total trips from each start_station, but additionally, for every month,
how would you go about it? The month column does not exist in batrips.
However, it can be extracted from the start_date column using the
month() function available in the data table package. Since dot
parenthesis allows for expressions to be provided directly within, by
equals dot parenthesis start_station comma mon equals month(start_date)
groups by the required columns. In addition, we also renamed the column
in the result to “mon”.Since there was no name provided to “j”
expression, it is automatically named “N”. With a single line of code,
we’ve computed the total trips for each start station for each month.If
you’re curious, think about how you would get the total trips for every
start station, but only for the month of March.

**6. Let’s practice!**

Now it’s time for you to use the “by” argument.

## Computing stats by groups (I)

So far you have worked with the two dimensions, rows and columns of a
`data.table`. It’s now time to consider the *virtual* third dimension by
dividing rows into groups to calculate statistics.

**Steps**

1.  Compute the mean duration for every `start_station`, calling the
    aggregated column `mean_duration`.

``` r
# Compute the mean duration for every start_station
mean_start_stn <- batrips[, .(mean_duration = mean(duration)), by = start_station]
mean_start_stn
```

    ##                                     start_station mean_duration
    ##  1:                       San Francisco City Hall     1893.9361
    ##  2:                        Embarcadero at Sansome     1418.1822
    ##  3:                             Steuart at Market      956.9007
    ##  4:                                 5th at Howard      845.0584
    ##  5:          Harry Bridges Plaza (Ferry Building)     1516.3534
    ##  6:                               Beale at Market      856.6453
    ##  7:                         Embarcadero at Folsom      853.6766
    ##  8:                             2nd at South Park      697.7034
    ##  9:                        Santa Clara at Almaden      954.2218
    ## 10:                            Powell Street BART     1332.3455
    ## 11:                                 Howard at 2nd      739.9716
    ## 12:                               2nd at Townsend      840.9178
    ## 13:                      South Van Ness at Market     3800.7443
    ## 14:                                 2nd at Folsom      551.0807
    ## 15:                                 Market at 4th     1272.1251
    ## 16:                                Market at 10th     1073.2136
    ## 17:                             Market at Sansome      828.6980
    ## 18:                         Embarcadero at Bryant      992.9516
    ## 19: Temporary Transbay Terminal (Howard at Beale)      655.8563
    ## 20:             Civic Center BART (7th at Market)     1287.9282
    ## 21:       San Francisco Caltrain 2 (330 Townsend)      701.5882
    ## 22:               Grant Avenue at Columbus Avenue     1244.8732
    ## 23:                          Paseo de San Antonio     1813.1946
    ## 24:                         San Jose Civic Center     3553.7180
    ## 25:                        University and Emerson     5434.5844
    ## 26:                               Townsend at 7th      700.8317
    ## 27:                        Embarcadero at Vallejo     1645.5448
    ## 28:                         Washington at Kearney     2335.1965
    ## 29:                               Spear at Folsom      739.5398
    ## 30:      San Francisco Caltrain (Townsend at 4th)      818.6879
    ## 31:                              Davis at Jackson      935.8838
    ## 32:                               Clay at Battery     1200.1642
    ## 33:                           Golden Gate at Polk     1196.0425
    ## 34: Yerba Buena Center of the Arts (3rd @ Howard)      870.8964
    ## 35:                 Powell at Post (Union Square)     1608.1639
    ## 36:                  San Antonio Caltrain Station     2819.7316
    ## 37:         Rengstorff Avenue / California Street     4363.0287
    ## 38:                          Cowper at University     2190.2248
    ## 39:           Mechanics Plaza (Market at Battery)     1007.1464
    ## 40:                Mountain View Caltrain Station     1268.4549
    ## 41:                              Adobe on Almaden      844.9003
    ## 42:                      Commercial at Montgomery      796.4848
    ## 43:                    SJSU - San Salvador at 9th      936.7344
    ## 44:                               Post at Kearney      936.8625
    ## 45:               California Ave Caltrain Station     4294.2704
    ## 46:                                 St James Park      938.1094
    ## 47:                       Mountain View City Hall     1558.2308
    ## 48:                           San Salvador at 1st     1100.7312
    ## 49:                          Evelyn Park and Ride     1212.1923
    ## 50:             San Jose Diridon Caltrain Station      856.9951
    ## 51:                 Redwood City Caltrain Station     4221.3608
    ## 52:                    Palo Alto Caltrain Station     3219.7698
    ## 53:                            San Jose City Hall     1000.9194
    ## 54:                        SJSU 4th at San Carlos     2095.5141
    ## 55:                                 Park at Olive     3704.5740
    ## 56:                      Arena Green / SAP Center     2049.5070
    ## 57:                              San Pedro Square      968.7299
    ## 58:                                   MLK Library     1885.4802
    ## 59:                                     Japantown     2464.3315
    ## 60:                              Broadway at Main     3473.1842
    ## 61:                    San Jose Government Center     1068.1739
    ## 62:              Castro Street and El Camino Real     1830.9644
    ## 63:                       San Mateo County Center     4045.9633
    ## 64:                   San Antonio Shopping Center     1372.8279
    ## 65:                             Franklin at Maple      803.4824
    ## 66:                   Redwood City Medical Center     1912.2763
    ## 67:                   Redwood City Public Library     3474.0093
    ## 68:                     Broadway St at Battery St      882.9592
    ## 69:                                    Mezes Park      770.5893
    ## 70:                          Washington at Kearny     1885.8746
    ## 71:                                Post at Kearny     1034.7064
    ## 72:               Santa Clara County Civic Center     1378.6996
    ## 73:                                   Ryland Park     1407.0793
    ## 74:                      Stanford in Redwood City     1878.1800
    ##                                     start_station mean_duration

Great job! Let’s move on to grouping by multiple columns.

## Computing stats by groups (II)

When grouping a `data.table` by multiple columns, you need to specify
the `by` argument as either a character vector or a list. In this
exercise, you will calculate the mean of `duration` for:

-   Each unique combination of `start_station` and `end_station`
-   Each `start_station` for each month **Steps**

1.  Compute the mean duration for each unique combination
    `start_station` *and* `end_station`. Call the aggregated column
    `mean_duration`.

``` r
# Compute the mean duration for every start and end station
mean_station <- batrips[, .(mean_duration = mean(duration)), by = .(start_station, end_station)]
mean_station
```

    ##                     start_station                                   end_station
    ##    1:     San Francisco City Hall                               Townsend at 7th
    ##    2:      Embarcadero at Sansome                               Beale at Market
    ##    3:           Steuart at Market                            Powell Street BART
    ##    4:           Steuart at Market                         Washington at Kearney
    ##    5:               5th at Howard Yerba Buena Center of the Arts (3rd @ Howard)
    ##   ---                                                                          
    ## 1859:                  Mezes Park                    Palo Alto Caltrain Station
    ## 1860: Redwood City Public Library                      Stanford in Redwood City
    ## 1861:      University and Emerson                   Redwood City Public Library
    ## 1862:           Franklin at Maple                          Cowper at University
    ## 1863:      University and Emerson                       San Mateo County Center
    ##       mean_duration
    ##    1:      678.6364
    ##    2:      651.2367
    ##    3:      883.9379
    ##    4:     1553.3333
    ##    5:     1810.8305
    ##   ---              
    ## 1859:     2517.5000
    ## 1860:      639.0000
    ## 1861:     1395.0000
    ## 1862:     2654.0000
    ## 1863:     1918.5000

2.  Compute the mean duration for each `start_station` and for each
    month in `start_date`. Call the aggregated column `mean_duration`.

``` r
# Compute the mean duration grouped by start_station and month
mean_start_station <- batrips[, .(mean_duration = mean(duration)), by = .(start_station, month(start_date))]
mean_start_station
```

    ##                             start_station month mean_duration
    ##   1:              San Francisco City Hall     1     1548.2591
    ##   2:               Embarcadero at Sansome     1      952.1756
    ##   3:                    Steuart at Market     1      757.2448
    ##   4:                        5th at Howard     1      599.3433
    ##   5: Harry Bridges Plaza (Ferry Building)     1     1429.0666
    ##  ---                                                         
    ## 830:      California Ave Caltrain Station    12     4230.0000
    ## 831:               University and Emerson    12     7771.2917
    ## 832:           SJSU - San Salvador at 9th    12      652.9333
    ## 833:              San Mateo County Center    12     5033.5714
    ## 834:          Redwood City Public Library    12      496.5000

Well done! Can you calculate multiple statistics in `j`?

## Computing multiple stats

Let’s now combine everything from the past two exercises to find
multiple summary statistic with multiple groups in `batrips`.

**Steps**

1.  Group by `start_station` and `end_station` to calculate the mean
    duration and the total number of trips. Name these columns
    `mean_duration` and `total_trips`, respectively.

``` r
# Compute mean of duration and total trips grouped by start and end stations
aggregate_mean_trips <- batrips[, .(mean_duration = mean(duration), 
                                    total_trips = .N), 
                                by = .(start_station, end_station)]
aggregate_mean_trips
```

    ##                     start_station                                   end_station
    ##    1:     San Francisco City Hall                               Townsend at 7th
    ##    2:      Embarcadero at Sansome                               Beale at Market
    ##    3:           Steuart at Market                            Powell Street BART
    ##    4:           Steuart at Market                         Washington at Kearney
    ##    5:               5th at Howard Yerba Buena Center of the Arts (3rd @ Howard)
    ##   ---                                                                          
    ## 1859:                  Mezes Park                    Palo Alto Caltrain Station
    ## 1860: Redwood City Public Library                      Stanford in Redwood City
    ## 1861:      University and Emerson                   Redwood City Public Library
    ## 1862:           Franklin at Maple                          Cowper at University
    ## 1863:      University and Emerson                       San Mateo County Center
    ##       mean_duration total_trips
    ##    1:      678.6364         121
    ##    2:      651.2367         545
    ##    3:      883.9379         145
    ##    4:     1553.3333           9
    ##    5:     1810.8305          59
    ##   ---                          
    ## 1859:     2517.5000           2
    ## 1860:      639.0000           1
    ## 1861:     1395.0000           1
    ## 1862:     2654.0000           1
    ## 1863:     1918.5000           2

2.  Group by `start_station`, `end_station`, and for each month in
    `start_date` to calculate the minimum and maximum duration. Name
    these columns `min_duration` and `max_duration`, respectively.

``` r
# Compute min and max duration grouped by start station, end station, and month
aggregate_min_max <- batrips[, .(min_duration = min(duration), 
                                 max_duration = max(duration)), 
                             by = .(start_station, end_station, 
                                    month(start_date))]
aggregate_min_max
```

    ##                            start_station
    ##     1:           San Francisco City Hall
    ##     2:            Embarcadero at Sansome
    ##     3:                 Steuart at Market
    ##     4:                 Steuart at Market
    ##     5:                     5th at Howard
    ##    ---                                  
    ## 17665: Civic Center BART (7th at Market)
    ## 17666:         Broadway St at Battery St
    ## 17667:                         Japantown
    ## 17668:          Arena Green / SAP Center
    ## 17669:              Washington at Kearny
    ##                                          end_station month min_duration
    ##     1:                               Townsend at 7th     1          370
    ##     2:                               Beale at Market     1          345
    ##     3:                            Powell Street BART     1          498
    ##     4:                         Washington at Kearney     1          312
    ##     5: Yerba Buena Center of the Arts (3rd @ Howard)     1          349
    ##    ---                                                                 
    ## 17665:                        Embarcadero at Vallejo    12          870
    ## 17666:                          Washington at Kearny    12          158
    ## 17667:                                     Japantown    12         3237
    ## 17668:                                   Ryland Park    12          767
    ## 17669:                                 Howard at 2nd    12          915
    ##        max_duration
    ##     1:          661
    ##     2:         1674
    ##     3:         1620
    ##     4:          784
    ##     5:          624
    ##    ---             
    ## 17665:          870
    ## 17666:          158
    ## 17667:         3249
    ## 17668:          767
    ## 17669:          965

You are tremendous! In the next lesson, you will learn how to chain
`data.table` expressions to avoid intermediate objects.

## Chaining data.table expressions

Theory. Coming soon …

**1. Chaining data.table expressions**

In this lesson, we will see another powerful feature of data table,
chaining expressions together.

**2. Chaining expressions**

What does chaining expressions mean? What it means is that instead of
assigning the output data table to an intermediate object and then
performing some operation on it, you can successively perform operations
on the outputs. Let’s look at this example where we find the three
shortest trips that are over 1 hour, that is, 3600 seconds. We first
filter batrips such that duration is greater than 3600 and then arrange
the resulting data table by ordering the duration column and finally
subset the first three rows.

**3. Chaining expressions**

Let’s move on to a more advanced example. Suppose you want to find the
top three start stations which have the lowest mean duration. This task
requires several steps. First you would have to compute the mean
duration of all start stations and store the result in a variable. Then,
you would need to order() the mean duration column in increasing order
and choose the first three rows from that result. Instead, you can do
all this in a single step without using temporary variables by simply
chaining expressions together as shown here. Chaining essentially comes
for free. You can also chain data frame operations together. However the
number of things you can do with a data frame is so little that there is
no real use in chaining data frame operations.

**4. uniqueN()**

Let’s move on to another useful helper function, uniqueN(), which is
particularly helpful when used with “by”. The unique() function from
base R returns all the unique values of the input object. uniqueN() from
data table simply returns the count of unique elements of the input
object. It works on vectors, data frames and data tables all alike. The
vector id has two unique values so the result of uniqueN() is 2. When
you pass a data table to uniqueN(), it looks at all the columns by
default. Since there are no duplicate rows, the result is 4, which is
the same as the total number of rows in x. You can also use the “by”
argument in uniqueN() to search for the number of unique values in a
specific column of a data table. Again, as the id column consists of
only 2 unique values, the result is 2.

**5. uniqueN() together with by**

uniqueN() can be a very handy function, particularly when used with the
“by” argument of data table. Let’s say you’d like to compute the number
of unique bike ids for each month. You can do this by first grouping
batrips by month. Remember you can use the month() function on the
start_date column in the “by” argument to do this. Then you can use the
uniqueN() function on bike_id in the “j” argument thus calculating the
number of unique bike ids for each month.

**6. Let’s practice!**

Now let’s try some examples.

## Ordering rows

Ordering aggregated data is quite a common operation. This can be
elegantly accomplished by simply chaining `data.table` expressions
together.

**Steps**

1.  Compute the total number of trips grouped by `start_station` and
    `end_station`.

``` r
# Compute the total trips grouped by start_station and end_station
trips_dec <- batrips[, .N, by = .(start_station, 
                                  end_station)]
trips_dec
```

    ##                     start_station                                   end_station
    ##    1:     San Francisco City Hall                               Townsend at 7th
    ##    2:      Embarcadero at Sansome                               Beale at Market
    ##    3:           Steuart at Market                            Powell Street BART
    ##    4:           Steuart at Market                         Washington at Kearney
    ##    5:               5th at Howard Yerba Buena Center of the Arts (3rd @ Howard)
    ##   ---                                                                          
    ## 1859:                  Mezes Park                    Palo Alto Caltrain Station
    ## 1860: Redwood City Public Library                      Stanford in Redwood City
    ## 1861:      University and Emerson                   Redwood City Public Library
    ## 1862:           Franklin at Maple                          Cowper at University
    ## 1863:      University and Emerson                       San Mateo County Center
    ##         N
    ##    1: 121
    ##    2: 545
    ##    3: 145
    ##    4:   9
    ##    5:  59
    ##   ---    
    ## 1859:   2
    ## 1860:   1
    ## 1861:   1
    ## 1862:   1
    ## 1863:   2

2.  After computing the total number of trips grouped by `start_station`
    and `end_station`, order the results (total number of trips) in
    descending order.

``` r
# Arrange the total trips grouped by start_station and end_station in decreasing order
trips_dec <- batrips[, .N, by = .(start_station, 
                                  end_station)][order(-N)]
trips_dec
```

    ##                                 start_station
    ##    1:                         Townsend at 7th
    ##    2: San Francisco Caltrain 2 (330 Townsend)
    ##    3:    Harry Bridges Plaza (Ferry Building)
    ##    4:                         2nd at Townsend
    ##    5:                          Market at 10th
    ##   ---                                        
    ## 1859:           Redwood City Caltrain Station
    ## 1860:                              Mezes Park
    ## 1861:             Redwood City Public Library
    ## 1862:                  University and Emerson
    ## 1863:                       Franklin at Maple
    ##                                    end_station    N
    ##    1: San Francisco Caltrain (Townsend at 4th) 3158
    ##    2:                          Townsend at 7th 2937
    ##    3:                   Embarcadero at Sansome 2826
    ##    4:     Harry Bridges Plaza (Ferry Building) 2330
    ##    5: San Francisco Caltrain (Townsend at 4th) 2131
    ##   ---                                              
    ## 1859:          California Ave Caltrain Station    1
    ## 1860:          California Ave Caltrain Station    1
    ## 1861:                 Stanford in Redwood City    1
    ## 1862:              Redwood City Public Library    1
    ## 1863:                     Cowper at University    1

Isn’t it easy to order rows? In the upcoming exercises, you will see how
*chaining* can make your life easier.

## What are the top 5 destinations?

When analyzing data, it is often useful to know the key top/popular
stats such as the most popular cities or the most famous restaurants
etc. In this exercise, you will find the five most popular destinations
(i.e., the five most popular `end_station`s).

**Steps**

1.  Chain the following three `data.table` expressions:the total number
    of trips to each `end_station`. the total number of trips for each
    `end_station` in descending order. the top 5 rows.
2.  Find the total number of trips to each `end_station`.
3.  Arrange the total number of trips for each `end_station` in
    descending order.
4.  Filter the top 5 rows.

``` r
# Top five most popular destinations
top_5 <- batrips[, .N, by = end_station][order(-N)][1:5]
top_5
```

    ##                                 end_station     N
    ## 1: San Francisco Caltrain (Townsend at 4th) 33213
    ## 2:     Harry Bridges Plaza (Ferry Building) 15692
    ## 3:  San Francisco Caltrain 2 (330 Townsend) 15333
    ## 4:                        Market at Sansome 14816
    ## 5:                          2nd at Townsend 14064

Brilliant! Data Scientists answer questions like these everyday. Let’s
see if you can answer a slightly complicated one.

## What is the most popular destination from each start station?

In the last exercise, you created `trips_dec`, which consists of the
total number of trips grouped by `start_station` and `end_station` in
descending order. This gives you an opportunity to calculate the most
popular end station for each start station. You can do this by simply
extracting the first `end_station` for each `start_station`.

`trips_dec` is available in your workspace.

**Steps**

1.  Group `trips_dec` by `start_station` and extract the first
    `end_station` to find the most popular end station for each start
    station.

``` r
# Compute most popular end station for every start station
popular_end_station <- trips_dec[, .(end_station = end_station[1]), 
                                 by = start_station]
popular_end_station
```

    ##                                     start_station
    ##  1:                               Townsend at 7th
    ##  2:       San Francisco Caltrain 2 (330 Townsend)
    ##  3:          Harry Bridges Plaza (Ferry Building)
    ##  4:                               2nd at Townsend
    ##  5:                                Market at 10th
    ##  6:                             2nd at South Park
    ##  7:                        Embarcadero at Sansome
    ##  8:                             Market at Sansome
    ##  9:                             Steuart at Market
    ## 10:                         Embarcadero at Folsom
    ## 11:      San Francisco Caltrain (Townsend at 4th)
    ## 12: Temporary Transbay Terminal (Howard at Beale)
    ## 13:                                 5th at Howard
    ## 14:                                 Market at 4th
    ## 15:                                 2nd at Folsom
    ## 16:                Mountain View Caltrain Station
    ## 17:                            Powell Street BART
    ## 18:               Grant Avenue at Columbus Avenue
    ## 19:                                 Howard at 2nd
    ## 20: Yerba Buena Center of the Arts (3rd @ Howard)
    ## 21:                       Mountain View City Hall
    ## 22:             Civic Center BART (7th at Market)
    ## 23:                        Santa Clara at Almaden
    ## 24:             San Jose Diridon Caltrain Station
    ## 25:              Castro Street and El Camino Real
    ## 26:                               Beale at Market
    ## 27:                         Embarcadero at Bryant
    ## 28:                      South Van Ness at Market
    ## 29:                   San Antonio Shopping Center
    ## 30:                  San Antonio Caltrain Station
    ## 31:                        Embarcadero at Vallejo
    ## 32:                          Evelyn Park and Ride
    ## 33:                     Broadway St at Battery St
    ## 34:                               Clay at Battery
    ## 35:                               Spear at Folsom
    ## 36:                              Davis at Jackson
    ## 37:                      Commercial at Montgomery
    ## 38:                              San Pedro Square
    ## 39:           Mechanics Plaza (Market at Battery)
    ## 40:                 Powell at Post (Union Square)
    ## 41:                            San Jose City Hall
    ## 42:                        University and Emerson
    ## 43:                           Golden Gate at Polk
    ## 44:                          Cowper at University
    ## 45:                          Paseo de San Antonio
    ## 46:                              Adobe on Almaden
    ## 47:                                Post at Kearny
    ## 48:                                 St James Park
    ## 49:                      Arena Green / SAP Center
    ## 50:                    Palo Alto Caltrain Station
    ## 51:                           San Salvador at 1st
    ## 52:                                   Ryland Park
    ## 53:                    SJSU - San Salvador at 9th
    ## 54:               Santa Clara County Civic Center
    ## 55:                       San Francisco City Hall
    ## 56:                          Washington at Kearny
    ## 57:                                   MLK Library
    ## 58:                         San Jose Civic Center
    ## 59:         Rengstorff Avenue / California Street
    ## 60:                                     Japantown
    ## 61:               California Ave Caltrain Station
    ## 62:                 Redwood City Caltrain Station
    ## 63:                                    Mezes Park
    ## 64:                        SJSU 4th at San Carlos
    ## 65:                                 Park at Olive
    ## 66:                               Post at Kearney
    ## 67:                             Franklin at Maple
    ## 68:                   Redwood City Public Library
    ## 69:                   Redwood City Medical Center
    ## 70:                       San Mateo County Center
    ## 71:                      Stanford in Redwood City
    ## 72:                         Washington at Kearney
    ## 73:                              Broadway at Main
    ## 74:                    San Jose Government Center
    ##                                     start_station
    ##                                       end_station
    ##  1:      San Francisco Caltrain (Townsend at 4th)
    ##  2:                               Townsend at 7th
    ##  3:                        Embarcadero at Sansome
    ##  4:          Harry Bridges Plaza (Ferry Building)
    ##  5:      San Francisco Caltrain (Townsend at 4th)
    ##  6:                             Market at Sansome
    ##  7:                             Steuart at Market
    ##  8:                             2nd at South Park
    ##  9:      San Francisco Caltrain (Townsend at 4th)
    ## 10:      San Francisco Caltrain (Townsend at 4th)
    ## 11: Temporary Transbay Terminal (Howard at Beale)
    ## 12:      San Francisco Caltrain (Townsend at 4th)
    ## 13:      San Francisco Caltrain (Townsend at 4th)
    ## 14:      San Francisco Caltrain (Townsend at 4th)
    ## 15:                             Market at Sansome
    ## 16:                       Mountain View City Hall
    ## 17:      San Francisco Caltrain (Townsend at 4th)
    ## 18:                             Market at Sansome
    ## 19:      San Francisco Caltrain (Townsend at 4th)
    ## 20:      San Francisco Caltrain (Townsend at 4th)
    ## 21:                Mountain View Caltrain Station
    ## 22:                               Townsend at 7th
    ## 23:             San Jose Diridon Caltrain Station
    ## 24:                        Santa Clara at Almaden
    ## 25:                Mountain View Caltrain Station
    ## 26:      San Francisco Caltrain (Townsend at 4th)
    ## 27:      San Francisco Caltrain (Townsend at 4th)
    ## 28:      San Francisco Caltrain (Townsend at 4th)
    ## 29:                  San Antonio Caltrain Station
    ## 30:                   San Antonio Shopping Center
    ## 31:                             Steuart at Market
    ## 32:                Mountain View Caltrain Station
    ## 33:      San Francisco Caltrain (Townsend at 4th)
    ## 34:      San Francisco Caltrain (Townsend at 4th)
    ## 35:      San Francisco Caltrain (Townsend at 4th)
    ## 36:      San Francisco Caltrain (Townsend at 4th)
    ## 37:      San Francisco Caltrain (Townsend at 4th)
    ## 38:             San Jose Diridon Caltrain Station
    ## 39:                                 Market at 4th
    ## 40:      San Francisco Caltrain (Townsend at 4th)
    ## 41:             San Jose Diridon Caltrain Station
    ## 42:                        University and Emerson
    ## 43:      San Francisco Caltrain (Townsend at 4th)
    ## 44:                    Palo Alto Caltrain Station
    ## 45:             San Jose Diridon Caltrain Station
    ## 46:             San Jose Diridon Caltrain Station
    ## 47:      San Francisco Caltrain (Townsend at 4th)
    ## 48:             San Jose Diridon Caltrain Station
    ## 49:                        Santa Clara at Almaden
    ## 50:                          Cowper at University
    ## 51:                                   MLK Library
    ## 52:               Santa Clara County Civic Center
    ## 53:             San Jose Diridon Caltrain Station
    ## 54:                                   Ryland Park
    ## 55:                            Powell Street BART
    ## 56:                            Powell Street BART
    ## 57:             San Jose Diridon Caltrain Station
    ## 58:                         San Jose Civic Center
    ## 59:                Mountain View Caltrain Station
    ## 60:             San Jose Diridon Caltrain Station
    ## 61:                    Palo Alto Caltrain Station
    ## 62:                                    Mezes Park
    ## 63:                 Redwood City Caltrain Station
    ## 64:                        Santa Clara at Almaden
    ## 65:                    Palo Alto Caltrain Station
    ## 66:                         Washington at Kearney
    ## 67:                 Redwood City Caltrain Station
    ## 68:                 Redwood City Caltrain Station
    ## 69:                 Redwood City Caltrain Station
    ## 70:                       San Mateo County Center
    ## 71:                 Redwood City Caltrain Station
    ## 72:                            Powell Street BART
    ## 73:                              Broadway at Main
    ## 74:                                     Japantown
    ##                                       end_station

Nicely done! You are on your way to mastering data.tables. Can you
combine the three important arguemnts of data.table, `i`, `j`, and `by`
in one operation?

## Combining i, j, and by (I)

In this exercise, you will combine the `i`, `j`, and `by` arguments to
find the *first and last ride for each start station*. Recall that
`data.table` first filters the rows in `i`, and then groups the rows
using `by`, and finally compute the expression in `j`.

**Steps**

1.  Arrange `batrips` using the `start_date` column in ascending
    order.  
2.  Group the rows by `start_station`.
3.  Extract the first and last rows of `start_date`.

``` r
# Find the first and last ride for each start_station
first_last <- batrips[order(start_date), 
                      .(start_date = start_date[c(1, .N)]), 
                      by = start_station]
first_last
```

    ##                        start_station          start_date
    ##   1:         San Francisco City Hall 2014-01-01 00:14:00
    ##   2:         San Francisco City Hall 2014-12-31 22:06:00
    ##   3:          Embarcadero at Sansome 2014-01-01 00:17:00
    ##   4:          Embarcadero at Sansome 2014-12-31 22:08:00
    ##   5:               Steuart at Market 2014-01-01 00:23:00
    ##  ---                                                    
    ## 144: Santa Clara County Civic Center 2014-12-31 15:32:00
    ## 145:                     Ryland Park 2014-04-10 09:10:00
    ## 146:                     Ryland Park 2014-12-31 07:56:00
    ## 147:        Stanford in Redwood City 2014-09-03 19:41:00
    ## 148:        Stanford in Redwood City 2014-12-22 16:56:00

Whoo! That was quite an involved task, wasn’t it? You did great!

## Computations in j using .SD

Theory. Coming soon …

**1. Computations in j using .SD**

In this lesson, you will look at another special symbol, dot-SD, which
stands for Subset of Data. It makes computations even more easier and
powerful as we will see in a moment.

**2. Subset of Data, .SD**

dot-SD is an extremely powerful symbol. Understanding it can help you do
complex data wrangling in a straightforward manner. As mentioned
earlier, dot-SD stands for ‘Subset of Data’. When grouping, it holds the
intermediate data corresponding to each group while results for that
group are being computed. It contains all the columns except the
grouping column itself, by default. Let’s see dot-SD in action using
this data table x.

**3. Subset of Data, .SD**

You can see that dot-SD contains “val1” and “val2” columns for each
unique value of “id”. It contains all the rows of those columns
corresponding to the group for which results are being computed. The
“id” column itself is not included. Also note that these groups are data
tables! This means we can perform subsets, selects, computations on the
intermediate data table within each group! This is why dot-SD is very
powerful.

**4. Subset of Data, .SD**

So how can you use dot-SD to find the first row for each id? While
grouping by “id” column, you now know that dot-SD would contain all the
columns except the grouping column, id, and all the rows. And also that
dot-SD is by itself a data table. Therefore dot-SD\[1\] in “j” returns
the first row for each group.

**5. Subset of Data, .SD**

Similarly, you can use .SD in combination with .N to obtain the last row
for each unique id.

**6. .SDcols**

In the previous examples, dot-SD\[1\] and dot-SD\[dot-N\] returned the
first and last rows for each “id”. However, it returned ALL the
columns - “val1” and “val2”. What if you would like to just return
“val1”? In other words, how can you control the columns that are
available to dot-SD?Using dot-SDcols! It takes a character vector of
column names that decides the columns to be included in dot-SD. In the
first example here, dot-SD\[1\] returns the first row for every start
station, with ALL the columns.In the second example, for every start
station, only the first row and trip_id and duration columns are
returned.

**7. .SDcols**

Of course, you can also prefix the character vector with a negative sign
or the not operator to return ALL the columns EXCEPT the ones provided
to dot-SDcols.

**8. Let’s practice!**

Time to put this into practice.

## Using .SD (I)

`.SD` together with `.SDcols` is an incredibly powerful feature that
makes computing on multiple columns so much easier.

-   `.SD` is a special symbol which stands for **S**ubset of **D**ata
-   `.SDcols` holds the columns that should be included in `.SD`
    **Steps**

1.  For each month, find the row corresponding to the shortest trip (by
    using `which.min()` on `duration`).
2.  The result should contain the `month`, `start_station`,
    `end_station`, `start_date`, `end_date`, and `duration` columns.

``` r
relevant_cols <- c("start_station", "end_station", 
                   "start_date", "end_date", "duration")

# Find the row corresponding to the shortest trip per month
shortest <- batrips[, .SD[which.min(duration)], 
                    by = month(start_date), 
                    .SDcols = relevant_cols]
shortest
```

    ##     month                                 start_station
    ##  1:     1                               2nd at Townsend
    ##  2:     2      San Francisco Caltrain (Townsend at 4th)
    ##  3:     3           Mechanics Plaza (Market at Battery)
    ##  4:     4                      South Van Ness at Market
    ##  5:     5                                Market at 10th
    ##  6:     6                            Powell Street BART
    ##  7:     7                            Powell Street BART
    ##  8:     8                     Broadway St at Battery St
    ##  9:     9             Civic Center BART (7th at Market)
    ## 10:    10 Yerba Buena Center of the Arts (3rd @ Howard)
    ## 11:    11 Temporary Transbay Terminal (Howard at Beale)
    ## 12:    12                             2nd at South Park
    ##                                       end_station          start_date
    ##  1:                               2nd at Townsend 2014-01-21 13:01:00
    ##  2:      San Francisco Caltrain (Townsend at 4th) 2014-02-08 14:28:00
    ##  3:           Mechanics Plaza (Market at Battery) 2014-03-18 17:50:00
    ##  4:                      South Van Ness at Market 2014-04-12 04:28:00
    ##  5:                                Market at 10th 2014-05-14 20:11:00
    ##  6:                            Powell Street BART 2014-06-23 17:31:00
    ##  7:                            Powell Street BART 2014-07-14 14:09:00
    ##  8:                     Broadway St at Battery St 2014-08-15 15:15:00
    ##  9:             Civic Center BART (7th at Market) 2014-09-04 10:53:00
    ## 10: Yerba Buena Center of the Arts (3rd @ Howard) 2014-10-04 19:21:00
    ## 11: Temporary Transbay Terminal (Howard at Beale) 2014-11-07 09:45:00
    ## 12:                             2nd at South Park 2014-12-08 11:38:00
    ##                end_date duration
    ##  1: 2014-01-21 13:02:00       60
    ##  2: 2014-02-08 14:29:00       61
    ##  3: 2014-03-18 17:51:00       60
    ##  4: 2014-04-12 04:29:00       61
    ##  5: 2014-05-14 20:12:00       60
    ##  6: 2014-06-23 17:32:00       60
    ##  7: 2014-07-14 14:10:00       60
    ##  8: 2014-08-15 15:16:00       60
    ##  9: 2014-09-04 10:54:00       60
    ## 10: 2014-10-04 19:22:00       60
    ## 11: 2014-11-07 09:46:00       60
    ## 12: 2014-12-08 11:39:00       60

You are terrific! `.SD` and `.SDcols` are especially useful when you are
dealing with large data.tables. Do you really know how to use them?
Let’s find out.

## Using .SD (II)

You can also apply a single function to every column specified in
`.SDcols` using `lapply()`. In this exercise, you will calculate the
number of unique start stations and zip codes for each month using
<a href="https://www.rdocumentation.org/packages/data.table/topics/duplicated">`uniqueN()`</a>.
`uniqueN()` returns the number of unique elements in a
column/vector/`data.table`.

**Steps**

1.  Find the total number of unique start stations and zip codes *for
    each* month, using `start_date` to extract the month.

``` r
# Find the total number of unique start stations and zip codes per month
unique_station_month <- batrips[, lapply(.SD, uniqueN), 
                                by = month(start_date), 
                                .SDcols = c("start_station", "zip_code")]
unique_station_month
```

    ##     month start_station zip_code
    ##  1:     1            68      710
    ##  2:     2            69      591
    ##  3:     3            69      894
    ##  4:     4            70      895
    ##  5:     5            70     1073
    ##  6:     6            70     1028
    ##  7:     7            70     1068
    ##  8:     8            70     1184
    ##  9:     9            70      971
    ## 10:    10            70      991
    ## 11:    11            70      769
    ## 12:    12            68      586

Looks like you know your way around data.tables! Well done! However, to
truly master the basics of data.table, there is one more thing to you
need to know: *reference semantics*. This will be the focus of the next
chapter.

# 4. Reference Semantics

You will learn about a unique feature of data.table in this chapter:
modifying existing data.tables in place. Modifying data.tables in place
makes your operations <i>incredibly fast</i> and is easy to learn.

## Adding and updating columns by reference

Theory. Coming soon …

**1. Adding and updating columns by reference**

In this lesson, you will look at a very unique feature of data table,
reference semantics, which allows you to add, update and delete columns
of a data table in place.

**2. data.frame internals**

Suppose you have a data frame “df” as shown here and you would like to
change the second row of column “y” to 10 instead of 7.You can do
something like this.

**3. data.frame internals**

Now how does R handle this internally? In versions of R prior to
3-point-1-point-0, this operation resulted in deep copying of the entire
data frame.That is, the entire data frame “df” was copied in memory to a
completely different location and assigned a temporary variable name,
say “tmp”. The new value was updated on “tmp” and the result was then
assigned back to “df”.Now think about how much memory you will require
if your data frame is 10GB. You will need at least 10GB more of free RAM
just to replace a single value of a single column! This was obviously
not memory efficient.

**4. data.frame internals**

Improvements were made in version 3-point-1-point-0 to not deep copy the
entire data frame while updating columns.This example data frame df has
four columns. Say you would like to replace all “even” values with NA in
the first two columns, you can do that as shown here. From version
3-point-1-point-0 on, only columns “a” and “b” are deep copied instead
of the entire data frame. This is a great improvement.However, the
columns being updated are still deep copied. Imagine your data frame is
10GB with 100 columns and you are updating 50 columns. You would still
need 5GB of extra space to update those columns.Surely, deep copying
just the columns used is a welcoming improvement but by no means the
most efficient way of updating columns.So how does data table handle
this efficiently?

**5. data.table internals**

The data table package does not deep copy objects or create any
temporary variables. It simply updates the original data table by
reference.Since the original data table is directly updated, there is no
need to assign the result back to a variable. It is therefore extremely
fast and memory efficient.data table uses a new operator colon equal to
(:=) to perform this.

**6. LHS := RHS form**

There are two ways of using data table’s colon equal to operator.The
first is the left-hand-side colon equal to right-hand-side form. It
takes a character vector of column names on the left-hand-side of the
“:=” operator and a LIST of values on the right-hand-side of the “:=”
operator, corresponding to each of the column names.In the example
shown, two columns are being added to the original data table batrips.
The first one is TRUE if the duration is greater than 1 hour and the
second is the weekday of each trip.For convenience, you can skip the
quotes around column names on the left-hand-side if a single column is
added or updated.Note that the result is not assigned to a new variable.
The original data table batrips will now have these two columns added to
it.

**7. Functional form**

The second way of using the “:=” operator is the functional form. It
takes the form “col1 = val1”, “col2 = val2” etc.. as arguments to
function “:=()”. Note that when you are using operators as functions,
they need to wrapped inside backticks. Assigning NULL to a column
deletes that column by reference. Here, “is_dur_gt_1hour” column is
deleted. In addition, “start_station” column is updated by reference to
all upper case.It is perfectly fine if you prefer to stick to one method
over the other.

**8. Let’s practice!**

Now it’s your time to use the colon equal to operator.

## Adding a new column

As mentioned in the video, `data.table` does not have to deep copy
objects in order to modify them. It can modify objects *by reference*
(inplace) to save memory and runtime using the `:=` operator. When you
update a `data.table` *by reference*, you don’t have to assign the
result to a new object as the original `data.table` is modified
directly.

**Steps**

1.  Add a new column `duration_hour` to `batrips` *by reference*, by
    dividing the `duration` column by 3600.

``` r
# Add a new column, duration_hour
batrips[, duration_hour := duration / 3600]
```

Did you notice you didn’t have to assign the result to any object? The
new column was simply *added* to your existing `data.table`.

## Updating an existing column (I)

Being able to efficiently update existing columns is particularly useful
when cleaning data. In this exercise, you will work with a new
`data.table`, `untidy`, which is almost identical to `batrips`, except
we introduced a typo in the second row of the `start_station` column.

**Steps**

1.  Print the first two rows of `untidy` to see if you can spot the
    typo.

``` r
# Print untidy
head(untidy, 2)
```

    ##    trip_id duration          start_date           start_station start_terminal
    ## 1:  139545      435 2014-01-01 00:14:00 San Francisco City Hall             58
    ## 2:  139546      432 2014-01-01 00:14:00 Sen Francisco City Hall             58
    ##               end_date     end_station end_terminal bike_id subscription_type
    ## 1: 2014-01-01 00:21:00 Townsend at 7th           65     473        Subscriber
    ## 2: 2014-01-01 00:21:00 Townsend at 7th           65     395        Subscriber
    ##    zip_code duration_hour
    ## 1:    94612     0.1208333
    ## 2:    94107     0.1200000

2.  Now update the second row of the `start_station` column to fix the
    typo. The correct spelling should be `"San Francisco City Hall"`.

``` r
# Fix spelling in the second row of start_station using the LHS := RHS form
untidy[2, start_station := "San Francisco City Hall"]
```

Updating `data.table`s is incredibly useful when you are cleaning data.
Instead of creating several objects and cluttering up your workspace,
you can modify your original `data.table` directly. This is both cleaner
and faster!

## Updating an existing column (II)

In the previous exercise, you updated only one value and you knew the
exact location that had to be updated, i.e., the *second* row of the
`start_station` column. However, in your day-to-day work, you often want
to update several values and you won’t know the locations in advance.

You can use the filtering expressions in `i` the same way you did in
chapter 1 to update the columns by reference.

In this exercise, you will work with a new `data.table`, `untidy`, which
is almost identical to `batrips`, except we randomly introduced some
negative values in the `duration` column.

**Steps**

1.  Replace all rows where `duration` is less than 0 with `NA`s.

``` r
# Replace negative duration values with NA
untidy[duration < 0, duration := NA]
```

You can also update `data.table`s when performing *grouped*
aggregations. Do you know how? Check out the next lesson!

## Grouped aggregations

Theory. Coming soon …

**1. Grouped aggregations**

Suppose you want to filter batrips so that it contains data for only
those zip codes with greater than 1000 trips. How would you do that?

**2. Combining “:=” with by**

In the previous video, you saw how to add or update columns by reference
to the original data table using the new “:=” operator. You will now add
and update columns for different groups in your data table using the
“by” argument.As you can see here, a new column “n_zip_code” is added to
batrips which contains the total trips made for each “zip_code”. When
you update a data table by reference, it is updated silently. Nothing is
printed to the console. Checking the number of columns before and after
you can see that the number of columns increased by 1. To view the
results as soon you update a data table by reference, you can simply
chain a pair of empty square brackets, which will print the updated data
table.

**3. Combining “:=” with by**

Now all you need to do is use the “n_zip_code” column to filter batrips.
Of course, you don’t really need the column “n_zip_code” in your final
result,

**4. Combining “:=” with by**

so you can delete it by reference by chaining one more expression as
shown here. This is a very common pattern in data analysis. You often
need to add intermediate columns to get to the final result, but don’t
necessarily need them in the final result.

**5. Let’s practice!**

Go ahead and practice aggregating data by reference!

## Adding columns by group

Recall that you can perform computations *by group* using the `by`
argument of the `data.table`. In this exercise, you will add new columns
*by group* to the original `data.table` *by reference*.

**Steps**

1.  Add a new column *by reference* called `trips_N` that is equal to
    the total number of trips for every `start_station`.

``` r
# Add a new column equal to total trips for every start station
batrips[, trips_N := .N, by = start_station]
```

2.  Add a new column *by reference* called `duration_mean` that is equal
    to the mean duration of trips for each unique combination of
    `start_station` and `end_station`.

``` r
# Add new column for every start_station and end_station
batrips[, duration_mean := mean(duration), by = .(start_station, end_station)]
```

That’s right! Adding new columns is not much different. All you need to
do is specify the `by` argument.

## Updating columns by group

You often need to create new intermediate columns to get to the final
result but don’t necessarily need these intermediate columns in the
final result. This is a very common pattern in data analysis.

In this exercise, you will work with a new `data.table`, `batrips_new`,
which is almost identical to `batrips`, except we randomly introduced
some missing values in the `duration` column.

**Steps**

1.  Add a new column (`mean_dur`) by reference that is the mean duration
    of all trips grouped by month (based on `start_date`). *Note that
    the `duration` column has missing values.*

``` r
batrips_new <- readRDS("data/batrips_new.rds")

# Calculate the mean duration for each month
batrips_new[, mean_dur := mean(duration, na.rm = TRUE), 
            by = month(start_date)]
```

2.  Chain a new `data.table` expression that replaces all missing values
    in `duration` with the corresponding `mean_dur` value.

``` r
# Replace NA values in duration with the mean value of duration for that month
batrips_new[, mean_dur := mean(duration, na.rm = TRUE), 
            by = month(start_date)][is.na(duration), 
                                    duration := mean_dur]
```

3.  Delete the `mean_dur` column by reference.

``` r
# Delete the mean_dur column by reference
batrips_new[, mean_dur := mean(duration, na.rm = TRUE), 
            by = month(start_date)][is.na(duration), 
                                    duration := mean_dur][, mean_dur := NULL]
```

Nicely done! Are you ready for more advanced aggregations?

## Advanced aggregations

Theory. Coming soon …

**1. Advanced aggregations**

In this lesson, you will use the colon equal to operator for more
advanced aggregations.

**2. Recap**

In the previous videos, you learned how to use the colon equal to
operator in two ways: a) LHS := RHS form and b) the functional form, to
add and update columns in a data table by reference.In addition, you
also saw how to combine the “:=” operator with the “by” argument to add
a single column while grouping. Now let’s see how you can add multiple
columns by reference while using the “by” argument.

**3. Adding multiple columns by reference by group**

You can provide all the columns to be added/updated along with their
values in either of the two forms: LHS:=RHS or functional form, and add
the “by” argument to group by those columns.As you can see here, for
each “end_station”, the first and last duration values are assigned to
the two new columns. Note that you would have identical first and last
values of duration for all rows corresponding to the same end station.

**4. Binning values**

We will now create a new column based on the median duration for each
unique combination of start_station and end_station as shown here. As
you might have guessed, you can use if-else statements to accomplish
this.

**5. Multi-line expressions in j**

The “j” argument can also handle complex multi-line expressions. To do
this, you can use the left-hand-side := right-hand-side form and wrap
the expressions inside curly brackets in the right-hand-side. As you can
see here, we first calculate the median duration for each group,
med_dur. Then, we use a series of if-else statements to create the new
column trip_category by reference.

**6. Alternative way**

Alternatively, you can create a user-defined function to accomplish the
same task. The bin_median_duration() function does exactly the same job
as the multi-line expression on the previous slide.

**7. All together - i, j and by**

So far you have used the “j” and “by” arguments to add/update columns by
reference. Now let’s combine all three - “i”, “j”, and “by” together.In
the example shown here, data table first evaluates the expression in “i”
which returns all the rows where duration is greater than 500. Then on
those rows, the “by” argument is applied by creating groups for each
unique combination of “start_station” and “end_station”. Finally, for
each of those groups the expression in “j” is evaluated. We thereby
obtain the smallest duration greater than 500 for each specified group.
If all values for a particular group are less than 500, there are no
rows to group by, so the result would be NA, as shown in the first two
rows of output here.

**8. Let’s practice!**

Now it’s your turn to practice advanced aggregations.

## Adding multiple columns (I)

More often than not, you may want to add/update multiple columns by
reference. There are two ways to do this in `data.table`:

-   LHS := RHS form
-   Functional form In this exercise, you will add columns using the
    **LHS := RHS** form. In the LHS, you specify column names as a
    character vector and in the RHS, you specify values/expressions to
    be added inside `list()` (or the alias, `.()`).

**Steps**

1.  Add two new columns (`mean_duration` and `median_duration`) *by
    reference* using the `LHS := RHS` form that calculates the mean and
    median of the `duration` column for every `start_station`.

``` r
# Add columns using the LHS := RHS form
batrips[, c("mean_duration", 
            "median_duration") := .(mean(duration), median(duration)), 
        by = start_station]
```

    ## Warning in `[.data.table`(batrips, , `:=`(c("mean_duration",
    ## "median_duration"), : Group 37 column 'median_duration': 636.500000 (type
    ## 'double') at RHS position 1 truncated (precision lost) when assigning to type
    ## 'integer'

    ## Warning in `[.data.table`(batrips, , `:=`(c("mean_duration",
    ## "median_duration"), : Group 41 column 'median_duration': 316.500000 (type
    ## 'double') at RHS position 1 truncated (precision lost) when assigning to type
    ## 'integer'

    ## Warning in `[.data.table`(batrips, , `:=`(c("mean_duration",
    ## "median_duration"), : Group 45 column 'median_duration': 1000.500000 (type
    ## 'double') at RHS position 1 truncated (precision lost) when assigning to type
    ## 'integer'

    ## Warning in `[.data.table`(batrips, , `:=`(c("mean_duration",
    ## "median_duration"), : Group 46 column 'median_duration': 424.500000 (type
    ## 'double') at RHS position 1 truncated (precision lost) when assigning to type
    ## 'integer'

    ## Warning in `[.data.table`(batrips, , `:=`(c("mean_duration",
    ## "median_duration"), : Group 52 column 'median_duration': 676.500000 (type
    ## 'double') at RHS position 1 truncated (precision lost) when assigning to type
    ## 'integer'

    ## Warning in `[.data.table`(batrips, , `:=`(c("mean_duration",
    ## "median_duration"), : Group 69 column 'median_duration': 308.500000 (type
    ## 'double') at RHS position 1 truncated (precision lost) when assigning to type
    ## 'integer'

    ## Warning in `[.data.table`(batrips, , `:=`(c("mean_duration",
    ## "median_duration"), : Group 74 column 'median_duration': 885.500000 (type
    ## 'double') at RHS position 1 truncated (precision lost) when assigning to type
    ## 'integer'

Great job! In the next exercise, you will compute the same columns
again, but this time using the *functional form*.

## Adding multiple columns (II)

In this exercise, you will add the same columns as in the previous
exercise, using the **functional** form. In the functional form, you use
the colon equal to operator (`:=`) as a function. Recall that when using
operators as functions, they should be wrapped inside backticks,
**`:=`()**. Inside the function call, you pass comma-separated
`col_name = expression` values.

**Steps**

1.  Add two new columns (`mean_duration` and `median_duration`) *by
    reference* using the *functional form* that calculates the mean and
    median of the `duration` column for every `start_station`.

``` r
# Add columns using the functional form
batrips[, `:=`(mean_duration = mean(duration), 
               median_duration = median(duration)), 
        by = start_station]
```

    ## Warning in `[.data.table`(batrips, , `:=`(mean_duration = mean(duration), :
    ## Group 37 column 'median_duration': 636.500000 (type 'double') at RHS position 1
    ## truncated (precision lost) when assigning to type 'integer'

    ## Warning in `[.data.table`(batrips, , `:=`(mean_duration = mean(duration), :
    ## Group 41 column 'median_duration': 316.500000 (type 'double') at RHS position 1
    ## truncated (precision lost) when assigning to type 'integer'

    ## Warning in `[.data.table`(batrips, , `:=`(mean_duration = mean(duration), :
    ## Group 45 column 'median_duration': 1000.500000 (type 'double') at RHS position 1
    ## truncated (precision lost) when assigning to type 'integer'

    ## Warning in `[.data.table`(batrips, , `:=`(mean_duration = mean(duration), :
    ## Group 46 column 'median_duration': 424.500000 (type 'double') at RHS position 1
    ## truncated (precision lost) when assigning to type 'integer'

    ## Warning in `[.data.table`(batrips, , `:=`(mean_duration = mean(duration), :
    ## Group 52 column 'median_duration': 676.500000 (type 'double') at RHS position 1
    ## truncated (precision lost) when assigning to type 'integer'

    ## Warning in `[.data.table`(batrips, , `:=`(mean_duration = mean(duration), :
    ## Group 69 column 'median_duration': 308.500000 (type 'double') at RHS position 1
    ## truncated (precision lost) when assigning to type 'integer'

    ## Warning in `[.data.table`(batrips, , `:=`(mean_duration = mean(duration), :
    ## Group 74 column 'median_duration': 885.500000 (type 'double') at RHS position 1
    ## truncated (precision lost) when assigning to type 'integer'

Great! You can check that the results are same whether you use *LHS :=
RHS* or the *functional form*. Is there a preferred way? No. Pick your
favorite.

## Combining i, j, and by (II)

As you did in the last chapter, you will combine the `i`, `j`, and `by`
arguments, but this time modify the existing `data.table` by reference
in `j`.

**Steps**

1.  For all rows where `duration` is greater than 600, group `batrips`
    by `start_station` and `end_station` to add a new column
    (`mean_duration`) *by reference* which calculates the mean duration
    of all trips.

``` r
# Add the mean_duration column
batrips[duration > 600, mean_duration := mean(duration), 
        by = .(start_station, end_station)]
```

You are stunning! Congratulations on mastering the basics of
`data.table`. In the next chapter, you will import and export flat files
using `data.table`’s *amazing* `fread()` and `fwrite()` functions!

# 5. Importing and Exporting Data

Not only does the data.table package help you perform incredibly fast
computations, it can also help you read and write data to disk with
amazing speeds. This chapter focuses on data.table’s fread() and
fwrite() functions which let you import and export flat files
<i>quickly</i> and <i>easily</i>!

## Fast data reading with fread()

Theory. Coming soon …

**1. Fast data reading with fread()**

You maybe familiar with read dot csv() or read dot table() functions
which import flat files into R. In this chapter, you will use data
table’s high-performance function fread() to import flat files. So what
distinguishes fread() from the other file readers?

**2. Blazing FAST!**

fread() is blazing FAST! It can import files in parallel on machines
where multi-core processors are available. By default, fread() uses ALL
available threads. You can use the argument nThread to control the
number of threads fread() uses.

**3. User-friendly**

fread() is also very user friendly. You can read local files from disk,
files from URLs, and strings that need to be parsed using the same
syntax! It can automatically guess column types, skip lines if necessary
which is useful when reading files that contain comments or metadata
about the file, handle quotes, separators, white spaces etc. One thing
to note though is that at the moment, date and datetime columns are read
in as character columns. These columns can be converted later using the
excellent fasttime or the more recent anytime packages.

**4. Fast and friendly file reader**

On this slide we show how the same dataset in three different formats
can be imported into R using fread(). As you can see fread()
automatically detects if it is a file name, URL or string for you. Note
how the header is automatically detected as well. If there’s no header,
fread() automatically names them “V1”, “V2” etc. Similar to the data
table() function. This example shows how you can import data using a
filename, URL, or a string. That’s it. Everything else is taken care of
automatically. If you would like to know what’s going on under the hood,
set the verbose argument to TRUE. In the rest of this chapter, we will
use fread() to import data only through strings so you can see how the
data looks like.

**5. nrows and skip arguments**

Although fread() is clever enough to guess the column types and other
details in most cases, there are times when you might appreciate a finer
control when importing your data. Let’s see how these finer controls
work. The arguments nrows and skip allow you to control which rows or
lines of a file are imported. The nrows argument specifies the total
number of rows to read, excluding the header row. It takes an integer as
input. This is particularly useful when you want to have a quick look at
the file by reading, say, just the first 100 rows instead of millions of
rows.The skip argument also takes an integer as input and skips that
many number of lines before attempting to parse the file. This is
particularly useful in handling irregular files, for example, files with
comments, or metadata at the beginning of a file. Even though fread()
tries to handle this automatically, it might be required to manually
specify the skip argument in some special cases.

**6. More on nrows and skip arguments**

The skip argument can also take a string as input. In this case, fread()
searches for the first exact occurrence of that string and parses the
file from the line that string occurs. Note how all text before the
string “a,b” is skipped.And finally, you can use skip and nrows together
to skip a few rows and read a specified number of rows from there as
shown here.

**7. select and drop arguments**

The arguments select and drop allow you to control which columns are
imported. Since this is done while parsing, it is very efficient. Both
arguments accept a character vector of column names as well as column
numbers. By default, all columns are parsed. The select argument parses
the file only for the specified columns. The drop argument reads in all
columns except the specified ones.Note that you can not combine both the
arguments in the same function call.

**8. Let’s practice!**

Now it’s time for you to import data using fread()!

## Fast reading from disk

In addition to having intelligent defaults, `fread()` is super fast! In
this exercise, you will use the
<a href="https://www.rdocumentation.org/packages/base/topics/system.time">`system.time()`</a>
function from base R to compare the time it takes to read the
`batrips.csv` file using `read.csv()` and `fread()`. All you need to do
is pass an expression to `system.time()`. For example, if you want to
calculate how long it takes to import a file called `sample.csv`, you
can use:

``` r
system.time(read.csv("sample.csv"))
   user  system elapsed 
  3.495   0.040   3.547
```

Generally, you want to consider `user` time when measuring execution
time. So in this case, it took 3.495 seconds to import the file
`sample.csv`.

**Steps**

1.  Import `batrips` using base R’s `read.csv()`.
2.  Wrap the call inside `system.time()` to see how long this operation
    takes.

``` r
# Use read.csv() to import batrips
system.time(read.csv("data/batrips.csv"))
```

    ##    user  system elapsed 
    ##   2.410   0.049   2.461

3.  Import `batrips` using `data.table`’s `fread()`.
4.  Wrap the call inside `system.time()` to see how long this operation
    takes.

``` r
# Use fread() to import batrips
system.time(fread("data/batrips.csv"))
```

    ##    user  system elapsed 
    ##   0.238   0.020   0.112

That’s right! `data.table`’s `fread()` was able to import this file \~5x
faster compared to `read.csv()`.

## Importing a CSV file

In this exercise, you will import the file `sample.csv` using both
<a href="https://www.rdocumentation.org/packages/utils/topics/read.table">`read.csv()`</a>
and
<a href="https://www.rdocumentation.org/packages/data.table/topics/fread">`fread()`</a>
to compare these functions. Here are the contents of this file:

``` r
id,"name",val
29192,"Robert Whitaker", 200
49301 ,"Elisa Waters,190  
```

The values in the file are separated by a comma. Note the unwanted
*spaces* between entries, and the imbalanced quote in the second row.

**Steps**

1.  Import the file `sample.csv` available in your workspace using
    `read.csv()`. Don’t modify the arguments.

``` r
# Import using read.csv()
csv_file <- read.csv("data/sample.csv", fill = NA, quote = "", 
                     stringsAsFactors = FALSE, strip.white = TRUE, 
                     header = TRUE)
```

    ## Warning in read.table(file = file, header = header, sep = sep, quote = quote, :
    ## incomplete final line found by readTableHeader on 'data/sample.csv'

``` r
csv_file
```

    ##      id           X.name. val
    ## 1 29192 "Robert Whitaker" 200
    ## 2 49301     "Elisa Waters 190

2.  Import the file `sample.csv` available in your workspace using
    `fread()`.

``` r
# Import using fread()
csv_file <- fread("data/sample.csv")
```

    ## Warning in fread("data/sample.csv"): Found and resolved improper quoting in
    ## first 100 rows. If the fields are not quoted (e.g. field separator does not
    ## appear within any field), try quote="" to avoid this warning.

``` r
csv_file
```

    ##       id            name val
    ## 1: 29192 Robert Whitaker 200
    ## 2: 49301   "Elisa Waters 190

Well done! `fread()` is not only fast but also makes things a lot easier
by guessing sensibly. Unlike the additional arguments which we provided
for `read.csv()`, `fread()` could handle importing the file by itself.
Also note the useful warning `fread()` provides.

## Importing selected columns

It’s time to practice importing *only a few columns* from a file as
opposed to importing the entire file. You will be importing the
following file:

``` r
id,name,val
29192,Robert Whitaker, 200
49301 ,Elisa Waters,190  
34456 , Karla Schmidt,458   
```

**Steps**

1.  Use `fread()`’s *select* argument to import only `"id"` and `"val"`
    columns.

``` r
# Select "id" and "val" columns
select_columns <- fread("data/sample2.csv", select = c("id", "val"))
select_columns
```

    ##       id val
    ## 1: 29192 200
    ## 2: 49301 190
    ## 3: 34456 458

2.  Use `fread()`’s *drop* argument to drop the `"val"` column.

``` r
# Drop the "val" column
drop_column <- fread("data/sample2.csv", drop = "val")
drop_column
```

    ##       id            name
    ## 1: 29192 Robert Whitaker
    ## 2: 49301    Elisa Waters
    ## 3: 34456   Karla Schmidt

Nice! So you know how to import only the *columns* you want. Can you now
import only the *rows* you want?

## Importing selected rows

It’s time to practice importing *only a few rows* from a file as opposed
to importing the entire file. You will be importing the following file:

``` r
id,"name",val
29192,"Robert Whitaker", 200
49301 ,"Elisa Waters,190  
34456 , Karla Schmidt,458  

END-OF-DATA
METADATA
attr;value
date;"2018-01-01"
data;"cash payment" 
```

Unfortunately, files like these *do* exist in real life.

**Steps**

1.  Import the file `sample.csv` using `fread()`.

``` r
# Import the file
entire_file <- fread("data/sample3.csv")
```

    ## Warning in fread("data/sample3.csv"): Found and resolved improper quoting in
    ## first 100 rows. If the fields are not quoted (e.g. field separator does not
    ## appear within any field), try quote="" to avoid this warning.

    ## Warning in fread("data/sample3.csv"): Stopped early on line 5. Expected 3 fields
    ## but found 0. Consider fill=TRUE and comment.char=. First discarded non-empty
    ## line: <<END-OF-DATA>>

``` r
entire_file
```

    ##       id            name val
    ## 1: 29192 Robert Whitaker 200
    ## 2: 49301   "Elisa Waters 190
    ## 3: 34456   Karla Schmidt 458

2.  Did you notice the second warning message? To avoid this message,
    import only the lines before `END-OF-DATA`.

``` r
# Import the file while avoiding the warning
only_data <- fread("data/sample3.csv", nrows = 3)
```

    ## Warning in fread("data/sample3.csv", nrows = 3): Found and resolved improper
    ## quoting in first 3 rows. If the fields are not quoted (e.g. field separator does
    ## not appear within any field), try quote="" to avoid this warning.

``` r
only_data
```

    ##       id            name val
    ## 1: 29192 Robert Whitaker 200
    ## 2: 49301   "Elisa Waters 190
    ## 3: 34456   Karla Schmidt 458

3.  Now import the data after the line `METADATA`. The first line is a
    header and the other two lines are the rows.

``` r
# Import only the metadata
only_metadata <- fread("data/sample3.csv", skip = 7)
only_metadata
```

    ##    attr        value
    ## 1: date   2018-01-01
    ## 2: data cash payment

Behold! You are not done witnessing the magic of `fread()`.

## Advanced file reading

Theory. Coming soon …

**1. Advanced file reading**

In this lesson, you will look at some of the more advanced features of
data table’s fread().

**2. Reading big integers using integer64 type**

R can only represent numbers less than or equal to 2^31 - 1 = 2147483647
as type “integer”. read dot csv automatically coerces numbers larger
than this to numeric type. This might not be appropriate in some cases.
data table therefore sets the type of such columns with large integer
values to “integer64” type by default using the bit64 package. It is
however possible to override the default with numeric or character types
if required using the colClasses argument.

**3. Specifying column class types with colClasses**

If you don’t want to rely on fread()’s default column guessing,
colClasses argument can be used to override the column types.colClasses
can be a named or unnamed vector of column classes similar to read dot
csv.

**4. Specifying column class types with colClasses**

If named, column classes are assigned to column names provided before
parsing. If unnamed, first column is parsed using the first class,
second with second class etc.

**5. Specifying column class types with colClasses**

In addition, you can also provide a named list of vectors where names
correspond to the column class and values correspond to the column names
or numbers. This is particularly useful when there are too many columns
with a limited number of column types. In this example, instead of
specifying “numeric” four times corresponding to the first four columns,
you can specify numeric = 1:4 to parse the first four columns as numeric
type.

**6. The fill argument**

When reading files with incomplete columns in a file, it is not always
possible to parse them unambiguously. The “fill” argument can be used in
these cases to explicitly direct fread() to fill the missing entries.In
the first example, you can see that fread() has some trouble reading the
data correctly. This is because fill is set to FALSE by default.

**7. The fill argument**

When you set fill to TRUE, fread() can parse the data properly and it
fills empty values with empty strings. Empty values for integer, logical
and numeric types are filled with NA.

**8. The na.strings argument**

Not all files encode missing values in the same way. You can use the
“na-dot-strings” argument to parse all such values as NAs.
na-dot-strings accepts a character vector of values that are replaced
with NAs. Since this is done while parsing, it is very memory efficient
as well as very fast.

**9. Let’s practice!**

Now it’s your turn to import more exotic files using fread().

## Reading large integers

When importing massive datasets, it may be desirable to import numbers
without decimals as integers since integers take up less space. Base R
functions (such as `read.csv()`, `read.table()`, etc.) do this by
default when the numbers are less than 2^31 - 1 (or 2147483647).
However, columns with numbers greater than this are imported as
`numeric` type by default.

If the `bit64` package is installed, `fread()` can import these columns
with huge numbers as the `integer64` type which is implemented in
`bit64` package, by default.

You will be importing the following file:

``` r
id,name,val
9002019291929192,Robert Whitaker, 200
9200129401349301 ,Elisa Waters,190  
9200149429834456 , Karla Schmidt,458 
```

**Steps**

1.  Import the `sample.csv` file using `fread()` and `read.csv()`.
2.  Print the class of the `id` columns in `fread_import` and
    `base_import`.

``` r
# Import the file using fread 
fread_import <- fread("data/sample4.csv")

# Import the file using read.csv 
base_import <- read.csv("data/sample4.csv")
```

    ## Warning in read.table(file = file, header = header, sep = sep, quote = quote, :
    ## incomplete final line found by readTableHeader on 'data/sample4.csv'

``` r
# Check the class of id column
class(fread_import$id)
```

    ## [1] "integer64"

``` r
class(base_import$id)
```

    ## [1] "numeric"

Well done! Whenever possible, you should import your data as integers,
especially when your data is big. Doing so results in saving memory in
your RAM.

## Specifying column classes

The `colClasses` argument of `fread()` allows you to explicitly specify
the class of the columns. You can specify the class of the columns as a
character vector (as is done in base R functions such as `read.csv()`):

``` r
colClasses = c("integer", rep("factor", 3), "character")
```

However, this format requires you to specify the classes of *all*
columns. This can be problematic if the file contains several columns
and you only want to explicitly specify classes for some columns and
leave the rest as default. You can use a more convenient list format for
this purpose:

``` r
colClasses = list(factor = 2:4)
```

Here, the columns two through four are imported as factors and the rest
are imported using `fread()`’s defaults.

**Steps**

1.  Import the `sample.csv` file using `read.csv()` and print the
    `str`ucture of `base_r_defaults`. Notice the column classes.

``` r
# Import using read.csv with defaults
base_r_defaults <- read.csv("data/sample5.csv")
str(base_r_defaults)
```

    ## 'data.frame':    2 obs. of  10 variables:
    ##  $ c1  : chr  "aa" "ff"
    ##  $ c2  : chr  "bb" "gg"
    ##  $ c3  : chr  "cc" "hh"
    ##  $ c3.1: chr  "dd" "ii"
    ##  $ c5  : chr  "ee" "jj"
    ##  $ n1  : int  1 6
    ##  $ n2  : int  2 7
    ##  $ n3  : int  3 8
    ##  $ n4  : int  4 9
    ##  $ n5  : int  5 10

2.  Import the same file, but explicitly specify the column types. The
    first four columns should be imported as `"factor"`s, followed by
    `"character"`, `"integer"`, and then four `"numeric"` columns.

``` r
# Import using read.csv
base_r <- read.csv("data/sample5.csv", 
                   colClasses = c(rep("factor", 4), 
                                  "character", "integer", 
                                  rep("numeric", 4)))
str(base_r)
```

    ## 'data.frame':    2 obs. of  10 variables:
    ##  $ c1  : Factor w/ 2 levels "aa","ff": 1 2
    ##  $ c2  : Factor w/ 2 levels "bb","gg": 1 2
    ##  $ c3  : Factor w/ 2 levels "cc","hh": 1 2
    ##  $ c3.1: Factor w/ 2 levels "dd","ii": 1 2
    ##  $ c5  : chr  "ee" "jj"
    ##  $ n1  : int  1 6
    ##  $ n2  : num  2 7
    ##  $ n3  : num  3 8
    ##  $ n4  : num  4 9
    ##  $ n5  : num  5 10

3.  Use `fread()` to import the same file. Import columns 1 through 4 as
    factors, and columns 7 through 10 as numeric.

``` r
# Import using fread
import_fread <- fread("data/sample5.csv", 
                      colClasses = list(factor = 1:4, numeric = 7:10))
str(import_fread)
```

    ## Classes 'data.table' and 'data.frame':   2 obs. of  10 variables:
    ##  $ c1  : Factor w/ 2 levels "aa","ff": 1 2
    ##  $ c2  : Factor w/ 2 levels "bb","gg": 1 2
    ##  $ c3  : Factor w/ 2 levels "cc","hh": 1 2
    ##  $ c3.1: Factor w/ 2 levels "dd","ii": 1 2
    ##  $ c5  : chr  "ee" "jj"
    ##  $ n1  : int  1 6
    ##  $ n2  : num  2 7
    ##  $ n3  : num  3 8
    ##  $ n4  : num  4 9
    ##  $ n5  : num  5 10
    ##  - attr(*, ".internal.selfref")=<externalptr>

See how convenient it is to expliclity specify column classes?

## Dealing with empty and incomplete lines

When reading irregular files, i.e., files with varying/missing fields in
rows, `fread()` tries to parse them intelligently. However, it may not
be always possible to guess if the irregular lines should be skipped or
imported by filling missing fields. For such cases, you can use the
`fill` argument of `fread()`.

You will be importing the following file:

``` r
id,name,val
9002019291929192,Robert Whitaker,
9200129401349301 ,Elisa Waters,190  
9200149429834456 , Karla Schmidt  
```

Notice that the first and last lines are incomplete.

**Steps**

1.  Import the `sample.csv` file using `fread()` without any additional
    arguments. *Notice the warning it generates.*

``` r
# Import the file and note the warning message
incorrect <- fread("data/sample6.csv")
```

    ## Warning in fread("data/sample6.csv"): Discarded single-line footer:
    ## <<9200149429834456 , Karla Schmidt >>

``` r
incorrect
```

    ##                  id            name val
    ## 1: 9002019291929192 Robert Whitaker  NA
    ## 2: 9200129401349301    Elisa Waters 190

2.  Did you notice the warning message? `fread()` considered the last
    line as a footer and discarded it. Import the file (`sample.csv`)
    using `fread()` again, but this time, use the `fill` argument to
    ensure all rows are imported correctly.

``` r
# Import the file correctly
correct <- fread("data/sample6.csv", fill = TRUE)
correct
```

    ##                  id            name val
    ## 1: 9002019291929192 Robert Whitaker  NA
    ## 2: 9200129401349301    Elisa Waters 190
    ## 3: 9200149429834456   Karla Schmidt  NA

Well done! These issues are common when dealing with real-world data.

## Dealing with missing values

Missing values are often encoded differently. In some files, -9999 mean
missing values and in others, they may be encoded as `#$##`. You can use
the `na.strings` argument to tell `fread()` which values should be
treated as missing values.

You will be importing the following file:

``` r
id,name,val1,val2
9002019291929192,Robert Whitaker,,44
9200129401349301 ,Elisa Waters,289,##
9200149429834456 , Karla Schmidt,458,29
```

*The missing values are encoded as `"##"`. Note that `fread()` handles
an empty field `,,` by default as `NA`.*

**Steps**

1.  Import the file `sample.csv` properly to ensure that `"##"` is
    treated as a missing values and is imported as `NA`.

``` r
# Import the file using na.strings
missing_values <- fread("data/sample7.csv", na.strings = "##")
missing_values
```

    ##                  id            name val1 val2
    ## 1: 9002019291929192 Robert Whitaker   NA   44
    ## 2: 9200129401349301    Elisa Waters  289   NA
    ## 3: 9200149429834456   Karla Schmidt  458   29

Good job! Handling missing values is one of the most important steps in
ensuring your data is well prepared.

## Fast data writing with fwrite()

Theory. Coming soon …

**1. Fast data writing with fwrite()**

In this final lesson of the course, you will look at data table’s
high-performance parallel file writer, fwrite().

**2. fwrite**

Similar to fread(), fwrite() is a fast and parallel file WRITER. By
default, it uses all available threads to write to file. You can control
the number of threads to use using the “nThread” argument.fwrite()
provides intelligent defaults so that in most cases, only the data and
file name arguments are required. It also has the ability to write
columns of type “list” by flattening the list column with a secondary
separator which is the symbol for the OR operator (“\|”) by default.

**3. date and datetime columns (ISO)**

fwrite() also provides multiple ways to write date and datetime columns
using the argument “dateTimeAs” which defaults to the ISO format. This
results in representing datetime values in international standard
thereby avoiding ambiguity while writing to or reading back from file.

**4. Date and times**

Let’s use this data table dt to look at these formats. Note that each
column is a different type, date, time, and datetime. The as dot IDate()
and as dot ITime() functions from data table extract the relevant
portions from the timestamp.

**5. date and datetime columns (ISO)**

Have a look at the “datetime” column that is being read back using
fread(). This is exactly the way fwrite() wrote the column to file. Also
note that writing in ISO format not only avoids ambiguity but is also
extremely fast to write to file.

**6. date and datetime columns (Squash)**

You can also set the dateTimeAs argument to “squash” which, as the name
suggests, squashes the values together. This results in removing the
hyphen (-) and colon (:) separators. Thus, the columns are read back by
default as integers.

**7. date and datetime columns (Squash)**

This is particularly useful for columns whose primary purpose is to
allow for extraction of year, month, date, hour, minute, seconds etc.
which is quite useful in grouping operations. For example, using integer
division as shown here, you can extract the year very efficiently.

**8. date and datetime columns (Epoch)**

You can also set the dateTimeAs argument to “epoch” which counts the
number of days or seconds since the relevant epoch which is Jan 1, 1970,
midnight, and Jan 1, 1970 midnight for date, time and datetime,
respectively. dates, times, datetimes lesser than these respective
epochs would have negative values.The options “iso”, “squash” and
“epoch” are all extremely fast due to specialized C code and are
extensively tested for correctness and also allow for unambiguous and
fast reading of those columns.

**9. date and datetime columns (Epoch)**

As you can see here, when you write to a file by setting dateTimeAs to
“epoch” and read it back the columns are integers denoting the number of
days and seconds from the respective epoch.

**10. Let’s practice!**

Go ahead and use fwrite() to write data to files.

## Writing files to disk

`fwrite()` is a parallel file writer, and like `fread()`, it also has
intelligent defaults.

For example, print `dt` in your console and notice that the column
`name` has the first and last names separated with a `,` and the column
`val` is of type `list`. `fwrite()` can automatically quote `name`
column and add a secondary separator (the symbol for OR operator, `|`)
for the list column.

**Steps**

1.  Write `dt` to disk using the file name `"fwrite.txt"`.
2.  Import the file using `readLines()` to verify that the `name` column
    is quoted automatically and the list column is separated with `|`.
3.  Import the file using `fread()`.

``` r
# read data
dt <- readRDS("data/dt.rds")

# Write dt to fwrite.txt
fwrite(dt, "data/fwrite.txt")

# Import the file using readLines()
readLines("data/fwrite.txt")
```

    ## [1] "id,name,vals"                        
    ## [2] "29192,\"Robert, Withaker\",144|48|32"
    ## [3] "49301,\"Elisa, Waters\",22|289"      
    ## [4] "34456,\"Karla, Schmidt\",458"

``` r
# Import the file using fread()
fread("data/fwrite.txt")
```

    ##       id             name      vals
    ## 1: 29192 Robert, Withaker 144|48|32
    ## 2: 49301    Elisa, Waters    22|289
    ## 3: 34456   Karla, Schmidt       458

Good! Being able to write list columns to file and reading them back
properly is a very handy feature of `fwrite()`.

## Writing date and time columns

`fwrite()` provides several fast and consistent ways of writing `date`
and `datetime` columns to files using the `dateTimeAs` argument. In
order for you to clearly understand how this works, you will be working
`batrips_dates`, which consists of two columns and five rows:

``` r
            start_date            end_date
1: 2014-01-01 00:14:00 2014-01-01 00:21:00
2: 2014-01-01 00:14:00 2014-01-01 00:21:00
3: 2014-01-01 00:17:00 2014-01-01 00:42:00
4: 2014-01-01 00:23:00 2014-01-01 00:50:00
5: 2014-01-01 00:23:00 2014-01-01 00:50:00
```

**Steps**

1.  Write the `batrips_dates` to `"iso.txt"` file using the `"ISO"`
    format.
2.  Import the file back using `fread()` and print it to understand how
    the `datetime` columns were written to file.

``` r
# read data
batrips_dates <- readRDS("data/batrips_dates.rds")

# Write batrips_dates to file using "ISO" format
fwrite(batrips_dates, "data/iso.txt", dateTimeAs = "ISO")

# Import the file back
iso <- fread("data/iso.txt")
iso
```

    ##             start_date            end_date
    ## 1: 2013-12-31 23:14:00 2013-12-31 23:21:00
    ## 2: 2013-12-31 23:14:00 2013-12-31 23:21:00
    ## 3: 2013-12-31 23:17:00 2013-12-31 23:42:00
    ## 4: 2013-12-31 23:23:00 2013-12-31 23:50:00
    ## 5: 2013-12-31 23:23:00 2013-12-31 23:50:00

3.  Write `batrips_dates` to `"squash.txt"` file using the `"squash"`
    format.

``` r
# Write batrips_dates to file using "squash" format
fwrite(batrips_dates, "data/squash.txt", dateTimeAs = "squash")

# Import the file back
squash <- fread("data/squash.txt")
squash
```

    ##           start_date          end_date
    ## 1: 20131231231400000 20131231232100000
    ## 2: 20131231231400000 20131231232100000
    ## 3: 20131231231700000 20131231234200000
    ## 4: 20131231232300000 20131231235000000
    ## 5: 20131231232300000 20131231235000000

4.  Write the `batrips_dates` to `"epoch.txt"` file using the `"epoch"`
    format.

``` r
# Write batrips_dates to file using "epoch" format
fwrite(batrips_dates, "data/epoch.txt", dateTimeAs = "epoch")

# Import the file back
epoch <- fread("data/epoch.txt")
epoch
```

    ##    start_date   end_date
    ## 1: 1388531640 1388532060
    ## 2: 1388531640 1388532060
    ## 3: 1388531820 1388533320
    ## 4: 1388532180 1388533800
    ## 5: 1388532180 1388533800

You are superb! Dates and Datetimes are very common in Data Science and
require proper handling.

## Fast writing to disk

As mentioned in the video, `fwrite()` writes data to disk is very fast!
Also, just like `fread()` reads data in parallel, `fwrite()` also writes
to file in `parallel`. The number of threads to write data to disk can
be controlled using `nThread` argument.

**Steps**

1.  Write `batrips` to file using base R’s `write.table()`.
2.  Wrap the call inside `system.time()` to see how long this operation
    takes.

``` r
# Use write.table() to write batrips
system.time(write.table(batrips, "data/base-r.txt"))
```

    ##    user  system elapsed 
    ##   3.691   0.139   3.859

3.  Write `batrips` to file using `data.table`’s `fwrite()`.
4.  Wrap the call inside `system.time()` to see how long this operation
    takes.

``` r
# Use fwrite() to write batrips
system.time(fwrite(batrips, "data/data-table.txt"))
```

    ##    user  system elapsed 
    ##   0.232   0.028   0.065

You are sensational! Congratulations on completing this introductory
course on `data.table`!
