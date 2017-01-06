# summaryrow

[![Travis-CI Build Status](https://travis-ci.org/merlinoa/summaryrow.svg?branch=master)](https://travis-ci.org/merlinoa/summaryrow)

Flexible tool for adding summary rows to a data frame

# Purpose and Motivation
Reports often include tables of data.  e.g.

| Year | Col 2 | Col 3 |
|------|-------|-------|
| 2015 | 1     | 3     |
| 2016 | 2     | 4     |

When tables are presented in reports, it is often useful to summarize columns of a table by attaching 1 or more rows to the bottom of the table.  e.g. Here we attach column totals to the bottom of the previous table:

| Year | Col 2 | Col 3 |
|------|-------|-------|
| 2015 | 1     | 3     |
| 2016 | 2     | 4     |
| **Totals:**  | **3**  | **7**    |

The values 3 and 7 are the sum of the above columns.  More generally, for any summary row, the value in each column is a function of some data in the original table. 

When writing base R code, a non trivial amount of additional code is needed to create these summary rows.  `summaryrow`'s job is to reduce the code and time it takes to create these summary rows so you can get back to more interesting problems.

`summaryrow` also makes your code easier to follow by using the `magrittr::'%>%'` function to build up one or more of these summary rows.  

# Installation
```R
# install package
devtools::install_github("merlinoa/summaryrow", build_vignettes = TRUE)
```

# Examples
```R
library(summaryrow)
browseVignettes(package = "summaryrow")
```
