
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dtplyr

<!-- badges: start -->

<!-- badges: end -->

The [tidyverse](https://www.tidyverse.org) has made it far easier to
perform data work in R. But there are still times where performance is
important, and for tabular data that’s when
[data.table](https://github.com/Rdatatable/data.table) can really shine.

For some reason, however, there seems to be an either / or mentality
when it comes to picking between `data.table` and `dplyr`. I don’t buy
it. I’d rather have the best of both worlds.

That’s why I made these handy adapters. Stick with your tidy data flow,
but go ahead and cherry-pick some performance wins when you need them.

## Installation

**NOTE:** This is a lie right now. Dare to dream.

You can install the released version of dtplyr from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("dtplyr")
```

### Development version

``` r
# install.packages("devtools")
devtools::install_github("mcskinner/dtplyr")
```

## Usage

Aggregation with `dt_agg()` uses the lean syntax you’re used to from
`data.table`:

``` r
library(dtplyr)
dt_agg(iris, mean(Sepal.Length), Species)
#>       Species    V1
#> 1:     setosa 5.006
#> 2: versicolor 5.936
#> 3:  virginica 6.588
```

You’ll notice that aggregation skipped the filter. That’s exposed by
`dt_op()` if you need it back:

``` r
dt_op(iris, Sepal.Width >= 3, mean(Sepal.Length), Species)
#>       Species       V1
#> 1:     setosa 5.029167
#> 2: versicolor 6.218750
#> 3:  virginica 6.768966
```

And why not leverage the high-performance merge routine as
well?

``` r
colors <- data.frame(Species = c('setosa', 'versicolor', 'virginica'), Color = c('baby blue', 'lavender', 'purple'))
head(dt_merge(iris, colors))
#>    Species Sepal.Length Sepal.Width Petal.Length Petal.Width     Color
#> 1:  setosa          5.1         3.5          1.4         0.2 baby blue
#> 2:  setosa          4.9         3.0          1.4         0.2 baby blue
#> 3:  setosa          4.7         3.2          1.3         0.2 baby blue
#> 4:  setosa          4.6         3.1          1.5         0.2 baby blue
#> 5:  setosa          5.0         3.6          1.4         0.2 baby blue
#> 6:  setosa          5.4         3.9          1.7         0.4 baby blue
```
