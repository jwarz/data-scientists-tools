Topic Modeling in R
================
Joschka Schwarz

-   [INFO FOR RSTAN / RSTANARM](#info-for-rstan--rstanarm)
-   [1. Quick introduction to the
    workflow](#1-quick-introduction-to-the-workflow)
    -   [Why learn topic modeling](#why-learn-topic-modeling)
    -   [Topics as word contexts](#topics-as-word-contexts)
    -   [Topic prevalence](#topic-prevalence)
    -   [Probabilities of words belonging to
        topics](#probabilities-of-words-belonging-to-topics)
    -   [Counting words](#counting-words)
    -   [Removal of punctuation marks](#removal-of-punctuation-marks)
    -   [Word frequencies](#word-frequencies)
    -   [Our first LDA model](#our-first-lda-model)
    -   [Displaying frequencies with
        ggplot](#displaying-frequencies-with-ggplot)
    -   [Simple LDA model](#simple-lda-model)
-   [2. Wordclouds, stopwords, and control
    arguments](#2-wordclouds-stopwords-and-control-arguments)
    -   [Random nature of LDA
        algorithm](#random-nature-of-lda-algorithm)
    -   [Probabilities of words in
        topics](#probabilities-of-words-in-topics)
    -   [Effect of argument alpha](#effect-of-argument-alpha)
    -   [Manipulating the vocabulary](#manipulating-the-vocabulary)
    -   [Removing stopwords](#removing-stopwords)
    -   [Keeping the needed words](#keeping-the-needed-words)
    -   [Word clouds](#word-clouds)
    -   [Wordcloud of term frequency](#wordcloud-of-term-frequency)
    -   [History of the Byzantine
        Empire](#history-of-the-byzantine-empire)
    -   [LDA model fitting - first
        iteration](#lda-model-fitting---first-iteration)
    -   [Capturing the actions - dtm with
        verbs](#capturing-the-actions---dtm-with-verbs)
    -   [Making a chart](#making-a-chart)
    -   [Use wordclouds](#use-wordclouds)
-   [3. Named entity recognition as unsupervised
    classification](#3-named-entity-recognition-as-unsupervised-classification)
    -   [Using topic models as
        classifiers](#using-topic-models-as-classifiers)
    -   [Same k, different alpha](#same-k-different-alpha)
    -   [Probabilities of words in
        topics](#probabilities-of-words-in-topics-1)
    -   [From word windows to dtm](#from-word-windows-to-dtm)
    -   [Regex patterns for entity
        matching](#regex-patterns-for-entity-matching)
    -   [Making a corpus](#making-a-corpus)
    -   [From dtm to topic model](#from-dtm-to-topic-model)
    -   [Corpus alignment and
        classification](#corpus-alignment-and-classification)
    -   [Train a topic model](#train-a-topic-model)
    -   [Align corpus](#align-corpus)
    -   [Classify test data](#classify-test-data)
    -   [Explore the results](#explore-the-results)
-   [4. How many topics is enough?](#4-how-many-topics-is-enough)
    -   [Finding the best number of
        topics](#finding-the-best-number-of-topics)
    -   [Preparing the dtm](#preparing-the-dtm)
    -   [Filtering by word frequency](#filtering-by-word-frequency)
    -   [Fitting one model](#fitting-one-model)
    -   [Using perplexity to find the best
        k](#using-perplexity-to-find-the-best-k)
    -   [Topic models fitted to novels](#topic-models-fitted-to-novels)
    -   [Generating chunk numbers](#generating-chunk-numbers)
    -   [Inner join and cast dtm](#inner-join-and-cast-dtm)
    -   [Finding the best value for k](#finding-the-best-value-for-k)
    -   [Locking topics by using seed
        words](#locking-topics-by-using-seed-words)
    -   [Topics without seedwords](#topics-without-seedwords)
    -   [Topics with seedwords](#topics-with-seedwords)
    -   [Final words (and more things to
        learn)](#final-words-and-more-things-to-learn)

## INFO FOR RSTAN / RSTANARM

<https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started>
Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1) \# only necessary for Linux
without the nodejs library / headers install.packages(“rstan”, repos =
“<https://cloud.r-project.org/>”, dependencies = TRUE)

Mac - Configuring C++ Toolchain

**Short Description**

Learn how to fit topic models using the Latent Dirichlet Allocation
algorithm.

**Long Description**

This course introduces students to the areas involved in topic modeling:
preparation of corpus, fitting of topic models using Latent Dirichlet
Allocation algorithm (in package topicmodels), and visualizing the
results using ggplot2 and wordclouds.

# 1. Quick introduction to the workflow

This chapter introduces the workflow used in topic modeling: preparation
of a document-term matrix, model fitting, and visualization of results
with ggplot2.

## Why learn topic modeling

Theory. Coming soon …

**1. Why learn topic modeling**

Welcome to the Topic Modeling with R. In this video you will learn about
topic models: what inputs they take, what output they produce, and how
they can be useful to your work.

**2. What are topic models**

In common language, we understand a topic as a very short (one or two
words) summary of a conversation or a text.For example, if someone says
that the topic of a conversation was weather, we expect that the words
used were rain, storm, snow, winds, ice.The idea is, then, that a topic
is a label for a collection of words that often occur together.Topic
modeling is a process of finding collections of words that best
represent a set of unknown topics.

**3. Rise of popularity**

Topic models give a way to quickly make a judgment about contents of a
collection of documents. The joke is that topic models are a tool for
those who do not like to read.Because topics are quantified, topic
modeling opened the door for new applications, like tracking the
prevalence of a topic through time, tracking similarity of documents, or
fitting regression models to estimate causal effects.Topic models are
used as a foundation for more technical applications like text
segmentation, or classification.

**4. Topic models - descriptive side**

There are many algorithms that produce topic models. Our course will
focus on Latent Dirichlet Allocation.For its input, LDA takes a
document-term matrix. A document-term matrix is a bag-of-words
representation of a collection of documents: it records frequencies of
word occurrence, but ignores word order.LDA returns two matrices: one
contains prevalence of topics in the documents, the other - probability
of words belonging to topics.Let’s take a look at a quick example.

**5. Illustration**

We have a tiny collection of documents. (The technical term for such
collection is **corpus**.)Each document consists of a single
sentence.These sentences are related to two topics: restaurants and
loans.

**6. Illustration**

The corpus is converted into a document-term matrix. We use only a
subset of words: bank, loans, pay, new, opened, restaurant.Notice that
the words “loans” and “pay” occur in document 5 that has both topics
present in it.

**7. Illustration**

Function LDA() will fit a topic model to a collection of documents
represented by document-term matrix.LDA is a supervised clustering
algorithm: we need to specify the number of clusters we seek from the
start.The result is two tables. The first table shows probabilities of
words belonging to topics. For instance, probability of word ‘opened’
belonging to topic 2 is 36%.The second table shows probabilities of
documents belonging to topics. Document 3 has 20% probability of
belonging to topic 1, and 80% - of belonging to topic 2.

**8. Topic modeling - the other parts**

There are quite a few technical decisions involved in a project that
uses topic modeling.First, matrices as output are fine only for small
sets of data. For larger projects, we will have to use charts.Second,
there are choices related to which words to keep for analysis. The
earlier example used only 7 words out of the vocabulary of 34. Some
approaches emphasize the use of nouns, others - the use of verbs.Then, a
document can be constructed in multiple ways. Some scholars work with a
single novel, like Moby Dick, and use 500 or 1000 words as a single
document. In analysis of Twitter data, a single tweet is often treated
as a document.Finally, there are several control parameters that
strongly affect the results. To be fully competent with topic modeling,
you must have an idea what these parameters control.

**9. Let’s practice!**

Now let’s start doing things.

## Topics as word contexts

We have a topic defined by the following terms: **site, settlement,
evidence, inhabit, region, period, earliest, ancient, reconstruct**.

> ## *Question*
>
> Which concept is reflected in this topic? Pick one.<br> <br> ✅
> Archeology<br> ⬜ Physics<br> ⬜ Chemistry<br>

The answer is *archeology*. You probably relied on the associations in
your mind; these associations are just non-quantified word
co-occurrences.

## Topic prevalence

Matrix `document_topics` contains results of a topic model fitted on the
same corpus, but this time the document-term matrix included all words.

> ## *Question*
>
> Print out the matrix and answer the question, which topic, 1 or 2,
> does the document 5 is more likely to belong?<br> <br> ⬜ Topic 1 has
> a higher proportion than topic 2.<br> ✅ Topic 2 has a higher
> proportion than topic 1.<br> ⬜ Both topics have the same
> proportion.<br>

## Probabilities of words belonging to topics

Your session has a matrix `word_topics` which contains the probabilities
of words belonging to the topics. The matrix has two rows (for two
topics) and 34 columns (for each term). The columns are named, with
terms serving as column name.

**Steps**

1.  Display the column names of the `word_topics` matrix.
2.  Display the probability of word *street* belonging to topic 1.

``` r
word_topics <- readRDS("data/word_topics.rds")

# Display the column names
colnames(word_topics)
```

    ##  [1] "agreed"     "bad"        "bank"       "due"        "fines"     
    ##  [6] "loans"      "pay"        "the"        "to"         "are"       
    ## [11] "face"       "if"         "late"       "off"        "will"      
    ## [16] "you"        "your"       "a"          "downtown"   "in"        
    ## [21] "new"        "opened"     "restaurant" "is"         "just"      
    ## [26] "on"         "street"     "that"       "there"      "warwick"   
    ## [31] "for"        "how"        "need"       "want"

``` r
# Display the probability
word_topics[1, "street"]
```

    ## [1] 0.03741497

## Counting words

Theory. Coming soon …

**1. Counting words**

In order to fit a topic model, we must prepare a document-term matrix
that will contain counts of word occurrences in documents. In this
lesson we will cover how to do it using packages tidytext and dplyr.

**2. Splitting text**

In text processing, the process of splitting a text is referred to as
tokenization. In our case, we will be splitting text into words, but in
general tokens can be a sequence of characters, or a sequence of
words.Package tidytext has a function unnest_tokens() that performs
tokenization.The function takes a column from a table, splits it into
words and, by default, it will drop the column with text. It will also
convert the output to lower case.

**3. Example of using unnest_tokens**

We have a data frame named “book”. It has two columns: chapter and
text.We call unnest_tokens(), instructing that the column with tokens
should be named “word” and that column “text” should be dropped.We get
back a table in which each word is in its own row.

**4. Counting words**

We will use function count() from package dplyr to obtain frequencies of
words within chapters.This function, essentially, groups the rows by
chapter and word, and returns the number of rows in each group. This
correspond to the number of times a specific word occurs in a specific
chapter.The result is a table with one row per each combination of
chapter and word. For example, the word “is” occurs twice in chapter 1.

**5. Getting the top words 1**

Once we have the counts, we often will want to examine the top words,
for example, the top 10.This can be done by grouping the rows by
chapter, sorting the rows within each group in order of descending
counts, and then realizing that the rank of a word is equal to its row
number.Most frequent word will be in row 1, second most frequent - in
row 2, and so on. dplyr has a function row_number() that returns the row
number. All we need to do is filter on the condition that row number is
less than a threshold value.

**6. Getting the top words 2**

This is an example of getting top two words from each chapter. We use
arrange() to sort the rows within each group, and wrap the count values
n into a call to desc() to sort in descending order.Then we filter,
inside each group, to keep only rows whose number is less than 3.Note
that for chapter 2, the second word we got is “comes”. Its count is 1
and we know there were other words with that count. What we got, then,
is also determined by the alphabetical order.

**7. Casting counts into a document-term matrix**

You may be familiar with function cast() that is used to transform a
table from one format into another.We need to transform the table with
counts into a document-term matrix, dtm for short. In dtm, rows
correspond to documents, and columns to words, terms. In our case, each
sentence will be a document.Package tidytext has function cast_dtm()
that transforms a table in tidy format into a document-term matrix.It
accepts a table with counts, and needs to know which column corresponds
to a document ID, which - to the word, and which - to the value of the
count.

**8. Example of using cast_dtm()**

Here is an example.You should recognize most of this script. Everything
until cast_dtm() is the code that creates a tidy table with word
counts.We add the call to cast_dtm() and get back a document-term
matrix. It is stored in a special format, as a so-called sparse
matrix.We can examine its contents by converting it to a regular matrix
using function as.matrix().

**9. Let’s practice!**

It’s time to practice!

## Removal of punctuation marks

Sometimes you have to work with hyphenated words like ‘ill-fated’. The
documentation for `unnest_tokens` says that the tokenizer function will
remove all punctuation marks. Your job is to verify this.

> ## *Question*
>
> You are given a data frame `d` with a single column `text` and two
> rows. Apply the `unnest_tokens` to table `d` and pick the answer that
> best describes its behavior.<br> <br> ⬜ `unnest_tokens` removes all
> punctuation marks.<br> ⬜ `unnest_tokens` keeps the punctuation
> marks.<br> ✅ It depends on where the punctuation mark is.<br>

Yes. If a punctuation mark is followed by a space, it is removed.

## Word frequencies

You are given a table `chapters` with two columns: `chapter` and `text`
and two rows. They contain chapters 1 and 2 from the book, *The
Byzantine Empire*, by Charles Oman, published in 1902. Find the
frequency of the word ‘after’ for each chapter.

**Steps**

1.  Specify the input column for the `unnest_tokens()`.
2.  Use `count` with arguments `chapter` and `word` to obtain word
    frequencies.
3.  Use `filter` with a condition testing equality of values in column
    `word` to “after”.

``` r
# Prepare data
library("gutenbergr")
library("stringr")
library("dplyr")
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
library("tidyr")

# tbe_book <- gutenberg_download(37756)
tbe_book_lines <- gutenberg_works(title |> str_detect("The Byzantine Empire")) %>%
  
  # Add title
  gutenberg_download(meta_fields = "title") |> 
  # Remove unnecessary whitespaces
  mutate(text = text |> str_trim()) |> 
  # Remove empty lines and "Illustrations"
  filter(!(text %in% c("", "[Illustration]"))) |> 
  # Add indicator for chapter titles
  mutate(is_chapter_title = text |> str_detect("^(I|V|X)+\\. \\b[A-Z]+\\b")) |> 
  
  # Add chapter number
  mutate(chapter = cumsum(is_chapter_title)) |> 
  mutate(chapter = ifelse(cumany(text == "Finis."),0,chapter)) |> # Set Chapter == 0 After Finis
  
  # Add chapter titles
  mutate(chapter_title = ifelse(is_chapter_title, text, NA_character_)) |> 
  fill(chapter_title) |> # impute
  filter(!is_chapter_title, chapter > 0) |> 
  select(-is_chapter_title)
```

    ## Determining mirror for Project Gutenberg from http://www.gutenberg.org/robot/harvest

    ## Using mirror http://aleph.gutenberg.org

``` r
tbe_book_chapters <- tbe_book_lines |> 

              # Collapse lines
              group_by(gutenberg_id, title, chapter, chapter_title) |> 
              summarise(text = text |> str_c(collapse= " "))
```

    ## `summarise()` has grouped output by 'gutenberg_id', 'title', 'chapter'. You can
    ## override using the `.groups` argument.

``` r
chapters <- tbe_book_chapters |> filter(chapter %in% c(1:2))
```

``` r
# Load package
library(tidytext)

# Specify the input column
word_freq <- chapters %>% 
  unnest_tokens(output=word, 
                input=text, 
                token="words", 
                format="text") %>% 
  # Obtain word frequencies
  count(chapter, word) 

# Test equality
word_freq %>% filter(word == "after")
```

    ## # A tibble: 2 × 5
    ## # Groups:   gutenberg_id, title, chapter [2]
    ##   gutenberg_id title                                   chapter word      n
    ##          <int> <chr>                                     <dbl> <chr> <int>
    ## 1        37756 "The Byzantine Empire\r\nThird Edition"       1 after    11
    ## 2        37756 "The Byzantine Empire\r\nThird Edition"       2 after     4

## Our first LDA model

In order to fit a topic model to a corpus of text, we need to provide a
document-term matrix (dtm) as an input to function `LDA`. Now that
you’ve seen how to do that, you can fit your very first topic model.

You are given access to a table `corpus` that you have seen in lesson 1.
Column `text` contains the sentences, column `id` - document id.

Fill in the blanks to run the code that will display proportion of
topics in each document.

**Steps**

1.  In the call to `unnest_tokens` specify that the input column is
    `text` and the output column is `word`.
2.  In the call to `cast_dtm`, specify that the token is in column
    `word`.

``` r
# tm package is necessary
# Load packages
library(topicmodels)

# Read data
corpus1 <- readRDS("data/corpus1.rds")

dtm1 <- corpus1 %>% 
    # Specify the input column
    unnest_tokens(input=text, output=word, drop=TRUE) %>% 
    count(id, word) %>% 
    # Specify the token
    tidytext::cast_dtm(document=id, term=word, value=n)

mod1_1 = LDA(x=dtm1, k=2, method="Gibbs", control=list(alpha=1, delta=0.1, seed=10005))

posterior(mod1_1)$topics
```

    ##             1         2
    ## d_1 0.2307692 0.7692308
    ## d_2 0.1666667 0.8333333
    ## d_3 0.8750000 0.1250000
    ## d_4 0.8461538 0.1538462
    ## d_5 0.2777778 0.7222222

Well done. The call to `posterior(mod)$topics` returns the probabilities
of topics.

## Displaying frequencies with ggplot

Theory. Coming soon …

**1. Displaying results with ggplot**

In this chapter we will review how to display results of topic modeling
using ggplot.

**2. Frequencies and probabilities**

As we work with LDA topic modeling, we will be interested in displaying
two kinds of data.First, there are word counts in documents - we obtain
them before we fit a topic model.Then, there are probabilities of topics
in documents and words in topics. These are obtained after fitting a
topic model.Fortunately, ggplot can do it all.ggplot requires the data
to be in tidy format. Fortunately, word counts are already in tidy
format, and LDA results can be converted into a tidy format using
function tidy() from package tidytext.

**3. From LDA model to tidy table**

When we fit a topic model, we call function LDA() and it returns an
object. Among many things, this object contains two matrices: beta and
gamma. beta contains logarithms of probabilities of words belonging to
topics, and gamma - probabilities of documents belonging to
topics.Notice how in the output, the dimension of beta is 2 by 34: two
topics and 34 words. The dimension of gamma is 5 by 2: five documents
and two topics.

**4. Using function tidy**

Function tidy() takes an LDA model object and returns a tidy table with
a specified matrix.

**5. Stacked columns chart**

The geometry column layer in ggplot will produce a column chart.By
default, the columns will be stacked.In the call to ggplot(), the
aesthetics specifies that values for axis x will come from column
“document”, for axis y - from column “gamma”.

**6. Dodged columns**

Dodged, or side-by-side, columns are better for telling which column is
taller. To make a chart with dodged columns, we need to add
position_dodge() argument to the call of geom_col()The example shows
probabilities of words. The data comes from matrix “beta” contained in
LDA model. The word is contained in column “term”.

**7. Rotated labels**

When the number of labels on x axis gets large, the labels will overlap
and obscure each other.The overlap can be reduced if we rotate the
labels, for instance, by 90 degrees.This can be achieved using the
specification for axis.text.x element in the call to theme().Notice that
in the script in the slide, we first convert topic into a factor
variable, and then use it to guide the color fill.

**8. Let’s practice!**

Let’s do a few examples.

## Simple LDA model

In this exercise you will work through all steps involved in making a
topic model analysis. For simplicity, we will use the tiny corpus of
five sentences/documents that you have seen earlier.

**Steps**

1.  With the model object in hand, you can extract matrices `beta` and
    `gamma` for word and document probabilities, respectively. Retrieve
    the probabilities of word `will` belonging to topics 1 and 2. The
    column containing words will be named `term`.

``` r
# Retrieve the probabilities of word `will` belonging to topics 1 and 2
tidy(mod1_1, matrix="beta") %>%
  filter(term == "will")
```

    ## # A tibble: 2 × 3
    ##   topic term     beta
    ##   <int> <chr>   <dbl>
    ## 1     1 will  0.00365
    ## 2     2 will  0.0787

2.  Make a stacked column chart showing the probabilities of documents
    belonging to topics.

    -   `tidy` will return a table with columns `document` for document
        id, `topic` for topic number, and `gamma` for the value of
        probability.
    -   Retrieve matrix `gamma`, use `document` for `x`, `gamma` for `y`
        in the aesthetics, and `topic` as `fill` in the `geom_col` verb.

``` r
# Load package
library(ggplot2)

# Make a stacked column chart showing the probabilities of documents belonging to topics
tidy(mod1_1, matrix="gamma") %>% 
  mutate(topic = as.factor(topic)) %>% 
  ggplot(aes(x=document, y=gamma)) + 
  geom_col(aes(fill=topic))
```

![](readme_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

Great job. You have covered all steps, from a text dataframe to a chart
with results.

# 2. Wordclouds, stopwords, and control arguments

This chapter explains how to use join functions to remove or keep words
in the document-term matrix, how to make wordcloud charts, and how to
use some of the many control arguments.

## Random nature of LDA algorithm

Theory. Coming soon …

**1. Linking words to topics**

In this lesson you will get a glimpse into the way LDA algorithm
searches for a topic model.

**2. LDA and random numbers**

When we call LDA() function we specify the document-term matrix “dtm”,
number of clusters “k”, and some control and initialization parameters.
Let’s talk about what they do.LDA uses random search through the space
of parameters to find the best match between probabilities and data.This
match is measured by log-likelihood, which is a measure of how plausible
the model’s parameters are given the data. We want the model with the
highest log-likelihood.

**3. Random search**

It uses “Gibbs sampling” - a randomized search algorithm, which is a
type of Monte Carlo Markov Chain algorithms. This is why we specify
“method” equals “Gibbs” in the input.The algorithm searches among
possible combinations of probabilities. For example, 0.5 and 0.5 vs 0.8
and 0.2, for two topics in documents.These combinations are influenced
by the values of control arguments “alpha” and “delta”.

**4. Random search - controlling the iterations**

Even though we say “randomized”, in reality the numbers in R are
pseudo-random. They are generated by a special function that takes a
seed value and produces new values by iterating over the seed.The seed
can be specified to ensure reproducibility of results between runs of
LDA().The number of steps in the search process is controlled by the
“iter” argument. Increasing the number of iterations increases the
chances of finding the best model, but it also makes the model fitting
take longer.By default, the algorithm will perform 2000 iterations.

**5. Effect of seed value**

Here is an illustration of the effect of “seed” value.We have the same
corpus of five sentencesWe run the same code, but the seed value is
different.Topic proportions are roughly similar, but the numbering of
topics has flipped.Documents that had high prevalence of topic 1 now
have high prevalence of topic 2.Without special precautions, topic
numbering is arbitrary.

**6. Handling intermediate results**

Package “topicmodels” uses a piece of C code that was originally written
by the group of David Blei, the scholar who pioneered the use of LDA for
topic modeling. Because of this, some control arguments perform in
non-intuitive way.One argument like that is “thin”. It specifies the
frequency with which an LDA model is saved.Specifying “thin” equals 1
makes the code return the topic model after every iteration, and return
the one with the best log-likelihood. This is a trade-off: the code will
run slower, but we will get to keep the best value.

**7. Most probable words in topics**

How can we find out the most probable words?Word probabilities are
returned in matrix “beta”.One approach is to use function tidy() that
you have seen before. tidy() would retrieve the matrix in tidy format
and then we could use the power of dplyrFor example, to get the top five
wordswe’d call tidy, then group by topic, arrange by probabilities
“beta”, filter by row number.

**8. Using tidy() to get most probable words**

Here is what the script could look like.Filtering condition
“row_number() \<= 3” is used to keep only the top 3 words.In the end, we
get a tidy table that contains topics, terms, and probabilities.

**9. Using function terms()**

Package `topicmodels` has function terms() that returns the most
probable words. It can return the top “k” words, or we can provide a
probability threshold.For example, here we request top 5 words for every
topic.The result is a table with a column per topicBecause this function
does not return values of probabilities, the top k result can be
confusing. The function will simply go down the list of words, even
though their probabilities may be very small.The “threshold” option is
useful when we are interested in knowing words that have high
probability of belonging to a topic.Here we request words whose
probability in a topic is above 0.05. Notice how topic 2 has fewer words
whose probability is above the threshold than topic 1.

**10. Let’s practice!**

You’ve seen the demos, and now it’s time to practice.

## Probabilities of words in topics

You will now practice retrieving information about probabilities of
words in topics.

**Steps**

1.  You are given a document-term matrix `dtm` constructed from the same
    corpus of five sentences, but using only seven words. Using your
    knowledge that a document-term matrix has the terms as its column
    names, display the terms of the `dtm`.

``` r
# Read data
# dtm <- readRDS("data/dtm1.rds")

cols <- c("bank","fines","loans","pay","new","opened","restaurant")

dtm1_mat <- as.matrix(dtm1)[,cols]

# Display column names
colnames(dtm1_mat)
```

    ## [1] "bank"       "fines"      "loans"      "pay"        "new"       
    ## [6] "opened"     "restaurant"

2.  Fit an LDA topic model for two topics. Argument `x` should be the
    document-term matrix, number of clusters `k` should be 2, `method`
    should be `Gibbs`. Keep the control argument unchanged.

``` r
# Fit an LDA model for 2 topics using Gibbs sampling
mod1_2 <- LDA(x=dtm1_mat, k=2, method="Gibbs", 
           control=list(alpha=1, seed=10005, thin=1))
```

3.  Use `dplyr` to display the probability of term “opened” in topic 2.
    You will be retrieving matrix `beta` from LDA object `mod`

``` r
# Convert matrix beta into tidy format and filter on topic number and term
tidy(mod1_2, matrix="beta") %>%
  filter(topic==2, term=="opened")
```

    ## # A tibble: 1 × 3
    ##   topic term     beta
    ##   <int> <chr>   <dbl>
    ## 1     2 opened 0.0103

Very good.

## Effect of argument alpha

In this exercise you will compare how the quality of model’s fit to data
varies with argument `alpha`

**Steps**

1.  You have a document-term matrix `dtm` containing word frequencies
    for the corpus of 5 sentences with the vocabulary of 7(???) words.
2.  Fit LDA topic model for 2 topics. Keep the arguments `seed` and
    `alpha` unchanged.

``` r
# Fit LDA topic model using Gibbs sampling for 2 topics
mod1_3 <- LDA(x=dtm1, k=2, method="Gibbs",
           control=list(alpha=1, seed=10005, thin=1))
```

3.  Display the probabilities of topics in documents. Use function
    `tidy` to retrieve matrix `gamma` from the LDA model object.
4.  `pivot_wider` / `spread` will cast it into a table with two columns.

``` r
# Display the probabilities of topics in documents side by side
# tidy(mod1, "gamma") %>% spread(topic, gamma)
tidy(mod1_3, "gamma") %>% pivot_wider(names_from = topic, values_from = gamma)
```

    ## # A tibble: 5 × 3
    ##   document   `1`    `2`
    ##   <chr>    <dbl>  <dbl>
    ## 1 d_1      0.154 0.846 
    ## 2 d_2      0.278 0.722 
    ## 3 d_3      0.875 0.125 
    ## 4 d_4      0.923 0.0769
    ## 5 d_5      0.5   0.5

5.  Rerun the code, but this time set `alpha` equal to 25. Display the
    probabilities of topics in documents.

``` r
# Fit LDA topic model with a different alpha
mod1_4 <- LDA(x=dtm1, k=2, method="Gibbs",
           control=list(alpha=25, seed=10005, thin=1))

# Display the probabilities of topics in documents side by side
tidy(mod1_4, "gamma") %>% pivot_wider(names_from = topic, values_from = gamma)
```

    ## # A tibble: 5 × 3
    ##   document   `1`   `2`
    ##   <chr>    <dbl> <dbl>
    ## 1 d_1      0.475 0.525
    ## 2 d_2      0.530 0.470
    ## 3 d_3      0.482 0.518
    ## 4 d_4      0.508 0.492
    ## 5 d_5      0.5   0.5

> ## *Question*
>
> Knowing that our corpus contained documents related to two topics,
> which model, `mod1` or `mod2` returned more realistic results?<br>
> <br> ✅ Model `mod1` returned more realistic values of topic
> proportions.<br> ⬜ Model `mod2` returned more realistic values of
> topic proportions.<br> ⬜ Topic proportions in `mod1` and `mod2` are
> similar.<br>

Yes. We knew that the documents were dominated by one topic, and `mod1`
captured that. This is an illustration of why argument `alpha` is
important.

## Manipulating the vocabulary

Theory. Coming soon …

**1. Manipulating the vocabulary**

In this lesson you will learn how to control what words will be included
into the document-term matrix, dtm for short.

**2. Possible operations**

As we transform a corpus of documents into a document-term matrix, we
will find ourselves in two types of situations.In one, we know what
words we don’t want to see in the dtm.In the other, we know which words
we do want to include.These situations are similar, and the choice
depends on which set of words is smaller and is easier to specify: the
stop words or the needed words.

**3. Removing stopwords**

Stopwords are words that are considered as noise in text and are
removed. A good example of this are indefinite and definite articles
**a** and **the**.Stopwords often obscure word associations in topics:
they are the most frequent words and show up at the top of the frequency
tables, pushing the important words out of sight.The previous lesson had
an example showing five most probable words in two topics. Words “the”,
“you”, and “to” were in the output and they did not contribute to
understanding what the topics were about.

**4. Using anti_join()**

An inner join of two tables merges the tables using a key: a column that
is present in both tables and which indicates which rows are a match.
Only the rows with matching key values make it into the output.Opposite
to that, anti_join() drops the rows that have matching key values. This
is perfect for situations when we remove some rows based on a
criterion.Here you are seeing an example where we have a very simple
table with word counts. Words “we” and “went” are stopwords. As
inner_join(), anti_join() would use columns with the same name as the
key. When the names do not match, we need to specify the association
using the “by” argument.After we perform anti_join(), the stop words are
removed.

**5. Keeping the needed words in**

There are also situations when it’s easier to specify which words we’d
like to keep, rather than having a list of words we’d like to drop.In
such situations we can use inner_join()Some scholars who use topic
models to analyze novels prefer to keep only nouns.As you will see in
the big exercise in this chapter, we will focus our attention on verbs
in a history text.Application of inner_join() should be familiar to
anybody who worked with dplyr. We only need to specify the
correspondence between columns that are used as keys. This is done with
argument “by”.In the example, we chose to keep two words: “fishing” and
“slept” - and remove everything else.

**6. Let’s practice!**

Now that you’ve seen the examples, let’s practice.

## Removing stopwords

It takes only one new line of code to remove the stopwords. Fill in the
function names to make the code work.

**Steps**

1.  The `anti_join` must come in after `unnest_tokens` but before
    `count`.

``` r
# Create the document-term matrix with stop words removed
dtm2 <- corpus1 %>%
  unnest_tokens(output=word, input=text) %>%
  anti_join(stop_words) %>% 
  count(id, word) %>%
  cast_dtm(document=id, term=word, value=n)
```

    ## Joining, by = "word"

``` r
# Display the matrix
as.matrix(dtm2)
```

    ##      Terms
    ## Docs  agreed bad bank due fines loans pay late downtown restaurant street
    ##   d_1      1   1    1   1     1     1   1    0        0          0      0
    ##   d_2      0   0    1   0     1     1   1    1        0          0      0
    ##   d_3      0   0    0   0     0     0   0    0        1          1      0
    ##   d_4      0   0    0   0     0     0   0    0        0          1      1
    ##   d_5      0   0    0   0     0     1   1    0        0          1      0
    ##      Terms
    ## Docs  warwick
    ##   d_1       0
    ##   d_2       0
    ##   d_3       0
    ##   d_4       1
    ##   d_5       0

Very good. dplyr makes things so easy, right?

## Keeping the needed words

You are given the table with documents `corpus` and the table
`dictionary` with one column - `word`, - containing the words we want to
keep in the document-term matrix. Use `inner_join` to create a
document-term matrix with the needed words.

**Steps**

1.  Perform inner join on the table `dictionary`. The column names
    match, so you do not need to use the `by` argument.

``` r
# assign dictionary (from above)
dictionary <- tibble(word = cols)

# Perform inner_join with the dictionary table
dtm3 <- corpus1 %>%
  unnest_tokens(output=word, input=text) %>%
  inner_join(dictionary) %>% 
  count(id, word) %>%
  cast_dtm(document=id, term=word, value=n)
```

    ## Joining, by = "word"

``` r
# Display the contents of dtm
as.matrix(dtm3)
```

    ##      Terms
    ## Docs  bank fines loans pay new opened restaurant
    ##   d_1    1     1     1   1   0      0          0
    ##   d_2    1     1     1   1   0      0          0
    ##   d_3    0     0     0   0   1      1          1
    ##   d_4    0     0     0   0   1      1          1
    ##   d_5    0     0     1   1   0      1          1

Well done. An interesting detail: notice how the dtm contains two square
blocks, suggesting two topics.

## Word clouds

Theory. Coming soon …

**1. Word clouds**

In this lesson you will examine wordclouds. They are less precise than
barplots, but offer a quick impressionistic look at the topics.

**2. Word clouds**

Earlier we used ggplot to make stacked bar charts showing probabilities
of words in topics. Bar plots are nice, but when the number of words
increases, the plots become hard to read.Instead, we can use wordcloud
charts that are less precise but give a good impressionistic feeling for
word frequencies and importance.Function wordcloud() requires only a
vector of words and a vector of word frequencies.There is no need to
sort words by frequency in order to keep only a few - wordcloud() will
do that on its own.We will use package “wordcloud” to draw the charts

**3. Top 20 words**

Here is an example of making a wordcloud that will show the top 20
words.We start by counting the frequencies of words in the whole
corpusThen we make a call to function wordcloud().The number of words is
controlled by the argument “max.words”. We set it to 20.It is also
possible to specify the range of frequencies, minimum and maximum, to be
displayed. The default minimum frequency is 3 and we need to override
this value.We get a very concise code.

**4. Top 20 words**

Here is the plot. Words with higher frequencies are displayed in larger
font. We are using the default settings for the minimum and maximum font
sizes.

**5. Adding color and rotations**

Black and white wordclouds are okay, but we can do more.To make the
chart visually pleasing, we can provide a vector of colors. wordcloud()
will cycle through it. There is no specific rule on how the colors will
be applied.We can also specify the percentage of words that should be
rotated. The default is 0.1 (ten percent).All it takes is to add two
more arguments to a call to wordcloud(). I chose “DarkOrange”,
“CornflowerBlue” and “DarkRed” as the colors.

**6. Word cloud with color**

And here is the output.

**7. Wordclouds with results of LDA**

With a little adjustment, we can use wordclouds to display results of
LDA(). The challenge here is that wordcloud() expects integer numbers as
frequencies.LDA(), however, returns probabilities, which are floating
point numbers less than 1.Because wordcloud() rescales the word size,
the solution is to multiply the probabilities by some large number and
then truncate the fractional parts.Here we fit a topic model with 2
topics.Now, we extract the matrix with word probabilities using function
tidy() and then use mutate() to create a new column “n”: we multiply
values of beta by ten thousand and discard the fractional part. Finally,
we use filter() to keep only rows with data on word probabilities in
topic 1.After this, we are back on familiar ground and can call
wordcloud().

**8. Top 20 words of topic 1**

Here is the result: top twenty words of the first topic, with size
proportionate to probability of word in topic.

**9. Let’s practice!**

Let’s practice our new skills.

## Wordcloud of term frequency

You are given table `corpus` containing the “toy” corpus with five
sentences/documents. You will practice modifying the word cloud to make
it more interesting.

**Steps**

1.  Using table `corpus`, generate the table with counts of words in the
    whole corpus. Save the result to variable `word_frequencies`.

``` r
# Generate the counts of words in the corpus
word_frequencies <- corpus1 %>% 
  unnest_tokens(input=text, output=word) %>%
  count(word)
```

2.  Create a wordcloud showing top 10 words, with the threshold of
    minimal word frequency set to 1.

``` r
# Load package
library(wordcloud)
```

    ## Loading required package: RColorBrewer

``` r
# Create a wordcloud
wordcloud(words=word_frequencies$word, 
          freq=word_frequencies$n,
          min.freq=1,
          max.words=10)
```

![](readme_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

3.  Let’s add colors to the wordcloud. Modify the code by setting the
    argument `colors` equal to a vector with two values: `DarkOrange`
    and `Blue`.

``` r
# Create a wordcloud
wordcloud(words=word_frequencies$word, 
          freq=word_frequencies$n,
          min.freq=1,
          max.words=10,
          colors=c("DarkOrange", "Blue"))
```

![](readme_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

4.  By default, words are drawn in random order and color assignment is
    also random. This can be modified by specifying two arguments:
    `random.order` and `random.color`.
5.  Add these arguments to the call of `wordcloud` and set both of them
    to `FALSE`.

``` r
# Create a wordcloud
wordcloud(words=word_frequencies$word, 
          freq=word_frequencies$n,
          min.freq=1,
          max.words=10,
          colors=c("DarkOrange", "Blue"),
          random.order=FALSE,
          random.color=FALSE)
```

![](readme_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

Great! If you wanted to take it further, you can use package
`rcolorBrewer` to obtain nice looking color palettes to pass as an
argument in `wordcloud`

## History of the Byzantine Empire

Theory. Coming soon …

## LDA model fitting - first iteration

This exercise covers the steps from making a document-term matrix to
fitting a topic model and examining the terms in topics.

You are given a table `history` with two columns: `chapter` for chapter
number, and `text` for chapter text.

**Steps**

1.  Create a document-term matrix containing counts of words in
    chapters. Use `anti_join` to exclude stopwords. Save the result into
    variable `dtm`

``` r
# Assign history
# load("data/history_2.RData")
# history <- byzantium_clean
history <- tbe_book_chapters

# Construct a document-term matrix
dtm4 <- history %>% 
      unnest_tokens(input=text, output=word) %>% 
    anti_join(stop_words) %>% 
    count(chapter, word) %>% 
    cast_dtm(document=chapter, term=word, value=n)
```

    ## Joining, by = "word"

2.  Using the document-term matrix you just built, fit an LDA topic
    model for four topics. (We will cover how to find the best number of
    topics in chapter 4.) Use Gibbs method. Do not modify the control
    list.

``` r
# Insert the missing arguments
mod4 <- LDA(x=dtm4, k=4, method="Gibbs", 
           control=list(alpha=1, seed=10005))
```

3.  Display the top 15 words of each topic using function `terms`.

``` r
# Display top 15 words of each topic
terms(mod4, k=15)
```

    ##       Topic 1          Topic 2       Topic 3       Topic 4         
    ##  [1,] "empire"         "greek"       "empire"      "war"           
    ##  [2,] "constantinople" "city"        "emperor"     "roman"         
    ##  [3,] "alexius"        "letter"      "constantine" "justinian"     
    ##  [4,] "emperor"        "century"     "leo"         "army"          
    ##  [5,] "john"           "roman"       "army"        "italy"         
    ##  [6,] "asia"           "byzantium"   "reign"       "king"          
    ##  [7,] "minor"          "constantine" "throne"      "empire"        
    ##  [8,] "fleet"          "world"       "byzantine"   "goths"         
    ##  [9,] "byzantine"      "empire"      "son"         "a.d"           
    ## [10,] "sea"            "hundred"     "capital"     "constantinople"
    ## [11,] "troops"         "st"          "died"        "heraclius"     
    ## [12,] "land"           "emperors"    "age"         "emperor"       
    ## [13,] "hands"          "walls"       "won"         "danube"        
    ## [14,] "son"            "ancient"     "east"        "east"          
    ## [15,] "turks"          "rome"        "michael"     "enemy"

Well done. The words were converted into lowercase, but we can pick out
some names and action verbs.

## Capturing the actions - dtm with verbs

In this exercise you will construct the dtm that will consist entirely
of verbs, and then re-run the LDA algorithm.

You are given the dataframe `verbs` containing present and past tense
forms of English verbs.

**Steps**

1.  Modify the old code so that instead of removing stopwords it will
    return a dtm that contains only the past tense verbs. You will need
    to join on columns `word` and `past`.

``` r
# Load data
verbs <- readRDS("data/verbs.rds")

# Display the structure of the verbs dataframe
str(verbs)
```

    ## tibble [7,522 × 2] (S3: tbl_df/tbl/data.frame)
    ##  $ present: chr [1:7522] "abandon" "abase" "abash" "abate" ...
    ##  $ past   : chr [1:7522] "abandoned" "abased" "abashed" "abated" ...

``` r
# Construct a document-term matrix
dtm5 <- history %>% 
    unnest_tokens(input=text, output=word) %>% 
    inner_join(verbs, by=c("word"="past")) %>% 
    count(chapter, word) %>% 
    cast_dtm(document=chapter, term=word, value=n)
```

2.  Fit the Gibbs-sampling LDA topic model with four topics. Do not
    modify the `control` argument.

``` r
# Fit LDA for four topics
mod5 <- LDA(x=dtm5, k=4, method="Gibbs",
          control=list(alpha=1, seed=10005))
```

3.  Use function `terms` to display top 25 words from each topic

``` r
# Display top 25 words from each topic
terms(mod5, k=25)
```

    ##       Topic 1     Topic 2        Topic 3       Topic 4     
    ##  [1,] "was"       "began"        "kept"        "came"      
    ##  [2,] "had"       "cut"          "raised"      "fell"      
    ##  [3,] "made"      "dwelt"        "stood"       "sent"      
    ##  [4,] "took"      "covered"      "placed"      "appeared"  
    ##  [5,] "found"     "knew"         "marked"      "laid"      
    ##  [6,] "did"       "continued"    "built"       "reigned"   
    ##  [7,] "died"      "did"          "devoted"     "marched"   
    ##  [8,] "left"      "displayed"    "turned"      "said"      
    ##  [9,] "destined"  "proved"       "headed"      "received"  
    ## [10,] "won"       "chose"        "survived"    "refused"   
    ## [11,] "lost"      "granted"      "celebrated"  "fled"      
    ## [12,] "led"       "burst"        "gave"        "slew"      
    ## [13,] "brought"   "strove"       "provoked"    "began"     
    ## [14,] "called"    "troubled"     "described"   "routed"    
    ## [15,] "formed"    "lasted"       "lived"       "threw"     
    ## [16,] "succeeded" "protracted"   "wrote"       "met"       
    ## [17,] "conquered" "checked"      "educated"    "cut"       
    ## [18,] "followed"  "kept"         "established" "served"    
    ## [19,] "forced"    "stormed"      "ground"      "married"   
    ## [20,] "held"      "fell"         "bound"       "got"       
    ## [21,] "seized"    "loved"        "supported"   "proclaimed"
    ## [22,] "broke"     "spoke"        "developed"   "recovered" 
    ## [23,] "became"    "accomplished" "reorganized" "ruled"     
    ## [24,] "put"       "contrived"    "converted"   "scattered" 
    ## [25,] "named"     "preserved"    "produced"    "defeated"

Well done. Verbs may be better at capturing multi-century topics rather
than names of individuals who did not live that long.

## Making a chart

Variable `mod5` contains the LDA model that you fitted in the previous
exercise. All necessary libraries have already been loaded for you.

**Steps**

1.  Make a stacked column chart showing proportions of topics in
    documents/chapters.

``` r
# Extract matrix gamma and plot it
tidy(mod5, "gamma") %>% 
    mutate(document=as.numeric(document)) %>% 
    ggplot(aes(x=document, y=gamma)) + 
    geom_col(aes(fill=factor(topic)))
```

![](readme_files/figure-gfm/unnamed-chunk-25-1.png)<!-- -->

2.  To remind yourself what the topics were about, display the words
    with probability above 0.0075 in each topic.

    -   Use function `terms` with argument `threshold`.

``` r
# Display the words whose probability is above the threshold
terms(mod5, threshold=0.0075)
```

    ## $`Topic 1`
    ##  [1] "destined" "did"      "found"    "had"      "left"     "made"    
    ##  [7] "took"     "was"      "won"      "died"    
    ## 
    ## $`Topic 2`
    ##  [1] "began"        "continued"    "cut"          "did"          "dwelt"       
    ##  [6] "fell"         "loved"        "protracted"   "proved"       "chose"       
    ## [11] "covered"      "burst"        "checked"      "granted"      "kept"        
    ## [16] "lasted"       "strove"       "troubled"     "spoke"        "accomplished"
    ## [21] "contrived"    "displayed"    "knew"         "preserved"    "endeavoured" 
    ## [26] "caused"       "stormed"     
    ## 
    ## $`Topic 3`
    ##  [1] "built"       "devoted"     "established" "gave"        "ground"     
    ##  [6] "marked"      "placed"      "stood"       "turned"      "bound"      
    ## [11] "celebrated"  "described"   "headed"      "lived"       "raised"     
    ## [16] "supported"   "survived"    "developed"   "kept"        "reorganized"
    ## [21] "converted"   "provoked"    "wrote"       "produced"    "wounded"    
    ## [26] "educated"    "immured"    
    ## 
    ## $`Topic 4`
    ##  [1] "appeared" "began"    "came"     "cut"      "fell"     "laid"    
    ##  [7] "received" "refused"  "reigned"  "said"     "served"   "threw"   
    ## [13] "marched"  "sent"     "fled"     "married"  "slew"     "met"     
    ## [19] "routed"   "got"

Stacked bars make comparison of topic proportions difficult. It is
easier to compare values when they are shown in line plots.

3.  You are given a code that will generate a line plot. Specify new
    axes labels: set x label to `Chapter` and y label to
    `Topic probability`.

``` r
# Extract matrix gamma and plot it
tidy(mod5, "gamma") %>% 
    mutate(document=as.numeric(document)) %>% 
    ggplot(aes(x=document, y=gamma)) + 
    geom_line(aes(color=factor(topic))) + 
    labs(x="Chapter", y="Topic probability") +
    scale_color_manual(values=brewer.pal(n=4, "Set1"), name="Topic")
```

![](readme_files/figure-gfm/unnamed-chunk-27-1.png)<!-- -->

Great job. You can trace the history of the Byzantine Empire through
action-oriented topics.

## Use wordclouds

The flaw of function `terms()` is that it does not display the absolute
value of the word probability. By comparison, wordclouds can convey that
information through font size. In this exercise you will make wordclouds
for topics found in the text on Byzantine Empire.

You are given the object with LDA model `mod`. You’re going to complete
the script to draw four wordlcouds, one for each topic. You will be able
to cycle through them in the output window.

**Steps**

1.  Generate a table of word frequencies for each topic.
2.  Display the word cloud. You need to pass the terms to the
    `word`argument and the frequencies to the `freq` argument. The
    for-loop will do one chart per topic.

``` r
# Display wordclouds one at a time
for (j in 1:4) {
  # Generate a table with word frequences for topic j
  word_frequencies <- tidy(mod5, matrix="beta") %>% 
    mutate(n = trunc(beta * 10000)) %>% 
    filter(topic == j)

  # Display word cloud
  wordcloud(words = word_frequencies$term, 
            freq = word_frequencies$n,
            max.words = 20,
            scale = c(3, 0.5),
            colors = c("DarkOrange", "CornflowerBlue", "DarkRed"), 
            rot.per = 0.3)
}
```

![](readme_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->![](readme_files/figure-gfm/unnamed-chunk-28-2.png)<!-- -->![](readme_files/figure-gfm/unnamed-chunk-28-3.png)<!-- -->![](readme_files/figure-gfm/unnamed-chunk-28-4.png)<!-- -->

Wonderful. You can navigate across topics by clicking the ‘Previous
Plot’ and ‘Next Plot’ buttons to see other charts.

# 3. Named entity recognition as unsupervised classification

This chapter goes into detail on how LDA topic models can be used as
classifiers. It covers the importance of the Dirichlet shape parameter
alpha, construction of word contexts for named entities using regex, and
technical issues like corpus alignment and held-out data.

## Using topic models as classifiers

Theory. Coming soon …

**1. Using topic models as classifiers**

In this lesson you will learn how LDA can be used as a classifier, and
what role control parameters alpha and delta play.

**2. Topic models as soft classifiers**

Although many applications of topic models involve topic discovery -
finding out what topics are present in a body of documents - we can also
apply topic modeling for document classification. In that case, we do
not need to worry about finding the best number of topics. Instead, we
need to tune the model so it works best as a classifier.In this chapter
we will examine Named Entity Recognition - a task arising in processing
text. An entity is a word, or several words, referring to a proper
noun - a person, a place, or a corporation, if you are working with
business documents.For example, in the sentence “Washington crossed the
Delaware”, the reference is to George Washington, a person. In the
phrase, “They did a road trip across Washington”, the reference is to a
place, Washington state.The context in which the entity appears gives us
clues on the entity’s meaning. We can perform topic modeling of the
entity context words and use the result as the classification.

**3. Effect of control parameter alpha**

With the number of topics k known, the control parameters alpha and
delta begin to matter.Back in chapter 2 we had a small corpus consisting
of five sentences. We knew that there were only two topics: restaurants
and loans. First two sentences were about loans, sentences 3 and 4 were
about restaurants, and sentence 5 had words related to both topics.Back
then you did a short exercise which illustrated the effect of alpha -
when alpha was set to 25, each document was equally likely to belong to
topic 1 and topic 2 - the split was 50/50.Now we can examine in more
detail why this has happened.

**4. How LDA fits a model**

In order to understand where alpha matters, we need to talk a little bit
about how the LDA algorithm fits a model.The key analogy here is with a
bag of M&M candy. The candy come in a small number of preset colors.
Frequency of colors is fixed at the factory that filled the bag.Imagine
that you reach in and grab ten pieces of candy. The probability that you
got 5 yellow, 2 brown, 2 blue, and 1 black pieces is modeled by
something called multinomial distribution. For comparison, binomial
distribution describes the flips of a coin where there are only two
outcomes. Multinomial distribution has more than two outcomes.In LDA
algorithm, topics correspond to colors, and there are actually two
“bags” from which items are drawn. One bag corresponds to documents,
another to words.

**5. The Dirichlet in LDA**

If the topics are color, and documents are candy, how does the LDA
algorithm find the probabilities of topics that give the best fit?One
approach is to search for each combination, but it becomes very
difficult when the number of topics, documents and words goes
up.Instead, the LDA algorithm relies on the Dirichlet distribution to
produce these values.The Dirichlet distribution returns a set of
positive numbers that are less than 1, and sum up to 1 - the properties
we want in a probability distribution.Here is an example of five draws
from a 3-dimensional Dirichlet distribution. Note how each row adds up
to 1. Each row could serve as a guess for the probability of topics in
documents.

**6. Dirichlet distribution**

Here is a chart with the density profile of a 3-dimensional Dirichlet
distribution.The dimensions correspond to the corners of a triangle:
(1,0,0), (0,1,0), and (0,0,1)Combinations of dimensions will serve as
the multinomial distribution modeling probabilities of topics.The peaks
in the corners indicate that the most likely outcomes will be where one
topic heavily dominates over others in a document.

**7. alpha and the shape of Dirichlet distribution**

Now we can finally see the effect of alpha on the probabilities of
topics in documents.When alpha is greater than 1, the distribution has
most of its mass in the center. This means that the more likely
combinations of probabilities will be equal fractions of 1. For
instance, (0.33, 0.33, 0.33) if we are dealing with 3 topics.When alpha
is less than 1, the mass will be concentrated in the corners, and the
more likely combinations will be something like (0.8, 0.1, 0.1), heavily
favoring one topic.Parameter delta has a similar role, but for the
distribution that models probabilities of words belonging to topics.As
you will see in the exercises, it matters a lot when we want to use LDA
topic modeling as a classifier.

**8. Let’s practice!**

By now you have seen a lot of slides talking about effect of alpha.
Let’s explore this with numbers.

## Same k, different alpha

You are given a document-term matrix `dtm` describing the five-sentence
corpus of two topics. You will re-run the LDA algorithm, changing the
value of `alpha`, and compare the outcomes.

**Steps**

1.  Experiment with fitting a topic model and clicking Run Code for the
    following values of `alpha`: 0.5, 1, 2, and NULL.
2.  When you are done, click Submit Answer with `alpha` equal to `NULL`.

``` r
# load data
dtm6 <- readRDS("data/dtm6.rds")

# Fit a topic model using LDA with Gibbs sampling
mod6_1 = LDA(x=dtm6, k=2, method="Gibbs", 
          control=list(iter=500, thin=1,
                      seed = 12345,
                      alpha=NULL))

# Display topic prevalance in documents as a table
tidy(mod6_1, "gamma") %>% spread(topic, gamma)
```

    ## # A tibble: 90 × 3
    ##    document   `1`   `2`
    ##    <chr>    <dbl> <dbl>
    ##  1 1047736  0.537 0.463
    ##  2 109738   0.663 0.337
    ##  3 1107465  0.464 0.536
    ##  4 1125897  0.225 0.775
    ##  5 1131046  0.538 0.462
    ##  6 1151252  0.429 0.571
    ##  7 1220615  0.628 0.372
    ##  8 1244489  0.351 0.649
    ##  9 1311540  0.652 0.348
    ## 10 1321339  0.236 0.764
    ## # … with 80 more rows

> ## *Question*
>
> Which value of alpha leads to the 50/50 (plus minus 2 percent) split
> in topic prevalence in all documents?<br> <br> ✅ alpha=NULL<br> ⬜
> alpha = 2<br> ⬜ alpha = 1<br> ⬜ alpha = 0.5<br>

Yes. When alpha is NULL, the package sets alpha = 50/k which in our case
is 25. This favors topic proportions that are nearly equal to each
other.

## Probabilities of words in topics

Parameter alpha determines the values of probabilities that a document
belongs to a topic. Parameter delta does the same for probability
distribution of words over topics. By default, delta is set to 0.1. You
will fit a model with a different delta and make a plot of results.

**Steps**

1.  Fit the model for delta set to 0.1, create a tidy table containing
    probabilities `beta` for words from the `my_terms` vector and make a
    stacked column chart from the data.

``` r
# Fit the model for delta = 0.1
mod1_5 <- LDA(x=dtm1, k=2, method="Gibbs",
         control=list(iter=500, seed=12345, alpha=1, delta=0.1))

# Define which words we want to examine
my_terms = c("loans", "bank", "opened", "pay", "restaurant", "you")

# Make a tidy table
t <- tidy(mod1_5, "beta") %>% filter(term %in% my_terms)

# Make a stacked column chart of word probabilities
ggplot(t, aes(x=term, y=beta)) + geom_col(aes(fill=factor(topic))) +
  theme(axis.text.x=element_text(angle=90))
```

![](readme_files/figure-gfm/unnamed-chunk-30-1.png)<!-- -->

2.  Fit the model for delta set to 0.5, create a tidy table containing
    probabilities `beta` for words from the `my_terms` vector and make a
    stacked column chart from the data.

``` r
# Fit the model for delta = 0.5
mod1_6 <- LDA(x=dtm1, k=2, method="Gibbs",
         control=list(iter=500, seed=12345, alpha=1, delta=0.5))

# Define which words we want to examine
my_terms = c("loans", "bank", "opened", "pay", "restaurant", "you")

# Make a tidy table
t <- tidy(mod1_6, "beta") %>% filter(term %in% my_terms)

# Make a stacked column chart
ggplot(t, aes(x=term, y=beta)) + geom_col(aes(fill=factor(topic))) +
  theme(axis.text.x=element_text(angle=90))
```

![](readme_files/figure-gfm/unnamed-chunk-31-1.png)<!-- -->

Good. The probabilities of words are more even in the second chart, when
delta was set to 0.5. Modifying delta lets you control how exclusive the
topic should be.

## From word windows to dtm

Theory. Coming soon …

**1. From word windows to dtm**

A context of an entity is represented by a word window. In this lesson
you will learn how to extract them and transform them into a dtm.

**2. Word window**

An entity is a word that refers to a personal noun. We usually can tell
personal nouns because they are capitalized.A word window is a sequence
of words with the entity word in the middle. It is similar to the
context, because it shows the words that occur together with the
entity.For example, a phrase “attention of Megara was turned” is a
window for entity Megara, with two words on the left and two on the
right.We can differentiate the words by adding a suffix to tell where
the word was originally located: first on the left (L1), or second on
the right (R2).

**3. A document for every entity**

Once we have the word windows for entities, we can combine them, making
one document per entity. We can use function paste() inside of
summarise() for this purpose.Here is an example of the document for
entity `Anastasius`. It consists of four words which came from two word
windows.You can tell that the entity is a person: usually we do not say
that a geographic entity “has bequeathed” anything.

**4. Finding entities with regular expressions & stringr**

How would we find entities? Because an entity is a capitalized word, we
can detect it using regular expressions: we will look for a word that
has one uppercase letter followed by one or more lowercase letters.We
can do that with the basic regex functions: gregexpr() and
regmatches().Let’s look at the pattern used in the code example. In the
simplest form, a regular expression pattern consists of declarations of
character classes and quantifiers.The class can be specified as a range
of characters. The range is based on the ASCII codes: “a” has smaller
code than “z”, and “0” has smaller code than “9”.Quantifiers specify how
many times a character (or a sequence of them) may occur. There is a
lower bound “n”, and upper bound “m”.There are some shortcuts: the
question mark stands for “occurs zero or one time”, plus sign means
“occurs one or more times”, asterisk - “occurs zero or more times”.Our
pattern was one upper-case letter followed by one or more lower-case
letters.

**5. Regular expressions with groups**

In regular expressions, parentheses serve to group some patterns
together. As a quick aside, parentheses can also serve to capture the
groups - store their contents for later use.As an example, take a look
at the new pattern for an entity. Compared to the previous one, it will
match entities that have `St.` in them.It includes a group - characters
S, t, dot, whitespace, followed by a quantifier.The quantifier is the
question mark, meaning that the group can occur zero or one times. In
other words, this group is optional. If it occurs, it will be included,
and if it does not, the pattern will still match.

**6. Using capture groups to add a suffix**

And now we can talk about capture groups. Characters inside parentheses
can be referenced later on in the pipeline of operations.The most
widespread use is in substitution, as in this example. Function gsub()
replaces a pattern throughout the whole text string.The pattern contains
two capture groups, each one being a lowercase word.The caret symbol is
an anchor that specifies position in the string - the start. Dollar sign
is the anchor for end of string.The string with backslashes and a number
is a reference to a capture group. The search pattern in gsub() says
“match two lower case words, one in each group”. The substitution
pattern says “insert contents of group 1 followed by underscore L1”, and
“insert contents of group 2 followed by underscore L2”The result is that
the words on the left now have suffixes and later on we will known which
side of the entity they came from.

**7. Let’s practice**

By now you refreshed upon the basics of regular expressions. Let’s
practice and put them to use.

## Regex patterns for entity matching

Vector `text` contains text of chapters of The Byzantine Empire by
Charles Oman. You will experiment with the regex patterns for entity
matching.

**Steps**

1.  You are given a pattern that will match a capitalized word and two
    lowercase words before and after. Find how many times this pattern
    matched.

``` r
# Create text
text <- tbe_book_chapters$text

# Regex pattern for an entity and word context
p1 <- "( [a-z]+){2}( (St[.] )?[A-Z][a-z]+)+( [a-z]+){2}"

# Obtain the regex match object from gregexpr
m <- gregexpr(p1, text)

# Get the matches and flatten the list
v <- unlist(regmatches(text, m))

# Find the number of elements in the vector
length(v)
```

    ## [1] 1505

2.  The vertical bar `|` in regex means logical OR. You now have a
    modified pattern, `p2`, that has a nested group
    `( (of|the) [A-Z][a-z]+)?`. It matches entities like ‘Alexander the
    Great’ or ‘Darius of Persia’.
3.  Find how many entities you match now.

``` r
# Regex pattern for an entity and word context
p2 <- "( [a-z]+){2}( (St[.] )?[A-Z][a-z]+( (of|the) [A-Z][a-z]+)?)+( [a-z]+){2}"

# Obtain the regex match object from gregexpr
m <- gregexpr(p2, text)

# Get the matches and flatten the list
v = unlist(regmatches(text, m))

# Find the number of elenents in the vector
length(v)
```

    ## [1] 1533

> ## *Question*
>
> Which pattern, `p1` or `p2`, returned more matches?<br> <br> ⬜ `p1`
> returned more matches.<br> ✅ `p2` returned more matches.<br> ⬜ They
> both returned the same number of matches.<br>

Yes! By making the pattern more general, we were able to match more
entities: 1533 vs. 1505

## Making a corpus

You are given the pattern `entity_pattern` for the named entity. Vector
`v` contains strings with named entities and two words to the left and
to the right of the entity. You are going to make a table containing
entity and its context as two columns.

**Steps**

1.  Print out the contents of the pattern string `entity_pattern`.
2.  Function `gsub()` can be used to cut out strings by replacing them
    with zero-length strings,
    e.g. `gsub('[0-9]', "", "Year of 1203 CE")` will return
    `Year of  CE`. Use this trick to remove the named entity from text.
    This will produce the entity’s context.
3.  Save the result into variable `v2`.

``` r
# Print out contents of the `entity_pattern`
entity_pattern <- "( (St[.] )?[A-Z][a-z]+( (of|the) [A-Z][a-z]+)?)+"

# Remove the named entity from text
v2 <- gsub(entity_pattern, "", v)

# Display the head of v2
head(v2)
```

    ## [1] " into the shore of"       " settlers were of the"   
    ## [3] " cities of in the"        " to the to plant"        
    ## [5] " attention of was turned" " of the and the"

4.  Regex capture groups can be used to add suffixes to lowercase. You
    are given a pattern `p` that will add suffixes `L1` and `L2`. Modify
    `p` so that `gsub()` would also add suffixes `R1` and `R2` to words
    occurring on the right side of the context.
5.  Add backreferences to capture groups 3 and 4 and add suffixes ‘R1’
    and ‘R2’ respectively.

``` r
# Remove the named entity
v2 <- gsub(entity_pattern, "", v)

# Pattern for inserting suffixes
p <- "\\1_L1 \\2_L2 \\3_R1 \\4_R2"

# Add suffixes to words
context <- gsub("([a-z]+) ([a-z]+) ([a-z]+) ([a-z]+)", p, v2)
```

6.  By now you have vector `v2` which contains the new “documents” -
    context words of named entities. You have figured out how to add
    suffixes to the context words using `gsub()`. Now, two last steps
    toward making a corpus: converting the context strings into a data
    frame, and assigning named entity string as document ids.

    -   Generate a regular expression match object by using `gregexpr()`
        First argument is the pattern, second argument is text. Store
        the result in variable `re_match`.
    -   Extract named entities and make a data frame named `corpus` with
        columns `doc_id` and `text` to make a document-term matrix.
        Function `regmatches()` will return a list with matched strings,
        which you can flatten by using `unlist()`.

``` r
# Extract named entity and use it as document ID
re_match <-  gregexpr(entity_pattern, v)
doc_id   <- unlist(regmatches(v, re_match))

# Make a data frame with columns doc_id and text
corpus2 <- data.frame(doc_id = doc_id, text = context, stringsAsFactors = F)
```

Very good! Regex functions can be tricky but you figured it out.

## From dtm to topic model

You are given data frame `corpus`. Each row corresponds to one
occurrence of a named entity. Column `doc_id` contains the entity,
`text` - the context words with suffixes. You will build a document-term
matrix and will fit a topic model.

**Steps**

1.  We need to combine text from multiple occurrences of the same entity
    into one document. Using `dplyr`, for each entity (`doc_id`)
    generate a summary variable `doc` that will contain combined `text`
    strings. Save the result into table `corpus3`.

``` r
# Summarize the text to produce a document for each doc_id
corpus3 <- corpus2 %>% 
            group_by(doc_id) %>% 
            summarize(doc = paste(text, collapse = " "))
```

2.  Now that we have dataframe `corpus3`, we are on familiar grounds.
    Create a document-term matrix and save it into variable `dtm7`.

``` r
# Make a document-term matrix
dtm7 <- corpus3 %>% 
        unnest_tokens(input = doc, output = word) %>% 
        count(doc_id, word) %>% 
        cast_dtm(document = doc_id, term = word, value = n)
```

3.  Fit a Latent Dirichlet allocation topic model with `k=3`. Keep the
    `control` argument as is.

``` r
# Fit an LDA model for 3 topics
mod7 <- LDA(x = dtm7, k = 3, method = "Gibbs", 
          control=list(alpha = 1, seed = 12345, iter = 1000, thin = 1))
```

4.  Using function `tidy`, extract matrix `gamma` with probabilities of
    topics in documents, and convert it to a wide format using `spread`.

``` r
# Create a table with probabilities of topics in documents
topics <- tidy(mod7, matrix="gamma") %>% 
            spread(topic, gamma)
```

Excellent. Later on we will use this model in a classifier.

## Corpus alignment and classification

Theory. Coming soon …

**1. Corpus alignment and classification**

In this lesson you will learn how to use a pre-trained model as a
classifier on new data, and how this step requires aligning the
vocabularies of the new input and the model.

**2. Unsupervised classification**

In the previous lesson, we fitted a topic model for k=3. It is useful
for telling the meaning of a named entity.For example, the code below
retrieves the probabilities of three topics for five documents. Three of
them - Alboin, Amorium, and Cappadocian - are unknown to
me.Probabilities of topics suggest that Alboin is similar to Alexander -
it is a person, while Amorium and Cappadocian are related to geographic
names.

**3. Using pre-trained model**

Ideally, we would like to use a pre-trained model to find probabilities
of topics for entities that were not seen before.This can be done using
function posterior() in package topicmodels.This function accepts a
model and new data, and returns posterior probabilities of words in
topics and topics in documents.There is a new problem we would face in
this: corpus alignment.Internally, LDA algorithm iterates over items
which are known by their index number. Thus, two dtm’s with different
terms but same number of columns would appear the same to the LDA. It is
our responsibility to make sure that the document-term matrix of the new
data is consistent with the vocabulary of the model.

**4. Corpus alignment**

Corpus alignment involves making sure that the document-term matrix for
the new data includes only the words that were present in the corpus
when the topic model was fitted.An easy way to extract model’s
vocabulary is to use tidy() with argument matrix=“beta” - it will return
probabilities of words in topics. We really need only the column
“term”.We can accomplish corpus alignment by doing a right-join between
the new document’s table of counts and the table with model’s
vocabulary. Right-join drops the rows of the left-side table if they
have no match, and keeps all rows of the right-side table.One side
effect of doing the right-join is that we will have to deal with the NA
values which will appear in the column with counts and document ids.

**5. Handling NA values**

Right-join will leave us with NA values in two columns: the word counts,
and the doc ID. We could easily handle the word counts with an ifelse()
function, changing them to 0.Handling document names is a bit trickier.
If we do nothing, then, when we perform cast_dtm(), we will end up with
a new document. Its name will be “NA”.So, instead, we will take the
first “good” document id and use it to replace NAs. It will not distort
the prediction because the word counts in these rows are zeros, anyways.

**6. Held-out data**

If you took any classes on machine learning, you are familiar with a
discussion about over-fitting and that a classifier must be tested on a
different set of records than the ones used for training.In topic
models, there is a similar concept of held-out data. There are two
variations of the approach, though.In one, we would remove whole
documents from testing. This is similar to setting aside a dataset for
testing in machine learning.In the other approach, a certain percentage
of terms (for example, 50%) are removed from some documents, and these
documents are used as the test set. The quality of the fit is estimated
through “held-out likelihood”.In this course, for the sake of
simplicity, we will withhold a small set of full documents and examine
how they got classified.

**7. Let’s practice!**

Let’s practice.

## Train a topic model

You are given a table `corpus3`: column `doc_id` contains the named
entity, column `doc` contains context words of entities. You will take a
random sample of documents, construct a training dataset and use it to
make a topic model.

**Steps**

1.  Take a sample of 20 random integers in the range from 1 to
    `nrow(corpus2)` and assign it to variable `r`. These will be the
    testing rows.
2.  Pass a subset of the dtm, with the testing rows excluded, as an
    argument to `unnest_tokens`, to create a dtm with training data.
3.  Fit an LDA topic model for `k=3` on the training data.

``` r
# Set random seed for reproducability
set.seed(12345, sample.kind="Rounding")
```

    ## Warning in set.seed(12345, sample.kind = "Rounding"): non-uniform 'Rounding'
    ## sampler used

``` r
# Take a sample of 20 random integers, without replacement
r <- sample.int(n=nrow(corpus3), size=20, replace=FALSE)

# Generate a document-term matrix
train_dtm <- corpus3[-r, ] %>% 
                unnest_tokens(input=doc, output=word) %>% 
                count(doc_id, word) %>% 
                cast_dtm(document=doc_id, term=word, value=n)

# Fit an LDA topic model for k=3
train_mod <- LDA(x=train_dtm, k=3, method="Gibbs",
                control=list(alpha=1, seed=10001,
                             iter=1000, thin=1))
```

Very good! We just trained our classifier.

## Align corpus

You have LDA model object `train_mod` and table `corpus3` with initial
data. You will need to align the corpus of the test records and make a
document-term matrix for testing.

**Steps**

1.  Rerun `sample.int` with `set.seed` to reproduce the row indices for
    testing rows.
2.  Extract vocabulary of the training model using `tidy`
3.  Create a table of counts, making sure that you keep only the rows
    with words that were present in the training data
4.  Generate a document-term matrix with the testing data

``` r
# Get the test row indices
set.seed(12345, sample.kind="Rounding")
```

    ## Warning in set.seed(12345, sample.kind = "Rounding"): non-uniform 'Rounding'
    ## sampler used

``` r
r <- sample.int(n=nrow(corpus3), size=20, replace=FALSE)

# Extract the vocabulary of the training model
model_vocab <- tidy(train_mod, matrix="beta") %>% 
  select(term) %>% distinct()

# Create a table of counts with aligned vocabularies
test_table <- corpus3[r, ] %>% unnest_tokens(input=doc, output=word) %>% 
  count(doc_id, word) %>%
  right_join(model_vocab, by=c("word"="term"))

# Prepare a document-term matrix
test_dtm <- test_table %>% 
  arrange(desc(doc_id)) %>% 
  mutate(doc_id = ifelse(is.na(doc_id), first(doc_id), doc_id),
         n = ifelse(is.na(n), 0, n)) %>% 
  cast_dtm(document=doc_id, term=word, value=n)
```

Excellent! This exercise packed a lot of steps, but you did them all.

## Classify test data

You have a data object `train_mod` with an LDA model, and a
document-term matrix `test_dtm` with data for the test cases. Now you
can see how well (or how poorly) our classifier performs.

**Steps**

1.  Obtain posterior probabilities for test documents using function
    `posterior()`.
2.  Probabilities of topics in documents are contained in the element
    `$topics` inside the `result` list. Display the matrix with topic
    probabilities.

``` r
# Obtain posterior probabilities for test documents
results <- posterior(object=train_mod, newdata=test_dtm)

# Display the matrix with topic probabilities
results$topics
```

    ##                            1         2          3
    ##  Visigothic        0.4285714 0.4285714 0.14285714
    ##  Theodorics        0.1000000 0.7000000 0.20000000
    ##  Stephen Lecapenus 0.1666667 0.3333333 0.50000000
    ##  St. Louis         0.4000000 0.2000000 0.40000000
    ##  Po                0.2857143 0.2857143 0.42857143
    ##  Patriarch Sergius 0.1428571 0.4285714 0.42857143
    ##  Parthian          0.1428571 0.5714286 0.28571429
    ##  Paris             0.6000000 0.2000000 0.20000000
    ##  John Cantacuzenus 0.3750000 0.5000000 0.12500000
    ##  Hunnish           0.1666667 0.5000000 0.33333333
    ##  Hun               0.1428571 0.2857143 0.57142857
    ##  Germans           0.3809524 0.1904762 0.42857143
    ##  Gaul              0.2857143 0.4285714 0.28571429
    ##  Gainas            0.8148148 0.1111111 0.07407407
    ##  Empress           0.2857143 0.1428571 0.57142857
    ##  Central Italy     0.1428571 0.2857143 0.57142857
    ##  Cappadocian       0.1666667 0.5000000 0.33333333
    ##  Caesar            0.6000000 0.2000000 0.20000000
    ##  Amalphi           0.5714286 0.1428571 0.28571429
    ##  Abu Obeida        0.2000000 0.4000000 0.40000000

Nice! The named entities are used as document IDs, which makes reading
the table easy.

## Explore the results

Print out the table `results$topics` and note the values for the rows
where the document name is ” Amalphi”. (The space before the entity is
the result of the pattern we used.) Look up the articles in Wikipedia
for Amalphi. Choose the option below that describes the results:

> ## *Question*
>
> ???<br> <br> ✅ Amalphi is a town and topic 1 corresponds to
> geographic names.<br> ⬜ Amalphi was a king and topic 1 corresponds to
> personal names.<br> ⬜ Amalphi is a town and topic 2 corresponds to
> geographic names.<br>

Yes! There are some exceptions, but topic 1 has the highest probability
of being in document ” Amalphi”.

# 4. How many topics is enough?

This chapter explains the basic methods used in the search for the
optimal number of topics. It also covers how to use a single document as
a source of data, and how topic numbering can be controlled using seed
words.

## Finding the best number of topics

Theory. Coming soon …

**1. Finding the best number of topics**

In this chapter you will learn how to determine `k` - the number of
topics that must be provided to the LDA algorithm

**2. Approaches**

In the examples so far we did not explore what the value of k - the
number of topics in a model - should be. In the case of restaurants and
loans it was obvious that k should be 2, but in the case of Byzantine
Empire it was far from clear. Now we can get a look into how we
determine the value of k.In general, there are two approaches. One
involves fitting a model, inspecting the words that were assigned to
topics, and deciding if the topics make sense. This is known as topic
coherence.\</br\>If we see words that normally should not occur
together, we conclude that coherence is low. For example, if we expect
the topic to be about archeology and we see the top words to be site,
settlement, excavation, and popsicle, then we know that something went
wrong. A popsicle usually does not occur in texts on archeology.
\</br\>Another approach involves looking at quantitative measures of
fit: log-likelihood and perplexity. \</br\>Log likelihood is a measure
of how plausible the model parameters are given the data\</br\>and
perplexity is a measure of “surprise” when the model is given new
data\</br\>

**3. Log-likelihood**

Likelihood is a measure of how plausible model parameters are given the
data.\</br\>Calculating the likelihood involves multiplying
probabilities of individual outcomes. By taking a logarithm,
multiplication is transformed into summation, which is easier to
implement, and hence we work with log-likelihood.\</br\>All
probabilities are values that are less than 1. When x is less than 1,
logarithm of x will be less than zero. Log-likelihood is a negative
number.\</br\>Gibbs sampling is used to find the parameters which would
have the highest log-likelihood. Note that the comparison is not by
absolute magnitudes, but by position on the numbers scale: a
log-likelihood of minus one hundred is better than a log-likelihood
value of minus one hundred and five.\</br\>Function `logLik` in
`topicmodels` returns the log-likelihood of an LDA model.\</br\>

**4. Log-likelihood**

This chart shows an example of how LDA searches for the model with the
best log-likelihood. There is an initial period, called “burn-in”, where
the algorithm is producing suboptimal values, followed by the more or
less steady exploration of parameter space.\</br\>

**5. Perplexity**

Perplexity is a mesuare of model’s surprise at the data\</br\>It is a
positive number\</br\>and the less surprise the better. That is, we
prefer a model whose perplexity is smaller \</br\>Function `perplexity`
in package `topicmodels` will return the surprise of the model when
presented newdata.\</br\>

**6. Finding the best k**

In order to find the best value for k, we fit the model for the varying
number of clusters and record the results.\</br\>Then we plot the
log-likelihood and perplexity \</br\>and look for ‘bends’ in the curves
which are either the optimum or after which the improvements are not as
dramatic.\</br\>If you have done k-means clustering, you are familiar
with this approach. This is similar to making the “elbow plot” and
looking for the value where the curve bends. \</br\>In this code example
we are using a for-loop to iterate over the values of k\</br\>

**7. Plot of perplexity**

Like in k-means clustering, the trivial solution to the best fit is when
the number of clusters is equal the number of documents.However, we are
searching for a balance between the smaller number of clusters and the
quality of the fit.”k equal six” is a local minimum, which suggests it
could be a reasonable choice.

**8. Time costs**

Searching for the best `k` can take a lot of time. \</br\>The running
time is determined by several factors: the number of documents, number
of terms, and number of iterations. \</br.The good news is that model
fitting can be resumed: we can the model, save it, and then use the
result as the starting point later on.\</br\>Function `LDA` accepts a
topic model as an object for initialization.\</br\>Here is a code
example showing how we run the LDA for one thousand iterations, save the
model, then use it as the starting point and run the model for two
hundred iterations more.\</br\>.

**9. Practice dataset**

In this lesson we will use a simple dataset for practice. It is a corpus
of 90 documents\</br\>These documents are abstracts of projects approved
for funding by the US National Science Foundation\</br\>The 90 documents
are a sample from the search for four keywords: mathematics, physics,
chemistry, and marine biology.\</br\>Here is a snippet from one of the
documents\</br\>

**10. Let’s practice**

We got the theory. Now it’s time to practice.

## Preparing the dtm

You are given a dataframe `df` containing 90 abstracts of NSF awards.
Its three columns are `Abstract`, `AwardNumber`, and `field`. Your task
is to construct a document-term matrix, with stop words being filtered
out. Use `AwardNumber` as the document ID.

**Steps**

1.  Split the Abstract column into tokens.
2.  Remove stopwords.
3.  Count the number of occurrences.
4.  Create a document term matrix.

``` r
# Load data
df <- readRDS("data/df.rds")

# Split the Abstract column into tokens
dtm8 <- df %>% 
  
   # Fix missing spaces after dots and colons (except for decimal places in numbers)
   mutate(Abstract = Abstract |> str_replace_all("(?<!\\d)[:\\.](?!\\d)", " ")) |> 
  
   unnest_tokens(input=Abstract, output=word) %>% 
   # Remove stopwords
   anti_join(stop_words) %>% 
   # Count the number of occurrences
   count(AwardNumber, word) %>% 
   # Create a document term matrix
   cast_dtm(document=AwardNumber, term=word, value=n)
```

    ## Joining, by = "word"

Well done! Let’s keep going.

## Filtering by word frequency

The small size of our corpus poses a problem: some terms will occur only
once and are not useful for inferring the topics. In this exercise your
task is to remove the words whose corpus-wide frequency is less than 10.
This will require grouping by words and then adding up per-document
frequencies.

Unnesting tokens and removing stopwords using `anti_join()` has already
been done for you.

**Steps**

1.  Count occurrences within documents/awards.
2.  Group the data using `word` as the grouping variable.
3.  Filter using a nested call to `sum(n)` for corpus-wide frequency
    that is 10 or higher.
4.  Ungroup the data and create a document-term matrix.

``` r
library(SnowballC)
# rems <- c( "context", "dai", "ecologi", "ph","qepa", "size")

dtm9 <- df %>% 
  
  # Fix missing spaces after dots and colons (except for decimal places in numbers)
   mutate(Abstract = Abstract |> str_replace_all("(?<!\\d)[:\\.](?!\\d)", " ")) |> 
  
   unnest_tokens(input=Abstract, output=word) %>% 
   anti_join(stop_words) %>% 
  
  mutate(word = wordStem(word)) %>%
  
   # Count occurences within documents
   count(AwardNumber, word) %>%
  
  # filter(!(word %in% rems)) |> 
  
   # Group the data
   group_by(word) %>% 
   # Filter for corpus wide frequency
   filter(sum(n) >= 10) %>% 
   # Ungroup the data andreate a document term matrix
   ungroup() %>% 
   cast_dtm(document=AwardNumber, term=word, value=n)
```

    ## Joining, by = "word"

Excellent. Now we move on to model fitting.

## Fitting one model

With the document-term matrix in hand(load), your task now is to fit a
topic model and examine its log-likelihood and perplexity.

**Steps**

1.  Create a LDA model. Set `k=3` and `method="Gibbs"`. Do not modify
    the `control` argument.
2.  Retrieve the log-likelihood of the model.
3.  Find perplexity for the dataset.

``` r
dtm10 <- readRDS("data/dtm10.rds")

# Create a LDA model
mod10_1 <- LDA(x=dtm10, method="Gibbs", k=3, 
          control=list(alpha=0.5, seed=1234, iter=500, thin=1))
          
# Retrieve log-likelihood
logLik(mod10_1)
```

    ## 'log Lik.' -64691.15 (df=1434)

``` r
# Find perplexity
perplexity(object=mod10_1, newdata=dtm10)
```

    ## [1] 291.3196

Very good. Just a reminder: log-likelihood is always a negative number,
and perplexity - a positive.

## Using perplexity to find the best k

To save you time, you are given a list ‘models’ that contains LDA models
fitted for values of `k` from 2 to 10. You will examine the current
quality of fit, let LDA do more iterations on the models, and compare
the outcomes.

**Steps**

1.  Generate a plot of perplexity vs. k similar to the one you’ve seen
    in the lesson.

``` r
# load data
models <- readRDS("data/models.rds")

# Display names of elements in the list
names(models[[1]])
```

    ## [1] "k"              "model"          "log_likelihood" "perplexity"

``` r
# Retrieve the values of k and perplexity, and plot perplexity vs k
x <- sapply(models, '[[', 'k')
y <- sapply(models, '[[', 'perplexity')
plot(x, y, xlab="number of clusters, k", ylab="perplexity score", type="o")
```

![](readme_files/figure-gfm/unnamed-chunk-47-1.png)<!-- -->

2.  Run each model from the `models` list for an additional 100
    iterations. Record the new perplexity scores. An LDA model can be
    retrieved using `models[[i]]$model` reference.

``` r
# Record the new perplexity scores
new_perplexity_score <- numeric(length(models))

# Run each model for 100 iterations
for (i in seq_along(models)) {
  mod10_2 <- LDA(x=dtm10, model=models[[i]]$model,
             control=list(iter=100, seed=12345, thin=1))
  new_perplexity_score[i] <- perplexity(object=mod10_2, newdata=dtm10)
}
```

3.  Generate a plot of new perplexity scores.

``` r
# Specify the possible values of k and build the plot
k <- 2:10
plot(x=k, y=new_perplexity_score, xlab="number of clusters, k", 
     ylab="perplexity score", type="o")
```

![](readme_files/figure-gfm/unnamed-chunk-49-1.png)<!-- -->

> ## *Question*
>
> Did running the models for additional 100 iterations change the
> preferred number of topics?<br> <br> ⬜ Yes. The new preferred value
> of `k` is 4.<br> ✅ No. The preferred value is the same, `k=6`.<br>

Yes. The local minimum did not move.

## Topic models fitted to novels

Theory. Coming soon …

**1. Topic model fitted on one document**

In this chapter you will learn how to prepare documents for topic
modeling when your data is one long text.

**2. Analyzing one (long) novel**

So far we had chapters of a book act as individual documents, and we
also built documents from the word context of a named entity.Often,
especially in digital humanities, you will see applications where a
topic model is fitted to one very large textual work, for instance, Moby
Dick by Herman Melville.You can see an example of such kind of analysis
at the JSTOR Labs Text Analyzer.Chapters are too coarse for such kind of
analysis. Instead, the text is split into chunks that are long enough to
capture a scene in the plot, but short enough to generate a large number
of documents.We will use the chunks of one thousand words, which
corresponds to about three pages of text in a novel.

**3. Text chunks as chapters**

When we worked with chapters, we had a variable containing the chapter
number. We used it to group the words and generate their counts. Each
chapter would correspond to a row in the document-term matrix.With text
chunks, we are on our own.A convenient way to generate the surrogate
chapter numbers is to sequentially number the words and then use integer
division.Here are two examples showing how integer division works.

**4. Generating the document number**

We can generate the document numbers with minor modification to the
code.After we unnest the tokens,we get a table that contains one word
per row. We add new column `word_index` which contains the row
number,and then do integer division.For convenience, we add 1, otherwise
the first nine hundred ninety nine words will have chapter number zero.

**5. Craft vs. science**

The choice of a chunk size is very much a matter of experience rather
than exact mathematical formulas.The length of the chunk may depend on
the writing style of an author whose work we are analyzing.There is more
than one solution to this problem:One is to try different chunk
sizes.Another is to incorporate additional information about chapter
boundaries, to make sure that a text chunk does not span the boundary.

**6. Let’s practice!**

For practice, we are going back to the text of The Byzantine Empire.
Let’s see what we find.

## Generating chunk numbers

You are given a table `history` with two columns: `chapter` for chapter
number, and `text` for chapter text. Assuming a text chunk size of 1000
words, create a new column `document_number` containing the sequential
number of a chunk.

**Steps**

1.  Unnest the tokens.
2.  Assign table row number as the word index number.
3.  Do integer division by 1000 and assign the result to a new column
    `document_number`.

``` r
t <- history %>% 
        # Unnest the tokens
        unnest_tokens(input=text, output=word) %>% 
        # Create a word index column
        mutate(word_index = 1:n()) %>% 
        # Create a document number column
        mutate(document_number = word_index %/% 1000 + 1)
```

Great. Everything is correct.

## Inner join and cast dtm

You have the table `t` that you created in the previous exercise. It has
columns `word` and `document_number`. You also have the table `verbs`
with columns `present` and `past` containing present tense and past
tense forms of verbs.

Like you did in the second chapter of the course, join both tables to
keep only the past tense verbs, and then generate the word counts and
create the document-term matrix.

**Steps**

1.  Perform `inner_join()` using columns `word` and `past` as the keys.
2.  Count `word` using `document_number` as a grouping variable.
3.  Cast the table into a document-term matrix.

``` r
dtm11 <- t %>% 
    # Join verbs on "word" and "past"
    inner_join(verbs, by=c("word"="past")) %>% 
    # Count word
    count(document_number, word) %>% 
    # Create a document-term matrix
    cast_dtm(document=document_number, term=word, value=n)
```

Very good!

## Finding the best value for k

You are given object `dtm` with the document-term matrix you generated
in the previous exercise. You also have a user-defined function
`p(dtm=___, k=___)` that will fit an LDA topic model on matrix `dtm` for
the number of topics `k` and will return the perplexity score of the
model. Here is an example of calling the function for k=3:
`p(dtm=dtm, k=3)`.

Run the function for values of k equal to 5, 6, 7, 8, 9, and 10. Take
note of the perplexity values that you receive.

> ## *Question*
>
> Based on perplexity scores, is `k=9` better than `k=5`?<br> <br> ⬜
> The perplexity scores are equal so both choices are good.<br> ⬜ `k=5`
> gives a better (lower) perplexity score than `k=9`.<br> ✅ `k=9` has
> lower perplexity and is a better choice.<br>

Yes, model with `k=9` has lower perplexity and is better. In chapter 2
we used k=4 as a guess, and you can see that we were very off.

## Locking topics by using seed words

Theory. Coming soon …

**1. Using seed words for initialization**

**2. Seed for random numbers**

So far, every time we called the LDA() function, we included a
“seed”argument in the control list. For example, we would have
“seed=12345”.This is done to make sure that the result that you obtain
is the same as the result that I got when I was preparing the code.As
you heard before, LDA with Gibbs sampling is a type of a probabilistic
algorithm. It fits the topics by finding the best values for
probabilities of words in topics, and of topics in documents. It
incorporates an element of randomness into the decisions which
neighborhoods of values to explore.One downside of this randomness is
that topic number may change between runs. What used to be topic 1 -
persons, - in our NER classifier, may no longer be when we run the
algorithm tomorrow. Specifying random seed ensures that we end up with
the same topic numbering.

**3. Seed words**

When we specify a seed for random number generation, we essentially
specify the full chain of random numbers that LDA will receive. This may
mean that we exclude some solutions. Conveniently, the implementation of
Gibbs method in the topicmodels package includes an option of
initialization by seed words.The benefit of this option is that we get
to “lock” topic numbers without specifying random seed.To use it, we
need to provide the weights for seed words for topics.The “seedwords”
argument requires a matrix as an input.Each row in the matrix
corresponds to a topic, and each column - to a term.The algorithm will
normalize the weight values, to make sure that they sum up to 1.

**4. Example**

Here is an example. Consider the tiny dataset that we used before. We
had five sentences, which we treated as documents. The total vocabulary
size was 34 words. Dimensions of the document-term matrix were 5 rows by
34 columns.A seedwords matrix would need to have two rows, because we
want to fit the model for two topics, and the same number of columns as
there are tokens - thirty four.In the code, we assign 1 to column
“restaurant” in row 1, and to column “loans” in row 2.

**5. Example, continued**

To see the effect of seedwords, we first fit the topic model only with
the numeric seed.The algorithm converges on “loans” becoming topic 1,
and “restaurants” - topic 2.When we provide the seedwords argument,the
topics get flipped. This happened even though we specified the same
numeric seed.

**6. Uses**

Seedwords are useful for two reasons.First, they make operations with
pre-trained models more convenient.As you saw, when you extract the
results using tidy() function, there are no symbolic names assigned to
topics. Finding the best model involves multiple runs of the algorithm,
even for the same value of k.Seedwords give us the ability to know in
advance which topic number corresponds to what words.Second, seedwords
help with the speed of convergence.The algorithm finds the probabilities
of words through semi-random exploration. By providing the starting
point, we reduce the number of iterations needed to locate the point in
the space of parameters that matches our expectations.

**7. Let’s practice!**

Let’s try in practice what we just saw.

## Topics without seedwords

You are given LDA model `mod` fitted on the corpus of named entities,
for `k=3`. Each document corresponds to one named entity. Your task will
be to determine which topic corresponds to names, and which - to
geographic entities.

**Steps**

1.  Using `tidy`, convert matrix `gamma` to tidy table.
2.  Convert the table from tidy to wide format.
3.  Display the rows in which column `document` matches entities ”
    Adrianople”, ” Emperor Heraclius”, ” Daniel”, ” Africa”, and ”
    African”.

**create mod**

``` r
# Store the names of documents in a vector
required_documents <- c(" Africa", " Emperor Heraclius", 
                       " Adrianople", " Daniel", " African")

# Convert table into wide format
tidy(mod, matrix="gamma") %>% 
   spread(key=topic, value=gamma) %>% 
   # Keep only the rows with document names matching the required documents
   filter(document %in% required_documents)
```

Good. Notice that Daniel and Emperor Heraclius have higher values in
column 1.

## Topics with seedwords

You are given a document-term matrix `dtm` for the named entities. Your
task is to create a seedwords matrix, initialize it so that topic 1
would correspond to persons, topic 2 - to places, fit the model, and
examine the topic probabilities for documents. As a reminder, the terms
in `dtm` are the context words with suffix indicating position,
e.g. “to_l2”.

An empty matrix `seedword` has been created for you, with number of rows
equal to the number of topics `k` and number of columns equal to the
number of terms in `dtm`.

**Steps**

1.  Set the column names of the matrix equal to column names of `dtm`.
2.  Set the weight for “defeated_l2” in topic 1 equal to 1, same for
    “across_l2” in topic 2.
3.  Fit the topic model using seedwords for `k=3`.
4.  Display the topic probabilities for documents ” Daniel”, ”
    Adrianople”, and ” African”.

**create dtm**

``` r
# Set up the column names
colnames(seedwords) <- colnames(dtm)

# Set the weights
seedwords[1, "defeated_l2"] = 1
seedwords[2, "across_l2"] = 1

# Fit the topic model
mod <- LDA(dtm, k=3, method="Gibbs",
         seedwords=seedwords,
         control=list(alpha=1, iter=500, seed=1234))

# Examine topic assignment in the fitted model
tidy(mod, "gamma") %>% spread(topic, gamma) %>% 
\tfilter(document %in% c(" Daniel", " Adrianople", " African"))
```

Great! By setting up seed words, we forced the model to switch topics.
Topic 1 is no longer the most probable for document ’ Daniel’

## Final words (and more things to learn)

Theory. Coming soon …

**1. Final words (and more things to learn)**

Congratulations! You made it to the end. In case you are wondering, here
are a few final words and some ideas on what you could do next.

**2. Not just words**

Even though we used text as data in this course, topic models are not
just about words. In its core, LDA topic modeling is a clustering
algorithm.It produces “soft clustering” - in contrast to “hard”
clustering where we get a firm assignment of an item to a cluster, LDA
topic model returns a probability.An important restriction is that LDA
uses counts data - its inputs must be integer numbers.This method can be
used if, for instance, you are doing customer segmentation and have
counts of how many events a customer attended, or what stores they
visited.With minor transformations, topic modeling can be used on
non-integer data, like representing shipping routes using coordinates
from ship logs.

**3. Structured topic models - STM**

Latent Dirichlet Allocation is not the only method to fit a topic model.
Another method is VEM - variational expectation-maximization.It can be
applied in situations when topic proportions are correlated with each
other.In such cases the proportions follow a multivariate normal
distribution,A prominent package implementing these methods is “stm” -
short for Structured Topic Models, created by Margaret Roberts, Brandon
Stewart, Brandon Lingley, and Kenneth Benoit It can estimate a
regression model with topic proportions as the dependent variables and
some other attributes of documents as the independent variables.To name
a few of its other features, “stm” automatically does corpus alignment,
which we had to code by hand. It implements held-out data as omitted
words within the document.It is compatible with the package topicmodels
with respect to the input data, and it can also use the result of LDA
topic modeling as the starting point for its own model fitting.

**4. Deep learning and word embeddings**

There is one interesting connection between what we did in chapter 3 and
word embeddings - a method that emerged within deep learning community.
The word embeddings are also known as word-to-vector
models.Word-to-vector models are generated by training a neural network
to predict words that occur adjacent to the target word, within a small
distance from it. Plus-minus n, with n typically equal to 2 or 4.The
number of words can be up to a million, but in the end each word is
represented by a numeric vector of much smaller dimensions: 25, 50, a
hundred, or 300 depending on a model.If you feel that this resembles the
word windows that we constructed in chapter 3, you are right.There are
some distinctions, though.First, word-to-vector models use very large
corpora for training. It is not uncommon to see models that used over a
billion words, often scraped from web documents, as input.Second,
word-to-vector models do not make accommodations for multi-word
entities.These models take a long time to train.You can use package
“wordVectors” created by Ben Schmidt to experiment.

**5. Go out and play!**

If this was a video in the middle of a chapter, this slide would have
said “Let’s go and practice”. But we are done! And so instead, the final
message to you is “Go out and play!” Have fun with the new skills that
you learned. Bye bye!
