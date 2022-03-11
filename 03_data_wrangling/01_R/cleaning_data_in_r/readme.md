Cleaning data in R
================
Joschka Schwarz

-   [1. Common Data Problems](#1-common-data-problems)
    -   [Data type constraints](#data-type-constraints)
    -   [Common data types](#common-data-types)
    -   [Time and Date Classes](#time-and-date-classes)
    -   [Converting data types](#converting-data-types)
    -   [Trimming strings](#trimming-strings)
    -   [Constraints](#constraints)
-   [2. Categorical and Text Data](#2-categorical-and-text-data)
    -   [Checking membership](#checking-membership)
    -   [Membership constraints](#membership-constraints)
    -   [Categorical data problems](#categorical-data-problems)
    -   [Identifying inconsistent categorical
        data](#identifying-inconsistent-categorical-data)
    -   [Correcting inconsistent categorical
        data](#correcting-inconsistent-categorical-data)
    -   [Cleaning text data](#cleaning-text-data)
    -   [Detecting inconsistent text
        data](#detecting-inconsistent-text-data)
    -   [Correcting inconsistent text
        data](#correcting-inconsistent-text-data)
    -   [Uniformity](#uniformity)
    -   [Cross field validation](#cross-field-validation)
    -   [Completeness](#completeness)
-   [3. Record Linkage](#3-record-linkage)
    -   [Comparing strings](#comparing-strings)
    -   [stringdist(): Calculating
        distance](#stringdist-calculating-distance)
    -   [fuzzyjoin(): Fixing typos with string
        distance](#fuzzyjoin-fixing-typos-with-string-distance)
    -   [Generating and comparing
        pairs](#generating-and-comparing-pairs)
    -   [reclin: Linking records with Pair
        Blocking](#reclin-linking-records-with-pair-blocking)
    -   [Scoring and linking](#scoring-and-linking)
    -   [Congratulations!](#congratulations)

**Short Description**

Develop the skills you need to go from raw data to awesome insights as
quickly and accurately as possible.

**Long Description**

It’s commonly said that data scientists spend 80% of their time cleaning
and manipulating data and only 20% of their time analyzing it. The time
spent cleaning is vital since analyzing dirty data can lead you to draw
inaccurate conclusions.

In this section, you’ll learn how to clean dirty data. Using R, you’ll
learn how to identify values that don’t look right and fix dirty data by
converting data types, filling in missing values, and using fuzzy string
matching. As you learn, you’ll brush up on your skills by working with
real-world datasets, including bike-share trips, customer asset
portfolios, and restaurant reviews—developing the skills you need to go
from raw data to awesome insights as quickly and accurately as possible!

# 1. Common Data Problems

In this part, you’ll learn how to overcome some of the most common dirty
data problems. You’ll convert data types, apply range constraints to
remove future data points, and remove duplicated data points to avoid
double-counting.

## Data type constraints

Theory. Coming soon …

**1. Data type constraints**

Hi and welcome to the course. My name is Maggie, and I’ll be guiding you
as you learn how to clean data in R.

**2. Course outline**

In this course, you’ll learn how to diagnose and locate different
problems in your data and how they can can come up during your workflow.

**3. Course outline**

You’ll also learn about what can go wrong if your data isn’t properly
cleaned,

**4. Course outline**

and how to address different types of dirty data.

**5. Course outline**

In this chapter, we’ll discuss the most common problems you might
encounter and how to address them. Let’s get started!

**6. Why do we need clean data?**

To understand why we need clean data, let’s take a look at the data
science workflow.In a typical data science workflow, we usually access
raw data first, explore and process it, then develop insights. Finally,
we report these insights.

**7. Why do we need clean data?**

Dirty data can appear before we even access the data, due to mistakes
such as typos and misspellings.

**8. Why do we need clean data?**

If we don’t address these mistakes early on, they’ll follow us through
our entire workflow, which means we could end up drawing incorrect
conclusions.

**9. Data type constraints**

You’ve probably encountered different types of data before, such as
text, numbers, categories, and dates. Each of these data types is
treated differently, so if each variable isn’t the correct data type, we
risk compromising our analysis.

**10. Glimpsing at data types**

Let’s look at an example. Here’s a data frame containing revenue
generated and quantity of items sold for different sales orders.To look
at the data types of each column in “sales”, we can load the dplyr
package and use glimpse. This gives us the data type for each column.
The order ID and quantity have data type “dbl” or double, which is the
same thing as numeric - double is just a way of specifying how many
decimal places the number can have. However, the revenue column has the
data type character, when it should be numeric.

**11. Checking data types**

We can use the is-dot-numeric function on the revenue column and see
that it’s not numeric.Another way to do this check is to use the
assert_is_numeric function from the assertive package. This provides
extra protection because it will throw an error and stop our script from
running, so we’ll immediately know that something’s amiss.If we call
assert_is_numeric on something that is numeric, nothing is returned.

**12. Checking data types**

All data types have an is-dot function that returns TRUE or FALSE and an
assert-is function that returns nothing or an error.

**13. Why does data type matter?**

We can use the class function on the revenue column to see that it’s a
character type.If we want to know what the average revenue is, we get an
NA and a warning, since taking the mean of text doesn’t make much sense.
This is why it’s important to check that our data types are what we
expect. Otherwise, we might think we’re getting one thing, in this case
an average, when we’re actually getting something completely different,
which is an NA. We’ll need to convert this column to a numeric type in
order to get the average.

**14. Comma problems**

Printing revenue shows a comma in each number. We’ll need to remove them
before converting the strings to numbers.

**15. Character to number**

This can be done using str_remove from the stringr package. The first
argument is the string that we want to remove from, which is the revenue
column. The second argument is what we want to remove, the comma. If we
look at revenue_trimmed, all the commas are gone!To convert
revenue_trimmed to a numeric type, we pass it into as-dot-numeric.

**16. Putting it together**

We can put it all together into the sales data frame by calling mutate.
We create a new column called revenue_usd using str_remove and
as-dot-numeric.

**17. Same function, different outcomes**

Now, taking the mean of revenue_usd gives us the average revenue,
instead of the NA that we got earlier.

**18. Converting data types**

Just like the is-dot and assert-is functions, there are as-dot functions
to convert to any data type.

**19. Watch out: factor to numeric**

Be careful when converting a factor to a numeric. Factors are a data
type that represent a limited set of possible categories. Here, we have
a product_type vector, which is a factor. 1000 represents clothing, 2000
represents food, and 3000 represents electronics.If we call as-numeric
on product_type, we get these numbers, which isn’t what we’re looking
for. This is due to the way that factors are encoded in R. Instead, we
need to use as-character first, and then as-numeric.

**20. Let’s practice!**

Time to use your new knowledge of data types!

## Common data types

Since different data types are treated and act differently, it’s
important to be able to identify the data type that’s most suitable for
the data you’re working with. Here, you’ll learn match different data
with the data type that makes the data easiest to process and extract
insights from.

| Data type | Example                               | R Data type |
|-----------|---------------------------------------|-------------|
| Text      | First name, Last name, address, …     | `character` |
| Integer   | Subscriber Count, \# Products sold, … | `integer`   |
| Decimal   | Temperature, exchange rate, …         | `numeric`   |
| Binary    | Is married, new customer, yes/no, …   | `logical`   |
| Category  | Marriage status, color, …             | `factor`    |
| Date      | Order dates, date of birth, …         | `date`      |

The data types `raw` and `complex` will not be discussed in this
section.

------------------------------------------------------------------------

## Time and Date Classes

There are a variety of different types specific to time data fields in
R.

**Date**

The `as.Date()` format doesn’t store any time information. When we use
the `as.Date()` method to convert a date stored as a character class to
an R date class, it will ignore all values after the date string.

``` r
help(DateTimeClasses)
# Convert character data to date (no time) 
d <- as.Date("2020-01-01 10:15")   
d
#> [1] "2020-01-01"
class(d)
#> [1] "Date"
# to see the data in the 'raw' format, i.e., not formatted according to the class type to show us a date we recognize, use the `unclass()` function.
unclass(d)
#> [1] 18262
typeof(d)
#> [1] "double"
```

<sup>Created on 2022-02-27 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

Internally, `Date` objects are stored as the number of days since
January 1, 1970, using negative numbers for earlier dates. The
`as.numeric()` / `unclass()` function can be used to convert a `Date`
object to its internal form.

> Data Tip: The `unclass()` method in R allows you to view how a
> particular R object is stored.

If we have a column containing both date and time we need to use a class
that stores both date AND time. Base R offers two closely related
classes for date and time: `POSIXct` and `POSIXlt`. To get the current
time, the `Sys.time()` can be used, and you can play around a bit with
the basic types to get a feel for what R is doing. The `as.POSIXct()`
and `as.POSIXlt()` commands are used to convert the time value into the
different formats.

**POSIXct**

The `as.POSIXct()` method converts a date-time string into a `POSIXct`
class. `as.POSIXct()` stores both a date and time with an associated
time zone. The default time zone selected, is the time zone that your
computer is set to which is most often your local time zone. If you do
not use a timezone specifically, `POSIXct` and `POSIXlt` will reference
to your local timezone. However, this is not entirely reliable. It will
not display the timezone in the output string. If you do want to avoid
ambiguous behaviour, you have to specifiy a time zone.

`POSIXct` stores date and time in seconds with the number of seconds
beginning at 1 January 1970. Negative numbers are used to store dates
prior to 1970. Thus, the `POSIXct` format stores each date and time a
single value in units of seconds. Storing the data this way, optimizes
use in data.frames and speeds up computation, processing and conversion
to other formats.

``` r
t <- Sys.time()
t
#> [1] "2022-02-27 12:02:23 CET"
class(t)
#> [1] "POSIXct" "POSIXt"
unclass(t)
#> [1] 1645959743
typeof(t)
#> [1] "double"

attr(t, "tzone")
#> NULL
attr(t, "tzone") <- "CET"
unclass(t)
#> [1] 1645959743
#> attr(,"tzone")
#> [1] "CET"
```

<sup>Created on 2022-02-27 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

**POSIXlt**

When we convert the data to `POSIXlt`, and view it in R, it still looks
similar to the `POSIXct` format. However, `unclass()` shows us that the
data are stored differently. The `POSIXlt` class stores the data
separately in a list. The entries have the following meanings:

-   seconds
-   minutes
-   hours
-   day of month (1-31)
-   month of the year (0-11)
-   years since 1900
-   day of the week (0-6 where 0 represents Sunday)
-   day of the year (0-365)
-   Daylight savings indicator (positive if it is daylight savings)

``` r
l <- as.POSIXlt(Sys.time())
unclass(l)
#> $sec
#> [1] 53.80329
#> 
#> $min
#> [1] 8
#> 
#> $hour
#> [1] 12
#> 
#> $mday
#> [1] 27
#> 
#> $mon
#> [1] 1
#> 
#> $year
#> [1] 122
#> 
#> $wday
#> [1] 0
#> 
#> $yday
#> [1] 57
#> 
#> $isdst
#> [1] 0
#> 
#> $zone
#> [1] "CET"
#> 
#> $gmtoff
#> [1] 3600
#> 
#> attr(,"tzone")
#> [1] ""     "CET"  "CEST"
```

<sup>Created on 2022-02-27 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

Part of the difficulty with time data types is that R prints them out in
a way that is different from how it stores them internally. This can
make type conversions tricky, and you have to be careful and test your
operations to insure that R is doing what you think it is doing.

------------------------------------------------------------------------

### Checking data types

| **Logical checking** - returns `TRUE` / `FALSE` | `assertive` checking - error when `FALSE` |
|-------------------------------------------------|-------------------------------------------|
| `is.character()`                                | `assert_is_character()`                   |
| `is.numeric()`                                  | `assert_is_numeric()`                     |
| `is.logical()`                                  | `assert_is_logical()`                     |
| `is.factor()`                                   | `assert_is_factor()`                      |
| `is.date()`                                     | `assert_is_date()`                        |
| …                                               | …                                         |

Alternatively, you can use Hadley Wickham’s `assertthat` package:

``` r
x <- 1:10

# Using base r
stopifnot(is.character(x))
#> Error: is.character(x) is not TRUE

# Using assertthat
library(assertthat)
assert_that(is.character(x))
#> Error: x is not a character vector
assert_that(length(x) == 5)
#> Error: length(x) not equal to 5
assert_that(is.numeric(x))
#> [1] TRUE
```

<sup>Created on 2022-02-26 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

## Converting data types

**Data**

-   `bike_share_rides`

Throughout this section, we’ll be working with San Francisco bike share
ride data called `bike_share_rides`. It contains information on start
and end stations of each trip, the trip duration, and some user
information.

**Packages**

-   <code><a href="http://dplyr.tidyverse.org">dplyr</a></code>
-   <code><a href="https://github.com/cran/assertive">assertive</a></code>
    -   <code><a href="https://github.com/hadley/assertthat">assertthat</a></code>
-   <code><a href="http://forcats.tidyverse.org">forcats</a></code>
-   <code><a href="http://tibble.tidyverse.org">tibble</a></code>

**Steps**

Before beginning to analyze any dataset, it’s important to take a look
at the different types of columns we’ll be working with, which we can do
using `glimpse()`.

At first, we’ll take a look at the data types contained in
`bike_share_rides` and see how an incorrect data type can flaw your
analysis.

1.  Examine the data types of the columns of `bike_share_rides`.

``` r
# Libraries
library(tibble)
library(dplyr)
library(assertive)

# 1. Load & glimpse at bike_share_rides
bike_share_rides <- readRDS("data/bike_share_rides.rds")
glimpse(bike_share_rides)
```

    ## Rows: 35,229
    ## Columns: 10
    ## $ ride_id         <int> 52797, 54540, 87695, 45619, 70832, 96135, 29928, 83331…
    ## $ date            <chr> "2017-04-15", "2017-04-19", "2017-04-14", "2017-04-03"…
    ## $ duration        <chr> "1316.15 minutes", "8.13 minutes", "24.85 minutes", "6…
    ## $ station_A_id    <dbl> 67, 21, 16, 58, 16, 6, 5, 16, 5, 81, 30, 16, 16, 67, 2…
    ## $ station_A_name  <chr> "San Francisco Caltrain Station 2  (Townsend St at 4th…
    ## $ station_B_id    <dbl> 89, 64, 355, 368, 81, 66, 350, 91, 62, 81, 109, 10, 80…
    ## $ station_B_name  <chr> "Division St at Potrero Ave", "5th St at Brannan St", …
    ## $ bike_id         <dbl> 1974, 860, 2263, 1417, 507, 75, 388, 239, 1449, 3289, …
    ## $ user_gender     <chr> "Male", "Male", "Male", "Male", "Male", "Male", "Male"…
    ## $ user_birth_year <dbl> 1972, 1986, 1993, 1981, 1981, 1988, 1993, 1996, 1993, …

2.  Get a summary of the `user_birth_year` column of `bike_share_rides`.

``` r
# 2. Summary of user_birth_year
summary(bike_share_rides$user_birth_year)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    1900    1979    1986    1984    1991    2001

> ## *Question*
>
> The summary statistics of <code>user_birth_year</code> don’t seem to
> offer much useful information about the different birth years in our
> dataset. Why do you think that is?<br> <br> ⬜ The
> <code>user_birth_year</code> column is not of the correct type and
> should be converted to a character.<br> ⬜ The
> <code>user_birth_year</code> column has an infinite set of possible
> values and should be converted to a factor.<br> ✅ The
> <code>user_birth_year</code> column represents groupings of data and
> should be converted to a factor.<br>

3.  Add a new column to `bike_share_rides` called `user_birth_year_fct`,
    which contains `user_birth_year`, converted to a factor.
4.  Assert that the `user_birth_year_fct` is a factor to confirm the
    conversion.

``` r
# Libraries
library(forcats)

# 3. Convert user_birth_year to factor: user_birth_year_fct
bike_share_rides <- bike_share_rides %>%
  mutate(user_birth_year_fct = as_factor(user_birth_year))

# 4. Assert user_birth_year_fct is a factor
assert_is_factor(bike_share_rides$user_birth_year_fct)

# Summary of user_birth_year_fct
summary(bike_share_rides$user_birth_year_fct)
```

    ## 1900 1902 1923 1931 1938 1939 1941 1942 1943 1945 1946 1947 1948 1949 1950 1951 
    ##    1    7    2   23    2    1    3   10    4   16    5   24    9   30   37   25 
    ## 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 
    ##   70   49   65   66  112   62  156   99  196  161  256  237  245  349  225  363 
    ## 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 
    ##  365  331  370  548  529  527  563  601  481  541  775  876  825 1016 1056 1262 
    ## 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 
    ## 1157 1318 1606 1672 2135 1872 2062 1582 1703 1498 1476 1185  813  358  365  348 
    ## 2000 2001 
    ##  473   30

Looking at the new summary statistics, more riders were born in `1988`
than any other year.

## Trimming strings

In the previous steps, you were able to identify the correct data type
and convert `user_birth_year` to the correct type, allowing you to
extract counts that gave you a bit more insight into the dataset.

Another common dirty data problem is having extra bits like percent
signs or periods in numbers, causing them to be read in as `character`s.
In order to be able to crunch these numbers, the extra bits need to be
removed and the numbers need to be converted from `character` to
`numeric`. In this section, you’ll need to convert the `duration` column
from `character` to `numeric`, but before this can happen, the word
`"minutes"` needs to be removed from each value.

**Packages**

-   <code><a href="https://stringr.tidyverse.org">stringr</a></code>

**Comments**

-   `stringr` functions uses ***regular expression***
-   A ***regular expression*** is a sequence of characters that allows
    for robust searching within a string
-   Certain characters are treated differently in a regular expression:
    -   `(`,`)`,`[`,`]`, `$`, `.`, `+`, `*`, and others
-   Searching for these characters requires usind `fixed()`:
    -   `str_detect(column, fixed("$"))`

**Steps:**

1.  Use `str_remove()` to remove `"minutes"` from the `duration` column
    of `bike_share_rides`. Add this as a new column called
    `duration_trimmed`.
2.  Convert the `duration_trimmed` column to a numeric type and add this
    as a new column called `duration_mins`.
3.  Glimpse at `bike_share_rides`

``` r
# Libraries
library(stringr)

# 1. & 2.
bike_share_rides <- bike_share_rides |> 
  # Remove 'minutes' from duration: duration_trimmed
  mutate(duration_trimmed = duration |> str_remove(" minutes"),
         # Convert duration_trimmed to numeric: duration_mins
         duration_mins = duration_trimmed |> as.numeric())

# 3. Glimpse at bike_share_rides
bike_share_rides %>% glimpse()
```

    ## Rows: 35,229
    ## Columns: 13
    ## $ ride_id             <int> 52797, 54540, 87695, 45619, 70832, 96135, 29928, 8…
    ## $ date                <chr> "2017-04-15", "2017-04-19", "2017-04-14", "2017-04…
    ## $ duration            <chr> "1316.15 minutes", "8.13 minutes", "24.85 minutes"…
    ## $ station_A_id        <dbl> 67, 21, 16, 58, 16, 6, 5, 16, 5, 81, 30, 16, 16, 6…
    ## $ station_A_name      <chr> "San Francisco Caltrain Station 2  (Townsend St at…
    ## $ station_B_id        <dbl> 89, 64, 355, 368, 81, 66, 350, 91, 62, 81, 109, 10…
    ## $ station_B_name      <chr> "Division St at Potrero Ave", "5th St at Brannan S…
    ## $ bike_id             <dbl> 1974, 860, 2263, 1417, 507, 75, 388, 239, 1449, 32…
    ## $ user_gender         <chr> "Male", "Male", "Male", "Male", "Male", "Male", "M…
    ## $ user_birth_year     <dbl> 1972, 1986, 1993, 1981, 1981, 1988, 1993, 1996, 19…
    ## $ user_birth_year_fct <fct> 1972, 1986, 1993, 1981, 1981, 1988, 1993, 1996, 19…
    ## $ duration_trimmed    <chr> "1316.15", "8.13", "24.85", "6.35", "9.8", "17.47"…
    ## $ duration_mins       <dbl> 1316.15, 8.13, 24.85, 6.35, 9.80, 17.47, 16.52, 14…

> ## *Alternatives*
>
> <ul>
> <li>
> Instead of removing characters, you can also just extract the digits
> (including grouping and decimal marks) with a regex
> <code>stringr::str_extract(“\[\\d\\.\]\*“)</code>
> </li>
> <li>
> Regex Cheatsheets:
> <ul>
> <li>
> <a href="https://devhints.io/regexp">devhints.io</a>
> </li>
> <li>
> <a href="https://github.com/rstudio/cheatsheets/blob/main/strings.pdf"><code>stringr</code>
> cheatsheet</a>
> </li>
> </ul>
> <li>
> The function <code>readr::parse_number()</code> does everything in one
> step.
> </li>
> </ul>

4.  Assert that the `duration_mins` column is `numeric`.
5.  Calculate the mean of `duration_mins`.

``` r
# 4. Assert duration_mins is numeric
assert_is_numeric(bike_share_rides$duration_mins)

# 5. Calculate mean duration
mean(bike_share_rides$duration_mins)
```

    ## [1] 13.06214

Great work! By removing characters and converting to a numeric type, you
were able to figure out that the average ride duration is about 13
minutes - not bad for a city like San Francisco!

## Constraints

### Range constraints

Theory. Coming soon …

**1. Range constraints**

Now that we’ve discussed data type constraints, let’s talk about another
type of constraint: range constraints.

**2. What’s an out of range value?**

Many variables have some range that you can reasonably expect all of the
data points to fall within. For example, the college entrance test in
the US is scored between 400 and 1600, so there shouldn’t be any scores
below 400 or above 1600. Other examples are the weight of a package,
which can’t be negative, or heart rate, which is expected to be between
60 and 100 beats per minute in most adults.Since we know what these
reasonable ranges are, we know that there’s something off if we see an
SAT score of 2000 or a weight of -5 pounds in our dataset.

**3. Finding out of range values**

Let’s say we’re given some data containing movie ratings. Movies are
rated using a five-star system, so all ratings should fall between 0 and
5.

**4. Finding out of range values**

To see if there’s any data that’s clearly out of range, we can create a
histogram.We’ll create a vector called breaks, which contains the
minimum rating, then 0, the bottom of the expected range, then 5, the
top of the expected range, then the maximum rating. We’ll create a
histogram of avg_rating using geom_histogram, setting the breaks
argument to the breaks vector we just created.We end up with a histogram
broken up into 3 groups: too low, in range, and too high. We can easily
see now that there’s one value below 0 and two values above 5 in our
dataset.

**5. Finding out of range values**

We can also use the assert_all_are_in_closed_range function, which takes
in a lower value and an upper value. It will give an error if anything
falls outside of the specified range.

**6. Handling out of range values**

Once we identify that there are values out of range, how do we deal with
them? We could remove those data points completely, but this should only
be done when only a small proportion of the values are out of range,
otherwise, we would significantly increase the amount of bias in our
dataset. We could also treat each out of range value as missing, or
replace it with `NA`. This allows us to use different imputation
techniques for missing data, which we’ll discuss in more detail later in
the course.We can also replace out of range values with the range limit.
For example, if we know our ratings should fall between 0 and 5 and
there’s a value of 6, we can replace the 6 with 5 so that it’s in
range.Finally, we can replace the values with some other number based on
our knowledge of the dataset. For example, we could replace them with
the average rating of all movies.

**7. Removing rows**

To remove out of range rows, we can use the filter function to get all
the rows with values that fall into the range. In this case, we want all
the ratings greater than or equal to 0 and less than or equal to 5,
which will eliminate the rows that have an out of range rating.If we
create a histogram of avg_rating now, we can see that there are no more
out of range values left in the dataset.

**8. Treat as missing**

To treat values as missing, we’ll need to replace all the out of range
values with NA. We can do this using the replace function, which takes
in the column you want to replace values in, the condition that should
be met for a replacement to happen, and what the replacement should be.
Here, we create a new column called rating_miss, replacing values of the
avg_rating column that are too big with NA.

**9. Replacing out of range values**

We can also use the replacement function to replace out of range values
with the range limit. Here, we replace all the values of avg_rating that
are greater than 5 with 5.

**10. Date range constraints**

Dates can also be out of range. A common scenario is when data contains
dates in the future. In our movies data, all of the dates should be in
the past, since it’s not possible for us to have a movie rating for a
movie that no one has seen yet.We can use the assert_all_are_in_past
function from the assertive package to check for future dates, and it
looks like we have one.We can take a closer look at this row by
filtering for date_recorded greater than today’s date. Just like
numbers, dates can be compared using greater than, less than, and equals
equals operators. The today function from lubridate will get the current
date.

**11. Removing out-of-range dates**

We can remove the rows with future dates using filter as well, but this
time, we filter for date_recorded less than or equal to today.When we
use assert_all_are_in_past now, nothing is returned, so we know that our
range constraints have been met.

**12. Let’s practice!**

Now it’s time to practice wrangling your data with ranges.

*What’s an out of range value?*

-   SAT score: 400-1600
-   Package weight: at least 0 lb/kg
-   Adult heart rate: 60-100 beats per minute

*Handling out of range values*

-   Remove rows
-   Treat as missing (`NA`)
-   Replace with range limit
-   Replace with other value based on domain knowledge and/or knowledge
    of dataset

Values that are out of range can throw off an analysis, so it’s
important to catch them early on. In this section, you’ll be examining
the `duration_min` column more closely. Bikes are not allowed to be kept
out for
<a href="https://help.baywheels.com/hc/en-us/articles/360033790932-How-long-can-I-keep-a-bike-out-" target="_blank" rel="noopener noreferrer">more
than 24 hours</a>, or 1440 minutes at a time, but issues with some of
the bikes caused inaccurate recording of the time they were returned.

In this sections, you’ll replace erroneous data with the range limit
(1440 minutes), however, you could just as easily replace these values
with `NA`s.

**Packages**

-   <code><a href="http://ggplot2.tidyverse.org">ggplot2</a></code>

**Steps**

1.  Create a three-bin histogram of the `duration_min` column of
    `bike_share_rides` using `ggplot2` to identify if there is
    out-of-range data.

``` r
# Library
library(ggplot2)

# Load data
bike_share_rides_sample <- readRDS("data/bike_share_rides_sample.rds")

# 1.1 Create breaks
breaks <- c(min(bike_share_rides_sample$duration_min), 0, 1440, max(bike_share_rides_sample$duration_min))

# 1.2 Create a histogram of duration_min
ggplot(bike_share_rides_sample, aes(duration_min)) +
  geom_histogram(breaks = breaks)
```

![](readme_files/figure-gfm/unnamed-chunk-10-1.png)<!-- -->

2.  Replace the values of `duration_min` that are greater than `1440`
    minutes (24 hours) with `1440`. Add this to `bike_share_rides` as a
    **new** column called `duration_min_const`.
3.  Assert that all values of `duration_min_const` are between `0` and
    `1440`.

``` r
# 2. duration_min_const: replace vals of duration_min > 1440 with 1440
bike_share_rides_sample <- bike_share_rides_sample %>%
  mutate(duration_min_const = replace(duration_min, duration_min > 1440, 1440))

# 3. Make sure all values of duration_min_const are between 0 and 1440
assert_all_are_in_closed_range(bike_share_rides_sample$duration_min_const, lower = 0, upper = 1440)
```

Radical replacing! The method of replacing erroneous data with the range
limit works well, but you could just as easily replace these values with
`NA`s or something else instead.

### Date constraints

Something has gone wrong and it looks like you have data with dates from
the future, which is way outside of the date range you expected to be
working with. To fix this, you’ll need to remove any rides from the
dataset that have a `date` in the future. Before you can do this, the
`date` column needs to be converted from a `character` to a `Date`.
Having these as `Date` objects will make it much easier to figure out
which rides are from the future, since R makes it easy to check if one
`Date` object is before (`<`) or after (`>`) another.

**Packages**

-   <code><a href="http://lubridate.tidyverse.org">lubridate</a></code>

**Steps**

1.  Convert the `date` column of `bike_share_rides` from `character` to
    the `Date` data type.
2.  Assert that all values in the `date` column happened sometime in the
    past and not in the future.

``` r
# Libraries
library(lubridate)

# 1. Convert date to Date type
bike_share_rides <- bike_share_rides %>%
  mutate(date = as_datetime(date))

# Modify data: Change year to 2043 of 10 random observations
bike_share_rides_mod <- bike_share_rides |> 
                            mutate(date = case_when(ride_id %in% c(99874,15624,89173,39239,23104,39307,13170,51086,87586,21989) ~ `year<-`(date, 2043),
                                                    T ~ date))

# 2. Make sure all dates are in the past
assert_all_are_in_past(bike_share_rides_mod$date)
```

    ## Error in eval(expr, envir, enclos): is_in_past : bike_share_rides_mod$date are not all in the past.
    ## There were 10 failures:
    ##    Position      Value     Cause
    ## 1      1677 2043-04-14 in future
    ## 2      4224 2043-04-14 in future
    ## 3      4929 2043-04-04 in future
    ## 4      6345 2043-04-16 in future
    ## 5      6864 2043-04-16 in future
    ## 6     11582 2043-04-23 in future
    ## 7     17219 2043-04-22 in future
    ## 8     18096 2043-04-22 in future
    ## 9     18394 2043-04-21 in future
    ## 10    22459 2043-04-07 in future

3.  Filter `bike_share_rides` to get only the rides from the past or
    today, and save this as `bike_share_rides_past`.
4.  Assert that the `dates` in `bike_share_rides_past` occurred only in
    the past.

``` r
# 3. Filter for rides that occurred before or on today's date
bike_share_rides_past <- bike_share_rides_mod %>%
  filter(date <= today())

# 4. Make sure all dates from bike_share_rides_past are in the past
assert_all_are_in_past(bike_share_rides_past$date)
```

Fabulous filtering! Handling data from the future like this is much
easier than trying to verify the data’s correctness by time traveling.

### Uniqueness constraints (Duplicates)

Theory. Coming soon …

**1. Uniqueness constraints**

Sometimes we might have data containing duplicated data points caused by
an error earlier in the pipeline. Duplicated data can have lots of
unwanted side effects, but uniqueness constraints help us find and fix
these duplicated data points.

**2. What’s a duplicate?**

A duplicate is a data point that has the same values as another data in
all columns, or in most columns.

**3. Why do duplicates occur?**

Duplicates can arise from data entry errors or other human errors,

**4. Why do duplicates occur?**

from bugs or design errors in data pipelines,

**5. Why do duplicates occur?**

but they most commonly arise from errors in joining data together from
multiple sources.

**6. Full duplicates**

A full duplicate occurs when there are multiple rows that have the same
value in every column. Here, rows 2 and 4 are full duplicates of each
other, and rows 5 and 6 are also full duplicates of each other.

**7. Finding full duplicates**

We can find full duplicates using R’s built-in “duplicated” function. If
we pass in our data frame, called credit_scores, we get a logical
vector, which is TRUE for each row that is a duplicate. If we take the
sum of this vector, we get the total number of duplicates in the
dataset, which is 2.

**8. Finding full duplicates**

We can check out the rows that are duplicates by using the duplicated
function inside of filter, like this.

**9. Dropping full duplicates**

Since full duplicates are exact copies of each other, we can deal with
these by simply removing them from the dataset, leaving only one copy
behind. This can be done using dplyr’s distinct function on our data
frame. If we count the number of duplicates in the dataset now, we get
0.

**10. Partial duplicates**

Partial duplicates are rows of data that have much of the same
information and refer to the same data point, but there may be some
columns that differ between them. Here, rows 3 and 4 are partial
duplicates of each other and rows 5 and 6 are partial duplicates of each
other. They have the same name and address, but different credit scores.
This can happen due to data entry errors or technical errors. In this
example, some data from a year ago may have gotten mixed with the data
from this year.

**11. Finding partial duplicates**

To include partial duplicates in our search, we can use dplyr’s count
function to count the number of occurrences of each pair of first name
and last name, then filter for the pairs that occur more than once. This
will give us data points that share the same name, but may differ in
address or credit score.

**12. Finding partial duplicates**

We can save this as a data frame called dup_ids and then filter to take
a look at all the rows that have a duplicate. This gives us a list of
the full duplicates and the partial duplicates in the dataset.

**13. Handling partial duplicates: dropping**

One way to handle partial duplicates is to

**14. Handling partial duplicates: dropping**

drop all duplicates

**15. Handling partial duplicates: dropping**

and keep only one of them.

**16. Dropping partial duplicates**

In R, we can also use the distinct function to drop partial duplicates,
but this time, we pass in the column names that duplicates should be
matched on. Here, it’s first name and last name. We also set the
dot-keep_all argument to TRUE, which will keep all columns of the data
frame instead of only first_name and last_name.

**17. Handling partial duplicates: summarizing**

Another way to handle partial duplicates is to summarize them using a
summary statistic, like the mean or max. Since the credit scores differ
in our example,

**18. Handling partial duplicates: summarizing**

we can take the mean credit score for each individual

**19. Handling partial duplicates: summarizing**

keeping only one copy of each duplicate,

**20. Handling partial duplicates: summarizing**

and use the mean as the value for credit score.

**21. Handling partial duplicates: summarizing**

**22. Summarizing partial duplicates**

To summarize partial duplicates, we group by first_name and last_name,
and then mutate, adding a column containing the mean credit score for
each name. Since we’ve grouped before mutating, the mean_score column
contains the mean score for each person.

**23. Summarizing partial duplicates**

We can pipe all of this into distinct, using first and last name and
setting dot-keep_all to TRUE to remove the extra duplicates. We can also
remove the old credit_score column to clean things up.

**24. Let’s practice!**

Time to dive in to some duplicated data!

#### Full duplicates

Whats a full duplicate?

|     | First name | Last name | Address                  | Credit Score |
|-----|------------|-----------|--------------------------|--------------|
| 1   | Miriam     | Day       | 6042 Sollicitudin Avenue | 313          |
| 2   | Miriam     | Day       | 6042 Sollicitudin Avenue | 313          |

You’ve been notified that an update has been made to the bike sharing
data pipeline to make it more efficient, but that duplicates are more
likely to be generated as a result. To make sure that you can continue
using the same scripts to run your weekly analyses about ride
statistics, you’ll need to ensure that any duplicates in the dataset are
removed first.

When multiple rows of a data frame share the same values for all
columns, they’re *full duplicates* of each other. Removing duplicates
like this is important, since having the same value repeated multiple
times can alter summary statistics like the mean and median. Each ride,
including its `ride_id` should be unique.

**Packages**

-   <code><a href="http://sfirke.github.io/janitor/articles/janitor.html">janitor</a></code>

**Steps**

1.  Find full duplicates

``` r
# Modify data
bike_share_rides_mod <- bike_share_rides |> 
  
                            # Add duplicates
                            add_row(bike_share_rides |> slice(17278)) |> 
                            add_row(bike_share_rides |> slice(27208))

# 1. Finding duplicates
bike_share_rides_mod |> 
    filter(bike_share_rides_mod |> duplicated())
```

    ## # A tibble: 2 × 13
    ##   ride_id date                duration  station_A_id station_A_name station_B_id
    ##     <int> <dttm>              <chr>            <dbl> <chr>                 <dbl>
    ## 1   75525 2017-04-02 00:00:00 16.38 mi…            5 Powell St BAR…          101
    ## 2   45767 2017-04-08 00:00:00 3.52 min…           16 Steuart St at…            8
    ## # … with 7 more variables: station_B_name <chr>, bike_id <dbl>,
    ## #   user_gender <chr>, user_birth_year <dbl>, user_birth_year_fct <fct>,
    ## #   duration_trimmed <chr>, duration_mins <dbl>

**Alternative**

``` r
# Libraries
library(janitor)

# 1. Finding duplicates
bike_share_rides_mod |> 
    get_dupes()
```

    ## # A tibble: 4 × 14
    ##   ride_id date                duration  station_A_id station_A_name station_B_id
    ##     <int> <dttm>              <chr>            <dbl> <chr>                 <dbl>
    ## 1   45767 2017-04-08 00:00:00 3.52 min…           16 Steuart St at…            8
    ## 2   45767 2017-04-08 00:00:00 3.52 min…           16 Steuart St at…            8
    ## 3   75525 2017-04-02 00:00:00 16.38 mi…            5 Powell St BAR…          101
    ## 4   75525 2017-04-02 00:00:00 16.38 mi…            5 Powell St BAR…          101
    ## # … with 8 more variables: station_B_name <chr>, bike_id <dbl>,
    ## #   user_gender <chr>, user_birth_year <dbl>, user_birth_year_fct <fct>,
    ## #   duration_trimmed <chr>, duration_mins <dbl>, dupe_count <int>

2.  Get the total number of full duplicates in `bike_share_rides`.

``` r
# 2. Count the number of full duplicates
sum(duplicated(bike_share_rides_mod))
```

    ## [1] 2

3.  Remove all full duplicates from `bike_share_rides` and save the new
    data frame as `bike_share_rides_unique.`
4.  Get the total number of full duplicates in the new
    `bike_share_rides_unique` data frame.

``` r
# 3. Remove duplicates
bike_share_rides_unique <- distinct(bike_share_rides_mod)

# 4. Count the full duplicates in bike_share_rides_unique
sum(duplicated(bike_share_rides_unique))
```

    ## [1] 0

Dazzling duplicate removal! Removing full duplicates will ensure that
summary statistics aren’t altered by repeated data points.

#### Partial duplicates

Whats a partial duplicate?

|     | First name | Last name | Address                    | Credit Score |
|-----|------------|-----------|----------------------------|--------------|
| 1   | Tamekah    | Forbes    | P.O. Box 147, 511 Velit St | 356          |
| 2   | Tamekah    | Forbes    | P.O. Box 147, 511 Velit St | 342          |

##### Removing partial duplicates

Now that you’ve identified and removed the full duplicates, it’s time to
check for partial duplicates. Partial duplicates are a bit tricker to
deal with than full duplicates. In this section, you’ll first identify
any partial duplicates and then practice the most common technique to
deal with them, which involves dropping all partial duplicates, keeping
only the first.

**Steps**

1.  Count the number of occurrences of each `ride_id`.
2.  Filter for `ride_id`s that occur multiple times.

``` r
# Modify data
bike_share_rides_mod <- bike_share_rides |> 
  
                            # Add duplicates
                            add_row(bike_share_rides |> 
                                        slice(33237) |> 
                                        mutate(duration_mins = 5.8)) |> 
                            add_row(bike_share_rides |> 
                                        slice(17657) |> 
                                        mutate(duration_mins = 13.6))

# Find duplicated ride_ids
bike_share_rides_mod %>% 
  # 1. Count the number of occurrences of each ride_id
  count(ride_id) %>% 
  # 2. Filter for rows with a count > 1
  filter(n > 1)
```

    ## # A tibble: 2 × 2
    ##   ride_id     n
    ##     <int> <int>
    ## 1   41441     2
    ## 2   87056     2

**Alternative**

``` r
# 1. Find duplicated ride_ids
bike_share_rides_mod |> 
    janitor::get_dupes(ride_id)
```

    ## # A tibble: 4 × 14
    ##   ride_id dupe_count date                duration  station_A_id station_A_name  
    ##     <int>      <int> <dttm>              <chr>            <dbl> <chr>           
    ## 1   41441          2 2017-04-25 00:00:00 5.92 min…           21 Montgomery St B…
    ## 2   41441          2 2017-04-25 00:00:00 5.92 min…           21 Montgomery St B…
    ## 3   87056          2 2017-04-12 00:00:00 14 minut…           21 Montgomery St B…
    ## 4   87056          2 2017-04-12 00:00:00 14 minut…           21 Montgomery St B…
    ## # … with 8 more variables: station_B_id <dbl>, station_B_name <chr>,
    ## #   bike_id <dbl>, user_gender <chr>, user_birth_year <dbl>,
    ## #   user_birth_year_fct <fct>, duration_trimmed <chr>, duration_mins <dbl>

3.  Remove full and partial duplicates from `bike_share_rides` based on
    `ride_id` only, keeping all columns.
4.  Store this as `bike_share_rides_unique`.
5.  Find the duplicated `ride_id`s in `bike_share_rides_unique`.

``` r
# 3. / 4. Remove full and partial duplicates
bike_share_rides_unique <- bike_share_rides_mod %>%
  # Only based on ride_id instead of all cols
  distinct(ride_id, .keep_all = T)

# 5. Find duplicated ride_ids in bike_share_rides_unique
bike_share_rides_unique %>%
  # Count the number of occurrences of each ride_id
  count(ride_id) %>%
  # Filter for rows with a count > 1
  filter(n > 1)
```

    ## # A tibble: 0 × 2
    ## # … with 2 variables: ride_id <int>, n <int>

Perfect partial duplicate removing! It’s important to consider the data
you’re working with before removing partial duplicates, since sometimes
it’s expected that there will be partial duplicates in a dataset, such
as if the same customer makes multiple purchases.

##### Aggregating partial duplicates

Another way of handling partial duplicates is to compute a summary
statistic of the values that differ between partial duplicates, such as
mean, median, maximum, or minimum. This can come in handy when you’re
not sure how your data was collected and want an average, or if based on
domain knowledge, you’d rather have too high of an estimate than too low
of an estimate (or vice versa).

**Steps**

1.  Group `bike_share_rides` by `ride_id` and `date`.
2.  Add a column called `duration_min_avg` that contains the mean ride
    duration for the row’s `ride_id` and `date`.
3.  Remove duplicates based on `ride_id` and `date`, keeping all columns
    of the data frame.
4.  Remove the `duration_min` column.

``` r
bike_share_rides_mod %>%
  # 1. Group by ride_id and date
  group_by(ride_id, date) %>%
  # 2. Add duration_min_avg column
  mutate(duration_min_avg = mean(duration_mins) ) %>%
  # 3. Remove duplicates based on ride_id and date, keep all cols
  distinct(ride_id, date, .keep_all = TRUE) %>%
  # 4. Remove duration_min column
  select(-duration_mins)
```

    ## # A tibble: 35,229 × 13
    ## # Groups:   ride_id, date [35,229]
    ##    ride_id date                duration station_A_id station_A_name station_B_id
    ##      <int> <dttm>              <chr>           <dbl> <chr>                 <dbl>
    ##  1   52797 2017-04-15 00:00:00 1316.15…           67 San Francisco…           89
    ##  2   54540 2017-04-19 00:00:00 8.13 mi…           21 Montgomery St…           64
    ##  3   87695 2017-04-14 00:00:00 24.85 m…           16 Steuart St at…          355
    ##  4   45619 2017-04-03 00:00:00 6.35 mi…           58 Market St at …          368
    ##  5   70832 2017-04-10 00:00:00 9.8 min…           16 Steuart St at…           81
    ##  6   96135 2017-04-18 00:00:00 17.47 m…            6 The Embarcade…           66
    ##  7   29928 2017-04-22 00:00:00 16.52 m…            5 Powell St BAR…          350
    ##  8   83331 2017-04-11 00:00:00 14.72 m…           16 Steuart St at…           91
    ##  9   72424 2017-04-05 00:00:00 4.12 mi…            5 Powell St BAR…           62
    ## 10   25910 2017-04-20 00:00:00 25.77 m…           81 Berry St at 4…           81
    ## # … with 35,219 more rows, and 7 more variables: station_B_name <chr>,
    ## #   bike_id <dbl>, user_gender <chr>, user_birth_year <dbl>,
    ## #   user_birth_year_fct <fct>, duration_trimmed <chr>, duration_min_avg <dbl>

Awesome aggregation! Aggregation of partial duplicates allows you to
keep some information about all data points instead of keeping
information about just one data point.

# 2. Categorical and Text Data

Categorical and text data can often be some of the messiest parts of a
dataset due to their unstructured nature. In this chapter, you’ll learn
how to fix whitespace and capitalization inconsistencies in category
labels, collapse multiple categories into one, and reformat strings for
consistency.

## Checking membership

Theory. Coming soon …

**1. Checking membership**

Nice work on Chapter 1! In Chapter 2, we’ll discuss problems that arise
in text and categorical data. Let’s get started!

**2. Categorical data**

A variable is categorical when it can only take on values from a
predefined set of values. Categorical variables represent distinct
groups. Marriage status, household income category, and t-shirt size are
all examples of categorical variables. As we discussed in Chapter 1,
categories are stored as factors in R.

**3. Factors**

Under the hood, factors are stored as numbers, where one number
represents each category. Each number has a corresponding label to make
it easier for humans to read and understand output. For example,
marriage status has two categories. Category 1 is labeled as unmarried,
and category 2 is labeled as married.

**4. Factor levels**

Factors have something called levels, which are all the different
possible values that a factor can hold. Here, we see that there are four
possible values that tshirt_size can have: small, medium, large, and
extra-large.

**5. Values that don’t belong**

Since factors have these predefined levels, they cannot have values that
fall outside of those levels. For example, if we asked people what
t-shirt size they want, and someone responds with small-slash-medium, we
won’t be able to process that order since our vendor doesn’t make that
size.

**6. How do we end up with these values?**

How do we end up with values that aren’t members of the predefined set
of categories? Inconsistencies like this can arise due to data entry
errors where data is inputted using free text instead of a
multiple-choice system, as well as data parsing errors.

**7. Filtering joins: a quick review**

Recall that filtering joins are a type of join that keeps or removes
observations from the first table, but doesn’t add any new columns. The
first kind of filtering join is a semi-join, which answers the question,
“What observations of X are also in Y?”

**8. Filtering joins: a quick review**

The other kind is an anti-join, which answers the question, “What
observations of X are not in Y?” We can use these filtering joins to
find and remove values of categorical variables that don’t belong.

**9. Blood type example**

Let’s take a look at an example. We have a data frame called study_data,
which contains data from a study about babies’ blood types. study_data
has the name, birthday, and blood type of each child. We also have a
data frame called blood_types that contains all the possible blood types
that a human can have.

**10. Blood type example**

Notice the problem here? Jennifer has blood type Z-positive, which is
not a real blood type. Luckily, we can use the blood_types data frame as
our ground truth to fix this.

**11. Finding non-members**

To find invalid blood types in our study data, we want to find all the
blood types in study_data that are NOT in the blood_types data frame.
This means we’ll need an anti-join.

**12. Anti-join**

We can use dplyr’s anti_join function to get the rows of study_data with
a blood type not in the blood_types data frame.

**13. Removing non-members**

To remove the invalid blood types from our study_data, we want to find
all the rows with a blood type in the official blood_types data frame.
This means we’ll need to use a semi-join.

**14. Semi-join**

We can use dplyr’s semi-join function to get the rows of study_data that
have a blood type contained in the official blood_types data frame. This
removes the data with the Z-positive blood type.

## Membership constraints

So far, you’ve learned about a number of different problems you can run
into when you have dirty data, including

-   data type constraints,
-   range constraints,
-   uniqueness constraints,
-   and membership constraints.

Categorical variables have a fixed and known set of possible values. In
a `factor`, each category is stored as a number and has a corresponding
label. `factor`s cannot have values that fall outside of the predefined
ones.

| Data                      | Labels                 | Numeric representaion |
|---------------------------|------------------------|-----------------------|
| Marriage status           | `unmarried`, `married` | `1`, `2`              |
| Household income category | `0-20K`, `20-40K`, …   | `1`, `2`, …           |
| T-Shirt size              | `S`, `M`, `L`, `XL`    | `1`, `2`, `3`, `4`    |

It’s important to be able to correctly identify the type of problem
you’re dealing with so that you can treat it correctly.

**Example:** Classification based on whether it’s a membership
constraint issue or a different type of issue:

| Membership constraint                                                          | Other constraint                                |
|--------------------------------------------------------------------------------|-------------------------------------------------|
| A `has_loan` column with the value `25`.                                       | A `revenue` column represented as a string.     |
| A `month` column with the value `14`.                                          | A `birthdate` column with values in the future. |
| A `GPA` column containing a `Z-` grade (Grades are traditionally A through F). | An `age` column with values above `130`.        |
| A `day_of_week` column with the value `12`                                     |                                                 |

### Filtering Joins: a quick review

Keeps or removes observations from the first table without adding
columns

<img src="readme_files/joins.png" style="width:50.0%" />

The following example is a good illustration of how that works:

``` r
study_data  <- readRDS("data/study_data.rds")
study_data
```

    ## # A tibble: 7 × 3
    ##   name     birthday   blood_type
    ##   <chr>    <chr>      <chr>     
    ## 1 Beth     2019-10-20 B-        
    ## 2 Ignatius 2020-07-08 A-        
    ## 3 Paul     2019-08-12 O+        
    ## 4 Helen    2019-03-17 O-        
    ## 5 Jennifer 2019-12-17 Z+        
    ## 6 Kennedy  2020-04-27 A+        
    ## 7 Keith    2019-04-19 AB+

``` r
blood_types <- readRDS("data/blood_types.rds") 
blood_types
```

    ## # A tibble: 8 × 1
    ##   blood_type
    ##   <chr>     
    ## 1 O-        
    ## 2 O+        
    ## 3 A-        
    ## 4 A+        
    ## 5 B-        
    ## 6 B+        
    ## 7 AB-       
    ## 8 AB+

**Anti_join: Finding non members**

<img src="readme_files/anti-join.png" style="width:50.0%" />

``` r
study_data |> 
  anti_join(blood_types, by = "blood_type")
```

    ## # A tibble: 1 × 3
    ##   name     birthday   blood_type
    ##   <chr>    <chr>      <chr>     
    ## 1 Jennifer 2019-12-17 Z+

**Semi-Join: Removing non members**

<img src="readme_files/semi-join.png" style="width:50.0%" />

``` r
study_data |> 
  semi_join(blood_types, by = "blood_type")
```

    ## # A tibble: 6 × 3
    ##   name     birthday   blood_type
    ##   <chr>    <chr>      <chr>     
    ## 1 Beth     2019-10-20 B-        
    ## 2 Ignatius 2020-07-08 A-        
    ## 3 Paul     2019-08-12 O+        
    ## 4 Helen    2019-03-17 O-        
    ## 5 Kennedy  2020-04-27 A+        
    ## 6 Keith    2019-04-19 AB+

**Data**

-   `sfo_survey` / `sfo_survey_mod`

Now that we can identify membership constraint problems, it’s time to
fix these problems in a new dataset. Throughout this section, you’ll be
working with a dataset called `sfo_survey`, containing survey responses
from passengers taking flights from San Francisco International Airport
(SFO). Participants were asked questions about the airport’s
cleanliness, wait times, safety, and their overall satisfaction.

There were a few issues during data collection that resulted in some
inconsistencies in the dataset (`sfo_survey_mod`). In the following
steps, you’ll be working with the `dest_size` column, which categorizes
the size of the destination airport that the passengers were flying to.
A data frame called `dest_sizes` will be created that contains all the
possible destination sizes. Your mission is to find rows with invalid
`dest_size`s and remove them from the data frame.

**Steps**

1.  Count the number of occurrences of each `dest_size` in
    `sfo_survey_mod`.

``` r
sfo_survey_mod <- readRDS("data/sfo_survey_mod.rds")

# 1. Count the number of occurrences of dest_size
sfo_survey_mod %>%
  count(dest_size)
```

    ## # A tibble: 8 × 2
    ##   dest_size       n
    ##   <chr>       <int>
    ## 1 "  Small  "     1
    ## 2 " Hub"          1
    ## 3 "Hub"        1756
    ## 4 "huge"          1
    ## 5 "Large"       143
    ## 6 "Large  "       1
    ## 7 "Medium"      681
    ## 8 "Small"       225

> ## *Question*
>
> Take a closer look at your output. Which `dest_size` values appear to
> violate membership constraints?<br> <br> ⬜ `"huge"`, `"Small"`,
> `"Large  "`, and `"Hub"`.<br> ✅ `"huge"`, `"  Small  "`, `"Large  "`,
> and `" Hub"`.<br> ⬜ `"Small"`, `"Medium"`, `"Large"`, and
> `"Hub"`.<br>

2.  Use the correct type of filtering join on the `sfo_survey` data
    frame and the `dest_sizes` data frame to get the rows of
    `sfo_survey` with invalid `dest_size` values.
3.  Get the `id`, `airline`, `destination`, and `dest_size` columns.

``` r
dest_sizes <- tibble(
  dest_size          = c("Small", "Medium", "Large", "Hub"),
  passengers_per_day = c("0-20K", "20K-70K", "70K-100K", "100K+")
)

# Find bad dest_size rows
sfo_survey_mod %>% 
  # 2. Join with dest_sizes data frame to get bad dest_size rows
  anti_join(dest_sizes) %>%
  # 3. Select id, airline, destination, and dest_size cols
  select(id, airline, destination, dest_size)
```

    ## Joining, by = "dest_size"

    ## # A tibble: 4 × 4
    ##      id airline     destination       dest_size  
    ##   <int> <chr>       <chr>             <chr>      
    ## 1   278 UNITED      BALTIMORE         "huge"     
    ## 2   982 LUFTHANSA   MUNICH            " Hub"     
    ## 3  2063 AMERICAN    PHILADELPHIA      "Large  "  
    ## 4   777 UNITED INTL SAN JOSE DEL CABO "  Small  "

4.  Use the correct filtering join on `sfo_survey` and `dest_sizes` to
    get the rows of `sfo_survey` that have a valid `dest_size`.
5.  Count the number of times that each `dest_size` occurs to make sure
    there are no invalid values left behind.

``` r
# Remove bad dest_size rows
sfo_survey_mod %>% 
  # 4. Join with dest_sizes
  semi_join(dest_sizes) %>%
  # 5. Count the number of each dest_size
  count(dest_size)
```

    ## Joining, by = "dest_size"

    ## # A tibble: 4 × 2
    ##   dest_size     n
    ##   <chr>     <int>
    ## 1 Hub        1756
    ## 2 Large       143
    ## 3 Medium      681
    ## 4 Small       225

Great joining! Anti-joins can help you identify the rows that are
causing issues, and semi-joins can remove the issue-causing rows. In the
next lesson, you’ll learn about other ways to deal with bad values so
that you don’t have to lose rows of data.

## Categorical data problems

Theory. Coming soon …

**1. Categorical data problems**

Now that we’ve discussed membership constraints, we’ll take a deeper
dive into categorical data and discuss other ways to address those pesky
values that don’t belong besides removing them.

**2. Categorical data problems**

There are two specific types of dirty categorical data that we’ll
discuss. The first is when there is inconsistency within a category. For
example, “Lizard” with a capital “L” and “lizard” with a lowercase “L”
should be mapped to the same category even though their capitalization
differs. The other type is when there are too many categories. If we
only have one data point with “Pug”, one data point with “Lab”, and one
data point with “Boxer”, those categories might not be so useful on
their own. It will be easier to work with our data if we collapse them
all into one category, “Dog”.

**3. Example: animal classification**

Let’s start out with an example. We have a data frame called animals
which contains different characteristics of animals and their type, such
as mammal, fish, or bird.

**4. Checking categories**

We can explore all the different type categories in the data using
count. At a glance, we can see if there are any categories that need
correction. Right off the bat, we can see that there are multiple
categories for mammal, including ” mammal ” with extra spaces before and
after the word, “MAMMAL” in all caps,and “Mammal” with one capital
letter and an extra space.

**5. Case inconsistency**

To fix the case inconsistency between the different mammal categories,
we can use the str_to_lower function from the stringr package. Looking
at row 3, we can see that the mammal with a capital M has been converted
to all lowercase.

**6. Case inconsistency**

If we now count the type_lower category, we can see that there are nine
categories instead of ten since the all caps “MAMMAL” was converted to
lowercase “mammal”.

**7. Case inconsistency**

We could also convert everything to uppercase using the str_to_upper
function.

**8. Whitespace inconsistency**

To address the inconsistency in the white space around the word
“mammal”, we can use the stringr function str_trim. This will remove any
white space from the beginning of the string and the end of the string,
but not the middle of the string. Now the category in row 3 matches the
category in row 1.

**9. Whitespace inconsistency**

If we now look at the different categories, there’s only one mammal
category, so all of the mammals in the dataset have been mapped to the
same category.

**10. Too many categories**

Take a look at the categories we have now. Notice that most of our
dataset is comprised of mammals and birds. There are only two
amphibians, two fish, one bug, one invertebrate, and one reptile. That’s
5 extra categories for only 7 data points, and summary statistics for
these groups won’t be very useful since they only contain one or two
observations.

**11. Collapsing categories**

We can solve this problem by collapsing these categories into a new,
broader category called “other”. First, we’ll create a vector called
other_categories that stores the categories we want to collapse
together. Next, we’ll load the forcats package and add a new column to
the animals data frame called type_collapsed. To create this column,
we’ll use the fct_collapse function. We pass type_trimmed to
fct_collapse since this is the factor we want to base our new column on,
and then we use other equals other_categories. This will tell the
function that all the categories contained in the other_categories
vector should be renamed to “other”. Now, row 4 has the type “other”
instead of “fish”.

**12. Collapsing categories**

If we count the categories in our data frame now, there are only three!
This makes it easier to compare all other animals to birds and mammals.

## Identifying inconsistent categorical data

Different kinds of inconsistencies that can occur within categories,
making it look like a variable has more categories than it should:

-   Case inconsistency
-   whitespace inconsistency
-   too many categories
-   …

**Data**

In this section, you’ll continue working with the `sfo_survey_mod`
dataset. You’ll examine the `dest_size` column again as well as the
`cleanliness` column and determine what kind of issues, if any, these
two categorical variables face.

**Steps**

1.  Count the number of occurrences of each category of the `dest_size`
    variable of `sfo_survey`.

``` r
# Count dest_size
sfo_survey_mod %>%
  count(dest_size)
```

    ## # A tibble: 8 × 2
    ##   dest_size       n
    ##   <chr>       <int>
    ## 1 "  Small  "     1
    ## 2 " Hub"          1
    ## 3 "Hub"        1756
    ## 4 "huge"          1
    ## 5 "Large"       143
    ## 6 "Large  "       1
    ## 7 "Medium"      681
    ## 8 "Small"       225

> ## *Question*
>
> Select the statement that most accurately describes the categories in
> the dest_size variable of sfo_survey.<br> <br> ⬜ The categories in
> `dest_size` have no inconsistencies.<br> ⬜ The categories in
> `dest_size` have inconsistent capitalization.<br> ✅ The categories in
> `dest_size` have inconsistent white space.<br> ⬜ The categories in
> `dest_size` have inconsistent capitalization and white space.<br>

2.  Count the number of occurrences of each category of the
    `cleanliness` variable of `sfo_survey`.

``` r
# Count cleanliness
sfo_survey_mod %>%
  count(cleanliness)
```

    ## # A tibble: 9 × 2
    ##   cleanliness        n
    ##   <chr>          <int>
    ## 1 average            1
    ## 2 Average          431
    ## 3 AVERAGE            1
    ## 4 Clean            970
    ## 5 Dirty              2
    ## 6 somewhat clean     1
    ## 7 Somewhat clean  1253
    ## 8 Somewhat dirty    30
    ## 9 <NA>             120

> ## *Question*
>
> Select the statement that most accurately describes the categories in
> the cleanliness variable of sfo_survey.<br> <br> ⬜ The categories in
> `cleanliness` have no inconsistencies.<br> ✅ The categories in
> `cleanliness` have inconsistent capitalization.<br> ⬜ The categories
> in `cleanliness` have inconsistent white space.<br> ⬜ The categories
> in `cleanliness` have inconsistent capitalization and white space.<br>

Incredible identification! In the next exercise, you’ll fix these
inconsistencies to get more accurate counts.

## Correcting inconsistent categorical data

### Trimming & Case Sensitivity

Now that we’ve identified that `dest_size` has whitespace
inconsistencies and `cleanliness` has capitalization inconsistencies,
you’ll use the new tools at your disposal to fix the inconsistent values
in `sfo_survey` instead of removing the data points entirely, which
could add bias to your dataset if more than 5% of the data points need
to be dropped.

**Steps**

1.  Add a column to `sfo_survey` called `dest_size_trimmed` that
    contains the values in the `dest_size` column with all leading and
    trailing whitespace removed.
2.  Add another column called `cleanliness_lower` that contains the
    values in the `cleanliness` column converted to all lowercase.
3.  Count the number of occurrences of each category in
    `dest_size_trimmed`.

``` r
# Add new columns to sfo_survey
sfo_survey_mod <- sfo_survey_mod %>%
  # 1. dest_size_trimmed: dest_size without whitespace
  mutate(dest_size_trimmed = str_trim(dest_size),
         # 2. cleanliness_lower: cleanliness converted to lowercase
         cleanliness_lower = str_to_lower(cleanliness))

# 3. Count values of dest_size_trimmed
sfo_survey_mod %>%
  count(dest_size_trimmed)
```

    ## # A tibble: 5 × 2
    ##   dest_size_trimmed     n
    ##   <chr>             <int>
    ## 1 Hub                1757
    ## 2 huge                  1
    ## 3 Large               144
    ## 4 Medium              681
    ## 5 Small               226

4.  Count the number of occurrences of each category in
    `cleanliness_lower`.

``` r
# 4. Count values of cleanliness_lower
sfo_survey_mod %>%
  count(cleanliness_lower)
```

    ## # A tibble: 6 × 2
    ##   cleanliness_lower     n
    ##   <chr>             <int>
    ## 1 average             433
    ## 2 clean               970
    ## 3 dirty                 2
    ## 4 somewhat clean     1254
    ## 5 somewhat dirty       30
    ## 6 <NA>                120

Lovely lowercase conversion and terrific trimming! You were able to
convert seven-category data into four-category data, which will help
your analysis go more smoothly.

### Collapsing categories

One of the tablets that participants filled out the `sfo_survey` on was
not properly configured, allowing the response for `dest_region` to be
free text instead of a dropdown menu. This resulted in some
inconsistencies in the `dest_region` variable that you’ll need to
correct in this exercise to ensure that the numbers you report to your
boss are as accurate as possible.

**Steps**

1.  Count the categories of `dest_region`.

``` r
# 1. Count categories of dest_region
sfo_survey_mod %>%
  count(dest_region)
```

    ## # A tibble: 12 × 2
    ##    dest_region               n
    ##    <chr>                 <int>
    ##  1 Asia                    260
    ##  2 Australia/New Zealand    66
    ##  3 Canada/Mexico           220
    ##  4 Central/South America    29
    ##  5 East US                 498
    ##  6 EU                        2
    ##  7 eur                       2
    ##  8 Europ                     1
    ##  9 Europe                  396
    ## 10 Middle East              79
    ## 11 Midwest US              281
    ## 12 West US                 975

> ## *Question*
>
> From your output from step 1, which categories need to be
> collapsed?<br> <br> ⬜ `"EU"` and `"Europ"` need to be collapsed to
> `"Europe"`.<br> ✅ `"EU"`, `"eur"`, and `"Europ"` need to be collapsed
> to `"Europe"`.<br> ⬜ `"East US"`, `"Midwest US"`, and `"West US"`
> need to be collapsed to `"US"`.<br> ⬜ `"Asia"` and
> `"Central/South America"` should be collapsed to
> `"Asia and Central/South America"`.<br>

2.  Create a vector called `europe_categories` containing the three
    values of `dest_region` that need to be collapsed.
3.  Add a new column to `sfo_survey` called `dest_region_collapsed` that
    contains the values from the `dest_region` column, except the
    categories stored in `europe_categories` should be collapsed to
    `Europe`.
4.  Count the categories of `dest_region_collapsed`.

``` r
# 2. Categories to map to Europe
europe_categories <- c("EU", "Europ", "eur")

# 3. Add a new col dest_region_collapsed
sfo_survey_mod %>%
  # Map all categories in europe_categories to Europe
  mutate(dest_region_collapsed = fct_collapse(dest_region, 
                                     Europe = europe_categories)) %>%
  # 4. Count categories of dest_region_collapsed
  count(dest_region_collapsed)
```

    ## # A tibble: 9 × 2
    ##   dest_region_collapsed     n
    ##   <fct>                 <int>
    ## 1 Asia                    260
    ## 2 Australia/New Zealand    66
    ## 3 Canada/Mexico           220
    ## 4 Central/South America    29
    ## 5 East US                 498
    ## 6 Europe                  401
    ## 7 Middle East              79
    ## 8 Midwest US              281
    ## 9 West US                 975

Clean collapsing! You’ve reduced the number of categories from 12 to 9,
and you can now be confident that 401 of the survey participants were
heading to Europe.

## Cleaning text data

Theory. Coming soon …

**1. Cleaning text data**

In the last lesson of this chapter, we’ll talk about different ways to
address dirty text data.

**2. What is text data?**

Before we dive in, let’s take a look at some examples of text data.
Names, phone numbers, email addresses, and passwords are all text
data.Text data is very common, but it can be difficult to work with
since it can be unstructured.

**3. Unstructured data problems**

Because text data doesn’t usually have a consistent structure, there are
a number of problems that we can run into while working with it. The
first is formatting inconsistencies, since there are often multiple ways
of formatting the same information. For example, phone numbers can be
written in a variety of ways with or without spaces, parentheses,
hyphens, and other punctuation, and credit card numbers can be written
with or without spaces.Information inconsistency happens when different
data points offer different amounts of information. For example, one
phone number could include a country code, while others may not, or one
person might fill in a “name” field using their first and last name,
while another might use only their first name. Data entered can also be
invalid, such as a phone number with only 4 digits or a zip code that
doesn’t exist.

**4. Customer data**

To learn about addressing these problems, we’ll look at an example
dataset of customers that contains customer names, companies, and credit
card numbers. Notice that some rows have spaces in the credit card
number while others have hyphens.Dirty text data like this can interfere
with pipelines and processes that rely on this data. For example, sales
software might only be able to process credit card numbers that are
consistently formatted.

**5. Detecting hyphenated credit card numbers**

To clean up this text data, we can use functions from the stringr
package.Before we can clean this data, we’ll need to find which values
need cleaning. This can be done using the str_detect function, which
takes in a character vector, in this case the name column of the
customers data frame, and the pattern that you want to detect, which is
a hyphen. This will return a logical vector indicating whether a hyphen
is found in the credit_card column in each row.

**6. Replacing hyphens**

Now that we’ve identified where our issues lie, we can use the
str_replace_all function, which takes in the column of text data, the
string we want to replace, and the replacement string. In this example,
we want to replace all of the hyphens in the credit_card column with
spaces so that all of the credit card numbers have consistent
formatting.

**7. Removing hyphens and spaces**

An alternative solution is to remove the hyphens and spaces from the
credit card numbers so that they contain numbers only. This can be done
using the str_remove_all function. Here, we take the credit_card column,
remove all hyphens, and then remove all spaces. We can add this to our
data frame using mutate.

**8. Finding invalid credit cards**

Now that we’ve removed all the hyphens and spaces, all of the credit
card numbers should have exactly 16 numbers. We can find invalid credit
cards using the str_length function, which returns the length of each
string in a column. str_length can be used in combination with a filter
to find all the customers whose credit_card number does not contain
exactly 16 characters.

**9. Removing invalid credit cards**

We can remove these invalid numbers from the dataset by filtering for
rows that have a credit card with a length of 16. Now we’ll be able to
charge customers with ease!

**10. More complex text problems**

To deal with more complex text data problems, regular expressions can be
used. A regular expression is a sequence of characters that allows for
robust searching within a string. For example, we could search for all
credit cards that have a 4 as their first digit.In regular expressions,
there are certain characters that get treated differently. All the
stringr functions we learned about use regular expressions, so when
searching for or replacing one of these special characters, the fixed
function needs to be wrapped around the text, like this.We won’t discuss
regular expressions any further, but check out these courses to learn
more about them.

**11. Let’s practice!**

Time to practice cleaning some text data!

## Detecting inconsistent text data

You’ve recently received some news that the customer support team wants
to ask the SFO survey participants some follow-up questions. However,
the auto-dialer that the call center uses isn’t able to parse all of the
phone numbers since they’re all in different formats. After some
investigation, you found that some phone numbers are written with
hyphens (`-`) and some are written with parentheses (`(`,`)`). In this
exercise, you’ll figure out which phone numbers have these issues so
that you know which ones need fixing.

**Steps**

1.  Filter for rows with phone numbers that contain `"-"`s.

``` r
# 1. Filter for rows with "-" in the phone column
sfo_survey_mod %>%
  filter(phone %>% str_detect("-"))
```

    ## # A tibble: 1,421 × 15
    ##       id day   airline destination dest_region dest_size boarding_area dept_time
    ##    <int> <chr> <chr>   <chr>       <chr>       <chr>     <chr>         <chr>    
    ##  1  1844 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  2  1840 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  3  3010 Wedn… AMERIC… MIAMI       East US     Hub       Gates 50-59   2018-12-…
    ##  4  2097 Mond… UNITED… MEXICO CITY Canada/Mex… Hub       Gates 91-102  2018-12-…
    ##  5  1835 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  6  1849 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  7  2289 Wedn… QANTAS  SYDNEY      Australia/… Hub       Gates 1-12    2018-12-…
    ##  8   105 Tues… UNITED  WASHINGTON… East US     Medium    Gates 70-90   2018-12-…
    ##  9  1973 Frid… CATHAY… HONG KONG   Asia        Hub       Gates 1-12    2018-12-…
    ## 10  2385 Wedn… UNITED… SYDNEY      Australia/… Hub       Gates 91-102  2018-12-…
    ## # … with 1,411 more rows, and 7 more variables: wait_min <dbl>,
    ## #   cleanliness <chr>, safety <chr>, satisfaction <chr>, phone <chr>,
    ## #   dest_size_trimmed <chr>, cleanliness_lower <chr>

2.  Filter for rows with phone numbers that contain `"("`, or `")"`.
    Remember to use `fixed()` when searching for parentheses.

``` r
# 2. Filter for rows with "(" or ")" in the phone column
sfo_survey_mod %>%
  filter(str_detect(phone, fixed("(")) | str_detect(phone, fixed(")")))
```

    ## # A tibble: 739 × 15
    ##       id day   airline destination dest_region dest_size boarding_area dept_time
    ##    <int> <chr> <chr>   <chr>       <chr>       <chr>     <chr>         <chr>    
    ##  1  3010 Wedn… AMERIC… MIAMI       East US     Hub       Gates 50-59   2018-12-…
    ##  2  2097 Mond… UNITED… MEXICO CITY Canada/Mex… Hub       Gates 91-102  2018-12-…
    ##  3  1835 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  4   105 Tues… UNITED  WASHINGTON… East US     Medium    Gates 70-90   2018-12-…
    ##  5  1973 Frid… CATHAY… HONG KONG   Asia        Hub       Gates 1-12    2018-12-…
    ##  6  2385 Wedn… UNITED… SYDNEY      Australia/… Hub       Gates 91-102  2018-12-…
    ##  7   517 Sund… UNITED  FT. LAUDER… East US     Large     Gates 60-69   2018-12-…
    ##  8  2885 Frid… EVA AIR TAIPEI      Asia        Hub       Gates 91-102  2018-12-…
    ##  9  2128 Wedn… FRONTI… DENVER      West US     Hub       Gates 20-39   2018-12-…
    ## 10  2132 Wedn… FRONTI… DENVER      West US     Hub       Gates 20-39   2018-12-…
    ## # … with 729 more rows, and 7 more variables: wait_min <dbl>,
    ## #   cleanliness <chr>, safety <chr>, satisfaction <chr>, phone <chr>,
    ## #   dest_size_trimmed <chr>, cleanliness_lower <chr>

Delightful detection! Now that you’ve identified the inconsistencies in
the `phone` column, it’s time to remove unnecessary characters to make
the follow-up survey go as smoothly as possible.

## Correcting inconsistent text data

### Replacing and removing

In the last section, you saw that the `phone` column of `sfo_data` is
plagued with unnecessary parentheses and hyphens. The customer support
team has requested that all phone numbers be in the format
`"123 456 7890"`.

**Steps**

1.  Remove opening and closing parentheses from the `phone` column.
    Store this as a variable called `phone_no_parens`. Remember to use
    `fixed()`!
2.  Add a new column to `sfo_survey` called `phone_no_parens` that
    contains the contents of `phone_no_parens`.
3.  Create a new column of `sfo_survey` called `phone_clean` containing
    the values of `phone_no_parens` with all hyphens replaced with
    spaces.

``` r
# 1. Remove parentheses from phone column
phone_no_parens <- sfo_survey_mod$phone %>%
  # Remove "("s
  str_remove_all(fixed("(")) %>%
  # Remove ")"s
  str_remove_all(fixed(")"))

# 2. Add phone_no_parens as column
sfo_survey_mod %>%
  mutate(phone_no_parens = phone_no_parens,
  # 3. Replace all hyphens in phone_no_parens with spaces
         phone_clean = str_replace_all(phone_no_parens, "-", " "))
```

    ## # A tibble: 2,809 × 17
    ##       id day   airline destination dest_region dest_size boarding_area dept_time
    ##    <int> <chr> <chr>   <chr>       <chr>       <chr>     <chr>         <chr>    
    ##  1  1842 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  2  1844 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  3  1840 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  4  1837 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  5  1833 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  6  3010 Wedn… AMERIC… MIAMI       East US     Hub       Gates 50-59   2018-12-…
    ##  7  1838 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  8  1845 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  9  2097 Mond… UNITED… MEXICO CITY Canada/Mex… Hub       Gates 91-102  2018-12-…
    ## 10  1846 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ## # … with 2,799 more rows, and 9 more variables: wait_min <dbl>,
    ## #   cleanliness <chr>, safety <chr>, satisfaction <chr>, phone <chr>,
    ## #   dest_size_trimmed <chr>, cleanliness_lower <chr>, phone_no_parens <chr>,
    ## #   phone_clean <chr>

Radical replacing and removing! Now that your phone numbers are all in a
single format, the machines in the call center will be able to auto-dial
the numbers, making it easier to ask participants follow-up questions.

### Invalid format

The customer support team is grateful for your work so far, but during
their first day of calling participants, they ran into some phone
numbers that were invalid. In this section, you’ll remove any rows with
invalid phone numbers so that these faulty numbers don’t keep slowing
the team down.

**Steps**

1.  Examine the invalid `phone` numbers by filtering for numbers whose
    length is not equal to 12.

``` r
# 1. Check out the invalid numbers
sfo_survey_mod %>%
  filter(str_length(phone_no_parens) != 12)
```

    ## # A tibble: 5 × 15
    ##      id day    airline destination dest_region dest_size boarding_area dept_time
    ##   <int> <chr>  <chr>   <chr>       <chr>       <chr>     <chr>         <chr>    
    ## 1  2262 Satur… UNITED  BAKERSFIELD West US     Small     Gates 70-90   2018-12-…
    ## 2  3081 Sunday COPA    PANAMA CITY Central/So… Medium    Gates 1-12    2018-12-…
    ## 3   340 Wedne… SOUTHW… PHOENIX     West US     Hub       Gates 20-39   2018-12-…
    ## 4  1128 Thurs… DELTA   MINNEAPOLI… Midwest US  Hub       Gates 40-48   2018-12-…
    ## 5   373 Friday ALASKA  SAN JOSE D… Canada/Mex… Small     Gates 50-59   2018-12-…
    ## # … with 7 more variables: wait_min <dbl>, cleanliness <chr>, safety <chr>,
    ## #   satisfaction <chr>, phone <chr>, dest_size_trimmed <chr>,
    ## #   cleanliness_lower <chr>

2.  Remove the rows with invalid numbers by filtering for numbers with a
    length of exactly 12.

``` r
# Remove rows with invalid numbers
sfo_survey_mod %>%
  filter(str_length(phone_no_parens) == 12)
```

    ## # A tibble: 2,804 × 15
    ##       id day   airline destination dest_region dest_size boarding_area dept_time
    ##    <int> <chr> <chr>   <chr>       <chr>       <chr>     <chr>         <chr>    
    ##  1  1842 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  2  1844 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  3  1840 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  4  1837 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  5  1833 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  6  3010 Wedn… AMERIC… MIAMI       East US     Hub       Gates 50-59   2018-12-…
    ##  7  1838 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  8  1845 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ##  9  2097 Mond… UNITED… MEXICO CITY Canada/Mex… Hub       Gates 91-102  2018-12-…
    ## 10  1846 Mond… TURKIS… ISTANBUL    Middle East Hub       Gates 91-102  2018-12-…
    ## # … with 2,794 more rows, and 7 more variables: wait_min <dbl>,
    ## #   cleanliness <chr>, safety <chr>, satisfaction <chr>, phone <chr>,
    ## #   dest_size_trimmed <chr>, cleanliness_lower <chr>

Mission accomplished! Thanks to your savvy string skills, the follow-up
survey will be done in no time!

## Uniformity

Theory. Coming soon …

**1. Uniformity**

Great work on Chapter 2! In this chapter, we’ll focus on more advanced
data cleaning problems.

**2. Uniformity**

The first problem we’ll tackle is uniformity. Uniformity issues are when
continuous data points have different units or different formats. For
example, temperature can be written in degrees Celsius or Fahrenheit,
weight can be measured in kilograms, grams, or pounds, money can be in
US dollars, UK pounds, or even Japanese yen, and dates can be written in
different orders.

**3. Where do uniformity issues come from?**

Uniformity issues arise when you’re using multiple data sources that may
store data in different ways, or from unstructured data entry that
doesn’t require specific units or formatting.

**4. Finding uniformity issues**

Let’s take a look at the nyc_temps dataset, which contains daily average
temperatures in New York City during April of 2019.

**5. Finding uniformity issues**

Since outliers can be a sign of uniformity issues, it’s usually helpful
to do some basic plotting to identify any outliers.Let’s create a
scatter plot of the dataset. This doesn’t look quite right - there are
three unusually high temperatures. An outdoor temperature of over 50
degrees Celsius would be very concerning.

**6. What to do?**

There’s no one best option for dealing with this data. In order to
figure out what to do, we’ll need to do some deeper research into the
dataset.There were no big climate events in New York during this month,
so there’s probably something else up with these values. After speaking
with the person in charge of temperature data collection, we learn that
on these three days, the thermometer was broken and data needed to be
pulled in from another source. However, this other source measured
temperature in Fahrenheit instead of Celsius.

**7. Unit conversion**

Since we know exactly why these data points aren’t uniform, we can
adjust them to fit with the rest of the data points. Here, we have the
formula to convert temperature in Fahrenheit to Celsius. We only want to
apply this formula to the ones that are in Fahrenheit. To do this, we’ll
use the ifelse function. ifelse takes in a condition, the value to use
if the condition is true, and the value to use if the condition is
false. Let’s add a column to nyc_temps called temp_c. ifelse will check
if the original temperature is over 50, convert it to Celsius if it is,
and keep the original temperature otherwise. The first temperature was
already in Celsius, so temp_c contains the same value, but 58-point-5
got converted to 14-point-7.

**8. Unit conversion**

If we create the same scatterplot as before using the temp_c column, the
temperatures all range between 4 and 20, which matches what we expected.

**9. Date uniformity**

Dates can also pose uniformity problems, since there are lots of
different ways to write them. In this example, dates are written in
three different ways.We can use special formatting strings to convert
them to uniform Date objects so they’re all written in the same way.
These are the ones we’ll need for this dataset, but there are so many
others like these - you can always type this in your R console to get a
list of all available date formats.

**10. Parsing multiple formats**

To convert these all to Date objects, we’ll use the parse_date_time
function from the lubridate package. We pass in the vector of dates to
convert, and a vector of format strings to the “orders” argument. This
contains the three different formats that we saw in our data frame.Just
like that, all of the dates are in the exact same format!If we try to
parse a date that’s not in one of the formats we specified, NA will be
returned instead.

**11. Ambiguous dates**

Sometimes dates can be ambiguous and you won’t be able to tell what
format they follow.For example, is this date in February or April? As
with other cleaning tasks, this is highly dependent on your data and
where it came from. One option is to treat these dates as missing. If
your data comes from multiple sources, you may notice that one source
uses one format and another source uses a different format. From there,
you’ll be able to make an educated guess about the format of the date
based on which source it came from. You can also try and figure out what
the format is based on other dates in the dataset. If you know there
should be one data point per date, you might be able to figure it out.

**12. Let’s practice!**

Time to practice unit and date conversions!

In this section, you’ll dive into more advanced data cleaning problems,
such as ensuring that weights are all written in kilograms instead of
pounds. You’ll also gain invaluable skills that will help you verify
that values have been added correctly and that missing values don’t
negatively impact your analyses.

Different units or formats:

-   **Temperature**: `°C` vs. `°F`  
-   **Weight**: `kg` vs. `g` vs. `lb`
-   **Money**: USD `$` vs. GBP `£` vs. JPY `¥`
-   **Date**: `DD-MM-YYYY` vs. `MM-DD-YYYY` vs. `YYYY-MM-DD`

### Date uniformity

**Data**

-   `accounts`

You work at an asset management company and you’ll be working with the
`accounts` dataset, which contains information about each customer, the
amount in their account, and the date their account was opened. Your
boss has asked you to calculate some summary statistics about the
average value of each account and whether the age of the account is
associated with a higher or lower account value. Before you can do this,
you need to make sure that the `accounts` dataset you’ve been given
doesn’t contain any uniformity problems. In this section, you’ll
investigate the `date_opened` column and clean it up so that all the
dates are in the same format.

**Packages**

-   `lubridate`

**Steps**

1.  Take a look at the head of `accounts` to get a sense of the data
    you’re working with.

``` r
accounts <- readRDS("data/accounts.rds")

# 1. Check out the accounts data frame
head(accounts)
```

    ## # A tibble: 6 × 3
    ##   id       date_opened         total
    ##   <fct>    <chr>               <dbl>
    ## 1 A880C79F 2003-10-19         169305
    ## 2 BE8222DF October 05, 2018   107460
    ## 3 19F9E113 2008-07-29       15297152
    ## 4 A2FE52A3 2005-06-09       14897272
    ## 5 F6DC2C08 2012-03-31         124568
    ## 6 D2E55799 2007-06-20       13635752

> ## *Question*
>
> Try running `as.Date(accounts$date_opened)` in the console and examine
> the output. Notice that you end up with a lot of `NAs`. Why is
> this?<br> <br> ⬜ `as.Date()` needs to be explicitly told the formats
> of every single date, including which dates are in which format.<br>
> ✅ By default, `as.Date()` can’t convert “Month DD, YYYY” formats.<br>
> ⬜ `as.Date()` can’t convert `character`s to `Date`s.<br>

**Steps**

1.  Convert the dates in the `date_opened` column to the same format
    using the `formats` vector and store this as a new column called
    `date_opened_clean`.

``` r
# 1.1 Define the date formats
formats <- c("%Y-%m-%d", "%B %d, %Y")

# 1.2 Convert dates to the same format
accounts %>%
  mutate(date_opened_clean = parse_date_time(date_opened,  orders = formats))
```

    ## # A tibble: 98 × 4
    ##    id       date_opened          total date_opened_clean  
    ##    <fct>    <chr>                <dbl> <dttm>             
    ##  1 A880C79F 2003-10-19          169305 2003-10-19 00:00:00
    ##  2 BE8222DF October 05, 2018    107460 2018-10-05 00:00:00
    ##  3 19F9E113 2008-07-29        15297152 2008-07-29 00:00:00
    ##  4 A2FE52A3 2005-06-09        14897272 2005-06-09 00:00:00
    ##  5 F6DC2C08 2012-03-31          124568 2012-03-31 00:00:00
    ##  6 D2E55799 2007-06-20        13635752 2007-06-20 00:00:00
    ##  7 53AE87EF December 01, 2017 15375984 2017-12-01 00:00:00
    ##  8 3E97F253 2019-06-03        14515800 2019-06-03 00:00:00
    ##  9 4AE79EA1 2011-05-07        23338536 2011-05-07 00:00:00
    ## 10 2322DFB4 2018-04-07          189524 2018-04-07 00:00:00
    ## # … with 88 more rows

Cunning calendar cleaning! Now that the `date_opened` dates are in the
same format, you’ll be able to use them for some plotting in the next
exercise.

### Currency uniformity

Now that your dates are in order, you’ll need to correct any unit
differences. When you first plot the data, you’ll notice that there’s a
group of very high values, and a group of relatively lower values. The
bank has two different offices - one in New York, and one in Tokyo, so
you suspect that the accounts managed by the Tokyo office are in
Japanese yen instead of U.S. dollars. Luckily, you have a data frame
called `account_offices` that indicates which office manages each
customer’s account, so you can use this information to figure out which
`total`s need to be converted from yen to dollars.

The formula to convert yen to dollars is `USD = JPY / 104`.

**Steps**

1.  Create a scatter plot with `date_opened` on the x-axis and `total`
    on the y-axis.

``` r
# 1. Scatter plot of opening date and total amount
accounts %>%
  ggplot(aes(x = date_opened, y = total)) +
  geom_point()
```

![](readme_files/figure-gfm/unnamed-chunk-42-1.png)<!-- -->

2.  Left join `accounts` and `account_offices` by their `id` columns.

``` r
account_offices <- readRDS("data/account_offices.rds")

# 2. Left join accounts and account_offices by id
accounts %>%
  left_join(account_offices)
```

    ## Joining, by = "id"

    ## # A tibble: 98 × 4
    ##    id       date_opened          total office  
    ##    <fct>    <chr>                <dbl> <chr>   
    ##  1 A880C79F 2003-10-19          169305 New York
    ##  2 BE8222DF October 05, 2018    107460 New York
    ##  3 19F9E113 2008-07-29        15297152 Tokyo   
    ##  4 A2FE52A3 2005-06-09        14897272 Tokyo   
    ##  5 F6DC2C08 2012-03-31          124568 New York
    ##  6 D2E55799 2007-06-20        13635752 Tokyo   
    ##  7 53AE87EF December 01, 2017 15375984 Tokyo   
    ##  8 3E97F253 2019-06-03        14515800 Tokyo   
    ##  9 4AE79EA1 2011-05-07        23338536 Tokyo   
    ## 10 2322DFB4 2018-04-07          189524 New York
    ## # … with 88 more rows

3.  Convert the `total`s from the Tokyo office from yen to dollars, and
    keep the `total` from the New York office in dollars. Store this as
    a new column called `total_usd`.

``` r
# Left join accounts to account_offices by id
accounts %>%
  left_join(account_offices, by = "id") %>%
  # 3. Convert totals from the Tokyo office to USD
  mutate(total_usd = ifelse(total > 5000000, total / 104, total))
```

    ## # A tibble: 98 × 5
    ##    id       date_opened          total office   total_usd
    ##    <fct>    <chr>                <dbl> <chr>        <dbl>
    ##  1 A880C79F 2003-10-19          169305 New York    169305
    ##  2 BE8222DF October 05, 2018    107460 New York    107460
    ##  3 19F9E113 2008-07-29        15297152 Tokyo       147088
    ##  4 A2FE52A3 2005-06-09        14897272 Tokyo       143243
    ##  5 F6DC2C08 2012-03-31          124568 New York    124568
    ##  6 D2E55799 2007-06-20        13635752 Tokyo       131113
    ##  7 53AE87EF December 01, 2017 15375984 Tokyo       147846
    ##  8 3E97F253 2019-06-03        14515800 Tokyo       139575
    ##  9 4AE79EA1 2011-05-07        23338536 Tokyo       224409
    ## 10 2322DFB4 2018-04-07          189524 New York    189524
    ## # … with 88 more rows

4.  Create a scatter plot of your new uniform data using `date_opened`
    on the x-axis and `total_usd` on the y-axis.

``` r
# Left join accounts to account_offices by id
accounts %>%
  left_join(account_offices, by = "id") %>%
  # Convert totals from the Tokyo office to USD
  mutate(total_usd = ifelse(office == "Tokyo", total / 104, total)) %>%
  # 4. Scatter plot of opening date vs total_usd
  ggplot(aes(x = date_opened, y = total_usd)) +
    geom_point()
```

![](readme_files/figure-gfm/unnamed-chunk-45-1.png)<!-- -->

Crafty currency conversion! The points in your last scatter plot all
fall within a much smaller range now and you’ll be able to accurately
assess the differences between accounts from different countries.

## Cross field validation

Theory. Coming soon …

**1. Cross field validation**

In this lesson, we’ll talk about using cross field validation to find
dirty data.

**2. What is cross field validation?**

Cross field validation is essentially a sanity check on your data to
check that one value makes sense based on other values in your
dataset.Here, 52% and 58% add up to 110%, which doesn’t make sense in
this context, so we know that one or more of these values are wrong.

**3. Credit card data**

Here’s a data frame called credit_cards, which contains information on
credit card accounts, including the date it was opened, the amount of
cash back the account has received on dining, groceries, and gas, as
well as the total cash back and the age of the account.

**4. Validating numbers**

For this type of credit card, there are only three categories of
purchases that you can earn cash back on, so we know that the three
categories should add up to the total.

**5. Validating numbers**

To find any accounts where the categories don’t sum up to the total, we
can first create a new column called theoretical_total, which contains
the sum of dining, grocery, and gas cash back. Then, we can filter for
rows where the theoretical_total is not equal to the total_cb, or the
actual total. We have two rows that don’t add up correctly.

**6. Validating date and age**

We can also validate dates and ages in a similar way, since we know that
the difference between today’s date and the date_opened should be the
account’s age.

**7. Calculating age**

To calculate age in years, we take the origin date, in this case Sept 9,
2015, and use the percent-minus-minus-percent operator followed by the
today function. This will calculate how much time has passed between the
origin date and today.However, this returns a special data type, so
we’ll need to convert it to numeric using as-dot-numeric. We’ll pass
“years” in quotes as the second argument to convert the time interval
into a number of years.Finally, if we want only the number of years, we
can use the floor function to get rid of the decimals.

**8. Validating age**

We can use the same mutate and filter strategy as we used when
validating the cash back totals. We’ll create a column called theor_age
to hold the calculated age, and compare it to the account age.We have
two accounts that have mismatched ages.

**9. What next?**

Once we find this invalid data, what do we do with it? Just like other
data cleaning problems, there is no one-size-fits-all solution, since
finding the best solution is dependent on the dataset.We can decide to
drop inconsistent data, set it to missing and impute it, or apply some
rules using domain knowledge, but in order to know what the best
approach is, we have to have a good understanding of where the dataset
comes from and the different sources feeding into it.

**10. Let’s practice!**

Time to do some cross field validation on your own!

-   Cross field validation = sanity check
-   Does this value makes senese based on another values?

![](readme_files/cross_field_validation.jpg)
<sup><https://www.buzzfeednews.com/article/katienotopoulos/graphs-that-lied-to-us></sup>

### Validating totals

You’ll continue to work with the `accounts` data frame, but this time,
you have a bit more information about each account. There are three
different funds that account holders can store their money in. In this
section, you’ll validate whether the `total` amount in each account is
equal to the sum of the amount in `fund_A`, `fund_B`, and `fund_C`. If
there are any accounts that don’t match up, you can look into them
further to see what went wrong in the bookkeeping that led to
inconsistencies.

**Steps**

1.  Create a new column called `theoretical_total` that contains the sum
    of the amounts in each fund.
2.  Find the accounts where the `total` doesn’t match the
    `theoretical_total`.

``` r
accounts_mod <- readRDS("data/accounts_mod.rds")

# Find invalid totals
accounts_mod %>%
  # 1. theoretical_total: sum of the three funds
  mutate(theoretical_total = fund_A + fund_B + fund_C) %>%
  # 2. Find accounts where total doesn't match theoretical_total
  filter(theoretical_total != total)
```

    ## # A tibble: 3 × 8
    ##   id       date_opened  total fund_A fund_B fund_C acct_age theoretical_total
    ##   <fct>    <date>       <dbl>  <int>  <int>  <int>    <dbl>             <int>
    ## 1 D5EB0F00 2001-04-16  130920  69487  48681  56408       20            174576
    ## 2 92C237C6 2005-12-13   85362  72556  21739  19537       16            113832
    ## 3 0E5B69F5 2018-05-07  134488  88475  44383  46475        3            179333

Great job! By using cross field validation, you’ve been able to detect
values that don’t make sense. How you choose to handle these values will
depend on the dataset.

### Validating age

Now that you found some inconsistencies in the `total` amounts, you’re
suspicious that there may also be inconsistencies in the
`acct_age`column, and you want to see if these inconsistencies are
related. Using the skills you learned from the video exercise, you’ll
need to validate the age of each account and see if rows with
inconsistent `acct_age`s are the same ones that had inconsistent
`total`s

**Steps**

1.  Create a new column called `theoretical_age` that contains the age
    of each account based on the `date_opened`.
2.  Find the accounts where the `acct_age` doesn’t match the
    `theoretical_age`.

``` r
# Find invalid acct_age
accounts_mod %>%
  # 1. theoretical_age: age of acct based on date_opened
  mutate(theoretical_age = floor(as.numeric(date_opened %--% today(), "years"))) %>%
  # 2. Filter for rows where acct_age is different from theoretical_age
  filter(acct_age != theoretical_age)
```

    ## # A tibble: 6 × 8
    ##   id       date_opened  total fund_A fund_B fund_C acct_age theoretical_age
    ##   <fct>    <date>       <dbl>  <int>  <int>  <int>    <dbl>           <dbl>
    ## 1 11C3C3C0 2017-12-24  180003  84295  31591  64117        3               4
    ## 2 64EF994F 2009-02-26  161141  89269  25939  45933       12              13
    ## 3 EA7FF83A 2004-11-02  111526  86856  19406   5264       16              17
    ## 4 14A2DDB7 2019-03-06  123163  49666  25407  48090        2               3
    ## 5 C5C6B79D 2008-03-01  188424  61972  69266  57186       13              14
    ## 6 3627E08A 2008-04-01  238104  60475  89011  88618       12              13

Vigorous validating! There are three accounts that all have ages off by
one year, but none of them are the same as the accounts that had `total`
inconsistencies, so it looks like these two bookkeeping errors may not
be related.

## Completeness

Theory. Coming soon …

**1. Completeness**

Welcome back! In this lesson, we’ll talk about completeness and missing
data.

**2. What is missing data?**

Missing data is one of the most common and most important data cleaning
problems. Data is considered “missing” when there is no value stored for
a variable in an observation. Missing data is most commonly represented
as NA or NaN, but can take on arbitrary values like 0, 99, or a dot.

**3. What is missing data?**

Like a lot of the problems that we’ve seen so far, missing data can
happen due to technical

**4. What is missing data?**

and human errors.Missing data can take many forms, so let’s take a look
at an example.

**5. Air quality**

Let’s take a look at the airquality dataset. It contains ozone, solar
radiation, wind, and temperature measurements for different days of the
year.

**6. Air quality**

Here, we have some missing values, which are represented as NA in R.

**7. Finding missing values**

We can find missing values in a dataset using the is-dot-na function,
which returns TRUE if a value is missing and FALSE if it’s not, for
every value in a data frame.

**8. Counting missing values**

If we wrap is-dot-na with sum, we get the total number of NAs in the
entire dataset. However, this isn’t separated by column, so we don’t
know where exactly our missing values are.

**9. Visualizing missing values**

That’s where visualization comes in. We can use the vis_miss function
from the visdat package. This will give us a plot that shows missing
values in black, and present values in gray. We can look down a column
of the plot to see how many missing values there are in each column, and
can look from left to right to get a sense if there are a lot of rows
with multiple missing values. Here, the Ozone column has the most
missing values. Solar radiation also has some missing values, but not as
many. None of the other columns have missing data.It looks like the
missingness is pretty random, but let’s take a deeper look.

**10. Investigating missingness**

Let’s see if there are any differences between the rows with missing and
non-missing ozone values.We’ll create a new column called miss_ozone,
using is-dot-na to determine if the row is missing the ozone value or
not. Then, we group by miss_ozone and use summarize_all, taking the
median of each variable. We also set na-dot-rm to TRUE so that the
median function ignores any missing values.The first row has the median
of each variable for all rows with non-missing ozone values, and the
second row has the median of each variable for all rows with missing
ozone. Most of the medians look quite similar, but there’s about a
thirty degree difference in temperature! This suggests that Ozone is
missing for days that had high temperatures.

**11. Investigating missingness**

If we sort the observations by temperature, then use vis_miss, we can
see that all the missing values of Ozone are clustered in last
observations, which are the observations with the highest temperatures.
Something must break in the sensor when it gets too hot out!

**12. Types of missing data**

Let’s talk about the types of missing data. Data can be missing
completely at random, missing at random, or missing not at random.

**13. Types of missing data**

When data is missing completely at random, there is no pattern to the
missingness and no relationship between missing data and any other
values. This could happen from something like data entry errors.

**14. Types of missing data**

When data is missing at random, there is a systematic relationship
between missing data and other observed values in the dataset. This is
just like what we observed with the air quality data where there was a
relationship between missingness and temperature. “Missing at random” is
actually a misleading name, since there’s nothing random about this type
of missing data.

**15. Types of missingness**

When data is missing not at random, there is a systematic relationship
between the missing data and unobserved values. For example, when it’s
really hot outside, the thermometer might stop working, so we don’t have
temperature measurements for days with high temperatures. However, we
have no way to tell this just from looking at the data since we can’t
actually see what the missing temperatures are.

**16. Dealing with missing data**

There are lots of ways to deal with missing data. We can remove any rows
that contain missing data. We can also impute, or fill in, missing
values using statistical measures or domain knowledge.There are also
more complicated algorithmic approaches or ones that require some
machine learning. Each missingness type requires a specific approach,
and each type of approach has pros and cons. To learn more, check out
these courses!

**17. Dropping missing values**

We can remove rows with missing values by filtering for rows where the
Ozone value is not NA and the Solar radiation value is not NA.

**18. Replacing missing values**

We can replace missing values using mutate combined with ifelse. We
create a new column called ozone_filled. If the Ozone value is missing,
we use the mean Ozone value. If the Ozone value isn’t missing, we use
the original value.

**19. Let’s practice!**

Now that you know how to tackle missing data, time to practice!

### Types of missingness

The three flavors of missing data:

![](readme_files/types_of_missingness.png)

**Example:** Types of missingness.

| Missing completely at random                   | Missing at random                                                                                                                             | Missing not at random                                                                                                                                |
|------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Questionnaires were randomly lost in the mail. | Younger people were less likely to get their blood pressure checked at the doctor, so their medical records were missing blood pressure data. | Blood samples tested during the night shift were more likely to be contaminated, creating missing test results, but time of testing wasn’t recorded. |
|                                                | Test scores are missing for students from a certain school district, but not the others.                                                      | A scale has a limit of 30 lbs, so shipments above 30 lbs don’t have a recorded weight.                                                               |

### Visualizing missing data

Dealing with missing data is one of the most common tasks in data
science. There are a variety of types of missingness, as well as a
variety of types of solutions to missing data.

**Data**

-   `accounts_new`

You just received a new version of the `accounts` data frame containing
data on the amount held and amount invested for new and existing
customers. However, there are rows with missing `inv_amount` values.

You know for a fact that most customers below 25 do not have investment
accounts yet, and suspect it could be driving the missingness.

**Packages**

-   <code><a href="https://docs.ropensci.org/visdat/">visdat</a></code>

**Steps**

1.  Visualize the missing values in `accounts` by column using a
    function from the `visdat` package.

``` r
accounts_new <- readRDS("data/accounts_new.rds")

#library
library(visdat)

# 1. Visualize the missing values by column
accounts_new %>%
    vis_miss()
```

![](readme_files/figure-gfm/unnamed-chunk-48-1.png)<!-- -->

2.  Add a logical column to `accounts` called `missing_inv` that
    indicates whether each row is missing the `inv_amount` or not.
3.  Group by `missing_inv`.
4.  Calculate the mean age for each group of `missing_inv`.

``` r
accounts_new %>%
  # 2. missing_inv: Is inv_amount missing?
  mutate(missing_inv = is.na(inv_amount)) %>%
  # 3. Group by missing_inv
  group_by(missing_inv) %>%
  # 4. Calculate mean age for each missing_inv group
  summarise(avg_age = mean(age))
```

    ## # A tibble: 2 × 2
    ##   missing_inv avg_age
    ##   <lgl>         <dbl>
    ## 1 FALSE          43.6
    ## 2 TRUE           21.8

> ## *Question*
>
> Take a look at the mean age for each group of `missing_inv`. What’s
> going on here?<br> <br> ⬜ The data is missing completely at random
> and there are no drivers behind the missingness.<br> ✅ Since the
> average age for `TRUE` `missing_inv` is 22 and the average age for
> `FALSE` `missing_inv` is 44, it is likely that the `inv_amount`
> variable is missing mostly in young customers.<br> ⬜ Since the
> average age for `FALSE` `missing_inv` is 22 and the average age for
> `TRUE` `missing_inv` is 44, it is likely that the `inv_amount`
> variable is missing mostly in older customers.<br>

5.  Sort `accounts` by `age`.
6.  Visualize missing data by column.

``` r
# 5. / 6. Sort by age and visualize missing vals
accounts_new %>%
  arrange(age) %>%
  vis_miss()
```

![](readme_files/figure-gfm/unnamed-chunk-50-1.png)<!-- -->

Fabulous visualizations! Investigating summary statistics based on
missingness is a great way to determine if data is missing completely at
random or missing at random.

### Treating missing data

Simple Approaches

1.  Drop missing data
2.  Impute (fill in) with statistical measures (mean, median, mode, …)
    or domain knowledge

More complex approaches

1.  Impute using an algorithmic approach
2.  Impute with machine learning models

**Data**

-   `accounts_new2`

In this section, you’re working with another version of the `accounts`
data that contains missing values for both the `cust_id` and
`acct_amount` columns.

You want to figure out how many unique customers the bank has, as well
as the average amount held by customers. You know that rows with missing
`cust_id` don’t really help you, and that on average, the `acct_amount`
is usually 5 times the amount of `inv_amount`.

In this task, you will drop rows of `accounts` with missing `cust_id`s,
and impute missing values of `inv_amount` with some domain knowledge.
`dplyr` and `assertive` are loaded and `accounts` is available.

**Steps**

1.  Filter `accounts` to remove rows with missing `cust_id`s and save as
    `accounts_clean`.

``` r
accounts_new2 <- readRDS("data/accounts_new2.rds")

# 1. Create accounts_clean
accounts_clean <- accounts_new2 %>%
  # Filter to remove rows with missing cust_id
  filter(!is.na(cust_id))

accounts_clean
```

    ## # A tibble: 88 × 5
    ##    cust_id  acct_amount inv_amount account_opened last_transaction
    ##    <fct>          <dbl>      <dbl> <fct>          <fct>           
    ##  1 8C35540A      44245.     35500. 03-05-18       30-09-19        
    ##  2 D5536652         NA      81922. 21-01-18       14-01-19        
    ##  3 A631984D         NA      46412. 26-01-18       06-10-19        
    ##  4 93F2F951         NA      76563. 21-08-17       10-07-19        
    ##  5 DE0A0882         NA      18669. 05-06-17       15-01-19        
    ##  6 25E68E1B     109738.     93553. 26-12-17       12-11-18        
    ##  7 3FA9296D         NA      70358. 21-06-18       24-08-18        
    ##  8 984403B9         NA      14430. 07-10-17       18-05-18        
    ##  9 870A9281      63523.     51297. 02-09-18       22-02-19        
    ## 10 166B05B0      38175.     15053. 28-02-19       31-10-18        
    ## # … with 78 more rows

2.  Create a new column called `acct_amount_filled`, which contains the
    values of `acct_amount`, except all `NA` values should be replaced
    with 5 times the amount in `inv_amount`.

``` r
# 2. Create accounts_clean
accounts_clean <- accounts_new2 %>%
  # Filter to remove rows with missing cust_id
  filter(!is.na(cust_id)) %>%
  # Add new col acct_amount_filled with replaced NAs
  mutate(acct_amount_filled = ifelse(is.na(acct_amount), 5 * inv_amount, acct_amount))

accounts_clean
```

    ## # A tibble: 88 × 6
    ##    cust_id  acct_amount inv_amount account_opened last_transaction
    ##    <fct>          <dbl>      <dbl> <fct>          <fct>           
    ##  1 8C35540A      44245.     35500. 03-05-18       30-09-19        
    ##  2 D5536652         NA      81922. 21-01-18       14-01-19        
    ##  3 A631984D         NA      46412. 26-01-18       06-10-19        
    ##  4 93F2F951         NA      76563. 21-08-17       10-07-19        
    ##  5 DE0A0882         NA      18669. 05-06-17       15-01-19        
    ##  6 25E68E1B     109738.     93553. 26-12-17       12-11-18        
    ##  7 3FA9296D         NA      70358. 21-06-18       24-08-18        
    ##  8 984403B9         NA      14430. 07-10-17       18-05-18        
    ##  9 870A9281      63523.     51297. 02-09-18       22-02-19        
    ## 10 166B05B0      38175.     15053. 28-02-19       31-10-18        
    ## # … with 78 more rows, and 1 more variable: acct_amount_filled <dbl>

3.  Assert that there are no missing values in the `cust_id` column of
    `accounts_clean`.

``` r
# 3. Assert that cust_id has no missin
assert_all_are_not_na(accounts_clean$cust_id)
```

4.  Assert that there are no missing values in the `acct_amount_filled`
    column of `accounts_clean`.

``` r
# 4. Assert that acct_amount_filled has no missing vals
assert_all_are_not_na(accounts_clean$acct_amount_filled)
```

Great job! Since your assertions passed, there’s no missing data left,
and you can definitely *bank* on nailing your analysis!

# 3. Record Linkage

## Comparing strings

**1. Comparing strings**

Welcome to the final chapter of the course! In this chapter, we’ll be
focusing on string matching and record linkage.

**2. Measuring distance between values**

If we have two values, a 3 and a 10,

**3. Measuring distance between values**

we can measure the distance between them

**4. Measuring distance between values**

using subtraction. The distance between them is 10 minus 3, which is 7.
Comparing numbers is easy, but how do we compare strings? Before we dive
into record linkage, we need to learn about how to measure distance
between strings.

**5. Minimum edit distance**

Edit distance is a way of measuring how different two strings are from
each other, based on the four basic kinds of typos, which are inserting
a character,

**6. Minimum edit distance**

deleting a character,

**7. Minimum edit distance**

substituting one character for another,

**8. Minimum edit distance**

and transposing, or swapping the positions of, two characters. Minimum
edit distance is the fewest number of typos you’d need to convert one
string to another.

**9. Edit distance = 1**

Here are some examples. To turn “dog” into “dogs”, we insert an “s”.

**10. Edit distance = 1**

To turn “bath” into “bat”, we remove the “h”.

**11. Edit distance = 1**

To turn “cats” into “rats”, we substitute an “r” for the “c”.

**12. Edit distance = 1**

To turn “sing” into “sign”, we swap the positions of the “n” and the
“g”. Since all of these pairs require only one edit, they all have an
edit distance of 1.

**13. A more complex example**

Let’s look at a more complex example and calculate the edit distance
between “baboon” and “typhoon”.

**14. A more complex example**

First, we’ll need to insert an “h”.

**15. A more complex example**

Then, we’ll need to substitute “t” for “b”,

**16. A more complex example**

substitute “y” for “a”,

**17. A more complex example**

and substitute “p” for “b”. This gives us a total of 4 actions, or an
edit distance of 4.

**18. Types of edit distance**

There are multiple types of edit distance that each calculate distance
between strings a little differently. The Damerau-Levenshtein distance
is what you just learned. The Levenshtein distance does not count
transposition as a single action - instead, it counts as 2: a deletion
and an insertion. The Longest Common Subsequence, or LCS, distance
considers only insertion and deletion as actions. There are also other
more complex ways of calculating string distance, such as Jaro-Winkler
or Jaccard distance. Each method has a relative advantage in different
circumstances, but going into the details of when to use each one is out
of the scope of the course. However, feel free to experiment with the
different methods and use the one that gives you the best results.

**19. String distance in R**

Let’s go back to our baboon-typhoon example. To calculate edit distances
in R, you can use stringdist from the stringdist package, passing it the
two strings to compare and the method you want to use. In this case,
we’re using “dl”, which stands for Damerau-Levenshtein.

**20. Other methods**

Using the method argument, we can also calculate different types of
distances that we’ve discussed. The output of Jaccard is on a scale of 0
to 1, where numbers closer to 0 indicate that the strings are more
similar.

**21. Comparing strings to clean data**

In chapter 2, you collapsed multiple categories into one using manually
defined categories. But if there are too many variations to type out, we
can use string distance to map them to the correct category.

**22. Comparing strings to clean data**

Here’s a survey where participants in New York, Chicago, Los Angeles,
and Seattle were asked where they currently live, and how likely they
are to consider moving away on a scale of 1 to 5. The survey had free
text entry, so the city column is riddled with typos. To map them to the
correct spelling, we can compare the distance between each survey
response and the set of possible answers, and choose the one that’s
closest.

**23. Remapping using string distance**

The fuzzyjoin package allows us to do joins based on string distance. We
can use stringdist_left_join to join the survey data to cities. Just
like the stringdist function, we can pass in the method we want to use
for string distance.

**24. Remapping using string distance**

We can also use the max_dist argument to adjust how close we want the
strings to be in order to consider them a match. Notice how we get an
NA, since the typo in row 8 wasn’t close enough to any of the cities to
be assigned to one.

------------------------------------------------------------------------

Record linkage is a powerful technique used to merge multiple datasets
together, used when values have typos or different spellings. In this
section, you’ll learn how to link records by calculating the similarity
between strings—you’ll then use your new skills to join two restaurant
review datasets into one clean master dataset.

**Link or join?**

Similar to joins, record linkage is the act of linking data from
different sources regarding the same entity. But unlike joins, record
linkage does not require exact matches between different pairs of data,
and instead can find close matches using string similarity. This is why
record linkage is effective when there are no common unique keys between
the data sources you can rely upon when linking data sources such as a
unique identifier.

**Example:** Which problems require record linkage and which problems
can be approached using a standard join.

| Record Linkage                                                                                                                                | Regular joins                                                                                                                     |
|-----------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Two customer data frames containing names and address, one with a unique identifier per customer, one without.                                | Consolidating two data frames containing details on DataCamp courses, with each DataCamp course having its own unique identifier. |
| Using an `address` column to join two data frames, with the address in each data frame formatted slightly differently.                        | Two basketball DataFrames with a common unique identifier per game.                                                               |
| Merging two basketball data frames, with columns `team_A`, `team_B`, and `time` and differently formatted team names between each data frame. |                                                                                                                                   |

## stringdist(): Calculating distance

The Damerau-Levenshtein distance can be used to identify how similar two
strings are. As a reminder, Damerau-Levenshtein distance is the
<ins>minimum number of steps</ins> needed to get from ***String A*** to
***String B***, using these operations:

-   **Insertion** of a new character.
-   **Deletion** of an existing character.
-   **Substitution** of an existing character.
-   **Transposition** of two existing consecutive characters.

**Example:** Distance = 1 (method = “dl”)

![](readme_files/distance.png)

> ## *Question*
>
> What is the Damerau-Levenshtein distance between the words `"puffin"`
> and `"muffins"` and which operation(s) gets you there?<br> <br> ⬜ 1
> by substituting `"m"` for `"p"`.<br> ⬜ 2 by inserting `"m"` and
> inserting `"s"`.<br> ✅ 2 by substituting `"m"` for `"p"` and
> inserting `"s"`.<br> ⬜ 3 by deleting `"p"`, adding `"m"`, and adding
> `"s"`.<br>

Crafty calculations! Substituting and inserting is the best way to get
from “puffin” to “muffins”.

**Packages**

-   `stringdist`

There are multiple ways to calculate how similar or different two
strings are. Now we’ll practice using the `stringdist` package to
compute string distances using various methods. It’s important to be
familiar with different methods, as some methods work better on certain
datasets, while others work better on other datasets.

**Steps**

1.  Calculate the Damerau-Levenshtein distance between `"las angelos"`
    and `"los angeles"`.

``` r
library(stringdist)

# 1. Calculate Damerau-Levenshtein distance
stringdist("las angelos", "los angeles", method = "dl")
```

    ## [1] 2

2.  Calculate the Longest Common Substring (LCS) distance between
    `"las angelos"` and `"los angeles"`.

``` r
# 2. Calculate LCS distance
stringdist("las angelos", "los angeles", method = "lcs")
```

    ## [1] 4

3.  Calculate the Jaccard distance between `"las angelos"` and
    `"los angeles"`.

``` r
# 3. Calculate Jaccard distance
stringdist("las angelos", "los angeles", method = "jaccard")
```

    ## [1] 0

> ## *Question*
>
> Why is the LCS distance higher than the Damerau-Levenshtein distance
> between “las angelos” and “los angeles”?<br> <br> ⬜
> Damerau-Levenshtein distance is smaller because it’s always a better
> method.<br> ✅ LCS distance only uses insertion and deletion, so it
> takes more operations to change a string to another.<br> ⬜ LCS
> distance only uses insertion, deletion, and substitution, so it takes
> more operations to change a string to another<br>

Superb `stringdist()` skills! In the next exercise, you’ll use
Damerau-Levenshtein distance to map typo-ridden cities to their true
spellings.

## fuzzyjoin(): Fixing typos with string distance

**Data**

-   `zagat`
-   `fodors`

In this section, one of the datasets you’ll be working with, `zagat`, is
a set of restaurants in New York, Los Angeles, Atlanta, San Francisco,
and Las Vegas. The data is from Zagat, a company that collects
restaurant reviews, and includes the restaurant names, addresses, phone
numbers, as well as other restaurant information.

The `city` column contains the name of the city that the restaurant is
located in. However, there are a number of typos throughout the column.
Your task is to map each `city` to one of the five correctly-spelled
cities contained in the `cities` data frame.

**Packages**

-   `fuzzyjoin`

**Steps**

1.  Count the number of each variation of `city` name in `zagat`.

``` r
zagat_mod <- readRDS("data/zagat_mod.rds")

# 1. Count the number of each city variation
zagat_mod %>%
  count(city)
```

    ## # A tibble: 63 × 2
    ##    city             n
    ##    <chr>        <int>
    ##  1 aatlanta         3
    ##  2 an francisco     1
    ##  3 aotlanta         2
    ##  4 atalanta         1
    ##  5 atanta           1
    ##  6 atlannta         2
    ##  7 atlanta         48
    ##  8 atlata           2
    ##  9 ew york          2
    ## 10 la vegas         2
    ## # … with 53 more rows

2.  Left join `zagat` and `cities` based on string distance using the
    `city` and `city_actual` columns.
3.  Select the `name`, `city`, and `city_actual` columns.

``` r
# Library
library(fuzzyjoin)

cities <- tibble(city_actual = c("new york", "los angeles", "atlanta", "san francisco", "las vegas"))

# Join zagat and cities and look at results
zagat_mod %>%
  # 2. Left join based on stringdist using city and city_actual cols
  stringdist_left_join(cities, by = c("city" = "city_actual"), method = "dl") %>%
  # 3. Select the name, city, and city_actual cols
  select(name, city, city_actual)
```

    ## # A tibble: 310 × 3
    ##    name                      city         city_actual
    ##    <chr>                     <chr>        <chr>      
    ##  1 apple pan the             llos angeles los angeles
    ##  2 asahi ramen               los angeles  los angeles
    ##  3 baja fresh                los angeles  los angeles
    ##  4 belvedere the             los angeles  los angeles
    ##  5 benita's frites           lo angeles   los angeles
    ##  6 bernard's                 los angeles  los angeles
    ##  7 bistro 45                 lo angeles   los angeles
    ##  8 brighton coffee shop      los angeles  los angeles
    ##  9 bristol farms market cafe los anegeles los angeles
    ## 10 cafe'50s                  los angeles  los angeles
    ## # … with 300 more rows

Fabulous fixing! Now that you’ve created consistent spelling for each
city, it will be much easier to compute summary statistics by city.

## Generating and comparing pairs

Theory. Coming soon …

**1. Generating and comparing pairs**

Now that we know how to compare strings to each other, let’s talk about
record linkage.

**2. When joins won’t work**

Here, we have two tables showing basketball game schedules from
different television networks. If we want to get a full list of the
basketball games being televised, we need to combine these two tables.

**3. When joins won’t work**

However, some of the games in the second table are duplicates of games
already listed in the first table. Since there’s no consistent
identifier between the two tables, a regular join won’t work. This is
where record linkage comes in.

**4. What is record linkage?**

Record linkage involves linking data together that comes from multiple
sources that don’t share a common identifier, but contain data on the
same entity.

**5. What is record linkage?**

Generally, we start by cleaning the different datasets.

**6. What is record linkage?**

Then, we find pairs of records, or rows, that we want to compare.

**7. What is record linkage?**

We compare those records to each other,

**8. What is record linkage?**

and score them based on how similar they are.

**9. What is record linkage?**

Finally, we link the most similar pairs together.Our string comparison
skills will come in handy for the third step, which is comparing the
pairs.

**10. What is record linkage?**

But before we can do this, we need to generate pairs.

**11. Pairs of records**

Here, we have two data frames, A and B, and we want to use record
linkage to identify if any of the records in Table A are referring to
the same person as any records in Table B.

**12. Generating pairs**

In order to figure out whether any of the rows are matches, we’ll need
to compare every single row in table A with every single row in table B.

**13. Generating pairs in R**

To generate pairs of rows in R, we can use the reclin package. The
pair_blocking function takes in our two data frames and returns an
object that contains every possible pair of records.

**14. Too many pairs**

But imagine if we had a thousand rows in each table. That means we’d
have a million possible pairs of records, so this approach isn’t
scalable.

**15. Blocking**

To solve this problem, what if we only choose pairs that have a matching
state? This drastically reduces the number of possible pairs - now we
only have 8 instead of 25.This technique is called blocking: we only
consider pairs when they agree on the blocking variable. In this case,
the blocking variable is state.

**16. Pair blocking in R**

To use blocking, we can use the same pair_blocking function, but this
time use the blocking_var argument, which takes in a column name as a
string. Just as we expected, we get 8 pairs instead of 25.

**17. Comparing pairs**

Now that we have our pairs, we’ll need to compare them to see which
pairs are the most similar.

**18. Comparing pairs**

We can do this by piping the output of pair_blocking to the
compare_pairs function. We use the by argument to indicate that the name
column of each data frame should be compared, and the default_comparator
argument to indicate how strings should be compared. Here, we’re using
the longest common subsequence method. Notice that there’s a set of
parentheses after lcs since we’re calling a function.The output shows a
table with each pair and the corresponding score between the name of
each pair.

**19. Comparing multiple columns**

We can also compare multiple columns of the data frames by passing a
vector of columns to the by argument.Now, we get a score for the name
column and the zip column.

**20. Different comparators**

We can also use different methods to compare strings, such as Jaccard or
Jaro-Winkler.

**21. Let’s practice!**

It’s time to compare and generate some pairs!

## reclin: Linking records with Pair Blocking

### Pair Blocking

------------------------------------------------------------------------

**Record Linkage**

<img src="readme_files/record_linkage.png" style="width:50.0%" />

**Too many pairs**

<img src="readme_files/pairs_all.png" style="width:50.0%" />

**Blocking**

<img src="readme_files/pairs_blocked.png" style="width:50.0%" />

------------------------------------------------------------------------

Zagat and Fodor’s are both companies that gather restaurant reviews. The
`zagat` and `fodors` datasets both contain information about various
restaurants, including addresses, phone numbers, and cuisine types. Some
restaurants appear in both datasets, but don’t necessarily have the same
exact name or phone number written down. In this section, you’ll work
towards figuring out which restaurants appear in both datasets.

The first step towards this goal is to generate pairs of records so that
you can compare them. You’ll first generate all possible pairs, and then
use your newly-cleaned `city` column as a blocking variable.

**Packages**

-   <code><a href="https://github.com/djvanderlaan/reclin">reclin</a></code>

**Steps**

1.  Generate all possible pairs of records between the `zagat` and
    `fodors` datasets (no blocking used).

``` r
zagat  <- readRDS("data/zagat.rds")
fodors <- readRDS("data/fodors.rds")

# Load reclin
library(reclin)

# 1. Generate all possible pairs
pair_blocking(zagat, fodors)
```

    ## Simple blocking
    ##   No blocking used.
    ##   First data set:  310 records
    ##   Second data set: 533 records
    ##   Total number of pairs: 165 230 pairs
    ## 
    ## ldat with 165 230 rows and 2 columns
    ##          x   y
    ## 1        1   1
    ## 2        2   1
    ## 3        3   1
    ## 4        4   1
    ## 5        5   1
    ## 6        6   1
    ## 7        7   1
    ## 8        8   1
    ## 9        9   1
    ## 10      10   1
    ## :        :   :
    ## 165221 301 533
    ## 165222 302 533
    ## 165223 303 533
    ## 165224 304 533
    ## 165225 305 533
    ## 165226 306 533
    ## 165227 307 533
    ## 165228 308 533
    ## 165229 309 533
    ## 165230 310 533

2.  Use pair blocking to generate only pairs that have matching values
    in the `city` column.

``` r
# 2. Generate pairs with same city
pair_blocking(zagat, fodors, blocking_var = "city")
```

    ## Simple blocking
    ##   Blocking variable(s): city
    ##   First data set:  310 records
    ##   Second data set: 533 records
    ##   Total number of pairs: 40 532 pairs
    ## 
    ## ldat with 40 532 rows and 2 columns
    ##         x   y
    ## 1       1   1
    ## 2       1   2
    ## 3       1   3
    ## 4       1   4
    ## 5       1   5
    ## 6       1   6
    ## 7       1   7
    ## 8       1   8
    ## 9       1   9
    ## 10      1  10
    ## :       :   :
    ## 40523 310 414
    ## 40524 310 415
    ## 40525 310 416
    ## 40526 310 417
    ## 40527 310 418
    ## 40528 310 419
    ## 40529 310 420
    ## 40530 310 421
    ## 40531 310 422
    ## 40532 310 423

Perfect pairings! By using `city` as a blocking variable, you were able
to reduce the number of pairs you’ll need to compare from 165,230 pairs
to 40,532.

### Comparing pairs

Now that you’ve generated the pairs of restaurants, it’s time to compare
them. You can easily customize how you perform your comparisons using
the `by` and `default_comparator` arguments. There’s no right answer as
to what each should be set to, so in this exercise, you’ll try a couple
options out.

**Steps**

1.  Compare pairs by `name` using `lcs()` distance.

``` r
# Generate pairs
pair_blocking(zagat, fodors, blocking_var = "city") %>%
  # 1. Compare pairs by name using lcs()
  compare_pairs(by = "name",
      default_comparator = lcs())
```

    ## Compare
    ##   By: name
    ## 
    ## Simple blocking
    ##   Blocking variable(s): city
    ##   First data set:  310 records
    ##   Second data set: 533 records
    ##   Total number of pairs: 40 532 pairs
    ## 
    ## ldat with 40 532 rows and 3 columns
    ##         x   y      name
    ## 1       1   1 0.3157895
    ## 2       1   2 0.3225806
    ## 3       1   3 0.2307692
    ## 4       1   4 0.2608696
    ## 5       1   5 0.4545455
    ## 6       1   6 0.2142857
    ## 7       1   7 0.1052632
    ## 8       1   8 0.2222222
    ## 9       1   9 0.3000000
    ## 10      1  10 0.4516129
    ## :       :   :         :
    ## 40523 310 414 0.3606557
    ## 40524 310 415 0.2631579
    ## 40525 310 416 0.2105263
    ## 40526 310 417 0.3750000
    ## 40527 310 418 0.2978723
    ## 40528 310 419 0.2727273
    ## 40529 310 420 0.3437500
    ## 40530 310 421 0.3414634
    ## 40531 310 422 0.4081633
    ## 40532 310 423 0.1714286

2.  Compare pairs by `name`, `phone`, and `addr` using `jaro_winkler()`.

``` r
# Generate pairs
pair_blocking(zagat, fodors, blocking_var = "city") %>%
  # 2. Compare pairs by name, phone, addr
  compare_pairs(by = c("name", "phone", "addr"),
      default_comparator = jaro_winkler())
```

    ## Compare
    ##   By: name, phone, addr
    ## 
    ## Simple blocking
    ##   Blocking variable(s): city
    ##   First data set:  310 records
    ##   Second data set: 533 records
    ##   Total number of pairs: 40 532 pairs
    ## 
    ## ldat with 40 532 rows and 5 columns
    ##         x   y      name     phone      addr
    ## 1       1   1 0.4871062 0.6746032 0.5703661
    ## 2       1   2 0.5234025 0.5555556 0.6140351
    ## 3       1   3 0.4564103 0.7222222 0.5486355
    ## 4       1   4 0.5102564 0.6746032 0.6842105
    ## 5       1   5 0.5982906 0.5793651 0.5515351
    ## 6       1   6 0.3581197 0.6746032 0.4825911
    ## 7       1   7 0.0000000 0.6269841 0.5457762
    ## 8       1   8 0.4256410 0.6269841 0.4979621
    ## 9       1   9 0.5013736 0.7777778 0.6342105
    ## 10      1  10 0.6011396 0.6746032 0.4654971
    ## :       :   :         :         :         :
    ## 40523 310 414 0.4972291 0.6666667 0.5158263
    ## 40524 310 415 0.5778143 0.6746032 0.5065359
    ## 40525 310 416 0.4426564 0.6666667 0.4294118
    ## 40526 310 417 0.5315404 0.7152778 0.7070387
    ## 40527 310 418 0.5271102 0.6111111 0.7135914
    ## 40528 310 419 0.5204981 0.6944444 0.5683007
    ## 40529 310 420 0.5635103 0.5833333 0.4928843
    ## 40530 310 421 0.4891899 0.6111111 0.6108883
    ## 40531 310 422 0.6204433 0.6746032 0.7774510
    ## 40532 310 423 0.4233716 0.6746032 0.7908497

Crafty comparisons! Choosing a comparator and the columns to compare is
highly dataset-dependent, so it’s best to try out different combinations
to see which works best on the dataset you’re working with. Next, you’ll
build on your string comparison skills and learn about record linkage!

## Scoring and linking

Theory. Coming soon …

**1. Scoring and linking**

Now that we’ve compared our pairs, it’s time to score them and link the
data together.

**2. Last lesson**

In the last lesson, we worked with these two data frames

**3. Where we left off**

and learned how to create and compare pairs of records. Remember that
the x and y columns contain the row numbers of each pair. However, all
of the comparison results are separated by column, so we’ll need to
combine them.

**4. Scoring pairs**

That’s where scoring comes in.

**5. Scoring with sums**

One way that we could combine the separate scores is by adding them
together.

**6. Summing**

We can do this using score_simsum, which will create a new column called
simsum that holds the total score for each row.

**7. Summing**

We can see that the highest score is between row 2 in df_A and row 3 in
df_B, which both referred to someone named Keaton Snyder.

**8. Disadvantages of summing**

However, summing doesn’t account for the fact that having a very similar
name is a stronger indicator that the records refer to the same person,
while having the same sex doesn’t tell us as much.Instead of summing, we
can use a probabilistic way of scoring that accounts for these
differences between variables.

**9. Scoring probabilistically**

We can use the score_problink function, which gives us a weight for each
row. The higher the weight, the more similar the pair is.The highest
weight is again between Keaton Z Snyder and Keaton Snyder.

**10. Linking pairs**

Now that we’ve scored each pair, how do we pick which ones are matches?

**11. Selecting matches**

We can select the pairs that we consider matches using select_n\_to_m.
This will select the matches with the highest scores, ensuring that any
record in one data frame is only linked to one record in the other data
frame at most.Here, the only pair considered a match is row 2 of df_A
and row 3 of df_B.

**12. Linking the data**

Now that we’ve selected which pairs are matches, we can finally link the
two data frames together using the link function.

**13. Linked data**

The left side holds the data from df_A, and the right side holds the
data from df_B. The first row has data for both sides, since that’s the
match we found, while the rest of the people were found only in one of
the two data frames.

**14. Let’s practice!**

Now that you’ve learned how to link data, let’s practice!

### Score then select or select then score?

Record linkage requires a number of steps that can be difficult to keep
straight. In this section, you’ll solidify your knowledge of the record
linkage process so that it’s a breeze when you code it yourself!

Steps of the record linkage process:

1.  Clean the datasets.
2.  Generate pairs of records.
3.  Compare separate columns of each pair.
4.  Score pairs using summing or probability.
5.  Select pairs that are matches based on their score.
6.  Link the datasets together.

### Putting it together

Above, you’ve cleaned up the `city` column of `zagat` using string
similarity, as well as generated and compared pairs of restaurants from
`zagat` and `fodors`. The end is near - all that’s left to do is score
and select pairs and link the data together, and you’ll be able to begin
your analysis in no time!

**Steps**

1.  Score the pairs of records probabilistically.
2.  Select the pairs that are considered matches.
3.  Link the two data frames together.

Note: comparing pairs by just one column only works with `reclin` 0.1.1.
Current version is 0.1.2.

``` r
# Create pairs
pair_blocking(zagat, fodors, blocking_var = "city") %>%
  # Compare pairs
  compare_pairs(by = "name", default_comparator = jaro_winkler()) %>%
  # 1. Score pairs
  score_problink() %>%
  # 2. Select pairs
  select_n_to_m() %>%
  # 3. Link data 
  link() %>%
  # Convert to tibble
  as_tibble() %>%
  select(id.x, name.x, city.x, id.y, name.y, city.y)
```

    ## Warning: `group_by_()` was deprecated in dplyr 0.7.0.
    ## Please use `group_by()` instead.
    ## See vignette('programming') for more help
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated.

    ## # A tibble: 535 × 6
    ##     id.x name.x                    city.x       id.y name.y            city.y   
    ##    <int> <chr>                     <fct>       <int> <chr>             <fct>    
    ##  1     0 apple pan the             los angeles   124 california pizza… los ange…
    ##  2     1 asahi ramen               los angeles   128 chan dara         los ange…
    ##  3     2 baja fresh                los angeles   121 ca  ` brea        los ange…
    ##  4     3 belvedere the             los angeles   131 dive !            los ange…
    ##  5     4 benita's frites           los angeles   149 louise's trattor… los ange…
    ##  6     5 bernard's                 los angeles   172 trader vic's      los ange…
    ##  7     6 bistro 45                 los angeles   118 bistro garden     los ange…
    ##  8     8 brighton coffee shop      los angeles   139 gladstone's       los ange…
    ##  9     9 bristol farms market cafe los angeles   129 clearwater cafe   los ange…
    ## 10    11 cafe'50s                  los angeles   157 paty's            los ange…
    ## # … with 525 more rows

Lovely linking! Now that your two datasets are merged, you can use the
data to figure out if there are certain characteristics that make a
restaurant more likely to be reviewed by Zagat or Fodor’s.

## Congratulations!

Theory. Coming soon …

**1. Congratulations!**

Congrats on finishing the course! You’re now equipped with data cleaning
skills.

**2. What you learned**

In this course, you learned how to diagnose dirty data, what the side
effects of dirty data are and how they can impact an analysis, and how
to clean data to prevent these side effects.

**3. Chapter 1: Common Data Problems**

In chapter 1, you learned about type constraints, range constraints and
uniqueness constraints.

**4. Chapter 2: Text and Categorical Data**

In chapter 2, you learned about problems specific to text and
categorical data, including membership constraints, cleaning categorical
variables, and cleaning text data.

**5. Chapter 3: Advanced Data Problems**

In chapter 3, you looked at more advanced data problems, like unifying
inconsistently formatted data, cross field validation, and dealing with
missing data.

**6. Chapter 4: Record Linkage**

In chapter 4, you learned how to use record linkage to link datasets
when traditional joins can’t be used.

**7. Expand and build upon your new skills**

There is still much more to learn to become a data cleaning expert!
Check out these courses where you can learn more about working with
categorical data, manipulating text data, and writing clean R code to
prevent dirty data in the first place.

**8. Congratulations!**

Don’t forget to apply the valuable skills you’ve learned to your own
data tasks. Congratulations, and have fun learning!
