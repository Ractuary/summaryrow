# summaryrow

[![Travis-CI Build Status](https://travis-ci.org/merlinoa/summaryrow.svg?branch=master)](https://travis-ci.org/merlinoa/summaryrow)

Flexible tool for adding summary rows to a data frame

# Purpose and Motivation
Reports often include tables of data.  e.g.

| Year | Col 2 | Col 3 |
|------|-------|-------|
| 2015 | 1     | 3     |
| 2016 | 2     | 4     |

It is often useful to summarize columns of a table by attaching 1 or more rows to the bottom of the table.  Each column in the new summary row is a function of the other data in the column. In the following table the summary row contains the column totals:

| Year | Col 2 | Col 3 |
|------|-------|-------|
| 2015 | 1     | 3     |
| 2016 | 2     | 4     |
| **Totals:**  | **3**  | **7**    |

Creating these summary rows can lead to a lot of additional lines of code that can clutter and ultimately ditract from the analysis.  The `summaryrow` solution uses the `magrittr::'%>%'` function along with the `summaryrow::summary_row` function to create an iterative structure for constructing these summary rows.  `summaryrow`'s job is to reduce the code and time it takes to create these summary rows so you can get back to more interesting problems.

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
