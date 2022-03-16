Working with Web Data in R
================
Joschka Schwarz

-   [1. Downloading Files and Using API
    Clients](#1-downloading-files-and-using-api-clients)
    -   [Introduction: Working With Web Data in
        R](#introduction-working-with-web-data-in-r)
    -   [Downloading files and reading them into
        R](#downloading-files-and-reading-them-into-r)
    -   [Saving raw files to disk](#saving-raw-files-to-disk)
    -   [Saving formatted files to
        disk](#saving-formatted-files-to-disk)
    -   [Understanding Application Programming
        Interfaces](#understanding-application-programming-interfaces)
    -   [API test](#api-test)
    -   [Using API clients](#using-api-clients)
    -   [Access tokens and APIs](#access-tokens-and-apis)
    -   [Using access tokens](#using-access-tokens)
-   [2. Using httr to interact with APIs
    directly](#2-using-httr-to-interact-with-apis-directly)
    -   [GET and POST requests in
        theory](#get-and-post-requests-in-theory)
    -   [GET requests in practice](#get-requests-in-practice)
    -   [POST requests in practice](#post-requests-in-practice)
    -   [Extracting the response](#extracting-the-response)
    -   [Multiple Choice: GET and POST
        requests](#multiple-choice-get-and-post-requests)
    -   [Graceful httr](#graceful-httr)
    -   [Handling http failures](#handling-http-failures)
    -   [Constructing queries (Part I)](#constructing-queries-part-i)
    -   [Constructing queries (Part II)](#constructing-queries-part-ii)
    -   [Respectful API usage](#respectful-api-usage)
    -   [Using user agents](#using-user-agents)
    -   [Rate-limiting](#rate-limiting)
    -   [Tying it all together](#tying-it-all-together)
-   [3. Handling JSON and XML](#3-handling-json-and-xml)
    -   [JSON](#json)
    -   [Can you spot JSON?](#can-you-spot-json)
    -   [Parsing JSON](#parsing-json)
    -   [Manipulating JSON](#manipulating-json)
    -   [Manipulating parsed JSON](#manipulating-parsed-json)
    -   [Reformatting JSON](#reformatting-json)
    -   [XML structure](#xml-structure)
    -   [Do you understand XML
        structure?](#do-you-understand-xml-structure)
    -   [Examining XML documents](#examining-xml-documents)
    -   [XPATHs](#xpaths)
    -   [Extracting XML data](#extracting-xml-data)
    -   [Extracting XML attributes](#extracting-xml-attributes)
    -   [Wrapup: returning nice API
        output](#wrapup-returning-nice-api-output)
-   [4. Web scraping with XPATHs](#4-web-scraping-with-xpaths)
    -   [Web scraping 101](#web-scraping-101)
    -   [Reading HTML](#reading-html)
    -   [Extracting nodes by XPATH](#extracting-nodes-by-xpath)
    -   [HTML structure](#html-structure)
    -   [Extracting names](#extracting-names)
    -   [Extracting values](#extracting-values)
    -   [Test: HTML reading and
        extraction](#test-html-reading-and-extraction)
    -   [Reformatting Data](#reformatting-data)
    -   [Extracting tables](#extracting-tables)
    -   [Cleaning a data frame](#cleaning-a-data-frame)
-   [5. CSS Web Scraping and Final Case
    Study](#5-css-web-scraping-and-final-case-study)
    -   [CSS web scraping in theory](#css-web-scraping-in-theory)
    -   [Using CSS to scrape nodes](#using-css-to-scrape-nodes)
    -   [Scraping names](#scraping-names)
    -   [Scraping text](#scraping-text)
    -   [Test: CSS web scraping](#test-css-web-scraping)
    -   [Final case study: Introduction](#final-case-study-introduction)
    -   [API calls](#api-calls)
    -   [Extracting information](#extracting-information)
    -   [Normalising information](#normalising-information)
    -   [Reproducibility](#reproducibility)
    -   [Wrap Up](#wrap-up)

**Short Description**

Learn how to efficiently import data from the web into R. Discover how
to work with APIs, build your own API client, and access data from
Wikipedia and other sources by using R to scrape information from web
pages.

**Long Description**

Most of the useful data in the world, from economic data to news content
to geographic information, lives somewhere on the internet - and this
course will teach you how to access it.’ll explore how to work with APIs
(computer-readable interfaces to websites), access data from Wikipedia
and other sources, and build your own simple API client. For those
occasions where APIs are not available, you’ll find out how to use R to
scrape information out of web pages. In the process you’ll learn how to
get data out of even the most stubborn website, and how to turn it into
a format ready for further analysis. The packages you’ll use and learn
your way around are rvest, httr, xml2 and jsonlite, along with
particular API client packages like WikipediR and pageviews.

# 1. Downloading Files and Using API Clients

Sometimes getting data off the internet is very, very simple - it’s
stored in a format that R can handle and just lives on a server
somewhere, or it’s in a more complex format and perhaps part of an API
but there’s an R package designed to make using it a piece of cake. This
chapter will explore how to download and read in static files, and how
to use APIs when pre-existing clients are available.

## Introduction: Working With Web Data in R

Theory. Coming soon …

**1. Introduction: Working With Web Data in R**

Hi, I’m Oliver Keyes, and I’m Charlotte Wickham. Welcome to Working with
Web Data in R.

**2. Working with Web Data in R**

It turns out that the Internet is a great place to find datasets, and
this course teaches you how to get those datasets into R in order to
analyze them.You’ll start with the simplest cases: simply downloading
files to your machine, and using existing packages specifically designed
for pulling in web data.Next you’ll use the tidyverse package httr to
query web application programming interfaces using the GET() and POST()
commands.After that, you’ll learn how to work with JSON and XML, the two
most common data formats used by websites. Typically, datasets in R are
rectangular, so they can be stored in a data frame or matrix. JSON and
XML are both nested data structures, so you’ll learn new techniques to
explore them, including XPath, the XML query language.Finally, you’ll
learn to use Cascading Style Sheets, or CSS, to navigate HTML pages and
extract their data.

**3. Importing data from a URL**

First, let’s begin with the easy case. Many functions in base R that are
used for importing data accept a URL, so you can directly import the
data from its location on the Internet. For example, to retrieve a CSV
file that you found on the Internet, you can still call read dot
csv().The only change to your code is that rather than passing a path to
a local file is that you pass a URL.

**4. Downloading data from a URL**

Since downloading data from the Internet every time that you want to use
it can be very slow and tedious, especially for large datasets, R
provides the function download dot file() to copy Internet-based files
to your machine. This takes two arguments: the URL where the file lives,
and a path to somewhere on your local file system that you want to
download the data to.

**5. Let’s practice!**

Now let’s try some examples.

## Downloading files and reading them into R

In this first exercise we’re going to look at reading already-formatted
datasets - CSV or TSV files, with which you’ll no doubt be familiar! -
into R from the internet. This is a lot easier than it might sound
because R’s file-reading functions accept not just file paths, but also
URLs.

**Steps**

The URLs to those files are in your R session as `csv_url` and
`tsv_url`.

1.  Read the CSV file stored at `csv_url` into R using `read.csv()`.
    Assign the result to `csv_data`.
2.  Do the same for the TSV file stored at `tsv_url` using
    `read.delim()`. Assign the result to `tsv_data`.
3.  Examine each object using `head()`.

``` r
# Here are the URLs! As you can see they're just normal strings
csv_url <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1561/datasets/chickwts.csv"
tsv_url <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_3026/datasets/tsv_data.tsv"

# Read a file in from the CSV URL and assign it to csv_data
csv_data <- read.csv(file = csv_url)

# Read a file in from the TSV URL and assign it to tsv_data
tsv_data <- read.delim(file = tsv_url)

# Examine the objects with head()
head(csv_data)
```

    ##   weight      feed
    ## 1    179 horsebean
    ## 2    160 horsebean
    ## 3    136 horsebean
    ## 4    227 horsebean
    ## 5    217 horsebean
    ## 6    168 horsebean

``` r
head(tsv_data)
```

    ##   weight      feed
    ## 1    179 horsebean
    ## 2    160 horsebean
    ## 3    136 horsebean
    ## 4    227 horsebean
    ## 5    217 horsebean
    ## 6    168 horsebean

Excellent work! As you can see, `read.csv()` and `read.delim()` work
nicely with URLs, reading the contentsjust as they would if the URLs
were instead paths to files on your computer.

## Saving raw files to disk

Sometimes just reading the file in from the web is enough, but often
you’ll want to store it locally so that you can refer back to it. This
also lets you avoid having to spend the start of every analysis session
twiddling your thumbs while particularly large files download.

Helpfully, R has
<a href="https://www.rdocumentation.org/packages/utils/topics/download.file">`download.file()`</a>,
a function that lets you do just that: download a file to a location of
your choice on your computer. It takes two arguments; `url`, indicating
the URL to read from, and `destfile`, the destination to write the
downloaded file to. In this case, we’ve pre-defined the URL - once
again, it’s `csv_url`.

**Steps**

1.  Download the file at `csv_url` with `download.file()`, naming the
    destination file `"feed_data.csv"`.
2.  Read `"feed_data.csv"` into R with `read.csv()`.

``` r
# Download the file with download.file()
download.file(url = csv_url, destfile = "data/feed_data.csv")

# Read it in with read.csv()
csv_data <- read.csv(file = "data/feed_data.csv")
```

Good job. Now the file has been downloaded, you can refer back to it
however many times you like without having to grab it from the internet
anew each time.

## Saving formatted files to disk

Whether you’re downloading the raw files with `download.file()` or using
`read.csv()` and its sibling functions, at some point you’re probably
going to find the need to modify your input data, and then save the
modified data to disk so you don’t lose the changes.

You could use `write.table()`, but then you have to worry about
accidentally writing out data in a format R can’t read back in. An easy
way to avoid this risk is to use
<a href="https://www.rdocumentation.org/packages/base/topics/saveRDS">`saveRDS()`</a>
and
<a href="https://www.rdocumentation.org/packages/base/topics/readRDS">`readRDS()`</a>,
which save R objects in an R-specific file format, with the data
structure intact. That means you can use it for any type of R object
(even ones that don’t turn into tables easily), and not worry you’ll
lose data reading it back in. `saveRDS()` takes two arguments, `object`,
pointing to the R object to save and `file` pointing to where to save it
to. `readRDS()` expects `file`, referring to the path to the RDS file to
read in.

In this example we’re going to modify the data you already read in,
which is predefined as `csv_data`, and write the modified version out to
a file before reading it in again.

**Steps**

1.  Modify `csv_data` to add the column `square_weight`, containing the
    square of the `weight` column.
2.  Save it to disk as `"modified_feed_data.RDS"` with `saveRDS()`.
3.  Read it back in as `modified_feed_data` with `readRDS()`.
4.  Examine `modified_feed_data`.

``` r
# Add a new column: square_weight
csv_data$square_weight <- (csv_data$weight ^ 2)

# Save it to disk with saveRDS()
saveRDS(object = csv_data, file = "data/modified_feed_data.RDS")

# Read it back in with readRDS()
modified_feed_data <- readRDS(file = "data/modified_feed_data.RDS")

# Examine modified_feed_data
str(modified_feed_data)
```

    ## 'data.frame':    71 obs. of  3 variables:
    ##  $ weight       : int  179 160 136 227 217 168 108 124 143 140 ...
    ##  $ feed         : chr  "horsebean" "horsebean" "horsebean" "horsebean" ...
    ##  $ square_weight: num  32041 25600 18496 51529 47089 ...

Well done. As you can see if you examine `modified_feed_data`, the
changes you made before saving it to disk are reflected in the data.

## Understanding Application Programming Interfaces

Theory. Coming soon …

**1. Understanding Application Programming Interfaces**

So far you’ve used techniques for downloading static files and keeping
them around, but most data on the Internet doesn’t take that form. It’s
simply not practical: if you’ve got complex data, or simply a lot of it,
you’d have to waste time and space constantly copying data into CSV
files in the background every time something changes. For websites like
Wikipedia and Facebook, there are hundreds of millions of changes every
day, so it doesn’t really make sense as an approach.

**2. Application Programming Interfaces**

Instead, people often make data available behind Application Programming
Interfaces, or APIs. These are programs designed to let code interact
with a website, in the same way you interact with a web page, and
they’re used pretty much everywhere. One of the places they’re used is
in making data available. Instead of a website having to constantly
write data to CSVs, it can just hook an API up to its database. Instead
of the user having to type in a new URL each time, they can make small,
consistent modifications that change the instructions the API is given
for what to send back.

**3. API Clients**

What those URLs and instructions look like is something we’ll discuss
later in the course, because one of the great things about APIs on the
web is they make it trivial to write API clients: software libraries in
various languages that make it possible for programmers or data
scientists to interact with the API without ever having to care about
how it’s structured, or do the heavy lifting of cleaning up the data.

**4. Using API Clients**

Nine times out of ten, if you’re looking to get data out of an API, R
probably has a client for it, that is, an R package that contains
functions to retrieve that data.One simple, useful trick is to Google
“CRAN” and then the name of the website to see if one exists. And if
there is a client, you should rely on it as much as possible, because
much of the time it’s a lot easier than writing your own.

**5. pageviews**

Now you’re going see an example of this using the pageviews package,
which lets you see the number of views of Wikipedia pages. All you have
to do is to call the function article_pageviews(), passing the name of a
Wikipedia article.You’re calling an R function, just like any other, and
do not need to worry about the details of the API.

**6. Let’s practice!**

Now it’s your turn to try an example.

## API test

In the last video you were introduced to Application Programming
Interfaces, or APIs, along with their intended purpose (as the computer
equivalent of the visible web page that you and I might interact with)
and their utility for data retrieval.

> ## *Question*
>
> What are APIs for?<br> <br> ⬜ Making parts of a website available to
> people.<br> ⬜ Making parts of a website available to puppies.<br> ✅
> Making parts of a website available to computers.<br>

Correct! Websites let you and I interpret and interface with a server,
APIs allow computers to do the same.

## Using API clients

So we know that APIs are server components to make it easy for your code
to interact with a service and get data from it. We also know that R
features many “clients” - packages that wrap around connections to APIs
so you don’t have to worry about the details.

Let’s look at a really simple API client - the `pageviews` package,
which acts as a client to Wikipedia’s API of pageview data. As with
other R API clients, it’s formatted as a package, and lives on CRAN -
the central repository of R packages. The goal here is just to show how
simple clients are to use: they look just like other R code, because
they *are* just like other R code.

**Steps**

1.  Load the package `pageviews`.
2.  Use the `article_pageviews()` function to get the pageviews for the
    article “Hadley Wickham”.
3.  Examine the resulting object.

``` r
# Load pageviews
library(pageviews)

# Get the pageviews for "Hadley Wickham"
hadley_pageviews <- article_pageviews(project = "en.wikipedia", article = "Hadley Wickham")

# Examine the resulting object
str(hadley_pageviews)
```

    ## 'data.frame':    1 obs. of  8 variables:
    ##  $ project    : chr "wikipedia"
    ##  $ language   : chr "en"
    ##  $ article    : chr "Hadley_Wickham"
    ##  $ access     : chr "all-access"
    ##  $ agent      : chr "all-agents"
    ##  $ granularity: chr "daily"
    ##  $ date       : POSIXct, format: "2015-10-01"
    ##  $ views      : num 53

Nicely done. Hopefully this has demonstrated the crucial (and rather
lovely) thing about API clients; they behave just like any other R
package.

## Access tokens and APIs

Theory. Coming soon …

**1. Access Tokens and APIs**

As you can see from the previous exercise, API clients are super easy to
use: they’re just R packages. In the background, they’re communicating
over the Internet with the API, but that’s nicely abstracted away:
clients mean you don’t have to care what the API is doing, or how it’s
structured. You can just write R code.

**2. API etiquette**

The people who maintain the API, however, absolutely care what your
client is doing. If many people are simultaneously trying to get a
massive amount of data out of it, that can risk overwhelming the system.
As a result, some APIs have access tokens: little per-user or
per-session keys that identify the person making the API requests,
making it easy for the operators to limit you or shut you down if you’re
causing problems with their service.

**3. Getting access tokens**

Getting an access token is normally pretty simple, and tends to require
registration with the API you’re trying to use. An example, and one
we’re going to play around with, is Wordnik, an online dictionary
service that contains a ton of interesting metadata about
English-language words. Their service requires an access token to use,
which you gain by filling out a form that explains what you’re trying to
do and giving them your email address so they know who to yell at if you
break their service.

**4. birdnik**

Now you’ll try an example using the birdnik package, which wraps the
Wordnik API. This gives you information about English words, such as the
frequency that it is used.The API key is just a random string of letters
and numbers that is unique to you. To use it, you just pass it as an
argument to the birdnik functions.

**5. Let’s practice!**

Let’s try an example.

## Using access tokens

As we discussed in the last video, it’s common for APIs to require
*access tokens* - unique keys that verify you’re authorised to use a
service. They’re usually pretty easy to use with an API client.

To show how they work, and how easy it can be, we’re going to use the R
client for the Wordnik dictionary and word use service - ‘birdnik’ - and
an API token we prepared earlier. Birdnik is fairly simple (I wrote it!)
and lets you get all sorts of interesting information about word usage
in published works. For example, to get the frequency of the use of the
word “chocolate”, you would write:

``` r
word_frequency(api_key, "chocolate")
```

In this exercise we’re going to look at the word “vector” (since it’s a
common word in R!) using a pre-existing API key (stored as `api_key`)

**Steps**

1.  Load the package `birdnik`.
2.  Using the pre-existing API key and `word_frequency()`, get the
    frequency of the word `"vector"` in Wordnik’s database. Assign the
    results to `vector_frequency`.

``` r
# Api key is stored loacally
api_key <- Sys.getenv("API_KEY")

# Load birdnik
library(birdnik)
```

    ## Loading required package: httr

``` r
# Get the word frequency for "vector", using api_key to access it
vector_frequency <- word_frequency(key = api_key, words = "vector")
```

Well done. Even with API keys, using API clients is pretty convenient!

# 2. Using httr to interact with APIs directly

If an API client doesn’t exist, it’s up to you to communicate directly
with the API. But don’t worry, the package `httr` makes this really
straightforward. In this chapter you’ll learn how to make web requests
from R, how to examine the responses you get back and some best
practices for doing this in a responsible way.

## GET and POST requests in theory

Theory. Coming soon …

**1. GET and POST requests in theory**

Sometimes you’ll run into situations where you don’t have an API client
available, and at that point you need to be thinking about how to handle
API interactions yourself. The first part of that is understanding HTTP
and HTTPS - the basics, at least - and how communication with web APIs
works. With that in mind, we’ll be discussing web requests as a concept,
and how R implements them.

**2. HTTP requests**

Interactions with an API on the Internet are best understood as a
conversation between two parties; the client - that’s you - and the
server. The first part of that conversation is the client explaining
what it wants to happen, and in HTTP that’s divided up into what are
known as “request methods”: different classes of requests, each meaning
a different thing.

**3. GET and POST**

The most common is GET requests, and they’re exactly what they sound
like: the client saying “hey, get me this thing.” If you’re asking for
data, you’re most likely looking to make GET requests. The other common
method is POST requests, which are, instead of “get me this thing,”
“here is this thing” - they’re you giving something to the server.
That’s how file uploading works, and is sometimes part of an
authentication process to a server.So to use a made-up example; suppose
you want to ask for a dataset, modify it locally, and then send it back
to the server. You’d ask for the dataset with a GET request, tweak it,
and then send it back with a POST request.

**4. Other types**

There are other types of request too - for example, HEAD requests, which
don’t return content but do give you metadata about the content, and
DELETE requests which (just as the name suggests) asks the server to
remove a particular thing - but you probably won’t have to work with
those.Instead, let’s focus on GET and POST requests in R, using the
wonderful httr package, which makes interacting with servers and their
APIs pretty easy.

**5. Making GET requests with httr**

To make a GET request, you call the GET() function, passing the URL to
get things from. This returns a response object. To get the data
contents from this, there is one more step, namely to call the function
content().

**6. Making POST requests with httr**

Similarly, to make a POST request, you call the POST() function. In this
case, you don’t need to extract contents because you are sending things
to somewhere else, and that’s something that the recipient needs to
worry about.

**7. Let’s practice!**

Now you’re going to try some examples using httpbin, which is a service
for testing HTTP requests.

## GET requests in practice

To start with you’re going to make a GET request. As discussed in the
video, this is a request that asks the server to give you a particular
piece of data or content (usually specified in the URL). These make up
the majority of the requests you’ll make in a data science context,
since most of the time you’ll be getting data from servers, not giving
it to them.

To do this you’ll use the `httr` package, written by Hadley Wickham (of
course), which makes HTTP requests extremely easy. You’re going to make
a very simple GET request, and then inspect the output to see what it
looks like.

**Steps**

1.  Load the `httr` package.
2.  Use the `GET()` function to make a request to
    `http://httpbin.org/get`, saving the result to `get_result`.
3.  Print `get_result` to inspect it.

``` r
# Load the httr package
library(httr)

# Make a GET request to http://httpbin.org/get
get_result <- GET(url = "http://httpbin.org/get")

# Print it to inspect it
get_result
```

    ## Response [http://httpbin.org/get]
    ##   Date: 2022-03-16 13:26
    ##   Status: 200
    ##   Content-Type: application/json
    ##   Size: 366 B
    ## {
    ##   "args": {}, 
    ##   "headers": {
    ##     "Accept": "application/json, text/xml, application/xml, */*", 
    ##     "Accept-Encoding": "deflate, gzip", 
    ##     "Host": "httpbin.org", 
    ##     "User-Agent": "libcurl/7.77.0 r-curl/4.3.2 httr/1.4.2", 
    ##     "X-Amzn-Trace-Id": "Root=1-6231e57b-1ce7928f1ada401517e8f759"
    ##   }, 
    ##   "origin": "134.28.58.53", 
    ## ...

Nicely done. As you can see from inspecting the output, there are a lot
of parts of a HTTP response. Most of them you don’t have to worry about
right now; some, like the status code and the content, we’ll cover
later.

## POST requests in practice

Next we’ll look at POST requests, also made through httr, with the
function (you’ve guessed it)
<a href="https://www.rdocumentation.org/packages/httr/topics/POST">`POST()`</a>.
Rather than asking the server to give you something, as in GET requests,
a POST request asks the server to accept something *from* you. They’re
commonly used for things like file upload, or authentication. As a
result of their use for uploading things, `POST()` accepts not just a
`url` but also a `body` argument containing whatever you want to give to
the server.

You’ll make a very simple POST request, just uploading a piece of text,
and then inspect the output to see what it looks like.

**Steps**

1.  Load the `httr` package.
2.  Make a POST request with the URL `http://httpbin.org/post` and the
    body `"this is a test"`, saving the result to `post_result`.
3.  Print `post_result` to inspect it.

``` r
# Load the httr package
library(httr)

# Make a POST request to http://httpbin.org/post with the body "this is a test"
post_result <- POST(url = "http://httpbin.org/post", body = "this is a test")

# Print it to inspect it
post_result
```

    ## Response [http://httpbin.org/post]
    ##   Date: 2022-03-16 13:26
    ##   Status: 200
    ##   Content-Type: application/json
    ##   Size: 473 B
    ## {
    ##   "args": {}, 
    ##   "data": "this is a test", 
    ##   "files": {}, 
    ##   "form": {}, 
    ##   "headers": {
    ##     "Accept": "application/json, text/xml, application/xml, */*", 
    ##     "Accept-Encoding": "deflate, gzip", 
    ##     "Content-Length": "14", 
    ##     "Host": "httpbin.org", 
    ## ...

Nicely done. The output for POST requests looks pretty similar to that
for GET requests, although (in this case) the body of your message is
included - `this is a test`. Again, we’ll dig into certain elements of
the output in just a bit.

## Extracting the response

Making requests is all well and good, but it’s also not why you’re here.
What we really want to do is get the data the server sent back, which
can be done with httr’s `content()` function. You pass it an object
returned from a `GET` (or `POST`, or `DELETE`, or…) call, and it spits
out whatever the server actually sent in an R-compatible structure.

We’re going to demonstrate that now, using a slightly more complicated
URL than before - in fact, using a URL from the Wikimedia pageviews
system you dealt with through the `pageviews` package, which is stored
as `url`. Without looking *too* much at the structure for the time being
(we’ll get to that later) this request asks for the number of pageviews
to the English-language Wikipedia’s “Hadley Wickham” article on 1 and 2
January 2017.

**Steps**

1.  Make a GET request using the `url` object as the URL. Save the
    results as `pageview_response`.
2.  Call `content()` on `pageview_response` to retrieve the data the
    server has sent back. Save the data as `pageview_data`.
3.  Examine `pageview_data` with `str()`.

``` r
url <- "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia.org/all-access/all-agents/Hadley_Wickham/daily/20170101/20170102"

# Make a GET request to url and save the results
pageview_response <- GET(url)

# Call content() to retrieve the data the server sent back
pageview_data <- content(pageview_response)

# Examine the results with str()
str(pageview_data)
```

    ## List of 1
    ##  $ items:List of 2
    ##   ..$ :List of 7
    ##   .. ..$ project    : chr "en.wikipedia"
    ##   .. ..$ article    : chr "Hadley_Wickham"
    ##   .. ..$ granularity: chr "daily"
    ##   .. ..$ timestamp  : chr "2017010100"
    ##   .. ..$ access     : chr "all-access"
    ##   .. ..$ agent      : chr "all-agents"
    ##   .. ..$ views      : int 45
    ##   ..$ :List of 7
    ##   .. ..$ project    : chr "en.wikipedia"
    ##   .. ..$ article    : chr "Hadley_Wickham"
    ##   .. ..$ granularity: chr "daily"
    ##   .. ..$ timestamp  : chr "2017010200"
    ##   .. ..$ access     : chr "all-access"
    ##   .. ..$ agent      : chr "all-agents"
    ##   .. ..$ views      : int 86

Great! As you can see, the result of extracting the content is a list,
which is pretty common (but not uniform) to API responses. We’ll talk
through how to manipulate returned data later on.

## Multiple Choice: GET and POST requests

We’ve now discussed multiple types of HTTP request - including GET
requests, for retrieving data, and POST requests, for transmitting it -
as well as how to extract the server response once a request is
complete.

> ## *Question*
>
> What sort of request would you use to send a server data?<br> <br> ⬜
> GET request<br> ✅ POST request<br>

“Correct! POST requests send data - GET requests retrieve it.”

## Graceful httr

Theory. Coming soon …

**1. Graceful httr**

You’ve played around with basic httr usage: great. The next step is
writing code that is “graceful,” by which I mean: code that can respond
appropriately to errors, and code which can construct its own URLs in
response to user input (and so be applied to lots of different
situations).

**2. Error handling**

The results of requests come back with an HTTP status code, which
indicates what happened to the request.

**3. Error handling**

You can see that in the body of a result, if you print it - take a look
at this example.If it’s got a value of 200, the request was completed;
if it was a 404, the server has no idea where the thing you were asking
for lives. There are a whole range of different status codes, most of
which we are not going to dig into because there are a lot of them.

**4. Understanding status codes**

As a general rule: if the code starts with 2 or 3, it’s fine. If it
starts with 4, your code is messing up. If it starts with 5, their code
is messing up. You don’t have to worry about much of the specifics
unless you see such an error code, and in that case, Wikipedia has a
convenient list of codes and their explanation.Still, you’ll want to
check for them, so you know if your request fell over, and httr has a
function for just that, http_error(), which we’ll explore shortly.

**5. URL construction**

The next big thing is URL construction. Writing out the whole URL every
time is all well and good, but what if you want to make different
requests for different assets? What if you don’t want to have to think
about most of the URL, just the bit you’re changing?Automatically
constructing URLs - stitching together standard bits and the bits
specific to your request - solves for this nicely. It means you don’t
have to think about the bits that never change, or type out the whole
thing each time, and neither does anyone else using your code. You just
put in the essential bits and off you go.

**6. Directory-based URLs**

API URLs tend to take one of two forms. The first is directory-based
URLs: they use directories to represent different parameters. So if you
have a URL that goes fakeurl-dot-com/api/peaches/thursday to find out
the price of peaches on Thursday, fakeurl-dot-com/api/apples/tuesday
would tell you (if the API’s author is doing their job right) the price
of apples on Tuesday. We saw an example of this with the pageviews
package.These are really, really common, particularly with more modern
APIs: the good news is they’re also really easy to construct with the
function paste(), which glues strings together.

**7. Parameter-based URLs**

Alternatively, you get parameter-based URLs. These work via key-value
pairs in the URL: the URL would contain a base URL, followed by a
question mark, then parameters written as key equals value, and
separated with ampersands.With the fruit example, the URL would look
contain fruit equals “peaches” and day equals “thursday”.You can also
use paste() to construct parameter-based URLs, but this is rather
fiddly. Fortunately, the GET() function allows you to pass a named list
of parameters to its query argument, and will handle all this
construction for you.

**8. Let’s practice!**

Let’s try some examples.

## Handling http failures

As mentioned, HTTP calls can go wrong. Handling that can be done with
httr’s
<a href="https://www.rdocumentation.org/packages/httr/topics/http_error">`http_error()`</a>
function, which identifies whether a server response contains an error.

If the response does contain an error, calling `http_error()` over the
response will produce `TRUE`; otherwise, `FALSE`. You can use this for
really fine-grained control over results. For example, you could check
whether the request contained an error, and (if so) issue a warning and
re-try the request.

For now we’ll try something a bit simpler - issuing a warning that
something went wrong if `http_error()` returns `TRUE`, and printing the
content if it doesn’t.

**Steps**

1.  Make a httr `GET()` request to the URL stored as `fake_url`, and
    store the result as `request_result`.
2.  If `http_error()` returns `TRUE`, use `warning()` to issue the
    warning “The request failed”.
3.  If not, use `content()` (as demonstrated in previous exercises) to
    print the contents of the result.

``` r
fake_url <- "http://google.com/fakepagethatdoesnotexist"

# Make the GET request
request_result <- GET(fake_url)

# Check request_result
if (http_error(request_result)){
  warning("The request failed")
} else {
  content(request_result)
}
```

    ## Warning: The request failed

Well done! Since the url mentioned in `fake_url` doesn’t exist, the code
threw the warning message you mentioned. Error handling is really
important for writing robust code, and it looks like you’ve got a good
handle on it.

## Constructing queries (Part I)

As briefly discussed in the previous video, the actual API query (which
tells the API what you want to do) tends to be in one of the two forms.
The first is directory-based, where values are separated by `/` marks
within the URL. The second is parameter-based, where all the values
exist at the end of the URL and take the form of `key=value`.

Constructing directory-based URLs can be done via
<a href="https://www.rdocumentation.org/packages/base/topics/paste">`paste()`</a>,
which takes an unlimited number of strings, along with a separator, as
`sep`. So to construct `http://swapi.co/api/vehicles/12` we’d call:

``` r
paste("http://swapi.co", "api", "vehicles", "12", sep = "/")
```

Let’s do that now! We’ll cover parameter-based URLs later. In the mean
time we can play with SWAPI, mentioned above, which is an API chock full
of star wars data. This time, rather than a vehicle, we’ll look for a
person.

**Steps**

1.  `httr` is loaded in your workspace.

    -   Construct a directory-based API URL to `http://swapi.co/api`,
        looking for person `1` in `people`.
    -   Assign the URL to `directory_url`.
    -   Use `GET` to make an API call with `directory_url`.

``` r
# Construct a directory-based API URL to `http://swapi.co/api`,
# looking for person `1` in `people`
directory_url <- paste("http://swapi.co/api", "people", "1", sep = "/")

# Make a GET call with it
result <- GET(directory_url)
```

Good work! Constructing these kinds of queries is very simple, but also
extremely important. Now you know how to write automated or
semi-automated code for more modern APIs.

## Constructing queries (Part II)

As mentioned (albeit briefly) in the last exercise, there are also
*parameter* based URLs, where all the query values exist at the end of
the URL and take the form of `key=value` - they look something like
`http://fakeurl.com/foo.php?country=spain&amp;food=goulash`

Constructing parameter-based URLs can *also* be done with `paste()`, but
the easiest way to do it is with `GET()` and `POST()` themselves, which
accept a `query` argument consisting of a list of keys and values. So,
to continue with the food-based examples, we could construct
`fakeurl.com/api.php?fruit=peaches&amp;day=thursday` with:

``` r
GET("fakeurl.com/api.php", query = list(fruit = "peaches", day = "thursday"))
```

In this exercise you’ll construct a call to
`https://httpbin.org/get?nationality=americans&amp;country=antigua`.

**Steps**

1.  Start by contructing the `query_params` list, with a `nationality`
    parameter of `"americans"` and a `country` parameter of `"antigua"`.
2.  Construct a parameter-based call to `https://httpbin.org/get`, using
    `GET()` passing `query_params` to the `query` arugment.
3.  Print the response `parameter_response`.

``` r
# Create list with nationality and country elements
query_params <- list(nationality = "americans", 
    country = "antigua")
    
# Make parameter-based call to httpbin, with query_params
parameter_response <- GET("https://httpbin.org/get", query = query_params)

# Print parameter_response
parameter_response
```

    ## Response [https://httpbin.org/get?nationality=americans&country=antigua]
    ##   Date: 2022-03-16 13:26
    ##   Status: 200
    ##   Content-Type: application/json
    ##   Size: 466 B
    ## {
    ##   "args": {
    ##     "country": "antigua", 
    ##     "nationality": "americans"
    ##   }, 
    ##   "headers": {
    ##     "Accept": "application/json, text/xml, application/xml, */*", 
    ##     "Accept-Encoding": "deflate, gzip", 
    ##     "Host": "httpbin.org", 
    ##     "User-Agent": "libcurl/7.77.0 r-curl/4.3.2 httr/1.4.2", 
    ## ...

Nice job! Did you notice the parameters you passed in were listed in the
`args` of the response?

## Respectful API usage

Theory. Coming soon …

**1. Respectful API Usage**

Okay, so you know how to make requests to APIs, and you know how to
construct requests to APIs. Now it’s important to discuss how to query
APIs in a way that not only works, but also avoids annoying the people
who run them. A while back you covered access tokens - unique keys you
use to authenticate to an API - and talked about how one use of them was
to allow the API’s developers to cut you off if you misbehave. In this
video we’re going to talk about how to behave so this doesn’t happen.

**2. User agents**

When you make an API query, the person at the other end doesn’t know you
from Adam. You could be anyone! But if something is going wrong they
might need to contact you, or at least know vaguely what software you’re
using. For this reason, it’s possible to send what’s known as a user
agent - a piece of text that identifies the user - as part of any
request. I usually try to make sure that a user agent contains my email
address, if it’s something I’m just running on my own. That way if
there’s a problem with my code, the API developers can contact me and
take issue.Previously, you called GET() and POST() with a single
argument, the URL. To include your personal details, you also need to
specify the config argument. This should be the result of a call to the
function user_agent(), which takes a string containing whatever details
about yourself that you wish to provide.

**3. Rate limiting**

Many APIs have a deliberate limit on how many requests you can send in a
given time period to avoid ever running into service issues. Exceed that
limit, you get blocked; stay under it, you don’t.The way to avoid this
is, well, making sure there’s an interval between your requests, which
is known as rate limiting. If you’re only allowed 60 requests a minute,
for example, you’d intentionally write your code so that it guaranteed
one second would pass between requests - at which point you don’t have
to worry. Doing that in R is pretty simple using the Sys dot sleep()
function. This simply tells R to do nothing for a specified time
period.With all of this, you should be pretty set: you’ll know how to
make requests, how to structure them, and how to automate them in a way
that doesn’t ruin some far-away developer’s day.

**4. Let’s practice!**

Time to try some examples.

## Using user agents

As discussed in the video, informative user-agents are a good way of
being respectful of the developers running the API you’re interacting
with. They make it easy for them to contact you in the event something
goes wrong. I always try to include:

1.  My email address;
2.  A URL for the project the code is a part of, if it’s got a URL.

Building user agents is done by passing a call to `user_agent()` into
the `GET()` or `POST()` request; something like:

``` r
GET("http://url.goes.here/", user_agent("somefakeemail@domain.com http://project.website"))
```

In the event you don’t have a website, a short one-sentence description
of what the project is about serves pretty well.

**Steps**

1.  Make a `GET()` request to `url`.
2.  Include a user agent that has a fake email address
    `"my@email.address"` followed by the sentence `"this is a test"`.
3.  Assign the response to `server_response`.

``` r
# Do not change the url
url <- "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents/Aaron_Halfaker/daily/2015100100/2015103100"

# Add the email address and the test sentence inside user_agent()
server_response <- GET(url, user_agent("my@email.address this is a test"))
```

Good work! From your end, the request looks exactly the same with or
without a user agent, but for the server the difference can be vital.

## Rate-limiting

The next stage of respectful API usage is rate-limiting: making sure you
only make a certain number of requests to the server in a given time
period. Your limit will vary from server to server, but the
implementation is always pretty much the same and involves a call to
<a href="https://www.rdocumentation.org/packages/base/topics/Sys.sleep">`Sys.sleep()`</a>.
This function takes one argument, a number, which represents the number
of seconds to “sleep” (pause) the R session for. So if you call
`Sys.sleep(15)`, it’ll pause for 15 seconds before allowing further code
to run.

As you can imagine, this is really useful for rate-limiting. If you are
only allowed 4 requests a minute? No problem! Just pause for 15 seconds
between each request and you’re guaranteed to never exceed it. Let’s
demonstrate now by putting together a little loop that sends multiple
requests on a 5-second time delay. We’ll use `httpbin.org` ’s APIs,
which allow you to test different HTTP libraries.

**Steps**

1.  Construct a vector of 2 URLs, `http://httpbin.org/status/404` and
    `http://httpbin.org/status/301`.
2.  Write a for-loop that sends a `GET()` request to each one.
3.  Ensure that the for-loop uses `Sys.sleep()` to delay for 5 seconds
    between request.

``` r
# Construct a vector of 2 URLs
urls <- c("http://httpbin.org/status/404",
          "http://httpbin.org/status/301")

for(url in urls){
    # Send a GET request to url
    result <- GET(url)
    # Delay for 5 seconds between requests
    Sys.sleep(5)
}
```

Nice work. With this and the user agents we covered in the last
exercise, you know enough to avoid annoying servers - and thus snarling
up your code

## Tying it all together

Using everything that you learned in the chapter, let’s make a simple
replica of one of the ‘pageviews’ functions - building queries, sending
GET requests (with an appropriate user agent) and handling the output in
a fault-tolerant way. You’ll build this function up piece by piece in
this exercise.

To output an error, you will use the function
<a href="https://www.rdocumentation.org/packages/base/topics/stop">`stop()`</a>,
which takes a string as an argument, *stops* the execution of the
program, and outputs the string as an error. You can try it right now by
running `stop("This is an error")`.

**Steps**

1.  First, get the function to construct the url.

    -   In the call to `paste()`, add `article_title` as the second
        argument to construct `url`.

``` r
get_pageviews <- function(article_title){
  url <- paste(
    "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents", 
    # Include article title
    article_title, 
    "daily/2015100100/2015103100", 
    sep = "/"
  ) 
  url
}
```

2.  Now, make the request.

    -   Use `GET()` to request `url` with a user agent
        `"my@email.com this is a test"`.

``` r
get_pageviews <- function(article_title){
  url <- paste(
    "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents", 
    article_title, 
    "daily/2015100100/2015103100", 
    sep = "/"
  ) 
  # Get the webpage   
  response <- GET(url, config = user_agent("my@email.com this is a test")) 
  response
}
```

3.  Now, add an error check.

    -   Check the response for errors with `http_error()`, throwing an
        error of `"the request failed"` with `stop()` if there was one.

``` r
get_pageviews <- function(article_title){
  url <- paste(
    "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents", 
    article_title, 
    "daily/2015100100/2015103100", 
    sep = "/"
  )   
  response <- GET(url, user_agent("my@email.com this is a test")) 
  # Is there an HTTP error?
  if(http_error(response)){ 
    # Throw an R error
    stop("the request failed") 
  }
  response
}
```

4.  Finally, instead of returning `response`, return the `content()` of
    the response.

``` r
get_pageviews <- function(article_title){
  url <- paste(
    "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents", 
    article_title, 
    "daily/2015100100/2015103100", 
    sep = "/"
  )   
  response <- GET(url, user_agent("my@email.com this is a test")) 
  # Is there an HTTP error?
  if(http_error(response)){ 
    # Throw an R error
    stop("the request failed") 
  }
  # Return the response's content
  content(response)
}
```

Congratulations! You’ve finished the chapter, and should now have a good
handle on how to work with httr. Our next chapter will cover digging
into the results you get back from your requests.

# 3. Handling JSON and XML

Sometimes data is a TSV or nice plaintext output. Sometimes it’s XML
and/or JSON. This chapter walks you through what JSON and XML are, how
to convert them into R-like objects, and how to extract data from them.
You’ll practice by examining the revision history for a Wikipedia
article retrieved from the Wikipedia API using httr, xml2 and jsonlite.

## JSON

Theory. Coming soon …

**1. JSON**

In the previous chapter you learned how to ask for data from an API. In
this chapter you’ll learn about two of the most common data formats that
APIs return.Let’s start with JSON, a particularly common format for
storing and transmitting data on the web. Later in the chapter you’ll
learn about another format: XML.

**2. JSON (JavaScript Object Notation)**

Much like a CSV file, a JSON data file is just a plain text file, but
with special conventions for describing data structures. Unlike a CSV,
JSON can accommodate data that is more complicated than a simple table
and that is what makes it so useful.All JSON files are made up of only
two kinds of structures: objects and arrays. Objects are collections of
named values. In JSON an object starts with a left brace and ends with a
right brace. Then a named value consists of a name in quotes followed by
a colon, then the value. Name value pairs are separated by a
comma.Arrays are an ordered list of values. An array begins with a left
bracket and ends with a right bracket, and values are separated by a
comma.In both objects and arrays a value can be a string in double
quotes, a number, “true”, “false”, “null”, or another object or array.
Because objects and arrays can occur anywhere a value can, complicated
hierarchical structures are easily represented.

**3. An example JSON data set**

Let’s take a look at this JSON example that describes a couple of
movies. It consists of an array with two elements: each an object. Each
object has two named values: title and year.

**4. Identifying a JSON response**

How do you know if an API has given you JSON data as a response? Usually
you’ll already have a pretty good idea based on the API documentation -
it either always returns JSON, or you have specifically requested a JSON
object. However, it’s always worth checking you got what you
expected.First check the type as reported in the header of the response
using the http_type() function. This should take the value
“application/json”.

**5. Identifying a JSON response**

Then you can examine the content of the response as plain text, by using
the content() function. Wrapping this in writeLines() will give you a
printout of the content which you should be able to recognize as JSON.

**6. Let’s practice!**

Time to try some examples.

## Can you spot JSON?

Here is some information on a couple of fictional Jasons stored in
different formats.

A:

``` json
<jason>
  <person>
    <first_name>Jason</first_name>
    <last_name>Bourne</last_name>
    <occupation>Spy</occupation>
  </person>
  <person>
    <first_name>Jason</first_name>
    <last_name>Voorhees</last_name>
    <occupation>Mass murderer</occupation>
  </person>
</jason>
```

B:

``` json
first_name, last_name, occupation
Jason, Bourne, Spy
Jason, Voorhees, Mass murderer
```

C:

``` json
[{ 
   "first_name": "Jason",
   "last_name": "Bourne",
   "occupation": "Spy"
 },
{
  "first_name": "Jason",
  "last_name": "Voorhees",
  "occupation": "Mass murderer"
}]
```

> ## *Question*
>
> Which one is JSON?<br> <br> ⬜ A<br> ⬜ B<br> ✅ C<br>

You got it! This JSON represents an array of two objects, each a
different character called Jason.

## Parsing JSON

While JSON is a useful format for sharing data, your first step will
often be to parse it into an R object, so you can manipulate it with R.

The
<a href="https://www.rdocumentation.org/packages/httr/topics/content">`content()`</a>
function in `httr` retrieves the content from a request. It takes an
`as` argument that specifies the type of output to return. You’ve
already seen that `as = "text"` will return the content as a character
string which is useful for checking the content is as you expect.

If you don’t specify `as`, the default `as = "parsed"` is used. In this
case the type of `content()` will be guessed based on the header and
`content()` will choose an appropriate parsing function. For JSON this
function is
<a href="https://www.rdocumentation.org/packages/jsonlite/topics/fromJSON">`fromJSON()`</a>
from the `jsonlite` package. If you know your response is JSON, you may
want to use `fromJSON()` directly.

To practice, you’ll retrieve some revision history from the Wikipedia
API, check it is JSON, then parse it into a list two ways.

**Steps**

1.  Get the revision history for the Wikipedia article for
    `"Hadley Wickham"`, by calling `rev_history("Hadley Wickham")` (a
    function we have written for you), store it in `resp_json`.
2.  Check the `http_type()` of `resp_json`, to confirm the API returned
    a JSON object.
3.  You can’t always trust a header, so check the content looks like
    JSON by calling `content()` on `resp_json` with an additional
    argument, `as = "text"`.
4.  Parse `resp_json` using `content()` by explicitly setting
    `as = "parsed"`.
5.  Parse the returned text (from step 3) with `fromJSON()` .

``` r
# Get revision history for "Hadley Wickham"
revhist_url <- "https://en.wikipedia.org/w/api.php?action=query&titles=Hadley%20Wickham&prop=revisions&rvprop=timestamp%7Cuser%7Ccomment%7Ccontent&rvlimit=5&format=json&rvdir=newer&rvstart=2015-01-14T17%3A12%3A45Z&rvsection=0"
resp_json <- GET(revhist_url)

# Check http_type() of resp_json
http_type(resp_json)
```

    ## [1] "application/json"

``` r
# Examine returned text with content()
content(resp_json, as = "text")
```

    ## [1] "{\"continue\":{\"rvcontinue\":\"20150528042700|664370232\",\"continue\":\"||\"},\"warnings\":{\"main\":{\"*\":\"Subscribe to the mediawiki-api-announce mailing list at <https://lists.wikimedia.org/postorius/lists/mediawiki-api-announce.lists.wikimedia.org/> for notice of API deprecations and breaking changes. Use [[Special:ApiFeatureUsage]] to see usage of deprecated features by your application.\"},\"revisions\":{\"*\":\"Because \\\"rvslots\\\" was not specified, a legacy format has been used for the output. This format is deprecated, and in the future the new format will always be used.\"}},\"query\":{\"pages\":{\"41916270\":{\"pageid\":41916270,\"ns\":0,\"title\":\"Hadley Wickham\",\"revisions\":[{\"user\":\"214.28.226.251\",\"anon\":\"\",\"timestamp\":\"2015-01-14T17:12:45Z\",\"contentformat\":\"text/x-wiki\",\"contentmodel\":\"wikitext\",\"comment\":\"\",\"*\":\"'''Hadley Mary Helen Wickham III''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\\\"about\\\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\\n\\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\\\"about\\\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>\"},{\"user\":\"73.183.151.193\",\"anon\":\"\",\"timestamp\":\"2015-01-15T15:49:34Z\",\"contentformat\":\"text/x-wiki\",\"contentmodel\":\"wikitext\",\"comment\":\"\",\"*\":\"'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\\\"about\\\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\\n\\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\\\"about\\\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>\"},{\"user\":\"FeanorStar7\",\"timestamp\":\"2015-01-24T16:34:31Z\",\"contentformat\":\"text/x-wiki\",\"contentmodel\":\"wikitext\",\"comment\":\"/* External links */ add LCCN and cats\",\"*\":\"'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\\\"about\\\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\\n\\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\\\"about\\\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>\"},{\"user\":\"KasparBot\",\"timestamp\":\"2015-04-26T19:18:17Z\",\"contentformat\":\"text/x-wiki\",\"contentmodel\":\"wikitext\",\"comment\":\"authority control moved to wikidata\",\"*\":\"'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\\\"about\\\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\\n\\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\\\"about\\\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>\"},{\"user\":\"Spkal\",\"timestamp\":\"2015-05-06T18:24:57Z\",\"contentformat\":\"text/x-wiki\",\"contentmodel\":\"wikitext\",\"comment\":\"/* Bibliography */  Added his new book, R Packages\",\"*\":\"'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\\\"about\\\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\\n\\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\\\"about\\\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>\"}]}}}}"

``` r
# Parse response with content()
content(resp_json, as = "parsed")
```

    ## $continue
    ## $continue$rvcontinue
    ## [1] "20150528042700|664370232"
    ## 
    ## $continue$continue
    ## [1] "||"
    ## 
    ## 
    ## $warnings
    ## $warnings$main
    ## $warnings$main$`*`
    ## [1] "Subscribe to the mediawiki-api-announce mailing list at <https://lists.wikimedia.org/postorius/lists/mediawiki-api-announce.lists.wikimedia.org/> for notice of API deprecations and breaking changes. Use [[Special:ApiFeatureUsage]] to see usage of deprecated features by your application."
    ## 
    ## 
    ## $warnings$revisions
    ## $warnings$revisions$`*`
    ## [1] "Because \"rvslots\" was not specified, a legacy format has been used for the output. This format is deprecated, and in the future the new format will always be used."
    ## 
    ## 
    ## 
    ## $query
    ## $query$pages
    ## $query$pages$`41916270`
    ## $query$pages$`41916270`$pageid
    ## [1] 41916270
    ## 
    ## $query$pages$`41916270`$ns
    ## [1] 0
    ## 
    ## $query$pages$`41916270`$title
    ## [1] "Hadley Wickham"
    ## 
    ## $query$pages$`41916270`$revisions
    ## $query$pages$`41916270`$revisions[[1]]
    ## $query$pages$`41916270`$revisions[[1]]$user
    ## [1] "214.28.226.251"
    ## 
    ## $query$pages$`41916270`$revisions[[1]]$anon
    ## [1] ""
    ## 
    ## $query$pages$`41916270`$revisions[[1]]$timestamp
    ## [1] "2015-01-14T17:12:45Z"
    ## 
    ## $query$pages$`41916270`$revisions[[1]]$contentformat
    ## [1] "text/x-wiki"
    ## 
    ## $query$pages$`41916270`$revisions[[1]]$contentmodel
    ## [1] "wikitext"
    ## 
    ## $query$pages$`41916270`$revisions[[1]]$comment
    ## [1] ""
    ## 
    ## $query$pages$`41916270`$revisions[[1]]$`*`
    ## [1] "'''Hadley Mary Helen Wickham III''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\"about\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\"about\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>"
    ## 
    ## 
    ## $query$pages$`41916270`$revisions[[2]]
    ## $query$pages$`41916270`$revisions[[2]]$user
    ## [1] "73.183.151.193"
    ## 
    ## $query$pages$`41916270`$revisions[[2]]$anon
    ## [1] ""
    ## 
    ## $query$pages$`41916270`$revisions[[2]]$timestamp
    ## [1] "2015-01-15T15:49:34Z"
    ## 
    ## $query$pages$`41916270`$revisions[[2]]$contentformat
    ## [1] "text/x-wiki"
    ## 
    ## $query$pages$`41916270`$revisions[[2]]$contentmodel
    ## [1] "wikitext"
    ## 
    ## $query$pages$`41916270`$revisions[[2]]$comment
    ## [1] ""
    ## 
    ## $query$pages$`41916270`$revisions[[2]]$`*`
    ## [1] "'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\"about\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\"about\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>"
    ## 
    ## 
    ## $query$pages$`41916270`$revisions[[3]]
    ## $query$pages$`41916270`$revisions[[3]]$user
    ## [1] "FeanorStar7"
    ## 
    ## $query$pages$`41916270`$revisions[[3]]$timestamp
    ## [1] "2015-01-24T16:34:31Z"
    ## 
    ## $query$pages$`41916270`$revisions[[3]]$contentformat
    ## [1] "text/x-wiki"
    ## 
    ## $query$pages$`41916270`$revisions[[3]]$contentmodel
    ## [1] "wikitext"
    ## 
    ## $query$pages$`41916270`$revisions[[3]]$comment
    ## [1] "/* External links */ add LCCN and cats"
    ## 
    ## $query$pages$`41916270`$revisions[[3]]$`*`
    ## [1] "'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\"about\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\"about\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>"
    ## 
    ## 
    ## $query$pages$`41916270`$revisions[[4]]
    ## $query$pages$`41916270`$revisions[[4]]$user
    ## [1] "KasparBot"
    ## 
    ## $query$pages$`41916270`$revisions[[4]]$timestamp
    ## [1] "2015-04-26T19:18:17Z"
    ## 
    ## $query$pages$`41916270`$revisions[[4]]$contentformat
    ## [1] "text/x-wiki"
    ## 
    ## $query$pages$`41916270`$revisions[[4]]$contentmodel
    ## [1] "wikitext"
    ## 
    ## $query$pages$`41916270`$revisions[[4]]$comment
    ## [1] "authority control moved to wikidata"
    ## 
    ## $query$pages$`41916270`$revisions[[4]]$`*`
    ## [1] "'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\"about\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\"about\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>"
    ## 
    ## 
    ## $query$pages$`41916270`$revisions[[5]]
    ## $query$pages$`41916270`$revisions[[5]]$user
    ## [1] "Spkal"
    ## 
    ## $query$pages$`41916270`$revisions[[5]]$timestamp
    ## [1] "2015-05-06T18:24:57Z"
    ## 
    ## $query$pages$`41916270`$revisions[[5]]$contentformat
    ## [1] "text/x-wiki"
    ## 
    ## $query$pages$`41916270`$revisions[[5]]$contentmodel
    ## [1] "wikitext"
    ## 
    ## $query$pages$`41916270`$revisions[[5]]$comment
    ## [1] "/* Bibliography */  Added his new book, R Packages"
    ## 
    ## $query$pages$`41916270`$revisions[[5]]$`*`
    ## [1] "'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\"about\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\"about\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>"

``` r
# Parse returned text with fromJSON()
library(jsonlite)
fromJSON(content(resp_json, as = "text"))
```

    ## $continue
    ## $continue$rvcontinue
    ## [1] "20150528042700|664370232"
    ## 
    ## $continue$continue
    ## [1] "||"
    ## 
    ## 
    ## $warnings
    ## $warnings$main
    ## $warnings$main$`*`
    ## [1] "Subscribe to the mediawiki-api-announce mailing list at <https://lists.wikimedia.org/postorius/lists/mediawiki-api-announce.lists.wikimedia.org/> for notice of API deprecations and breaking changes. Use [[Special:ApiFeatureUsage]] to see usage of deprecated features by your application."
    ## 
    ## 
    ## $warnings$revisions
    ## $warnings$revisions$`*`
    ## [1] "Because \"rvslots\" was not specified, a legacy format has been used for the output. This format is deprecated, and in the future the new format will always be used."
    ## 
    ## 
    ## 
    ## $query
    ## $query$pages
    ## $query$pages$`41916270`
    ## $query$pages$`41916270`$pageid
    ## [1] 41916270
    ## 
    ## $query$pages$`41916270`$ns
    ## [1] 0
    ## 
    ## $query$pages$`41916270`$title
    ## [1] "Hadley Wickham"
    ## 
    ## $query$pages$`41916270`$revisions
    ##             user anon            timestamp contentformat contentmodel
    ## 1 214.28.226.251      2015-01-14T17:12:45Z   text/x-wiki     wikitext
    ## 2 73.183.151.193      2015-01-15T15:49:34Z   text/x-wiki     wikitext
    ## 3    FeanorStar7 <NA> 2015-01-24T16:34:31Z   text/x-wiki     wikitext
    ## 4      KasparBot <NA> 2015-04-26T19:18:17Z   text/x-wiki     wikitext
    ## 5          Spkal <NA> 2015-05-06T18:24:57Z   text/x-wiki     wikitext
    ##                                              comment
    ## 1                                                   
    ## 2                                                   
    ## 3             /* External links */ add LCCN and cats
    ## 4                authority control moved to wikidata
    ## 5 /* Bibliography */  Added his new book, R Packages
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            *
    ## 1 '''Hadley Mary Helen Wickham III''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name="about">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name="about" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>
    ## 2                '''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name="about">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name="about" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>
    ## 3                '''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name="about">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name="about" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>
    ## 4                '''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name="about">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name="about" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>
    ## 5                '''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name="about">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name="about" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>

Great work! You may have noticed the output from `content()` is pretty
long and hard to understand. Don’t worry, that is just the nature of
nested data, you’ll learn a couple of tricks for dealing with it next.
However, it will be helpful to know that this response contains 5
revisions.

## Manipulating JSON

Theory. Coming soon …

**1. Manipulating JSON**

You might have noticed a lot of output scrolling past when you parsed
your JSON data. What kind of object was being returned?

**2. Movies example**

Let’s take a look using the movies JSON from the previous video. Here’s
the JSON.

**3. Movies example**

In R, I’ll just store that in a string called movies_json.

**4. Movies example**

Now, look what happens when we parse that with fromJSON(). I’ve set the
simplifyVector argument to FALSE to emulate what happens when you use
the content() function without any arguments.What we get back is a list!
Lists are the natural R object for storing JSON data because they can
store hierarchical data just like JSON. fromJSON() will always return a
list. It converts any JSON objects (remember those are the ones with
curly braces) to named lists, and any JSON arrays (the ones with square
brackets) to unnamed lists.

**5. Simplifying the output (I)**

fromJSON() also provides extra simplification through some of its
arguments. For example, if simplifyVector is true, any arrays of just
numbers or strings will be converted to vectors.

**6. Simplifying the output (II)**

Take a look at what happens when you set simplifyDataFrame to
TRUE.fromJSON() will convert any arrays of objects to data frames.

**7. Extracting data from JSON (I)**

Now imagine you want to extract all the titles of the movies. One option
is to rely on fromJSON() to simplify to a dataframe and pull out the
relevant column.

**8. Extracting data from JSON (II)**

The other is to use the list form and iterate over each element. Over
the next couple of exercises you’ll explore doing this two ways: first,
with a dedicated package rlist, and second, using functions from base R
and the tidyverse.

**9. Let’s practice!**

## Manipulating parsed JSON

As you saw in the video, the output from parsing JSON is a list. One way
to extract relevant data from that list is to use a package specifically
designed for manipulating lists,
<a href="https://www.rdocumentation.org/packages/rlist">`rlist`</a>.

`rlist` provides two particularly useful functions for selecting and
combining elements from a list:
<a href="https://www.rdocumentation.org/packages/rlist/topics/list.select">`list.select()`</a>
and
<a href="https://www.rdocumentation.org/packages/rlist/topics/list.stack">`list.stack()`</a>.
`list.select()` extracts sub-elements by name from each element in a
list. For example using the parsed movies data from the video
(`movies_list`), we might ask for the `title` and `year` elements from
each element:

``` r
list.select(movies_list, title, year)
```

The result is still a list, that is where `list.stack()` comes in. It
will stack the elements of a list into a data frame.

``` r
list.stack(
    list.select(movies_list, title, year)
)
```

In this exercise you’ll use these `rlist` functions to create a data
frame with the user and timestamp for each revision.

**Steps**

1.  First, you’ll need to figure out where the revisions are. Examine
    the output from the `str()` call. *Can you see where the list of 5
    revisions is?*
2.  Store the revisions in `revs`.
3.  Use `list.select()` to pull out the `user` and `timestamp` elements
    from each revision, store in `user_time`.
4.  Print `user_time` to verify it’s a list with one element for each
    revision.
5.  Use `list.stack()` to stack the lists into a data frame.

``` r
# Load rlist
library(rlist)

# Examine output of this code
str(content(resp_json), max.level = 4)
```

    ## List of 3
    ##  $ continue:List of 2
    ##   ..$ rvcontinue: chr "20150528042700|664370232"
    ##   ..$ continue  : chr "||"
    ##  $ warnings:List of 2
    ##   ..$ main     :List of 1
    ##   .. ..$ *: chr "Subscribe to the mediawiki-api-announce mailing list at <https://lists.wikimedia.org/postorius/lists/mediawiki-"| __truncated__
    ##   ..$ revisions:List of 1
    ##   .. ..$ *: chr "Because \"rvslots\" was not specified, a legacy format has been used for the output. This format is deprecated,"| __truncated__
    ##  $ query   :List of 1
    ##   ..$ pages:List of 1
    ##   .. ..$ 41916270:List of 4
    ##   .. .. ..$ pageid   : int 41916270
    ##   .. .. ..$ ns       : int 0
    ##   .. .. ..$ title    : chr "Hadley Wickham"
    ##   .. .. ..$ revisions:List of 5

``` r
# Store revision list
revs <- content(resp_json)$query$pages$`41916270`$revisions

# Extract the user element
user_time <- list.select(revs, user, timestamp)

# Print user_time
user_time 
```

    ## [[1]]
    ## [[1]]$user
    ## [1] "214.28.226.251"
    ## 
    ## [[1]]$timestamp
    ## [1] "2015-01-14T17:12:45Z"
    ## 
    ## 
    ## [[2]]
    ## [[2]]$user
    ## [1] "73.183.151.193"
    ## 
    ## [[2]]$timestamp
    ## [1] "2015-01-15T15:49:34Z"
    ## 
    ## 
    ## [[3]]
    ## [[3]]$user
    ## [1] "FeanorStar7"
    ## 
    ## [[3]]$timestamp
    ## [1] "2015-01-24T16:34:31Z"
    ## 
    ## 
    ## [[4]]
    ## [[4]]$user
    ## [1] "KasparBot"
    ## 
    ## [[4]]$timestamp
    ## [1] "2015-04-26T19:18:17Z"
    ## 
    ## 
    ## [[5]]
    ## [[5]]$user
    ## [1] "Spkal"
    ## 
    ## [[5]]$timestamp
    ## [1] "2015-05-06T18:24:57Z"

``` r
# Stack to turn into a data frame
list.stack(user_time)
```

    ##             user            timestamp
    ## 1 214.28.226.251 2015-01-14T17:12:45Z
    ## 2 73.183.151.193 2015-01-15T15:49:34Z
    ## 3    FeanorStar7 2015-01-24T16:34:31Z
    ## 4      KasparBot 2015-04-26T19:18:17Z
    ## 5          Spkal 2015-05-06T18:24:57Z

Perfect! [`rlist`](https://www.rdocumentation.org/packages/rlist) is
designed to make working with lists easy, so if find you are working
with JSON data a lot, you should explore more of its functionality.

## Reformatting JSON

Of course you don’t have to use `rlist`. You can achieve the same thing
by using functions from base R or the tidyverse. In this exercise you’ll
repeat the task of extracting the username and timestamp using the
<a href="https://www.rdocumentation.org/packages/dplyr">`dplyr`</a>
package which is part of the tidyverse.

Conceptually, you’ll take the list of revisions, stack them into a data
frame, then pull out the relevant columns.

`dplyr`’s
<a href="https://www.rdocumentation.org/packages/dplyr/topics/bind_rows">`bind_rows()`</a>
function takes a list and turns it into a data frame. Then you can use
<a href="https://www.rdocumentation.org/packages/dplyr/topics/select">`select()`</a>
to extract the relevant columns. And of course if we can make use of the
`%>%` (pipe) operator to chain them all together.

Try it!

**Steps**

1.  Pipe the list of revisions into `bind_rows()`.
2.  Use `select()` to extract the `user` and `timestamp` columns.

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
# Pull out revision list
revs <- content(resp_json)$query$pages$`41916270`$revisions

# Extract user and timestamp
revs %>%
  bind_rows() %>%
  select(user, timestamp)
```

    ## # A tibble: 5 × 2
    ##   user           timestamp           
    ##   <chr>          <chr>               
    ## 1 214.28.226.251 2015-01-14T17:12:45Z
    ## 2 73.183.151.193 2015-01-15T15:49:34Z
    ## 3 FeanorStar7    2015-01-24T16:34:31Z
    ## 4 KasparBot      2015-04-26T19:18:17Z
    ## 5 Spkal          2015-05-06T18:24:57Z

You nailed it!

## XML structure

Theory. Coming soon …

**1. XML structure**

XML is another popular format for transmitting data over APIs. Like
JSON, it’s a plain text format, but it has quite a different structure.

**2. Movies in XML**

Let’s take a look at the same movies data you saw in JSON, in XML.The
structure of an XML file can be divided into markup and content. Markup
describes the structure of the data, whereas content is the data itself.
Most markup is in the form of what are know as tags. Tags begin with a
less than sign and end with a greater than sign. In this data you can
see movies, movie, title and year tags. They generally occur in pairs
with a start tag containing just the tag name, and the end tag having a
forward slash between the less than sign and the tag name.

**3. Tags can have attributes**

Beyond the tag name, a tag can also contain attributes in the form of
name value pairs. An alternative way of providing the same data might be
to use attributes instead of tags. Here instead of a year tag, the year
is provided in a year attribute of the title tag.There’s no standard on
how data should be stored in XML, but usually attributes are reserved
for metadata, that is data about the data, and content is used for data.

**4. The hierarchy of XML elements**

So, in this case since the year is data about a movie, we should
probably stick to the original format.

**5. The hierarchy of XML elements**

The key to navigating XML is understanding its hierarchical structure.
An XML element is everything from and including a start tag to and
including the end tag. The content of an element is everything between
the tags, including other elements.For example, the first movie element
contains two more elements:

**6. The hierarchy of XML elements**

a title element and a year element.

**7. The hierarchy of XML elements**

The contents of the title element is simply the text “A New Hope”.

**8. Understanding XML as a tree**

You can think of an XML document as a tree where the nodes are elements
or text. You can describe the relationships between the nodes just like
you would a family tree.

**9. Understanding XML as a tree**

You would say that this title element is a child of the first movie
element because it is contained inside the first movie element.
Equivalently, you could say the first movie element is the parent of
this title element.

**10. Understanding XML as a tree**

These title and year elements are siblings, because they share the same
parent: movie.

**11. Understanding XML as a tree**

Just like the two movie elements are siblings because they share the
same parent: movies.

**12. Let’s practice!**

Over the next few exercises you’ll use the xml2 package to parse XML,
and examine its structure with the xml_structure() function.

## Do you understand XML structure?

Take a look at this XML document:

``` xml
<jason>
  <person type = "fictional">
    <first_name>
      Jason
    </first_name>
    <last_name>
      Bourne
    </last_name>
    <occupation>
      Spy
    </occupation>
  </person>
</jason>
```

> ## *Question*
>
> Which of the following is **false**?<br> <br> ⬜ The contents of the
> `first_name` element is the text `Jason`.<br> ⬜ The `type` attribute
> of the `person` element is `"fictional"`.<br> ⬜ The `person` element
> is a child of the `jason` element.<br> ✅ The `last_name` element is a
> child of the `first_name` element.<br>

You got it, the `last_name` element is a **sibling** of the `first_name`
element.

## Examining XML documents

Just like JSON, you should first verify the response is indeed XML with
<a href="https://www.rdocumentation.org/packages/httr/topics/http_type">`http_type()`</a>
and by examining the result of `content(r, as = "text")`. Then you can
turn the response into an XML document object with
<a href="https://www.rdocumentation.org/packages/xml2/topics/read_xml">`read_xml()`</a>.

One benefit of using the XML document object is the available functions
that help you explore and manipulate the document. For example
<a href="https://www.rdocumentation.org/packages/xml2/topics/xml_structure">`xml_structure()`</a>
will print a representation of the XML document that emphasizes the
hierarchical structure by displaying the elements without the data.

In this exercise you’ll grab the same revision history you’ve been
working with as XML, and take a look at it with `xml_structure()`.

**Steps**

1.  Get the XML version of the revision history for the Wikipedia
    article for `"Hadley Wickham"`, by calling
    `rev_history("Hadley Wickham", format = "xml")`, store it in
    `resp_xml`.
2.  Check the response type of `resp_xml` to confirm the API returned an
    XML object.
3.  You can’t always trust a header, so check the content looks like XML
    by calling `content()` on `resp_xml` with `as = "text"`, store in
    `rev_text`.
4.  Turn `rev_text` into an XML object with `read_xml()` from the `xml2`
    package, store as `rev_xml`.
5.  Call `xml_structure()` on `rev_xml` to see the structure of the
    returned XML. *Can you see where the revisions are?*

``` r
# Load xml2
library(xml2)

# Get XML revision history
revhist_xml_url <- "https://en.wikipedia.org/w/api.php?action=query&titles=Hadley%20Wickham&prop=revisions&rvprop=timestamp%7Cuser%7Ccomment%7Ccontent&rvlimit=5&format=xml&rvdir=newer&rvstart=2015-01-14T17%3A12%3A45Z&rvsection=0"

resp_xml <- GET(revhist_xml_url)

# Check response is XML
http_type(resp_xml)
```

    ## [1] "text/xml"

``` r
# Examine returned text with content()
rev_text <- content(resp_xml, as = "text")
rev_text
```

    ## [1] "<?xml version=\"1.0\"?><api><continue rvcontinue=\"20150528042700|664370232\" continue=\"||\" /><warnings><main xml:space=\"preserve\">Subscribe to the mediawiki-api-announce mailing list at &lt;https://lists.wikimedia.org/postorius/lists/mediawiki-api-announce.lists.wikimedia.org/&gt; for notice of API deprecations and breaking changes. Use [[Special:ApiFeatureUsage]] to see usage of deprecated features by your application.</main><revisions xml:space=\"preserve\">Because \"rvslots\" was not specified, a legacy format has been used for the output. This format is deprecated, and in the future the new format will always be used.</revisions></warnings><query><pages><page _idx=\"41916270\" pageid=\"41916270\" ns=\"0\" title=\"Hadley Wickham\"><revisions><rev user=\"214.28.226.251\" anon=\"\" timestamp=\"2015-01-14T17:12:45Z\" contentformat=\"text/x-wiki\" contentmodel=\"wikitext\" comment=\"\" xml:space=\"preserve\">'''Hadley Mary Helen Wickham III''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]&lt;ref&gt;{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}&lt;/ref&gt;&lt;ref&gt;{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}&lt;/ref&gt; and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].&lt;ref name=\"about\"&gt;{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}&lt;/ref&gt; He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.&lt;ref&gt;{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}&lt;/ref&gt; In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.&lt;ref&gt;{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}&lt;/ref&gt;\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.&lt;ref name=\"about\" /&gt;&lt;ref&gt;{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}&lt;/ref&gt;</rev><rev user=\"73.183.151.193\" anon=\"\" timestamp=\"2015-01-15T15:49:34Z\" contentformat=\"text/x-wiki\" contentmodel=\"wikitext\" comment=\"\" xml:space=\"preserve\">'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]&lt;ref&gt;{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}&lt;/ref&gt;&lt;ref&gt;{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}&lt;/ref&gt; and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].&lt;ref name=\"about\"&gt;{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}&lt;/ref&gt; He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.&lt;ref&gt;{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}&lt;/ref&gt; In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.&lt;ref&gt;{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}&lt;/ref&gt;\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.&lt;ref name=\"about\" /&gt;&lt;ref&gt;{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}&lt;/ref&gt;</rev><rev user=\"FeanorStar7\" timestamp=\"2015-01-24T16:34:31Z\" contentformat=\"text/x-wiki\" contentmodel=\"wikitext\" comment=\"/* External links */ add LCCN and cats\" xml:space=\"preserve\">'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]&lt;ref&gt;{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}&lt;/ref&gt;&lt;ref&gt;{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}&lt;/ref&gt; and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].&lt;ref name=\"about\"&gt;{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}&lt;/ref&gt; He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.&lt;ref&gt;{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}&lt;/ref&gt; In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.&lt;ref&gt;{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}&lt;/ref&gt;\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.&lt;ref name=\"about\" /&gt;&lt;ref&gt;{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}&lt;/ref&gt;</rev><rev user=\"KasparBot\" timestamp=\"2015-04-26T19:18:17Z\" contentformat=\"text/x-wiki\" contentmodel=\"wikitext\" comment=\"authority control moved to wikidata\" xml:space=\"preserve\">'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]&lt;ref&gt;{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}&lt;/ref&gt;&lt;ref&gt;{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}&lt;/ref&gt; and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].&lt;ref name=\"about\"&gt;{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}&lt;/ref&gt; He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.&lt;ref&gt;{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}&lt;/ref&gt; In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.&lt;ref&gt;{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}&lt;/ref&gt;\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.&lt;ref name=\"about\" /&gt;&lt;ref&gt;{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}&lt;/ref&gt;</rev><rev user=\"Spkal\" timestamp=\"2015-05-06T18:24:57Z\" contentformat=\"text/x-wiki\" contentmodel=\"wikitext\" comment=\"/* Bibliography */  Added his new book, R Packages\" xml:space=\"preserve\">'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]&lt;ref&gt;{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}&lt;/ref&gt;&lt;ref&gt;{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}&lt;/ref&gt; and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].&lt;ref name=\"about\"&gt;{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}&lt;/ref&gt; He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.&lt;ref&gt;{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}&lt;/ref&gt; In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.&lt;ref&gt;{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}&lt;/ref&gt;\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.&lt;ref name=\"about\" /&gt;&lt;ref&gt;{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}&lt;/ref&gt;</rev></revisions></page></pages></query></api>"

``` r
# Turn rev_text into an XML document
rev_xml <- read_xml(rev_text)

# Examine the structure of rev_xml
xml_structure(rev_xml)
```

    ## <api>
    ##   <continue [rvcontinue, continue]>
    ##   <warnings>
    ##     <main [space]>
    ##       {text}
    ##     <revisions [space]>
    ##       {text}
    ##   <query>
    ##     <pages>
    ##       <page [_idx, pageid, ns, title]>
    ##         <revisions>
    ##           <rev [user, anon, timestamp, contentformat, contentmodel, comment, space]>
    ##             {text}
    ##           <rev [user, anon, timestamp, contentformat, contentmodel, comment, space]>
    ##             {text}
    ##           <rev [user, timestamp, contentformat, contentmodel, comment, space]>
    ##             {text}
    ##           <rev [user, timestamp, contentformat, contentmodel, comment, space]>
    ##             {text}
    ##           <rev [user, timestamp, contentformat, contentmodel, comment, space]>
    ##             {text}

Brilliant!
[`xml_structure()`](https://www.rdocumentation.org/packages/xml2/topics/xml_structure)
helps you understand the structure of your document, without
overwhelming you with content.

## XPATHs

Theory. Coming soon …

**1. XPATHS**

Now you have an overview of the structure of XML documents you need to
learn how to extract data from them. In this video you’ll learn about
XPath, a language for specifying nodes in an XML document.

**2. Movies example**

Take a look at this slightly altered XML description of the movies. I’ve
added another title node to the movies element that describes that these
movies belong to the Star Wars franchise. I’ve also added an episode
attribute to each movie:

**3. Movies example**

I’ll read it in to XML as movies_xml.

**4. XPATHS**

XPATHs look a bit like file paths because they use forward slashes to
specify levels in the XML document tree. Here’s a simple one:
/movies/movie/title. It describes all nodes that are called title that
are inside a movie node, inside the movies node at the top of the
document. The xml_find_all() function in xml2 will find all nodes that
match an XPath description in a given document.

**5. XPATHS**

Let’s look for nodes using this XPath in the movies XML.You see we get
back the two title nodes that correspond to our two movies. The result
is a special object called a node set.

**6. XPATHS**

If we want to extract the data from these we can use the xml_text()
function to extract the contents of each node as text.

**7. Other XPATH Syntax**

A double forward slash in a XPATH describes nodes at any level of the
document, for example “double forward slash title” describes any nodes
below the top of the document with the title tag. You can see this picks
up our two movie titles but also the title of our collection.

**8. Other XPATH Syntax**

You can also use XPaths to find nodes based on attributes using the “at”
symbol. For example, //<movie/@episode> finds any episode attributes
that are inside a movie node anywhere in the document.

**9. Or…**

An alternative way to extract attributes is to use the xml_attr() and
xml_attrs() functions on nodes sets, which you’ll see in the exercises.

**10. Wrap Up**

To wrap up, you can use XPaths to specify specific nodes in an XML
document. A single slash denotes a node at the current level, and a
double slash a node anywhere at or below the current level, an “at”
symbol can be used for an attribute. To extract these nodes from a
document in R use the xml_find_all() function. Then parse the contents
of the nodes to get an R object. You just saw xml_text(), but there is
also xml_double(), xml_integer(), and as_list().

**11. Let’s practice!**

OK time to extract some data from XML.

## Extracting XML data

XPATHs are designed to specifying nodes in an XML document. Remember
`/node_name` specifies nodes at the current level that have the tag
`node_name`, where as `//node_name` specifies nodes at any level below
the current level that have the tag `node_name`.

`xml2` provides the function
<a href="https://www.rdocumentation.org/packages/xml2/topics/xml_find_all">`xml_find_all()`</a>
to extract nodes that match a given XPATH. For example,
`xml_find_all(rev_xml, "/api")` will find all the nodes at the top level
of the `rev_xml` document that have the tag `api`. Try running that in
the console. You’ll get a nodeset of one node because there is only one
node that satisfies that XPATH.

The object returned from `xml_find_all()` is a nodeset (think of it like
a list of nodes). To actually get data out of the nodes in the nodeset,
you’ll have to explicitly ask for it with
<a href="https://www.rdocumentation.org/packages/xml2/topics/xml_text">`xml_text()`</a>
(or
<a href="https://www.rdocumentation.org/packages/xml2/topics/xml_double">`xml_double()`</a>
or
<a href="https://www.rdocumentation.org/packages/xml2/topics/xml_integer">`xml_integer()`</a>).

Use what you know about the location of the revisions data in the
returned XML document extract just the content of the revision.

**Steps**

1.  Use `xml_find_all()` on `rev_xml` to find all the nodes that
    describe revisions by using the XPATH,
    `"/api/query/pages/page/revisions/rev"`.
2.  Use `xml_find_all()` on `rev_xml` to find all the nodes that are in
    a `rev` node anywhere in the document, store in `rev_nodes`.
3.  Extract the contents from each node in `rev_nodes`, by passing
    `rev_nodes` to `xml_text()`.

``` r
# Find all nodes using XPATH "/api/query/pages/page/revisions/rev"
xml_find_all(rev_xml, "/api/query/pages/page/revisions/rev")
```

    ## {xml_nodeset (5)}
    ## [1] <rev user="214.28.226.251" anon="" timestamp="2015-01-14T17:12:45Z" conte ...
    ## [2] <rev user="73.183.151.193" anon="" timestamp="2015-01-15T15:49:34Z" conte ...
    ## [3] <rev user="FeanorStar7" timestamp="2015-01-24T16:34:31Z" contentformat="t ...
    ## [4] <rev user="KasparBot" timestamp="2015-04-26T19:18:17Z" contentformat="tex ...
    ## [5] <rev user="Spkal" timestamp="2015-05-06T18:24:57Z" contentformat="text/x- ...

``` r
# Find all rev nodes anywhere in document
rev_nodes <- xml_find_all(rev_xml, "//rev")

# Use xml_text() to get text from rev_nodes
xml_text(rev_nodes)
```

    ## [1] "'''Hadley Mary Helen Wickham III''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\"about\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\"about\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>"
    ## [2] "'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\"about\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\"about\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>"               
    ## [3] "'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\"about\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\"about\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>"               
    ## [4] "'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\"about\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\"about\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>"               
    ## [5] "'''Hadley Wickham''' is a  [[statistician]] from [[New Zealand]] who is currently Chief Scientist at [[RStudio]]<ref>{{cite web|url=http://washstat.org/wss1310.shtml |title=Washington Statistical Society October 2013 Newsletter |publisher=Washstat.org |date= |accessdate=2014-02-12}}</ref><ref>{{cite web|url=http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7 |title=60+ R resources to improve your data skills ( - Software ) |publisher=News.idg.no |date= |accessdate=2014-02-12}}</ref> and an [[Professors_in_the_United_States#Adjunct_professor|adjunct]] [[Assistant Professor]] of statistics at [[Rice University]].<ref name=\"about\">{{cite web|url=http://www.rstudio.com/about/ |title=About - RStudio |accessdate=2014-08-13}}</ref> He is best known for his development of open-source statistical analysis software packages for [[R (programming language)]] that implement logics of [[data visualisation]] and data transformation. Wickham completed his undergraduate studies at the [[University of Auckland]] and his PhD at [[Iowa State University]] under the supervision of Di Cook and Heike Hoffman.<ref>{{cite web|URL=http://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html |title= The R-Files: Hadley Wickham}}</ref> In 2006 he was awarded the [[John_Chambers_(statistician)|John Chambers]] Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<ref>{{cite web|url=http://stat-computing.org/awards/jmc/winners.html |title=John Chambers Award Past winners|publisher=ASA Sections on Statistical Computing, Statistical Graphics,|date= |accessdate=2014-08-12}}</ref>\n\nHe is a prominent and active member of the [[R (programming language)|R]] user community and has developed several notable and widely used packages including [[ggplot2]], plyr, dplyr, and reshape2.<ref name=\"about\" /><ref>{{cite web|url=http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/ |title=Top 100 R Packages for 2013 (Jan-May)! |publisher=R-statistics blog |date= |accessdate=2014-08-12}}</ref>"

Terrific, you’ve written your first XPATH! You’ll get plenty of practice
with them this chapter and the next.

## Extracting XML attributes

Not all the useful data will be in the content of a node, some might
also be in the attributes of a node. To extract attributes from a
nodeset, `xml2` provides
<a href="https://www.rdocumentation.org/packages/xml2/topics/xml_attrs">`xml_attrs()`</a>
and
<a href="https://www.rdocumentation.org/packages/xml2/topics/xml_attr">`xml_attr()`</a>.

`xml_attrs()` takes a nodeset and returns **all** of the attributes for
every node in the nodeset. `xml_attr()` takes a nodeset and an
additional argument `attr` to extract a single named argument from each
node in the nodeset.

In this exercise you’ll grab the `user` and `anon` attributes for each
revision. You’ll see
<a href="https://www.rdocumentation.org/packages/xml2/topics/xml_find_first">`xml_find_first()`</a>
in the sample code. It works just like
<a href="https://www.rdocumentation.org/packages/xml2/topics/xml_find_all">`xml_find_all()`</a>
but it only extracts the first node it finds.

**Steps**

1.  We’ve extracted `rev_nodes` and `first_rev_node` in the document for
    you to explore the difference between `xml_attrs()` and
    `xml_attr()`.

    -   Use `xml_attrs()` on `first_rev_node` to see all the attributes
        of the first revision node.  
    -   Use `xml_attr()` on `first_rev_node` along with an appropriate
        `attr` argument to extract the `user` attribute from the first
        revision node.  
    -   Now use `xml_attr()` again, but this time on `rev_nodes` to
        extract the `user` attribute from all revision nodes.  
    -   Use `xml_attr()` on `rev_nodes` to extract the `anon` attribute
        from all revision nodes.

``` r
# All rev nodes
rev_nodes <- xml_find_all(rev_xml, "//rev")

# The first rev node
first_rev_node <- xml_find_first(rev_xml, "//rev")

# Find all attributes with xml_attrs()
xml_attrs(first_rev_node)
```

    ##                   user                   anon              timestamp 
    ##       "214.28.226.251"                     "" "2015-01-14T17:12:45Z" 
    ##          contentformat           contentmodel                comment 
    ##          "text/x-wiki"             "wikitext"                     "" 
    ##                  space 
    ##             "preserve"

``` r
# Find user attribute with xml_attr()
xml_attr(first_rev_node, "user")
```

    ## [1] "214.28.226.251"

``` r
# Find user attribute for all rev nodes
xml_attr(rev_nodes, "user")
```

    ## [1] "214.28.226.251" "73.183.151.193" "FeanorStar7"    "KasparBot"     
    ## [5] "Spkal"

``` r
# Find anon attribute for all rev nodes
xml_attr(rev_nodes, "anon")
```

    ## [1] "" "" NA NA NA

Good job! Did you notice that if a node didn’t have the `anon` attribute
`xml_attr()` returned an `NA`?

## Wrapup: returning nice API output

How might all this work together? A useful API function will retrieve
results from an API **and** return them in a useful form. In Chapter 2,
you finished up by writing a function that retrieves data from an API
that relied on
<a href="https://www.rdocumentation.org/packages/httr/topics/content">`content()`</a>
to convert it to a useful form. To write a more robust API function you
shouldn’t rely on `content()` but instead parse the data yourself.

To finish up this chapter you’ll do exactly that: write
`get_revision_history()` which retrieves the XML data for the revision
history of page on Wikipedia, parses it, and returns it in a nice data
frame.

So that you can focus on the parts of the function that parse the return
object, you’ll see your function calls `rev_history()` to get the
response from the API. You can assume this function returns the raw
response and follows the best practices you learnt in Chapter 2, like
using a user agent, and checking the response status.

**Steps**

1.  Fill in the `___` to finish the function definition.

    -   Use `read_xml()` to turn the `content()` of `rev_resp` as text
        into an XML object.
    -   Use `xml_find_all()` to find *all* the `rev` nodes in the XML.
    -   Parse out the `"user"` attribute from `rev_nodes`.
    -   Parse out the content from `rev_nodes` using `xml_text()`.
    -   Finally, call `get_revision_history()` with
        `article_title = "Hadley Wickham"`.

``` r
## Adjust for title & format

get_revision_history <- function(article_title){
  # Get raw revision response
  # rev_resp <- rev_history(article_title, format = "xml")
  # Get XML revision history
  revhist_xml_url <- "https://en.wikipedia.org/w/api.php?action=query&titles=Hadley%20Wickham&prop=revisions&rvprop=timestamp%7Cuser%7Ccomment%7Ccontent&rvlimit=5&format=xml&rvdir=newer&rvstart=2015-01-14T17%3A12%3A45Z&rvsection=0"

  rev_resp <- GET(revhist_xml_url)
  
  # Turn the content() of rev_resp into XML
  rev_xml <- read_xml(content(rev_resp, "text"))
  
  # Find revision nodes
  rev_nodes <- xml_find_all(rev_xml, "//rev")

  # Parse out usernames
  user <- xml_attr(rev_nodes, "user")
  
  # Parse out timestamps
  timestamp <- readr::parse_datetime(xml_attr(rev_nodes, "timestamp"))
  
  # Parse out content
  content <- xml_text(rev_nodes)
  
  # Return data frame
  data.frame(user = user,
    timestamp = timestamp,
    content = substr(content, 1, 40))
}

# Call function for "Hadley Wickham"
get_revision_history("Hadley Wickham")
```

    ##             user           timestamp                                  content
    ## 1 214.28.226.251 2015-01-14 17:12:45 '''Hadley Mary Helen Wickham III''' is a
    ## 2 73.183.151.193 2015-01-15 15:49:34 '''Hadley Wickham''' is a  [[statisticia
    ## 3    FeanorStar7 2015-01-24 16:34:31 '''Hadley Wickham''' is a  [[statisticia
    ## 4      KasparBot 2015-04-26 19:18:17 '''Hadley Wickham''' is a  [[statisticia
    ## 5          Spkal 2015-05-06 18:24:57 '''Hadley Wickham''' is a  [[statisticia

Nice job! Your function parsed the XML data, but you could have just as
easily parsed the JSON data.

# 4. Web scraping with XPATHs

Now that we’ve covered the low-hanging fruit (“it has an API, and a
client”, “it has an API”) it’s time to talk about what to do when a
website doesn’t have any access mechanisms at all - when you have to
rely on web scraping. This chapter will introduce you to the rvest
web-scraping package, and build on your previous knowledge of XML
manipulation and XPATHs.

## Web scraping 101

Theory. Coming soon …

**1. Web Scraping 101**

We’ve discussed API usage and how to play around with the data you
retrieve from the API. The problem is that sometimes websites don’t have
a formal API. This doesn’t mean that you can’t get data out of them,
just that you have to take a different approach.That approach is called
“web scraping,” and it consists of grabbing the raw HTML of a website
and then extracting values from it. Web scraping is a bit messier than
API use, and a bit more complex, but it’s important to learn for
occasions where you can’t rely on an API’s presence. One caveat is that
there can be legal objections to doing it en-masse, so if it’s something
you’re planning to do, make sure it’s something the website owner is
comfortable with.

**2. Selectors**

Web scraping works by filtering the HTML of a web page to just the bits
you want, using some kind of identifier. There are a lot of forms these
identifiers can take, which we’ll discuss later in the chapter and
course, using example identifiers we have already extracted.When you get
out of this course and start applying web scraping to your own problems,
you’ll have to work out the identifiers yourself. This can be done with
a tool known as a selector: basically a browser plugin or extension
which, when you mouse over an element of a page, tells you what
categories it falls into for ID purposes.We’re not going to use it in
this course, but once you’re done you should absolutely check it out -
it makes things a heck of a lot easier.

**3. rvest**

To ease the task of web scraping, there’s a dedicated package, rvest.
This provides utilities for everything from reading the HTML in to
extracting elements from it, and is what we’ll be exploring in this
chapter and the next.To read an HTML page, call read_html(), passing the
URL. There are a few advanced options that are useful for dealing with
badly-formed pages, but usually this is the only argument that you need.

**4. Parsing HTML**

read_html() actually returns an XML document, so the XPath querying
skills that you learned in the previous chapter will come in useful now.
To retrieve a node from your document, call html_node() passing the
document and an XPath string describing the node that you want.

**5. Parsing HTML**

For example, calling read_html() on the Wikipedia page for R returns an
XML document object,

**6. Parsing HTML**

then calling html_node() with the document and the XPath double forwards
slash “ul” returns a node of the first unordered list on that page.

**7. Let’s practice!**

Now it’s your turn to try some examples.

## Reading HTML

The first step with web scraping is actually reading the HTML in. This
can be done with a function from `xml2`, which is imported by `rvest` -
<a href="https://www.rdocumentation.org/packages/rvest/topics/read_html">`read_html()`</a>.
This accepts a single URL, and returns a big blob of XML that we can use
further on.

We’re going to experiment with that by grabbing Hadley Wickham’s
wikipedia page, with
<a href="https://www.rdocumentation.org/packages/rvest">`rvest`</a>, and
then printing it just to see what the structure looks like.

**Steps**

1.  Load the `rvest` package.
2.  Use `read_html()` to read the URL stored at `test_url`. Store the
    results as `test_xml`.
3.  Print `test_xml`.

``` r
# Load rvest
library(rvest)

# Hadley Wickham's Wikipedia page
test_url <- "https://en.wikipedia.org/wiki/Hadley_Wickham"

# Read the URL stored as "test_url" with read_html()
test_xml <- read_html(test_url)

# Print test_xml
test_xml
```

    ## {html_document}
    ## <html class="client-nojs" lang="en" dir="ltr">
    ## [1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8 ...
    ## [2] <body class="mediawiki ltr sitedir-ltr mw-hide-empty-elt ns-0 ns-subject  ...

Nicely done! As you can see, the XML document looks very similar to what
we saw in the last chapter.

## Extracting nodes by XPATH

Now you’ve got a HTML page read into R. Great! But how do you get
individual, identifiable pieces of it?

The answer is to use
<a href="https://www.rdocumentation.org/packages/rvest/topics/html_node">`html_node()`</a>,
which extracts individual chunks of HTML from a HTML document. There are
a couple of ways of identifying and filtering nodes, and for now we’re
going to use XPATHs: unique identifiers for individual pieces of a HTML
document.

These can be retrieved using a browser gadget we’ll talk about later -
in the meanwhile the XPATH for the information box in the page you just
downloaded is stored as `test_node_xpath`. We’re going to retrieve the
box from the HTML doc with `html_node()`, using `test_node_xpath` as the
`xpath` argument.

**Steps**

1.  Use `html_node()` to retrieve the node with the XPATH stored at
    `test_node_xpath` from `test_xml` document you grabbed in the last
    exercise.
2.  Print the first element of the results.

``` r
test_node_xpath <- '//*[contains(concat( " ", @class, " " ), concat( " ", "vcard", " " ))]'

# Use html_node() to grab the node with the XPATH stored as `test_node_xpath`
node <- html_node(x = test_xml, xpath = test_node_xpath)

# Print the first element of the result
node[[1]]
```

    ## <pointer: 0x600003a3f380>

Good job! XML nodes are the building block of an XML document -
extracting them leads to everything else. At the moment, they’re still
kind of abstract objects: we’ll dig into their contents later on.

## HTML structure

Theory. Coming soon …

**1. HTML Structure**

At this point you’ve grabbed HTML pages and extracted nodes from them -
more importantly you’ve looked at the node contents which, if you’re not
familiar with HTML, look a lot like gibberish. In this video we’re going
to explore how HTML is structured, so it can at least be meaningful
gibberish.

**2. Tags**

HTML is defined largely by the presence of content within “tags.” With a
few exceptions, these are paired: there’s a start tag and an end tag.
The start tag is wrapped with a less than and greater than sign - the
end tag with a less than, backslash and greater than sign. You might
spot that this is just the same as with XML data, which Charlotte
discussed in the last chapter.As an example, if you want to store the
line of text “this is a test” with paragraph formatting, we’d use \<p\>
this is a test \</p\> - where the tag itself (p) tells the browser what
kind of information it’s dealing with (text) and the start and end tags
tell the browser where that information - and the associated
formatting - end and begin.

**3. Attributes**

You can also have attributes in tags. For example, the tag for a link is
“a,” which requires the attribute href - the link itself - before the
text. So a link to Wikipedia, with the display text “this is a test,”
would be \<a href = “<https://en-dot-wikipedia-dot-org/%22%3E>; this is
a test \</a\>. Parameters can do a lot of useful things, and are often
used to incorporate styling or formatting information, which is a thing
we’ll discuss in the next chapter.The important thing, though, is that
the information in a piece of HTML is more than just a piece of text or
a photo. It can be text - the actual displayed element. It can be an
attribute - links, stylesheet information, or similar things. And it can
be a name - the actual tag used.

**4. Extracting information**

rvest provides the functions html_text(), html_attr() and html_name() to
extract information stored in these three ways. For html_text(), and
html_name() you just need to pass the html nodeset of interest. For
html_attr() you’ll also need to specify the attribute name.

**5. Let’s practice!**

In the following exercises you’ll learn how to extract any and all of
the above, as you find necessary.

## Extracting names

The first thing we’ll grab is a name, from the first element of the
previously extracted table (now stored as `table_element`). We can do
this with
<a href="https://www.rdocumentation.org/packages/rvest/topics/html_name">`html_name()`</a>.
As you may recall from when you printed it, the element has the tag
<code>
<table>
…
</table>

</code>, so we’d expect the name to be, well, `table`.

**Steps**

1.  Extract the name of `table_element` using the function
    `html_name()`. Save it as `element_name`.
2.  Print `element_name`.

``` r
# read html
table_element <- read_html("data/vcard.html") |> html_node(("table"))

# Extract the name of table_element
element_name <- html_name(table_element)

# Print the name
element_name
```

    ## [1] "table"

Nice work! You’ve started extracting components from HTML and XML nodes.
The tag might not seem important (and most of the time, it’s not) but
it’s a good first step, and the actual node contents (text, say) is
something we’ll move on to next.

## Extracting values

Just knowing the type of HTML object a node is isn’t much use, though
(although it can be very helpful). What we really want is to extract the
actual *text* stored within the value.

We can do that with (shocker)
<a href="https://www.rdocumentation.org/packages/rvest/topics/html_text">`html_text()`</a>,
another convenient `rvest` function that accepts a node and passes back
the text inside it. For this we’ll want a node *within* the extracted
element - specifically, the one containing the page title. The xpath
value for that node is stored as `second_xpath_val`.

Using this xpath value, extract the node within `table_element` that we
want, and then use `html_text` to extract the text, before printing it.

**Steps**

1.  Extract the element of `table_element` referred to by
    `second_xpath_val` and store it as `page_name`.
2.  Extract the text from `page_name` using `html_text()`, saving it as
    `page_title`.
3.  Print `page_title`.

``` r
# xpath
second_xpath_val <- '//*[contains(concat( " ", @class, " " ), concat( " ", "fn", " " ))]'

# Extract the element of table_element referred to by second_xpath_val and store it as page_name
page_name <- html_node(x = table_element, xpath = second_xpath_val)

# Extract the text from page_name
page_title <- html_text(page_name)

# Print page_title
page_title
```

    ## [1] "Hadley Wickham"

Nice! Text extraction is most of what you’re likely to do with XML -
after all, the content of an XML tag is almost always the important
value. If it’s consistently a set of digits, say, you can always use
as.integer() or as.numeric() to turn it from a string, into a number

## Test: HTML reading and extraction

Time for a quick test of what we’ve learned about HTML.

> ## *Question*
>
> What would you use to extract the type of HTML tag a value is wrapped
> in?<br> <br> ⬜ `html_attr()`<br> ✅ `html_name()`<br>

Correct! The type of tag is the tag name - so `html_name()` is the right
function.

## Reformatting Data

Theory. Coming soon …

**1. Reformatting Data**

Something you briefly touched on in the last chapter is reformatting
data so that it’s rectangular - in other words, so it fits in a data
frame. This is because, as I’m sure you know, data frames are the most
commonly used and commonly supported ways of representing data in
R.We’re going to discuss it more here, in the context of web scraping,
and will cover two things. The first is turning HTML tables into R data
frames, and cleaning them up a bit: the second is turning arbitrary HTML
data, like names and text, into data frames.

**2. HTML tables**

Tables aren’t just an R structure, they’re also a structure in HTML.
Every time you see something tabular in HTML, that’s using a set of
dedicated tags - starting with the table tag - which tell your browser
“this is a table”.HTML tables can be extracted directly with rvest,
using the html_table() function. This produces a data frame. Much of the
time that’s all you need - the one exception is when the HTML table
itself didn’t have a header. In that case, the data frame will have
default column names which are pretty hard to remember. This is easily
fixed by assigning new memorable column names to it with the colnames()
function.

**3. Turning things into data.frames**

Most HTML, though, as you’ve seen, isn’t stored in tables. The good news
is we can still turn them into data frames, just using the data dot
frame() function. The vectors of text, names or attributes you’ve
extracted are just like any other vectors, and so you can easily
construct a data frame from them (assuming they’re all the same length).

**4. Let’s practice!**

You’ll be doing just that - and turning HTML tables into data frames -
in the next exercises.

## Extracting tables

The data from Wikipedia that we’ve been playing around with *can* be
extracted bit by bit and cleaned up manually, but since it’s a table, we
have an easier way of turning it into an R object. `rvest` contains the
function
<a href="https://www.rdocumentation.org/packages/rvest/topics/html_table">`html_table()`</a>
which, as the name suggests, extracts tables. It accepts a node
containing a table object, and outputs a data frame.

Let’s use it now: take the table we’ve extracted, and turn it into a
data frame.

**Steps**

1.  Turn `table_element` into a data frame and assign it to
    `wiki_table`.
2.  Print the resulting object.

``` r
# Turn table_element into a data frame and assign it to wiki_table
wiki_table <- html_table(table_element)

# Print wiki_table
wiki_table
```

    ## # A tibble: 12 × 2
    ##    `Hadley Wickham`         `Hadley Wickham`                                    
    ##    <chr>                    <chr>                                               
    ##  1 "Hadley Wickham in 2015" "Hadley Wickham in 2015"                            
    ##  2 "Born"                   "Hadley Alexander Wickham\n (1979-10-14) 14 October…
    ##  3 "Alma mater"             "University of Auckland (BSc, MSc)Iowa State Univer…
    ##  4 "Known for"              "ggplot2[1]tidyverseR packages"                     
    ##  5 "Awards"                 "COPSS Presidents' Award (2019)\n\nFellow of the Am…
    ##  6 "Scientific career"      "Scientific career"                                 
    ##  7 "Fields"                 "Data science\nVisualization\n\nStatistics[2]"      
    ##  8 "Institutions"           "RStudio Inc.\nUniversity of Auckland\nStanford Uni…
    ##  9 "Thesis"                 "Practical tools for exploring data and models (200…
    ## 10 "Doctoral advisors"      "Dianne Cook\n\nHeike Hofmann[3]"                   
    ## 11 ""                       ""                                                  
    ## 12 "Website"                "hadley.nz"

Well done! Being able to extract tables directly is a massive speedup,
since otherwise they’re a ton of different nested tags.

## Cleaning a data frame

In the last exercise, we looked at extracting tables with
`html_table()`. The resulting data frame was pretty clean, but had two
problems - first, the column names weren’t descriptive, and second,
there was an empty row.

In this exercise we’re going to look at fixing both of those problems.
First, column names. Column names can be cleaned up with the
`colnames()` function. You call it on the object you want to rename, and
then assign *to that call* a vector of new names.

The missing row, meanwhile, can be removed with the `subset()` function.
`subset` takes an object, and a condition. For example, if you have a
data frame `df` containing a column `x`, you could run

``` r
subset(df, !x == "")
```

to remove all rows from `df` consisting of empty strings (`""`) in the
column `x`.

**Steps**

1.  <ol>
    <li>
    Rename the columns of `wiki_table` to `"key"` and `"value"` using
    `colnames()`.
    </li>
    <li>
    Remove the empty row from `wiki_table` using `subset()`, and assign
    the result to `cleaned_table`.
    </li>
    <li>
    Print `cleaned_table`.
    </li>
    </ol>

``` r
# Rename the columns of wiki_table
colnames(wiki_table) <- c("key", "value")

# Remove the empty row from wiki_table
cleaned_table <- subset(wiki_table, !key == "")

# Print cleaned_table
cleaned_table
```

    ## # A tibble: 11 × 2
    ##    key                    value                                                 
    ##    <chr>                  <chr>                                                 
    ##  1 Hadley Wickham in 2015 "Hadley Wickham in 2015"                              
    ##  2 Born                   "Hadley Alexander Wickham\n (1979-10-14) 14 October 1…
    ##  3 Alma mater             "University of Auckland (BSc, MSc)Iowa State Universi…
    ##  4 Known for              "ggplot2[1]tidyverseR packages"                       
    ##  5 Awards                 "COPSS Presidents' Award (2019)\n\nFellow of the Amer…
    ##  6 Scientific career      "Scientific career"                                   
    ##  7 Fields                 "Data science\nVisualization\n\nStatistics[2]"        
    ##  8 Institutions           "RStudio Inc.\nUniversity of Auckland\nStanford Unive…
    ##  9 Thesis                 "Practical tools for exploring data and models (2008)"
    ## 10 Doctoral advisors      "Dianne Cook\n\nHeike Hofmann[3]"                     
    ## 11 Website                "hadley.nz"

Well done! Cleaning up data, or ‘munging’, is a really common thing to
have to do, particularly when someone else picked how it’s formatted. If
you can scrape data and clean it, you can do anything.

# 5. CSS Web Scraping and Final Case Study

CSS path-based web scraping is a far-more-pleasant alternative to using
XPATHs. You’ll start this chapter by learning about CSS, and how to
leverage it for web scraping. Then, you’ll work through a final case
study that combines everything you’ve learnt so far to write a function
that queries an API, parses the response and returns data in a nice
form.

## CSS web scraping in theory

Theory. Coming soon …

**1. CSS**

By this point you should already be somewhat familiar with web scraping
thanks to chapter 4, which discusses web scraping using XPATH values.
Next up is web scraping with CSS!CSS - Cascading Style Sheets - is
basically a way of adding design information (font size, color, or
border width) to HTML web pages. In order to make this information easy
to change and non-duplicative, CSS information is associated with
‘classes’ or ‘ids’ which can then be applied to whichever HTML elements
the developer wants.

**2. CSS example**

So if we wanted two types of link - one black, one red - we’d create two
different CSS classes with different font color choices,

**3. CSS example**

and then apply different classes to different HTML tags. And you can see
us doing that in the slide.

**4. CSS versus XPATH**

CSS-based scraping looks for these class names. Because particular
classes are strongly associated with particular UI objects (such as
‘links in the main body’, or a particular table) it’s really easy to
select or filter content based on them. It looks a lot like the
XPATH-based scraping in the last chapter, but with one major difference:
CSS-based techniques often get you a whole set of items that meet
conditions, rather than one specific item. We’re going to be using
modified versions of the exercises from the last chapter so you can see
the differences and similarities.Just as before, you’ll be using the
html_node() function to retrieve nodes from the document. This time,
however rather than passing the xpath argument, you’ll be passing the
css argument.

**5. Let’s practice!**

Have a go at some examples.

## Using CSS to scrape nodes

As mentioned in the video, CSS is a way to add design information to
HTML, that instructs the browser on how to display the content. You can
leverage these design instructions to identify content on the page.

You’ve already used
<a href="https://www.rdocumentation.org/packages/rvest/topics/html_node">`html_node()`</a>,
but it’s more common with CSS selectors to use
<a href="https://www.rdocumentation.org/packages/rvest/topics/html_nodes">`html_nodes()`</a>
since you’ll often want more than one node returned. Both functions
allow you to specify a `css` argument to use a CSS selector, instead of
specifying the `xpath` argument.

What do CSS selectors look like? Try these examples to see a few
possibilities.

**Steps**

1.  We’ve read in the same HTML page from Chapter 4, the Wikipedia page
    for Hadley Wickham, into `test_xml`.

    -   Use the CSS selector `"table"` to select all elements that are a
        `table` tag.
    -   Use the CSS selector `".infobox"` to select all elements that
        have the attribute `class = "infobox"`.
    -   Use the CSS selector `"#firstHeading"` to select all elements
        that have the attribute `id = "firstHeading"`.

``` r
# read xml
test_xml <- read_html("data/test.html")

# Select the table elements
html_nodes(test_xml, css = "table")
```

    ## {xml_nodeset (3)}
    ## [1] <table class="infobox biography vcard"><tbody>\n<tr><th colspan="2" class ...
    ## [2] <table class="nowraplinks mw-collapsible autocollapse navbox-inner" style ...
    ## [3] <table class="nowraplinks hlist mw-collapsible autocollapse navbox-inner" ...

``` r
# Select elements with class = "infobox"
html_nodes(test_xml, css = ".infobox")
```

    ## {xml_nodeset (1)}
    ## [1] <table class="infobox biography vcard"><tbody>\n<tr><th colspan="2" class ...

``` r
# Select elements with id = "firstHeading"
html_nodes(test_xml, css = "#firstHeading")
```

    ## {xml_nodeset (1)}
    ## [1] <h1 id="firstHeading" class="firstHeading mw-first-heading">Hadley Wickha ...

Nice work! Did you notice the special prefixes needed for classes and
ids?

## Scraping names

You might have noticed in the previous exercise, to select elements with
a certain class, you add a `.` in front of the class name. If you need
to select an element based on its id, you add a `#` in front of the id
name.

For example if this element was inside your HTML document:

``` html
<h1 class = "heading" id = "intro">
  Introduction
</h1>
```

You could select it by its class using the CSS selector `".heading"`, or
by its id using the CSS selector `"#intro"`.

Once you’ve selected an element with a CSS selector, you can get the
element tag name just like you did with XPATH selectors, with
<a href="https://www.rdocumentation.org/packages/rvest/topics/html_name">`html_name()`</a>.
Try it!

**Steps**

1.  The infobox you extracted in Chapter 4 has the class `infobox`. Use
    `html_nodes()` and the appropriate CSS selector to extract the
    infobox element to `infobox_element`.
2.  Use `html_name()` to extract the tag name of `infobox_element` and
    store it in `element_name`.
3.  Print `element_name`.

``` r
# Extract element with class infobox
infobox_element <- html_nodes(test_xml, css = ".infobox")

# Get tag name of infobox_element
element_name <- html_name(infobox_element)

# Print element_name
element_name
```

    ## [1] "table"

Terrific! This is the same element you selected in Chapter 4 with an
XPATH statement, and unsurprisingly it has the same tag, it’s a `table`.

## Scraping text

Of course you can get the contents of a node extracted using a CSS
selector too, with
<a href="https://www.rdocumentation.org/packages/rvest/topics/html_text">`html_text()`</a>.

Can you put the pieces together to get the page title like you did in
Chapter 4?

**Steps**

1.  The infobox HTML element is stored in `infobox_element` in your
    workspace.

    -   Use `html_node()` to extract the element from `infobox_element`
        with the CSS class `fn`.
    -   Use `html_text()` to extract the contents of `page_name`.
    -   Print `page_title`.

``` r
# Extract element with class fn
page_name <- html_node(x = infobox_element, css = ".fn")

# Get contents of page_name
page_title <- html_text(page_name)

# Print page_title
page_title
```

    ## [1] "Hadley Wickham"

Perfect! Why do you think the class for this element is `fn`? I suspect
it’s short for **f**ull **n**ame.

## Test: CSS web scraping

Take a look at the chunk of HTML being read into `test`:

``` r
test <- read_html('
   <h1 class = "main">Hello world!</h1>
   ')
```

> ## *Question*
>
> How would you extract the text `Hello world!` using `rvest` and CSS
> selectors?<br> <br> ⬜ `html_name(html_node(test, css = ".main"))`<br>
> ⬜ `html_name(html_node(test, css = "#main"))`<br> ⬜
> `html_text(html_node(test, css = "#main"))`<br> ✅
> `html_text(html_node(test, css = ".main"))`<br>

Correct! You want the contents of the tag with class `main`.

## Final case study: Introduction

Theory. Coming soon …

**1. Final case study: Introduction**

If you’re watching this, you’ve almost completed the course! Or you’ve
skipped ahead. Either way, congratulations - you’re nearly done. The
only thing left is a final exercise which puts together everything
you’ve learned so far.

**2. What we’ll cover**

We’re going to tie everything you’ve learned together by having you get
the (XML) content of a Wikipedia article out of the Wikipedia API.This
has four steps: First you retrieve the data through the API, then you
extract an infobox - which is the little metadata box in the top right
of a lot of articles, thirdly you turn the information in it into a data
frame, and finally you wrap this in a function for reproducibility.

**3. Let’s practice!**

Everything you’ve learned so far should show you nicely how to do it!
Onwards to the finish!

## API calls

Your first step is to use the Wikipedia API to get the page contents for
a specific page. We’ll continue to work with the Hadley Wickham page,
but as your last exercise, you’ll make it more general.

To get the content of a page from the Wikipedia API you need to use a
parameter based URL. The URL you want is

``` r
https://en.wikipedia.org/w/api.php?action=parse&amp;page=Hadley%20Wickham&amp;format=xml
```

which specifies that you want the parsed content (i.e the HTML) for the
“Hadley Wickham” page, and the API response should be XML.

In this exercise you’ll make the request with `GET()` and parse the XML
response with `content()`.

**Steps**

1.  We’ve already defined `base_url` for you.

    -   Create a list for the query parameters, setting
        `action = "parse"`, `page = "Hadley Wickham"` and
        `format = "xml"`.
    -   Use `GET()` to call the API by specifying `url` and `query`.
    -   Parse the response using `content()`.

``` r
# Load httr
library(httr)

# The API url
base_url <- "https://en.wikipedia.org/w/api.php"

# Set query parameters
query_params <- list(action = "parse", 
  page = "Hadley Wickham", 
  format = "xml")

# Get data from API
resp <- GET(url = base_url, query = query_params)
    
# Parse response
resp_xml <- content(resp)
```

Good work! You now have a response, but can you find the HTML for the
page in that response?

## Extracting information

Now we have a response from the API, we need to extract the HTML for the
page from it. It turns out the HTML is stored in the contents of the XML
response.<br> Take a look, by using `xml_text()` to pull out the text
from the XML response:

``` r
xml_text(resp_xml)
```

    ## [1] "<div class=\"mw-parser-output\"><div class=\"shortdescription nomobile noexcerpt noprint searchaux\" style=\"display:none\">Data scientist, developer of R software</div>\n<style data-mw-deduplicate=\"TemplateStyles:r1066479718\">.mw-parser-output .infobox-subbox{padding:0;border:none;margin:-3px;width:auto;min-width:100%;font-size:100%;clear:none;float:none;background-color:transparent}.mw-parser-output .infobox-3cols-child{margin:auto}.mw-parser-output .infobox .navbar{font-size:100%}body.skin-minerva .mw-parser-output .infobox-header,body.skin-minerva .mw-parser-output .infobox-subheader,body.skin-minerva .mw-parser-output .infobox-above,body.skin-minerva .mw-parser-output .infobox-title,body.skin-minerva .mw-parser-output .infobox-image,body.skin-minerva .mw-parser-output .infobox-full-data,body.skin-minerva .mw-parser-output .infobox-below{text-align:center}</style><table class=\"infobox biography vcard\"><tbody><tr><th colspan=\"2\" class=\"infobox-above\" style=\"font-size:125%;\"><div class=\"fn\" style=\"display:inline\">Hadley Wickham</div></th></tr><tr><td colspan=\"2\" class=\"infobox-image\"><a href=\"/wiki/File:Hadley-wickham2016-02-04.jpg\" class=\"image\"><img alt=\"Hadley-wickham2016-02-04.jpg\" src=\"//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Hadley-wickham2016-02-04.jpg/220px-Hadley-wickham2016-02-04.jpg\" decoding=\"async\" width=\"220\" height=\"330\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Hadley-wickham2016-02-04.jpg/330px-Hadley-wickham2016-02-04.jpg 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Hadley-wickham2016-02-04.jpg/440px-Hadley-wickham2016-02-04.jpg 2x\" data-file-width=\"1000\" data-file-height=\"1500\" /></a><div class=\"infobox-caption\">Hadley Wickham in 2015</div></td></tr><tr><th scope=\"row\" class=\"infobox-label\">Born</th><td class=\"infobox-data\"><div style=\"display:inline\" class=\"nickname\">Hadley Alexander Wickham</div><br /><span style=\"display:none\"> (<span class=\"bday\">1979-10-14</span>) </span>14 October 1979<span class=\"noprint ForceAgeToShow\"> (age&#160;42)</span><br /><div style=\"display:inline\" class=\"birthplace\"><a href=\"/wiki/Hamilton,_New_Zealand\" title=\"Hamilton, New Zealand\">Hamilton, New Zealand</a></div></td></tr><tr><th scope=\"row\" class=\"infobox-label\">Alma&#160;mater</th><td class=\"infobox-data\"><a href=\"/wiki/University_of_Auckland\" title=\"University of Auckland\">University of Auckland</a> (BSc, MSc)<br /><a href=\"/wiki/Iowa_State_University\" title=\"Iowa State University\">Iowa State University</a> (PhD)</td></tr><tr><th scope=\"row\" class=\"infobox-label\">Known&#160;for</th><td class=\"infobox-data\"><a href=\"/wiki/Ggplot2\" title=\"Ggplot2\">ggplot2</a><sup id=\"cite_ref-ggplot_1-0\" class=\"reference\"><a href=\"#cite_note-ggplot-1\">&#91;1&#93;</a></sup><br /><a href=\"/wiki/Tidyverse\" title=\"Tidyverse\">tidyverse</a><br /><a href=\"/wiki/R_packages\" class=\"mw-redirect\" title=\"R packages\">R packages</a></td></tr><tr><th scope=\"row\" class=\"infobox-label\">Awards</th><td class=\"infobox-data\"><div class=\"plainlist\">\n<ul><li><a href=\"/wiki/COPSS_Presidents%27_Award\" title=\"COPSS Presidents&#39; Award\">COPSS Presidents' Award</a> (2019)</li>\n<li><a href=\"/wiki/Fellow_of_the_American_Statistical_Association\" class=\"mw-redirect\" title=\"Fellow of the American Statistical Association\">Fellow of the American Statistical Association</a> (2015)</li></ul>\n</div></td></tr><tr><td colspan=\"2\" class=\"infobox-full-data\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1066479718\"/><b>Scientific career</b></td></tr><tr><th scope=\"row\" class=\"infobox-label\">Fields</th><td class=\"infobox-data category\"><div class=\"plainlist\">\n<ul><li><a href=\"/wiki/Data_science\" title=\"Data science\">Data science</a></li>\n<li><a href=\"/wiki/Data_visualization\" title=\"Data visualization\">Visualization</a></li>\n<li><a href=\"/wiki/Statistics\" title=\"Statistics\">Statistics</a><sup id=\"cite_ref-gs_2-0\" class=\"reference\"><a href=\"#cite_note-gs-2\">&#91;2&#93;</a></sup></li></ul>\n</div></td></tr><tr><th scope=\"row\" class=\"infobox-label\">Institutions</th><td class=\"infobox-data\"><div class=\"plainlist\">\n<ul><li><a href=\"/wiki/RStudio\" title=\"RStudio\">RStudio Inc.</a></li>\n<li><a href=\"/wiki/University_of_Auckland\" title=\"University of Auckland\">University of Auckland</a></li>\n<li><a href=\"/wiki/Stanford_University\" title=\"Stanford University\">Stanford University</a></li>\n<li><a href=\"/wiki/Rice_University\" title=\"Rice University\">Rice University</a></li></ul>\n</div></td></tr><tr><th scope=\"row\" class=\"infobox-label\"><a href=\"/wiki/Thesis\" title=\"Thesis\">Thesis</a></th><td class=\"infobox-data\"><a rel=\"nofollow\" class=\"external text\" href=\"https://dx.doi.org/10.31274/rtd-180813-16852\"><i>Practical tools for exploring data and models</i></a>&#160;<span style=\"font-size:97%;\">(2008)</span></td></tr><tr><th scope=\"row\" class=\"infobox-label\"><a href=\"/wiki/Doctoral_advisor\" title=\"Doctoral advisor\">Doctoral advisors</a></th><td class=\"infobox-data\"><div class=\"plainlist\">\n<ul><li><a href=\"/wiki/Dianne_Cook_(statistician)\" title=\"Dianne Cook (statistician)\">Dianne Cook</a></li>\n<li><a href=\"/wiki/Heike_Hofmann\" title=\"Heike Hofmann\">Heike Hofmann</a><sup id=\"cite_ref-mathgene_3-0\" class=\"reference\"><a href=\"#cite_note-mathgene-3\">&#91;3&#93;</a></sup></li></ul>\n</div></td></tr><tr style=\"display:none\"><td colspan=\"2\">\n</td></tr><tr><th scope=\"row\" class=\"infobox-label\">Website</th><td class=\"infobox-data\"><span class=\"url\"><a rel=\"nofollow\" class=\"external text\" href=\"http://hadley.nz/\">hadley<wbr />.nz</a></span></td></tr></tbody></table>\n<p><b>Hadley Alexander Wickham</b> (born 14 October 1979) is a <a href=\"/wiki/Statistician\" title=\"Statistician\">statistician</a> from <a href=\"/wiki/New_Zealand\" title=\"New Zealand\">New Zealand</a> and <a href=\"/wiki/Chief_scientific_officer\" title=\"Chief scientific officer\">Chief Scientist</a> at <a href=\"/wiki/RStudio\" title=\"RStudio\">RStudio Inc.</a><sup id=\"cite_ref-gs_2-1\" class=\"reference\"><a href=\"#cite_note-gs-2\">&#91;2&#93;</a></sup><sup id=\"cite_ref-4\" class=\"reference\"><a href=\"#cite_note-4\">&#91;4&#93;</a></sup><sup id=\"cite_ref-hz_5-0\" class=\"reference\"><a href=\"#cite_note-hz-5\">&#91;5&#93;</a></sup><sup id=\"cite_ref-6\" class=\"reference\"><a href=\"#cite_note-6\">&#91;6&#93;</a></sup> and an <a href=\"/wiki/Professors_in_the_United_States#Adjunct_professor\" title=\"Professors in the United States\">adjunct</a> <a href=\"/wiki/Professor\" title=\"Professor\">Professor</a> of statistics at the <a href=\"/wiki/University_of_Auckland\" title=\"University of Auckland\">University of Auckland</a>,<sup id=\"cite_ref-University_of_Auckland_Adjunct_Professorship_-_Dr_Hadley_Alexander_Wickham_-_Honorary,_Academic_7-0\" class=\"reference\"><a href=\"#cite_note-University_of_Auckland_Adjunct_Professorship_-_Dr_Hadley_Alexander_Wickham_-_Honorary,_Academic-7\">&#91;7&#93;</a></sup> <a href=\"/wiki/Stanford_University\" title=\"Stanford University\">Stanford University</a>,<sup id=\"cite_ref-Stanford_University_-_Adjunct_Professor,_Institute_for_Computational_and_Mathematical_Engineering_(ICME)_8-0\" class=\"reference\"><a href=\"#cite_note-Stanford_University_-_Adjunct_Professor,_Institute_for_Computational_and_Mathematical_Engineering_(ICME)-8\">&#91;8&#93;</a></sup> and <a href=\"/wiki/Rice_University\" title=\"Rice University\">Rice University</a>.<sup id=\"cite_ref-about_9-0\" class=\"reference\"><a href=\"#cite_note-about-9\">&#91;9&#93;</a></sup> He is best known for his development of <a href=\"/wiki/Open-source_software\" title=\"Open-source software\">open-source software</a> for the <a href=\"/wiki/R_(programming_language)\" title=\"R (programming language)\">R statistical programming language</a> for <a href=\"/wiki/Data_visualisation\" class=\"mw-redirect\" title=\"Data visualisation\">data visualisation</a>, including <a href=\"/wiki/Ggplot2\" title=\"Ggplot2\">ggplot2</a>,<sup id=\"cite_ref-ggplot_1-1\" class=\"reference\"><a href=\"#cite_note-ggplot-1\">&#91;1&#93;</a></sup> and other <a href=\"/wiki/Tidyverse\" title=\"Tidyverse\">tidyverse</a> packages, which support a <a href=\"/wiki/Tidy_data\" title=\"Tidy data\">tidy data</a> approach to <a href=\"/wiki/Data_science\" title=\"Data science\">data science</a>.<sup id=\"cite_ref-10\" class=\"reference\"><a href=\"#cite_note-10\">&#91;10&#93;</a></sup><sup id=\"cite_ref-11\" class=\"reference\"><a href=\"#cite_note-11\">&#91;11&#93;</a></sup><sup id=\"cite_ref-metamarkets_12-0\" class=\"reference\"><a href=\"#cite_note-metamarkets-12\">&#91;12&#93;</a></sup>\n</p>\n<div id=\"toc\" class=\"toc\" role=\"navigation\" aria-labelledby=\"mw-toc-heading\"><input type=\"checkbox\" role=\"button\" id=\"toctogglecheckbox\" class=\"toctogglecheckbox\" style=\"display:none\" /><div class=\"toctitle\" lang=\"en\" dir=\"ltr\"><h2 id=\"mw-toc-heading\">Contents</h2><span class=\"toctogglespan\"><label class=\"toctogglelabel\" for=\"toctogglecheckbox\"></label></span></div>\n<ul>\n<li class=\"toclevel-1 tocsection-1\"><a href=\"#Education\"><span class=\"tocnumber\">1</span> <span class=\"toctext\">Education</span></a></li>\n<li class=\"toclevel-1 tocsection-2\"><a href=\"#Career_and_research\"><span class=\"tocnumber\">2</span> <span class=\"toctext\">Career and research</span></a>\n<ul>\n<li class=\"toclevel-2 tocsection-3\"><a href=\"#Honors_and_awards\"><span class=\"tocnumber\">2.1</span> <span class=\"toctext\">Honors and awards</span></a></li>\n<li class=\"toclevel-2 tocsection-4\"><a href=\"#Publications\"><span class=\"tocnumber\">2.2</span> <span class=\"toctext\">Publications</span></a></li>\n</ul>\n</li>\n<li class=\"toclevel-1 tocsection-5\"><a href=\"#Personal_life\"><span class=\"tocnumber\">3</span> <span class=\"toctext\">Personal life</span></a></li>\n<li class=\"toclevel-1 tocsection-6\"><a href=\"#References\"><span class=\"tocnumber\">4</span> <span class=\"toctext\">References</span></a></li>\n<li class=\"toclevel-1 tocsection-7\"><a href=\"#External_links\"><span class=\"tocnumber\">5</span> <span class=\"toctext\">External links</span></a></li>\n</ul>\n</div>\n\n<h2><span class=\"mw-headline\" id=\"Education\">Education</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a href=\"/w/index.php?title=Hadley_Wickham&amp;action=edit&amp;section=1\" title=\"Edit section: Education\">edit</a><span class=\"mw-editsection-bracket\">]</span></span></h2>\n<p>Wickham received a Bachelors degree in <a href=\"/wiki/Human_Biology\" class=\"mw-redirect\" title=\"Human Biology\">Human Biology</a> and a masters degree in statistics at the <a href=\"/wiki/University_of_Auckland\" title=\"University of Auckland\">University of Auckland</a> in 1999–2004 and his <a href=\"/wiki/PhD\" class=\"mw-redirect\" title=\"PhD\">PhD</a> at <a href=\"/wiki/Iowa_State_University\" title=\"Iowa State University\">Iowa State University</a> in 2008 supervised by <a href=\"/wiki/Di_Cook\" class=\"mw-redirect\" title=\"Di Cook\">Di Cook</a> and <a href=\"/wiki/Heike_Hofmann\" title=\"Heike Hofmann\">Heike Hofmann</a>.<sup id=\"cite_ref-mathgene_3-1\" class=\"reference\"><a href=\"#cite_note-mathgene-3\">&#91;3&#93;</a></sup><sup id=\"cite_ref-13\" class=\"reference\"><a href=\"#cite_note-13\">&#91;13&#93;</a></sup>\n</p>\n<h2><span class=\"mw-headline\" id=\"Career_and_research\">Career and research</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a href=\"/w/index.php?title=Hadley_Wickham&amp;action=edit&amp;section=2\" title=\"Edit section: Career and research\">edit</a><span class=\"mw-editsection-bracket\">]</span></span></h2>\n<p>Wickham is a prominent and active member of the <a href=\"/wiki/R_(programming_language)\" title=\"R (programming language)\">R</a> user community and has developed several notable and widely used packages including <a href=\"/wiki/Ggplot2\" title=\"Ggplot2\">ggplot2</a>, plyr, dplyr, and reshape2.<sup id=\"cite_ref-about_9-1\" class=\"reference\"><a href=\"#cite_note-about-9\">&#91;9&#93;</a></sup><sup id=\"cite_ref-14\" class=\"reference\"><a href=\"#cite_note-14\">&#91;14&#93;</a></sup> Wickham's data analysis packages for R are collectively known as the <a href=\"/wiki/Tidyverse\" title=\"Tidyverse\">tidyverse</a>.<sup id=\"cite_ref-15\" class=\"reference\"><a href=\"#cite_note-15\">&#91;15&#93;</a></sup> According to Wickham's <a href=\"/wiki/Tidy_data\" title=\"Tidy data\">tidy data</a> approach, each <a href=\"/wiki/Variable_(mathematics)\" title=\"Variable (mathematics)\">variable</a> should be a <a href=\"/wiki/Column_(database)\" title=\"Column (database)\">column</a>, each observation should be a <a href=\"/wiki/Row_(database)\" title=\"Row (database)\">row</a>, and each type of observational unit should be a <a href=\"/wiki/Table_(database)\" title=\"Table (database)\">table</a>.<sup id=\"cite_ref-16\" class=\"reference\"><a href=\"#cite_note-16\">&#91;16&#93;</a></sup>\n</p>\n<h3><span class=\"mw-headline\" id=\"Honors_and_awards\">Honors and awards</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a href=\"/w/index.php?title=Hadley_Wickham&amp;action=edit&amp;section=3\" title=\"Edit section: Honors and awards\">edit</a><span class=\"mw-editsection-bracket\">]</span></span></h3>\n<p>In 2006 he was awarded the <a href=\"/wiki/John_Chambers_(statistician)\" title=\"John Chambers (statistician)\">John Chambers</a> Award for Statistical Computing for his work developing tools for data reshaping and visualisation.<sup id=\"cite_ref-17\" class=\"reference\"><a href=\"#cite_note-17\">&#91;17&#93;</a></sup> Wickham was named a Fellow by the <a href=\"/wiki/American_Statistical_Association\" title=\"American Statistical Association\">American Statistical Association</a> in 2015 for \"pivotal contributions to statistical practice through innovative and pioneering research in statistical graphics and computing\".<sup id=\"cite_ref-asa-fellow_18-0\" class=\"reference\"><a href=\"#cite_note-asa-fellow-18\">&#91;18&#93;</a></sup> Wickham was awarded the international <a href=\"/wiki/COPSS_Presidents%27_Award\" title=\"COPSS Presidents&#39; Award\">COPSS Presidents' Award</a> in 2019 for \"influential work in statistical computing, visualisation, graphics, and data analysis\" including \"making statistical thinking and computing accessible to a large audience\".<sup id=\"cite_ref-19\" class=\"reference\"><a href=\"#cite_note-19\">&#91;19&#93;</a></sup>\n</p>\n<h3><span class=\"mw-headline\" id=\"Publications\">Publications</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a href=\"/w/index.php?title=Hadley_Wickham&amp;action=edit&amp;section=4\" title=\"Edit section: Publications\">edit</a><span class=\"mw-editsection-bracket\">]</span></span></h3>\n<p>Wickhams publications<sup id=\"cite_ref-gs_2-2\" class=\"reference\"><a href=\"#cite_note-gs-2\">&#91;2&#93;</a></sup> include:\n</p>\n<ul><li><style data-mw-deduplicate=\"TemplateStyles:r1067248974\">.mw-parser-output cite.citation{font-style:inherit;word-wrap:break-word}.mw-parser-output .citation q{quotes:\"\\\"\"\"\\\"\"\"'\"\"'\"}.mw-parser-output .citation:target{background-color:rgba(0,127,255,0.133)}.mw-parser-output .id-lock-free a,.mw-parser-output .citation .cs1-lock-free a{background:linear-gradient(transparent,transparent),url(\"//upload.wikimedia.org/wikipedia/commons/6/65/Lock-green.svg\")right 0.1em center/9px no-repeat}.mw-parser-output .id-lock-limited a,.mw-parser-output .id-lock-registration a,.mw-parser-output .citation .cs1-lock-limited a,.mw-parser-output .citation .cs1-lock-registration a{background:linear-gradient(transparent,transparent),url(\"//upload.wikimedia.org/wikipedia/commons/d/d6/Lock-gray-alt-2.svg\")right 0.1em center/9px no-repeat}.mw-parser-output .id-lock-subscription a,.mw-parser-output .citation .cs1-lock-subscription a{background:linear-gradient(transparent,transparent),url(\"//upload.wikimedia.org/wikipedia/commons/a/aa/Lock-red-alt-2.svg\")right 0.1em center/9px no-repeat}.mw-parser-output .cs1-ws-icon a{background:linear-gradient(transparent,transparent),url(\"//upload.wikimedia.org/wikipedia/commons/4/4c/Wikisource-logo.svg\")right 0.1em center/12px no-repeat}.mw-parser-output .cs1-code{color:inherit;background:inherit;border:none;padding:inherit}.mw-parser-output .cs1-hidden-error{display:none;color:#d33}.mw-parser-output .cs1-visible-error{color:#d33}.mw-parser-output .cs1-maint{display:none;color:#3a3;margin-left:0.3em}.mw-parser-output .cs1-format{font-size:95%}.mw-parser-output .cs1-kern-left{padding-left:0.2em}.mw-parser-output .cs1-kern-right{padding-right:0.2em}.mw-parser-output .citation .mw-selflink{font-weight:inherit}</style><cite id=\"CITEREFWickhamGrolemund2017\" class=\"citation book cs1\">Wickham, Hadley; Grolemund, Garrett (2017). <a rel=\"nofollow\" class=\"external text\" href=\"http://r4ds.had.co.nz/\"><i>R for Data Science&#160;: Import, Tidy, Transform, Visualize, and Model Data</i></a>. Sebastopol, CA: O'Reilly Media. <a href=\"/wiki/ISBN_(identifier)\" class=\"mw-redirect\" title=\"ISBN (identifier)\">ISBN</a>&#160;<a href=\"/wiki/Special:BookSources/978-1491910399\" title=\"Special:BookSources/978-1491910399\"><bdi>978-1491910399</bdi></a>. <a href=\"/wiki/OCLC_(identifier)\" class=\"mw-redirect\" title=\"OCLC (identifier)\">OCLC</a>&#160;<a rel=\"nofollow\" class=\"external text\" href=\"//www.worldcat.org/oclc/968213225\">968213225</a>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Abook&amp;rft.genre=book&amp;rft.btitle=R+for+Data+Science+%3A+Import%2C+Tidy%2C+Transform%2C+Visualize%2C+and+Model+Data&amp;rft.place=Sebastopol%2C+CA&amp;rft.pub=O%27Reilly+Media&amp;rft.date=2017&amp;rft_id=info%3Aoclcnum%2F968213225&amp;rft.isbn=978-1491910399&amp;rft.aulast=Wickham&amp;rft.aufirst=Hadley&amp;rft.au=Grolemund%2C+Garrett&amp;rft_id=http%3A%2F%2Fr4ds.had.co.nz%2F&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></li>\n<li><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite id=\"CITEREFWickham,_Hadley2015\" class=\"citation book cs1\">Wickham, Hadley (2015). <i>R Packages</i>. Sebastopol, CA: O'Reilly Media, Inc. <a href=\"/wiki/ISBN_(identifier)\" class=\"mw-redirect\" title=\"ISBN (identifier)\">ISBN</a>&#160;<a href=\"/wiki/Special:BookSources/978-1491910597\" title=\"Special:BookSources/978-1491910597\"><bdi>978-1491910597</bdi></a>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Abook&amp;rft.genre=book&amp;rft.btitle=R+Packages&amp;rft.place=Sebastopol%2C+CA&amp;rft.pub=O%27Reilly+Media%2C+Inc&amp;rft.date=2015&amp;rft.isbn=978-1491910597&amp;rft.au=Wickham%2C+Hadley&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></li>\n<li><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite id=\"CITEREFWickham,_Hadley2014\" class=\"citation book cs1\">Wickham, Hadley (2014). <i>Advanced R</i>. New York: Chapman &amp; Hall/CRC The R Series. <a href=\"/wiki/ISBN_(identifier)\" class=\"mw-redirect\" title=\"ISBN (identifier)\">ISBN</a>&#160;<a href=\"/wiki/Special:BookSources/978-1466586963\" title=\"Special:BookSources/978-1466586963\"><bdi>978-1466586963</bdi></a>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Abook&amp;rft.genre=book&amp;rft.btitle=Advanced+R&amp;rft.place=New+York&amp;rft.pub=Chapman+%26+Hall%2FCRC+The+R+Series&amp;rft.date=2014&amp;rft.isbn=978-1466586963&amp;rft.au=Wickham%2C+Hadley&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></li>\n<li><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite id=\"CITEREFWickham2011\" class=\"citation journal cs1\">Wickham, Hadley (2011). <a rel=\"nofollow\" class=\"external text\" href=\"https://doi.org/10.18637%2Fjss.v040.i01\">\"The split-apply-combine strategy for data analysis\"</a>. <i>Journal of Statistical Software</i>. <b>40</b> (1): 1–29. <a href=\"/wiki/Doi_(identifier)\" class=\"mw-redirect\" title=\"Doi (identifier)\">doi</a>:<span class=\"cs1-lock-free\" title=\"Freely accessible\"><a rel=\"nofollow\" class=\"external text\" href=\"https://doi.org/10.18637%2Fjss.v040.i01\">10.18637/jss.v040.i01</a></span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=article&amp;rft.jtitle=Journal+of+Statistical+Software&amp;rft.atitle=The+split-apply-combine+strategy+for+data+analysis&amp;rft.volume=40&amp;rft.issue=1&amp;rft.pages=1-29&amp;rft.date=2011&amp;rft_id=info%3Adoi%2F10.18637%2Fjss.v040.i01&amp;rft.aulast=Wickham&amp;rft.aufirst=Hadley&amp;rft_id=%2F%2Fdoi.org%2F10.18637%252Fjss.v040.i01&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></li>\n<li><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite id=\"CITEREFWickham2010\" class=\"citation journal cs1\">Wickham, Hadley (2010). \"A layered grammar of graphics\". <i>Journal of Computational and Graphical Statistics</i>. <b>19</b> (1): 3–28. <a href=\"/wiki/Doi_(identifier)\" class=\"mw-redirect\" title=\"Doi (identifier)\">doi</a>:<a rel=\"nofollow\" class=\"external text\" href=\"https://doi.org/10.1198%2Fjcgs.2009.07098\">10.1198/jcgs.2009.07098</a>. <a href=\"/wiki/S2CID_(identifier)\" class=\"mw-redirect\" title=\"S2CID (identifier)\">S2CID</a>&#160;<a rel=\"nofollow\" class=\"external text\" href=\"https://api.semanticscholar.org/CorpusID:58971746\">58971746</a>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=article&amp;rft.jtitle=Journal+of+Computational+and+Graphical+Statistics&amp;rft.atitle=A+layered+grammar+of+graphics&amp;rft.volume=19&amp;rft.issue=1&amp;rft.pages=3-28&amp;rft.date=2010&amp;rft_id=info%3Adoi%2F10.1198%2Fjcgs.2009.07098&amp;rft_id=https%3A%2F%2Fapi.semanticscholar.org%2FCorpusID%3A58971746%23id-name%3DS2CID&amp;rft.aulast=Wickham&amp;rft.aufirst=Hadley&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></li>\n<li><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite id=\"CITEREFWickham2010\" class=\"citation journal cs1\">Wickham, Hadley (2010). <a rel=\"nofollow\" class=\"external text\" href=\"https://doi.org/10.32614%2FRJ-2010-012\">\"stringr: modern, consistent string processing\"</a>. <i><a href=\"/wiki/The_R_Journal\" title=\"The R Journal\">The R Journal</a></i>. <b>2</b> (2): 3–28. <a href=\"/wiki/Doi_(identifier)\" class=\"mw-redirect\" title=\"Doi (identifier)\">doi</a>:<span class=\"cs1-lock-free\" title=\"Freely accessible\"><a rel=\"nofollow\" class=\"external text\" href=\"https://doi.org/10.32614%2FRJ-2010-012\">10.32614/RJ-2010-012</a></span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=article&amp;rft.jtitle=The+R+Journal&amp;rft.atitle=stringr%3A+modern%2C+consistent+string+processing&amp;rft.volume=2&amp;rft.issue=2&amp;rft.pages=3-28&amp;rft.date=2010&amp;rft_id=info%3Adoi%2F10.32614%2FRJ-2010-012&amp;rft.aulast=Wickham&amp;rft.aufirst=Hadley&amp;rft_id=%2F%2Fdoi.org%2F10.32614%252FRJ-2010-012&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></li>\n<li><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite id=\"CITEREFWickham,_Hadley2009\" class=\"citation book cs1\">Wickham, Hadley (2009). <i>ggplot2: Elegant Graphics for Data Analysis (Use R!)</i>. New York: Springer. <a href=\"/wiki/ISBN_(identifier)\" class=\"mw-redirect\" title=\"ISBN (identifier)\">ISBN</a>&#160;<a href=\"/wiki/Special:BookSources/978-0387981406\" title=\"Special:BookSources/978-0387981406\"><bdi>978-0387981406</bdi></a>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Abook&amp;rft.genre=book&amp;rft.btitle=ggplot2%3A+Elegant+Graphics+for+Data+Analysis+%28Use+R%21%29&amp;rft.place=New+York&amp;rft.pub=Springer&amp;rft.date=2009&amp;rft.isbn=978-0387981406&amp;rft.au=Wickham%2C+Hadley&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span><sup id=\"cite_ref-ggplot_1-2\" class=\"reference\"><a href=\"#cite_note-ggplot-1\">&#91;1&#93;</a></sup></li>\n<li><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite id=\"CITEREFWickham2007\" class=\"citation journal cs1\">Wickham, Hadley (2007). <a rel=\"nofollow\" class=\"external text\" href=\"https://doi.org/10.18637%2Fjss.v021.i12\">\"Reshaping data with the reshape package\"</a>. <i>Journal of Statistical Software</i>. <b>21</b> (12): 1–20. <a href=\"/wiki/Doi_(identifier)\" class=\"mw-redirect\" title=\"Doi (identifier)\">doi</a>:<span class=\"cs1-lock-free\" title=\"Freely accessible\"><a rel=\"nofollow\" class=\"external text\" href=\"https://doi.org/10.18637%2Fjss.v021.i12\">10.18637/jss.v021.i12</a></span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=article&amp;rft.jtitle=Journal+of+Statistical+Software&amp;rft.atitle=Reshaping+data+with+the+reshape+package&amp;rft.volume=21&amp;rft.issue=12&amp;rft.pages=1-20&amp;rft.date=2007&amp;rft_id=info%3Adoi%2F10.18637%2Fjss.v021.i12&amp;rft.aulast=Wickham&amp;rft.aufirst=Hadley&amp;rft_id=%2F%2Fdoi.org%2F10.18637%252Fjss.v021.i12&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></li></ul>\n<h2><span class=\"mw-headline\" id=\"Personal_life\">Personal life</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a href=\"/w/index.php?title=Hadley_Wickham&amp;action=edit&amp;section=5\" title=\"Edit section: Personal life\">edit</a><span class=\"mw-editsection-bracket\">]</span></span></h2>\n<p>His sister Charlotte Wickham is also a statistician.<sup id=\"cite_ref-hz_5-1\" class=\"reference\"><a href=\"#cite_note-hz-5\">&#91;5&#93;</a></sup>\n</p>\n<h2><span class=\"mw-headline\" id=\"References\">References</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a href=\"/w/index.php?title=Hadley_Wickham&amp;action=edit&amp;section=6\" title=\"Edit section: References\">edit</a><span class=\"mw-editsection-bracket\">]</span></span></h2>\n<style data-mw-deduplicate=\"TemplateStyles:r1011085734\">.mw-parser-output .reflist{font-size:90%;margin-bottom:0.5em;list-style-type:decimal}.mw-parser-output .reflist .references{font-size:100%;margin-bottom:0;list-style-type:inherit}.mw-parser-output .reflist-columns-2{column-width:30em}.mw-parser-output .reflist-columns-3{column-width:25em}.mw-parser-output .reflist-columns{margin-top:0.3em}.mw-parser-output .reflist-columns ol{margin-top:0}.mw-parser-output .reflist-columns li{page-break-inside:avoid;break-inside:avoid-column}.mw-parser-output .reflist-upper-alpha{list-style-type:upper-alpha}.mw-parser-output .reflist-upper-roman{list-style-type:upper-roman}.mw-parser-output .reflist-lower-alpha{list-style-type:lower-alpha}.mw-parser-output .reflist-lower-greek{list-style-type:lower-greek}.mw-parser-output .reflist-lower-roman{list-style-type:lower-roman}</style><div class=\"reflist\">\n<div class=\"mw-references-wrap mw-references-columns\"><ol class=\"references\">\n<li id=\"cite_note-ggplot-1\"><span class=\"mw-cite-backlink\">^ <a href=\"#cite_ref-ggplot_1-0\"><sup><i><b>a</b></i></sup></a> <a href=\"#cite_ref-ggplot_1-1\"><sup><i><b>b</b></i></sup></a> <a href=\"#cite_ref-ggplot_1-2\"><sup><i><b>c</b></i></sup></a></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite id=\"CITEREFWickham2011\" class=\"citation journal cs1\">Wickham, Hadley (2011). \"ggplot2\". <i>Wiley Interdisciplinary Reviews: Computational Statistics</i>. <b>3</b> (2): 180–185. <a href=\"/wiki/Doi_(identifier)\" class=\"mw-redirect\" title=\"Doi (identifier)\">doi</a>:<a rel=\"nofollow\" class=\"external text\" href=\"https://doi.org/10.1002%2Fwics.147\">10.1002/wics.147</a>. <a href=\"/wiki/ISSN_(identifier)\" class=\"mw-redirect\" title=\"ISSN (identifier)\">ISSN</a>&#160;<a rel=\"nofollow\" class=\"external text\" href=\"//www.worldcat.org/issn/1939-5108\">1939-5108</a>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=article&amp;rft.jtitle=Wiley+Interdisciplinary+Reviews%3A+Computational+Statistics&amp;rft.atitle=ggplot2&amp;rft.volume=3&amp;rft.issue=2&amp;rft.pages=180-185&amp;rft.date=2011&amp;rft_id=info%3Adoi%2F10.1002%2Fwics.147&amp;rft.issn=19395108&amp;rft.aulast=Wickham&amp;rft.aufirst=Hadley&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-gs-2\"><span class=\"mw-cite-backlink\">^ <a href=\"#cite_ref-gs_2-0\"><sup><i><b>a</b></i></sup></a> <a href=\"#cite_ref-gs_2-1\"><sup><i><b>b</b></i></sup></a> <a href=\"#cite_ref-gs_2-2\"><sup><i><b>c</b></i></sup></a></span> <span class=\"reference-text\"><a rel=\"nofollow\" class=\"external text\" href=\"https://scholar.google.com/citations?user=YA43PbsAAAAJ\">Hadley Wickham</a> publications indexed by <a href=\"/wiki/Google_Scholar\" title=\"Google Scholar\">Google Scholar</a> <a href=\"https://www.wikidata.org/wiki/Q16251925#P1960\" title=\"Edit this at Wikidata\"><img alt=\"Edit this at Wikidata\" src=\"//upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/10px-OOjs_UI_icon_edit-ltr-progressive.svg.png\" decoding=\"async\" width=\"10\" height=\"10\" style=\"vertical-align: text-top\" class=\"noprint\" srcset=\"//upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/15px-OOjs_UI_icon_edit-ltr-progressive.svg.png 1.5x, //upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/20px-OOjs_UI_icon_edit-ltr-progressive.svg.png 2x\" data-file-width=\"20\" data-file-height=\"20\" /></a></span>\n</li>\n<li id=\"cite_note-mathgene-3\"><span class=\"mw-cite-backlink\">^ <a href=\"#cite_ref-mathgene_3-0\"><sup><i><b>a</b></i></sup></a> <a href=\"#cite_ref-mathgene_3-1\"><sup><i><b>b</b></i></sup></a></span> <span class=\"reference-text\"><a rel=\"nofollow\" class=\"external text\" href=\"https://mathgenealogy.org/id.php?id=145799\">Hadley Wickham</a> at the <a href=\"/wiki/Mathematics_Genealogy_Project\" title=\"Mathematics Genealogy Project\">Mathematics Genealogy Project</a> <a href=\"https://www.wikidata.org/wiki/Q16251925#P549\" title=\"Edit this at Wikidata\"><img alt=\"Edit this at Wikidata\" src=\"//upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/10px-OOjs_UI_icon_edit-ltr-progressive.svg.png\" decoding=\"async\" width=\"10\" height=\"10\" style=\"vertical-align: text-top\" class=\"noprint\" srcset=\"//upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/15px-OOjs_UI_icon_edit-ltr-progressive.svg.png 1.5x, //upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/20px-OOjs_UI_icon_edit-ltr-progressive.svg.png 2x\" data-file-width=\"20\" data-file-height=\"20\" /></a></span>\n</li>\n<li id=\"cite_note-4\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-4\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite class=\"citation web cs1\"><a rel=\"nofollow\" class=\"external text\" href=\"http://washstat.org/newsletters/wss1310.shtml\">\"Washington Statistical Society October 2013 Newsletter\"</a>. Washington Statistical Society<span class=\"reference-accessdate\">. Retrieved <span class=\"nowrap\">2014-02-12</span></span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Abook&amp;rft.genre=unknown&amp;rft.btitle=Washington+Statistical+Society+October+2013+Newsletter&amp;rft.pub=Washington+Statistical+Society&amp;rft_id=http%3A%2F%2Fwashstat.org%2Fnewsletters%2Fwss1310.shtml&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-hz-5\"><span class=\"mw-cite-backlink\">^ <a href=\"#cite_ref-hz_5-0\"><sup><i><b>a</b></i></sup></a> <a href=\"#cite_ref-hz_5-1\"><sup><i><b>b</b></i></sup></a></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite class=\"citation web cs1\"><a rel=\"nofollow\" class=\"external text\" href=\"http://hadley.nz/\">\"Hadley Wickham\"</a>. <i>hadley.nz</i>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=unknown&amp;rft.jtitle=hadley.nz&amp;rft.atitle=Hadley+Wickham&amp;rft_id=http%3A%2F%2Fhadley.nz%2F&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-6\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-6\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite class=\"citation web cs1\"><a rel=\"nofollow\" class=\"external text\" href=\"https://web.archive.org/web/20140222145202/http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7\">\"60+ R resources to improve your data skills ( - Software )\"</a>. News.idg.no. Archived from <a rel=\"nofollow\" class=\"external text\" href=\"http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7\">the original</a> on 2014-02-22<span class=\"reference-accessdate\">. Retrieved <span class=\"nowrap\">2014-02-12</span></span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Abook&amp;rft.genre=unknown&amp;rft.btitle=60%2B+R+resources+to+improve+your+data+skills+%28+-+Software+%29&amp;rft.pub=News.idg.no&amp;rft_id=http%3A%2F%2Fnews.idg.no%2Fcw%2Fart.cfm%3Fid%3DF66B12BB-D13E-94B0-DAA22F5AB01BEFE7&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-University_of_Auckland_Adjunct_Professorship_-_Dr_Hadley_Alexander_Wickham_-_Honorary,_Academic-7\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-University_of_Auckland_Adjunct_Professorship_-_Dr_Hadley_Alexander_Wickham_-_Honorary,_Academic_7-0\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite class=\"citation web cs1\"><a rel=\"nofollow\" class=\"external text\" href=\"https://www.stat.auckland.ac.nz/people/hwic004\">\"University of Auckland\"</a><span class=\"reference-accessdate\">. Retrieved <span class=\"nowrap\">2017-09-03</span></span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Abook&amp;rft.genre=unknown&amp;rft.btitle=University+of+Auckland&amp;rft_id=https%3A%2F%2Fwww.stat.auckland.ac.nz%2Fpeople%2Fhwic004&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-Stanford_University_-_Adjunct_Professor,_Institute_for_Computational_and_Mathematical_Engineering_(ICME)-8\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-Stanford_University_-_Adjunct_Professor,_Institute_for_Computational_and_Mathematical_Engineering_(ICME)_8-0\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite class=\"citation web cs1\"><a rel=\"nofollow\" class=\"external text\" href=\"https://profiles.stanford.edu/hadley-wickham\">\"Hadley Wickham's Profile - Stanford Profiles\"</a><span class=\"reference-accessdate\">. Retrieved <span class=\"nowrap\">2017-09-03</span></span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Abook&amp;rft.genre=unknown&amp;rft.btitle=Hadley+Wickham%27s+Profile+-+Stanford+Profiles&amp;rft_id=https%3A%2F%2Fprofiles.stanford.edu%2Fhadley-wickham&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span><sup class=\"noprint Inline-Template\"><span style=\"white-space: nowrap;\">&#91;<i><a href=\"/wiki/Wikipedia:Link_rot\" title=\"Wikipedia:Link rot\"><span title=\"&#160;Dead link tagged July 2021\">dead link</span></a></i>&#93;</span></sup></span>\n</li>\n<li id=\"cite_note-about-9\"><span class=\"mw-cite-backlink\">^ <a href=\"#cite_ref-about_9-0\"><sup><i><b>a</b></i></sup></a> <a href=\"#cite_ref-about_9-1\"><sup><i><b>b</b></i></sup></a></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite class=\"citation web cs1\"><a rel=\"nofollow\" class=\"external text\" href=\"http://www.rstudio.com/about/\">\"About - RStudio\"</a><span class=\"reference-accessdate\">. Retrieved <span class=\"nowrap\">2014-08-13</span></span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Abook&amp;rft.genre=unknown&amp;rft.btitle=About+-+RStudio&amp;rft_id=http%3A%2F%2Fwww.rstudio.com%2Fabout%2F&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-10\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-10\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite id=\"CITEREFKopf2019\" class=\"citation web cs1\">Kopf, Dan (August 17, 2019). <a rel=\"nofollow\" class=\"external text\" href=\"https://qz.com/1661487/hadley-wickham-on-the-future-of-r-python-and-the-tidyverse/\">\"What's next for the popular programming language R?\"</a>. <i>qz.com</i>. Quartz<span class=\"reference-accessdate\">. Retrieved <span class=\"nowrap\">August 18,</span> 2019</span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=unknown&amp;rft.jtitle=qz.com&amp;rft.atitle=What%27s+next+for+the+popular+programming+language+R%3F&amp;rft.date=2019-08-17&amp;rft.aulast=Kopf&amp;rft.aufirst=Dan&amp;rft_id=https%3A%2F%2Fqz.com%2F1661487%2Fhadley-wickham-on-the-future-of-r-python-and-the-tidyverse%2F&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-11\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-11\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite class=\"citation web cs1\"><a rel=\"nofollow\" class=\"external text\" href=\"https://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.html\">\"The R-Files: Hadley Wickham\"</a>. <i>Revolutions</i>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=unknown&amp;rft.jtitle=Revolutions&amp;rft.atitle=The+R-Files%3A+Hadley+Wickham&amp;rft_id=https%3A%2F%2Fblog.revolutionanalytics.com%2F2010%2F09%2Fthe-r-files-hadley-wickham.html&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-metamarkets-12\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-metamarkets_12-0\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite id=\"CITEREFHyman2012\" class=\"citation web cs1\">Hyman, Rachel (2012). <a rel=\"nofollow\" class=\"external text\" href=\"http://metamarkets.com/2012/profile-of-hadley-wickham-data-scientist-in-residence-at-metamarkets/\">\"Profile of Hadley Wickham, Data Scientist in Residence at Metamarkets\"</a>. <i>metamarkets.com</i>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=unknown&amp;rft.jtitle=metamarkets.com&amp;rft.atitle=Profile+of+Hadley+Wickham%2C+Data+Scientist+in+Residence+at+Metamarkets&amp;rft.date=2012&amp;rft.aulast=Hyman&amp;rft.aufirst=Rachel&amp;rft_id=http%3A%2F%2Fmetamarkets.com%2F2012%2Fprofile-of-hadley-wickham-data-scientist-in-residence-at-metamarkets%2F&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-13\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-13\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite id=\"CITEREFWickham2008\" class=\"citation thesis cs1\">Wickham, Hadley Alexander (2008). <a rel=\"nofollow\" class=\"external text\" href=\"https://lib.dr.iastate.edu/rtd/15639/\"><i>Practical tools for exploring data and models</i></a>. <i>iastate.edu</i> (PhD). Iowa State University. <a href=\"/wiki/Doi_(identifier)\" class=\"mw-redirect\" title=\"Doi (identifier)\">doi</a>:<span class=\"cs1-lock-free\" title=\"Freely accessible\"><a rel=\"nofollow\" class=\"external text\" href=\"https://doi.org/10.31274%2Frtd-180813-16852\">10.31274/rtd-180813-16852</a></span>. <a href=\"/wiki/OCLC_(identifier)\" class=\"mw-redirect\" title=\"OCLC (identifier)\">OCLC</a>&#160;<a rel=\"nofollow\" class=\"external text\" href=\"//www.worldcat.org/oclc/247410260\">247410260</a>. <link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><a href=\"/wiki/ProQuest_(identifier)\" class=\"mw-redirect\" title=\"ProQuest (identifier)\">ProQuest</a>&#160;<a rel=\"nofollow\" class=\"external text\" href=\"https://search.proquest.com/docview/194000416\">194000416</a><span class=\"reference-accessdate\">. Retrieved <span class=\"nowrap\">2019-02-14</span></span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Adissertation&amp;rft.title=Practical+tools+for+exploring+data+and+models&amp;rft.inst=Iowa+State+University&amp;rft.date=2008&amp;rft_id=info%3Aoclcnum%2F247410260&amp;rft_id=info%3Adoi%2F10.31274%2Frtd-180813-16852&amp;rft.aulast=Wickham&amp;rft.aufirst=Hadley+Alexander&amp;rft_id=https%3A%2F%2Flib.dr.iastate.edu%2Frtd%2F15639%2F&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-14\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-14\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite class=\"citation web cs1\"><a rel=\"nofollow\" class=\"external text\" href=\"http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/\">\"Top 100 R Packages for 2013 (Jan-May)!\"</a>. R-statistics blog. 13 June 2013<span class=\"reference-accessdate\">. Retrieved <span class=\"nowrap\">2014-08-12</span></span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Abook&amp;rft.genre=unknown&amp;rft.btitle=Top+100+R+Packages+for+2013+%28Jan-May%29%21&amp;rft.pub=R-statistics+blog&amp;rft.date=2013-06-13&amp;rft_id=http%3A%2F%2Fwww.r-statistics.com%2F2013%2F06%2Ftop-100-r-packages-for-2013-jan-may%2F&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-15\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-15\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite class=\"citation web cs1\"><a rel=\"nofollow\" class=\"external text\" href=\"http://blog.revolutionanalytics.com/2016/09/tidyverse.html\">\"Welcome to the Tidyverse\"</a>. Revolution Analytics<span class=\"reference-accessdate\">. Retrieved <span class=\"nowrap\">2016-09-21</span></span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Abook&amp;rft.genre=unknown&amp;rft.btitle=Welcome+to+the+Tidyverse&amp;rft.pub=Revolution+Analytics&amp;rft_id=http%3A%2F%2Fblog.revolutionanalytics.com%2F2016%2F09%2Ftidyverse.html&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-16\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-16\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite id=\"CITEREFWickham2014\" class=\"citation journal cs1\">Wickham, Hadley (2014). <a rel=\"nofollow\" class=\"external text\" href=\"https://doi.org/10.18637%2Fjss.v059.i10\">\"Tidy Data\"</a>. <i>Journal of Statistical Software</i>. <b>59</b> (10). <a href=\"/wiki/Doi_(identifier)\" class=\"mw-redirect\" title=\"Doi (identifier)\">doi</a>:<span class=\"cs1-lock-free\" title=\"Freely accessible\"><a rel=\"nofollow\" class=\"external text\" href=\"https://doi.org/10.18637%2Fjss.v059.i10\">10.18637/jss.v059.i10</a></span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=article&amp;rft.jtitle=Journal+of+Statistical+Software&amp;rft.atitle=Tidy+Data&amp;rft.volume=59&amp;rft.issue=10&amp;rft.date=2014&amp;rft_id=info%3Adoi%2F10.18637%2Fjss.v059.i10&amp;rft.aulast=Wickham&amp;rft.aufirst=Hadley&amp;rft_id=%2F%2Fdoi.org%2F10.18637%252Fjss.v059.i10&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-17\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-17\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite class=\"citation web cs1\"><a rel=\"nofollow\" class=\"external text\" href=\"https://web.archive.org/web/20170731231612/http://stat-computing.org/awards/jmc/winners.html\">\"John Chambers Award Past winners\"</a>. ASA Sections on Statistical Computing, Statistical Graphics. Archived from <a rel=\"nofollow\" class=\"external text\" href=\"http://stat-computing.org/awards/jmc/winners.html\">the original</a> on 2017-07-31<span class=\"reference-accessdate\">. Retrieved <span class=\"nowrap\">2014-08-12</span></span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Abook&amp;rft.genre=unknown&amp;rft.btitle=John+Chambers+Award+Past+winners&amp;rft.pub=ASA+Sections+on+Statistical+Computing%2C+Statistical+Graphics&amp;rft_id=http%3A%2F%2Fstat-computing.org%2Fawards%2Fjmc%2Fwinners.html&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-asa-fellow-18\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-asa-fellow_18-0\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite class=\"citation web cs1\"><a rel=\"nofollow\" class=\"external text\" href=\"https://web.archive.org/web/20160304081541/http://www.amstat.org/newsroom/pressreleases/2015-ASANames62NewFellows.pdf\">\"ASA names 62 fellows\"</a> <span class=\"cs1-format\">(PDF)</span>. <i>American Statistical Association</i>. Archived from <a rel=\"nofollow\" class=\"external text\" href=\"https://www.amstat.org/newsroom/pressreleases/2015-ASANames62NewFellows.pdf\">the original</a> <span class=\"cs1-format\">(PDF)</span> on 4 March 2016<span class=\"reference-accessdate\">. Retrieved <span class=\"nowrap\">14 November</span> 2015</span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=unknown&amp;rft.jtitle=American+Statistical+Association&amp;rft.atitle=ASA+names+62+fellows&amp;rft_id=https%3A%2F%2Fwww.amstat.org%2Fnewsroom%2Fpressreleases%2F2015-ASANames62NewFellows.pdf&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n<li id=\"cite_note-19\"><span class=\"mw-cite-backlink\"><b><a href=\"#cite_ref-19\">^</a></b></span> <span class=\"reference-text\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1067248974\"/><cite class=\"citation web cs1\"><a rel=\"nofollow\" class=\"external text\" href=\"https://www.nzherald.co.nz/nz/news/article.cfm?c_id=1&amp;objectid=12254723\">\"Kiwi wins prestigious international statistics award for his outstanding contributions to the profession\"</a><span class=\"reference-accessdate\">. Retrieved <span class=\"nowrap\">1 August</span> 2019</span>.</cite><span title=\"ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Abook&amp;rft.genre=unknown&amp;rft.btitle=Kiwi+wins+prestigious+international+statistics+award+for+his+outstanding+contributions+to+the+profession&amp;rft_id=https%3A%2F%2Fwww.nzherald.co.nz%2Fnz%2Fnews%2Farticle.cfm%3Fc_id%3D1%26objectid%3D12254723&amp;rfr_id=info%3Asid%2Fen.wikipedia.org%3AHadley+Wickham\" class=\"Z3988\"></span></span>\n</li>\n</ol></div></div>\n<h2><span class=\"mw-headline\" id=\"External_links\">External links</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a href=\"/w/index.php?title=Hadley_Wickham&amp;action=edit&amp;section=7\" title=\"Edit section: External links\">edit</a><span class=\"mw-editsection-bracket\">]</span></span></h2>\n<ul><li>On the web\n<ul><li><a rel=\"nofollow\" class=\"external text\" href=\"https://twitter.com/hadleywickham\">twitter</a></li>\n<li><a rel=\"nofollow\" class=\"external text\" href=\"https://github.com/hadley\">github</a></li></ul></li>\n<li>interviews\n<ul><li><a rel=\"nofollow\" class=\"external text\" href=\"http://datascience.la/a-conversation-with-hadley-wickham-the-user-2014-interview/\">Interview</a> by Datascience.LA at UseR! 2014</li>\n<li><a rel=\"nofollow\" class=\"external text\" href=\"http://statr.me/2013/09/a-conversation-with-hadley-wickham/\">Interview</a> by Yixuan Qiu (2013)</li>\n<li><a rel=\"nofollow\" class=\"external text\" href=\"https://peadarcoyle.wordpress.com/2015/08/02/interview-with-a-data-scientist-hadley-wickham/\">Interview</a> by Models are</li></ul></li>\n<li>talks\n<ul><li><a rel=\"nofollow\" class=\"external text\" href=\"http://strataconf.com/strata2014/public/schedule/speaker/131906\">Speaker Hadley Wickham Strata 2014 - O'Reilly Conferences, February 11 - 13, 2014, Santa Clara, CA</a> <a rel=\"nofollow\" class=\"external text\" href=\"https://web.archive.org/web/20140223174908/http://strataconf.com/strata2014/public/schedule/speaker/131906\">Archived</a> 2014-02-23 at the <a href=\"/wiki/Wayback_Machine\" title=\"Wayback Machine\">Wayback Machine</a></li>\n<li><a rel=\"nofollow\" class=\"external text\" href=\"https://www.youtube.com/watch?v=LOXe6Eu59As\">Interview</a> at Strata 2014 Illuminating and Wrong</li>\n<li><a rel=\"nofollow\" class=\"external text\" href=\"https://www.youtube.com/watch?v=1POb5fx_m3I\">Ihaka Lecture Series 2017: Expressing yourself with R</a></li></ul></li></ul>\n<div class=\"navbox-styles nomobile\"><style data-mw-deduplicate=\"TemplateStyles:r1061467846\">.mw-parser-output .navbox{box-sizing:border-box;border:1px solid #a2a9b1;width:100%;clear:both;font-size:88%;text-align:center;padding:1px;margin:1em auto 0}.mw-parser-output .navbox .navbox{margin-top:0}.mw-parser-output .navbox+.navbox,.mw-parser-output .navbox+.navbox-styles+.navbox{margin-top:-1px}.mw-parser-output .navbox-inner,.mw-parser-output .navbox-subgroup{width:100%}.mw-parser-output .navbox-group,.mw-parser-output .navbox-title,.mw-parser-output .navbox-abovebelow{padding:0.25em 1em;line-height:1.5em;text-align:center}.mw-parser-output .navbox-group{white-space:nowrap;text-align:right}.mw-parser-output .navbox,.mw-parser-output .navbox-subgroup{background-color:#fdfdfd}.mw-parser-output .navbox-list{line-height:1.5em;border-color:#fdfdfd}.mw-parser-output .navbox-list-with-group{text-align:left;border-left-width:2px;border-left-style:solid}.mw-parser-output tr+tr>.navbox-abovebelow,.mw-parser-output tr+tr>.navbox-group,.mw-parser-output tr+tr>.navbox-image,.mw-parser-output tr+tr>.navbox-list{border-top:2px solid #fdfdfd}.mw-parser-output .navbox-title{background-color:#ccf}.mw-parser-output .navbox-abovebelow,.mw-parser-output .navbox-group,.mw-parser-output .navbox-subgroup .navbox-title{background-color:#ddf}.mw-parser-output .navbox-subgroup .navbox-group,.mw-parser-output .navbox-subgroup .navbox-abovebelow{background-color:#e6e6ff}.mw-parser-output .navbox-even{background-color:#f7f7f7}.mw-parser-output .navbox-odd{background-color:transparent}.mw-parser-output .navbox .hlist td dl,.mw-parser-output .navbox .hlist td ol,.mw-parser-output .navbox .hlist td ul,.mw-parser-output .navbox td.hlist dl,.mw-parser-output .navbox td.hlist ol,.mw-parser-output .navbox td.hlist ul{padding:0.125em 0}.mw-parser-output .navbox .navbar{display:block;font-size:100%}.mw-parser-output .navbox-title .navbar{float:left;text-align:left;margin-right:0.5em}</style></div><div role=\"navigation\" class=\"navbox\" aria-labelledby=\"R_(programming_language)\" style=\"padding:3px\"><table class=\"nowraplinks mw-collapsible autocollapse navbox-inner\" style=\"border-spacing:0;background:transparent;color:inherit\"><tbody><tr><th scope=\"col\" class=\"navbox-title\" colspan=\"3\"><style data-mw-deduplicate=\"TemplateStyles:r1063604349\">.mw-parser-output .navbar{display:inline;font-size:88%;font-weight:normal}.mw-parser-output .navbar-collapse{float:left;text-align:left}.mw-parser-output .navbar-boxtext{word-spacing:0}.mw-parser-output .navbar ul{display:inline-block;white-space:nowrap;line-height:inherit}.mw-parser-output .navbar-brackets::before{margin-right:-0.125em;content:\"[ \"}.mw-parser-output .navbar-brackets::after{margin-left:-0.125em;content:\" ]\"}.mw-parser-output .navbar li{word-spacing:-0.125em}.mw-parser-output .navbar a>span,.mw-parser-output .navbar a>abbr{text-decoration:inherit}.mw-parser-output .navbar-mini abbr{font-variant:small-caps;border-bottom:none;text-decoration:none;cursor:inherit}.mw-parser-output .navbar-ct-full{font-size:114%;margin:0 7em}.mw-parser-output .navbar-ct-mini{font-size:114%;margin:0 4em}</style><div class=\"navbar plainlinks hlist navbar-mini\"><ul><li class=\"nv-view\"><a href=\"/wiki/Template:R_(programming_language)\" title=\"Template:R (programming language)\"><abbr title=\"View this template\" style=\";;background:none transparent;border:none;box-shadow:none;padding:0;\">v</abbr></a></li><li class=\"nv-talk\"><a href=\"/wiki/Template_talk:R_(programming_language)\" title=\"Template talk:R (programming language)\"><abbr title=\"Discuss this template\" style=\";;background:none transparent;border:none;box-shadow:none;padding:0;\">t</abbr></a></li><li class=\"nv-edit\"><a class=\"external text\" href=\"https://en.wikipedia.org/w/index.php?title=Template:R_(programming_language)&amp;action=edit\"><abbr title=\"Edit this template\" style=\";;background:none transparent;border:none;box-shadow:none;padding:0;\">e</abbr></a></li></ul></div><div id=\"R_(programming_language)\" style=\"font-size:114%;margin:0 4em\"><a href=\"/wiki/R_(programming_language)\" title=\"R (programming language)\">R (programming language)</a></div></th></tr><tr><th scope=\"row\" class=\"navbox-group\" style=\"width:1%\"><a href=\"/wiki/R_(programming_language)#Programming_features\" title=\"R (programming language)\">Features</a></th><td class=\"navbox-list-with-group navbox-list navbox-odd hlist\" style=\"width:100%;padding:0\"><div style=\"padding:0 0.25em\">\n<ul><li><a href=\"/wiki/Sweave\" title=\"Sweave\">Sweave</a></li></ul>\n</div></td><td class=\"noviewer navbox-image\" rowspan=\"7\" style=\"width:1px;padding:0 0 0 2px\"><div><a href=\"/wiki/File:R_logo.svg\" class=\"image\"><img alt=\"R logo.svg\" src=\"//upload.wikimedia.org/wikipedia/commons/thumb/1/1b/R_logo.svg/80px-R_logo.svg.png\" decoding=\"async\" width=\"80\" height=\"62\" srcset=\"//upload.wikimedia.org/wikipedia/commons/thumb/1/1b/R_logo.svg/120px-R_logo.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/1/1b/R_logo.svg/160px-R_logo.svg.png 2x\" data-file-width=\"724\" data-file-height=\"561\" /></a></div></td></tr><tr><th scope=\"row\" class=\"navbox-group\" style=\"width:1%\"><a href=\"/wiki/R_(programming_language)#Implementations\" title=\"R (programming language)\">Implementations</a></th><td class=\"navbox-list-with-group navbox-list navbox-even hlist\" style=\"width:100%;padding:0\"><div style=\"padding:0 0.25em\">\n<ul><li><a href=\"/wiki/Distributed_R\" title=\"Distributed R\">Distributed R</a></li>\n<li><a href=\"/wiki/Microsoft_R_Open\" class=\"mw-redirect\" title=\"Microsoft R Open\">Microsoft R Open</a> (Revolution R Open)</li>\n<li><a href=\"/wiki/Renjin\" title=\"Renjin\">Renjin</a></li></ul>\n</div></td></tr><tr><th scope=\"row\" class=\"navbox-group\" style=\"width:1%\"><a href=\"/wiki/R_package\" title=\"R package\">Packages</a></th><td class=\"navbox-list-with-group navbox-list navbox-odd hlist\" style=\"width:100%;padding:0\"><div style=\"padding:0 0.25em\">\n<ul><li><a href=\"/wiki/Bibliometrix\" title=\"Bibliometrix\">Bibliometrix</a></li>\n<li><a href=\"/wiki/Lumi_(software)\" title=\"Lumi (software)\">lumi</a></li>\n<li><a href=\"/wiki/Quantitative_Discourse_Analysis_Package\" title=\"Quantitative Discourse Analysis Package\">qdap</a></li>\n<li><a href=\"/wiki/RGtk2\" title=\"RGtk2\">RGtk2</a></li>\n<li><a href=\"/wiki/Rhea_(pipeline)\" title=\"Rhea (pipeline)\">Rhea</a></li>\n<li><a href=\"/wiki/Rmetrics\" title=\"Rmetrics\">Rmetrics</a></li>\n<li><a href=\"/wiki/Rnn_(software)\" title=\"Rnn (software)\">rnn</a></li>\n<li><a href=\"/wiki/RQDA\" title=\"RQDA\">RQDA</a></li>\n<li><a href=\"/wiki/SimpleITK\" title=\"SimpleITK\">SimpleITK</a></li>\n<li><a href=\"/wiki/Statcheck\" title=\"Statcheck\">Statcheck</a></li>\n<li><b><a href=\"/wiki/Tidyverse\" title=\"Tidyverse\">tidyverse</a></b>\n<ul><li><a href=\"/wiki/Ggplot2\" title=\"Ggplot2\">ggplot2</a></li>\n<li><a href=\"/wiki/Dplyr\" title=\"Dplyr\">dplyr</a></li>\n<li><a href=\"/wiki/Knitr\" title=\"Knitr\">knitr</a></li></ul></li></ul>\n</div></td></tr><tr><th scope=\"row\" class=\"navbox-group\" style=\"width:1%\"><a href=\"/wiki/R_(programming_language)#Interfaces\" title=\"R (programming language)\">Interfaces</a></th><td class=\"navbox-list-with-group navbox-list navbox-even hlist\" style=\"width:100%;padding:0\"><div style=\"padding:0 0.25em\">\n<ul><li><a href=\"/wiki/Bio7\" title=\"Bio7\">Bio7</a></li>\n<li><a href=\"/wiki/Emacs_Speaks_Statistics\" title=\"Emacs Speaks Statistics\">Emacs Speaks Statistics</a></li>\n<li><a href=\"/wiki/Java_GUI_for_R\" title=\"Java GUI for R\">Java GUI for R</a></li>\n<li><a href=\"/wiki/KH_Coder\" title=\"KH Coder\">KH Coder</a></li>\n<li><a href=\"/wiki/Rattle_GUI\" title=\"Rattle GUI\">Rattle GUI</a></li>\n<li><a href=\"/wiki/R_Commander\" title=\"R Commander\">R Commander</a></li>\n<li><a href=\"/wiki/RExcel\" title=\"RExcel\">RExcel</a></li>\n<li><a href=\"/wiki/RKWard\" title=\"RKWard\">RKWard</a></li>\n<li><a href=\"/wiki/RStudio\" title=\"RStudio\">RStudio</a></li></ul>\n</div></td></tr><tr><th scope=\"row\" class=\"navbox-group\" style=\"width:1%\">People</th><td class=\"navbox-list-with-group navbox-list navbox-odd hlist\" style=\"width:100%;padding:0\"><div style=\"padding:0 0.25em\">\n<ul><li><a href=\"/wiki/Roger_Bivand\" title=\"Roger Bivand\">Roger Bivand</a></li>\n<li><a href=\"/wiki/Jenny_Bryan\" title=\"Jenny Bryan\">Jenny Bryan</a></li>\n<li><a href=\"/wiki/John_Chambers_(statistician)\" title=\"John Chambers (statistician)\">John Chambers</a></li>\n<li><a href=\"/wiki/Peter_Dalgaard\" title=\"Peter Dalgaard\">Peter Dalgaard</a></li>\n<li><a href=\"/wiki/Dirk_Eddelbuettel\" title=\"Dirk Eddelbuettel\">Dirk Eddelbuettel</a></li>\n<li><a href=\"/wiki/Robert_Gentleman_(statistician)\" title=\"Robert Gentleman (statistician)\">Robert Gentleman</a></li>\n<li><a href=\"/wiki/Ross_Ihaka\" title=\"Ross Ihaka\">Ross Ihaka</a></li>\n<li><a href=\"/wiki/Thomas_Lumley_(statistician)\" title=\"Thomas Lumley (statistician)\">Thomas Lumley</a></li>\n<li><a href=\"/wiki/Brian_D._Ripley\" title=\"Brian D. Ripley\">Brian D. Ripley</a></li>\n<li><a href=\"/wiki/Julia_Silge\" title=\"Julia Silge\">Julia Silge</a></li>\n<li><a href=\"/wiki/Luke_Tierney\" title=\"Luke Tierney\">Luke Tierney</a></li>\n<li><a class=\"mw-selflink selflink\">Hadley Wickham</a></li>\n<li><a href=\"/wiki/Yihui_Xie\" title=\"Yihui Xie\">Yihui Xie</a></li></ul>\n</div></td></tr><tr><th scope=\"row\" class=\"navbox-group\" style=\"width:1%\">Organisations</th><td class=\"navbox-list-with-group navbox-list navbox-even hlist\" style=\"width:100%;padding:0\"><div style=\"padding:0 0.25em\">\n<ul><li><a href=\"/wiki/R_Consortium\" class=\"mw-redirect\" title=\"R Consortium\">R Consortium</a></li>\n<li><a href=\"/wiki/Revolution_Analytics\" title=\"Revolution Analytics\">Revolution Analytics</a></li>\n<li><a href=\"/wiki/R-Ladies\" title=\"R-Ladies\">R-Ladies</a></li>\n<li><a href=\"/wiki/RStudio\" title=\"RStudio\">RStudio</a></li></ul>\n</div></td></tr><tr><th scope=\"row\" class=\"navbox-group\" style=\"width:1%\">Publications</th><td class=\"navbox-list-with-group navbox-list navbox-odd hlist\" style=\"width:100%;padding:0\"><div style=\"padding:0 0.25em\">\n<ul><li><i><a href=\"/wiki/The_R_Journal\" title=\"The R Journal\">The R Journal</a></i></li></ul>\n</div></td></tr></tbody></table></div>\n<div class=\"navbox-styles nomobile\"><link rel=\"mw-deduplicated-inline-style\" href=\"mw-data:TemplateStyles:r1061467846\"/></div><div role=\"navigation\" class=\"navbox authority-control\" aria-labelledby=\"Authority_control_frameless&amp;#124;text-top&amp;#124;10px&amp;#124;alt=Edit_this_at_Wikidata&amp;#124;link=https&amp;#58;//www.wikidata.org/wiki/Q16251925#identifiers&amp;#124;class=noprint&amp;#124;Edit_this_at_Wikidata\" style=\"padding:3px\"><table class=\"nowraplinks hlist mw-collapsible autocollapse navbox-inner\" style=\"border-spacing:0;background:transparent;color:inherit\"><tbody><tr><th scope=\"col\" class=\"navbox-title\" colspan=\"2\"><div id=\"Authority_control_frameless&amp;#124;text-top&amp;#124;10px&amp;#124;alt=Edit_this_at_Wikidata&amp;#124;link=https&amp;#58;//www.wikidata.org/wiki/Q16251925#identifiers&amp;#124;class=noprint&amp;#124;Edit_this_at_Wikidata\" style=\"font-size:114%;margin:0 4em\"><a href=\"/wiki/Help:Authority_control\" title=\"Help:Authority control\">Authority control</a> <a href=\"https://www.wikidata.org/wiki/Q16251925#identifiers\" title=\"Edit this at Wikidata\"><img alt=\"Edit this at Wikidata\" src=\"//upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/10px-OOjs_UI_icon_edit-ltr-progressive.svg.png\" decoding=\"async\" width=\"10\" height=\"10\" style=\"vertical-align: text-top\" class=\"noprint\" srcset=\"//upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/15px-OOjs_UI_icon_edit-ltr-progressive.svg.png 1.5x, //upload.wikimedia.org/wikipedia/en/thumb/8/8a/OOjs_UI_icon_edit-ltr-progressive.svg/20px-OOjs_UI_icon_edit-ltr-progressive.svg.png 2x\" data-file-width=\"20\" data-file-height=\"20\" /></a></div></th></tr><tr><th scope=\"row\" class=\"navbox-group\" style=\"width:1%\">General</th><td class=\"navbox-list-with-group navbox-list navbox-odd\" style=\"width:100%;padding:0\"><div style=\"padding:0 0.25em\">\n<ul><li><a href=\"/wiki/ISNI_(identifier)\" class=\"mw-redirect\" title=\"ISNI (identifier)\">ISNI</a>\n<ul><li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://isni.org/isni/0000000384728447\">1</a></span></li></ul></li>\n<li><a href=\"/wiki/ORCID_(identifier)\" class=\"mw-redirect\" title=\"ORCID (identifier)\">ORCID</a>\n<ul><li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://orcid.org/0000-0003-4757-117X\">1</a></span></li></ul></li>\n<li><a href=\"/wiki/VIAF_(identifier)\" class=\"mw-redirect\" title=\"VIAF (identifier)\">VIAF</a>\n<ul><li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://viaf.org/viaf/278010996\">1</a></span></li></ul></li>\n<li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://www.worldcat.org/identities/lccn-nb2009023756/\">WorldCat</a></span></li></ul>\n</div></td></tr><tr><th scope=\"row\" class=\"navbox-group\" style=\"width:1%\">National libraries</th><td class=\"navbox-list-with-group navbox-list navbox-even\" style=\"width:100%;padding:0\"><div style=\"padding:0 0.25em\">\n<ul><li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://authority.bibsys.no/authority/rest/authorities/html/9056659\">Norway</a></span></li>\n<li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://d-nb.info/gnd/1068547812\">Germany</a></span></li>\n<li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://id.loc.gov/authorities/names/nb2009023756\">United States</a></span></li>\n<li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://librarian.nl.go.kr/LI/contents/L20101000000.do?id=KAC201803195\">Korea</a></span></li>\n<li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"http://data.bibliotheken.nl/id/thes/p33357284X\">Netherlands</a></span></li></ul>\n</div></td></tr><tr><th scope=\"row\" class=\"navbox-group\" style=\"width:1%\">Scientific databases</th><td class=\"navbox-list-with-group navbox-list navbox-odd\" style=\"width:100%;padding:0\"><div style=\"padding:0 0.25em\">\n<ul><li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://dblp.org/pid/60/5760\">DBLP (computer science)</a></span></li>\n<li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://scholar.google.com/citations?user=YA43PbsAAAAJ\">Google Scholar</a></span></li>\n<li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://mathscinet.ams.org/mathscinet/MRAuthorID/884658\">MathSciNet</a></span></li>\n<li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://genealogy.math.ndsu.nodak.edu/id.php?id=145799\">Mathematics Genealogy Project</a></span></li>\n<li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://www.scopus.com/authid/detail.uri?authorId=23092619300\">Scopus author</a></span></li>\n<li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://zbmath.org/authors/?q=ai:wickham.hadley\">zbMATH</a></span></li></ul>\n</div></td></tr><tr><th scope=\"row\" class=\"navbox-group\" style=\"width:1%\">Other</th><td class=\"navbox-list-with-group navbox-list navbox-even\" style=\"width:100%;padding:0\"><div style=\"padding:0 0.25em\">\n<ul><li><a href=\"/wiki/SUDOC_(identifier)\" class=\"mw-redirect\" title=\"SUDOC (identifier)\">SUDOC (France)</a>\n<ul><li><span class=\"uid\"><a rel=\"nofollow\" class=\"external text\" href=\"https://www.idref.fr/146674480\">1</a></span></li></ul></li></ul>\n</div></td></tr></tbody></table></div>\n<!-- \nNewPP limit report\nParsed by mw1451\nCached time: 20220314033125\nCache expiry: 1814400\nReduced expiry: false\nComplications: [vary‐revision‐sha1]\nCPU time usage: 0.634 seconds\nReal time usage: 0.779 seconds\nPreprocessor visited node count: 3519/1000000\nPost‐expand include size: 81169/2097152 bytes\nTemplate argument size: 6186/2097152 bytes\nHighest expansion depth: 17/100\nExpensive parser function count: 17/500\nUnstrip recursion depth: 1/20\nUnstrip post‐expand size: 76132/5000000 bytes\nLua time usage: 0.366/10.000 seconds\nLua memory usage: 9069733/52428800 bytes\nNumber of Wikibase entities loaded: 1/400\n-->\n<!--\nTransclusion expansion time report (%,ms,calls,template)\n100.00%  695.926      1 -total\n 33.67%  234.295      1 Template:Infobox_scientist\n 33.21%  231.095      2 Template:Infobox\n 32.75%  227.935      1 Template:Infobox_person\n 25.80%  179.522      1 Template:Reflist\n 15.89%  110.604      4 Template:Cite_book\n 11.18%   77.789      5 Template:Br_separated_entries\n  9.24%   64.321      1 Template:Birth_date_and_age\n  8.77%   61.004     14 Template:Cite_web\n  7.68%   53.462     24 Template:Main_other\n-->\n\n<!-- Saved in parser cache with key enwiki:pcache:idhash:41916270-0!canonical and timestamp 20220314033124 and revision id 1043615582. Serialized with JSON.\n -->\n</div>Hadley Wickhamハドリー・ウィッカムAll_articles_with_dead_external_linksArticles_with_dead_external_links_from_July_2021Articles_with_short_descriptionShort_description_matches_WikidataArticles_with_hCardsWebarchive_template_wayback_linksArticles_with_ISNI_identifiersArticles_with_ORCID_identifiersArticles_with_VIAF_identifiersArticles_with_WORLDCATID_identifiersArticles_with_BIBSYS_identifiersArticles_with_GND_identifiersArticles_with_LCCN_identifiersArticles_with_NLK_identifiersArticles_with_NTA_identifiersArticles_with_DBLP_identifiersArticles_with_Google_Scholar_identifiersArticles_with_MATHSN_identifiersArticles_with_MGP_identifiersArticles_with_Scopus_identifiersArticles_with_ZBMATH_identifiersArticles_with_SUDOC_identifiers1979_birthsLiving_peopleNew_Zealand_computer_scientistsNew_Zealand_statisticiansNew_Zealand_expatriates_in_the_United_StatesData_scientistsFellows_of_the_American_Statistical_AssociationR_(programming_language)_peopleCategory:Articles with dead external links from July 2021Category:Articles with BIBSYS identifiersCategory:Articles with DBLP identifiersCategory:Articles with GND identifiersCategory:Articles with Google Scholar identifiersCategory:Articles with ISNI identifiersCategory:Articles with LCCN identifiersCategory:Articles with MATHSN identifiersCategory:Articles with MGP identifiersCategory:Articles with NLK identifiersCategory:Articles with NTA identifiersCategory:Articles with ORCID identifiersCategory:Articles with Scopus identifiersCategory:Articles with SUDOC identifiersCategory:Articles with VIAF identifiersCategory:Articles with WORLDCATID identifiersCategory:Articles with ZBMATH identifiersTemplate:R (programming language)American Statistical AssociationBibliometrixBio7Brian D. RipleyCOPSS Presidents' AwardChief scientific officerColumn (database)Data scienceData visualisationData visualizationDi CookDianne Cook (statistician)Dirk EddelbuettelDistributed RDoctoral advisorDoi (identifier)DplyrEmacs Speaks StatisticsFellow of the American Statistical AssociationGgplot2Google ScholarHamilton, New ZealandHeike HofmannHuman BiologyISBN (identifier)ISNI (identifier)ISSN (identifier)Iowa State UniversityJava GUI for RJenny BryanJohn Chambers (statistician)Julia SilgeKH CoderKnitrLuke TierneyLumi (software)Mathematics Genealogy ProjectMicrosoft R OpenNew ZealandOCLC (identifier)ORCID (identifier)Open-source softwarePeter DalgaardPhDProQuest (identifier)ProfessorProfessors in the United StatesQuantitative Discourse Analysis PackageR-LadiesRExcelRGtk2RKWardRQDARStudioR (programming language)R CommanderR ConsortiumR packageR packagesRattle GUIRenjinRevolution AnalyticsRhea (pipeline)Rice UniversityRmetricsRnn (software)Robert Gentleman (statistician)Roger BivandRoss IhakaRow (database)S2CID (identifier)SUDOC (identifier)SimpleITKStanford UniversityStatcheckStatisticianStatisticsSweaveTable (database)The R JournalThesisThomas Lumley (statistician)Tidy dataTidyverseUniversity of AucklandVIAF (identifier)Variable (mathematics)Wayback MachineYihui XieWikipedia:Link rotTemplate talk:R (programming language)Help:Authority controlTemplate:Short descriptionTemplate:PagetypeTemplate:Main otherTemplate:Short description/lowercasecheckTemplate:SDcatTemplate:Infobox scientistTemplate:Infobox personTemplate:InfoboxTemplate:Br separated entriesTemplate:Birth date and ageTemplate:Pluralize from textTemplate:If emptyTemplate:Unbulleted listTemplate:PlainlistTemplate:ResizeTemplate:Template otherTemplate:URLTemplate:Wikidata imageTemplate:Cite bookTemplate:Cite journalTemplate:ReflistTemplate:Reflist/styles.cssTemplate:Google scholar idTemplate:Google Scholar IDTemplate:First wordTemplate:PAGENAMEBASETemplate:EditAtWikidataTemplate:MathGenealogyTemplate:Cite webTemplate:DeadTemplate:Dead linkTemplate:FixTemplate:Category handlerTemplate:Fix/categoryTemplate:Cite thesisTemplate:ProquestTemplate:ProQuestTemplate:Catalog lookup linkTemplate:WebarchiveTemplate:R (programming language)Template:NavboxTemplate:Authority controlModule:PagetypeModule:Pagetype/configModule:ArgumentsModule:YesnoModule:Namespace detectModule:Namespace detect/dataModule:Namespace detect/configModule:Check for unknown parametersModule:StringModule:SDcatModule:InfoboxModule:Separated entriesModule:TableToolsModule:InfoboxImageModule:AgeModule:DateModule:WdModule:Wd/i18nModule:Detect singularModule:TextModule:If emptyModule:ListModule:Infobox/styles.cssModule:URLModule:Check for clobbered parametersModule:Citation/CS1Module:No globalsModule:Citation/CS1/ConfigurationModule:Citation/CS1/WhitelistModule:Citation/CS1/UtilitiesModule:Citation/CS1/Date validationModule:Citation/CS1/IdentifiersModule:Citation/CS1/COinSModule:Citation/CS1/styles.cssModule:EditAtWikidataModule:UnsubstModule:Category handlerModule:Category handler/dataModule:Category handler/configModule:Category handler/sharedModule:Category handler/blacklistModule:Catalog lookup linkModule:WebarchiveModule:Webarchive/dataModule:NavboxModule:NavbarModule:Navbar/configurationModule:Navbox/configurationModule:Navbox/styles.cssModule:Navbar/styles.cssModule:Authority controlModule:ResolveEntityIdHadley WickhamOOjs_UI_icon_edit-ltr-progressive.svgHadley-wickham2016-02-04.jpgR_logo.svghttps://www.wikidata.org/wiki/Q16251925#P1960https://www.wikidata.org/wiki/Q16251925#P549//doi.org/10.1002%2Fwics.147//www.worldcat.org/issn/1939-5108https://scholar.google.com/citations?user=YA43PbsAAAAJhttps://mathgenealogy.org/id.php?id=145799http://washstat.org/newsletters/wss1310.shtmlhttp://hadley.nz/https://web.archive.org/web/20140222145202/http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7http://news.idg.no/cw/art.cfm?id=F66B12BB-D13E-94B0-DAA22F5AB01BEFE7https://www.stat.auckland.ac.nz/people/hwic004https://profiles.stanford.edu/hadley-wickhamhttp://www.rstudio.com/about/https://qz.com/1661487/hadley-wickham-on-the-future-of-r-python-and-the-tidyverse/https://blog.revolutionanalytics.com/2010/09/the-r-files-hadley-wickham.htmlhttp://metamarkets.com/2012/profile-of-hadley-wickham-data-scientist-in-residence-at-metamarkets/https://lib.dr.iastate.edu/rtd/15639///doi.org/10.31274%2Frtd-180813-16852//www.worldcat.org/oclc/247410260https://search.proquest.com/docview/194000416http://www.r-statistics.com/2013/06/top-100-r-packages-for-2013-jan-may/http://blog.revolutionanalytics.com/2016/09/tidyverse.html//doi.org/10.18637%2Fjss.v059.i10https://web.archive.org/web/20170731231612/http://stat-computing.org/awards/jmc/winners.htmlhttp://stat-computing.org/awards/jmc/winners.htmlhttps://web.archive.org/web/20160304081541/http://www.amstat.org/newsroom/pressreleases/2015-ASANames62NewFellows.pdfhttps://www.amstat.org/newsroom/pressreleases/2015-ASANames62NewFellows.pdfhttps://www.nzherald.co.nz/nz/news/article.cfm?c_id=1&objectid=12254723https://www.wikidata.org/wiki/Q16251925#identifiershttp://dx.doi.org/10.31274/rtd-180813-16852http://r4ds.had.co.nz///www.worldcat.org/oclc/968213225//doi.org/10.18637%2Fjss.v040.i01//doi.org/10.1198%2Fjcgs.2009.07098https://api.semanticscholar.org/CorpusID:58971746//doi.org/10.32614%2FRJ-2010-012//doi.org/10.18637%2Fjss.v021.i12https://twitter.com/hadleywickhamhttps://github.com/hadleyhttp://datascience.la/a-conversation-with-hadley-wickham-the-user-2014-interview/http://statr.me/2013/09/a-conversation-with-hadley-wickham/https://peadarcoyle.wordpress.com/2015/08/02/interview-with-a-data-scientist-hadley-wickham/http://strataconf.com/strata2014/public/schedule/speaker/131906https://web.archive.org/web/20140223174908/http://strataconf.com/strata2014/public/schedule/speaker/131906https://www.youtube.com/watch?v=LOXe6Eu59Ashttps://www.youtube.com/watch?v=1POb5fx_m3Ihttps://isni.org/isni/0000000384728447https://orcid.org/0000-0003-4757-117Xhttps://viaf.org/viaf/278010996https://www.worldcat.org/identities/lccn-nb2009023756/https://authority.bibsys.no/authority/rest/authorities/html/9056659https://d-nb.info/gnd/1068547812https://id.loc.gov/authorities/names/nb2009023756https://librarian.nl.go.kr/LI/contents/L20101000000.do?id=KAC201803195http://data.bibliotheken.nl/id/thes/p33357284Xhttps://dblp.org/pid/60/5760https://mathscinet.ams.org/mathscinet/MRAuthorID/884658https://genealogy.math.ndsu.nodak.edu/id.php?id=145799https://www.scopus.com/authid/detail.uri?authorId=23092619300https://zbmath.org/authors/?q=ai:wickham.hadleyhttps://www.idref.fr/146674480Data scientist, developer of R softwareWickham, HadleyHadley-wickham2016-02-04.jpgQ16251925"

In this exercise, you’ll read this text as HTML, then extract the
relevant nodes to get the infobox and page title.

**Steps**

1.  Code from the previous exercise has already been run, so you have
    `resp_xml` available in your workspace.

    -   Use `read_html()` to read the contents of the XML response
        (`xml_text(resp_xml)`) as HTML.
    -   Use `html_node()` to extract the infobox element (having the
        class `infobox`) from `page_html` with a CSS selector.
    -   Use `html_node()` to extract the page title element (having the
        class `fn`) from `infobox_element` with a CSS selector.
    -   Extract the title text from `page_name` with `html_text()`.

``` r
# Load rvest
library(rvest)

# Read page contents as HTML
page_html <- read_html(xml_text(resp_xml))

# Extract infobox element
infobox_element <- html_node(x = page_html, css =".infobox")

# Extract page name element from infobox
page_name <- html_node(x = infobox_element, css = ".fn")

# Extract page name as text
page_title <- html_text(page_name)
```

Fantastic! You have the info you need you just need to return it in a
nice format.

## Normalising information

Now it’s time to put together the information in a nice format. You’ve
already seen you can use `html_table()` to parse the infobox into a data
frame. But one piece of important information is missing from that
table: who the information is about!

In this exercise, you’ll parse the infobox in a data frame, and add a
row for the full name of the subject.

**Steps**

1.  No need to repeat all the table parsing code from Chapter 4, we’ve
    already added it to your script.

    -   Create a new data frame where `key` is the string `"Full name"`
        and `value` is our previously stored `page_title`.
    -   Combine `name_df` with `cleaned_table` using `rbind()` and
        assign it to `wiki_table2`.
    -   Print `wiki_table2`.

``` r
# Your code from earlier exercises
wiki_table <- html_table(infobox_element)
colnames(wiki_table) <- c("key", "value")
cleaned_table <- subset(wiki_table, !key == "")

# Create a dataframe for full name
name_df <- data.frame(key = "Full name", value = page_title)

# Combine name_df with cleaned_table
wiki_table2 <- rbind(name_df, cleaned_table)

# Print wiki_table
wiki_table2
```

    ##                       key
    ## 1               Full name
    ## 2  Hadley Wickham in 2015
    ## 3                    Born
    ## 4              Alma mater
    ## 5               Known for
    ## 6                  Awards
    ## 7       Scientific career
    ## 8                  Fields
    ## 9            Institutions
    ## 10                 Thesis
    ## 11      Doctoral advisors
    ## 12                Website
    ##                                                                                    value
    ## 1                                                                         Hadley Wickham
    ## 2                                                                 Hadley Wickham in 2015
    ## 3    Hadley Alexander Wickham (1979-10-14) 14 October 1979 (age 42)Hamilton, New Zealand
    ## 4                           University of Auckland (BSc, MSc)Iowa State University (PhD)
    ## 5                                                          ggplot2[1]tidyverseR packages
    ## 6  COPSS Presidents' Award (2019)\nFellow of the American Statistical Association (2015)
    ## 7                                                                      Scientific career
    ## 8                                             Data science\nVisualization\nStatistics[2]
    ## 9             RStudio Inc.\nUniversity of Auckland\nStanford University\nRice University
    ## 10                                  Practical tools for exploring data and models (2008)
    ## 11                                                         Dianne Cook\nHeike Hofmann[3]
    ## 12                                                                             hadley.nz

Awesome! But what if we wanted to do this for someone else with a page
on Wikipedia? You’ll do just that in the next exercise.

## Reproducibility

Now you’ve figured out the process for requesting and parsing the
infobox for the Hadley Wickham page, it’s time to turn it into a
function that does the same thing for anyone.

You’ve already done all the hard work! In the sample script we’ve just
copied all your code from the previous three exercises, with only one
change: we’ve wrapped it in the function definition syntax, and chosen
the name `get_infobox()` for this function.

It doesn’t quite work yet, the argument `title` isn’t used inside the
function. In this exercise you’ll fix that, then test it out with some
other personalities.

**Steps**

1.  Fix the function, by replacing the string `"Hadley Wickham"` with
    `title`, so that the title argument of the function will be used for
    the query.
2.  Test `get_infobox()` with `title = "Hadley Wickham"`.
3.  Now, try getting the infobox for `"Ross Ihaka"`.
4.  Finally, try getting the infobox for `"Grace Hopper"`.

``` r
library(httr)
library(rvest)
library(xml2)

get_infobox <- function(title){
  base_url <- "https://en.wikipedia.org/w/api.php"
  
  # Change "Hadley Wickham" to title
  query_params <- list(action = "parse", 
    page = title, 
    format = "xml")
  
  resp <- GET(url = base_url, query = query_params)
  resp_xml <- content(resp)
  
  page_html <- read_html(xml_text(resp_xml))
  infobox_element <- html_node(x = page_html, css =".infobox")
  page_name <- html_node(x = infobox_element, css = ".fn")
  page_title <- html_text(page_name)
  
  wiki_table <- html_table(infobox_element)
  colnames(wiki_table) <- c("key", "value")
  cleaned_table <- subset(wiki_table, !wiki_table$key == "")
  name_df <- data.frame(key = "Full name", value = page_title)
  wiki_table <- rbind(name_df, cleaned_table)
  
  wiki_table
}

# Test get_infobox with "Hadley Wickham"
get_infobox(title = "Hadley Wickham")
```

    ##                       key
    ## 1               Full name
    ## 2  Hadley Wickham in 2015
    ## 3                    Born
    ## 4              Alma mater
    ## 5               Known for
    ## 6                  Awards
    ## 7       Scientific career
    ## 8                  Fields
    ## 9            Institutions
    ## 10                 Thesis
    ## 11      Doctoral advisors
    ## 12                Website
    ##                                                                                    value
    ## 1                                                                         Hadley Wickham
    ## 2                                                                 Hadley Wickham in 2015
    ## 3    Hadley Alexander Wickham (1979-10-14) 14 October 1979 (age 42)Hamilton, New Zealand
    ## 4                           University of Auckland (BSc, MSc)Iowa State University (PhD)
    ## 5                                                          ggplot2[1]tidyverseR packages
    ## 6  COPSS Presidents' Award (2019)\nFellow of the American Statistical Association (2015)
    ## 7                                                                      Scientific career
    ## 8                                             Data science\nVisualization\nStatistics[2]
    ## 9             RStudio Inc.\nUniversity of Auckland\nStanford University\nRice University
    ## 10                                  Practical tools for exploring data and models (2008)
    ## 11                                                         Dianne Cook\nHeike Hofmann[3]
    ## 12                                                                             hadley.nz

``` r
# Try get_infobox with "Ross Ihaka"
get_infobox(title = "Ross Ihaka")
```

    ##                                                 key
    ## 1                                         Full name
    ## 2  Ihaka at the 2010 New Zealand Open Source Awards
    ## 3                                              Born
    ## 4                                        Alma mater
    ## 5                                         Known for
    ## 6                                            Awards
    ## 7                                 Scientific career
    ## 8                                            Fields
    ## 9                                      Institutions
    ## 10                                           Thesis
    ##                                                       value
    ## 1                                                Ross Ihaka
    ## 2          Ihaka at the 2010 New Zealand Open Source Awards
    ## 3                       1954 (age 67–68)Waiuku, New Zealand
    ## 4  University of AucklandUniversity of California, Berkeley
    ## 5                                    R programming language
    ## 6                                    Pickering Medal (2008)
    ## 7                                         Scientific career
    ## 8                                     Statistical computing
    ## 9                                    University of Auckland
    ## 10                                          Ruaumoko (1985)

``` r
# Try get_infobox with "Grace Hopper"
get_infobox(title = "Grace Hopper")
```

    ##                     key
    ## 1             Full name
    ## 2  Photograph from 1984
    ## 3            Birth name
    ## 4                  Born
    ## 5                  Died
    ## 6       Place of burial
    ## 7            Allegiance
    ## 8        Service/branch
    ## 9      Years of service
    ## 10                 Rank
    ## 11               Awards
    ## 12           Alma mater
    ##                                                                                                                                                                                                                                                                                    value
    ## 1                                                                                                                                                                                                                                                                    Grace Murray Hopper
    ## 2                                                                                                                                                                                                                                                                   Photograph from 1984
    ## 3                                                                                                                                                                                                                                                                  Grace Brewster Murray
    ## 4                                                                                                                                                                                                                                        (1906-12-09)December 9, 1906New York City, U.S.
    ## 5                                                                                                                                                                                                                         January 1, 1992(1992-01-01) (aged 85)Arlington, Virginia, U.S.
    ## 6                                                                                                                                                                                                                                                            Arlington National Cemetery
    ## 7                                                                                                                                                                                                                                                               United States of America
    ## 8                                                                                                                                                                                                                                                                     United States Navy
    ## 9                                                                                                                                                                                                                                                                              1943–1986
    ## 10                                                                                                                                                                                                                                                             Rear admiral (lower half)
    ## 11 Defense Distinguished Service Medal Legion of Merit Meritorious Service Medal American Campaign Medal World War II Victory Medal National Defense Service Medal Armed Forces Reserve Medal with two Hourglass Devices Naval Reserve Medal  Presidential Medal of Freedom (posthumous)
    ## 12                                                                                                                                                                                                                                        Vassar College (BA)Yale University (MS, Ph.D.)

Wow, great work! You put together everything you’ve learn to make a
useful API function. The function isn’t perfect: you may notice it fails
rather ungracefully if you ask for a page that doesn’t exist, or a
person without an infobox.

## Wrap Up

Theory. Coming soon …

**1. Wrap Up**

You’re now at the end of the course - congratulations, and thank you for
all your hard work!

**2. Wrap up**

Over the last five chapters, we’ve covered a lot of topics, from
downloading and reading flat files to both using and designing API
clients.After that, we talked about web scraping, using both Cascading
Style Sheets and XPaths, to get data out of websites that don’t have an
API in the first place.With all of that, you should find yourself
knowing how to get data out of pretty much any website in pretty much
any way - something that’s vital in a time when more and more useful
data is being accessed via the Internet.

**3. Good luck!**

That’s all from us. Hopefully you’ve found the course both valuable and
interesting, and the knowledge you’ve gained will serve you well.
