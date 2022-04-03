Fundamentals of Bayesian Data Analysis in R
================
Joschka Schwarz

-   [1. What is Bayesian Data
    Analysis?](#1-what-is-bayesian-data-analysis)
    -   [Bayesian Inference in a
        Nutshell](#bayesian-inference-in-a-nutshell)
    -   [Simple Bayesian model](#simple-bayesian-model)
-   [2. How does Bayesian inference
    work?](#2-how-does-bayesian-inference-work)
    -   [Generative model](#generative-model)
    -   [Generative model: Binomial
        distribution](#generative-model-binomial-distribution)
    -   [Using a generative model](#using-a-generative-model)
    -   [Bayesian inference (Ads)](#bayesian-inference-ads)
    -   [Prior probability
        distribution](#prior-probability-distribution)
    -   [Adding a prior to the model](#adding-a-prior-to-the-model)
    -   [Bayesian models and
        conditioning](#bayesian-models-and-conditioning)
    -   [Update a Bayesian model with
        data](#update-a-bayesian-model-with-data)
    -   [How many visitors could your site get
        (3)?](#how-many-visitors-could-your-site-get-3)
    -   [What have we done?](#what-have-we-done)
-   [3. Why use Bayesian Data
    Analysis?](#3-why-use-bayesian-data-analysis)
    -   [Four good things with Bayes](#four-good-things-with-bayes)
    -   [Explore using the Beta distribution as a
        prior](#explore-using-the-beta-distribution-as-a-prior)
    -   [Pick the prior that best captures the
        information](#pick-the-prior-that-best-captures-the-information)
    -   [Change the model to use an informative
        prior](#change-the-model-to-use-an-informative-prior)
    -   [Contrasts and comparisons](#contrasts-and-comparisons)
    -   [Fit the model using another
        dataset](#fit-the-model-using-another-dataset)
    -   [Calculating the posterior
        difference](#calculating-the-posterior-difference)
    -   [Decision analysis](#decision-analysis)
    -   [A small decision analysis 1](#a-small-decision-analysis-1)
    -   [A small decision analysis 2](#a-small-decision-analysis-2)
    -   [Change anything and
        everything](#change-anything-and-everything)
    -   [The Poisson distribution](#the-poisson-distribution)
    -   [Clicks per day instead of clicks per
        ad](#clicks-per-day-instead-of-clicks-per-ad)
    -   [Bayes is optimal, kind of…](#bayes-is-optimal-kind-of)
-   [4. Bayesian inference with Bayes’
    theorem](#4-bayesian-inference-with-bayes-theorem)
    -   [Probability rules](#probability-rules)
    -   [Cards and the sum rule](#cards-and-the-sum-rule)
    -   [Cards and the product rule](#cards-and-the-product-rule)
    -   [Calculating likelihoods](#calculating-likelihoods)
    -   [From rbinom to dbinom](#from-rbinom-to-dbinom)
    -   [Calculating probabilities with
        dbinom](#calculating-probabilities-with-dbinom)
    -   [Bayesian calculation](#bayesian-calculation)
    -   [Calculating a joint
        distribution](#calculating-a-joint-distribution)
    -   [Conditioning on the data
        (again)](#conditioning-on-the-data-again)
    -   [A conditional shortcut](#a-conditional-shortcut)
    -   [Bayes’ theorem](#bayes-theorem)
    -   [A Poisson model description](#a-poisson-model-description)
    -   [A Bayesian model of water
        temperature](#a-bayesian-model-of-water-temperature)
    -   [A Bayesian model of Zombie IQ](#a-bayesian-model-of-zombie-iq)
    -   [Eyeballing the mean IQ of
        zombies?](#eyeballing-the-mean-iq-of-zombies)
    -   [But how smart will the next zombie
        be?](#but-how-smart-will-the-next-zombie-be)
    -   [A practical tool: BEST](#a-practical-tool-best)
    -   [The BEST models and zombies on a
        diet](#the-best-models-and-zombies-on-a-diet)
    -   [BEST is robust](#best-is-robust)
    -   [What have you learned? What did we
        miss?](#what-have-you-learned-what-did-we-miss)

**Short Description**

Learn what Bayesian data analysis is, how it works, and why it is a
useful tool to have in your data science toolbox.

**Long Description**

Bayesian data analysis is an approach to statistical modeling and
machine learning that is becoming more and more popular. It provides a
uniform framework to build problem specific models that can be used for
both statistical inference and for prediction. This course will
introduce you to Bayesian data analysis: What it is, how it works, and
why it is a useful tool to have in your data science toolbox.

# 1. What is Bayesian Data Analysis?

## Bayesian Inference in a Nutshell

A method for figuring out unobservable quantities given known facts that
uses probability to describe the uncertainty over what the values of the
unknown quantities could be. Bayesian inferece == Probabilistic
inference.

There are other inference methods for this, but what makes Bayesian
inference Bayesian is that it uses probability to describe the
uncertainty over what the values of the unknown quantities could be.

The role of probability distributions in Bauesian data analysis is to
represent uncertainty, and the role of Bayesian inference is to update
probability distributions to reflect what has been learned from data.

Bayesian Data Analysis:

-   The use of bayesian inference to learn from data (the known facts)
    inference about parameters.
-   Can be used for hypothesis testing, linear regressin, etc.
-   It’s real power: Is flexible and allows you to construct
    problem-specific models

<hr>

Bayesian inference is a method for figuring out unknown or unobservable
quantities given known facts.

When analyzing data, we are also interested in learning about unknown
quantities. For example, say that we are interested in how daily ice
cream sales relate to the temperature, and we decide to use linear
regression to investigate this.

<center>
<img src="https://assets.datacamp.com/production/course_5334/datasets/ice_cream_sales.png" alt>
</center>

> ## *Question*
>
> Which of the following quantities could be considered unknown in this
> case?<br> <br> ⬜ The slope of the underlying regression line.<br> ⬜
> How much ice cream sales vary on days with a similar temperature.<br>
> ⬜ How many ice creams we will sell tomorrow given a forecast of 80°F
> / 27°C .<br> ✅ All of the above.<br>

Right, there are a lot of unknown things about which we want to learn.
Bayesian data analysis can help with that!

Bayesian data analysis is named after Thomas Bayes who in the middle of
the 18th century wrote the first article describing what we today would
call Bayesian inference. But the term Bayesian inference doesn’t really
give you any clues to what it is, and a better term would be
probabilistic inference because that’s what you do when you do Bayesian
data analysis.

It’s really just about using the full power of probability theory to
draw conclusions and learn from your data. Confusingly the term
probability can be defined in different ways. All definitions agree on
the basic rules of probability and that it’s a number between 0 to 1,
but they don’t agree on what probabilities stand for. The definition we
are going to use here is that a probability is a statement about the
certainty or uncertainty of different outcomes, where a probability of 1
means complete certainty that something is the case or is going to
happen and 0 mean complete certainty that this something is not the case
or that it’s not going to happen. This definition is very similar to the
common sense use of probability. Like, you might say “I’m 99 % sure it’s
gonna rain tomorrow”, which means you’re very certain, or you might say
“It’s a 50-50 chance it’s going to rain” which means you’re very
uncertain, it could go either way. Probability does not only have to be
about yes/no-type of events, but it can also be used to describe
uncertainty over continuous quantities.

For example, here is a graph showing the probability over how many
inches it will rain next week. Each bar shows the probability for the
corresponding outcome, and together the probabilities sum to one.

![](readme_files/figure-gfm/prob_dist.png)

This graph here is also an example of a probability distribution, which
just is an allocation of probability over many mutually exclusive
outcomes. So, the role of probability distributions in Bayesian data
analysis is to represent uncertainty, and the role of Bayesian inference
is to update these probability distributions to reflect what has been
learned from data.

## Simple Bayesian model

All this sounds a bit abstract, let’s try running a simple Bayesian
model and actually see how it looks. Let’s look at a Bayesian model for
an underlying proportion of success.

What is “success” here? Well, it could be curing a patient, getting a
click on an ad, getting tails when flipping a coin, etc. It depends on
what data you have. And what we’re often interested in is what the
underlying proportion of success is. Like, what proportion of patients
would be cured by this drug, say.

I’ve implemented a Bayesian model in R that estimates this and given it
the name `prop_model.` `prop_model` takes data as its first argument and
assumes that: the data is a vector of successes and failures represented
by 1s and 0s, that there is an unknown underlying proportion of success
and whether a data point is a success or not is only affected by this
proportion, and prior to seeing any data any underlying proportion of
success is equally likely. The result of `prop_model` is a probability
distribution that represents what the model knows about the underlying
proportion of success after having observed the data.

The output of prop_model is a plot showing what the model learns about
the underlying proportion of success from each data point in the order
you entered them. At n=0 there is no data, and all the model knows is
that it’s equally probable that the proportion of success is anything
from 0% to 100%. At n=4 all data has been added, and the model knows a
little bit more.

We will build toward implementing `prop_model()` during the following
content.

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.6     ✓ dplyr   1.0.7
    ## ✓ tidyr   1.1.4     ✓ stringr 1.4.0
    ## ✓ readr   2.1.0     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(ggridges)

# The prop_model function

# This function takes a number of successes and failuers coded as a TRUE/FALSE
# or 0/1 vector. This should be given as the data argument.
# The result is a visualization of the how a Beta-Binomial
# model gradualy learns the underlying proportion of successes 
# using this data. The function also returns a sample from the
# posterior distribution that can be further manipulated and inspected.
# The default prior is a Beta(1,1) distribution, but this can be set using the
# prior_prop argument.

# Make sure the packages tidyverse and ggridges are installed, otherwise run:
# install.packages(c("tidyverse", "ggridges"))

# Example usage:
# data <- c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE)
# prop_model(data)
prop_model <- function(data = c(), prior_prop = c(1, 1), n_draws = 10000,
                       gr_name="Proportion graph") {
  #library(tidyverse)
 
  data <- as.logical(data)
  # data_indices decides what densities to plot between the prior and the posterior
  # For 20 datapoints and less we're plotting all of them.
  data_indices <- round(seq(0, length(data), length.out = min(length(data) + 1, 40)))
  
  # dens_curves will be a data frame with the x & y coordinates for the 
  # denities to plot where x = proportion_success and y = probability
  proportion_success <- c(0, seq(0, 1, length.out = 100), 1)
  dens_curves <- map_dfr(data_indices, function(i) {
    value <- ifelse(i == 0, "Prior", ifelse(data[i], "Success", "Failure"))
    label <- paste0("n=", i)
    probability <- dbeta(proportion_success,
                         prior_prop[1] + sum(data[seq_len(i)]),
                         prior_prop[2] + sum(!data[seq_len(i)]))
    probability <- probability / max(probability)
    data_frame(value, label, proportion_success, probability)
  })
  # Turning label and value into factors with the right ordering for the plot
  dens_curves$label <- fct_rev(factor(dens_curves$label, levels =  paste0("n=", data_indices )))
  dens_curves$value <- factor(dens_curves$value, levels = c("Prior", "Success", "Failure"))
  
  graph_label <- paste("Prior likelihood distribution Beta(a =", 
                       as.character(prior_prop[1]),", b =",
                                    as.character(prior_prop[2]),")") 
  
  p <- ggplot(dens_curves, aes(x = proportion_success, y = label,
                               height = probability, fill = value)) +
    ggridges::geom_density_ridges(stat="identity", color = "white", alpha = 0.8,
                                  panel_scaling = TRUE, size = 1) +
    scale_y_discrete("", expand = c(0.01, 0)) +
    scale_x_continuous("Proportion of success") +
    scale_fill_manual(values = hcl(120 * 2:0 + 15, 100, 65), name = "", drop = FALSE,
                      labels =  c("Prior   ", "Success   ", "Failure   ")) +
    ggtitle(paste0(gr_name, ": ", sum(data),  " successes, ", sum(!data), " failures"),
            subtitle = graph_label) +
    theme_light() +
    theme(legend.position = "top")
  print(p)
  
  # Returning a sample from the posterior distribution that can be further 
  # manipulated and inspected
  posterior_sample <- rbeta(n_draws, prior_prop[1] + sum(data), prior_prop[2] + sum(!data))
  invisible(posterior_sample)
}
```

### prop_model 1: Drug Effectiveness with

Let’s start by seeing what happens when we run the model with no data.
We get a big blue square:

``` r
data <- c()
prop_model(data)
```

    ## Warning: `data_frame()` was deprecated in tibble 1.1.0.
    ## Please use `tibble()` instead.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated.

![](readme_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

The x-axis in this graph shows different values for the proportion of
success and the y-axis shows the probabilities of the different values.
The blue square is a uniform probability distribution saying that any
proportion of success has equal probability. It’s labeled “Prior”
because one assumption of the model was that prior to seeing any data
any underlying proportion of success was equally likely. Now, let’s add
a datapoint, let’s say this is from an experiment on whether patients
got cured by a new drug.

``` r
data <- c(0)
prop_model(data)
```

![](readme_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

Unfortunately, the first patient didn’t get cured, marked red here for
failure. The model now knows that a high proportion of success is
improbable because if it would have been high, we should have cured this
first patient too.

The second patient got cured. Now the model knows that the proportion of
success is improbable to be close to 0 or close to 1.

``` r
data <- c(0,1)
prop_model(data)
```

![](readme_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

The next three patients didn’t get cured, and for each failure, it
becomes more and more probable that the underlying proportion of success
is low.

``` r
data <- c(0,1,0,0,0)
prop_model(data)
```

![](readme_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

A final cured patient and what we know at the end of the experiment,
after six data points, is that the underlying proportion of success is
probably around 0.4, but with this little data there is a large
uncertainty and it could be as low as 0.10 or as high as 0.75. That was
a quick little example of a simple Bayesian model. *`prop_model` isn’t
part of any R package.*

``` r
data <- c(0,1,0,0,0,1)
prop_model(data)
```

![](readme_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

Let’s try out prop_model in a couple of exercises.

### prop_model 2: Coin flips

The function `prop_model` implements a Bayesian model that assumes that:

-   The `data` is a vector of successes and failures represented by `1`s
    and `0`s.
-   There is an unknown underlying proportion of success.
-   Prior to being updated with data any underlying proportion of
    success is equally likely.

Assume you just flipped a coin four times and the result was *heads*,
*tails*, *tails*, *heads*. If you code *heads* as a success and *tails*
as a failure then the following R codes runs `prop_model` with this data

``` r
data <- c(1, 0, 0, 1)
prop_model(data)
```

![](readme_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

The output of prop_model is a plot showing what the model learns about
the underlying proportion of success from each data point in the order
you entered them. At n=0 there is no data, and all the model knows is
that it’s equally probable that the proportion of success is anything
from 0% to 100%. At n=4 all data has been added, and the model knows a
little bit more.

> ## *Question*
>
> Looking at the final probability distribution at n=4, what information
> does the model have regarding the underlying proportion of heads?<br>
> <br> ✅ It’s most likely around 50%, but there is large
> uncertainty.<br> ⬜ It could be anywhere from 0% to 100%.<br> ⬜ It’s
> more likely to be above 50%.<br> ⬜ It is close to 50% with high
> probability.<br>

That’s right! The model knows it’s not close to 0% or close to 100%, but
believes it could be anything in between.

### prop_model 3: Zombie drugs

If we really were interested in the underlying proportion of heads of
this coin then `prop_model` isn’t particularly useful. Since it assumes
that any underlying proportion of success is equally likely prior to
seeing any data it will take a lot of coin flipping to convince
`prop_model` that the coin is fair. This model is more appropriate in a
situation where we have little background knowledge about the underlying
proportion of success.

Let’s say the zombie apocalypse is upon us and we have come up with a
new experimental drug to cure zombieism. We have no clue how effective
it’s going to be, but when we gave it to 13 zombies two of them turned
human again.

**Steps**

1.  Change the `data` argument to `prop_model` to estimate the
    underlying proportion of success of curing a zombie.

``` r
# Update the data and rerun prop_model
data = c(1, 0, 0, 1, 0, 0,
         0, 0, 0, 0, 0, 0, 0)
prop_model(data)
```

![](readme_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

> ## *Question*
>
> The model implemented in prop_model makes more sense here as we had no
> clue how good the drug would be. The final probability distribution
> (at `n=13`) represents what the model now knows about the underlying
> proportion of cured zombies. What proportion of zombies would we
> expect to turn human if we administered this new drug to the whole
> zombie population?<br> <br> ⬜ Between 0% to 100%.<br> ⬜ Between 25%
> to 75%.<br> ✅ Between 5% to 40%.<br> ⬜ Between 20% to 25%.<br>

It seems like it’s not a perfect drug, but between 5% to 40% cured
zombies is better than nothing!

**Samples and posterior summaries**

We just did some Bayesian data analysis! We took a Bayesian model, gave
it some data, and got out the probability distribution over the
underlying proportion of success for a zombie drug. In Bayesian jargon,
we took a “prior probability distribution”, “updated it” with data, and
the result was a “posterior probability distribution”. These two words,
prior and posterior, are used so much in Bayesian data analysis that
they are worth pointing out. A prior probability distribution is a
distribution over some unknown quantity that you have before, prior to,
updating it with some data. In the plot above it would be the blue
distribution. The posterior probability distribution is what this
distribution turned into after, posterior to, we updated it with data.
Here it would be the last distribution at n=13.

-   **prior** - a probability distribution that represents what the
    model knows before seeing the data
-   **posterior** - a probability distribution that represents what the
    model knows after having seen the data.

Often people drop the “probability distribution”-part and just call
these priors and posteriors. So, a prior is a probability distribution
that represents what the model knows before seeing the data. A posterior
is a probability distribution that represents what the model knows after
having seen the data. When fitting a Bayesian model, the end result is
always a posterior over some quantity or parameter of interest. The
posterior represents how uncertain the model is of the underlying value,
and in the zombie example, the posterior was displayed as a density plot
showing the location of the probability. This could be a good way of
communicating the result, but we might also want to summarize it
further, for example, we might want to calculate a “best guess” for what
the proportion of cured zombies would be. This calculation is easier to
do if the posterior is represented as a vector of samples rather than as
a plot.

**The probability distribution over the number of 6’s when rolling 5
dice**

What do I mean by this? Well, take, for example, the probability
distribution over the number of sixes you would get when rolling 5 dice.
You can represent that distribution as a plot,

``` r
pd <- function(n){
  df <- data.frame(
    prob = dbinom(0:n, n, 1/6),
    m = 0:n
  )
  ggplot(df, aes(m, prob)) +
    geom_col(fill = "steelblue") 
}
pd(5)
```

![](readme_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->

``` r
# base r
# plot(0:n, dbinom(0:n, n, 1/6), 
#     type = "h", lwd = 20, col="lightblue", 
#     lend = 3,   ann = FALSE,
#     las  = 1,   bty = 'n')
```

or as a mathematical function, if that’s your thing:

p(x) = (5 x)(1/6)<sup>x(1-(1/6))</sup>(5-x)

()<sup>x(1-())</sup>{5-x}

But you can also represent it as a long vector of samples where a value
occurs proportionally often to how probable it is. Having such a vector
makes it easy to calculate new measures from the probability
distribution. Say we want to know the average number of sixes we would
expect to roll. This is hard to read from the plot, but easy to
calculate using the vector of samples as we can directly use the mean
function in R.

``` r
### rbinom(number of experiments, number of observations per experiment, probability of success)
number_of_sixes <- rbinom(10000, 5, 1/6)
head(number_of_sixes)
```

    ## [1] 1 0 0 2 1 1

``` r
### rbinom(number of experiments, number of observations per experiment, probability of success)
number_of_sixes_mean <- number_of_sixes |> mean()
number_of_sixes_mean
```

    ## [1] 0.8385

Turns out the average number of sixes is 0.8385. The easiest way of
generating samples is by drawing a random sample from the probability
distribution, and if this sample is large enough, each value will occur
roughly proportionally often to how probable it is.

Now, it’s actually the case that the `prop_model` function also returns
a large random sample from the posterior distribution.

So, let’s finish off the zombie drug analysis we started earlier by
calculating a couple of relevant summaries using the sample returned by
prop_model. Here again is the `prop_model` function which has been given
the data from our zombie experiment where two out of 13 zombies got
cured. In addition to producing a plot, `prop_model` also returns a
large random sample from the posterior over the underlying proportion of
success.

**Steps**

1.  Assign the return value of `prop_model` to a variable called
    `posterior` and take a look at the first number of samples.

``` r
data = c(1, 0, 0, 1, 0, 0,
         0, 0, 0, 0, 0, 0, 0)

# Extract and explore the posterior
posterior <- prop_model(data)
```

![](readme_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

``` r
head(posterior)
```

    ## [1] 0.1539243 0.5795897 0.2281266 0.2509004 0.1782614 0.2549279

Looking at these first few samples confirms what is already shown in the
plot: That the underlying proportion of cured zombies is likely
somewhere between 5% and 50%. But these were just the first six samples
in `posterior` which currently contain 10,000 samples (the default of
`prop_model`).

2.  Take a look at the distribution of *all* the samples in `posterior`
    by plotting it as a histogram.

``` r
# Plot the histogram of the posterior
hist(posterior, breaks = 30, xlim = c(0, 1), col = "palegreen4")
```

![](readme_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

Compare this histogram to the plot produced directly by `prop_model`.
You should notice that the histogram and the posterior distribution (at
n=13) describe the same distribution. OK, so you got a vector of samples
from prop_model and confirmed that they are a good representation of the
posterior distribution.

### Summarizing the zombie drug experiment

The point of working with samples from a probability distribution is
that it makes it *easy* to calculate new measures of interest. The
following steps are about doing just this!

A *point estimate* is a single number used to summarize what’s known
about a parameter of interest. It can be seen as a “best guess” of the
value of the parameter. A commonly used point estimate is the **median**
of the posterior. It’s the midpoint of the distribution, and it’s
equally probable for the parameter value to be larger than the median as
it is to be smaller than it.

**Steps**

1.  Calculate the median of `posterior`.

``` r
# Calculate the median
median(posterior)
```

    ## [1] 0.1855849

So, a best guess is that the drug would cure around 18% of all zombies.
Another common summary is to report an interval that includes the
parameter of interest with a certain probability. This is called a
*credible interval* (CI). With a posterior represented as a vector of
samples you can calculate a CI using the `quantile()` function.

`quantile()` takes the vector of samples as its first argument and the
second argument is a vector defining how much probability should be left
below and above the CI. For example, the vector `c(0.05, 0.95)` would
yield a 90% CI and `c(0.25, 0.75)` would yield a 50% CI.

2.  Calculate a 90% credible interval of posterior.

``` r
# Calculate the credible interval
quantile(posterior, c(0.05, 0.95))
```

    ##         5%        95% 
    ## 0.06228448 0.38098318

According to the credible interval, there is a 90% probability that the
proportion of zombies the drug would cure is between 6% and 38%. (Here
we have to be careful to remember that the percentage of cured zombies
and the percentage of probability are two different things.)

Now, there is a rival zombie laboratory that is also working on a drug.
They claim that they are certain that their drug cures 7% of the zombies
it’s administered to. Can we calculate how probable it is that our drug
is better? Yes, we can! But it’s a two stage process.

3.  First, use `sum` to count how many samples in posterior that are
    larger than 7%. Do this by giving `posterior > 0.07` as the argument
    to sum.

``` r
# Calculate the sum
sum(posterior > 0.07)
```

    ## [1] 9307

To turn this count into a probability we now need to *normalize* it,
that is, divide it by the total number of samples in `posterior`.

4.  Divide the result of `sum` by the number of samples in `posterior`.
    You can get the number of samples in `posterior` using the `length`
    function.

``` r
# Calculate the probability
sum(posterior > 0.07) / length(posterior)
```

    ## [1] 0.9307

It seems there is a large probability (93%) that our zombie drug is
better!

Great! You’ve done some Bayesian data analysis and you’ve summarized the
result. If we would take this result, write it up, and send it to the
International Journal on Zombieology, it could go something like this:

Given the data of two cured and 11 relapsed zombies, and using the
Bayesian model described before, there is a 90% probability that our
drug cures between 6% and 39% of treated zombies. Further, there is 93%
probability that our drug cures zombies at a higher rate than current
state of the art drugs.

Now, this was a very simple Bayesian model, there was just one parameter
to estimate, the underlying proportion of success. In the next section,
we’re going to take a detailed look at how Bayesian inference actually
works.

# 2. How does Bayesian inference work?

In this chapter we will take a detailed look at the foundations of
Bayesian inference.

**The parts needed for Bayesian inference**

In the last section, we ran a small but complete Bayesian data analysis
from start to finish. Now we are going to do it all over again. But this
time we’ll go slowly, and the goal is for you to understand how Bayesian
inference actually works. First, let’s look at all the parts that are
needed to do Bayesian inference.

So Bayesian inference was a method for learning about unknown quantities
from data, for example model parameters or what future data could look
like. It requires three things to work:

1.  Data
2.  Generative model
3.  Priors (what the model knows before seeing the data)

## Generative model

What is a generative model? Well, it’s a very general concept, it’s any
kind of computer program, mathematical expression, or set of rules that
you can feed fixed parameter values and that you can use to generate
simulated data. As an example, let’s whip up a generative model for the
zombie drug experiment, and let’s define it as a small program in R.
There are many ways we could do this, but let’s go with something
simple. First, as before, let’s assume that there is an underlying
proportion of zombies that will be cured by the drug and that the drug
is given to a number of zombies. These are the parameters of the model,
and we could set them to anything, but for now, let’s just set
`prop_success` to 0.15 and `n_zombies` to 13.

``` r
 # Parameters
prop_success <- 0.15
n_zombies    <- 13
```

Now we’re going to simulate data, so we’ll start by creating an empty
data vector, and for each zombie we’re going to simulate a `1` if cured
and a `0` if not cured. But how do we do this? The simple assumption I’m
going to make is that whether a zombie gets cured only depends on the
underlying proportion of success, and nothing else. Here that means we
want to simulate a `1`, a success, 15% of the time. We can do that by
sampling a single number from a uniform probability distribution between
0 and 1, and if that is less than 0.15 we’ll call it a success.

``` r
# Simulating data
data <- c()
for(zombie in 1:n_zombies) {
  data[zombie] <- runif(1, min = 0, max = 1) < prop_success
}
data <- as.numeric(data)
data
```

    ##  [1] 0 0 0 0 0 0 0 1 0 0 0 1 0

This gives us almost what we want, except that the simulated data is a
vector of TRUEs and FALSEs, so the last step is to turn this into
numbers instead. Alright, we have a generative model for curing zombies;
every time we run it, it generates some simulated data for us.

This is actually the generative model behind the Bayesian `prop_model`
function we used to analyze the zombie data in the last chapter, but at
this point, it’s still not clear how this generative model relates to
Bayesian inference. We’ll come around to that eventually, but for now,
take this generative model for a spin in a couple of exercises.

**Steps**

1.  Generate a simulated dataset. Assume the underlying proportion of
    success of curing a zombie is 42% and that you administer the drug
    to 100 zombies.

``` r
# The generative zombie drug model

# set parameters
prop_success <- 0.42
n_zombies <- 100

# Simulating data
data <- c()
for(zombie in 1:n_zombies) {
  data[zombie] <- runif(1, min = 0, max = 1) < prop_success
}
data <- as.numeric(data)
data
```

    ##   [1] 0 0 0 0 1 0 1 1 0 1 0 1 0 1 0 1 0 1 1 0 1 0 1 0 0 0 1 1 0 1 1 0 1 0 0 1 0
    ##  [38] 1 0 1 1 1 1 1 1 1 0 0 1 1 1 0 0 1 1 0 1 0 1 1 1 0 0 1 1 1 0 0 0 1 1 0 0 0
    ##  [75] 0 1 1 0 1 1 0 1 1 1 0 1 1 0 0 0 1 1 1 0 0 0 0 1 1 0

Instead of representing cured zombies as a vector of `1`s and `0`s it
could be represented as a *count* of the number of cured out of the
total number of treated.

2.  Change the code to count how many zombies in `data` were cured. Use
    the `sum` function for this and assign this count to `data` instead
    of the vector of `1`s and `0`s.

``` r
# The generative zombie drug model

# Parameters
prop_success <- 0.42
n_zombies <- 100

# Simulating data
data <- c()
for(zombie in 1:n_zombies) {
  data[zombie] <- runif(1, min = 0, max = 1) < prop_success
}

# Count cured
data <- sum( as.numeric(data) )
data
```

    ## [1] 42

Perfect! Some zombies got cured in this simulation, but far from all.

## Generative model: Binomial distribution

It turns out that the generative model you ran last exercise already has
a name. It’s called the **binomial process** or the **binomial
distribution**. In R you can use the `rbinom` function to simulate data
from a binomial distribution. The `rbinom` function takes three
arguments:

-   `n` The number of times you want to run the generative model
-   `size` The number of trials. (For example, the number of zombies
    you’re giving the drug.)
-   `prob` The underlying proportion of success as a number between
    `0.0` and `1.0`.

**Steps**

1.  Replicate the result from the last step using the `rbinom` function:
    Simulate one count of the number of cured zombies out of a 100
    treated, where the underlying proportion of success is 42%.

``` r
# Try out rbinom
rbinom(n = 1, size = 100, prob = 0.42)
```

    ## [1] 42

A nice thing with `rbinom` is that it makes it easy to rerun the
generative model many times.

2.  Now, change the code to run the simulation 200 times, rather than
    just one time.

``` r
# Try out rbinom
rbinom(n = 200, size = 100, prob = 0.42)
```

    ##   [1] 40 34 46 43 34 42 42 43 43 45 39 44 45 43 48 42 44 37 45 35 40 51 43 41 44
    ##  [26] 50 41 39 42 46 39 42 45 42 41 50 47 43 35 36 46 40 46 48 33 34 38 44 52 51
    ##  [51] 47 49 42 36 35 48 42 38 44 40 34 49 39 46 42 41 39 39 35 45 47 47 45 42 39
    ##  [76] 41 34 41 47 40 45 42 42 38 39 33 42 45 34 40 43 49 44 43 47 47 39 31 43 46
    ## [101] 46 41 39 38 39 44 33 40 42 38 41 31 47 46 41 42 47 42 31 44 43 35 44 45 48
    ## [126] 33 37 43 37 38 43 48 38 42 32 46 42 46 46 45 36 50 50 43 41 40 44 52 42 51
    ## [151] 36 37 46 36 44 47 39 44 38 45 39 42 47 35 38 41 44 43 40 39 45 33 39 51 43
    ## [176] 48 44 45 40 40 40 39 53 41 39 40 51 42 45 50 53 45 29 48 48 41 39 40 41 40

Nice! That’s a lot of simulated zombies right there.

## Using a generative model

Earlier we implemented a generative model from scratch, but in the last
exercise you realized that that was unnecessary work as this generative
model was the same as the binomial distribution function. And it’s
actually the case that all probability distributions, like the normal
distribution or the Poisson distribution, can be seen as small
generative models, and there are many more that are implemented in R.
But for now, we’ll stick with the binomial distribution.

So, now we have a generative model, where we can plug in fixed parameter
values and it will generate simulated data for us. This could be useful
if we know exactly what parameter values we want, and we want to predict
what future unknown data might be. Say we are completely sure that our
drug cures 7% of all zombies, but we want to know how many we’ll likely
cure when we give the drug to the 100 zombies we have in our zombie pit.

We could then plug in 100 and 0.07 as parameters to rbinom and then run
this generative model a large number of times by setting n to, say,
100000.

``` r
cured_zombies <- rbinom(n = 100000, size = 100, prob = 0.07)
head(cured_zombies)
hist(cured_zombies, col = "palegreen4")
```

The result is a long vector of samples, which now represents the
probability distribution over how many zombies we will cure. If we plot
it as a histogram using the hist function we see that we’ll probably
cure between 3 to 12 of the 100 zombies in our pit. Of course, this only
makes sense if we are very certain that our drug cures 7% of all
zombies.

So we can go from known parameters to unknown data, the problem is that
in data analysis we are often in the complete opposite situation. We
know what the data is, it’s not uncertain, and we want to work our way
backward and figure out what are likely the parameter values that
generated this data. This is what we are going to use Bayesian inference
for. But we can’t do that yet, because, if you remember, we don’t have
all the parts we need.

We have defined a generative model, so we can tick that off, but we
still need priors and data.

## Bayesian inference (Ads)

Going forward we are leaving the zombies behind and will continue our
journey towards understanding Bayesian inference with this new, fresh
business example.

Assume you are running a website and to get more visitors you are going
to pay for an ad to be shown on a popular social media site. You are
thinking about paying for the ad to be shown a 100 times but you’re
uncertain whether it’s worth it, how many more site visits is it really
going to generate? According to the social media site, their ads get
clicked on 10% of the time. Let’s start by taking this number at face
value and produce a probability distribution over how many visitors
you’ll get. The binomial model should work well here too, but instead of
how many zombies will get cured, we now want to know how many ads will
get clicked.

To get more visitors to your website you are considering paying for an
ad to be shown 100 times on a popular social media site. According to
the social media site, their ads get clicked on 10% of the time.

Assume that 10% is a reasonable number, and assume that the binomial
distribution is a reasonable generative model for how people click on
ads.

**Steps**

1.  Fill in the missing parameters and use the `rbinom` function to
    generate a sample that represents the probability distribution over
    what the number of visitors to your site is going to be.
2.  Visualize this distribution using `hist`.

``` r
# Fill in the parameters
n_samples   <- 100000
n_ads_shown <- 100
proportion_clicks <- 0.1
n_visitors <- rbinom(n_samples, size = n_ads_shown, 
                     prob = proportion_clicks)
# Visualize n_visitors
hist(n_visitors)
```

![](readme_files/figure-gfm/unnamed-chunk-25-1.png)<!-- -->

> ## *Question*
>
> You would like the ad campaign to result in at least 5 visitors to
> your site. Eyeballing the plot you just produced, what is the
> probability you will get 5 or more visitors because of the ad?<br>
> <br> ⬜ 10%<br> ⬜ 20%<br> ⬜ 70%<br> ✅ 90%<br>

## Prior probability distribution

It’s time to add one more part that we will need to do Bayesian
inference: a prior probability distribution, which represents how
uncertain the model is about the parameters before seeing any data. And
ideally, this uncertainty should reflect our uncertainty.

Now, we know we’re going to run 100 ads, so that’s not uncertain, but
that an ad gets clicked on 10% of the time, as the social media site
claims, that is a curiously precise number. Especially when taking into
account that not all ads are the same. Surely some ads perform better
than others, and we don’t know how good our ad is. You are still
interested in how many site visits the ad is going to generate, but
since we really are uncertain about the underlying proportion of clicks
we now want to include some of that uncertainty into the binomial model.
There are many different probability distributions we could use to
represent that uncertainty. For now, we’re going to assume that it’s
equally likely that the underlying proportion of clicks could be as low
as 0%, like, it’s a horrible ad, and nobody will ever click it, or as
high as 20%, twice as good as the 10% claimed by the social media site.

These assumptions translate into a uniform distribution from 0 to 0.2
over the underlying proportion of clicks. Now we need to change the R
code that implements the model. Instead of assigning `proportion_clicks`
a single value we are now going to assign it a large number of random
samples from a *uniform probability distribution*. In R you can do that
using the `runif` function, standing for random uniform.

For example, this would sample just 6 values from 0 to 1.0 and put them
into `proportion_clicks`.

``` r
proportion_clicks <- runif(n = 6, min = 0.0, max = 1.0)
proportion_clicks
```

    ## [1] 0.42715083 0.89870840 0.73429049 0.56822827 0.41483111 0.06783123

A neat thing is that because most random number functions are vectorized
it’s very easy to chain probability distributions together in R. For
example if we now use `proportion_clicks` as the argument to rbinom,
then rbinom will automatically loop over the values in
`proportion_clicks`.

``` r
n_clicks <- rbinom(n = 6, size = 100, proportion_clicks)
n_clicks
```

    ## [1] 39 88 76 66 42  8

If we look at the resulting values in `n_clicks`, we can see this. The
first value in `proportion_clicks` is used to sample the first value in
`n_clicks.` As it’s just an 0.05 proportion of success the number of
successes in `n_clicks` becomes only 7 out of a 100. The second value in
`proportion_clicks` is used to sample the second in `n_clicks`, and so
on. This means that the variability from `runif()` gets combined with
the variability of `rbinom()`. The result is that the samples in
`n_clicks` now also incorporates the uncertainty in `proportion_clicks`.

## Adding a prior to the model

You’re not so sure that your ad will get clicked on exactly 10% of the
time. Instead of assigning `proportion_clicks` a single value you are
now going to assign it a large number of values drawn from a probability
distribution.

For now, we are going to assume that it’s equally likely that
`proportion_clicks` could be as low as 0% or as high as 20%. These
assumptions translate into a uniform distribution.

**Steps**

1.  Replace the single value that is assigned to `proportion_clicks`
    with `n_samples` samples produced by `runif` as above.

``` r
n_samples   <- 100000
n_ads_shown <- 100

# Update proportion_clicks
proportion_clicks <- runif(n_samples, min = 0.0, max = 0.2)

n_visitors <- rbinom(n = n_samples, size = n_ads_shown, prob = proportion_clicks)
```

Because the `rbinom` function is *vectorized* the first value of
`proportion_clicks` is used to sample the first value in `n_visitors`,
the second value in `proportion_clicks` is used for the second in
`n_visitors`, and so on. The result is that the samples in `n_visitors`
now also incorporate the uncertainty in what the underlying proportion
of clicks could be.

2.  First, visualize the uncertainty in `proportion_clicks` using the
    `hist` function.

``` r
n_samples <- 100000
n_ads_shown <- 100
proportion_clicks <- runif(n_samples, min = 0.0, max = 0.2)
n_visitors <- rbinom(n = n_samples, size = n_ads_shown, prob = proportion_clicks)

# Visualize proportion clicks
hist(proportion_clicks)
```

![](readme_files/figure-gfm/unnamed-chunk-29-1.png)<!-- -->

You shouldn’t be surprised to see that the uncertainty over
`proportion_clicks` is just as you specified it to be: Uniform between
0.0 and 0.2 (except for some small variations in the height of the bars
because we took a random sample using `runif`).

3.  Now, visualize the uncertainty in `n_visitors` again using the
    `hist` function.

``` r
# Visualize n_visitors
hist(n_visitors)
```

![](readme_files/figure-gfm/unnamed-chunk-30-1.png)<!-- -->

This looks very different from the histogram of `n_visitors` we got in
the last exercise when `proportion_clicks` was exactly 0.1. With the
added uncertainty in `proportion_clicks` the uncertainty over the number
of visitors we ’ll get also increased.

> ## *Question*
>
> Eyeballing the plot you just produced, what is the probability you
> will get 5 or more visitors because of the ad?<br> <br> ⬜ 10%<br> ⬜
> 20%<br> ✅ 70%<br> ⬜ 90%<br>

## Bayesian models and conditioning

Now we have a generative model and priors, and together these form a
Bayesian model.

So if some statistician is talking about that she’s developed a Bayesian
model of something, that just means she has specified a generative model
for the data plus priors over what is uncertain in the model. The only
thing we need now to do Bayesian inference is some data. You just
decided to run your ad campaign. And it went better than expected!When
the ad was shown a 100 times, 13 people clicked and visited your site.
So now we have data, and we are ready to do some Bayesian inference, we
are ready to use this data to learn about how likely people are to click
on your ad.

How could we do that? Let’s take a look at the model we have so far and
see if we can figure that out. The prior over `proportion_clicks` and
the generative model for `n_visitors` together define a prior
probability distribution over both parameters and future, unknown data.
Let’s put these together in a data frame and call it just `prior.`

``` r
n_samples   <- 100000
n_ads_shown <- 100
proportion_clicks <- runif(n_samples, min = 0.0, max = 0.2)
n_visitors <- rbinom(n = n_samples, size = n_ads_shown,
                     prob = proportion_clicks)
prior <- data.frame(proportion_clicks, n_visitors)
```

Now the data frame `prior` represents the joint probability distribution
of `proportion_clicks` and `n_visitors` together.

We could have a look at the first couple of samples in this data frame.

``` r
head(prior)
```

    ##   proportion_clicks n_visitors
    ## 1        0.15937338         13
    ## 2        0.17496316         12
    ## 3        0.05305114          6
    ## 4        0.12727434          9
    ## 5        0.05095272          8
    ## 6        0.13724565         14

But it’s easier to see what going on if we plot this data frame as a
scatter plot.

``` r
prior_plot <- ggplot( prior, aes( x = n_visitors, y = proportion_clicks ) ) +
  geom_point( alpha = 1/10 , color = "deepskyblue4") +
    scale_y_continuous(labels = scales::percent) +
  #geom_jitter(alpha = 1/10 ) +
  theme_classic()
  
# theme(legend.position = 'none' ,
#       panel.grid.major = element_blank(), 
#       panel.grid.minor = element_blank(),
#       panel.background = element_blank(), 
#       axis.line = element_line(colour = "black"))

# prior_plot <- plot(prior$n_visitors, prior$proportion_clicks, col= alpha("deepskyblue4", 0.4))

library(ggExtra)
prior_plot <- ggMarginal( prior_plot, type = 'histogram',
                          fill = "deepskyblue4",
                          xparams = list(  bins=20 ),
                          yparams = list(  bins=20))
prior_plot
```

![](readme_files/figure-gfm/unnamed-chunk-33-1.png)<!-- --> On the
x-axis we have the number of visitors, and on the y-axis we have the
underlying proportion of clicks. The histograms show the marginal
distributions, and you should recognize them both, the one for the
proportion of clicks is uniform between 0% and 20%, just as we defined
it to be, and the one for `n_visitors` is the one we looked at last
step. We clearly see a pattern in the plot, the higher the underlying
proportion of clicks, the more visitors we’ll probably get. But we also
see that the more visitors we get, the higher the underlying proportion
of clicks probably is.

If we knew that `proportion_clicks` was exactly 10%, we could condition
on this, that is, remove all samples that don’t fulfill the condition of
proportion_clicks being 10%.

``` r
plot_prior <- function(x) {
  
  # Add flag for ~10% values
  prior10_df <- prior %>%
    mutate( p10 = round( proportion_clicks, 2) == x ) 
  
  prior_plot <- ggplot( prior10_df |> filter(p10), aes( x = n_visitors, y = proportion_clicks ) ) +
    
    geom_point( alpha = 0.5, color = "deepskyblue4", shape = 1, stroke = 0.8) +
    scale_y_continuous(labels = scales::percent) +
    
    # Use annotae, so that the data will not be used in ggMarginal
    annotate(geom = "point", x = prior10_df |> filter(!p10) |> pull(n_visitors), y = prior10_df |> filter(!p10) |> pull(proportion_clicks), 
             color = "darkgrey", alpha = 1/10, shape = 1, stroke = 1) +
    
    # Add point layer again to bring it to top
    geom_point( alpha = 0.5, color = "deepskyblue4", shape = 1, stroke = 1) + 
    geom_hline(yintercept=0.1, linetype="dashed", color = "black", size = 1) +
    theme_classic()
    
  prior_plot <- ggMarginal( prior_plot, type = 'histogram', 
                            fill = "deepskyblue4",
                            xparams = list(  bins=20 ),
                            yparams = list(  bins=20))
  prior_plot
}

plot_prior(0.1)
```

![](readme_files/figure-gfm/unnamed-chunk-34-1.png)<!-- -->

This would also reduce the uncertainty in how many visitors we would
get. If we knew the proportion of clicks was 10%, we would be pretty
certain we would end up with between 2 and 15 visitors.

If we condition on other values the probability distribution over the
number of visitors shifts accordingly.

``` r
for (i in c(0.05, 0.1, 0.15, 0.2 )) {
  p <- plot_prior(i)
  ggsave(plot = p, filename = paste0("img",i, ".png"), device = "png")
}

imgs     <- list.files(full.names = TRUE, pattern = "img.*png")
img_list <- lapply(imgs, magick::image_read)
  
## join the images together
img_joined <- magick::image_join(img_list)

## animate at 2 frames per second
img_animated <- magick::image_animate(img_joined, delay=150)

## save to disk
magick::image_write(image = img_animated,
            path = "marg_hist.gif")
```

<figure>
<img src="readme_files/figure-gfm/marg_hist.gif" style="width:75.0%"
alt="marg_hist" />
<figcaption aria-hidden="true">marg_hist</figcaption>
</figure>

However, there is no point to this, because the problem was that we
didn’t know what the underlying proportions of clicks could be.

**12. marginal_plot_all.png**

But what we can know is the data, and we can condition on the data too.
Say that 5 out of a 100 clicked when we ran the ad campaign. If we

**13. marginal_plot_visit_5.png**

remove all samples that doesn’t fulfill this condition, we also reduce
the uncertainty in what the underlying proportion of clicks could be. We
end up with a distribution that doesn’t look at all like the uniform
distribution between 0% and 20% we defined before. And if we actually
would have gotten 5 visitors we could have concluded that
proportion_clicks probably would be between 3% and 10%.

**14. marginal_plot_visit_animation.gif**

And similarly we could condition on other values for the data. We have
now reached

**15. The essence of Bayesian inference**

the essence of what Bayesian inference is, it is conditioning on the
data, in order to learn about what parameters values likely gave rise to
this data. So, when you ran the ad campaign you got 13 site visits out
of a 100 shown ads.

**16. Try some Bayesian inference yourself!**

Now you try doing some Bayesian inference yourself and condition on this
data.

## Update a Bayesian model with data

You ran your ad campaign, and 13 people clicked and visited your site
when the ad was shown a 100 times. You would now like to use this new
information to update the Bayesian model.

**Steps**

1.  The model you put together in the last exercise resulted in two
    vectors: (1) `proportion_clicks` that represents the uncertainty
    regarding the underlying proportion of clicks and (2) `n_visitors`
    which represents the uncertainty regarding the number of visitors
    you would get. We have now put these vectors into a data frame for
    you called `prior`.

    -   Take a look at the first rows of `prior` using the `head()`
        function.

``` r
# Create the prior data frame
prior <- data.frame(proportion_clicks, n_visitors)

# Examine the prior data frame
head(prior)
```

    ##   proportion_clicks n_visitors
    ## 1        0.15937338         13
    ## 2        0.17496316         12
    ## 3        0.05305114          6
    ## 4        0.12727434          9
    ## 5        0.05095272          8
    ## 6        0.13724565         14

2.  The reason we’ve called it `prior` is because it represents the
    uncertainty *before* (that is, *prior* to) having included the
    information in the data. Let’s do that now!

    -   

``` r
# Create the prior data frame
prior <- data.frame(proportion_clicks, n_visitors)

# Examine the prior data frame
head(prior)
```

    ##   proportion_clicks n_visitors
    ## 1        0.15937338         13
    ## 2        0.17496316         12
    ## 3        0.05305114          6
    ## 4        0.12727434          9
    ## 5        0.05095272          8
    ## 6        0.13724565         14

``` r
# Create the posterior data frame
posterior <- prior[prior$n_visitors == 13, ]
```

3.  Great! The reason that we call it `posterior` is because it
    represents the uncertainty *after* (that is, *posterior* to) having
    included the information in the data. So what does `posterior`
    contain now? Well, `posterior$n_visitors` isn’t too exciting, that’s
    just `13` repeated many times.

    -   But take a look at `posterior$proportion_clicks` using the
        `hist` function.

``` r
# Create the prior data frame
prior <- data.frame(proportion_clicks, n_visitors)

# Examine the prior data frame
head(prior)
```

    ##   proportion_clicks n_visitors
    ## 1        0.15937338         13
    ## 2        0.17496316         12
    ## 3        0.05305114          6
    ## 4        0.12727434          9
    ## 5        0.05095272          8
    ## 6        0.13724565         14

``` r
# Create the posterior data frame
posterior <- prior[prior$n_visitors == 13, ]

# Visualize posterior proportion clicks
hist(posterior$proportion_clicks)
```

![](readme_files/figure-gfm/unnamed-chunk-38-1.png)<!-- -->

> ## *Question*
>
> This doesn’t look at all like the uniform distribution between 0.0 and
> 0.2 we put into `proportion_clicks` before. The whole distribution of
> samples now represent the posterior (after the data) probability
> distribution over what `proportion_clicks` could be.

-   Looking at the probability distribution over `proportion_clicks`
    what does the model know about the underlying proportion of visitors
    clicking on the ad?<br> \> <br> \> ⬜ It’s likely between 0% and
    20%.<br> \> ⬜ It’s likely between 5% and 10%.<br> \> ✅ It’s likely
    between 7% and 19%.<br> \> ⬜ It’s likely between 15% and 20%.<br>

This is a legitimate decision boundary as it lies in the gap between the
clusters. Try again.

## How many visitors could your site get (3)?

In the last exercise, you updated the probability distribution over the
underlying proportions of clicks (`proportion_clicks`) using new data.
Now we want to use this updated `proportion_clicks` to predict how many
visitors we would get if we reran the ad campaign.

**Steps**

1.  The result from the last exercise is still in the data frame
    `posterior`, but if you look at `posterior$n_visits` you’ll see it’s
    just `13` repeated over and over again. This makes sense as
    `posterior` represents what the model knew about the outcome of the
    last ad campaign after having seen the data.

    -   Assign `posterior` to a new variable called `prior` which will
        represent the uncertainty regarding the new ad campaign you
        haven’t run yet.

``` r
# Assign posterior to a new variable called prior
prior <- posterior
```

2.  Take a look at the first rows in `prior` using the `head()`
    function.

``` r
# Assign posterior to a new variable called prior
prior <- posterior

# Take a look at the first rows in prior
head(prior)
```

    ##     proportion_clicks n_visitors
    ## 1          0.15937338         13
    ## 21         0.08127312         13
    ## 24         0.11886884         13
    ## 44         0.09327488         13
    ## 60         0.17005728         13
    ## 156        0.15686119         13

3.  While `proportion_clicks` represents the uncertainty regarding the
    underlying proportion of clicks for the next ad campaign,
    `n_visitors` has not been updated yet.

    -   Replace `prior$n_visitors` with a new sample drawn using
        `rbinom` with `prior$proportion_clicks` as an argument.
    -   Plot the resulting `prior$n_visitors` using `hist`.

4.  Here is some example code you can use for this, just replace \_\_\_
    .

``` r
# Assign posterior to a new variable called prior
prior <- posterior

# Take a look at the first rows in prior
head(prior)
```

    ##     proportion_clicks n_visitors
    ## 1          0.15937338         13
    ## 21         0.08127312         13
    ## 24         0.11886884         13
    ## 44         0.09327488         13
    ## 60         0.17005728         13
    ## 156        0.15686119         13

``` r
# Replace prior$n_visitors with a new sample and visualize the result
n_samples <-  nrow(prior)
n_ads_shown <- 100
prior$n_visitors <- rbinom(n_samples, size = n_ads_shown, prob = prior$proportion_clicks)
hist(prior$n_visitors)
```

![](readme_files/figure-gfm/unnamed-chunk-41-1.png)<!-- -->

5.  The plot shows a probability distribution over the number of site
    visitors a new ad campaign would bring in. It now looks pretty
    likely that there would be more than, say, 5 visitors because of the
    campaign.

    -   Calculate the probability that you will get 5 or more visitors
        next time you run your ad campaign.

6.  Do this by summing up the number of draws with more than five
    visitors ( `sum(prior$n_visitors >= 5)` ) and divide by the total
    number of draws ( `length(prior$n_visitors)` ).

``` r
# Assign posterior to a new variable called prior
prior <- posterior

# Take a look at the first rows in prior
head(prior)
```

    ##     proportion_clicks n_visitors
    ## 1          0.15937338         13
    ## 21         0.08127312         13
    ## 24         0.11886884         13
    ## 44         0.09327488         13
    ## 60         0.17005728         13
    ## 156        0.15686119         13

``` r
# Replace prior$n_visitors with a new sample and visualize the result
n_samples <-  nrow(prior)
n_ads_shown <- 100
prior$n_visitors <- rbinom(n_samples, size = n_ads_shown, prob = prior$proportion_clicks)
hist(prior$n_visitors)
```

![](readme_files/figure-gfm/unnamed-chunk-42-1.png)<!-- -->

``` r
# Calculate the probability that you will get 5 or more visitors
sum(prior$n_visitors >= 5) / length(prior$n_visitors)
```

    ## [1] 0.9876622

> ## *Question*
>
> According to the new model, what is the probability of getting five or
> more visitors?<br> <br> ⬜ 75%<br> ⬜ 87%<br> ⬜ 93%<br> ✅ 99%<br>

That’s correct! 8.9 g/100ml is not a legitimate decision boundary as it
is part of the lower sugar content cluster.

## What have we done?

Theory. Coming soon …

**1. Bayesian inference, again!**

You’ve done some Bayesian inference! Again, I suppose, because you
already tried it last chapter. But this time you did it from the ground
up in exhaustive detail.

**2. What have we done montage 1**

You started by specifying a generative model from scratch in R but then
realized this was the same as

**3. What have we done montage 2**

the Binomial model. You specified

**4. What have we done montage 3**

a prior probability distribution over the underlying proportion of
clicks representing prior information; it’s likely between 0% and 20%,
but also that it is uncertain, it could be anything from 0% to 20%.
Together the generative model and this prior resulted in

**5. What have we done montage 4**

a joint probability distribution over both the underlying proportion of
clicks and how many visitors you would get. You collected some data and
used this to

**6. What have we done montage 5**

condition the joint distribution, in other words, you used

**7. What have we done montage 6**

Bayesian inference. This allowed the model to learn about the underlying
proportion of clicks and resulted in an updated posterior probability
distribution. And, finally, as a bonus, we used this posterior as

**8. What have we done montage 7**

the prior for the next ad campaign and predicted how many visitors we
would get if reran it. I hope you can see that if you collected even
more data, you could continue repeating these steps, to learn more and
more about the underlying proportion of clicks.This is exactly how

**9. prom_model result**

prop_model from the first chapter worked; it used the same Bayesian
model with the only difference that the prior was uniform from 0 to 100%
and that the model was updated with one success or failure at a time.
Taking a step back, what have we done? We have specified

**10. What have we done 1**

prior information,

**11. What have we done 2**

a generative model,

**12. What have we done 3**

and given some data we calculated the

**13. What have we done 4**

**14. What have we done 5**

updated probability of different parameter values. In the examples so
far we’ve used a Binomial model with a single parameter, but the cool
thing here is that the general method of Bayesian inference works for

**15. What have we done 6**

any generative model, with any number of parameters. That is, you can
have any number of parameters and unknown values, that you plug into any
generative model that you can implement, and the data can be
multivariate or can consist of completely different data sets, and the
Bayesian machinery that we used in the simple case works in the same
way.

**16. What bayes need 1**

This is why Bayesian methods are so broadly used, in everything from
hypothesis testing to machine learning: As long as you can come up with
a generative model for a data analytical problem, Bayesian inference can
always be used to fit this model and learn from data. Well, in theory at
least, because in practice you also need to use a computational method
that’s efficient enough. And the method we used in this chapter is
straightforward, easy to understand, but also scales very badly when you
have more data or more complicated models. So that’s actually the fourth

**17. What bayes need 2**

thing you need to do Bayesian inference. And we will talk about more
computationally efficient methods to do Bayesian inference in chapter 4.

**18. Next up: Why use Bayes?**

In this chapter, we looked at how Bayesian inference works. Next up, in
chapter 3, we’ll look at some reasons for why you would want to use it
to do Bayesian data analysis.

# 3. Why use Bayesian Data Analysis?

This chapter will show you four reasons why Bayesian data analysis is a
useful tool to have in your data science tool belt.

## Four good things with Bayes

Theory. Coming soon …

**1. Why use Bayesian data analysis?**

So why would you want to use Bayesian data analysis, rather than some
other method? So far, it seems like I’ve given you reasons for why not
to use it: It mostly requires a lot of work, and you need to set
everything up from scratch. But the reason for all this work was so that
you would understand what’s going on under the hood. Once you know that,
there are many good pre-packaged tools for Bayesian data analysis that
just lets you get on with your work, and we’ll look at one of those
tools in chapter 5, but for now, we’ll stay under the hood. So the main
reason to use Bayes is that it is

**2. Bayes is flexible**

a very flexible method to model, analyze and learn from data. And in
this chapter I’ll give you four examples of this flexibility, we’ll see
how you can include information sources in addition to the data into
your analysis, for example, expert opinion. How you always can compare
any outcomes of Bayesian analyses, like parameters between different
groups or datasets. How the result of a Bayesian analysis can be used to
do decision analysis, for example, to make it easier to use the result
of the model to make an informed business decision. And finally how the
flexibility of Bayes allows you to change the underlying statistical
model completely with relatively little effort. We’ll start by looking
at

**3. Including information in addition to data**

including information sources in addition to the data. This could be
background information, expert opinion or just common knowledge that you
have and that you would like to add to the model. To run with the
website ad example from last chapter: Let’s say you actually contacted
the social media company and asked:

**4. Chat 1**

“So what are really the range of proportion of clicks you see for ads?”
And let’s say they actually answered:

**5. Chat 2**

“Hi You! Most ads get clicked on 5% of the time, but for some ads it is
as low as 2% and for others as high as 8%.”

**6. Chat 3**

“Ah, but you’ve written 10% on your webpage!?”

**7. Chat 4**

“That’s marketing, don’t listen to them!” Ok, this seems like it could
be a piece of useful information to include in the analysis. But how do
we do that?

**8. Binomial model from chapter 2**

Here is the Bayesian model we used last chapter and a natural place to
include background information like this is in the prior probability
distribution, as this represents what the model knows before seeing the
data.

**9. Unif(0, 0.2)**

And right now it knows that the underlying proportion of clicks is
equally likely to be anything between 0% and 20%. This is already a
prior that contains some information: we’re basically telling the model
that it is impossible that the proportion of clicks is any higher than
20% and if we really didn’t want to assume anything regarding the
proportion of clicks we could make this into a more non-informative
prior by saying it’s equally likely that it’s anything from

**10. Unif(0, 1.0)**

0% to a 100%. But now we want to have a prior distribution that encodes
the information that

**11. Zoom in on chat message**

“Most ads get clicked on 5% of the time, but for some ads it is as low
as 2% and for others as high as 8%.”There are many ways we could define
such a distribution. You could even draw a distribution on paper, scan
it in, and transfer it to R somehow. But a convenient way is to use a
pre-defined probability distribution function that you can tweak so that
it encodes prior information. In our case, a useful distribution could
be

**12. The Beta distribution**

the Beta distribution. It’s a distribution that is bounded between 0 and
1, which is useful when you want to define a distribution over a
proportion, and depending on its two shape parameters alpha and beta it
can take on many different shapes. In the next exercises, you will take
a look at the Beta distribution and how you can use it to

**13. Define an informed prior!**

define a prior that is informed by the new info we got from the social
media company.

## Explore using the Beta distribution as a prior

The Beta distribution is a useful probability distribution when you want
model uncertainty over a parameter bounded between 0 and 1. Here you’ll
explore how the two parameters of the Beta distribution determine its
shape.

**Steps**

1.  One way to see how the shape parameters of the Beta distribution
    affect its shape is to generate a large number of random draws using
    the `rbeta(n, shape1, shape2)` function and visualize these as a
    histogram. The code to the right generates 1,000,000 draws from a
    Beta(1, 1) distribution: A Beta distribution with both shape
    parameters set to 1.

    -   Visualize these draws using the `hist` function.

``` r
# Explore using the rbeta function
beta_sample <- rbeta(n = 1000000, shape1 = 1, shape2 = 1)

# Visualize the results
hist(beta_sample)
```

![](readme_files/figure-gfm/unnamed-chunk-43-1.png)<!-- -->

2.  Right! A Beta(1,1) distribution is the same as a uniform
    distribution between 0 and 1. It is useful as a so-called
    *non-informative* prior as it expresses than any value from 0 to 1
    is equally likely.

    -   Try to set one of the shape parameters to a negative number.
    -   Take a look at the first few values using `head(beta_sample)`.

``` r
# Explore using the rbeta function
beta_sample <- rbeta(n = 1000000, shape1 = -1, shape2 = 1)
```

    ## Warning in rbeta(n = 1e+06, shape1 = -1, shape2 = 1): NAs produced

``` r
# Explore the results
head(beta_sample)
```

    ## [1] NaN NaN NaN NaN NaN NaN

3.  Yes, `NaN` stands for *not a number* and the reason you got a lot of
    `NaN`s is that the Beta distribution is only defined when its shape
    parameters are positive.

    -   Instead, set both shape parameters to a large number. Let’s set
        both `shape1` and `shape2` to `100`.
    -   Visualize the result using `hist()`.

``` r
# Explore using the rbeta function
beta_sample <- rbeta(n = 1000000, shape1 = 100, shape2 = 100)

# Visualize the results
hist(beta_sample)
```

![](readme_files/figure-gfm/unnamed-chunk-45-1.png)<!-- -->

4.  So the larger the shape parameters are, the more concentrated the
    beta distribution becomes. When used as a prior, this Beta
    distribution encodes the information that the parameter is most
    likely close to 0.5 .

    -   See what happens if you set `shape2` to something smaller than
        `shape1`. Let’s set `shape2 = 20` while keeping `shape1 = 100`.

``` r
# Explore using the rbeta function
beta_sample <- rbeta(n = 1000000, shape1 = 100, shape2 = 20)

# Visualize the results
hist(beta_sample)
```

![](readme_files/figure-gfm/unnamed-chunk-46-1.png)<!-- -->

So the larger the `shape1` parameter is the closer the resulting
distribution is to 1.0 and the larger the `shape2` the closer it is to
0.

## Pick the prior that best captures the information

The new information you got from the social media company was:

<blockquote>

Most ads get clicked on 5% of the time, but for some ads it is as low as
2% and for others as high as 8%.

</blockquote>

There are many different probability distributions that one can argue
captures this information.

-   Out of the four Beta distribution shown below, which captures this
    information the best?
    <img src="https://assets.datacamp.com/production/repositories/1300/datasets/99ec148dcdd05d87d7b278a16ba1c557c359a34e/four_different_beta_dists.png" width="400">

> ## *Question*
>
> ???<br> <br> ⬜ A. rbeta(shape1 = 3, shape2 = 12)<br> ⬜ B.
> rbeta(shape1 = 15, shape2 = 75)<br> ✅ C. rbeta(shape1 = 5, shape2 =
> 95)<br> ⬜ D. rbeta(shape1 = 30, shape2 = 10)<br>

Yes, this seems like a reasonable choice!

## Change the model to use an informative prior

The code to the right is the old model you developed from scratch in
chapter 2.

**Steps**

1.  Change this model to use the new informative prior for
    `proportion_clicks` that you just selected:

``` r
n_draws <- 100000
n_ads_shown <- 100

# Change the prior on proportion_clicks
proportion_clicks <- 
  rbeta(n_draws, shape1 = 5, shape2 = 95)
n_visitors <- 
  rbinom(n_draws, size = n_ads_shown, 
         prob = proportion_clicks)
prior <- 
  data.frame(proportion_clicks, n_visitors)
posterior <- 
  prior[prior$n_visitors == 13, ]

# This plots the prior and the posterior in the same plot
par(mfcol = c(2, 1))
hist(prior$proportion_clicks, 
     xlim = c(0, 0.25))
hist(posterior$proportion_clicks, 
     xlim = c(0, 0.25))
```

![](readme_files/figure-gfm/unnamed-chunk-47-1.png)<!-- -->

Take a look at the new posterior! Due to the new informative prior it
has shifted to the left, favoring lower rates.

## Contrasts and comparisons

Theory. Coming soon …

**1. You’ve changed the prior!**

You’ve now changed the prior to include the information you got from the
social media company. What effect did that have?

**2. Uninformative prior and posterior**

Well, here is the old uniform prior and posterior.

**3. Informative prior**

And here is the new informed prior. If we didn’t have any data at all,
then the prior would be all the model would know, but if we had lots of
data the information in the data would overwhelm the prior information
and we would end up with the pretty much the same posterior distribution
independent of what prior was used. But now we just have a little data,
so the

**4. Informative posterior**

resulting posterior is a mix of the information from the prior and the
information from the data. The data is enthusiastic: “Hey, the
proportion of clicks is likely around 13%!” The prior is less so: “Mmmm,
it’s likely around 5%”. The resulting posterior is informed by both the
data and the prior and ends up somewhere in between. Now we have two
different models of the same data, so which should we choose? There is
no correct answer here, but if the informed prior is based on genuinely
good information, then the resulting estimate should be better. In this
case, it’s up to you if you believe the numbers you got from the social
media company. Going forward we’re going to go back to the uniform
distribution between 0% and 20% we used before, but now you know how
easy it is to switch the prior, would you want to. Next up on reasons to
use Bayesian data analysis is that

**5. Next up on reasons to use Bayesian data analysis**

it is easy to compare and contrast any outcomes from Bayesian models. A
typical example of when you want to make comparisons is when you have
two different experimental groups, like two different treatments or two
different methods, and you want to compare these and see which seems the
best. For example, say that the ads you’ve been running so far have been

**6. Video vs Text 1**

video ads, but you’ve been thinking that

**7. Video vs Text 2**

text ads could be more effective. To try this out you also paid for 100
text ads to be shown on the social media site, and that resulted in

**8. Video vs Text 3**

6 clicks and visits to your site. But as the video ads resulted in 13
clicks it seems like they are more effective, but how sure should you be
of this? We could run the same model on the data from the video ads and
the text ads, and take a look at

**9. Video vs Text analysis**

the corresponding posteriors over the underlying proportions of clicks.
It looks like it’s more probable that the proportion of clicks is lower
for the text ad, but there is some overlap between the probability
distributions. What we would want is to compare the performance of the
text and video ads in such a way that we got out a new probability
distribution showing the probable difference. And this is easy to get,
especially since these two distributions are represented by long vectors
of samples.

**10. Comparing Video and Text ads**

Here I’ve taken the samples that make up these two probability
distributions, given them the names video_prop and text_prop, prop as in
proportion, and put them into a data frame called posterior. As long as
these samples are in a random order, and as long as I do it row by row,
I can now calculate any type of derivative quantity and the resulting
new distribution of samples will correctly retain the uncertainty of
these original two distributions. Now, we were interested in the
difference, so for each row let’s

**11. Comparing Video and Text ads**

subtract text_prop from video_prop and put it into the column prop_diff.
Looking at the first couple of samples in prop_diff we see that for most
rows video ads are better than text ads. The whole vector of samples in
prop_diff now represents the posterior probability distribution over the
difference between video ads and text ads.

**12. How does the prop_diff() distribution look?**

So how does this distribution look? Well, you’ll find out in the
following exercises!

## Fit the model using another dataset

Let’s fit the binomial model to both the video ad data (13 out of 100
clicked) and the new text ad data (6 out of a 100 clicked).

**Steps**

1.  To the right, you again have the model you developed in the last
    chapter. Here `posterior_video` is the posterior proportion of
    clicks for the video ad data.

    -   Add a row where you calculate `posterior_text` in the same way
        as `posterior_video` *but* using the text ad data instead.
    -   Plot `posterior_text` as a histogram just as `posterior_video`
        is plotted.

``` r
# Define parameters
n_draws <- 100000
n_ads_shown <- 100
proportion_clicks <- runif(n_draws, min = 0.0, max = 0.2)
n_visitors <- rbinom(n = n_draws, size = n_ads_shown, 
                     prob = proportion_clicks)
prior <- data.frame(proportion_clicks, n_visitors)

# Create the posteriors for video and text ads
posterior_video <- prior[prior$n_visitors == 13, ]
posterior_text <- prior[prior$n_visitors == 6, ]

# Visualize the posteriors
hist(posterior_video$proportion_clicks, xlim = c(0, 0.25))
```

![](readme_files/figure-gfm/unnamed-chunk-48-1.png)<!-- -->

``` r
hist(posterior_text$proportion_clicks, xlim = c(0, 0.25))
```

![](readme_files/figure-gfm/unnamed-chunk-48-2.png)<!-- -->

> ## *Question*
>
> Looking at the histogram of `posterior_text` what can be said about
> the value of the proportion of clicks for the text ad?<br> <br> ✅
> It’s likely between 0.03 and 0.13.<br> ⬜ It’s likely between 0.10 and
> 0.15.<br> ⬜ It’s exactly 0.06.<br> ⬜ It’s likely between 0.06 and
> 0.10<br>

This is a legitimate decision boundary as it lies in the gap between the
clusters. Try again.

## Calculating the posterior difference

The posterior `proportion_clicks` for the video and text ad has been put
into a single `posterior` data frame. The reason for `[1:4000]` is
because these `proportion_clicks`s are not necessarily of the same
length, which they need to be when put into a data frame.

Now it’s time to calculate the posterior probability distribution over
what the difference in proportion of clicks might be between the video
ad and the text ad.

**Steps**

1.  Add a new column `posterior$prop_diff` that should be the posterior
    difference between `video_prop` and `text_prop` (that is,
    `video_prop` *minus* `text_prop`).
2.  Plot `posterior$prop_diff` as a histogram using `hist()`.

``` r
posterior <- data.frame(video_prop = posterior_video$proportion_clicks[1:4000],
                        text_prop = posterior_text$proportion_click[1:4000])

# Calculate the posterior difference: video_prop - text_prop
posterior$prop_diff <- posterior$video_prop - posterior$text_prop 

# Visualize prop_diff
hist(posterior$prop_diff)
```

![](readme_files/figure-gfm/unnamed-chunk-49-1.png)<!-- -->

3.  Calculate “a most likely” difference by taking the `median` of
    `posterior$prop_diff`

``` r
posterior <- data.frame(video_prop = posterior_video$proportion_clicks[1:4000],
                        text_prop = posterior_text$proportion_click[1:4000])

# Calculate the posterior difference: video_prop - text_prop
posterior$prop_diff <- posterior$video_prop - posterior$text_prop 

# Visualize prop_diff
hist(posterior$prop_diff)
```

![](readme_files/figure-gfm/unnamed-chunk-50-1.png)<!-- -->

``` r
# Calculate the median of prop_diff
median(posterior$prop_diff)
```

    ## [1] 0.06576173

4.  Finally, calculate the probability that proportion of clicks is
    larger for the video ad than for the text ad.

``` r
posterior <- data.frame(video_prop = posterior_video$proportion_clicks[1:4000],
                        text_prop = posterior_text$proportion_click[1:4000])

# Calculate the posterior difference: video_prop - text_prop
posterior$prop_diff <- posterior$video_prop - posterior$text_prop 

# Visualize prop_diff
hist(posterior$prop_diff)
```

![](readme_files/figure-gfm/unnamed-chunk-51-1.png)<!-- -->

``` r
# Calculate the median of prop_diff
median(posterior$prop_diff)
```

    ## [1] 0.06576173

``` r
# Calculate the proportion
mean(posterior$prop_diff > 0.0)
```

    ## [1] 0.94775

> ## *Question*
>
> Given the model and the data, what is the probability that the video
> ad is better than the text ad? (Here *better* means having a higher
> proportion of clicks.)<br> <br> ⬜ 5%<br> ⬜ 50%<br> ⬜ 90%<br> ✅
> 95%<br>

That’s correct! 8.9 g/100ml is not a legitimate decision boundary as it
is part of the lower sugar content cluster.

## Decision analysis

Theory. Coming soon …

**1. It’s easy to compare and contrast!**

We’ve now seen that Bayesian Data Analysis makes it easy to compare and
contrast parameter estimates. And it’s generally the case that it’s easy
to calculate any derivative quantities once we’ve fitted a Bayesian
model and gotten out posteriors. You’ve already seen some examples of
that in the first chapter. Given

**2. A probability distribution over an interesting parameter**

a probability distribution over some interesting parameter you
calculated a point estimate: A single value summarizing the whole
distribution. You did

**3. A probability distribution over an interesting parameter**

the posterior median, but could also have calculated, say, the posterior
mean. It’s important to remember that the posterior median or mean are
not the same as the median or mean of the data. The posterior median is
a summary of a probability distribution over some parameter, while the
median of the data is a summary of a data set. Two different things. You
calculated the amount of probability favoring a positive value.

**4. A probability distribution over an interesting parameter**

And while you didn’t, you could also have calculated a credible
interval, an interval that contains the underlying parameter with a
certain probability, for example,

**5. A probability distribution over an interesting parameter**

here is an 80% credible interval for this probability distribution
calculated using the quantile function. So these are some of the things
commonly calculated after having fitted a Bayesian model, but we can go
further, and a third reason

**6. Next up on reasons to use Bayesian data analysis**

Bayes is useful is because you can use the result of a Bayesian analysis
to do Decision Analysis. So what’s decision analysis here? Simply put,
it’s when you take the result of a statistical analysis and post-process
it to make it more about what you really care about, in order to make
informed decisions. Often, you don’t really care about the values of
parameters. What you really care about is to save the most lives or to
make the most money. In the case of your zombie website you definitely
care about money, the reason you want more visitors to your site is that
you want them to buy

**7. A patented zombie repellent**

your patented zombie repellent. You’ve tried both video and text ads and
now you have to decide which to use for a larger campaign you’re
planning.

**8. Video vs text - posteriors**

Looking at the posteriors for the underlying proportion of clicks, there
is pretty strong evidence that video ads would give the most visitors
per ad shown, but will they result in the most money? Let’s do

**9. A small decision analysis**

a small decision analysis to figure that out. The important numbers to
know for this is that the social media site charges 25 cents for a video
ad, 5 cents for a text ad, and based on historical data we make
2-point-53 dollars per visitor on average. Let’s again work directly
with

**10. A small decision analysis**

the posterior samples. So we can calculate anything row-wise, and the
resulting distribution will be correct. Let’s start by

**11. A small decision analysis**

how much we earn on average per shown video ad. This is then the
proportion of people that will click times how much we’ll make on
average per visitor minus the cost of showing the ad. Looking at the
first row we see that if the underlying proportion of clicks actually
was 0-point-08, you would lose 4 cents on average per ad, but it seems
for most samples, you’ll make a profit.

**12. A small decision analysis**

We can calculate the text ad profit in the same way, but this time
subtracting the cost of a text ad instead. And finally, we can calculate

**13. A small decision analysis**

profit_diff, the probability distribution over the profit difference
between video and text ads. This distribution is now much closer to what
we really care about: which type of ad will give us the most money,
where a positive number is in favor of video ads and a negative number
in favor of text ads. We could now use profit_diff directly to

**14. Make a data informed decision!**

make a data-informed decision, so what is that decision? You’ll
calculate that yourself in the following exercises!

## A small decision analysis 1

Each visitor spends `$2.53` on average, a video ad costs `$0.25` and a
text ad costs `$0.05`. Let’s figure out the probable profit when using
video ads and text ads!

**Steps**

1.  The data frame `posterior` contains the probability distribution
    over the underlying proportion of clicks for video ads and text ads.

    -   Add the column `posterior$video_profit` which should be the
        probability distribution over the average profit you’ll make on
        showing a video ad. That is, the underlying proportion of clicks
        **times** the average spend **minus** the cost of showing the
        video.

``` r
visitor_spend <- 2.53
video_cost <- 0.25
text_cost <- 0.05

# Add the column posterior$video_profit
posterior$video_profit <- posterior$video_prop * visitor_spend - video_cost
```

2.  Add the column `posterior$text_profit`: The probability distribution
    over the average profit you’ll make on showing a text ad.
3.  (*optional*) Take a look at the first rows of the final `posterior`
    using `head()`.

``` r
visitor_spend <- 2.53
video_cost <- 0.25
text_cost <- 0.05

# Add the column posterior$video_profit
posterior$video_profit <- posterior$video_prop * visitor_spend - video_cost

# Add the column posterior$text_profit
posterior$text_profit <- posterior$text_prop * visitor_spend - text_cost

head(posterior)
```

    ##   video_prop  text_prop  prop_diff video_profit text_profit
    ## 1 0.18046910 0.09155561 0.08891349  0.206586829  0.18163569
    ## 2 0.17727382 0.05399033 0.12328349  0.198502764  0.08659554
    ## 3 0.16416682 0.02810095 0.13606587  0.165342055  0.02109540
    ## 4 0.09658983 0.05164868 0.04494115 -0.005627719  0.08067117
    ## 5 0.09782043 0.07623401 0.02158642 -0.002514318  0.14287205
    ## 6 0.14552004 0.03236332 0.11315673  0.118165711  0.03187919

4.  Finally, take a look at the probability distributions of
    `posterior$video_profit` and `posterior$text_profit` by plotting
    them as two separate histograms using the `hist()` function.

``` r
visitor_spend <- 2.53
video_cost <- 0.25
text_cost <- 0.05

# Add the column posterior$video_profit
posterior$video_profit <- posterior$video_prop * visitor_spend - video_cost

# Add the column posterior$text_profit
posterior$text_profit <- posterior$text_prop * visitor_spend - text_cost

# Visualize the video_profit and text_profit columns
hist(posterior$video_profit)
```

![](readme_files/figure-gfm/unnamed-chunk-54-1.png)<!-- -->

``` r
hist(posterior$text_profit)
```

![](readme_files/figure-gfm/unnamed-chunk-54-2.png)<!-- -->

Great! Take a look at the two histograms you’ve plotted, which method
seems most profitable, if any?

## A small decision analysis 2

Using the columns `video_profit` and `text_profit` that you added to
`posterior` in the last exercise, let’s conclude the decision analysis.

**Steps**

1.  Add the new column `posterior$profit_diff`: The probability
    distribution over the difference in profits between video ads and
    text ads. That is, the profit from video ads **minus** the profit
    from text ads.
2.  Take a look at `posterior$profit_diff` by plotting it using
    `hist()`.

``` r
# Add the column posterior$profit_diff
posterior$profit_diff <- posterior$video_profit - posterior$text_profit

# Visualize posterior$profit_diff
hist(posterior$profit_diff)
```

![](readme_files/figure-gfm/unnamed-chunk-55-1.png)<!-- -->

3.  There are many ways to calculate a “best guess” for what the
    difference in profits might be. Here, use the posterior median.

    -   Calculate the `median` of `posterior$profit_diff`.

``` r
# Add the column posterior$profit_diff
posterior$profit_diff <- posterior$video_profit - posterior$text_profit

# Visualize posterior$profit_diff
hist(posterior$profit_diff)
```

![](readme_files/figure-gfm/unnamed-chunk-56-1.png)<!-- -->

``` r
# Calculate a "best guess" for the difference in profits
median(posterior$profit_diff)
```

    ## [1] -0.03362282

4.  Finally (phew!) calculate the probability that running text ads will
    result in higher profits than video ads. That is:

    -   Calculate the *proportion* of samples in `posterior$profit_diff`
        that is lower than `0`, in favor of text ads.

``` r
# Add the column posterior$profit_diff
posterior$profit_diff <- posterior$video_profit - posterior$text_profit

# Visualize posterior$profit_diff
hist(posterior$profit_diff)
```

![](readme_files/figure-gfm/unnamed-chunk-57-1.png)<!-- -->

``` r
# Calculate a "best guess" for the difference in profits
median(posterior$profit_diff)
```

    ## [1] -0.03362282

``` r
# Calculate the probability that text ads are better than video ads
mean(posterior$profit_diff < 0)
```

    ## [1] 0.63325

> ## *Question*
>
> So it seems that the evidence does not strongly favor neither text nor
> video ads.

-   But if forced to choose at this point, what would you choose?<br> \>
    <br> \> ⬜ Video ads<br> \> ✅ Text ads<br>

This is a legitimate decision boundary as it lies in the gap between the
clusters. Try again.

## Change anything and everything

Theory. Coming soon …

**1. Change anything and everything**

In the last exercises, you took

**2. Video vs text - posteriors**

the posteriors from two different models and using nothing but basic
arithmetic you calculated

**3. Video vs text - Posterior difference**

the probability distribution over the difference in profit between using
video and text ads. This was all pretty easy to do, and the surprising
result was that, if forced to choose, you should actually go for text
ads. But what this distribution is also telling you is that there is
large uncertainty over which type of ad is the best, and you really
should get some more data before you make a decision. So you’ve already
seen that it is easy to tweak the prior of a Bayesian model, but

**4. Next up on reasons to use Bayesian data analysis**

the fourth reason to use Bayes is that you can also completely change
the underlying statistical model, often with not too much effort. Let’s
take a look at an example where you will

**5. Completely switch out the binomial model**

completely switch out the binomial model we have worked with so far. Why
would you want to do that? Well, you have some new data to analyze,
where the Binomial model isn’t going to work well. See, you happen to
have a friend, also in the zombie e-commerce business, and she has
offered to put up an ad for your site as a banner on her site, for a
small daily fee, of course. The thing is, you wouldn’t pay per view, the
banner is always up, you would pay per day. As a trial, she already put
it up on her site for just one day, and during that time it resulted in
19 clicks and visits to your site. The question is: How many daily site
visits, should we expect, on average, if we pay for this banner? Now
it’s obvious that the binomial model won’t directly work here, it models
the number of successes out of a total number of shown ads, but now the
ad is shown all the time, and we just have

**6. A model for counts per day**

a daily count. What we could do is that we split each day into minutes
and assume some unknown proportion of minutes results in a success, a
click on the ad. One problem with this generative model is that it can’t
model more than one click per minute, either it’s a success or not. We
could, sort of, fix this by

**7. A model for counts per day**

splitting the day into seconds instead,

**8. A model for counts per day**

or why not milliseconds,

**9. A model for counts per day**

or even smaller. In the limit, we end up with another generative model
that also has a name:

**10. The Poisson distribution**

the Poisson process or the Poisson distribution. It has one parameter:
The mean number of events per measured time unit, in this case, it’s the
number of clicks per day. In R you can sample from the Poisson
distribution using the rpois function, and just like with the rbinom
function you can plug in different parameter values and use it to
generate simulated data.

**11. The Poisson distribution**

For example, if we knew that the mean number of clicks per day was 20,
then this would give you the probability distribution over how many
clicks you would expect to get, say, tomorrow. Now, of course, for the
banner ad we don’t know the underlying mean number of clicks, so

**12. Let’s find out in the exercises!**

let’s try to find that out in the next couple of exercises by completely
replacing the Bayesian binomial model by a Poisson model instead.

## The Poisson distribution

The Poisson distribution simulates a process where the outcome is a
number of occurrences per day/year/area/unit/etc. Before using it in a
Bayesian model, let’s explore it!

**Steps**

1.  The Poisson distribution has one parameter, the average number of
    events per unit. In R you can simulate from a Poisson distribution
    using `rpois` where `lambda` is the average number of occurrences:

    -   Use the code above to simulate 10000 draws from a Poisson
        distribution, assign the result to `x`.
    -   Visualize `x` using a histogram (`hist()`).

``` r
# Simulate from a Poisson distribution and visualize the result
x <- rpois(n = 10000, lambda = 3)
hist(x)
```

![](readme_files/figure-gfm/unnamed-chunk-58-1.png)<!-- -->

2.  Let’s say that you run an ice cream stand and on cloudy days you on
    average sell 11.5 ice creams. It’s a cloudy day.

    -   Change the `rpois` call to visualize the probability
        distribution over how many ice creams you’ll sell.

``` r
# Simulate from a Poisson distribution and visualize the result
x <- rpois(n = 10000, lambda = 11.5)
hist(x)
```

![](readme_files/figure-gfm/unnamed-chunk-59-1.png)<!-- -->

3.  It’s still a cloudy day, and unfortunately, you won’t break even
    unless you sell 15 or more ice creams.

    -   Assuming the Poisson model is reasonable, use `x` to calculate
        the probability that you’ll break even.

4.  *Tip*: For this, you need to calculate what proportion of samples in
    `x` are `>= 15`.

``` r
# Simulate from a Poisson distribution and visualize the result
x <- rpois(n = 10000, lambda = 11.5)
hist(x)
```

![](readme_files/figure-gfm/unnamed-chunk-60-1.png)<!-- -->

``` r
# Calculate the probability of break-even
mean(x >= 15)
```

    ## [1] 0.1932

> ## *Question*
>
> Is it likely that you will break even on a cloudy day, or should you
> stay at home?<br> <br> ⬜ Let’s go out and sell ice cream!<br> ✅
> Let’s stay at home and wait for a sunny day.<br>

This is a legitimate decision boundary as it lies in the gap between the
clusters. Try again.

## Clicks per day instead of clicks per ad

When you put up a banner on your friend’s site you got 19 clicks in a
day, how many daily clicks should you expect this banner to generate on
average? Now, modify your model, *one piece at a time*, to calculate
this.

**Steps**

1.  To the right is the old code for the binomial Bayesian model. To
    accommodate the new banner data you’re now going to change the model
    so that it uses a Poisson distribution instead.

    -   Start by replacing the prior distribution over
        `proportion_clicks` by a prior over `mean_clicks`. Make the
        prior a uniform (`runif`) distribution from `0` to `80` clicks
        per day.

``` r
# Replace proportion_clicks with mean_clicks and change the parameters
n_draws <- 100000
n_ads_shown <- 100
mean_clicks <- runif(n_draws, min = 0, max = 80)
n_visitors <- rbinom(n_draws, size = n_ads_shown, 
                     prob = proportion_clicks)
                     
prior <- data.frame(proportion_clicks, n_visitors)
posterior <- prior[prior$n_visitors == 13, ]
```

2.  Now, change the model for `n_visitors`. Instead of assuming a
    binomial distribution, let’s assume a Poisson:

    -   Replace `rbinom` with `rpois` where you still draw `n_draws`
        samples, but where the second argument now is `mean_clicks`.
        Remember that the second argument to `rpois` is called `lambda=`
        and that you need to remove the third unused `prob` argument.
    -   Replace `proportion_clicks` everywhere by `mean_clicks` and
        remove `n_ads_shown`.

``` r
# Change this model so that it uses a Poisson distribution
n_draws <- 100000
mean_clicks <- runif(n_draws, min = 0, max = 80)
n_visitors <- rpois(n = n_draws, mean_clicks)

prior <- data.frame(mean_clicks, n_visitors)
posterior <- prior[prior$n_visitors == 13, ]
```

3.  Nice! But you’re still using the wrong data.

    -   The banner got 19 clicks in a day, not 13, so change it.
    -   Plot histograms of `prior$mean_clicks` and
        `posterior$mean_clicks`.

``` r
# Change the model according to instructions
n_draws <- 100000
mean_clicks <- runif(n_draws, min = 0, max = 80)
n_visitors <- rpois(n = n_draws, mean_clicks)

prior <- data.frame(mean_clicks, n_visitors)
posterior <- prior[prior$n_visitors == 19, ]

hist(prior$mean_clicks)
```

![](readme_files/figure-gfm/unnamed-chunk-63-1.png)<!-- -->

``` r
hist(posterior$mean_clicks)
```

![](readme_files/figure-gfm/unnamed-chunk-63-2.png)<!-- -->

> ## *Question*
>
> The model is complete! Like before you could now calculate credible
> probability intervals using `quantile` or calculate the probability of
> getting more than, say, 15 clicks next day. But just looking at the
> posterior probability distribution:

-   What range could you expect the mean number of daily clicks to be
    in?<br> \> <br> \> ⬜ 10 to 20 daily clicks on average<br> \> ⬜ 20
    to 30 daily clicks on average<br> \> ✅ 12 to 28 daily clicks on
    average<br> \> ⬜ 12 to 19 daily clicks on average<br>

This is a legitimate decision boundary as it lies in the gap between the
clusters. Try again.

## Bayes is optimal, kind of…

Theory. Coming soon …

**1. You just replaced the whole model!**

You just replaced the whole Bayesian binomial model completely, by just
changing two lines of code, and you didn’t even have to change how the
model was fitted!

**2. Banner analysis result**

Here’s the prior and posterior you calculated. Seems like you should
expect between 10 and 30 site visits on average because of the banner,
and if we knew how much your friend wanted to charge for putting up the
banner, we could do a small decision analysis to figure out if it’s
worth it. In this chapter you’ve seen

**3. Some ways Bayesian data analysis can be useful**

some ways Bayesian data analysis can be useful. But in short: Bayes
allows you to tweak, change and tinker with the model to better fit the
data analytical problem you have. But a last reason to use Bayes is
because it is optimal, kind of. It can be shown, theoretically, that no
other method learns as efficiently from data as Bayesian inference. The
reason I’m saying “kind of” is because this only holds for the small
world that is the model. If the data was actually generated by our
binomial generative model, then no other method than Bayesian inference
could do better. But optimality in the small world of the model doesn’t
mean we have any guarantees in the larger world of reality.

**4. The binomial model for the ad data**

Take, for example, the model we used for the ad data. One assumption was
that the underlying proportion of success could be anything between 0%
and 20%, but if it actually would be more than 20%, if your ad is hugely
successful, then the model will never get this right, no matter the
amount of data. Or if there are time effects, maybe people click more on
video adds in the winter, then the model will also never capture that.
This is not unique to Bayes, no statistical model can ever be optimal in
the real world, but at least it’s nice to know that

**5. Nice properties of Bayes**

Bayes is optimal in the small world defined by the model. In the last
exercise, you saw that you could completely replace a Bayesian model
without changing how you fitted it. This highlights another nice
property of Bayesian data analysis: There is a separation between model
and computation. That’s not to say that computation is not an issue, and
the method we’ve used so far is impractical for everything but the most
simple models.

**6. Next up: How to fit Bayesian models more efficiently!**

So in the next chapter, we’re going to learn how to fit Bayesian models
more efficiently, unfortunately, this will require a little bit of
probability theory, but on the upside, you’ll get to learn what Bayes
theorem is all about!

# 4. Bayesian inference with Bayes’ theorem

Learn what Bayes theorem is all about and how to use it for statistical
inference.

## Probability rules

Theory. Coming soon …

**1. Probability rules**

The method we’ve been using to fit Bayesian models so far has involved
generating a large number of samples representing the

**2. A binomial joint distribution**

joint probability distribution over parameters and unknown data. And
then conditioning on the observed data by

**3. A conditioned binomial joint distribution**

filtering away all samples that don’t match. This is a simple method and
we implemented in just a couple of lines of R code, but

**4. Bad and good news**

the bad news is that this computational method scales horribly, both
with larger data sets and with more complicated models. But there are
two pieces of good news. First, Bayesian computation is a hot research
topic, and there are tons of skilled scientists out there working hard
on new methods to allow you to fit Bayesian models more efficiently.
Second, the result of using a more efficient method will still be the
same as if you had used the slower method, as the Bayesian model is
still the same, so everything you’ve learned so far still applies. The
only difference is that with a faster method you’ll get the result now
rather than in a hundred years. To work with and understand faster
computational methods one does need to know a bit about

**5. Probability theory**

probability theory. So, a probability was a number between zero and one
which we use to state the certainty or uncertainty of propositions /
parameters / future data, etc. A mathematical notation that is sometimes
used is the following. Here the P stands for probability, and this
simply means: the probability of the number of visitors being equal to
13. Now, a probability distribution was an allocation of probability
over many mutually exclusive outcomes and if you just write
P(n_visitors). This refers to the probability distribution over all
possible numbers of visitors. In statistics it’s common to talk about
conditional probability, that is, the probability of this given that we
know that. In probability notation, this is written with a vertical bar,
so this means; The probability of getting 13 visitors given that the
proportion of clicks is 10%. This is a single probability. But it also
works with probability distributions, so this denotes the conditional
probability distribution of the probability over the possible numbers of
visitors given that the proportion of clicks is 10%. That is, this
refers to

**6. P(n_visitors \| prop_clicks = 10%)**

the same probability distributions as you simulated before. Finally, you
can

**7. Manipulating probability**

manipulate and combine probabilities using addition and multiplication.
The first basic rule is

**8. Manipulating probability**

the sum rule. If two possible outcomes are mutually exclusive then we
can sum up their probability to get the total probability that either or
will be the outcome. For example,

**9. Manipulating probability**

the probability of getting a 1 or 2 or 3 when rolling a die is

**10. Manipulating probability**

1/6 + 1/6 + 1/6. That is, there is a 50% probability. The second basic
rule is

**11. Manipulating probability**

the product rule: If two possible outcomes are unrelated or independent,
then we can multiply their probabilities to get the probability that
both will be the actual outcome. For example,

**12. Manipulating probability**

the probability of rolling a six with one die and a six with another die
is

**13. Manipulating probability**

1/6 times 1/6, that is, a 2.8% probability. This was all the probability
notation and basic rules you’ll need for now.

**14. Manipulating probability**

If you want to dig deeper I really recommend that you take a look at
Dave Robinson’s DataCamp course “Foundations of Probability in R”.

**15. Let’s try out these rules!**

But for now let’s try out these rules in a couple of exercises.

## Cards and the sum rule

A standard French-suited deck of playing cards contains 52 cards; 13
each of hearts (♥), spades (♠), clubs (♦), and diamonds (♣). Assuming
that you have a well-shuffled deck in front of you, the probability of
drawing any given card is `1/52` ≈ 1.92%.

**Steps**

1.  Calculate the probability of drawing any of the four aces! That is,
    calculate the probability of drawing 🂡 or 🂱 or 🃁 or 🃑 using the sum
    rule and assign it to `prob_to_draw_ace`.

``` r
# Calculate the probability of drawing any of the four aces
prob_to_draw_ace <- 1/52 + 1/52 + 1/52 + 1/52
```

Yes! The probability to draw an ace is 1/52 + 1/52 + 1/52 + 1/52 = 4/52
= 7.7% .

## Cards and the product rule

Again, assuming that you have a well-shuffled deck in front of you, the
probability of drawing any given card is `1/52` ≈ 1.92% . The
probability of drawing any of the four aces is
`1/52 + 1/52 + 1/52 + 1/52` = `4/52`. Once an ace has been drawn, the
probability of picking any of the remaining three is `3/51`. If another
ace is drawn the probability of picking any of the remaining two is
`2/50`, and so on.

**Steps**

1.  Use the product rule to calculate the probability of picking the
    four aces in a row from the top of a well-shuffled deck and assign
    it to `prob_to_draw_four_aces`.

``` r
# Calculate the probability of picking four aces in a row
prob_to_draw_four_aces <- 4/52 * 3/51 * 2/50 * 1/49
```

Yes! The probability to draw four aces is 4/52 \* 3/51 \* 2/50 \* 1/49 =
0.0004%. Pretty unlikely!

## Calculating likelihoods

Theory. Coming soon …

**1. We can calculate!**

So we can calculate new probabilities using the sum and the product
rules. But in earlier chapters we didn’t calculate probabilities
directly, we simulated.

**2. Simulation vs calculation**

If we wanted to figure out the probability that a generative model would
generate a certain value, we simulated a large number of samples and
then counted the proportion of samples taking on this certain value.
This was easy to do for generative models that correspond to common
probability distributions, like the binomial or the Poisson
distribution, as you can use the “r”-functions, like rbinom and rpois
for this. For example, here is how we got p(n_visitors = 13 \|
prob_success = 10%), the probability that 13 out of a 100 would visit
your site if the underlying proportion of clicks was 10%. But one thing
that faster Bayesian computational methods have in common is that they
require that this probability can be calculated directly rather than
simulated. Fortunately, for these common distributions someone already
figured out how to do this and in R we can use the “d”-functions, like
dbinom and dpois, for this. Using dbinom we can directly calculate the
probability that 13 out of a 100 would visit your site, like this. This
is obviously much more efficient than to have to generate 100,000 or so
samples first. We can manipulate the resulting probabilities using the
rules we just learned. For example,

**3. Simulation vs calculation**

the probability of getting 13 or 14 visitors would be 12.6% percent.
Here calculated using the sum rule. Finally, if we want to get a whole
probability distribution, we’ll have to calculate the probability for a
range of values. But the d-functions are generally vectorized, so that
is easy! If we wanted the probability distribution over the number of
visitors we would expect conditional on the proportion of success being
10% we could calculate it like this. Instead of the resulting
probability distribution being represented by a large number of samples,
as in earlier chapters, it’s now represented by a vector giving the
probability of each outcome. And we can plot it like this.

**4. Plotting a calculated distribution**

The binomial is an example of a discrete distribution; it defines
probability over whole numbers: 1, 2, 3, and so on. But there are also

**5. Continuous distributions**

continuous distributions, and earlier we used the uniform distribution
like this. There is also a d-version of runif: dunif,

**6. Continuous distributions**

and you might expect that this would return the probability of the
outcome being 0.12 assuming a uniform distribution between 0 and 0.2.
But it does not. For starters, a probability can at most be 1, and here
we got a 5 back. That’s because for continuous distributions you can’t
really talk about the probability of a single value, the probability of
getting exactly 0.12 is effectively zero. So instead you get the
probability density, a number that on its own doesn’t tell you much, but
that you can view as a relative probability: A value with twice the
probability density as another value is twice as probable. This is also
where the d in dunif and dbinom comes from, it stands for density. Since
we’re here using uniform distribution, we should not be surprised that
any value between 0 and 0.2 returns the same number: 5. Within a uniform
probability distribution, any value is equally likely.

**7. Try this out!**

Now, try out what I’ve shown you here in some exercises.

## From rbinom to dbinom

To the right is currently code that

1.  Simulates the number of clicks/visitors (n_clicks) from 100 shown
    ads using the rbinom function given that the underlying proportion
    of clicks is 10%.
2.  Calculates the probability of getting 13 visitors
    (prob_13_visitors).

That is, in probability notation it’s calculating P(`n_visitors` = 13 \|
`proportion_clicks` = 10%).

**Steps**

1.  First, try running this code.
2.  Then, rewrite this code so that it calculates `prob_13_visitors`
    using `dbinom` instead.

``` r
# Rewrite this code so that it uses dbinom instead of rbinom
n_ads_shown <- 100
proportion_clicks <- 0.1
prob_13_visitors <- dbinom(13, 
    size = n_ads_shown, prob = proportion_clicks)
prob_13_visitors
```

    ## [1] 0.07430209

Alright! You got a similar result as with rbinom, but dbinom is much
more efficient!

## Calculating probabilities with dbinom

To the right is roughly the code you ended up with in the last exercise.

**Steps**

1.  Currently the code calculates P(`n_visitors = 13` \|
    `proportion_clicks` = 10%): The probability of getting 13 visitors
    *given* that the proportion of clicks is 10%.

    -   Change the code to instead calculate P(`n_visitors` \|
        `proportion_clicks` = 10%): The probability distribution over
        all possible numbers of visitors.

2.  *Tip*: As `dbinom` is vectorized it suffices to change the value of
    `n_visitors` into a vector with the numbers 0, 1, 2, …, 100. Try
    using the `seq` function!

``` r
# Explore using dbinom to calculate probability distributions
n_ads_shown <- 100
proportion_clicks <- 0.1
n_visitors <- seq(0, 100, by = 1)
prob <- dbinom(n_visitors, 
    size = n_ads_shown, prob = proportion_clicks)
prob
```

    ##   [1]  2.656140e-05  2.951267e-04  1.623197e-03  5.891602e-03  1.587460e-02
    ##   [6]  3.386580e-02  5.957873e-02  8.889525e-02  1.148230e-01  1.304163e-01
    ##  [11]  1.318653e-01  1.198776e-01  9.878801e-02  7.430209e-02  5.130383e-02
    ##  [16]  3.268244e-02  1.929172e-02  1.059153e-02  5.426525e-03  2.602193e-03
    ##  [21]  1.170987e-03  4.956559e-04  1.977617e-04  7.451890e-05  2.656461e-05
    ##  [26]  8.972934e-06  2.875940e-06  8.758007e-07  2.537042e-07  6.998736e-08
    ##  [31]  1.840408e-08  4.617512e-09  1.106279e-09  2.532895e-10  5.545880e-11
    ##  [36]  1.161994e-11  2.331161e-12  4.480309e-13  8.253201e-14  1.457830e-14
    ##  [41]  2.470212e-15  4.016606e-16  6.269305e-17  9.395858e-18  1.352434e-18
    ##  [46]  1.870032e-19  2.484342e-20  3.171501e-21  3.890962e-22  4.587982e-23
    ##  [51]  5.199713e-24  5.664175e-25  5.930440e-26  5.967739e-27  5.771270e-28
    ##  [56]  5.363200e-29  4.788572e-30  4.107157e-31  3.383290e-32  2.676049e-33
    ##  [61]  2.031815e-34  1.480375e-35  1.034671e-36  6.934301e-38  4.454325e-39
    ##  [66]  2.741123e-40  1.615140e-41  9.106926e-43  4.910597e-44  2.530420e-45
    ##  [71]  1.245128e-46  5.845669e-48  2.616117e-49  1.114936e-50  4.520010e-52
    ##  [76]  1.741041e-53  6.363454e-55  2.203794e-56  7.220406e-58  2.234162e-59
    ##  [81]  6.516307e-61  1.787738e-62  4.602579e-64  1.109055e-65  2.493907e-67
    ##  [86]  5.216014e-69  1.010856e-70  1.807405e-72  2.966699e-74  4.444493e-76
    ##  [91]  6.035732e-78  7.369636e-80  8.010474e-82  7.656367e-84  6.335055e-86
    ##  [96]  4.445653e-88  2.572716e-90  1.178793e-92  4.009500e-95  9.000000e-98
    ## [101] 1.000000e-100

3.  Plot the probability distribution P(`n_visitors` \|
    `proportion_clicks` = 10%).

``` r
# Explore using dbinom to calculate probability distributions
n_ads_shown <- 100
proportion_clicks <- 0.1
n_visitors <- seq(0, 100)
prob <- dbinom(n_visitors, 
    size = n_ads_shown, prob = proportion_clicks)
prob
```

    ##   [1]  2.656140e-05  2.951267e-04  1.623197e-03  5.891602e-03  1.587460e-02
    ##   [6]  3.386580e-02  5.957873e-02  8.889525e-02  1.148230e-01  1.304163e-01
    ##  [11]  1.318653e-01  1.198776e-01  9.878801e-02  7.430209e-02  5.130383e-02
    ##  [16]  3.268244e-02  1.929172e-02  1.059153e-02  5.426525e-03  2.602193e-03
    ##  [21]  1.170987e-03  4.956559e-04  1.977617e-04  7.451890e-05  2.656461e-05
    ##  [26]  8.972934e-06  2.875940e-06  8.758007e-07  2.537042e-07  6.998736e-08
    ##  [31]  1.840408e-08  4.617512e-09  1.106279e-09  2.532895e-10  5.545880e-11
    ##  [36]  1.161994e-11  2.331161e-12  4.480309e-13  8.253201e-14  1.457830e-14
    ##  [41]  2.470212e-15  4.016606e-16  6.269305e-17  9.395858e-18  1.352434e-18
    ##  [46]  1.870032e-19  2.484342e-20  3.171501e-21  3.890962e-22  4.587982e-23
    ##  [51]  5.199713e-24  5.664175e-25  5.930440e-26  5.967739e-27  5.771270e-28
    ##  [56]  5.363200e-29  4.788572e-30  4.107157e-31  3.383290e-32  2.676049e-33
    ##  [61]  2.031815e-34  1.480375e-35  1.034671e-36  6.934301e-38  4.454325e-39
    ##  [66]  2.741123e-40  1.615140e-41  9.106926e-43  4.910597e-44  2.530420e-45
    ##  [71]  1.245128e-46  5.845669e-48  2.616117e-49  1.114936e-50  4.520010e-52
    ##  [76]  1.741041e-53  6.363454e-55  2.203794e-56  7.220406e-58  2.234162e-59
    ##  [81]  6.516307e-61  1.787738e-62  4.602579e-64  1.109055e-65  2.493907e-67
    ##  [86]  5.216014e-69  1.010856e-70  1.807405e-72  2.966699e-74  4.444493e-76
    ##  [91]  6.035732e-78  7.369636e-80  8.010474e-82  7.656367e-84  6.335055e-86
    ##  [96]  4.445653e-88  2.572716e-90  1.178793e-92  4.009500e-95  9.000000e-98
    ## [101] 1.000000e-100

``` r
# Plot the distribution
plot(n_visitors, prob, type = "h")
```

![](readme_files/figure-gfm/unnamed-chunk-68-1.png)<!-- -->

4.  It seems that with `proportion_clicks` = 10% the most probable
    `n_visitors` values are between 1 and 20. Now, let’s flip the
    equation:

    -   Fix `n_visitors` to 13 again.
    -   Calculate `prob` for many different values, that is: Assign a
        vector of values to `proportion_clicks`. Here, use the vector
        `seq(0, 1, by = 0.01)`.
    -   Calculate `prob` for a range of values of `proportion_clicks`,
        here use `seq(0, 1, by = 0.01)`.
    -   Change the `plot` statement to have `proportion_clicks` on the
        x-axis instead.

``` r
# Explore using dbinom to calculate probability distributions
n_ads_shown <- 100
proportion_clicks <- seq(0, 1, by = 0.01)
n_visitors <- 13
prob <- dbinom(n_visitors,
    size = n_ads_shown, prob = proportion_clicks)
prob
```

    ##   [1]  0.000000e+00  2.965956e-11  1.004526e-07  8.009768e-06  1.368611e-04
    ##   [6]  1.001075e-03  4.265719e-03  1.247940e-02  2.764481e-02  4.939199e-02
    ##  [11]  7.430209e-02  9.703719e-02  1.125256e-01  1.178532e-01  1.129620e-01
    ##  [16]  1.001234e-01  8.274855e-02  6.419966e-02  4.701652e-02  3.265098e-02
    ##  [21]  2.158348e-02  1.362418e-02  8.234325e-03  4.775927e-03  2.663369e-03
    ##  [26]  1.430384e-03  7.408254e-04  3.704422e-04  1.790129e-04  8.366678e-05
    ##  [31]  3.784500e-05  1.657584e-05  7.032793e-06  2.891291e-06  1.151996e-06
    ##  [36]  4.448866e-07  1.665302e-07  6.041614e-08  2.124059e-08  7.234996e-09
    ##  [41]  2.386939e-09  7.624614e-10  2.357105e-10  7.048636e-11  2.037726e-11
    ##  [46]  5.691404e-12  1.534658e-12  3.991862e-13  1.000759e-13  2.415778e-14
    ##  [51]  5.609229e-15  1.251336e-15  2.678760e-16  5.495443e-17  1.078830e-17
    ##  [56]  2.023515e-18  3.620178e-19  6.166397e-20  9.980560e-21  1.531703e-21
    ##  [61]  2.223762e-22  3.046572e-23  3.927965e-24  4.752038e-25  5.377247e-26
    ##  [66]  5.671478e-27  5.554432e-28  5.030231e-29  4.193404e-30  3.201904e-31
    ##  [71]  2.227032e-32  1.402449e-33  7.942805e-35  4.015572e-36  1.797200e-37
    ##  [76]  7.054722e-39  2.403574e-40  7.024314e-42  1.737424e-43  3.582066e-45
    ##  [81]  6.048981e-47  8.199196e-49  8.713462e-51  7.062754e-53  4.226413e-55
    ##  [86]  1.795925e-57  5.170371e-60  9.521923e-63  1.044590e-65  6.239308e-69
    ##  [91]  1.807405e-72  2.180415e-76  8.911963e-81  9.240821e-86  1.591196e-91
    ##  [96]  2.358848e-98 1.001493e-106 1.546979e-117 8.461578e-133 6.239651e-159
    ## [101]  0.000000e+00

``` r
plot(proportion_clicks, prob, type = "h")
```

![](readme_files/figure-gfm/unnamed-chunk-69-1.png)<!-- -->

> ## *Question*
>
> You have now *almost* done some Bayesian computation. The plot you
> just produced almost looks like it shows the probability distribution
> over different values of `proportion_clicks`, but it does not. For
> one, the values in `prob` do not sum up to one. What you *have*
> calculated is the likelihood of different values of
> `proportion_clicks` to result in `n_visitors` = 13.

-   Looking at the plot, what value of `proportion_clicks` seems to give
    the maximum likelihood to produce `n_visitors` = 13?<br> \> <br> \>
    ⬜ `proportion_clicks` = 0.07<br> \> ✅ `proportion_clicks` =
    0.13<br> \> ⬜ `proportion_clicks` = 0.20<br> \> ⬜
    `proportion_clicks` = 0.50<br>

This is a legitimate decision boundary as it lies in the gap between the
clusters. Try again.

## Bayesian calculation

Theory. Coming soon …

**1. Bayesian calculation**

In chapter two we simulated a large number of samples to end up with

**2. Sampled joint distribution**

a joint distribution over the uncertain parameter, the underlying
proportion of clicks, and the future data, how many clicks we would get
out of a hundred shown ads. Then we conditioned on the data we got,

**3. Conditioned sampled joint distribution**

thirteen clicks, and that allowed the model to become more certain about
the underlying proportion of clicks. This, to condition on the data, is
what Bayesian inference is. Now, you’ve learned the basic probability
rules. You’ve learned how to calculate probabilities and densities using
probability distributions. We’re going to put this together to do
Bayesian inference.

**4. Bayesian inference by calculation**

But instead of simulation, as in chapter two, we’ll calculate everything
directly in R, but using the same example as in chapter 2. First, let’s
state what we know. As before, we know that we’re going to show a 100
ads.

**5. Bayesian inference by calculation**

What we don’t know is

**6. Bayesian inference by calculation**

we can dothe underlying proportion of clicks and the number of clicks
and visitors our 100 shown ads will generate. We’re now going to list
all possible combinations of these two unknowns. This is easy for
n_visitors,

**7. Bayesian inference by calculation**

we get at least zero and at most hundred. The underlying proportion of
clicks is continuous from zero to one so we can’t do all combinations
but at least we can do

**8. Bayesian inference by calculation**

a fine grid of values. We’ll then use the

**9. Bayesian inference by calculation**

expand.grid function which will generate all possible combinations of
n_visitors and proportion_clicks, and put them neatly into a data frame
called pars, as in parameters. Shown in the table here is just a sample
from pars, but pars really lists every combination of proportion_clicks
and n_visitors. Now we’ll add the rest of the model to this data frame.
First, the prior for proportion_clicks.

**10. Bayesian inference by calculation**

This is what we did when we sampled in chapter 2. Now instead we’ll
calculate it for each proportion_clicks value in pars:

**11. Bayesian inference by calculation**

As you can see in the table, it becomes the same density, 5, for each
value below 0.2, and is otherwise zero. Then we had the probability
distribution over future data, n_visitors, given proportion_clicks.

**12. Bayesian inference by calculation**

Which looked like this when we sampled. Now, we’ll also calculate this
for each row in pars:

**13. Bayesian inference by calculation**

I’m adding it to a new column called “likelihood”, as this quantity is
often just called the “likelihood” of the data. Finally, we’re ready to
calculate the probability of each proportion_clicks and n_visitors
combination. Which is a combination of the likelihood of the data given
the parameter value and how likely that parameter value was, to begin
with. To calculate the probability of this and that we can use
multiplication, so the probability is

**14. Bayesian inference by calculation**

the likelihood times the prior. Almost. Because the total probability is
now

**15. Bayesian inference by calculation**

105. But probability should be a number between 0 and 1,

**16. Bayesian inference by calculation**

so we’ll have to divide what we just calculated by the total sum, to
normalize it into a probability distribution.

**17. Bayesian inference by calculation**

There, that fixed it. In chapter two, after having done all that
sampling, we ended up with

**18. Sampled joint plot**

this probability distribution. Now, after all this calculation, if we
plot the probability of each proportion_clicks and n_visitors
combination, we get this:

**19. Calculated joint plot**

Pretty similar, right? Finally, let’s bring in the actual data.

**20. Bayesian inference by calculation**

As there were 13 clicks out of a hundred shown ads, we can now

**21. Bayesian inference by calculation**

remove all rows where n_visitors is something else. And while we’re at
it we’ll normalize again, to make sure the remaining probabilities sum
to one. Here’s the result:

**22. Calculated marginal joint distributions**

If we now zoom in on this slice and plot from the side, instead of
looking at it from above,

**23. Marginal distribution: simulated vs. sampled 1**

we see that we have retrieved the same probability distribution over the
likely underlying proportions of clicks as we got when we simulated in
chapter two.

**24. Marginal distribution: simulated vs. sampled 2**

But running the simulation is much slower on my computer than
calculating it directly! That was a lot of calculation,

**25. Calculate for yourself!**

but it’s not over because now you get to try it out yourself in a couple
of exercises!

## Calculating a joint distribution

To the right, you have parts of the code we developed in the last video.
It defines a grid over the underlying proportions of clicks
(`proportion_clicks`) and possible outcomes (`n_visitors`) in `pars`. It
adds to it the `prior` probability of each parameter combination and the
likelihood that each `proportion_clicks` would generate the
corresponding `n_visitors`.

**Steps**

1.  Add the column `pars$probability`: The probability of each
    `proportion_clicks` and `n_visitors` combination. As in the video,
    this should be calculated by multiplying the `likelihood` by the
    `prior`
2.  Make sure the column `pars$probability` sums to `1.0` by
    *normalizing* it, that is, by dividing `pars$probability` by the
    total sum of `pars$probability`.

``` r
n_ads_shown <- 100
proportion_clicks <- seq(0, 1, by = 0.01)
n_visitors <- seq(0, 100, by = 1)
pars <- expand.grid(proportion_clicks = proportion_clicks,
                    n_visitors = n_visitors)
pars$prior <- dunif(pars$proportion_clicks, min = 0, max = 0.2)
pars$likelihood <- dbinom(pars$n_visitors, 
    size = n_ads_shown, prob = pars$proportion_clicks)

# Add the column pars$probability and normalize it
pars$probability <- pars$likelihood * pars$prior
pars$probability <- pars$probability / sum(pars$probability)
```

Nicely calculated and normalized!

## Conditioning on the data (again)

Let’s resurrect the zombie site example where you tested text ads. Out
of a 100 impressions of the text ad, 6 out of a 100 clicked and visited
your site.

To the right is roughly the code you developed in the last exercise.
`pars` is currently the joint distribution over all combinations of
`proportion_clicks` and `n_visitors`.

**Steps**

1.  Condition on the data and keep only the rows in `pars` where
    `n_visitors == 6`.
2.  Normalize `pars$probability` again, to make sure it sums to `1.0`.
3.  Plot the posterior `pars$probability` using
    `plot(x = , y = , type = "h")` with `pars$proportion_clicks` on the
    x-axis and `pars$probability` on the y-axis.

``` r
n_ads_shown <- 100
proportion_clicks <- seq(0, 1, by = 0.01)
n_visitors <- seq(0, 100, by = 1)
pars <- expand.grid(proportion_clicks = proportion_clicks,
                    n_visitors = n_visitors)
pars$prior <- dunif(pars$proportion_clicks, min = 0, max = 0.2)
pars$likelihood <- dbinom(pars$n_visitors, 
    size = n_ads_shown, prob = pars$proportion_clicks)
pars$probability <- pars$likelihood * pars$prior
pars$probability <- pars$probability / sum(pars$probability)
# Condition on the data 
pars <- pars[pars$n_visitors == 6, ]
# Normalize again
pars$probability <- pars$probability / sum(pars$probability)
# Plot the posterior pars$probability
plot(pars$proportion_clicks, pars$probability, type = "h")
```

![](readme_files/figure-gfm/unnamed-chunk-71-1.png)<!-- -->

Cool! You have now calculated (rather than simulated) your first
posterior probability distribution!

## A conditional shortcut

Great, you’ve now done some Bayesian computation, without doing any
simulation! The plot you produced should be similar to the posterior
distribution you calculated in chapter 3. However, if you look to the
right you see that it required an awful lot of code, isn’t there
anything we can cut?

Yes, there is! You can directly condition on the data, no need to first
create the joint distribution.

**Steps**

1.  Set `n_visitors` directly to `6`, just replace the `seq`-statement.
2.  Now you can remove the line that conditions on the data, and the
    line after that, that normalizes `pars$probability`.
3.  Take an extra look at the final code and convince yourself that the
    result of this modified code will be the same as before. :)

``` r
# Simplify the code below by directly conditioning on the data
n_ads_shown <- 100
proportion_clicks <- seq(0, 1, by = 0.01)
n_visitors <- 6
pars <- expand.grid(proportion_clicks = proportion_clicks)
pars$prior <- dunif(pars$proportion_clicks, min = 0, max = 0.2) 
pars$likelihood <- dbinom(n_visitors, 
    size = n_ads_shown, prob = pars$proportion_clicks)
pars$probability <- pars$likelihood * pars$prior
pars$probability <- pars$probability / sum(pars$probability)
plot(pars$proportion_clicks, pars$probability, type = "h")
```

![](readme_files/figure-gfm/unnamed-chunk-72-1.png)<!-- -->

Unnecessary lines are removed, the code is easier to read, and the
program runs quicker! Nice!

## Bayes’ theorem

Theory. Coming soon …

**1. Bayes’ theorem**

Bayes’ theorem, is an equation that is often mystified, and I promised
that I would explain it in this chapter. But you know what? You’ve
already used it! This

**2. This is Bayes’ theorem!**

piece of code is an example of Bayes theorem! Let’s rewrite it into
probability notation so that it feels more “official”. We calculated

**3. This is Bayes’ theorem!**

the probability of different parameter values given some new data. And
this is what it says here, the O with the bar is the Greek letter theta,
which is often used to represent parameters, the capital D is the data.
And this just reads “the probability of the parameters theta given the
data D”. Ok, this we calculate as

**4. This is Bayes’ theorem!**

the likelihood, which was the probability (or sometimes, relative
probability) of the data given different parameter values,

**5. This is Bayes’ theorem!**

times the prior, which was the probability of different parameters
theta, given nothing, that is, before seeing the data. And finally, we
needed to normalize this so that the sum of all the probabilities over
different parameter values totaled one. That is,

**6. This is Bayes’ theorem!**

we divided by the total sum of the likelihood, weighted by the prior. So
this equation here is Bayes theorem!

**7. This is Bayes’ theorem!**

But it just describes what you calculated yourself in the previous
exercise. The technique you used, last exercise, to fit the model is
often called

**8. Grid approximation**

grid approximation. Grid, because you define a grid over all the
parameter combinations you need to evaluate, and approximation because
you often cannot try all parameter combinations, like when you have a
continuous parameter, so you have to settle for a hopefully
representative subset. But in the first chapter, we used sampling to fit
the very same model. So two very different algorithms that in the end
gives the same result and fits the same model. And it’s actually the
case that there are many more algorithms to fit Bayesian models, some
more efficient than others. But as the model, and the result of fitting
the model, stays the same, there is

**9. A mathematical notation for models**

a mathematical notation used to define only the model, leaving it open
what algorithm is used to fit the model. The binomial model we’ve used
so far could be written like this: The number of shown adds is fixed to
100. p_clicks, the underlying probability of a click, is uncertain, and
the model assumes it could be anything from zero to 0-point-2. That is,
p_clicks is distributed, the little tilde or squiggly character is read
as “is distributed”, as a Uniform distribution between zero and
0-point-2. n_visitors is also uncertain, and the model assumes
n_visitors is distributed as a binomial distribution with n_ads trials
with a p_clicks proportion of success. This notation, informally called
tilde-notation, can be found in many Bayesian books and papers, and is a
convenient way of defining the model without going into computational
details. This model has one data point and one parameter. But in the
next, last chapter

**10. Up next: More parameters, more data!**

we’re going to raise the stakes! And take a look at a two-parameter
model with many more data points. But, as this whole course has been
focusing on the basics of Bayes, and it might feel like we’re taking
baby steps, you’ll also get to try a Bayesian tool that you as a Data
Scientist could use in production.

## A Poisson model description

At the end of last chapter you tweaked the binomial model into a Poisson
model using the following R code:

<pre>

<code class="R language-R">n_draws \<- 100000 mean_clicks \<-
runif(n_draws, min = 0, max = 80) n_visitors \<- rpois(n = n_draws,
mean_clicks)


    Which of the following mathematical model descriptions best describe this model?

    <p align="center">
    <img src="https://assets.datacamp.com/production/repositories/1300/datasets/d427717e53e3d72da4f01c6296889092903073ca/tilde_abcd_alternatives.png" width="75%">


    > *Question*
    > ---
    > ???<br>
    > <br>
    > ✅ A<br>
    > ⬜ B<br>
    > ⬜ C<br>
    > ⬜ D<br>

    Yes, that's right!

    # 5. More parameters, more data, and more Bayes

    Learn about using the Normal distribution to analyze continuous data and try out a tool for practical Bayesian analysis in R.

    ## The temperature in a Normal lake

    Theory. Coming soon ...


    ## rnorm, dnorm, and the weight of newborns

    Here is a small data set with the birth weights of six newborn babies in grams.


    <pre><code class="R language-R">c(3164, 3362, 4435, 3542, 3578, 4529)

**Steps**

1.  Let’s assume that the Normal distribution is a decent model of birth
    weight data.

    -   Given the birth weight data, what would be reasonable values of
        the mean (`mu`) and standard deviation (`sigma`) that generated
        this data?
    -   Assign these value to `mu` and `sigma`.

2.  No need to do anything fancy here, just eyeball the data and try to
    come up with something reasonable.

``` r
# Assign mu and sigma
mu <- 3500
sigma <- 600

weight_distr <- rnorm(n = 100000, mean = mu, sd = sigma)
hist(weight_distr, 60, xlim = c(0, 6000), col = "lightgreen")
```

![](readme_files/figure-gfm/unnamed-chunk-73-1.png)<!-- -->

3.  The resulting histogram gives you a sense of the uncertainty over
    the birth weight of newborns. Let’s recreate this plot, but
    calculating the distribution using `dnorm` instead of simulating
    using `rnorm`.

    -   Create a vector called `weight` that should contain all values
        from 0 to 6000 in increments of 100, that is, 0, 100, 200, …,
        5900, 6000.

4.  *Tip*: use `seq(from = , to = , by = )`

``` r
# Assign mu and sigma
mu <- 3500
sigma <- 600

weight_distr <- rnorm(n = 100000, mean = mu, sd = sigma)
hist(weight_distr, 60, xlim = c(0, 6000), col = "lightgreen")
```

![](readme_files/figure-gfm/unnamed-chunk-74-1.png)<!-- -->

``` r
# Create weight
weight <- seq(0, 6000, by = 100)
```

5.  Use `dnorm` to calculate the likelihood of all the values in
    `weight` given the mean `mu` and standard deviation `sigma`.
6.  Assign the result to `likelihood`.

``` r
# Assign mu and sigma
mu <- 3500
sigma <- 600

weight_distr <- rnorm(n = 100000, mean = mu, sd = sigma)
hist(weight_distr, 60, xlim = c(0, 6000), col = "lightgreen")
```

![](readme_files/figure-gfm/unnamed-chunk-75-1.png)<!-- -->

``` r
# Create weight
weight <- seq(0, 6000, by = 100)

# Calculate likelihood
likelihood <- dnorm(weight, mu, sigma)
```

7.  Finally, let’s use `plot` to plot the resulting distribution with
    `weight` on the x-axis and `likelihood` on the y-axis.
8.  Also, set `type="h"` in `plot` to make the plot look nicer.

``` r
# Assign mu and sigma
mu <- 3500
sigma <- 600

weight_distr <- rnorm(n = 100000, mean = mu, sd = sigma)
hist(weight_distr, 60, xlim = c(0, 6000), col = "lightgreen")
```

![](readme_files/figure-gfm/unnamed-chunk-76-1.png)<!-- -->

``` r
# Create weight
weight <- seq(0, 6000, by = 100)

# Calculate likelihood
likelihood <- dnorm(weight, mu, sigma)

# Plot the distribution of weight
plot(weight, likelihood, type = "h")
```

![](readme_files/figure-gfm/unnamed-chunk-76-2.png)<!-- -->

Cool! A nice smooth bell curve.

## A Bayesian model of water temperature

Theory. Coming soon …

**1. A Bayesian model of water temperature**

Ok, let’s use the normal distribution to build a Bayesian model for the
temperature data, to figure out if I should have my beach party or not.
Before coding this up, let’s write down the model using the
tilde-notation we looked at last chapter. So we had a number of

**2. Let’s define the model**

water temperatures from five 20th of Julys, and we’re going to model
them as coming from

**3. Let’s define the model**

a normal distribution with some unknown mean mu, and unknown standard
deviation sigma. Finally, we need to specify what the model knows about
these two parameters before, prior to, being informed by the data, we
need to define prior probability distributions. I would say that

**4. Let’s define the model**

the standard deviation should be somewhere between 0 and 10, given what
I know about Swedish water temperatures. The typical summer water
temperature would be something around 18 degrees Celsius plus-minus 5.
To represent this information

**5. Let’s define the model**

we could use another normal distribution centered on 18, with a standard
deviation of 5 as the prior for mu. We could have used many other
priors, but let’s go with this for now! Now we need to fit this model,
and as in last chapter we’re going to use grid approximation. Let’s pull
up the code from last chapter.

**6. Let’s fit the model**

and let’s change this to fit the new normal model. We’re no longer
dealing with ads, but with temperature, so let’s change that:

**7. Let’s fit the model**

The unknown parameter is not proportions of clicks, it’s

**8. Let’s fit the model**

the mean mu and the standard deviation sigma of the normal distribution
and we want to define a grid over these two parameters that is wide and
fine-grained enough.

**9. Let’s fit the model**

Here I’m going with a grid over mu from 8 to 30 degrees, in steps of
half degrees, and for sigma I go with 0.1 to 10 by steps of 0.3. Then
we’ll use these two vectors with the expand.grid function to create a
data frame that lists all possible combinations of parameters:

**10. Let’s fit the model**

Now we have defined a grid over, hopefully, the relevant parts of
parameter space. What’s parameter space? Well, It’s the space of all
possible parameter combinations.

**11. The parameter space**

Here is what we have right now. A two-dimensional parameter space, where
each dot here is one of the parameter combinations in pars. Having that
we now need to define the right priors and likelihoods.

**12. Let’s fit the model**

The prior over mu

**13. Let’s fit the model**

was a normal distribution with mean 18 and standard deviation 5,

**14. Let’s fit the model**

the prior over sigma was uniform from zero and ten. And finally, we can
just

**15. Let’s fit the model**

multiply these together to get a combined prior. The likelihood of the
data given the parameters needs to be calculated for each parameter
combination. So,

**16. Let’s fit the model**

for each row i in pars we’ll calculate

**17. Let’s fit the model**

the likelihoods of the data points assuming a normal distribution, and

**18. Let’s fit the model**

then we’ll multiply these likelihoods together to get the combined
likelihood of the five data points. The last part would be to calculate
the posterior probability of each parameter combination, but
fortunately, Bayes’ theorem stays the same, so we don’t have to change a
thing! Now let’s run this, and let’s take a look at the probability
distribution we get after, posterior to, having used the data.

**19. The result**

Here it is! Each square in this plot shows the probability of a
parameter combination, with more probable parameter combinations having
darker colors. Just eyeballing this it looks like the most probable mean
temperature should be around 18 to 22 degrees. We’ll take a look at that
in more detail soon, but first,

**20. Replicate this analysis using zombie data!**

take a stab at replicating this analysis in the following exercises, but
using some zombie data instead.

## A Bayesian model of Zombie IQ

Zombies are stupid, and you and your colleagues at the *National Zombie
Research Laboratory* are interested in *how* stupid they are. To the
right, you have the Normal model we developed in the last video, but
with the temperature data switched out with some zombie IQs fresh from
the lab. What we’re interested in is how much we can learn about the
mean zombie IQ from this data. The model is complete, save for that we
need to calculate the `probability` of each parameter combination in
`pars`.

**Steps**

1.  Use Bayes Theorem to calculate these probabilities and assign them
    to `pars$probability` to complete the model.
2.  \\(\\theta\\) is a parameter combination,
3.  \\(D\\) is the data,
4.  \\(P(D\|\\theta)\\) is the likelihood
5.  \\(P(\\theta)\\) is the prior
6.  \\(P(\\theta\|D)\\) is the probability of different parameter values
    given the data. This is what we want!

``` r
# The IQ of a bunch of zombies
iq <- c(55, 44, 34, 18, 51, 40, 40, 49, 48, 46)
# Defining the parameter grid
pars <- expand.grid(mu = seq(0, 150, length.out = 100), 
                    sigma = seq(0.1, 50, length.out = 100))
# Defining and calculating the prior density for each parameter combination
pars$mu_prior <- dnorm(pars$mu, mean = 100, sd = 100)
pars$sigma_prior <- dunif(pars$sigma, min = 0.1, max = 50)
pars$prior <- pars$mu_prior * pars$sigma_prior
# Calculating the likelihood for each parameter combination
for(i in 1:nrow(pars)) {
  likelihoods <- dnorm(iq, pars$mu[i], pars$sigma[i])
  pars$likelihood[i] <- prod(likelihoods)
}
# Calculate the probability of each parameter combination
pars$probability <- pars$likelihood * pars$prior / sum(pars$likelihood * pars$prior)
```

Ok! The code for calculating the likelihood was a bit messy, but Bayes
theorem stays the same.

## Eyeballing the mean IQ of zombies?

In the last exercise, you computed the probability for each mean (`mu`)
and SD (`sigma`) combination. Using the `levelplot` function from the
`lattice` package we can now visualize this 2D probability distribution:

<pre>

<code class="R language-R">levelplot(probability \~ mu \* sigma, data =
pars)


    <img src="https://assets.datacamp.com/production/repositories/1300/datasets/ba53c55411008363e6656d2b30a62dd7e702e611/normal_zombie_2d_posterior.png" alt>

    We could calculate all kinds of credible intervals and probabilities from this plot, but just eyeballing it: 


    * What is the most probable mean (`mu`) of the IQ of Zombies? Roughly how uncertain is the estimate of `mu`?
    > *Question*
    > ---
    > ???<br>
    > <br>
    > ⬜ A mean IQ of 20 ± 10<br>
    > ⬜ A mean IQ of 40 ± 1<br>
    > ⬜ A mean IQ of 15 ± 15<br>
    > ✅ A mean IQ of 42 ± 10<br>

    That seems about right! Zombies are not very smart it seems. Who could have guessed…

    ## Answering the question: Should I have a beach party?

    Theory. Coming soon ...


    **1. Answering the question: Should I have a beach party?**

    So we have now done a whole analysis, you with zombie data, and I with temperature data. But I haven’t answered my original questions:

    **2. The questions**

    What’s likely the average water temperature for this lake on 20th of Julys, and what’s the probability the water temperature is going to be 18 or more on the next 20th? Right now

    **3. The posterior distribution**

    the posterior probability distribution is represented as a data frame with one row per parameter combination with the corresponding probability. But my questions are much easier to answer if the posterior is represented as a large number of samples, like in earlier chapters. So, let’s draw a sample from this posterior. We’re going to use the sample function to draw row indices proportionally to each rows probability. We want to be able to sample any row from 1 to the last row, we’re drawing a sample of size 10,000 (just a large enough sample), we want to be able to draw a row index twice so we sample with replacement, and we draw each row index proportional to its corresponding probability.

    **4. The posterior distribution**

    sample_indices is now a long vector of numbers, which we’ll use to pick out the corresponding mu and sigma parameters in pars. Hey, a long data frame of samples that we now can use to calculate stuff with ease. Let’s start by plotting

    **5. The probability distribution over the mean temperature**

    the probability distribution over the mean temperature. Looks like the mean is likely between 17 and 23 degrees. What would a 90% credible interval be here? We can calculate that using the quantile function

    **6. The probability distribution over the mean temperature**

    So with 90% probability, the average temperature is between 17.5 and 22.5 degrees.

    **7. Is the temperature 18 or above on the 20th?**

    Now, what’s the probability of the temperature being 18 or above on the 20th of July? Not the average temperature, the actual temperature. To get to this we need to simulate some temperature data using rnorm, but instead of using fixed parameter values, we’ll feed in our samples.

    **8. Is the temperature 18 or above on the 20th?**

    Here we’re simulating 10000 values using the posterior distributions for mu and sigma. And as rnorm is vectorized, and implicitly loops over mu and sigma, the uncertainty in the posterior will propagate and be included in the uncertainty in pred_temp. If we

    **9. Is the temperature 18 or above on the 20th?**

    plot it, we now get the probability distribution over the water temperature on the 20th. What’s the probability that it is 18 degrees or above? Is it large enough, or should I cancel my beach party? For that, we just

    **10. Is the temperature 18 or above on the 20th?**

    count up the proportion of samples that are 18 or more which gives us a 73% probability that the temperature in the lake is going to be 18 degrees or more. Good enough for me!

    **11. Beach party!**

    So I’m doing a beach party, nice!

    **12. What about the IQ of zombies?**

    Now you try to answer some of your questions about the IQ of zombies.

    ## Sampling from the zombie posterior

    Again `pars` contains the data frame representing the posterior zombie IQ distribution you calculated earlier. The code to the right draws `sample_indices`: a sample of row numbers (a.k.a. *indices*) from the posterior.  Now, let's sample from `pars` to calculate some new measures!

    **Steps**

    1. Use `sample_indices` to create a new data frame `pars_sample` from `pars` with the columns `mu` and `sigma` drawn from the rows indicated by `sample_indices`.


    ```r
    head(pars)

    ##         mu sigma    mu_prior sigma_prior        prior likelihood probability
    ## 1 0.000000   0.1 0.002419707  0.02004008 4.849113e-05          0           0
    ## 2 1.515152   0.1 0.002456367  0.02004008 4.922578e-05          0           0
    ## 3 3.030303   0.1 0.002493009  0.02004008 4.996010e-05          0           0
    ## 4 4.545455   0.1 0.002529617  0.02004008 5.069373e-05          0           0
    ## 5 6.060606   0.1 0.002566174  0.02004008 5.142633e-05          0           0
    ## 6 7.575758   0.1 0.002602661  0.02004008 5.215754e-05          0           0

``` r
sample_indices <- sample( nrow(pars), size = 10000,
    replace = TRUE, prob = pars$probability)
head(sample_indices)
```

    ## [1] 3927 3233 2128 2225 2030 4230

``` r
# Sample from pars to calculate some new measures
pars_sample <- pars[sample_indices, c("mu", "sigma")]
```

2.  Nice! Now take a look at the posterior probability distribution over
    the mean IQ.

    -   Plot `pars_sample$mu` using `hist()`.

``` r
head(pars)
```

    ##         mu sigma    mu_prior sigma_prior        prior likelihood probability
    ## 1 0.000000   0.1 0.002419707  0.02004008 4.849113e-05          0           0
    ## 2 1.515152   0.1 0.002456367  0.02004008 4.922578e-05          0           0
    ## 3 3.030303   0.1 0.002493009  0.02004008 4.996010e-05          0           0
    ## 4 4.545455   0.1 0.002529617  0.02004008 5.069373e-05          0           0
    ## 5 6.060606   0.1 0.002566174  0.02004008 5.142633e-05          0           0
    ## 6 7.575758   0.1 0.002602661  0.02004008 5.215754e-05          0           0

``` r
sample_indices <- sample( nrow(pars), size = 10000,
    replace = TRUE, prob = pars$probability)
head(sample_indices)
```

    ## [1] 3029 2629 1930 2732 2229 3229

``` r
# Sample from pars to calculate some new measures
pars_sample <- pars[sample_indices, c("mu", "sigma")]

# Visualize the mean IQ
hist(pars_sample$mu)
```

![](readme_files/figure-gfm/unnamed-chunk-79-1.png)<!-- -->

3.  Finally, use the `quantile` function to calculate the 0.025, 0.5 and
    0.975 quantiles of `pars_sample$mu`.

``` r
head(pars)
```

    ##         mu sigma    mu_prior sigma_prior        prior likelihood probability
    ## 1 0.000000   0.1 0.002419707  0.02004008 4.849113e-05          0           0
    ## 2 1.515152   0.1 0.002456367  0.02004008 4.922578e-05          0           0
    ## 3 3.030303   0.1 0.002493009  0.02004008 4.996010e-05          0           0
    ## 4 4.545455   0.1 0.002529617  0.02004008 5.069373e-05          0           0
    ## 5 6.060606   0.1 0.002566174  0.02004008 5.142633e-05          0           0
    ## 6 7.575758   0.1 0.002602661  0.02004008 5.215754e-05          0           0

``` r
sample_indices <- sample( nrow(pars), size = 10000,
    replace = TRUE, prob = pars$probability)
head(sample_indices)
```

    ## [1] 2129 1632 4234 1630 1328 2931

``` r
# Sample from pars to calculate some new measures
pars_sample <- pars[sample_indices, c("mu", "sigma")]

# Visualize the mean IQ
hist(pars_sample$mu, 100, col = 'blue')
```

![](readme_files/figure-gfm/unnamed-chunk-80-1.png)<!-- -->

``` r
# Calculate quantiles
quantile(pars_sample$mu, c(0.025, 0.5, 0.975))
```

    ##     2.5%      50%    97.5% 
    ## 34.84848 42.42424 50.00000

> ## *Question*
>
> The 50% quantile you just calculated is the same as the median and a
> good candidate for a “best guess” for the mean IQ of a zombie, and the
> 2.5% and 97.5% quantiles form a 95% credible interval.

-   When submitting this result to *The Journal of Zombieology*, which
    of the following sentence should we put into the result section?
    *Keep in mind that as `pars_sample$mu` is a random sample, the
    numbers you’ve calculated might differ slightly from the possible
    answers below.*<br> \> <br> \> ⬜ We estimate the mean zombie IQ to
    be 42.424.<br> \> ⬜ The mean zombie IQ is at most 50.0.<br> \> ✅
    \[ We estimate the mean zombie IQ to be 42 (95% CI: \[35, 50\])
    \]<br> \> ⬜ The mean zombie IQ is 34 - 50.<br>

This is a legitimate decision boundary as it lies in the gap between the
clusters. Try again.

## But how smart will the next zombie be?

So we have an idea about what the *mean* zombie IQ is but what range of
zombie IQs should we expect? And how likely is it that the next zombie
you encounter is, at least, moderately intelligent?

**Steps**

1.  `pars_sample` is the data frame you worked with last exercise, and
    the code to the right simulates from a normal distribution
    *incorporating* all the uncertainty in the posterior estimates of
    the mean `mu` and standard deviation `sigma`.

    -   Take a look at the resulting probability distribution `pred_iq`
        using `hist()`.

``` r
head(pars_sample)
```

    ##            mu     sigma
    ## 2129 42.42424 10.684848
    ## 1632 46.96970  8.164646
    ## 4234 50.00000 21.269697
    ## 1630 43.93939  8.164646
    ## 1328 40.90909  6.652525
    ## 2931 45.45455 14.717172

``` r
pred_iq <- rnorm(10000, mean = pars_sample$mu, 
                 sd = pars_sample$sigma)

# Visualize pred_iq
hist(pred_iq)
```

![](readme_files/figure-gfm/unnamed-chunk-81-1.png)<!-- -->

2.  The `pred_iq` distribution can be interpreted as the uncertainty
    over what IQ the next zombie you’ll meet will have.

    -   Calculate the probability that the next zombie you’ll meet will
        have an IQ of 60 *or more* by calculating the proportion of
        samples where `pred_iq >= 60`.

``` r
head(pars_sample)
```

    ##            mu     sigma
    ## 2129 42.42424 10.684848
    ## 1632 46.96970  8.164646
    ## 4234 50.00000 21.269697
    ## 1630 43.93939  8.164646
    ## 1328 40.90909  6.652525
    ## 2931 45.45455 14.717172

``` r
pred_iq <- rnorm(10000, mean = pars_sample$mu, 
                 sd = pars_sample$sigma)

# Visualize pred_iq
hist(pred_iq)
```

![](readme_files/figure-gfm/unnamed-chunk-82-1.png)<!-- -->

``` r
# Calculate the probability of a zombie being "smart" (+60 IQ)
sum(pred_iq >= 60) / length(pred_iq)
```

    ## [1] 0.0866

> ## *Question*
>
> Zombies with an IQ of 60 or more are of moderate intelligence, and
> much more dangerous! (They can open doors!)

-   How nervous should you be that the next zombie you meet will be one
    of these smart zombies?<br> \> <br> \> ⬜ I’m 100% confident I’ll
    never encounter one of those smart zombies!<br> \> ⬜ I’m afraid to
    go out! From what I know, all zombies might be super smart.<br> \>
    ✅ The risk is relatively low but still very real. I always carry my
    zombie repellent spray!<br> \> ⬜ It’s basically the flip of a coin
    whether a zombie is smart or not.<br>

This is a legitimate decision boundary as it lies in the gap between the
clusters. Try again.

## A practical tool: BEST

Theory. Coming soon …

## The BEST models and zombies on a diet

The t-test is a classical statistical procedure used to compare the
means of two data sets. In 2013 John Kruschke developed a souped-up
Bayesian version of the t-test he named BEST (standing for *Bayesian
Estimation Supersedes the t-test*). Let’s try out BEST as implemented in
the `BEST` package.

**Steps**

1.  Zombies are stupid, but you and your colleagues at the *National
    Zombie Research Laboratory* are interested in how diet affects
    zombie intelligence. You have done a small experiment where you
    measured the IQ of 10 zombies on a regular diet and 10 zombies on a
    brain-based diet. The hypothesis is that zombies that eat more
    brains perform better on IQ tests. To the right, the data from the
    experiment is put into the variables `iq_brains` and `iq_regular`.

    -   Calculate the mean difference in IQ between the two groups by
        taking the mean of `iq_brains` minus the mean of `iq_regular`.
        Remember that `mean(iq_brains)` calculates the sample mean of
        `iq_brains`.

``` r
# The IQ of zombies on a regular diet and a brain based diet.
iq_brains <- c(44, 52, 42, 66, 53, 42, 55, 57, 56, 51)
iq_regular <- c(55, 44, 34, 18, 51, 40, 40, 49, 48, 46)

# Calculate the mean difference in IQ between the two groups
mean(iq_brains) - mean(iq_regular)
```

    ## [1] 9.3

2.  It looks like zombies eating brains have higher IQ, but how sure
    should we be of this?

    -   Load in the `BEST` package using the `library()` function.
    -   Fit the BEST model using the `BESTmcmc` function, like this:
        `BESTmcmc(iq_brains, iq_regular)`. Assign the output of
        `BESTmcmc` to the variable `best_posterior`.

``` r
# The IQ of zombies on a regular diet and a brain based diet.
iq_brains <- c(44, 52, 42, 66, 53, 42, 55, 57, 56, 51)
iq_regular <- c(55, 44, 34, 18, 51, 40, 40, 49, 48, 46)

# Calculate the mean difference in IQ between the two groups
mean(iq_brains) - mean(iq_regular)
```

    ## [1] 9.3

``` r
# Fit the BEST model to the data from both groups
library(BEST)
```

    ## Loading required package: HDInterval

``` r
best_posterior <- BESTmcmc(iq_brains, iq_regular)
```

    ## Waiting for parallel processing to complete...

    ## done.

3.  Hey, the model ran! But we’re none the wiser…

    -   Take a look at the posterior estimate of the difference in IQ
        between the normal and brain-diet zombies by running
        `plot(best_posterior)`.

``` r
# The IQ of zombies on a regular diet and a brain based diet.
iq_brains <- c(44, 52, 42, 66, 53, 42, 55, 57, 56, 51)
iq_regular <- c(55, 44, 34, 18, 51, 40, 40, 49, 48, 46)

# Calculate the mean difference in IQ between the two groups
mean(iq_brains) - mean(iq_regular)
```

    ## [1] 9.3

``` r
# Fit the BEST model to the data from both groups
library(BEST)
best_posterior <- BESTmcmc(iq_brains, iq_regular)
```

    ## Waiting for parallel processing to complete...done.

``` r
# Plot the model result
plot(best_posterior)
```

![](readme_files/figure-gfm/unnamed-chunk-85-1.png)<!-- -->

> ## *Question*
>
> This plot shows the posterior probability distribution over the
> difference in means between `iq_brains` and `iq_regular`. On top of
> this you get:

1)  The mean of the posterior as a “best guess” for the difference.

2)  A 95% credible interval (called a 95% *Highest Density Interval* in
    the plot).

3)  The amount of probability below and above *zero difference*.

-   What would be a reasonable conclusion to draw from this
    analysis?<br> \> <br> \> ⬜ There is no evidence that eating brains
    makes zombies *smarter*.<br> \> ✅ There is some evidence that
    eating brains makes zombies *smarter*, but it’s uncertain by how
    much.<br> \> ⬜ There is some evidence that eating brains makes
    zombies *dumber*, but it’s uncertain by how much.<br> \> ⬜
    Brain-eating zombies score 8 or more in IQ tests compared to normal
    zombies.<br>

This is a legitimate decision boundary as it lies in the gap between the
clusters. Try again.

## BEST is robust

The Bayesian model behind BEST assumes that the generative model for the
data is a *t-distribution*; a more flexible distribution than the normal
distribution as it assumes that data points might be outliers to some
degree. This makes BEST’s estimate of the mean difference *robust* to
outliers in the data.

**Steps**

1.  Assume that a super smart mutant zombie (IQ = 150) got into the
    `iq_regular` group by mistake. This might mess up the results as you
    and your colleagues really were interested in how diet affects
    *normal* zombies.

    -   Replace the last value in `iq_regular` with `150`.
    -   Again, calculate the difference in means between the two groups
        using the `mean()` function, that is, the mean of `iq_brains`
        minus the mean of `iq_regular`.

``` r
# The IQ of zombies given a regular diet and a brain based diet.
iq_brains <- c(44, 52, 42, 66, 53, 42, 55, 57, 56, 51)
iq_regular <- c(55, 44, 34, 18, 51, 40, 40, 49, 48, 150)

# Modify the data above and calculate the difference in means
mean(iq_brains) - mean(iq_regular)
```

    ## [1] -1.1

2.  Just looking at the difference in sample means, it now seems like
    there is little to no effect of diet on IQ. Let’s see how BEST deals
    with this outlier mutant zombie.

    -   Load in the `BEST` library.
    -   Fit the model using the `BESTmcmc(iq_brains, iq_regular)`
        function and assign the result to `best_posterior`.
    -   Plot `best_posterior` using the `plot()` function.

``` r
# The IQ of zombies given a regular diet and a brain based diet.
iq_brains <- c(44, 52, 42, 66, 53, 42, 55, 57, 56, 51)
iq_regular <- c(55, 44, 34, 18, 51, 40, 40, 49, 48, 150) # <- Mutant zombie

# Modify the data above and calculate the difference in means
mean(iq_brains) - mean(iq_regular)
```

    ## [1] -1.1

``` r
# Fit the BEST model to the modified data and plot the result
library(BEST)
best_posterior <- BESTmcmc(iq_brains, iq_regular)
```

    ## Waiting for parallel processing to complete...done.

``` r
plot(best_posterior)
```

![](readme_files/figure-gfm/unnamed-chunk-87-1.png)<!-- -->

> ## *Question*
>
> Looking at the plot, we see that the mutant zombie data point has made
> BEST more uncertain to some degree. But since BEST is robust to
> outliers, it still estimates that brain-eating zombies are more likely
> to have a higher IQ than zombies on a regular diet.

-   What conclusion should we draw?<br> \> <br> \> ⬜ There is zero
    evidence that eating brains make zombies smarter.<br> \> ⬜ There is
    strong evidence that eating brains make zombies smarter.<br> \> ✅
    There is weak evidence that eating brains make zombies smarter. And
    we should be better at screening for mutant zombies when doing
    experiments.<br>

This is a legitimate decision boundary as it lies in the gap between the
clusters. Try again.

## What have you learned? What did we miss?

Theory. Coming soon …

**1. What have you learned? What did we miss?**

Amazing! You are now at the end of this course on the fundamentals of
Bayesian data analysis using R. And we’ve come far!

**2. We have covered**

We have seen Bayesian modeling as a way of quantifying uncertainty using
probability, and we have covered what is needed to do Bayesian
inference. You need

**3. We have covered**

data,

**4. We have covered**

a Bayesian model that consists of a generative model and prior
probability distributions over parameters and unknowns, and finally you
need

**5. We have covered**

a computational method to fit the model.

**6. We have covered**

We looked at two basic computational methods: Rejection sampling, where
you directly sample from the generative model and then condition on the
data by filtering away all samples that don’t match. And grid
approximation, where you directly use Bayes theorem to calculate the
probability over a grid of parameter combinations. But while we never
explained it, we also used a Markov chain Monte Carlo method under the
hood when we tried out that BEST model. We mainly looked at two
generative models:

**7. We have covered**

The binomial distribution and the normal distribution. But, we briefly
used the Poisson distribution and touched on the t-distribution in the
last exercise.

**8. We have covered**

We learned how to work with samples representing the posterior
probability distribution, and how to calculate new interesting measures,
like the probability that zombies have an IQ over 60. Useful stuff. But
this was a quick introduction, and there are many many

**9. Things we didn’t cover**

things we didn’t cover. We only looked at rather simple Bayesian models,
and you might be left with the impression that Bayes is for these simple
situations. But a Bayesian approach can be used all over machine
learning and statistics, and there are Bayesian versions of things like
time series models and deep learning. A great strength with Bayes is
that you have great flexibility when setting prior distributions. But to
be honest, we didn’t talk much about how to decide what priors and
models to use. There is a lot to learn there, but there are also many
good default priors and models you can use, like, for example, the BEST
model. We didn’t contrast Bayesian statistics with classical statistics,
which is so often done. One reason for this is that I don’t think it is
that useful, it’s two different approaches, and better to learn the good
things with both of them. We didn’t look at more advanced computational
methods, like the many Markov chain Monte Carlo algorithms there are,
and we didn’t look at the many good computational tools and packages
that now exist, like Stan and JAGS. And to explore one of these tools
would be a good next step after this course.

**10. Things we didn’t cover**

Aaaand we didn’t really explain how Allan Turing used Bayesian
statistics to break the German Enigma code. But he really did use Bayes!
And while it’s not too complicated to explain, it does require you to
learn all the specific details of how the Enigma machine worked. Maybe
next time!

**11. Go explore Bayes!**

Bayesian data analysis is increasingly being used all over data science
and machine learning, and even if we just scratched the surface, you
should now have the necessary knowledge to explore this exciting topic
further.

**12. Bye and thanks!**

I’m Rasmus Bååth, Data Scientist, and Bayesian enthusiast, and thank you
for staying with me to the end. Bye!

**13. Let’s practice!**
