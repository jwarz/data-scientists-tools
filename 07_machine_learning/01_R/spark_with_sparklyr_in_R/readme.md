Introduction to Spark with sparklyr in R
================
Joschka Schwarz

-   <a href="#1-light-my-fire-starting-to-use-spark-with-dplyr-syntax"
    id="toc-1-light-my-fire-starting-to-use-spark-with-dplyr-syntax">1.
    Light My Fire: Starting To Use Spark With dplyr Syntax</a>
    -   <a href="#getting-started" id="toc-getting-started">Getting started</a>
    -   <a href="#made-for-each-other" id="toc-made-for-each-other">Made for
        each other</a>
    -   <a href="#here-be-dragons" id="toc-here-be-dragons">Here be dragons</a>
    -   <a href="#the-connect-work-disconnect-pattern"
        id="toc-the-connect-work-disconnect-pattern">The connect-work-disconnect
        pattern</a>
    -   <a href="#copying-data-into-spark"
        id="toc-copying-data-into-spark">Copying data into Spark</a>
    -   <a href="#big-data-tiny-tibble" id="toc-big-data-tiny-tibble">Big data,
        tiny tibble</a>
    -   <a href="#exploring-the-structure-of-tibbles"
        id="toc-exploring-the-structure-of-tibbles">Exploring the structure of
        tibbles</a>
    -   <a href="#selecting-columns" id="toc-selecting-columns">Selecting
        columns</a>
    -   <a href="#filtering-rows" id="toc-filtering-rows">Filtering rows</a>
    -   <a href="#arranging-rows" id="toc-arranging-rows">Arranging rows</a>
    -   <a href="#mutating-columns" id="toc-mutating-columns">Mutating
        columns</a>
    -   <a href="#summarizing-columns" id="toc-summarizing-columns">Summarizing
        columns</a>
-   <a href="#2-tools-of-the-trade-advanced-dplyr-usage"
    id="toc-2-tools-of-the-trade-advanced-dplyr-usage">2. Tools of the
    Trade: Advanced dplyr Usage</a>
    -   <a href="#leveling-up" id="toc-leveling-up">Leveling up</a>
    -   <a href="#mothers-little-helper-1"
        id="toc-mothers-little-helper-1">Mother’s little helper (1)</a>
    -   <a href="#mothers-little-helper-2"
        id="toc-mothers-little-helper-2">Mother’s little helper (2)</a>
    -   <a href="#selecting-unique-rows"
        id="toc-selecting-unique-rows">Selecting unique rows</a>
    -   <a href="#common-people" id="toc-common-people">Common people</a>
    -   <a href="#collecting-data-back-from-spark"
        id="toc-collecting-data-back-from-spark">Collecting data back from
        Spark</a>
    -   <a href="#storing-intermediate-results"
        id="toc-storing-intermediate-results">Storing intermediate results</a>
    -   <a href="#groups-great-for-music-great-for-data"
        id="toc-groups-great-for-music-great-for-data">Groups: great for music,
        great for data</a>
    -   <a href="#groups-of-mutants" id="toc-groups-of-mutants">Groups of
        mutants</a>
    -   <a href="#advanced-selection-ii-the-sql"
        id="toc-advanced-selection-ii-the-sql">Advanced Selection II: The
        SQL</a>
    -   <a href="#left-joins" id="toc-left-joins">Left joins</a>
    -   <a href="#anti-joins" id="toc-anti-joins">Anti joins</a>
    -   <a href="#semi-joins" id="toc-semi-joins">Semi joins</a>
-   <a
    href="#3-going-native-use-the-native-interface-to-manipulate-spark-dataframes"
    id="toc-3-going-native-use-the-native-interface-to-manipulate-spark-dataframes">3.
    Going Native: Use The Native Interface to Manipulate Spark
    DataFrames</a>
    -   <a href="#two-new-interfaces" id="toc-two-new-interfaces">Two new
        interfaces</a>
    -   <a href="#popcorn-double-feature"
        id="toc-popcorn-double-feature">Popcorn double feature</a>
    -   <a href="#transforming-continuous-variables-to-logical"
        id="toc-transforming-continuous-variables-to-logical">Transforming
        continuous variables to logical</a>
    -   <a href="#transforming-continuous-variables-into-categorical-1"
        id="toc-transforming-continuous-variables-into-categorical-1">Transforming
        continuous variables into categorical (1)</a>
    -   <a href="#transforming-continuous-variables-into-categorical-2"
        id="toc-transforming-continuous-variables-into-categorical-2">Transforming
        continuous variables into categorical (2)</a>
    -   <a href="#more-than-words-tokenization-1"
        id="toc-more-than-words-tokenization-1">More than words: tokenization
        (1)</a>
    -   <a href="#more-than-words-tokenization-2"
        id="toc-more-than-words-tokenization-2">More than words: tokenization
        (2)</a>
    -   <a href="#more-than-words-tokenization-3"
        id="toc-more-than-words-tokenization-3">More than words: tokenization
        (3)</a>
    -   <a href="#sorting-vs-arranging" id="toc-sorting-vs-arranging">Sorting
        vs. arranging</a>
    -   <a href="#exploring-spark-data-types"
        id="toc-exploring-spark-data-types">Exploring Spark data types</a>
    -   <a href="#shrinking-the-data-by-sampling"
        id="toc-shrinking-the-data-by-sampling">Shrinking the data by
        sampling</a>
    -   <a href="#trainingtesting-partitions"
        id="toc-trainingtesting-partitions">Training/testing partitions</a>
-   <a
    href="#4-case-study-learning-to-be-a-machine-running-machine-learning-models-on-spark"
    id="toc-4-case-study-learning-to-be-a-machine-running-machine-learning-models-on-spark">4.
    Case Study: Learning to be a Machine: Running Machine Learning Models on
    Spark</a>
    -   <a href="#machine-learning-on-spark"
        id="toc-machine-learning-on-spark">Machine learning on Spark</a>
    -   <a href="#machine-learning-functions"
        id="toc-machine-learning-functions">Machine learning functions</a>
    -   <a href="#hey-you-whats-that-sound"
        id="toc-hey-you-whats-that-sound">(Hey you) What’s that sound?</a>
    -   <a href="#working-with-parquet-files"
        id="toc-working-with-parquet-files">Working with parquet files</a>
    -   <a href="#come-together" id="toc-come-together">Come together</a>
    -   <a href="#partitioning-data-with-a-group-effect"
        id="toc-partitioning-data-with-a-group-effect">Partitioning data with a
        group effect</a>
    -   <a href="#gradient-boosted-trees-modeling"
        id="toc-gradient-boosted-trees-modeling">Gradient boosted trees:
        modeling</a>
    -   <a href="#gradient-boosted-trees-prediction"
        id="toc-gradient-boosted-trees-prediction">Gradient boosted trees:
        prediction</a>
    -   <a href="#gradient-boosted-trees-visualization"
        id="toc-gradient-boosted-trees-visualization">Gradient boosted trees:
        visualization</a>
    -   <a href="#random-forest-modeling" id="toc-random-forest-modeling">Random
        Forest: modeling</a>
    -   <a href="#random-forest-prediction"
        id="toc-random-forest-prediction">Random Forest: prediction</a>
    -   <a href="#random-forest-visualization"
        id="toc-random-forest-visualization">Random Forest: visualization</a>
    -   <a href="#comparing-model-performance"
        id="toc-comparing-model-performance">Comparing model performance</a>

**Short Description**

Learn how to analyze huge datasets using Apache Spark and R using the
sparklyr package.

**Long Description**

R is mostly optimized to help you write data analysis code quickly and
readably. Apache Spark is designed to analyze huge datasets quickly. The
<code>sparklyr</code> package lets you write <code>dplyr</code> R code
that runs on a Spark cluster, giving you the best of both worlds. This
course teaches you how to manipulate Spark DataFrames using both the
<code>dplyr</code> interface and the native interface to Spark, as well
as trying machine learning techniques. Throughout the course, you’ll
explore the Million Song Dataset.

# 1. Light My Fire: Starting To Use Spark With dplyr Syntax

In which you learn how Spark and R complement each other, how to get
data to and from Spark, and how to manipulate Spark data frames using
dplyr syntax.

## Getting started

Theory. Coming soon …

**1. Getting started**

Hi, I’m Richie. Welcome to the course! In this chapter you are going to
learn how to work with Spark using the sparklyr’s dplyr interface.
Before we get to that, let’s take a moment to explore what Spark is.

**2. R logo**

R is a wonderful tool for data analysis, but by default the amount of
data that you can process with it is limited to what you can store in
RAM, on a single computer. For many datasets, that isn’t a problem, but
when you have really big data, you can run into trouble.

**3. Apache Spark logo**

Spark is a cluster computing platform. That means that your datasets and
your computations can be spread across several machines, effectively
removing the limit to the size of your datasets. All this happens
automatically, so you don’t need to worry about how your data is split
up.

**4. Sparklyr logo**

sparklyr is an R package that let’s you access Spark from R. That means
you get the power of R’s easy to write syntax, and the power of Spark’s
unlimited data handling. The icing on the cake is that sparklyr uses
dplyr syntax, so once you know dplyr, you are half way to knowing
sparklyr.

**5. Insert title here…**

The one potential problem is that Spark is new, and sparklyr is even
newer. That means that some features are missing, or tricky to use, and
many error messages aren’t as clear as they should be. This is the price
you pay for being a trendsetter. You need to expect a little pain to
gain all this power.

**6. Connect-work-disconnect**

The most important thing you will learn in this chapter is the workflow
pattern. First you connect to Spark, then you do your work, then you
disconnect. Since connecting to Spark takes several seconds, it is
sensible to connect once at the start of the day, and disconnect again
at the end.

**7. dplyr verbs**

dplyr provides a grammar of data transformation. There are five main
transformations that you can apply to a dataset. You can select columns,
filter rows, arrange the order of rows, change columns or add new
columns, and calculate summary statistics. These transformations work on
local data frames and on Spark data frames.

**8. Let’s practice!**

Don’t be afraid of the problems; I’ll see you in the course.

## Made for each other

R lets you write data analysis code quickly. With a bit of care, you can
also make your code easy to read, which means that you can easily
maintain your code too. In many cases, R is also fast enough at running
your code.

Unfortunately, R requires that all your data be analyzed in memory
(RAM), on a single machine. This limits how much data you can analyze
using R. There are a few solutions to this problem, including using
Spark.

Spark is an open source cluster computing platform. That means that you
can spread your data and your computations across multiple machines,
effectively letting you analyze an unlimited amount of data. The two
technologies complement each other strongly. By using R and Spark
together you can write code fast *and* run code fast!

`sparklyr` is an R package that lets you write R code to work with data
in a Spark cluster. It has a `dplyr` interface, which means that you can
write (more or less) the same `dplyr`-style R code, whether you are
working with data on your machine or on a Spark cluster.

R and Spark together let you write code fast and run code fast. This is
going to be fun!

## Here be dragons

Before you get too excited, a word of warning. Spark is still a very new
technology, and some niceties like clear error messages aren’t there
yet. So when things go wrong, it can be hard to understand why.

`sparklyr` is newer, and doesn’t have a full set of features. There are
some things that you just can’t do with Spark from R right now. The
Scala and Python interfaces to Spark are more mature.

That means that you are sailing into uncharted territory with this
course. The trip may be a little rough, so be prepared to be out of your
comfort zone occasionally.

One further note of caution is that in this course you’ll be running
code on your own personal Spark mini-cluster in the DataCamp cloud. This
is ideal for learning the concepts of how to use Spark, but you won’t
get the same performance boost as you would using a remote cluster on a
high-performance server. That means that the examples here won’t run
faster than if you were only using R, but you can use the skills you
learn here to run analyses on your own big datasets.

If you wish to install Spark on your local system, simply install the
`sparklyr` package and call `spark_install()` (or via brew).

## The connect-work-disconnect pattern

Working with `sparklyr` is very much like working with `dplyr` when you
have data inside a database. In fact, `sparklyr` converts your R code
into SQL code before passing it to Spark.

The typical workflow has three steps:

1.  Connect to Spark using `spark_connect()`.
2.  Do some work.
3.  Close the connection to Spark using `spark_disconnect()`.

In this exercise, you’ll do this simplest possible piece of work:
returning the version of Spark that is running, using
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/spark_version">`spark_version()`</a>.

<a href="https://www.rdocumentation.org/packages/sparklyr/topics/spark_connect">`spark_connect()`</a>
takes a URL that gives the location to Spark. For a local cluster (as
you are running), the URL should be `"local"`. For a remote cluster (on
another machine, typically a high-performance server), the connection
string will be a URL and port to connect on.

<a href="https://www.rdocumentation.org/packages/sparklyr/topics/spark_version">`spark_version()`</a>
and
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/spark_disconnect">`spark_disconnect()`</a>
both take the Spark connection as their only argument.

One word of warning. Connecting to a cluster takes several seconds, so
it is impractical to regularly connect and disconnect. While you need to
reconnect for each DataCamp exercise, when you incorporate `sparklyr`
into your own workflow, it is usually best to keep the connection open
for the whole time that you want to work with Spark.

**Steps**

1.  Load the `sparklyr` package with `library()`.
2.  Connect to Spark by calling `spark_connect()`, with argument
    `master = "local"`. Assign the result to `spark_conn`.
3.  Get the Spark version using `spark_version()`, with argument
    `sc = spark_conn`.
4.  Disconnect from Spark using `spark_disconnect()`, with argument
    `sc = spark_conn`.

``` r
# Load sparklyr
library(sparklyr)
```

    ## 
    ## Attaching package: 'sparklyr'

    ## The following object is masked from 'package:stats':
    ## 
    ##     filter

``` r
# Connect to your Spark cluster
spark_conn <- spark_connect("local")
```

    ## Warning in sprintf(versions$pattern, version$spark, version$hadoop): 2 arguments
    ## not used by format 'spark-3.2.1-bin-hadoop2.7'

``` r
# Print the version of Spark
spark_version(spark_conn)
```

    ## [1] '3.2.1'

``` r
# Disconnect from Spark
spark_disconnect(spark_conn)
```

Check out your big data skills! You’ve just worked with Spark!

## Copying data into Spark

<!--
- Learn how to move data from R to Spark.
- Copy the `track_metadata` data frame to Spark using `copy_to()`.
- Use a 10k rows subset of the dataset, since copying is slow.
- Make a big deal out of how slow copying data is, since this will be important later.
- List the datasets available in Spark using `src_tbls()`.
-->

Before you can do any real work using Spark, you need to get your data
into it. `sparklyr` has some functions such as
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/spark_read_csv">`spark_read_csv()`</a>
that will read a CSV file into Spark. More generally, it is useful to be
able to copy data from R to Spark. This is done with `dplyr`’s
<a href="https://www.rdocumentation.org/packages/dplyr/topics/copy_to">`copy_to()`</a>
function. Be warned: copying data is a fundamentally slow process. In
fact, a lot of strategy regarding optimizing performance when working
with big datasets is to find ways of avoiding copying the data from one
location to another.

<a href="https://www.rdocumentation.org/packages/dplyr/topics/copy_to">`copy_to()`</a>
takes two arguments: a Spark connection (`dest`), and a data frame
(`df`) to copy over to Spark.

Once you have copied your data into Spark, you might want some
reassurance that it has actually worked. You can see a list of all the
data frames stored in Spark using
<a href="https://www.rdocumentation.org/packages/dplyr/topics/src_tbls">`src_tbls()`</a>,
which simply takes a Spark connection argument (`x`).

Throughout the course, you will explore track metadata from the
<a href="https://labrosa.ee.columbia.edu/millionsong">Million Song
Dataset</a>. While Spark will happily scale well past a million rows of
data, to keep things simple and responsive, you will use a thousand
track subset. To clarify the terminology: a *track* refers to a row in
the dataset. For your thousand track dataset, this is the same thing as
a *song* (though the full million row dataset suffered from some
duplicate songs).

**Steps**

1.  Load `track_metadata`, containing the song name, artist name, and
    other metadata for 1,000 tracks.
2.  Use `str()` to explore the `track_metadata` dataset.

``` r
# Load dplyr
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
# Load data
track_metadata <- readRDS("data/track_metadata.rds")

# Explore track_metadata structure
str(track_metadata)
```

    ## tibble [1,000 × 11] (S3: tbl_df/tbl/data.frame)
    ##  $ track_id          : chr [1:1000] "TRSTWXA12903D15238" "TRQNQZX128F422BA2F" "TRTPVEB128F42614A6" "TRZZNFB128F933E7D2" ...
    ##  $ title             : chr [1:1000] "The Breeze and I" "Soul Of A Short Fat Man" "The Galloping Latin" "The Twelfth Of Never" ...
    ##  $ song_id           : chr [1:1000] "SOCQMXH12AC468B61D" "SOWULXB12A6D4FC1AD" "SOHKYIC12A8AE48D00" "SOJVHKV12AB0182669" ...
    ##  $ release           : chr [1:1000] "Espana" "Diary Of A Band Vol 1 & 2" "The Blues; That's Me!" "Give Me Just A Little More Time + In Session&plus" ...
    ##  $ artist_id         : chr [1:1000] "ARNNU4G1187FB5991B" "ARJ9DSA1187B990E00" "ARQ8CJ61187FB3DC9C" "ARFAKTH1187B9B0C18" ...
    ##  $ artist_mbid       : chr [1:1000] "5c176092-cb4d-4e05-806b-1e9414f2b28c" "4756395c-57ed-4a63-afb2-01117f14dff6" "15ab8bb8-7348-4377-ab73-b7acdad1459c" "0174d942-39da-4dcd-aa48-d0f3fb4f218d" ...
    ##  $ artist_name       : chr [1:1000] "101 Strings" "John Mayall & The Bluesbreakers" "Illinois Jacquet" "Chairmen Of The Board" ...
    ##  $ duration          : num [1:1000] 221 368 329 193 321 ...
    ##  $ artist_familiarity: num [1:1000] 0.467 0.627 0.441 0.536 0.787 ...
    ##  $ artist_hotttnesss : num [1:1000] 0.369 0.405 0.355 0.415 0.495 ...
    ##  $ year              : int [1:1000] 1968 1968 1969 1970 1972 1977 1978 1979 1979 1979 ...

3.  Connect to your local Spark cluster, storing the connection in
    `spark_conn`.
4.  Copy `track_metadata` to the Spark cluster using `copy_to()` .
5.  See which data frames are available in Spark, using `src_tbls()`.
6.  Disconnect from Spark.

``` r
# Connect to your Spark cluster
spark_conn <- spark_connect("local")
```

    ## Warning in sprintf(versions$pattern, version$spark, version$hadoop): 2 arguments
    ## not used by format 'spark-3.2.1-bin-hadoop2.7'

``` r
# Copy track_metadata to Spark
track_metadata_tbl <- copy_to(spark_conn, track_metadata)

# List the data frames available in Spark
src_tbls(spark_conn)
```

    ## [1] "track_metadata"

``` r
# Disconnect from Spark
# spark_disconnect(spark_conn)
```

I hope you didn’t copy the answer! Copying data between R and Spark is
slow, so it’s best to minimize how many times you do it.

## Big data, tiny tibble

In the last exercise, when you copied the data to Spark,
<a href="https://www.rdocumentation.org/packages/dplyr/topics/copy_to">`copy_to()`</a>
returned a value. This return value is a special kind of
<a href="https://www.rdocumentation.org/packages/tibble/topics/tibble">`tibble()`</a>
that doesn’t contain any data of its own. To explain this, you need to
know a bit about the way that tidyverse packages store data. Tibbles are
usually just a variant of `data.frame`s that have a nicer print method.
However, `dplyr` also allows them to store data from a remote data
source, such as databases, and – as is the case here – Spark. For remote
datasets, the tibble object simply stores a connection to the remote
data. This will be discussed in more detail later, but the important
point for now is that even though you have a big dataset, the size of
the tibble object is small.

On the Spark side, the data is stored in a variable called a
`DataFrame`. This is a more or less direct equivalent of R’s
`data.frame` variable type. (Though the column variable types are named
slightly differently – for example `numeric` columns are called
`DoubleType` columns.) Throughout the course, the term *data frame* will
be used, unless clarification is needed between `data.frame` and
`DataFrame`. Since these types are also analogous to database tables,
sometimes the term *table* will also be used to describe this sort of
rectangular data.

Calling
<a href="https://www.rdocumentation.org/packages/dplyr/topics/tbl">`tbl()`</a>
with a Spark connection, and a string naming the Spark data frame will
return the same tibble object that was returned when you used
<a href="https://www.rdocumentation.org/packages/dplyr/topics/dplyr">`copy_to()`</a>.

A useful tool that you will see in this exercise is the
<a href="https://www.rdocumentation.org/packages/pryr/topics/object_size">`object_size()`</a>
function from the `pryr` package. This shows you how much memory an
object takes up.

**Steps**

1.  A Spark connection has been created for you as `spark_conn`. The
    track metadata for 1,000 tracks is stored in the Spark cluster in
    the table `"track_metadata"`.

    -   Link to the `"track_metadata"` table using `tbl()`. Assign the
        result to `track_metadata_tbl`.
    -   See how big the dataset is, using `dim()` on
        `track_metadata_tbl`.
    -   See how small the tibble is, using `object_size()` on
        `track_metadata_tbl`.

``` r
# Link to the track_metadata table in Spark
track_metadata_tbl <- tbl(spark_conn, "track_metadata") #|> collect()

# See how big the dataset is
dim(track_metadata_tbl)
```

    ## [1] NA 11

``` r
# See how small the tibble is
# pryr::object_size(track_metadata_tbl)
```

It’s an optical illusion! The tibble looks quite big, but it is actually
really small.

## Exploring the structure of tibbles

<!--
- Learn to explore datasets stored in Spark.
- Explore the dataset using `print()` and `glimpse()`.
- Compare with `str()`, which probably isn't what the student wants.
-->

If you try to print a tibble that describes data stored in Spark, some
magic has to happen, since the tibble doesn’t keep a copy of the data
itself. The magic is that the print method uses your Spark connection,
copies some of the contents back to R, and displays those values as
though the data had been stored locally. As you saw earlier in the
chapter, copying data is a *slow* operation, so by default, only 10 rows
and as many columns will fit onscreen, are printed.

You can change the number of rows that are printed using the `n`
argument to
<a href="https://www.rdocumentation.org/packages/tibble/topics/print.tbl_df">`print()`</a>.
You can also change the width of content to display using the `width`
argument, which is specified as the number of characters (not the number
of columns). A nice trick is to use `width = Inf` to print all the
columns.

The
<a href="https://www.rdocumentation.org/packages/utils/topics/str">`str()`</a>
function is typically used to display the structure of a variable. For
`data.frame`s, it gives a nice summary with the type and first few
values of each column. For tibbles that have a remote data source
however, `str()` doesn’t know how to retrieve the data. That means that
if you call `str()` on a tibble that contains data stored in Spark, you
see a list containing a Spark connection object, and a few other bits
and pieces.

If you want to see a summary of what each column contains in the dataset
that the tibble refers to, you need to call
<a href="https://www.rdocumentation.org/packages/tibble/topics/glimpse">`glimpse()`</a>
instead. Note that for remote data such as those stored in a Spark
cluster datasets, the number of rows is a lie! In this case, `glimpse()`
never claims that the data has more than 25 rows.

**Steps**

1.  Print the first 5 rows and all the columns of the track metadata.

``` r
# Print 5 rows, all columns
print(track_metadata_tbl, n = 5, width = Inf)
```

    ## # Source: spark<track_metadata> [?? x 11]
    ##   track_id           title                     song_id           
    ##   <chr>              <chr>                     <chr>             
    ## 1 TRSTWXA12903D15238 The Breeze and I          SOCQMXH12AC468B61D
    ## 2 TRQNQZX128F422BA2F Soul Of A Short Fat Man   SOWULXB12A6D4FC1AD
    ## 3 TRTPVEB128F42614A6 The Galloping Latin       SOHKYIC12A8AE48D00
    ## 4 TRZZNFB128F933E7D2 The Twelfth Of Never      SOJVHKV12AB0182669
    ## 5 TRZAAWN128F92EAC1C Little Child Runnin' Wild SORYVBT12AB017BB45
    ##   release                                           artist_id         
    ##   <chr>                                             <chr>             
    ## 1 Espana                                            ARNNU4G1187FB5991B
    ## 2 Diary Of A Band Vol 1 & 2                         ARJ9DSA1187B990E00
    ## 3 The Blues; That's Me!                             ARQ8CJ61187FB3DC9C
    ## 4 Give Me Just A Little More Time + In Session&plus ARFAKTH1187B9B0C18
    ## 5 Beautiful Brother - The Essential                 ARNMWP51187FB3E963
    ##   artist_mbid                          artist_name                     duration
    ##   <chr>                                <chr>                              <dbl>
    ## 1 5c176092-cb4d-4e05-806b-1e9414f2b28c 101 Strings                         221.
    ## 2 4756395c-57ed-4a63-afb2-01117f14dff6 John Mayall & The Bluesbreakers     368.
    ## 3 15ab8bb8-7348-4377-ab73-b7acdad1459c Illinois Jacquet                    329.
    ## 4 0174d942-39da-4dcd-aa48-d0f3fb4f218d Chairmen Of The Board               193.
    ## 5 4dca4bb2-23ba-4103-97e6-5810311db33a Curtis Mayfield                     321.
    ##   artist_familiarity artist_hotttnesss  year
    ##                <dbl>             <dbl> <int>
    ## 1              0.467             0.369  1968
    ## 2              0.627             0.405  1968
    ## 3              0.441             0.355  1969
    ## 4              0.536             0.415  1970
    ## 5              0.787             0.495  1972
    ## # … with more rows

2.  Examine the structure of the tibble using `str()`.

``` r
# Examine structure of tibble
str(track_metadata_tbl)
```

    ## List of 6
    ##  $ src               :List of 1
    ##   ..$ con:List of 13
    ##   .. ..$ master      : chr "local[16]"
    ##   .. ..$ method      : chr "shell"
    ##   .. ..$ app_name    : chr "sparklyr"
    ##   .. ..$ config      :List of 7
    ##   .. .. ..$ spark.env.SPARK_LOCAL_IP.local           : chr "127.0.0.1"
    ##   .. .. ..$ sparklyr.connect.csv.embedded            : chr "^1.*"
    ##   .. .. ..$ spark.sql.legacy.utcTimestampFunc.enabled: logi TRUE
    ##   .. .. ..$ sparklyr.connect.cores.local             : int 16
    ##   .. .. ..$ spark.sql.shuffle.partitions.local       : int 16
    ##   .. .. ..$ sparklyr.shell.name                      : chr "sparklyr"
    ##   .. .. ..$ sparklyr.shell.driver-memory             : chr "2g"
    ##   .. .. ..- attr(*, "config")= chr "default"
    ##   .. .. ..- attr(*, "file")= chr "/Users/jschwarz/Rlibs/sparklyr/conf/config-template.yml"
    ##   .. ..$ state       :<environment: 0x7f7ed31e66f8> 
    ##   .. ..$ extensions  :List of 6
    ##   .. .. ..$ jars              : chr(0) 
    ##   .. .. ..$ packages          : chr(0) 
    ##   .. .. ..$ initializers      : list()
    ##   .. .. ..$ catalog_jars      : chr(0) 
    ##   .. .. ..$ repositories      : chr(0) 
    ##   .. .. ..$ dbplyr_sql_variant:List of 3
    ##   .. .. .. ..$ scalar   : list()
    ##   .. .. .. ..$ aggregate: list()
    ##   .. .. .. ..$ window   : list()
    ##   .. ..$ spark_home  : chr "/Users/jschwarz/spark/spark-3.2.1-bin-hadoop2.7"
    ##   .. ..$ backend     : 'sockconn' int 5
    ##   .. .. ..- attr(*, "conn_id")=<externalptr> 
    ##   .. ..$ monitoring  : 'sockconn' int 6
    ##   .. .. ..- attr(*, "conn_id")=<externalptr> 
    ##   .. ..$ gateway     : 'sockconn' int 4
    ##   .. .. ..- attr(*, "conn_id")=<externalptr> 
    ##   .. ..$ output_file : chr "/var/folders/_t/jtmqlfxs6lz2jk_9ndj50w1r0000gp/T//Rtmp7JKBPU/file11aa715fe0cd_spark.log"
    ##   .. ..$ sessionId   : num 89247
    ##   .. ..$ home_version: chr "3.2.1"
    ##   .. ..- attr(*, "class")= chr [1:3] "spark_connection" "spark_shell_connection" "DBIConnection"
    ##   ..- attr(*, "class")= chr [1:3] "src_spark" "src_sql" "src"
    ##  $ ops               :List of 2
    ##   ..$ x   : 'ident' chr "track_metadata"
    ##   ..$ vars: chr [1:11] "track_id" "title" "song_id" "release" ...
    ##   ..- attr(*, "class")= chr [1:3] "op_base_remote" "op_base" "op"
    ##  $ sdf_cache_state   :<environment: 0x7f7ec5b9f660> 
    ##  $ spark_dataframe   :function (self, spark_dataframe_impl)  
    ##  $ schema_cache_state:<environment: 0x7f7ec5ba34a0> 
    ##  $ schema            :function (self, schema_impl, expand_nested_cols, expand_struct_cols)  
    ##  - attr(*, "class")= chr [1:4] "tbl_spark" "tbl_sql" "tbl_lazy" "tbl"

3.  Examine the structure of the track metadata using `glimpse()`.

``` r
# Examine structure of data
glimpse(track_metadata_tbl)
```

    ## Rows: ??

    ## Warning in sdf_collect_static(object, impl, ...): NAs introduced by coercion to
    ## integer range

    ## Columns: 11
    ## Database: spark_connection
    ## $ track_id           <chr> "TRSTWXA12903D15238", "TRQNQZX128F422BA2F", "TRTPVE…
    ## $ title              <chr> "The Breeze and I", "Soul Of A Short Fat Man", "The…
    ## $ song_id            <chr> "SOCQMXH12AC468B61D", "SOWULXB12A6D4FC1AD", "SOHKYI…
    ## $ release            <chr> "Espana", "Diary Of A Band Vol 1 & 2", "The Blues; …
    ## $ artist_id          <chr> "ARNNU4G1187FB5991B", "ARJ9DSA1187B990E00", "ARQ8CJ…
    ## $ artist_mbid        <chr> "5c176092-cb4d-4e05-806b-1e9414f2b28c", "4756395c-5…
    ## $ artist_name        <chr> "101 Strings", "John Mayall & The Bluesbreakers", "…
    ## $ duration           <dbl> 221.1000, 368.1955, 329.1424, 193.2534, 320.8093, 1…
    ## $ artist_familiarity <dbl> 0.4669621, 0.6268031, 0.4405487, 0.5358244, 0.78692…
    ## $ artist_hotttnesss  <dbl> 0.3687790, 0.4052347, 0.3548943, 0.4150033, 0.49530…
    ## $ year               <int> 1968, 1968, 1969, 1970, 1972, 1977, 1978, 1979, 197…

Hurrah! I hope you can see that you need to `glimpse()` at your data.

## Selecting columns

<!--
- Learn how to select columns from Spark datasets.
- Link to "Data Manipulation in dplyr" course for further practice.
- Selecting `artist_name`, `release`, `title`, and `year` columns using `select()`.
- How square brackets are not yet supported.
-->

The easiest way to manipulate data frames stored in Spark is to use
`dplyr` syntax. Manipulating data frames using the `dplyr` syntax is
covered in detail in the
<a href="https://www.datacamp.com/courses/dplyr-data-manipulation-r-tutorial">Data
Manipulation in R with dplyr</a> and
<a href="https://www.datacamp.com/courses/joining-data-in-r-with-dplyr">Joining
Data in R with dplyr</a> courses, but you’ll spend the next chapter and
a half covering all the important points.

`dplyr` has five main actions that you can perform on a data frame. You
can select columns, filter rows, arrange the order of rows, change
columns or add new columns, and calculate summary statistics.

Let’s start with selecting columns. This is done by calling
<a href="https://www.rdocumentation.org/packages/dplyr/topics/select">`select()`</a>,
with a tibble, followed by the unquoted names of the columns you want to
keep. `dplyr` functions are conventionally used with `magrittr`’s pipe
operator,
<a href="https://www.rdocumentation.org/packages/magrittr/topics/%25%3E%25">`%>%`</a>.
To select the `x`, `y`, and `z` columns, you would write the following.

``` r
a_tibble %>%
  select(x, y, z)
```

Note that square bracket indexing is not currently supported in
`sparklyr`. So you cannot do

``` r
a_tibble[, c("x", "y", "z")]
```

**Steps**

1.  Select the `artist_name`, `release`, `title`, and `year` using
    `select()`.

``` r
# Manipulate the track metadata
track_metadata_tbl %>%
  # Select columns
  select(artist_name, release, title, year)
```

    ## # Source: spark<?> [?? x 4]
    ##    artist_name                     release               title              year
    ##    <chr>                           <chr>                 <chr>             <int>
    ##  1 101 Strings                     Espana                The Breeze and I   1968
    ##  2 John Mayall & The Bluesbreakers Diary Of A Band Vol … Soul Of A Short …  1968
    ##  3 Illinois Jacquet                The Blues; That's Me! The Galloping La…  1969
    ##  4 Chairmen Of The Board           Give Me Just A Littl… The Twelfth Of N…  1970
    ##  5 Curtis Mayfield                 Beautiful Brother - … Little Child Run…  1972
    ##  6 Black Uhuru                     Jammys From The Root… Willow Tree        1977
    ##  7 Alex de Grassi                  Pure Alex de Grassi   Children's Dance   1978
    ##  8 Blondie                         Eat To The Beat       Ring Of Fire (Li…  1979
    ##  9 Sid Vicious                     Sid Sings             Chatterbox (Live)  1979
    ## 10 Jelly Roll Kings                Rockin' The Juke Joi… Mighty Long Time   1979
    ## # … with more rows

2.  Try to do the same thing using square bracket indexing. Spoiler!
    This code throws an error, so it is wrapped in a call to
    `tryCatch()`.

``` r
# Try to select columns using [ ]
tryCatch({
   # Selection code here
    track_metadata_tbl[, c("artist_name", "release", "title", "year")]
  },
  error = print
)
```

    ## <simpleError in `[.tbl_spark`(track_metadata_tbl, , c("artist_name", "release",     "title", "year")): unused argument (c("artist_name", "release", "title", "year"))>

Wonderful work! I’m sure you noticed that was quite an intense error
message. Don’t worry, that’s normal for `sparklyr` errors.
`tryCatch(error = print)` is a nice way to see errors without them
stopping the execution of your code.

## Filtering rows

As well as selecting columns, the other way to extract important parts
of your dataset is to filter the rows. This is achieved using the
<a href="https://www.rdocumentation.org/packages/dplyr/topics/filter">`filter()`</a>
function. To use `filter()`, you pass it a tibble and some logical
conditions. For example, to return only the rows where the values of
column `x` are greater than zero *and* the values of `y` equal the
values of `z`, you would use the following.

``` r
a_tibble %>%
  filter(x > 0, y == z)
```

Before you try the exercise, take heed of two warnings. Firstly, don’t
mistake `dplyr`’s
<a href="https://www.rdocumentation.org/packages/dplyr/topics/filter">`filter()`</a>
function with the `stats` package’s
<a href="https://www.rdocumentation.org/packages/stats/topics/filter">`filter()`</a>
function. Secondly, `sparklyr` converts your `dplyr` code into SQL
database code before passing it to Spark. That means that only a limited
number of filtering operations are currently supported. For example, you
can’t filter character rows using regular expressions with code like

``` r
a_tibble %>%
  filter(grepl("a regex", x))
```

The help page for
<a href="https://www.rdocumentation.org/packages/dplyr/topics/translate_sql">`translate_sql()`</a>
describes the functionality that is available. You are OK to use
<a href="https://www.rdocumentation.org/packages/base/topics/Comparison">comparison
operators</a> like `>`, `!=`, and
<a href="https://www.rdocumentation.org/packages/base/topics/match">`%in%`</a>;
<a href="https://www.rdocumentation.org/packages/base/topics/Arithmetic">arithmetic
operators</a> like `+`, `^`, and `%%`; and
<a href="https://www.rdocumentation.org/packages/base/topics/Logic">logical
operators</a> like `&amp;`, `|` and `!`. Many mathematical functions
such as
<a href="https://www.rdocumentation.org/packages/base/topics/log">`log()`</a>,
<a href="https://www.rdocumentation.org/packages/base/topics/MathFun">`abs()`</a>,
<a href="https://www.rdocumentation.org/packages/base/topics/Round">`round()`</a>,
and
<a href="https://www.rdocumentation.org/packages/base/topics/Trig">`sin()`</a>
are also supported.

As before, square bracket indexing does not currently work.

**Steps**

1.  As in the previous exercise, select the `artist_name`, `release`,
    `title`, and `year` using `select()`.
2.  Pipe the result of this to `filter()` to get the tracks from the
    1960s.

``` r
# Manipulate the track metadata
track_metadata_tbl %>%
  # Select columns
  select(artist_name, release, title, year) %>%
  # Filter rows
  filter(year >= 1960, year < 1970)
```

    ## Warning in !identical(self$schema_cache_state$ops, self$ops) ||
    ## is.na(self$schema_cache_state$schema[[cache_index]]): 'length(x) = 11 > 1' in
    ## coercion to 'logical(1)'

    ## # Source: spark<?> [?? x 4]
    ##    artist_name                     release              title               year
    ##    <chr>                           <chr>                <chr>              <int>
    ##  1 101 Strings                     Espana               The Breeze and I    1968
    ##  2 John Mayall & The Bluesbreakers Diary Of A Band Vol… Soul Of A Short F…  1968
    ##  3 Illinois Jacquet                The Blues; That's M… The Galloping Lat…  1969
    ##  4 Cliff Richard & The Shadows     Me And My Shadows    Choppin' 'n' Chan…  1960
    ##  5 Cliff Richard And The Shadows   The Hits In Between  I Love You          1960
    ##  6 Chubby Checker                  Hits of The 60's Vo… The Twist           1960
    ##  7 Perez Prado                     100 Hits - 50s       Cherry Pink And A…  1960
    ##  8 Charlie Mingus                  Period's Jazz Diges… Stormy Weather      1960
    ##  9 Elvis Presley                   His Hand In Mine     If We Never Meet …  1960
    ## 10 The Drifters                    Save The Last Dance… Some Kind Of Wond…  1960
    ## # … with more rows

You’ve certainly filtered out your bad code!

## Arranging rows

<!--
- Learn how to rearrange rows of Spark datasets.
- Same selection/filter as before, then
- Order the results by `artist_name` then descending `year` then `title` using `arrange()`.
- To hammer home the point about not used base-R commands, `order()` isn't supported either.
-->

Back in the days when music was stored on CDs, there was a perennial
problem: how do you best order your CDs so you can find the ones you
want? By order of artist? Chronologically? By genre?

The
<a href="https://www.rdocumentation.org/packages/dplyr/topics/arrange">`arrange()`</a>
function lets you reorder the rows of a tibble. It takes a tibble,
followed by the unquoted names of columns. For example, to sort in
ascending order of the values of column `x`, then (where there is a tie
in `x`) by descending order of values of `y`, you would write the
following.

``` r
a_tibble %>%
  arrange(x, desc(y))
```

Notice the use of
<a href="https://www.rdocumentation.org/packages/dplyr/versions/0.5.0/topics/desc">`desc()`</a>
to enforce sorting by descending order. Also be aware that in
`sparklyr`, the
<a href="https://www.rdocumentation.org/packages/base/topics/order">`order()`</a>
function, used for arranging the rows of `data.frame`s does not work.

**Steps**

1.  Select the `artist_name`, `release`, `title`, and `year` fields.
2.  Pipe the result of this to filter on tracks from the 1960s.
3.  Pipe the result of this to `arrange()` to order by `artist_name`,
    then descending `year`, then `title`.

``` r
# Manipulate the track metadata
track_metadata_tbl %>%
  select(artist_name, release, title, year) %>%
  filter(year >= 1960, year < 1970) %>%
  arrange(artist_name, desc(year), title)
```

    ## # Source:     spark<?> [?? x 4]
    ## # Ordered by: artist_name, desc(year), title
    ##    artist_name                                           release    title   year
    ##    <chr>                                                 <chr>      <chr>  <int>
    ##  1 101 Strings                                           Espana     The B…  1968
    ##  2 ? & The Mysterians                                    The Best … Smokes  1967
    ##  3 Albert Ayler                                          Live In G… Omega…  1967
    ##  4 Alice Cooper                                          Pretties … Apple…  1969
    ##  5 Barbra Streisand; Arranged and conducted by Ray Ellis A Christm… The L…  1967
    ##  6 Barry McGuire                                         Eve Of De… You W…  1965
    ##  7 Ben E. King                                           Seven Let… Jamai…  1965
    ##  8 Bill Monroe & His Bluegrass Boys                      Definitiv… Blue …  1961
    ##  9 Bill Monroe & The Bluegrass Boys                      The Essen… Blue …  1961
    ## 10 Bo Diddley                                            Turn up t… Roadr…  1960
    ## # … with more rows

You’ve certainly filtered out your bad code and arranged it
appropriately!

## Mutating columns

<!--
- Learn how to add new columns to (mutate) Spark datasets.
- Select `title` and `duration`.
- Add a `duration_minutes` field using `mutate()`.
-->

It may surprise you, but not all datasets start out perfectly clean!
Often you have to fix values, or create new columns derived from your
existing data. The process of changing or adding columns is called
*mutation* in `dplyr` terminology, and is performed using
<a href="https://www.rdocumentation.org/packages/dplyr/topics/mutate">`mutate()`</a>.
This function takes a tibble, and named arguments to update columns. The
names of each of these arguments is the name of the columns to change or
add, and the value is an expression explaining how to update it. For
example, given a tibble with columns `x` and `y`, the following code
would update `x` and create a new column `z`.

``` r
a_tibble %>%
  mutate(
    x = x + y,
    z = log(x)  
  )
```

In case you hadn’t got the message already that base-R functions don’t
work with Spark tibbles, you can’t use
<a href="https://www.rdocumentation.org/packages/base/topics/with">`within()`</a>
or
<a href="https://www.rdocumentation.org/packages/base/topics/transform">`transform()`</a>
for this purpose.

**Steps**

1.  Select the `title`, and `duration` fields. Note that the durations
    are in seconds.
2.  Pipe the result of this to `mutate()` to create a new field,
    `duration_minutes`, that contains the track duration in minutes.

``` r
# Manipulate the track metadata
track_metadata_tbl %>%
  # Select columns
  select(title, duration) %>%
  # Mutate columns
  mutate(duration_minutes = duration / 60)
```

    ## # Source: spark<?> [?? x 3]
    ##    title                                       duration duration_minutes
    ##    <chr>                                          <dbl>            <dbl>
    ##  1 The Breeze and I                                221.             3.68
    ##  2 Soul Of A Short Fat Man                         368.             6.14
    ##  3 The Galloping Latin                             329.             5.49
    ##  4 The Twelfth Of Never                            193.             3.22
    ##  5 Little Child Runnin' Wild                       321.             5.35
    ##  6 Willow Tree                                     179.             2.98
    ##  7 Children's Dance                                162.             2.69
    ##  8 Ring Of Fire (Live) (2001 Digital Remaster)     210.             3.50
    ##  9 Chatterbox (Live)                               111.             1.85
    ## 10 Mighty Long Time                                242.             4.03
    ## # … with more rows

Brilliant work! Mutation has two purposes: changing columns, and adding
new columns.

## Summarizing columns

<!--
- Learn how to calculate summary statistics for Spark datasets.
- Select, and mutate as before, then
- Calculate the mean song duration in minutes using `summarize()`.
-->

The
<a href="https://www.rdocumentation.org/packages/dplyr/topics/mutate">`mutate()`</a>
function that you saw in the previous exercise takes columns as inputs,
and returns a column. If you are calculating summary statistics such as
the mean, maximum, or standard deviation, then you typically want to
take columns as inputs but return a single value. This is achieved with
the
<a href="https://www.rdocumentation.org/packages/dplyr/topics/summarize">`summarize()`</a>
function.

``` r
a_tibble %>%
  summarize(
    mean_x       = mean(x),
    sd_x_times_y = sd(x * y)
  )
```

Note that `dplyr` has a philosophy (passed on to `sparklyr`) of always
keeping the data in tibbles. So the return value here is a tibble with
one row, and one column for each summary statistic that was calculated.

**Steps**

1.  Select the `title`, and `duration` fields.
2.  Pipe the result of this to create a new field, `duration_minutes`,
    that contains the track duration in minutes.
3.  Pipe the result of this to `summarize()` to calculate the mean
    duration in minutes, in a field named `mean_duration_minutes`.

``` r
# Manipulate the track metadata
track_metadata_tbl %>%
  # Select columns
  select(title, duration) %>%
  # Mutate columns
  mutate(duration_minutes = duration / 60) %>%
  # Summarize columns
  summarize(mean_duration_minutes = mean(duration_minutes))
```

    ## Warning: Missing values are always removed in SQL.
    ## Use `mean(x, na.rm = TRUE)` to silence this warning
    ## This warning is displayed only once per session.

    ## # Source: spark<?> [?? x 1]
    ##   mean_duration_minutes
    ##                   <dbl>
    ## 1                  3.54

Splendid! Summarizing returns a tibble with a summary statistic in each
column.

# 2. Tools of the Trade: Advanced dplyr Usage

In which you learn more about using the <code>dplyr</code> interface to
Spark, including advanced field selection, calculating groupwise
statistics, and joining data frames.

## Leveling up

Theory. Coming soon …

**1. Leveling up**

You’ve now learned the basics of working with Spark using the dplyr
interface. In this chapter, you’ll take it a step further by learning
advanced dplyr concepts.

**2. Help me!**

You’ll use the select helper functions, such as starts_with(), to easily
select multiple columns. These are really useful when you have wide
datasets containing hundreds of columns.

**3. Computing and collecting**

When working with remote data such as Spark DataFrames, an important
technique is managing where results are calculated. You’ll learn to use
the compute() function to store results in Spark, and the collect()
function to pull results back to R.

**4. SQL and database joins**

You’ll also dive into database techniques, writing SQL code to query
data, and using joins to merge multiple tables together.

**5. Let’s practice!**

## Mother’s little helper (1)

<!--
- Learn advanced column selection techniques.
- Introduce the suite of `select()` helpers.
- Select columns starting with `"artist"` using `starts_with()`.
- Select columns ending with `"id"` using `ends_with()`.
-->

If your dataset has thousands of columns, and you want to select a lot
of them, then typing the name of each column when you call `select()`
can be very tedious. Fortunately, `select()` has some
<a href="https://www.rdocumentation.org/packages/dplyr/topics/select_helpers">helper
functions</a> to make it easy to select multiple columns without typing
much code.

These helpers include `starts_with()` and `ends_with()`, that match
columns that start or end with a certain prefix or suffix respectively.
Due to `dplyr`’s special code evaluation techniques, these functions can
only be called from inside a call to `select()`; they don’t make sense
on their own.

**Steps**

1.  Select all columns from `track_metadata_tbl` starting with
    `"artist"`.

``` r
track_metadata_tbl %>%
  # Select columns starting with artist
  select(starts_with("artist"))
```

    ## # Source: spark<?> [?? x 5]
    ##    artist_id          artist_mbid  artist_name artist_familiar… artist_hotttnes…
    ##    <chr>              <chr>        <chr>                  <dbl>            <dbl>
    ##  1 ARNNU4G1187FB5991B 5c176092-cb… 101 Strings            0.467            0.369
    ##  2 ARJ9DSA1187B990E00 4756395c-57… John Mayal…            0.627            0.405
    ##  3 ARQ8CJ61187FB3DC9C 15ab8bb8-73… Illinois J…            0.441            0.355
    ##  4 ARFAKTH1187B9B0C18 0174d942-39… Chairmen O…            0.536            0.415
    ##  5 ARNMWP51187FB3E963 4dca4bb2-23… Curtis May…            0.787            0.495
    ##  6 ARMDWND1187B9AEBE2 8ee00333-ec… Black Uhuru            0.707            0.463
    ##  7 ARBSLZ11187FB42ACF f940c4dd-f6… Alex de Gr…            0.565            0.381
    ##  8 ARM7YQQ1187B9A84E7 4d2956d1-a3… Blondie                0.759            0.551
    ##  9 ARBK4PS1187B9AEEA8 637504e3-be… Sid Vicious            0.621            0.455
    ## 10 ARRHNLN1187FB589BA d86c3c8b-84… Jelly Roll…            0.468            0.303
    ## # … with more rows

2.  Select all columns from `track_metadata_tbl` ending with `"id"`.

``` r
track_metadata_tbl %>%
  # Select columns ending with id
  select(ends_with("id"))
```

    ## Warning in !identical(self$schema_cache_state$ops, self$ops) ||
    ## is.na(self$schema_cache_state$schema[[cache_index]]): 'length(x) = 11 > 1' in
    ## coercion to 'logical(1)'

    ## # Source: spark<?> [?? x 4]
    ##    track_id           song_id            artist_id          artist_mbid         
    ##    <chr>              <chr>              <chr>              <chr>               
    ##  1 TRSTWXA12903D15238 SOCQMXH12AC468B61D ARNNU4G1187FB5991B 5c176092-cb4d-4e05-…
    ##  2 TRQNQZX128F422BA2F SOWULXB12A6D4FC1AD ARJ9DSA1187B990E00 4756395c-57ed-4a63-…
    ##  3 TRTPVEB128F42614A6 SOHKYIC12A8AE48D00 ARQ8CJ61187FB3DC9C 15ab8bb8-7348-4377-…
    ##  4 TRZZNFB128F933E7D2 SOJVHKV12AB0182669 ARFAKTH1187B9B0C18 0174d942-39da-4dcd-…
    ##  5 TRZAAWN128F92EAC1C SORYVBT12AB017BB45 ARNMWP51187FB3E963 4dca4bb2-23ba-4103-…
    ##  6 TRRAOAD12903CE7F2C SODTBYX12AC3DF7E71 ARMDWND1187B9AEBE2 8ee00333-ec2c-439b-…
    ##  7 TRPGBAO128F42B10AC SOCTEWS12A8C13EE5B ARBSLZ11187FB42ACF f940c4dd-f687-4c6a-…
    ##  8 TRQLTYD128F14615DF SONNCTZ12A6D4F6438 ARM7YQQ1187B9A84E7 4d2956d1-a3f7-44bb-…
    ##  9 TRJNORS128F1458A47 SOGQHHK12A6D4F6497 ARBK4PS1187B9AEEA8 637504e3-be95-4005-…
    ## 10 TRLSQUC128F4220403 SOTFGIG12A6D4FBA0C ARRHNLN1187FB589BA d86c3c8b-84d5-44ce-…
    ## # … with more rows

Super! Select helpers make it easy to select many columns at once.

## Mother’s little helper (2)

<!--
- Learn even more advanced column selection techniques.
- Introduce regular expressions, and the meaning of `?`.
- Select columns containing `"ti"` using `contains()`. (Several artist cols, title, and duration.)
- Select columns matching `"ti.?t"` using `matches()`. (Several artist cols and title.)
-->

A more general way of matching columns is to check if their names
contain a value anywhere within them (rather than starting or ending
with a value). As you may be able to guess, you can do this using a
helper named `contains()`.

Even more generally, you can match columns using regular expressions.
Regular expressions (“regexes” for short) are a powerful language used
for matching text. If you want to learn how to use regular expressions,
take the
<a href="https://www.datacamp.com/courses/string-manipulation-in-r-with-stringr">*String
Manipulation in R with stringr*</a> course. For now, you only need to
know three things.

1.  a: A letter means “match that letter”.
2.  .: A dot means “match any character, including letters, numbers,
    punctuation, etc.”.
3.  ?: A question mark means “the previous character is optional”.

You can find columns that match a particular regex using the `matches()`
select helper.

**Steps**

1.  Select all columns from `track_metadata_tbl` containing `"ti"`.

``` r
track_metadata_tbl %>%
  # Select columns containing ti
  select(contains("ti"))
```

    ## Warning in !identical(self$schema_cache_state$ops, self$ops) ||
    ## is.na(self$schema_cache_state$schema[[cache_index]]): 'length(x) = 11 > 1' in
    ## coercion to 'logical(1)'

    ## # Source: spark<?> [?? x 7]
    ##    title      artist_id   artist_mbid    artist_name   duration artist_familiar…
    ##    <chr>      <chr>       <chr>          <chr>            <dbl>            <dbl>
    ##  1 The Breez… ARNNU4G118… 5c176092-cb4d… 101 Strings       221.            0.467
    ##  2 Soul Of A… ARJ9DSA118… 4756395c-57ed… John Mayall …     368.            0.627
    ##  3 The Gallo… ARQ8CJ6118… 15ab8bb8-7348… Illinois Jac…     329.            0.441
    ##  4 The Twelf… ARFAKTH118… 0174d942-39da… Chairmen Of …     193.            0.536
    ##  5 Little Ch… ARNMWP5118… 4dca4bb2-23ba… Curtis Mayfi…     321.            0.787
    ##  6 Willow Tr… ARMDWND118… 8ee00333-ec2c… Black Uhuru       179.            0.707
    ##  7 Children'… ARBSLZ1118… f940c4dd-f687… Alex de Gras…     162.            0.565
    ##  8 Ring Of F… ARM7YQQ118… 4d2956d1-a3f7… Blondie           210.            0.759
    ##  9 Chatterbo… ARBK4PS118… 637504e3-be95… Sid Vicious       111.            0.621
    ## 10 Mighty Lo… ARRHNLN118… d86c3c8b-84d5… Jelly Roll K…     242.            0.468
    ## # … with more rows, and 1 more variable: artist_hotttnesss <dbl>

2.  Select all columns from `track_metadata_tbl` matching the regular
    expression `"ti.?t"`.

``` r
track_metadata_tbl %>%
  # Select columns matching ti.?t
  select(matches("ti.?t"))
```

    ## Warning in !identical(self$schema_cache_state$ops, self$ops) ||
    ## is.na(self$schema_cache_state$schema[[cache_index]]): 'length(x) = 11 > 1' in
    ## coercion to 'logical(1)'

    ## # Source: spark<?> [?? x 6]
    ##    title   artist_id  artist_mbid  artist_name artist_familiar… artist_hotttnes…
    ##    <chr>   <chr>      <chr>        <chr>                  <dbl>            <dbl>
    ##  1 The Br… ARNNU4G11… 5c176092-cb… 101 Strings            0.467            0.369
    ##  2 Soul O… ARJ9DSA11… 4756395c-57… John Mayal…            0.627            0.405
    ##  3 The Ga… ARQ8CJ611… 15ab8bb8-73… Illinois J…            0.441            0.355
    ##  4 The Tw… ARFAKTH11… 0174d942-39… Chairmen O…            0.536            0.415
    ##  5 Little… ARNMWP511… 4dca4bb2-23… Curtis May…            0.787            0.495
    ##  6 Willow… ARMDWND11… 8ee00333-ec… Black Uhuru            0.707            0.463
    ##  7 Childr… ARBSLZ111… f940c4dd-f6… Alex de Gr…            0.565            0.381
    ##  8 Ring O… ARM7YQQ11… 4d2956d1-a3… Blondie                0.759            0.551
    ##  9 Chatte… ARBK4PS11… 637504e3-be… Sid Vicious            0.621            0.455
    ## 10 Mighty… ARRHNLN11… d86c3c8b-84… Jelly Roll…            0.468            0.303
    ## # … with more rows

Radical coding! Regular expressions are powerful tools for matching
strings.

## Selecting unique rows

<!--
- Learn to filter on unique values, and count many values you have.
- Select unique artists using `select()` + `distinct()`.
- Count the number of unique artists using `count()`.
- Calculate the mean number of tracks per artist.
-->

If you have a categorical variable stored in a factor, it is often
useful to know what the individual categories are; you do this with the
<a href="https://www.rdocumentation.org/packages/base/topics/levels">`levels()`</a>
function. For a tibble, the more general concept is to find rows with
unique data. Following the terminology from SQL, this is done using the
<a href="https://www.rdocumentation.org/packages/dplyr/topics/distinct">`distinct()`</a>
function. You can use it directly on your dataset, so you find unique
combinations of a particular set of columns. For example, to find the
unique combinations of values in the `x`, `y`, and `z` columns, you
would write the following.

``` r
a_tibble %>%
  distinct(x, y, z)
```

**Steps**

1.  Find the distinct values of the `artist_name` column from
    `track_metadata_tbl`.

``` r
track_metadata_tbl %>%
  # Only return rows with distinct artist_name
  distinct(artist_name)
```

    ## Warning in !identical(self$schema_cache_state$ops, self$ops) ||
    ## is.na(self$schema_cache_state$schema[[cache_index]]): 'length(x) = 11 > 1' in
    ## coercion to 'logical(1)'

    ## Warning: ORDER BY is ignored in subqueries without LIMIT
    ## ℹ Do you need to move arrange() later in the pipeline or use window_order() instead?
    ## ORDER BY is ignored in subqueries without LIMIT
    ## ℹ Do you need to move arrange() later in the pipeline or use window_order() instead?
    ## ORDER BY is ignored in subqueries without LIMIT
    ## ℹ Do you need to move arrange() later in the pipeline or use window_order() instead?

    ## # Source: spark<?> [?? x 1]
    ##    artist_name                    
    ##    <chr>                          
    ##  1 101 Strings                    
    ##  2 John Mayall & The Bluesbreakers
    ##  3 Illinois Jacquet               
    ##  4 Chairmen Of The Board          
    ##  5 Curtis Mayfield                
    ##  6 Black Uhuru                    
    ##  7 Alex de Grassi                 
    ##  8 Blondie                        
    ##  9 Sid Vicious                    
    ## 10 Jelly Roll Kings               
    ## # … with more rows

Your skills are distinctive! Unique, distinct, and non-duplicated all
mean the same thing.

## Common people

<!--
- Learn to count specific instances of a field, and to find most common values.
- Count the number of tracks by each artist using `count()`.
- Find the most prolific artists in the dataset by arranging the counts in descending order of `n` using `arrange()`.
- Limit the number of results using `top_n()`.
-->

The
<a href="https://www.rdocumentation.org/packages/dplyr/topics/distinct">`distinct()`</a>
function showed you the unique values. It can also be useful to know
*how many* of each value you have. The base-R function for this is
<a href="https://www.rdocumentation.org/packages/base/topics/table">`table()`</a>;
that isn’t supported in `sparklyr` since it doesn’t conform to the
tidyverse philosophy of keeping everything in tibbles. Instead, you must
use
<a href="https://www.rdocumentation.org/packages/dplyr/topics/count">`count()`</a>.
To use it, pass the unquoted names of the columns. For example, to find
the counts of distinct combinations of columns `x`, `y`, and `z`, you
would type the following.

``` r
a_tibble %>%
  count(x, y, z)
```

The result is the same as

``` r
a_tibble %>%
  distinct(x, y, z)
```

… except that you get an extra column, `n`, that contains the counts.

A really nice use of
<a href="https://www.rdocumentation.org/packages/dplyr/topics/count">`count()`</a>
is to get the most common values of something. To do this, you call
`count()`, with the argument `sort = TRUE` which sorts the rows by
descending values of the `n` column, then use
<a href="https://www.rdocumentation.org/packages/dplyr/topics/top_n">`top_n()`</a>
to restrict the results to the top however-many values.
(<a href="https://www.rdocumentation.org/packages/dplyr/topics/top_n">`top_n()`</a>
is similar to base-R’s
<a href="https://www.rdocumentation.org/packages/utils/topics/head">`head()`</a>,
but it works with remote datasets such as those in Spark.) For example,
to get the top 20 most common combinations of the `x`, `y`, and `z`
columns, use the following.

``` r
a_tibble %>%
  count(x, y, z, sort = TRUE) %>%
  top_n(20)
```

**Steps**

1.  Count the values in the `artist_name` column from
    `track_metadata_tbl`.`sort = TRUE` to sort the rows by descending
    popularity.
2.  Pass `sort = TRUE` to sort the rows by descending popularity.
3.  Restrict the results to the top 20 using `top_n()`.

``` r
track_metadata_tbl %>%
  # Count the artist_name values
  count(artist_name, sort = TRUE) %>%
  # Restrict to top 20
  head(20)
```

    ## # Source:     spark<?> [?? x 2]
    ## # Ordered by: desc(n)
    ##    artist_name                             n
    ##    <chr>                               <dbl>
    ##  1 "Bukka White"                          20
    ##  2 "Merle Travis"                         13
    ##  3 "Skip James"                           12
    ##  4 "Tampa Red"                            12
    ##  5 "Sleepy John Estes"                     9
    ##  6 "Billie Holiday"                        9
    ##  7 "Bud Powell"                            9
    ##  8 "\"Arthur \\\"Big Boy\\\" Crudup\""     8
    ##  9 "Big Joe Williams"                      7
    ## 10 "Lonnie Johnson"                        6
    ## # … with more rows

Top work! `count(sort = TRUE)` + `top_n()` / `head()` is a pattern worth
remembering.

## Collecting data back from Spark

<!--
- Introduce the concept of lazy calculation.
- Filter the dataset (maybe `artist_familiarity > 0.9`) and assign the result to `result`.
- Explore the `class()` of the result, noting that amongst other things it is a `tbl_lazy`.
- Explore the `str()`ucture of the result, noting that it contains a connection to the remote copy of the data and a list of operations to perform, but no actual data.
- Collect the filtered data using `collect()`.
- Explore the class again, noting that this time it contains actual data.
-->

In the exercise ‘Exploring the structure of tibbles’, back in Chapter 1,
you saw that tibbles don’t store a copy of the data. Instead, the data
stays in Spark, and the tibble simply stores the details of what it
would like to retrieve from Spark.

There are lots of reasons that you might want to move your data from
Spark to R. You’ve already seen how some data is moved from Spark to R
when you print it. You also need to collect your dataset if you want to
plot it, or if you want to use a modeling technique that is not
available in Spark. (After all, R has the widest selection of available
models of any programming language.)

To collect your data: that is, to move it from Spark to R, you call
<a href="https://www.rdocumentation.org/packages/dplyr/topics/collect">`collect()`</a>.

**Steps**

1.  Filter the rows of `track_metadata_tbl` where `artist_familiarity`
    is greater than 0.9, assigning the results to `results`.
2.  Print the class of `results`, noting that it is a `tbl_lazy` (used
    for remote data).

``` r
results <- track_metadata_tbl %>%
  # Filter where artist familiarity is greater than 0.9
  filter(artist_familiarity > 0.9)

# Examine the class of the results
class(results)
```

    ## [1] "tbl_spark" "tbl_sql"   "tbl_lazy"  "tbl"

3.  Collect your results, assigning them to `collected`.
4.  Print the class of `collected`, noting that it is a `tbl_df` (used
    for local data).

``` r
# Collect your results
collected <- results %>%
  collect()

# Examine the class of the collected results
class(collected)
```

    ## [1] "tbl_df"     "tbl"        "data.frame"

Jolly good! `copy_to()` moves your data from R to Spark; `collect()`
goes in the opposite direction.

## Storing intermediate results

<!--
- Remind the student that copying data between R and Spark is slow; `collect()` should only be used when necessary.
- Introduce `compute()`, for computing the lazy computations, but storing the result in a remote Spark DataFrame.
- Repeat the filtering from the previous exercise.
- This time, `compute()` the result and store it in a Spark table named `result`.
- Use `src_tbls()` to see that the table has been created.
- Use `str()` to examine the structure of the return value from `compute()`.
-->

As you saw in Chapter 1, copying data between R and Spark is a
fundamentally slow task. That means that collecting the data, as you saw
in the previous exercise, should only be done when you really need to.

The pipe operator is really nice for chaining together data manipulation
commands, but in general, you can’t do a whole analysis with everything
chained together. For example, this is an awful practice, since you will
never be able to debug your code.

``` r
final_results <- starting_data %>%
  # 743 steps piped together
  # ... %>%
  collect()
```

That gives a dilemma. You need to store the results of intermediate
calculations, but you don’t want to collect them because it is slow. The
solution is to use
<a href="https://www.rdocumentation.org/packages/dplyr/topics/compute">`compute()`</a>
to compute the calculation, but store the results in a temporary data
frame on Spark. Compute takes two arguments: a tibble, and a variable
name for the Spark data frame that will store the results.

``` r
a_tibble %>%
  # some calculations %>%
  compute("intermediate_results")
```

**Steps**

1.  Filter the rows of `track_metadata_tbl` where `artist_familiarity`
    is greater than 0.8.
2.  Compute the results using `compute()`.
3.  Store the results in a Spark data frame named `"familiar_artists"`.
4.  Assign the result to an R tibble named `computed`.
5.  See the available Spark datasets using `src_tbls()`.

``` r
computed <- track_metadata_tbl %>%
  # Filter where artist familiarity is greater than 0.8
  filter(artist_familiarity > 0.8) %>%
  # Compute the results
  compute("familiar_artists")
```

    ## Warning in !identical(self$schema_cache_state$ops, self$ops) ||
    ## is.na(self$schema_cache_state$schema[[cache_index]]): 'length(x) = 11 > 1' in
    ## coercion to 'logical(1)'

``` r
# See the available datasets
src_tbls(spark_conn)
```

    ## [1] "familiar_artists" "track_metadata"

6.  Print the `class()` of `computed`. *Notice that unlike `collect()`,
    `compute()` returns a remote tibble. The data is still stored in the
    Spark cluster.*

``` r
# Examine the class of the computed results
class(computed)
```

    ## [1] "tbl_spark" "tbl_sql"   "tbl_lazy"  "tbl"

Nicely computed! `class(computed)` is `tbl_lazy`. `compute()` lets you
store intermediate results, without having to copy data to R.

## Groups: great for music, great for data

<!--
- Explain that groupwise summary statistics are often useful.
- Group the metadata by artist using `group_by()`.
- Calculate the mean duration by artist using `summarize()`.
- Arrange by ascending mean duration to find artists with the shortest songs, and
- Arrange by descending mean duration to find artists with the longest songs.
-->

A common analysis problem is how to calculate summary statistics for
each group of data. For example, you might want to know your sales
revenues by month, or by region. In R, the process of splitting up your
data into groups, applying a summary statistic on each group, and
combining the results into a single data structure, is known as
“split-apply-combine”. The concept is much older though: SQL has had the
`GROUP BY` statement for decades. The term “map-reduce” is a similar
concept, where “map” is very roughly analogous to the “split” and
“apply” steps, and “reducing” is “combining”. The `dplyr`/`sparklyr`
approach is to use
<a href="https://www.rdocumentation.org/packages/dplyr/topics/group_by">`group_by()`</a>
before you
<a href="https://www.rdocumentation.org/packages/dplyr/topics/mutate">`mutate()`</a>
or
<a href="https://www.rdocumentation.org/packages/dplyr/topics/summarize">`summarize()`</a>.
It takes the unquoted names of columns to group by. For example, to
calculate the mean of column `x`, for each combination of values in
columns `grp1` and `grp2`, you would write the following.

``` r
a_tibble %>%
  group_by(grp1, grp2) %>%
  summarize(mean_x = mean(x))
```

Note that the columns passed to
<a href="https://www.rdocumentation.org/packages/dplyr/topics/group_by">`group_by()`</a>
should typically be categorical variables. For example, if you wanted to
calculate the average weight of people relative to their height, it
doesn’t make sense to group by height, since everyone’s height is
unique. You could, however, use
<a href="https://www.rdocumentation.org/packages/base/topics/cut">`cut()`</a>
to convert the heights into different categories, and calculate the mean
weight for each category.

**Steps**

1.  Group the contents of `track_metadata` by `artist_name`.
2.  Summarize the groupwise mean of `duration` as a new column,
    `mean_duration`.
3.  Assign the results to `duration_by_artist`.
4.  Find the artists with the shortest songs by arranging the rows in
    ascending order of `mean_duration`.

``` r
duration_by_artist <- track_metadata_tbl %>%
  # Group by artist
  group_by(artist_name) %>%
  # Calc mean duration
  summarize(mean_duration = mean(duration))

duration_by_artist %>%
  # Sort by ascending mean duration
  arrange(mean_duration)
```

    ## # Source:     spark<?> [?? x 2]
    ## # Ordered by: mean_duration
    ##    artist_name                                                     mean_duration
    ##    <chr>                                                                   <dbl>
    ##  1 Lil Mama                                                                 11.5
    ##  2 Charlie Parker / Dizzy Gillespie / Thelonious Monk / Curly Rus…          25.1
    ##  3 DJ Yoda                                                                  32.4
    ##  4 Let 3                                                                    33.1
    ##  5 Secos And Molhados                                                       56.9
    ##  6 Ten Years After                                                          58.7
    ##  7 Ralph McTell                                                             60.5
    ##  8 Le Loup                                                                  61.4
    ##  9 D-12                                                                     65.4
    ## 10 Pavement                                                                 70.8
    ## # … with more rows

5.  Likewise, find those with the longest songs by arranging in
    descending order of `mean_duration`.

``` r
duration_by_artist %>%
  # Sort by descending mean duration
  arrange(desc(mean_duration))
```

    ## # Source:     spark<?> [?? x 2]
    ## # Ordered by: desc(mean_duration)
    ##    artist_name                           mean_duration
    ##    <chr>                                         <dbl>
    ##  1 Charles Mingus                                1423.
    ##  2 Eighteen Visions                               814.
    ##  3 The Paul Butterfield Blues Band                792.
    ##  4 Art Pepper                                     752.
    ##  5 Blonde On Blonde                               723.
    ##  6 Albert Ayler                                   647.
    ##  7 Heights Of Abraham                             632.
    ##  8 John Mayall                                    618.
    ##  9 Roberta Flack                                  602.
    ## 10 Bruce Springsteen & The E Street Band          600.
    ## # … with more rows

That was quick! `summarize()` works with grouped tibbles, and as you’ll
see next, so does `mutate()`.

## Groups of mutants

<!--
- Explain that `group_by()` can also be used to add new fields, with values that depend on a group.
- Group the metadata by artist using `group_by()`.
- Calculate the time since first release by using `mutate()` with `year - min(year)`.
- Arrange by descending time since first release to find artists active over a long period.
-->

In addition to calculating summary statistics by group, you can mutate
columns with group-specific values. For example, one technique to
normalize values is to subtract the mean, then divide by the standard
deviation. You could perform group-specific normalization using the
following code.

``` r
a_tibble %>%
  group_by(grp1, grp2) %>%
  mutate(normalized_x = (x - mean(x)) / sd(x))
```

**Steps**

1.  Group the contents of `track_metadata` by `artist_name`.
2.  Add a new column named `time_since_first_release`.this equal to the
    groupwise `year` minus the first `year` (that is, the `min()`
    `year`) that the artist released a track.
3.  Make this equal to the groupwise `year` minus the first `year` (that
    is, the `min()` `year`) that the artist released a track.
4.  Arrange the rows in descending order of `time_since_first_release`.

``` r
# track_metadata_tbl has been pre-defined
track_metadata_tbl
```

    ## # Source: spark<track_metadata> [?? x 11]
    ##    track_id  title  song_id  release  artist_id artist_mbid artist_name duration
    ##    <chr>     <chr>  <chr>    <chr>    <chr>     <chr>       <chr>          <dbl>
    ##  1 TRSTWXA1… The B… SOCQMXH… Espana   ARNNU4G1… 5c176092-c… 101 Strings     221.
    ##  2 TRQNQZX1… Soul … SOWULXB… Diary O… ARJ9DSA1… 4756395c-5… John Mayal…     368.
    ##  3 TRTPVEB1… The G… SOHKYIC… The Blu… ARQ8CJ61… 15ab8bb8-7… Illinois J…     329.
    ##  4 TRZZNFB1… The T… SOJVHKV… Give Me… ARFAKTH1… 0174d942-3… Chairmen O…     193.
    ##  5 TRZAAWN1… Littl… SORYVBT… Beautif… ARNMWP51… 4dca4bb2-2… Curtis May…     321.
    ##  6 TRRAOAD1… Willo… SODTBYX… Jammys … ARMDWND1… 8ee00333-e… Black Uhuru     179.
    ##  7 TRPGBAO1… Child… SOCTEWS… Pure Al… ARBSLZ11… f940c4dd-f… Alex de Gr…     162.
    ##  8 TRQLTYD1… Ring … SONNCTZ… Eat To … ARM7YQQ1… 4d2956d1-a… Blondie         210.
    ##  9 TRJNORS1… Chatt… SOGQHHK… Sid Sin… ARBK4PS1… 637504e3-b… Sid Vicious     111.
    ## 10 TRLSQUC1… Might… SOTFGIG… Rockin'… ARRHNLN1… d86c3c8b-8… Jelly Roll…     242.
    ## # … with more rows, and 3 more variables: artist_familiarity <dbl>,
    ## #   artist_hotttnesss <dbl>, year <int>

``` r
track_metadata_tbl %>%
  # Group by artist
  group_by(artist_name) %>%
  # Calc time since first release
  mutate(time_since_first_release = year - min(year)) %>%
  # Arrange by descending time since first release
  arrange(desc(time_since_first_release))
```

    ## Warning in !identical(self$schema_cache_state$ops, self$ops) ||
    ## is.na(self$schema_cache_state$schema[[cache_index]]): 'length(x) = 11 > 1' in
    ## coercion to 'logical(1)'

    ## Warning: Missing values are always removed in SQL.
    ## Use `MIN(x, na.rm = TRUE)` to silence this warning
    ## This warning is displayed only once per session.

    ## # Source:     spark<?> [?? x 12]
    ## # Groups:     artist_name
    ## # Ordered by: desc(time_since_first_release)
    ##    track_id  title  song_id  release  artist_id artist_mbid artist_name duration
    ##    <chr>     <chr>  <chr>    <chr>    <chr>     <chr>       <chr>          <dbl>
    ##  1 TROGYEE1… Okied… SOGNFIC… No Nois… AR47XGG1… "c7356af9-… Charlie Pa…    184. 
    ##  2 TRUPFJK1… How C… SOSABQR… Nazz Vs… ARYWCFZ1… "\"\""      Nazz           232. 
    ##  3 TRODYBQ1… Love … SOHESHB… Sonny R… AR6Q4T91… "3b47247e-… Sonny Roll…    181. 
    ##  4 TRXOPBM1… Shine… SOCFMMK… Unmeter… ARMDWND1… "8ee00333-… Black Uhuru    199. 
    ##  5 TRIETJC1… Ring … SOOGYVB… 20th Ce… ARKFXJJ1… "e9d7f684-… Sam The Sh…    149. 
    ##  6 TRUTXMQ1… 1950 … SOBXPKW… Tampa R… AR576O51… "1b62df85-… Tampa Red      198. 
    ##  7 TRIPULZ1… World… SOCRKFT… More Co… ARV2G141… "6aa4bb26-… Noel Coward    180. 
    ##  8 TRNNIXO1… New B… SOBDIIO… Tampa R… AR576O51… "1b62df85-… Tampa Red      200. 
    ##  9 TROZDLU1… What … SOCQOHF… Rambler… ARDNQ0R1… "dbfd61ef-… Lonnie Joh…    169. 
    ## 10 TRNNRUD1… Intro  SOWIDVW… Dio's I… AR65HBF1… "c55193fb-… Dio             97.0
    ## # … with more rows, and 4 more variables: artist_familiarity <dbl>,
    ## #   artist_hotttnesss <dbl>, year <int>, time_since_first_release <int>

Professor X would be proud! `mutate()` and `summarize()` are commonly
paired with `group_by()`.

## Advanced Selection II: The SQL

<!--
- You can perform arbitrary selection queries using raw(ish) SQL
- This is usually a bad idea.
- If you need your code to be portable, it can be useful.
- Use DBI::dbGetQuery()
-->

As previously mentioned, when you use the `dplyr` interface, `sparklyr`
converts your code into SQL before passing it to Spark. Most of the
time, this is what you want. However, you can also write raw SQL to
accomplish the same task. Most of the time, this is a silly idea since
the code is harder to write and harder to debug. However, if you want
your code to be portable – that is, used outside of R as well – then it
may be useful. For example, a fairly common workflow is to use
`sparklyr` to experiment with data processing, then switch to raw SQL in
a production environment. By writing raw SQL to begin with, you can just
copy and paste your queries when you move to production.

SQL queries are written as strings, and passed to
<a href="https://www.rdocumentation.org/packages/DBI/topics/dbGetQuery">`dbGetQuery()`</a>
from the DBI package. The pattern is as follows.

``` r
query <- "SELECT col1, col2 FROM some_data WHERE some_condition"
a_data.frame <- dbGetQuery(spark_conn, query)
```

Note that unlike the `dplyr` code you’ve written,
<a href="https://www.rdocumentation.org/packages/DBI/topics/dbGetQuery">`dbGetQuery()`</a>
will always execute the query and return the results to R immediately.
If you want to delay returning the data, you can use
<a href="https://www.rdocumentation.org/packages/DBI/topics/dbSendQuery">`dbSendQuery()`</a>
to execute the query, then
<a href="https://www.rdocumentation.org/packages/DBI/topics/dbFetch">`dbFetch()`</a>
to return the results. That’s more advanced usage, not covered here.
Also note that `DBI` functions return `data.frame`s rather than
`tibble`s, since `DBI` is a lower-level package.

If you want to learn more about writing SQL code, take the
<a href="https://www.datacamp.com/courses/intro-to-sql-for-data-science">*Intro
to SQL for Data Science*</a> course.

**Steps**

1.  Complete the query to select all columns from the `track_metadata`
    Spark data frame where the `year` is less than 1935 and the
    `duration` is greater than 300 seconds.
2.  Call `dbGetQuery()` to execute the query, assigning the results to
    `results`, then view the output.

``` r
# Load package
library(DBI)

# Write SQL query
query <- "SELECT * FROM track_metadata WHERE year < 1935 AND duration > 300"

# Run the query
(results <- dbGetQuery(spark_conn, query))
```

    ##             track_id              title            song_id              release
    ## 1 TRCYBTD12903CF37BD Devil Got My Woman SOFYCVA12A58A77D38 Vanguard Visionaries
    ##            artist_id                          artist_mbid artist_name duration
    ## 1 ARL99WU1187B98FB1F f205743d-4441-471d-a3af-66f584738e29  Skip James 312.3979
    ##   artist_familiarity artist_hotttnesss year
    ## 1          0.6236982         0.4217952 1931

Sterling SQL querying! Writing SQL is more effort than writing `dplyr`
code, but is more portable.

## Left joins

<!--
- Left join the artist metadata to the artist terms using `left_join()`.
- Describe left joins as a type of "outer join" and a type of "mutating join".
- Filter the results to one artist to see what it looks like. Note that the metadata for an artist is repeated over several rows.
- See how many rows there are in the result.
- Note that there are several rows per artist, but less rows than in the original.  What has happened?
-->

As well as manipulating single data frames, `sparklyr` allows you to
join two data frames together. A full treatment of how to join tables
together using `dplyr` syntax is given in the
<a href="https://www.datacamp.com/courses/joining-data-in-r-with-dplyr">Joining
Data in R with dplyr</a> course. For the rest of this chapter, you’ll
see some examples of how to do this using Spark.

A left join takes all the values from the first table, and looks for
matches in the second table. If it finds a match, it adds the data from
the second table; if not, it adds missing values. The principle is shown
in this diagram.

<img src="http://s3.amazonaws.com/assets.datacamp.com/production/course_3309/datasets/left-join.png" alt="A left join, explained using table of colors.">

Left joins are a type of mutating join, since they simply add columns to
the first table. To perform a left join with `sparklyr`, call
<a href="https://www.rdocumentation.org/packages/dplyr/topics/join">`left_join()`</a>,
passing two tibbles and a character vector of columns to join on.

``` r
left_join(a_tibble, another_tibble, by = c("id_col1", "id_col2"))
```

When you describe this join in words, the table names are reversed. This
join would be written as “another_tibble is left joined to a_tibble”.

This exercise introduces another Spark DataFrame containing terms that
describe each artist. These range from rather general terms, like “pop”,
to more niche genres such as “swiss hip hop” and “mathgrindcore”.

**Steps**

1.  Use a left join to join the artist terms to the track metadata by
    the `artist_id` column.

    -   The table to be joined to, `track_metadata_tbl`, comes first.
    -   The table that joins the first, `artist_terms_tbl`, comes next.
    -   Assign the result to `joined`.

2.  Use `sdf_nrow()` to determine how many rows there are in the joined
    table.

``` r
# Copy artist_terms to Spark
artist_terms     <- readRDS("data/artist_terms.rds")
artist_terms_tbl <- copy_to(spark_conn, artist_terms)
# Copy track_metadata to Spark (new subset)
# track_metadata     <- readRDS("data/track_metadata2.rds")
# track_metadata_tbl <- copy_to(spark_conn, track_metadata, overwrite = T)

# Left join artist terms to track metadata by artist_id
joined <- left_join(track_metadata_tbl, artist_terms_tbl, by = "artist_id")

# How many rows are in the joined table?
sdf_nrow(joined)
```

    ## [1] 33509

Elementary coding, my dear Watson! The left join finds all the
associated terms for each artist. Now let’s look at which artists had no
associated terms.

## Anti joins

<!--
- Left joins only return elements from x that have matches in y.
- The previous joined dataset wasn't as big as expected because not all artists had tags associated with them.
- You can use an anti join to find where the problems with the join.
- Describe anti join as a type of "filtering join".
- Anti join the track metadata to the artist terms, using`anti_join()`, to find the artists with no tags.
- Confirm that there is no overlap between the artists in the two datasets using `intersect()`.
-->

In the previous exercise, the joined dataset wasn’t as big as you might
have expected, since not all the artists had tags associated with them.
Anti joins are really useful for finding problems with other joins.

An anti join returns the rows of the first table where it cannot find a
match in the second table. The principle is shown in this diagram.

<img src="http://s3.amazonaws.com/assets.datacamp.com/production/course_3309/datasets/anti-join.png" alt="An anti join, explained using table of colors.">

Anti joins are a type of filtering join, since they return the contents
of the first table, but with their rows filtered depending upon the
match conditions.

The syntax for an anti join is more or less the same as for a left join:
simply swap `left_join()` for
<a href="https://www.rdocumentation.org/packages/dplyr/topics/join">`anti_join()`</a>.

``` r
anti_join(a_tibble, another_tibble, by = c("id_col1", "id_col2"))
```

**Steps**

1.  Use an anti join to join the artist terms to the track metadata by
    the `artist_id` column. Assign the result to `joined`.
2.  Use `sdf_nrow()` to determine how many rows there are in the joined
    table.

``` r
# Anti join artist terms to track metadata by artist_id
joined <- anti_join(track_metadata_tbl, artist_terms_tbl, by = "artist_id")

# How many rows are in the joined table?
sdf_nrow(joined)
```

    ## [1] 2

Alright! A few artists have no associated terms describing their music.

## Semi joins

<!--
- Explain that semi joins are the opposite of anti joins: they are an "anti anti join".
- Semi join the track metadata to the artist terms, using `semi_join()`.
- Confirm that there is no overlap between the semi joined data and the anti joined data using `intersect()`.
- Confirm that the artists in the semi joined data plus the anti joined data are all the artists from the track metadata.
-->

Semi joins are the opposite of anti joins: an anti-anti join, if you
like.

A semi join returns the rows of the first table where it *can* find a
match in the second table. The principle is shown in this diagram.

<img src="http://s3.amazonaws.com/assets.datacamp.com/production/course_3309/datasets/semi-join.png" alt="A semi join, explained using table of colors.">

The syntax is the same as for other join types; simply swap the other
join function for
<a href="https://www.rdocumentation.org/packages/dplyr/topics/join">`semi_join()`</a>

``` r
semi_join(a_tibble, another_tibble, by = c("id_col1", "id_col2"))
```

You may have spotted that the results of a semi join plus the results of
an anti join give the orignial table. So, regardless of the table
contents or how you join them, `semi_join(A, B)` plus `anti_join(A, B)`
will return `A` (though maybe with the rows in a different order).

**Steps**

1.  Use a semi join to join the artist terms to the track metadata by
    the `artist_id` column. Assign the result to `joined`.
2.  Use `sdf_nrow()` to determine how many rowsthere are in the joined
    table.

``` r
# Semi join artist terms to track metadata by artist_id
joined <- semi_join(track_metadata_tbl, artist_terms_tbl, by = "artist_id")

# How many rows and columns are in the joined table?
sdf_nrow(joined)
```

    ## [1] 998

You’re on fire! That concludes your exploration of the `dplyr` interface
to `sparklyr`. Now let’s look at the native interface.

# 3. Going Native: Use The Native Interface to Manipulate Spark DataFrames

In which you learn about Spark’s machine learning data transformation
features, and functionality for manipulating native DataFrames.

## Two new interfaces

Theory. Coming soon …

**1. Two new interfaces**

In addition to the dplyr interface to Spark, sparklyr also contains two
other interfaces.

**2. The MLlib machine learning interface**

The first interface supports access to Spark’s machine learning library,
MLlib, with “feature transformation” functions that begin ft\_, and
“machine learning” functions that begin ml\_.

**3. Feature transformations**

You’ll learn about feature transformation in this chapter. Feature
transformation means changing the form of a column of your data frame,
such as cutting a numeric field up into a categorical variable.

**4. The Spark DataFrame interface**

The other interface you’ll learn about is the Spark DataFrame API. This
provides useful methods for sorting, sampling, and partitioning your
datasets.

**5. Let’s practice!**

## Popcorn double feature

<!--
- Explain that `sparklyr`'s `dplyr` methods use Spark's SQL interface. That is, R code is converted to SQL code before being run by Spark.
- `sparklyr` also provides functions for accessing Spark's native (Scala) interface.
- Also cover the philosophical difference that Spark is pickier about continuous/categorical inputs than R.
-->

The `dplyr` methods that you saw in the previous two chapters use
Spark’s SQL interface. That is, they convert your R code into SQL code
before passing it to Spark. This is an excellent solution for basic data
manipulation, but it runs into problems when you want to do more
complicated processing. For example, you can calculate the mean of a
column, but not the median. Here is the example from the ‘Summarizing
columns’ exercise that you completed in Chapter 1.

``` r
track_metadata_tbl %>%
  summarize(mean_duration = mean(duration)) #OK
track_metadata_tbl %>%
  summarize(median_duration = median(duration))
```

`sparklyr` also has two “native” interfaces that will be discussed in
the next two chapters. Native means that they call Java or Scala code to
access Spark libraries directly, without any conversion to SQL.
`sparklyr` supports the Spark DataFrame Application Programming
Interface (API), with functions that have an `sdf_` prefix. It also
supports access to Spark’s machine learning library, MLlib, with
“feature transformation” functions that begin `ft_`, and “machine
learning” functions that begin `ml_`.

One important philosophical difference between working with R and
working with Spark is that Spark is much stricter about variable types
than R. Most of the native functions want `DoubleType` inputs and return
`DoubleType` outputs. `DoubleType` is Spark’s equivalent of R’s
`numeric` vector type. `sparklyr` will handle converting `numeric` to
`DoubleType`, but it is up to the user (that’s you!) to convert
`logical` or `integer` data into `numeric` data and back again.

> ## *Question*
>
> Which of these statements is true?<br> <br> 1. sparklyr’s dplyr
> methods convert code into Scala code before running it on Spark.<br>
> 2. Converting R code into SQL code limits the number of supported
> computations.<br> 3. Most Spark MLlib modeling functions require
> DoubleType inputs and return DoubleType outputs.<br> 4. Most Spark
> MLlib modeling functions require IntegerType inputs and return
> BooleanType outputs.<br> <br> ⬜ 1 and 3.<br> ⬜ 2 and 4.<br> ⬜ 1 and
> 4.<br> ✅ 2 and 3.<br>

Well done! This chapter explores functions that call Spark without
converting to SQL first.

## Transforming continuous variables to logical

<!--
- Learn how to convert continuous variables into logical variables.
- Note that all feature transformation functions have names beginning "ft_".
- Select `artist_hotttnesss` field.
- Categorize this variable into those that are, ahem, "hottt" and those that are "nottt" using `ft_binarizer()`.
- Collect the data from Spark using `collect()`.
- Draw a histogram of `artist_hottnesss`, and
- Draw a bar plot of binarized `is_hottt`.
- Reiterate about how Spark wants everything as `DoubleType`s, but that is very un-R-ish.
-->

Logical variables are nice because it is often easier to think about
things in “yes or no” terms rather than in numeric terms. For example,
if someone asks you “Would you like a cup of tea?”, a yes or no response
is preferable to “There is a 0.73 chance of me wanting a cup of tea”.
This has real data science applications too. For example, a test for
diabetes may return the glucose concentration in a patient’s blood
plasma as a number. What you really care about is “Does the patient have
diabetes?”, so you need to convert the number into a logical value,
based upon some threshold.

In base-R, this is done fairly simply, using something like this:

``` r
threshold_mmol_per_l <- 7
has_diabetes <- plasma_glucose_concentration > threshold_mmol_per_l
```

All the `sparklyr` feature transformation functions have a similar user
interface. The first three arguments are always a Spark tibble, a string
naming the input column, and a string naming the output column. That is,
they follow this pattern.

``` r
a_tibble %>%
  ft_some_transformation("x", "y", some_other_args)
```

The `sparklyr` way of converting a continuous variable into logical uses
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_binarizer">`ft_binarizer()`</a>.
The previous diabetes example can be rewritten as the following. *Note
that the threshold value should be a number, not a string refering to a
column in the dataset.*

``` r
diabetes_data %>%
  ft_binarizer("plasma_glucose_concentration", "has_diabetes", threshold = threshold_mmol_per_l)
```

In keeping with the Spark philosophy of using `DoubleType` everywhere,
the output from
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_binarizer">`ft_binarizer()`</a>
isn’t actually logical; it is `numeric`. This is the correct approach
for letting you continue to work in Spark and perform other
transformations, but if you want to process your data in R, you have to
remember to explicitly convert the data to logical. The following is a
common code pattern.

``` r
a_tibble %>%
  ft_binarizer("x", "is_x_big", threshold = threshold) %>%
  collect() %>%
  mutate(is_x_big = as.logical(is_x_big))
```

This exercise considers the appallingly named `artist_hotttnesss` field,
which provides a measure of how much media buzz the artist had at the
time the dataset was created. If you would like to learn more about
drawing plots using the `ggplot2` package, please take the
<a href="https://www.datacamp.com/courses/data-visualization-with-ggplot2-1">*Data
Visualization with ggplot2 (Part 1)*</a> course.

**Steps**

1.  Create a variable named `hotttnesss` from `track_metadata_tbl`.

    -   Select the `artist_hotttnesss` field.
    -   Use `ft_binarizer()` to create a new field, `is_hottt_or_nottt`,
        which is true when `artist_hotttnesss` is greater than 0.5.
    -   Collect the result.
    -   Convert the `is_hottt_or_nottt` field to be logical.

2.  Draw a `ggplot()` bar plot of `is_hottt_or_nottt`.

    -   The first argument to `ggplot()` is the data argument,
        `hotttnesss`.
    -   The second argument to `ggplot()` is the aesthetic,
        `is_hottt_or_nottt` wrapped in `aes()`.
    -   Add `geom_bar()` to draw the bars.

``` r
# Load package
library(ggplot2)

hotttnesss <- track_metadata_tbl %>%
  # Select artist_hotttnesss
  select(artist_hotttnesss) %>%
  # Binarize to is_hottt_or_nottt
  ft_binarizer("artist_hotttnesss", "is_hottt_or_nottt", threshold = 0.5) %>%
  # Collect the result
  collect() %>%
  # Convert is_hottt_or_nottt to logical
  mutate(is_hottt_or_nottt = as.logical(is_hottt_or_nottt))

# Draw a barplot of is_hottt_or_nottt
ggplot(hotttnesss, aes(is_hottt_or_nottt)) +
  geom_bar()
```

![](readme_files/figure-gfm/unnamed-chunk-55-1.png)<!-- -->

Hot stuff! `ft_binarizer()` converts from continuous to logical; now
you’ll see how to convert from continuous to categorical.

## Transforming continuous variables into categorical (1)

<!--
- Learn how to convert continuous variables into categorical variables.
- Select `artist_hotttnesss` and `year` fields.
- Filter out records with missing values.
- Cut the continuous year field into `decade` categories using `ft_bucketizer()`.
- Collect the data from Spark using `collect()`.
- Draw boxplots of the `artist_hotttnesss` by `decade`.
- Notice that more recent artists have more media buzz, but the effect isn't that strong because artists from 1930 with no buzz aren't included in dataset.
-->

A generalization of the previous idea is to have multiple thresholds;
that is, you split a continuous variable into “buckets” (or “bins”),
just like a histogram does. In base-R, you would use
<a href="https://www.rdocumentation.org/packages/base/topics/cut">`cut()`</a>
for this task. For example, in a study on smoking habits, you could take
the typical number of cigarettes smoked per day, and transform it into a
factor.

``` r
smoking_status <- cut(
  cigarettes_per_day,
  breaks = c(0, 1, 10, 20, Inf),
  labels = c("non", "light", "moderate", "heavy"),
  right  = FALSE
)
```

The `sparklyr` equivalent of this is to use
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_bucketizer">`ft_bucketizer()`</a>.
The code takes a similar format to
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_binarizer">`ft_binarizer()`</a>,
but this time you must pass a vector of cut points to the `splits`
argument. Here is the same example rewritten in `sparklyr` style.

``` r
smoking_data %>%
  ft_bucketizer("cigarettes_per_day", "smoking_status", splits = c(0, 1, 10, 20, Inf))
```

There are several important things to note. You may have spotted that
the `breaks` argument from `cut()` is the same as the `splits` argument
from
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_bucketizer">`ft_bucketizer()`</a>.
There is a slight difference in how values on the boundary are handled.
In `cut()`, by default, the upper (right-hand) boundary is included in
each bucket, but not the left.
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_bucketizer">`ft_bucketizer()`</a>
includes the lower (left-hand) boundary in each bucket, but not the
right. This means that it is equivalent to calling `cut()` with the
argument `right = FALSE`.

One exception is that
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_bucketizer">`ft_bucketizer()`</a>
includes values on both boundaries for the upper-most bucket. So
`ft_bucketizer()` is also equivalent to setting `include.lowest = TRUE`
when using `cut()`.

The final thing to note is that whereas `cut()` returns a factor,
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_bucketizer">`ft_bucketizer()`</a>
returns a `numeric` vector, with values in the first bucket returned as
zero, values in the second bucket returned as one, values in the third
bucket returned as two, and so on. If you want to work on the results in
R, you need to explicitly convert to a factor. This is a common code
pattern:

``` r
a_tibble %>%
  ft_bucketizer("x", "x_buckets", splits = splits) %>%
  collect() %>%
  mutate(x_buckets = factor(x_buckets, labels = labels)
```

**Steps**

`decades` is a numeric sequence of 1920, 1930, …, 2020, and
`decade_labels` is a text description of those decades.

1.  Create a variable named `hotttnesss_over_time` from
    `track_metadata_tbl`.

    -   Select the `artist_hotttnesss` and `year` fields.
    -   Convert the `year` column to `numeric`.
    -   Use `ft_bucketizer()` to create a new field, `decade`, which
        splits the years using `decades`.
    -   Collect the result.
    -   Convert the `decade` field to a factor with labels
        `decade_labels`.

2.  Draw a `ggplot()` bar plot of `artist_hotttnesss` by `decade`.

    -   The first argument to `ggplot()` is the data argument,
        `hotttnesss_over_time`.
    -   The second argument to `ggplot()` is the aesthetic, which takes
        `decade` and `artist_hotttnesss` wrapped in `aes()`.
    -   Add `geom_boxplot()` to draw the bars.

``` r
# track_metadata_tbl, decades, decade_labels have been pre-defined
decades       <- seq(1930,2010,10)
decade_labels <- paste(decades, decades |> lead(1), sep = "-") |> head(-1)

hotttnesss_over_time <- track_metadata_tbl %>%
  # Select artist_hotttnesss and year
  select(artist_hotttnesss, year) %>%
  # Convert year to numeric
  mutate(year = as.numeric(year)) %>%
  # Bucketize year to decade using decades vector
  ft_bucketizer("year", "decade", splits = decades) %>%
  # Collect the result
  collect() %>%
  # Convert decade to factor using decade_labels
  mutate(decade = factor(decade, labels = decade_labels))
```

    ## Warning in !identical(self$schema_cache_state$ops, self$ops) ||
    ## is.na(self$schema_cache_state$schema[[cache_index]]): 'length(x) = 11 > 1' in
    ## coercion to 'logical(1)'

``` r
# Draw a boxplot of artist_hotttnesss by decade
ggplot(hotttnesss_over_time, aes(decade, artist_hotttnesss)) +
  geom_boxplot()
```

![](readme_files/figure-gfm/unnamed-chunk-59-1.png)<!-- -->

Slam dunk! `ft_bucketizer()` converts from continuous to categorical;
now you’ll see a common, special case of this.

## Transforming continuous variables into categorical (2)

<!--
- Learn how to convert continuous variables into categorical variables, by quantile.
- Select `duration` and `artist_familiarity`.
- Cut the `duration` into 5 quantile `duration_bin`s using `ft_quantile_discretizer()`.
- Collect the data from Spark using `collect()`.
- Draw boxplots of the `artist_familiarity` by `duration_bin`.
- Notice that famous artists are less likely to release very short or very long songs.
- Maybe discuss the weird boundary handling by Spark's QuantileDiscretizer.
-->

A special case of the previous transformation is to cut a continuous
variable into buckets where the buckets are defined by quantiles of the
variable. A common use of this transformation is to analyze survey
responses or review scores. If you ask people to rate something from one
to five stars, often the median response won’t be three stars. In this
case, it can be useful to split their scores up by quantile. For
example, you can make five quintile groups by splitting at the 0th,
20th, 40th, 60th, 80th, and 100th percentiles.

The base-R way of doing this is
<a href="https://www.rdocumentation.org/packages/base/topics/cut">`cut()`</a> +
<a href="https://www.rdocumentation.org/packages/stats/topics/quantile">`quantile()`</a>.
The `sparklyr` equivalent uses the
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_quantile_discretizer">`ft_quantile_discretizer()`</a>
transformation. This takes an `n.buckets` argument, which determines the
number of buckets. The base-R and `sparklyr` ways of calculating this
are shown together. As before, `right = FALSE` and `include.lowest` are
set.

<!--
TODO: what method does Spark use for calculating quantiles? type = 7?
does it really use right = FALSE, include.lowest = TRUE
-->

``` r
survey_response_group <- cut(
  survey_score,
  breaks = quantile(survey_score, c(0, 0.25, 0.5, 0.75, 1)),
  labels = c("hate it", "dislike it", "like it", "love it"),
  right  = FALSE,
  include.lowest = TRUE
)
survey_data %>%
  ft_quantile_discretizer("survey_score", "survey_response_group", n.buckets = 4)
```

As with
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_bucketizer">`ft_bucketizer()`</a>,
the resulting bins are numbers, counting from zero. If you want to work
with them in R, explicitly convert to a `factor`.

**Steps**

`duration_labels` is a character vector describing lengths of time.

1.  Create a variable named `familiarity_by_duration` from
    `track_metadata_tbl`.

    -   Select the `duration` and `artist_familiarity` fields.
    -   Use `ft_quantile_discretizer()` to create a new field,
        `duration_bin`, made from 5 quantile bins of `duration`.
    -   Collect the result.
    -   Convert the `duration_bin` field to a factor with labels
        `duration_labels`.

2.  Draw a `ggplot()` box plot of `artist_familiarity` by
    `duration_bin`.

    -   The first argument to `ggplot()` is the data argument,
        `familiarity_by_duration`.
    -   The second argument to `ggplot()` is the aesthetic, which takes
        `duration_bin` and `artist_familiarity` wrapped in `aes()`.
    -   Add `geom_boxplot()` to draw the bars.

``` r
# track_metadata_tbl, duration_labels have been pre-defined
duration_labels <- c("very short","short","medium","long","very long")

familiarity_by_duration <- track_metadata_tbl %>%
  # Select duration and artist_familiarity
  select(duration, artist_familiarity) %>%
  # Bucketize duration
  ft_quantile_discretizer("duration", "duration_bin", num_buckets = 5) %>%
  # Collect the result
  collect() %>%
  # Convert duration bin to factor
  mutate(duration_bin = factor(duration_bin, labels = duration_labels))

# Draw a boxplot of artist_familiarity by duration_bin
ggplot(familiarity_by_duration, aes(duration_bin, artist_familiarity)) +
  geom_boxplot()
```

![](readme_files/figure-gfm/unnamed-chunk-61-1.png)<!-- -->

You win all the buckets! Long songs are released by, on average,
slightly more famous artists. `ft_binarizer()`, `ft_bucketizer()`, and
`ft_quantile_discretizer()` all transform continuous variables.

## More than words: tokenization (1)

<!--
- Learn to process character fields into a form suitable for text mining.
- Select `title` field.
- Convert `title` character vector to list of character vectors of words using `ft_tokenizer()`.
- Collect the data from Spark using `collect()`.
- Run a simple text mining analysis, maybe `qdap::freq_terms()` or `qdap::polarity()`.
-->

Common uses of text-mining include analyzing shopping reviews to
ascertain purchasers’ feeling about the product, or analyzing financial
news to predict the sentiment regarding stock prices. In order to
analyze text data, common pre-processing steps are to convert the text
to lower-case (see
<a href="https://www.rdocumentation.org/packages/base/topics/tolower">`tolower()`</a>),
and to split sentences into individual words.

<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_tokenizer">`ft_tokenizer()`</a>
performs both these steps. Its usage takes the same pattern as the other
transformations that you have seen, with no other arguments.

``` r
shop_reviews %>%
  ft_tokenizer("review_text", "review_words")
```

Since the output can contain a different number of words in each row,
`output.col` is a list column, where every element is a list of strings.
To analyze text data, it is usually preferable to have one word per row
in the data. The list-of-list-of-strings format can be transformed to a
single character vector using
<a href="https://www.rdocumentation.org/packages/tidyr/topics/unnest">`unnest()`</a>
from the `tidyr` package. There is currently no method for unnesting
data on Spark, so for now, you have to collect it to R before
transforming it. The code pattern to achieve this is as follows.

``` r
library(tidyr)
text_data %>%
  ft_tokenizer("sentences", "word") %>%
  collect() %>%
  mutate(word = lapply(word, as.character)) %>%
  unnest(word)
```

If you want to learn more about using the `tidyr` package, take the
<a href="https://www.datacamp.com/courses/cleaning-data-in-r">*Cleaning
Data in R*</a> course.

**Steps**

1.  Create a variable named `title_text` from `track_metadata_tbl`.

    -   Select the `artist_name` and `title` fields.
    -   Use `ft_tokenizer()` to create a new field, `word`, which
        contains the title split into words.
    -   Collect the result.
    -   Mutate the `word` column, flattening it to a list of character
        vectors using `lapply` and `as.character`.
    -   Use `unnest()` to flatten the list column, and get one word per
        row.

``` r
title_text <- track_metadata_tbl %>%
  # Select artist_name, title
  select(artist_name, title) %>%
  # Tokenize title to words
  ft_tokenizer("title", "word") %>%
  # Collect the result
  collect() %>%
  # Flatten the word column 
  mutate(word = lapply(word, as.character)) %>% 
  # Unnest the list column
  unnest(word)
```

    ## Warning in !identical(self$schema_cache_state$ops, self$ops) ||
    ## is.na(self$schema_cache_state$schema[[cache_index]]): 'length(x) = 11 > 1' in
    ## coercion to 'logical(1)'

Transcendent tokenizing! Now for a quick diversion into sentiment
analysis to analyze them!

## More than words: tokenization (2)

<!--
- A diversion into tidytext.
- tidyr::unnest() the words
- Inner join to tidytext::inner_join(get_sentiments("bing")
- Show +ve and -ve word counts
- Sentiment = +ve - -ve
- Show mean sentiment by artist.
-->

The `tidytext` package lets you analyze text data using “tidyverse”
packages such as `dplyr` and `sparklyr`. How to do sentiment analysis is
beyond the scope of this course; you can see more in the
<a href="https://www.datacamp.com/courses/sentiment-analysis-in-r">Sentiment
Analysis</a> and
<a href="https://www.datacamp.com/courses/sentiment-analysis-in-r-the-tidy-way">Sentiment
Analysis: The Tidy Way</a> courses. This exercise is designed to give
you a quick taste of how to do it on Spark.

Sentiment analysis essentially lets you assign a score or emotion to
each word. For example, in the AFINN lexicon, the word `"outstanding"`
has a score of `+5`, since it is almost always used in a positive
context. `"grace"` is a slightly positive word, and has a score of `+1`.
`"fraud"` is usually used in a negative context, and has a score of
`-4`. The AFINN scores dataset is returned by
<a href="https://www.rdocumentation.org/packages/tidytext/topics/get_sentiments">`get_sentiments("afinn")`</a>.
For convenience, the unnested word data and the sentiment lexicon have
been copied to Spark.

Typically, you want to compare the sentiment of several groups of data.
To do this, the code pattern is as follows.

``` r
text_data %>%
  inner_join(sentiments, by = "word") %>%
  group_by(some_group) %>%
  summarize(positivity = sum(score))
```

An inner join takes all the values from the first table, and looks for
matches in the second table. If it finds a match, it adds the data from
the second table. Unlike a left join, it will drop any rows where it
doesn’t find a match. The principle is shown in this diagram.

<img src="http://s3.amazonaws.com/assets.datacamp.com/production/course_3309/datasets/inner-join.png" alt="An inner join, explained using table of colors.">

Like left joins, inner joins are a type of mutating join, since they add
columns to the first table. See if you can guess which function to use
for inner joins, and how to use it. (Hint: the usage is really similar
to
<a href="https://www.rdocumentation.org/packages/dplyr/topics/join">`left_join()`</a>,
<a href="https://www.rdocumentation.org/packages/dplyr/topics/join">`anti_join()`</a>,
and
<a href="https://www.rdocumentation.org/packages/dplyr/topics/join">`semi_join()`</a>!)

**Steps**

Tibbles attached to the title words and sentiment lexicon stored in
Spark have been pre-defined as `title_text_tbl` and
`afinn_sentiments_tbl` respectively.

1.  Create a variable named `sentimental_artists` from `title_text_tbl`.

    -   Use `inner_join()` to join `afinn_sentiments_tbl` to
        `title_text_tbl` by `"word"`.
    -   Group by the `artist_name`.
    -   Summarize to define a variable `positivity`, equal to the sum of
        the `score` field.

``` r
afinn_sentiments <- tidytext::get_sentiments("afinn") |> rename(score = "value")

afinn_sentiments_tbl <- copy_to(spark_conn, afinn_sentiments)
title_text_tbl       <- copy_to(spark_conn, title_text)


sentimental_artists <- title_text_tbl %>%
  # Inner join with sentiments on word field
  inner_join(afinn_sentiments_tbl, by = "word") %>%
  # Group by artist
  group_by(artist_name) %>%
  # Summarize to get positivity
  summarize(positivity = sum(score))
```

2.  Find the top 5 artists with the most negative song titles.

    -   Arrange the `sentimental_artists` by ascending positivity.
    -   Use `top_n()` to get the top 5 results. (superseded. slice_min /
        slice_max not working yet. Workaround: head())

``` r
sentimental_artists %>%
  # Arrange by ascending positivity
  arrange(positivity) %>%
  # Get top 5
  head(5)
```

    ## Warning: Missing values are always removed in SQL.
    ## Use `SUM(x, na.rm = TRUE)` to silence this warning
    ## This warning is displayed only once per session.

    ## # Source:     spark<?> [?? x 2]
    ## # Ordered by: positivity
    ##   artist_name       positivity
    ##   <chr>                  <dbl>
    ## 1 The Misfits               -7
    ## 2 Husker Du                 -6
    ## 3 The Four Horsemen         -6
    ## 4 The Grey Wolves           -6
    ## 5 Bukka White               -5

3.  Find the top 5 artists with the most positive song titles.

    -   Arrange the `sentimental_artists` by descending positivity.
    -   Get the top 5 results.

``` r
sentimental_artists %>%
  # Arrange by descending positivity
  arrange(-positivity) %>%
  # Get top 5
  head(5)
```

    ## # Source:     spark<?> [?? x 2]
    ## # Ordered by: -positivity
    ##   artist_name       positivity
    ##   <chr>                  <dbl>
    ## 1 Percy Mayfield            16
    ## 2 Billie Holiday             7
    ## 3 Sam Cooke                  7
    ## 4 Nazz                       6
    ## 5 Jimmy Witherspoon          6

My sentiment is *impressed with your code*! `sprklyr` and `tidytext`
work well together for sentiment analysis.

## More than words: tokenization (3)

<!--
- Generalize the previous concept using regular expressions.
- Select the `artist_mbid` field.
- Split the Music Brainz ID field by hyphens into numeric blocks.
-->

<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_tokenizer">`ft_tokenizer()`</a>
uses a simple technique to generate words by splitting text data on
spaces. For more advanced usage, you can use regular expressions to
split the text data. This is done via the
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_regex_tokenizer">`ft_regex_tokenizer()`</a>
function, which has the same usage as
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_tokenizer">`ft_tokenizer()`</a>,
but with an extra `pattern` argument for the splitter.

``` r
a_tibble %>%
  ft_regex_tokenizer("x", "y", pattern = regex_pattern)
```

The return value from
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_regex_tokenizer">`ft_regex_tokenizer()`</a>,
like
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ft_tokenizer">`ft_tokenizer()`</a>,
is a list of lists of character vectors.

The dataset contains a field named `artist_mbid` that contains an ID for
the artist on MusicBrainz, a music metadata encyclopedia website. The
IDs take the form of hexadecimal numbers split by hyphens, for example,
`65b785d9-499f-48e6-9063-3a1fd1bd488d`.

**Steps**

1.  Select the `artist_mbid` field from `track_metadata_tbl`.

2.  Split the MusicBrainz IDs into chunks of hexadecimal
    numbers.`ft_regex_tokenizer()`.output column should be called
    `artist_mbid_chunks`.a hyphen, `-`, for the `pattern` argument.

    -   Call `ft_regex_tokenizer()`.
    -   The output column should be called `artist_mbid_chunks`.
    -   Use a hyphen, `-`, for the `pattern` argument.

``` r
track_metadata_tbl %>%
  # Select artist_mbid column
  select(artist_mbid) %>%
  # Split it by hyphens
  ft_regex_tokenizer("artist_mbid", "artist_mbid_chunks", pattern = "-")
```

    ## Warning in !identical(self$schema_cache_state$ops, self$ops) ||
    ## is.na(self$schema_cache_state$schema[[cache_index]]): 'length(x) = 11 > 1' in
    ## coercion to 'logical(1)'

    ## # Source: spark<?> [?? x 2]
    ##    artist_mbid                          artist_mbid_chunks
    ##    <chr>                                <list>            
    ##  1 5c176092-cb4d-4e05-806b-1e9414f2b28c <list [5]>        
    ##  2 4756395c-57ed-4a63-afb2-01117f14dff6 <list [5]>        
    ##  3 15ab8bb8-7348-4377-ab73-b7acdad1459c <list [5]>        
    ##  4 0174d942-39da-4dcd-aa48-d0f3fb4f218d <list [5]>        
    ##  5 4dca4bb2-23ba-4103-97e6-5810311db33a <list [5]>        
    ##  6 8ee00333-ec2c-439b-a619-ae160aca2a15 <list [5]>        
    ##  7 f940c4dd-f687-4c6a-872b-1cce3f78dc0a <list [5]>        
    ##  8 4d2956d1-a3f7-44bb-9a41-67563e1a0c94 <list [5]>        
    ##  9 637504e3-be95-4005-83ee-3ebb91f9fcf9 <list [5]>        
    ## 10 d86c3c8b-84d5-44ce-80fa-7cfc537fe5c1 <list [5]>        
    ## # … with more rows

Righteous regex usage! You can do powerful text manipulations with
`ft_regex_tokenizer()`.

## Sorting vs. arranging

<!--
- Learn to order a data frame's row using the Scala interface, and compare to the `dplyr` interface.
- Note that all Spark data frame functions have names beginning "sdf_".
- Arrange the rows by `year`, then `artist_name`, then `release`,  then `title`, using `arrange()`.
- Repeat the arrangement using `sdf_sort()`.
- Time both of these (remember to `compute()` the results), and note that `sdf_sort()` is slower.
- Note that in general, you should use the `dplyr` interface since you can use the same code in both local and remote contexts.
-->

So far in this chapter, you’ve explored some feature transformation
functions from Spark’s MLlib. `sparklyr` also provides access to some
functions making use of the Spark DataFrame API.

The `dplyr` way of sorting a tibble is to use
<a href="https://www.rdocumentation.org/packages/dplyr/topics/arrange">`arrange()`</a>.
You can also sort tibbles using Spark’s DataFrame API using
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/sdf_sort">`sdf_sort()`</a>.
This function takes a character vector of columns to sort on, and
currently only sorting in ascending order is supported.

For example, to sort by column `x`, then (in the event of ties) by
column `y`, then by column `z`, the following code compares the `dplyr`
and Spark DataFrame approaches.

``` r
a_tibble %>%
  arrange(x, y, z)
a_tibble %>%
  sdf_sort(c("x", "y", "z"))
```

To see which method is faster, try using both
<a href="https://www.rdocumentation.org/packages/dplyr/topics/arrange">`arrange()`</a>,
and
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/sdf_sort">`sdf_sort()`</a>.
You can see how long your code takes to run by wrapping it in
<a href="https://www.rdocumentation.org/packages/microbenchmark/topics/microbenchmark">`microbenchmark()`</a>,
from the package of the same name.

``` r
microbenchmark({
  # your code
})
```

You can learn more about profiling the speed of your code in the
<a href="https://www.datacamp.com/courses/writing-efficient-r-code">*Writing
Efficient R Code*</a> course.

**Steps**

1.  Use `microbenchmark()` to compare how long it takes to perform the
    following actions.

    -   Use `arrange()` to order the rows of `track_metadata_tbl` by
        `year`, then `artist_name`, then `release`, then `title`.
    -   Collect the result.
    -   Do the same thing again, this time using `sdf_sort()` rather
        than `arrange()`. Remember to quote the column names.

``` r
# Load package
library(microbenchmark)

# Compare timings of arrange() and sdf_sort()
microbenchmark(
  arranged = track_metadata_tbl %>%
    # Arrange by year, then artist_name, then release, then title
    arrange(year, artist_name, release, title) %>%
    # Collect the result
    collect(),
  sorted = track_metadata_tbl %>%
    # Sort by year, then artist_name, then release, then title
    sdf_sort(c("year", "artist_name", "release", "title")) %>%
    # Collect the result
    collect(),
  times = 5
)
```

    ## Unit: milliseconds
    ##      expr      min       lq     mean   median       uq      max neval
    ##  arranged 117.4927 122.5674 134.1873 133.4200 142.4268 155.0298     5
    ##    sorted 192.7001 195.3614 217.2148 199.8404 221.1427 277.0297     5

Did you order pizza? No? Just the data then. Sometimes native methods
are faster than the `dplyr` equivalent; sometimes it is the other way
around. Profile your code if you need to see where the slowness occurs.

## Exploring Spark data types

<!--
- Learn how to explore the fields and their types.
- Retrieve the schema for the song metadata using `sdf_schema()`.
- Discuss how R vector types map to Spark DataFrame field types (`numeric` to `DoubleType`, etc.).
-->

You’ve already seen (back in Chapter 1)
<a href="https://www.rdocumentation.org/packages/dplyr/topics/src_tbls">`src_tbls()`</a>
for listing the DataFrames on Spark that `sparklyr` can see. You’ve also
seen
<a href="https://www.rdocumentation.org/packages/dplyr/topics/glimpse">`glimpse()`</a>
for exploring the columns of a tibble on the R side.

`sparklyr` has a function named
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/sdf_schema">`sdf_schema()`</a>
for exploring the columns of a tibble on the R side. It’s easy to call;
and a little painful to deal with the return value.

``` r
sdf_schema(a_tibble)
```

The return value is a list, and each element is a list with two
elements, containing the name and data type of each column. The exercise
shows a data transformation to more easily view the data types.

Here is a comparison of how R data types map to Spark data types. Other
data types are not currently supported by `sparklyr`.

<!--
https://spark.apache.org/docs/2.1.0/sql-programming-guide.html#data-types
-->

| R type    | Spark type  |
|:----------|:------------|
| logical   | BooleanType |
| numeric   | DoubleType  |
| integer   | IntegerType |
| character | StringType  |
| list      | ArrayType   |

**Steps**

1.  Call `sdf_schema()` to get the schema of the track metadata.

``` r
# Get the schema
(schema <- sdf_schema(track_metadata_tbl))
```

    ## Warning in !identical(self$schema_cache_state$ops, self$ops) ||
    ## is.na(self$schema_cache_state$schema[[cache_index]]): 'length(x) = 11 > 1' in
    ## coercion to 'logical(1)'

    ## $track_id
    ## $track_id$name
    ## [1] "track_id"
    ## 
    ## $track_id$type
    ## [1] "StringType"
    ## 
    ## 
    ## $title
    ## $title$name
    ## [1] "title"
    ## 
    ## $title$type
    ## [1] "StringType"
    ## 
    ## 
    ## $song_id
    ## $song_id$name
    ## [1] "song_id"
    ## 
    ## $song_id$type
    ## [1] "StringType"
    ## 
    ## 
    ## $release
    ## $release$name
    ## [1] "release"
    ## 
    ## $release$type
    ## [1] "StringType"
    ## 
    ## 
    ## $artist_id
    ## $artist_id$name
    ## [1] "artist_id"
    ## 
    ## $artist_id$type
    ## [1] "StringType"
    ## 
    ## 
    ## $artist_mbid
    ## $artist_mbid$name
    ## [1] "artist_mbid"
    ## 
    ## $artist_mbid$type
    ## [1] "StringType"
    ## 
    ## 
    ## $artist_name
    ## $artist_name$name
    ## [1] "artist_name"
    ## 
    ## $artist_name$type
    ## [1] "StringType"
    ## 
    ## 
    ## $duration
    ## $duration$name
    ## [1] "duration"
    ## 
    ## $duration$type
    ## [1] "DoubleType"
    ## 
    ## 
    ## $artist_familiarity
    ## $artist_familiarity$name
    ## [1] "artist_familiarity"
    ## 
    ## $artist_familiarity$type
    ## [1] "DoubleType"
    ## 
    ## 
    ## $artist_hotttnesss
    ## $artist_hotttnesss$name
    ## [1] "artist_hotttnesss"
    ## 
    ## $artist_hotttnesss$type
    ## [1] "DoubleType"
    ## 
    ## 
    ## $year
    ## $year$name
    ## [1] "year"
    ## 
    ## $year$type
    ## [1] "IntegerType"

2.  Run the transformation code on `schema` to see it in a more readable
    tibble format.

``` r
# Transform the schema
schema %>%
  lapply(data.frame, stringsAsFactors = FALSE) %>%
  bind_rows()
```

    ##                  name        type
    ## 1            track_id  StringType
    ## 2               title  StringType
    ## 3             song_id  StringType
    ## 4             release  StringType
    ## 5           artist_id  StringType
    ## 6         artist_mbid  StringType
    ## 7         artist_name  StringType
    ## 8            duration  DoubleType
    ## 9  artist_familiarity  DoubleType
    ## 10  artist_hotttnesss  DoubleType
    ## 11               year IntegerType

Successful schema scrutinizing! It is good to learn how R variable types
map to Spark variable types.

## Shrinking the data by sampling

<!--
- Learn to reduce the dataset size by sampling.
- Explain that this is really useful while experimenting with code.
- Sample 1% of the dataset using `sdf_sample()`. Remember to set `replace = FALSE`.
-->

When you are working with a big dataset, you typically don’t really need
to work with all of it all the time. Particularly at the start of your
project, while you are experimenting wildly with what you want to do,
you can often iterate more quickly by working on a smaller subset of the
data.
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/sdf_sample">`sdf_sample()`</a>
provides a convenient way to do this. It takes a tibble, and the
fraction of rows to return. In this case, you want to sample without
replacement. To get a random sample of one tenth of your dataset, you
would use the following code.

``` r
a_tibble %>%
  sdf_sample(fraction = 0.1, replacement = FALSE)
```

Since the results of the sampling are random, and you will likely want
to reuse the shrunken dataset, it is common to use
<a href="https://www.rdocumentation.org/packages/dplyr/topics/compute">`compute()`</a>
to store the results as another Spark data frame.

``` r
a_tibble %>%
  sdf_sample(<some args>) %>%
  compute("sample_dataset")
```

To make the results reproducible, you can also set a random number seed
via the `seed` argument. Doing this means that you get the same random
dataset every time you run your code. It doesn’t matter which number you
use for the seed; just choose your favorite positive integer.

**Steps**

1.  Use `sdf_sample()` to sample 1% of the track metadata without
    replacement.`20000229` to the `seed` argument to set a random seed.

    -   Pass `20000229` to the `seed` argument to set a random seed.

2.  Compute the result, and store it in a table named
    `"sample_track_metadata"`.

``` r
track_metadata_tbl %>%
  # Sample the data without replacement
  sdf_sample(0.01, replacement = FALSE, seed = 20000229) %>%
  # Compute the result
  compute("sample_track_metadata")
```

    ## # Source: spark<sample_track_metadata> [?? x 11]
    ##   track_id  title  song_id  release  artist_id artist_mbid  artist_name duration
    ##   <chr>     <chr>  <chr>    <chr>    <chr>     <chr>        <chr>          <dbl>
    ## 1 TRGJEYQ1… Forev… SOXPOTL… Gold     ARIA1UE1… c113d7a7-2b… Justin Hay…     258.
    ## 2 TRTITHW1… Time … SOJUVJE… In A Di… AR33XTN1… 6ec9d37f-93… The Itals       199.
    ## 3 TRUQBHF1… Recue… SOHARDN… Puglies… ARDY1CB1… 813a79f0-18… Osvaldo Pu…     159.
    ## 4 TRDRDLD1… White… SOGKFOT… The Def… ARRL2QH1… 2437980f-51… Bing Crosby     179.
    ## 5 TRKUTGX1… Third… SOSUFFM… Rooseve… ARFUFNK1… 99ab25d6-7c… Roosevelt …     179.
    ## 6 TRBYYLX1… Can't… SODVLCM… I'm Jim… ARX84Z71… 018d8a5e-76… Jimmy Reed      171.
    ## 7 TRQXIIR1… I Nee… SOIDAIZ… The Man… ARULZ741… 01809552-4f… Elvis Pres…     147.
    ## # … with 3 more variables: artist_familiarity <dbl>, artist_hotttnesss <dbl>,
    ## #   year <int>

Splendid sampling! `sdf_sample()` can also be used for things like
bootstrapping, which use sampling with replacement.

## Training/testing partitions

<!--
- Learn how to partition the dataset into training and test sets.
- Partition the track metadata using `sdf_partition()`.
- Note that the exact set sizes won't be identical to the requested size, due to sampling strategy.
-->

Most of the time, when you run a predictive model, you need to fit the
model on one subset of your data (the “training” set), then test the
model predictions against the rest of your data (the “testing” set).

<a href="https://www.rdocumentation.org/packages/sparklyr/topics/sdf_partition">`sdf_partition()`</a>
provides a way of partitioning your data frame into training and testing
sets. Its usage is as follows.

``` r
a_tibble %>%
  sdf_partition(training = 0.7, testing = 0.3)
```

There are two things to note about the usage. Firstly, if the partition
values don’t add up to one, they will be scaled so that they do. So if
you passed `training = 0.35` and `testing = 0.15`, you’d get double what
you asked for. Secondly, you can use any set names that you like, and
partition the data into more than two sets. So the following is also
valid.

``` r
a_tibble %>%
  sdf_partition(a = 0.1, b = 0.2, c = 0.3, d = 0.4)
```

The return value is a list of tibbles. you can access each one using the
usual list indexing operators.

``` r
partitioned$a
partitioned[["b"]]
```

**Steps**

1.  Use `sdf_partition()` to split the track metadata.

    -   Put 70% in a set named `training`.
    -   Put 30% in a set named `testing`.

2.  Get the `dim()`ensions of the training tibble.

3.  Get the dimensions of the testing tibble.

``` r
partitioned <- track_metadata_tbl %>%
  # Partition into training and testing sets
  sdf_partition(training = 0.7, testing = 0.3)
```

    ## Warning: 'sdf_partition' is deprecated.
    ## Use 'sdf_random_split' instead.
    ## See help("Deprecated")

``` r
# Get the dimensions of the training set
sdf_nrow(partitioned$training)
```

    ## [1] 658

``` r
# Get the dimensions of the testing set
sdf_nrow(partitioned$testing)
```

    ## [1] 342

Well split! Notice that the sizes of the training and testing sets
aren’t exactly 0.7 and 0.3 of the original dataset, due to random
variation.

# 4. Case Study: Learning to be a Machine: Running Machine Learning Models on Spark

A case study in which you learn to use <code>sparklyr</code>’s machine
learning routines, by predicting the year in which a song was released.

## Machine learning on Spark

Theory. Coming soon …

**1. Machine learning on Spark**

In the final chapter of this course, you’re going to return to MLlib,
and this time you’ll explore some machine learning models.

**2. Gradient boosted tree models and random forests**

You’ll get to run gradient boosted tree models and random forest models,
then make predictions about what year a song was released based on its
timbre. Finally, you’ll explore visualizations of the model results, and
compare their accuracy.

**3. Let’s practice!**

## Machine learning functions

<!--
- Give examples of the available modeling and machine learning functions.
- Note that there is a very limited selection compared to R, for now.
- All machine learning functions start "ml_".
-->

In the last chapter, you saw some of the feature transformation
functionality of Spark MLlib. If that library were a meal, the feature
transformations would be a starter; the main course is a sumptuous
selection of machine learning modeling functions! These functions all
have names beginning with `ml_`, and have a similar signature. They take
a tibble, a string naming the response variable, a character vector
naming features (input variables), and possibly some other
model-specific arguments.

``` r
a_tibble %>%
  ml_some_model("response", c("a_feature", "another_feature"), some_other_args)
```

Supported machine learning functions include linear regression and its
variants, tree-based models
(<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ml_decision_tree">`ml_decision_tree()`</a>,
and a few others. You can see the list of all the machine learning
functions using `ls()`.

``` r
ls("package:sparklyr", pattern = "^ml")
```

> ## *Question*
>
> What arguments do all the machine learning model functions take?<br>
> <br> ⬜ A formula and a data frame.<br> ⬜ A formula and a tibble.<br>
> ⬜ A tibble and a formula.<br> ✅ A tibble, a string naming the
> response field, and a character vector naming the explanatory
> fields.<br>

Do I hear the sweet melody of an answer that sounds great? Now let’s do
some machine learning!

## (Hey you) What’s that sound?

<!--
- To model a song, you need to turn it into numbers.
- The Million Song Dataset have 12 timbre measurements taken at regular time intervals throughout the song.
- Explain what timbre is.
- Take the column means of a song's timbre matrix, to get 12 features.
-->

Songs start out as an analogue thing: their sound is really a load of
vibrations of air. In order to analyze a song, you need to turn it into
some meaningful numbers. Tracks in the Million Song Dataset have twelve
timbre measurements taken at regular time intervals throughout the song.
(Timbre is a measure of the perceived quality of a sound; you can use it
to distinguish voices from string instruments from percussion
instruments, for example.)

In this chapter, you are going to try and predict the year a track was
released, based upon its timbre. That is, you are going to use these
timbre measurements to generate features for the models. (Recall that
*feature* is machine learning terminology for an input variable in a
model. They are often called explanatory variables in statistics.)

The timbre data takes the form of a matrix, with rows representing the
time points, and columns representing the different timbre measurements.
Thus all the timbre matrices have twelve columns, but the number of rows
differs from song to song. The mean of each column estimates the average
of a timbre measurement over the whole song. These can be used to
generate twelve features for the model.

**Steps**

1.  `timbre`, containing the timbre measurements for Lady Gaga’s “Poker
    Face”, has been pre-defined in your workspace.

    -   Use `colMeans()` to get the column means of `timbre`. Assign the
        results to `mean_timbre`.

``` r
# timbre has been pre-defined
timbre <- readRDS("data/timbre.rds")

# Calculate column means
(mean_timbre <- colMeans(timbre))
```

    ##  [1]  39.244095 -39.408016  41.409616   4.748857  19.444392  22.716039
    ##  [7] -10.596981   6.838041   3.179969   2.454293  -4.799178  12.575696

Tip-top timbre action! You have 12 timbre means for each track to use
for features in your models.

## Working with parquet files

<!--
- Spark has its own file format for DataFrames, namely Parquet.
- This is a binary format, so it is quicker to read and write than CSV.
- Mention that the timbre data, containing the 90 timbre measurements for each track, has been stored in a Parquet file.
- Import the timbre data directly into Spark (not via R) using `spark_read_parquet()`.
-->

CSV files are great for saving the contents of rectangular data objects
(like R `data.frame`s and Spark `DataFrames`) to disk. The problem is
that they are really slow to read and write, making them unusable for
large datasets. Parquet files provide a higher performance alternative.
As well as being used for Spark data, parquet files can be used with
other tools in the Hadoop ecosystem, like Shark, Impala, Hive, and Pig.

Technically speaking, *parquet file* is a misnomer. When you store data
in parquet format, you actually get a whole directory worth of files.
The data is split across multiple `.parquet` files, allowing it to be
easily stored on multiple machines, and there are some metadata files
too, describing the contents of each column.

`sparklyr` can import parquet files using
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/spark_read_parquet">`spark_read_parquet()`</a>.
This function takes a Spark connection, a string naming the Spark
DataFrame that should be created, and a path to the parquet directory.
Note that this function will import the data directly into Spark, which
is typically faster than importing the data into R, then using
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/copy_to">`copy_to()`</a>
to copy the data from R to Spark.

``` r
spark_read_parquet(sc, "a_dataset", "path/to/parquet/dir")
```

**Steps**

A string pointing to the parquet directory (on the file system where R
is running) has been created for you as `parquet_dir`.

    * Use `dir()` to list the *absolute* file paths of the files in the parquet directory, assigning the result to `filenames`.\nThe first argument should be the directory whose files you are listing, `parquet_dir`.\nTo retrieve the absolute (rather than relative) file paths, you should also pass `full.names = TRUE`. 
    * The first argument should be the directory whose files you are listing, `parquet_dir`.
    * To retrieve the absolute (rather than relative) file paths, you should also pass `full.names = TRUE`. 
    * Create a `data_frame` with two columns.\n`filename` should contain the filenames you just retrieved, without the directory part. Create this by passing the filenames to `basename()`.\n`size_bytes` should contain the file sizes of those files. Create this by passing the filenames to `file.size()`.
    * `filename` should contain the filenames you just retrieved, without the directory part. Create this by passing the filenames to `basename()`.
    * `size_bytes` should contain the file sizes of those files. Create this by passing the filenames to `file.size()`.
    * Use `spark_read_parquet()` to import the timbre data into Spark, assigning the result to `timbre_tbl`.\nThe first argument should be the Spark connection.\nThe second argument should be `"timbre"`.\nThe third argument should be `parquet_dir`.
    * The first argument should be the Spark connection.
    * The second argument should be `"timbre"`.
    * The third argument should be `parquet_dir`.

``` r
# parquet_dir has been pre-defined
parquet_dir <- "data/timbre_parquet/"

# List the files in the parquet dir
filenames <- dir(parquet_dir, full.names = TRUE)

# Show the filenames and their sizes
data_frame(
  filename = basename(filenames),
  size_bytes = file.size(filenames)
)
```

    ## Warning: `data_frame()` was deprecated in tibble 1.1.0.
    ## Please use `tibble()` instead.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated.

    ## # A tibble: 2 × 2
    ##   filename                                                         size_bytes
    ##   <chr>                                                                 <dbl>
    ## 1 _SUCCESS                                                                  0
    ## 2 part-r-00000-720803dc-75ed-4df7-b134-e6fdd8da5f0b.snappy.parquet     112774

``` r
# Import the data into Spark
timbre_tbl <- spark_read_parquet(spark_conn, "timbre", parquet_dir)
```

Smooth as some parquet flooring! Reading and writing Parquet files is
much quicker than reading and writing CSV files, and typically faster
than using `copy_to()`.

## Come together

<!--
- Inner join the track metadata with the track timbre data on `track_id` using `inner_join()`.
- Filter out the rows with unknown year (`year == 0`).
- Explore the resulting joined table using `glimpse()`.
-->

The features to the models you are about to run are contained in the
`timbre` dataset, but the response – the year – is contained in the
`track_metadata` dataset. Before you run the model, you are going to
have to join these two datasets together. In this case, there is a one
to one matching of rows in the two datasets, so you need an inner join.

There is one more data cleaning task you need to do. The `year` column
contains integers, but Spark modeling functions require real numbers.
You need to convert the year column to `numeric`.

**Steps**

1.  Inner join the track metadata to the timbre data by the `track_id`
    column.
2.  Convert the `year` column to `numeric`.

``` r
track_metadata_tbl %>%
  # Inner join to timbre_tbl
  inner_join(timbre_tbl, by = "track_id") %>%
  # Convert year to numeric
  mutate(year = as.numeric(year))
```

    ## # Source: spark<?> [?? x 23]
    ##    track_id  title  song_id  release  artist_id artist_mbid artist_name duration
    ##    <chr>     <chr>  <chr>    <chr>    <chr>     <chr>       <chr>          <dbl>
    ##  1 TRDVOZX1… Jerse… SOKMEHX… Backwat… ARDNQ0R1… dbfd61ef-f… Lonnie Joh…     178.
    ##  2 TRYKNRH1… She's… SOVEMEO… Rooseve… ARFUFNK1… 99ab25d6-7… Roosevelt …     174.
    ##  3 TRTDSZA1… Blues… SOGJBOP… Tampa R… AR576O51… 1b62df85-0… Tampa Red       200.
    ##  4 TRKYOZL1… Drop … SOEIMRG… 1935-19… ARE2QID1… 3bef5827-7… Sleepy Joh…     191.
    ##  5 TRKIDHY1… Penni… SOHBKZO… Film Fa… ARRL2QH1… 2437980f-5… Bing Crosby     192.
    ##  6 TRWVMJQ1… Old S… SOWJQMG… Tenness… AR9HABI1… aff932c2-e… Red Foley       196.
    ##  7 TRPNSUE1… Summi… SODXPGD… Begin T… ARVYGOU1… e0e03d5f-9… Artie Shaw…     206.
    ##  8 TRXBTVP1… Devil… SODACRM… Rhythm … ARL99WU1… f205743d-4… Skip James      179.
    ##  9 TRYGLKZ1… Milk … SOBJTIF… Kokomo … ARR6H6G1… 74a64e96-4… Kokomo Arn…     193.
    ## 10 TROTQNF1… Stran… SOJXRGY… Blues W… ARNEL2O1… 882af819-8… Bukka White     159.
    ## # … with more rows, and 15 more variables: artist_familiarity <dbl>,
    ## #   artist_hotttnesss <dbl>, year <dbl>, timbre_means1 <dbl>,
    ## #   timbre_means2 <dbl>, timbre_means3 <dbl>, timbre_means4 <dbl>,
    ## #   timbre_means5 <dbl>, timbre_means6 <dbl>, timbre_means7 <dbl>,
    ## #   timbre_means8 <dbl>, timbre_means9 <dbl>, timbre_means10 <dbl>,
    ## #   timbre_means11 <dbl>, timbre_means12 <dbl>

Your code is so sweet, it’ll turn into a ballroom blitz! The dataset is
almost ready to model.

## Partitioning data with a group effect

<!--
- Introduce the combined dataset, with track metadata and timbre fields together in a single data frame.
- Need to split the data into training and testing sets.
- To avoid an artist effect, but keep song from same artist in same group.
- Select the `artist_id` field (not `artist_name`) using `select`.
- Get distinct artist IDs using `distinct()`.
- Partition these artist IDs into training and testing using `sdf_partition()`.
- Join the track metadata + timbre features to the training/testing sets using `inner_join()`.
-->

Before you can run any models, you need to partition your data into
training and testing sets. There’s a complication with this dataset,
which means you can’t just call
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/sdf_partition">`sdf_partition()`</a>.
The complication is that each track by a single artist ought to appear
in the same set; your model will appear more accurate than it really is
if tracks by an artist are used to train the model then appear in the
testing set.

The trick to dealing with this is to partition only the artist IDs, then
inner join those partitioned IDs to the original dataset. Note that
`artist_id` is more reliable than `artist_name` for partitioning, since
some artists use variations on their name between tracks. For example,
Duke Ellington sometimes has an artist name of `"Duke Ellington"`, but
other times has an artist name of
`"Duke Ellington &amp; His Orchestra"`, or one of several spelling
variants.

**Steps**

1.  Partition the artist IDs into training and testing sets, assigning
    the result to `training_testing_artist_ids`.

    -   Select the `artist_id` column of `track_data_tbl`.
    -   Get distinct rows.
    -   Partition this into 70% training and 30% testing.

2.  Inner join the training dataset to `track_data_tbl` by `artist_id`,
    assigning the result to `track_data_to_model_tbl`.

3.  Inner join the testing dataset to `track_data_tbl` by `artist_id`,
    assigning the result to `track_data_to_predict_tbl`.

``` r
# track_data_tbl has been pre-defined
track_data_tbl <- spark_read_parquet(spark_conn, "track_data", "data/track_data_parquet/")

training_testing_artist_ids <- track_data_tbl %>%
  # Select the artist ID
  select(artist_id) %>%
  # Get distinct rows
  distinct() %>%
  # Partition into training/testing sets
  sdf_random_split(training = 0.7, testing = 0.3)
```

    ## Warning: ORDER BY is ignored in subqueries without LIMIT
    ## ℹ Do you need to move arrange() later in the pipeline or use window_order() instead?

``` r
track_data_to_model_tbl <- track_data_tbl %>%
  # Inner join to training partition
  inner_join(training_testing_artist_ids$training, by = "artist_id")

track_data_to_predict_tbl <- track_data_tbl %>%
  # Inner join to testing partition
  inner_join(training_testing_artist_ids$testing, by = "artist_id")
```

Your data has done the splits! Now let’s run some models.

## Gradient boosted trees: modeling

<!--
- Explain the concept behind gradient boosted trees.
- Select the year and timbre fields from the  track data.
- Run a gradient boosted trees model using `ml_gradient_boosted_trees()`.
- Explore the resulting model using `str()`, etc.
- Note that the object is not in the same form as the results of `stats::lm()` models, so the standard tools for working with models won't work.

https://spark.apache.org/docs/latest/mllib-ensembles.html
-->

Gradient boosting is a technique to improve the performance of other
models. The idea is that you run a weak but easy to calculate model.
Then you replace the response values with the residuals from that model,
and fit another model. By “adding” the original response prediction
model and the new residual prediction model, you get a more accurate
model. You can repeat this process over and over, running new models to
predict the residuals of the previous models, and adding the results in.
With each iteration, the model becomes stronger and stronger.

To give a more concrete example, `sparklyr` uses gradient boosted trees,
which means gradient boosting with decision trees as the
weak-but-easy-to-calculate model. These can be used for both
classification problems (where the response variable is categorical) and
regression problems (where the response variable is continuous). In the
regression case, as you’ll be using here, the measure of how badly a
point was fitted is the residual.

Decision trees are covered in more depth in the
<a href="https://www.datacamp.com/courses/supervised-learning-in-r-classification">Supervised
Learning in R: Classification</a>, and
<a href="https://www.datacamp.com/courses/supervised-learning-in-r-regression">Supervised
Learning in R: Regression</a> courses. The latter course also covers
gradient boosting.

To run a gradient boosted trees model in `sparklyr`, call
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ml_gradient_boosted_trees">`ml_gradient_boosted_trees()`</a>.
Usage for this function was discussed in the first exercise of this
chapter.

**Steps**

1.  Get the columns containing the string `"timbre"` to use as features.
    (differently done)

    -   Use `colnames()` to get the column names of
        `track_data_to_model_tbl`. *Note that `names()` won’t give you
        what you want.*
    -   Use `str_subset()` to filter the columns.
    -   The `pattern` argument to that function should be
        `fixed("timbre")`.
    -   Assign the result to `feature_colnames`.

2.  Run the gradient boosting model.

3.  Call `ml_gradient_boosted_trees()`.

4.  The output (response) column is `"year"`.

5.  The input columns are `feature_colnames`.

6.  Assign the result to `gradient_boosted_trees_model`.

``` r
gradient_boosted_trees_model <- track_data_to_model_tbl %>%
  
  # Select repsone and features
  select(year, starts_with("timbre_means")) %>%
  
  # Run the gradient boosted trees model
  ml_gradient_boosted_trees(year ~ .,  type = "regression")
```

Bombastic boosting! Spark machine learning functions are easy to use!

## Gradient boosted trees: prediction

<!--
- Analyze the performance of the model from the previous exercise.
- Select the `year` column from the data.
- Predict the `year` from the boosted tree model model using `predict()`.
- Combine the actual year and predicted year using `bind_cols()`.
- Draw a scatter plot of predicted year vs. actual year using `ggplot() + geom_point()`.
- Enhance this with a straight line of slope 1 through the origin using `geom_abline()`.
- Enhance this with a smooth curve of the predictions using `geom_smooth()`.
- Note that the model is pretty bad; you need a better model.
-->

Once you’ve run your model, then the next step is to make a prediction
with it. `sparklyr` contains methods for the
<a href="https://www.rdocumentation.org/packages/stats/topics/predict">`predict()`</a>
function from base-R. This means that you can make predictions from
Spark models with the same syntax as you would use for predicting a
linear regression.
<a href="https://www.rdocumentation.org/packages/stats/topics/predict">`predict()`</a>
takes two arguments: a model, and some testing data.

``` r
predict(a_model, testing_data)
```

A common use case is to compare the predicted responses with the actual
responses, which you can draw plots of in R. The code pattern for
preparing this data is as follows. Note that currently adding a
prediction column has to be done locally, so you must collect the
results first.

``` r
predicted_vs_actual <- testing_data %>%
  select(response) %>%
  collect() %>%
  mutate(predicted_response = predict(a_model, testing_data))
```

**Steps**

1.  Select the `year` column.

2.  Collect the results.

3.  Add a column containing the predictions.

    -   Use `mutate()` to add a field named `predicted_year`.
    -   This field should be created by calling `predict()`.
    -   Pass the model and the testing data to `predict()`.

``` r
responses <- track_data_to_predict_tbl %>%
  # Select the response column
  select(year) %>%
  # Collect the results
  collect() %>%
  # Add in the predictions
  mutate(
    predicted_year = predict(
      gradient_boosted_trees_model,
      track_data_to_predict_tbl
    )
  )
```

I predict you are going to be a `sparklyr` star! `predict()` has the
same syntax for R models and Spark models.

## Gradient boosted trees: visualization

<!--
- Explore the residuals from the boosted tree model.
- Note that `residuals()` doesn't work: use predicted - actual values.
- Draw a density plot of the residuals using `gggplot() + geom_density()`.
- Enhance the plot with a vertical line through zero using `geom_vline()`.
-->

Now you have your model predictions, you might wonder “are they any
good?”. There are many plots that you can draw to diagnose the accuracy
of your predictions; here you’ll take a look at two common plots.
Firstly, it’s nice to draw a scatterplot of the predicted response
versus the actual response, to see how they compare. Secondly, the
residuals ought to be somewhere close to a normal distribution, so it’s
useful to draw a density plot of the residuals. The plots will look
something like these.

\<\<\< insert two images here \>\>\>

One slightly tricky thing here is that `sparklyr` doesn’t yet support
the
<a href="https://www.rdocumentation.org/packages/stats/topics/residuals">`residuals()`</a>
function in all its machine learning models. Consequently, you have to
calculate the residuals yourself (predicted responses minus actual
responses).

**Steps**

1.  Draw a scatterplot of predicted vs. actual responses.

    -   Call `ggplot()`.
    -   The first argument is the dataset, `responses`.
    -   The second argument should contain the unquoted column names for
        the x and y axes (`actual` and `predicted` respectively),
        wrapped in `aes()`.
    -   Add points by adding a call to `geom_point()`.
    -   Make the points partially transparent by setting `alpha = 0.1`.
    -   Add a reference line by adding a call to `geom_abline()` with
        `intercept = 0` and `slope = 1`.

``` r
responses <- responses |> rename(actual    = "year",
                                 predicted = "predicted_year")

# Draw a scatterplot of predicted vs. actual
ggplot(responses, aes(actual, predicted)) +
  # Add the points
  geom_point(alpha = 0.1) +
  # Add a line at actual = predicted
  geom_abline(intercept = 0, slope = 1)
```

![](readme_files/figure-gfm/unnamed-chunk-95-1.png)<!-- -->

2.  Create a tibble of residuals, named `residuals`.

    -   Call `transmute()` on the `responses`.
    -   The new column should be called `residual`.
    -   `residual` should be equal to the predicted response minus the
        actual response.

3.  Draw a density plot of residuals.

    -   Pipe the transmuted tibble to `ggplot()`.
    -   `ggplot()` needs a single aesthetic, `residual` wrapped in
        `aes()`.
    -   Add a probability density curve by calling `geom_density()`.
    -   Add a vertical reference line through zero by calling
        `geom_vline()` with `xintercept = 0`.

``` r
residuals <- responses %>%
  # Transmute response data to residuals
  transmute(residual = predicted - actual)

# Draw a density plot of residuals
ggplot(residuals, aes(residual)) +
    # Add a density curve
    geom_density() +
    # Add a vertical line through zero
    geom_vline(xintercept = 0)
```

![](readme_files/figure-gfm/unnamed-chunk-96-1.png)<!-- -->

Peerless plotting! You can use response scatter plots and residual
density plots with any type of model.

## Random Forest: modeling

<!--
- Explain the concept behind random forests.
- Select the year and timbre fields from the  track data.
- Run a random forest model using `ml_random_forest()`.
- Explore the resulting model using `str()`, etc.
-->

Like gradient boosted trees, random forests are another form of
*ensemble model*. That is, they use lots of simpler models (decision
trees, again) and combine them to make a single better model. Rather
than running the same model iteratively, random forests run lots of
separate models in parallel, each on a randomly chosen subset of the
data, with a randomly chosen subset of features. Then the final decision
tree makes predictions by aggregating the results from the individual
models.

`sparklyr`’s random forest function is called
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ml_random_forest">`ml_random_forest()`</a>.
Its usage is exactly the same as
<a href="https://www.rdocumentation.org/packages/sparklyr/topics/ml_gradient_boosted_trees">`ml_gradient_boosted_trees()`</a>
(see the first exercise of this chapter for a reminder on syntax).

**Steps**

1.  Repeat your year prediction analysis, using a random forest model
    this time.

    -   Get the `timbre` columns from `track_data_to_model_tbl` and
        assign the result to `feature_colnames`.
    -   Run the random forest model and assign the result to
        `random_forest_model`.

``` r
random_forest_model <- track_data_to_model_tbl %>%
  
  # Select features
  select(year, starts_with("timbre_mean")) %>%
  
  # Run the gradient boosted trees model
  ml_random_forest(year ~ ., type = "regression")
```

You’re certainly not lost in a forest of code! Will the random forest
have better year predictions than the gradient boosted trees? Let’s take
a look!

## Random Forest: prediction

<!--
- Recreate the prediction from gradient boosting part 2, using the random forest predictions. (This time, with less help.)
-->

Now you need to make some predictions with your random forest model. The
syntax is the same as with the gradient boosted trees model.

**Steps**

1.  Select the `year` column of `track_data_to_predict_tbl`.

2.  Collect the results.

3.  Add a column containing the predictions.

    -   Use `mutate()` to add a field named `predicted_year`.
    -   This field should be created by calling `predict()`.
    -   Pass the model and the testing data to `predict()`.

``` r
# Create a response vs. actual dataset
responses <- track_data_to_predict_tbl %>%
  # Select the response column
  select(year) %>%
  # Collect the results
  collect() %>%
  # Add in the predictions
  mutate(
    predicted_year = predict(
      random_forest_model,
      track_data_to_predict_tbl
    )
  )
```

Phenomenal predicting! Let’s visualize the results.

## Random Forest: visualization

<!--
- Combine the predictions from the gradient boosting and random forest models.
- Recreate the plot from gradient boosting part 3, using the random forest predictions.
- Note that in some areas the gradient boosting model appears better, but in some models the random forest model appears better.
-->

Now you need to plot the predictions. With the gradient boosted trees
model, you drew a scatter plot of predicted responses vs. actual
responses, and a density plot of the residuals. You are now going to
adapt those plots to display the results from both models at once.

**Steps**

A local tibble `both_responses`, containing predicted and actual years
for both models, has been pre-defined.

1.  Update the predicted vs. actual response scatter plot.

    -   Use the `both_responses` dataset.
    -   Add a color aesthetic to draw each model in a different color.
        Use `color = model`.
    -   Rather than drawing the points, use [`geom_smooth()`]() to draw
        a smooth curve for each model.

``` r
# both_responses has been pre-defined
both_responses <- readRDS("data/both-model-responses.rds")

# Draw a scatterplot of predicted vs. actual
ggplot(both_responses, aes(actual, predicted, color = model)) +
  # Add a smoothed line
  geom_smooth() +
  # Add a line at actual = predicted
  geom_abline(intercept = 0, slope = 1)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](readme_files/figure-gfm/unnamed-chunk-99-1.png)<!-- -->

2.  Create a tibble of residuals, named `residuals`.

    -   Call `mutate()` on `both_responses`.
    -   The new column should be called `residual`.
    -   `residual` should be equal to the predicted response minus the
        actual response.

3.  Update the residual density plot.

    -   Add a color aesthetic to draw each model in a different color.

``` r
# Create a tibble of residuals
residuals <- both_responses %>%
  mutate(residual = predicted - actual)

# Draw a density plot of residuals
ggplot(residuals, aes(residual, color = model)) +
    # Add a density curve
    geom_density() +
    # Add a vertical line through zero
    geom_vline(xintercept = 0)
```

![](readme_files/figure-gfm/unnamed-chunk-100-1.png)<!-- -->

Paramount plotting! It looks the like random forest model is a little
better, though both models struggle with old songs.

## Comparing model performance

<!--
- Introduce metrics for evaluating model accuracy.
- Calculate residual absolute sum for each model.
- Calculate residual sum of squares for each model.
- Also compare to dumbest model of "compare to mean".
- Show that random forest performs best in this case.
-->

Plotting gives you a nice feel for where the model performs well, and
where it doesn’t. Sometimes it is nice to have a statistic that gives
you a score for the model. This way you can quantify how good a model
is, and make comparisons across lots of models. A common statistic is
the root mean square error (sometimes abbreviated to “RMSE”), which
simply squares the residuals, then takes the mean, then the square root.
A small RMSE score for a given dataset implies a better prediction. (By
default, you can’t compare between different datasets, only different
models on the same dataset. Sometimes it is possible to normalize the
datasets to provide a comparison between them.)

Here you’ll compare the gradient boosted trees and random forest models.

**Steps**

1.  Create a sum of squares of residuals dataset.

    -   Add a `residual` column, equal to the predicted response minus
        the actual response.
    -   Group the data by `model`.
    -   Calculate a summary statistic, `rmse`, equal to the square root
        of the mean of the `residual`s squared.

``` r
both_responses %>%
  # Add a residual column
  mutate(
    residual = predicted - actual
  ) %>%
  # Group by model
  group_by(model) %>%
  # Calculate the root mean square error
  summarize(
    rmse = sqrt(mean(residual ^ 2))
  )
```

    ## # A tibble: 2 × 2
    ##   model  rmse
    ##   <chr> <dbl>
    ## 1 gbt    17.7
    ## 2 rf     16.4

High five! That’s all the exercises complete. Now to relax with an
interview of Javier Luraschi and Kevin Ushey, the creators of
`sparklyr`.
