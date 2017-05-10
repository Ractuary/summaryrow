#' summary_row
#' 
#' add a summary row to a data frame
#' 
#' @param df the data frame
#' @param cols numeric vector of columns to include in the summary row
#' @param fun function to summarize data frame rows
#' @param ... other arguments to be passed to the function specified in the
#' fun argument
#' @param rows numeric vector of rows to include in summary calculation.  By default
#' \code{rows} is set to all rows that were not created by the a \code{summary_row} 
#' function.
#' @param label_col column number to hold the summary row label specified by 
#' the \code{label} argument
#' @param label summary row label (e.g. "Totals")
#' @param new_row boolean value indicating whether the summary row should
#' be a new row attached to the bottom of the data frame or if it should be 
#' combined with an already existing summary row.
#' @param fill value to insert in columns not specified in the \code{cols} argument.  
#' Default is NA
#' 
#' @export
#' 
#' @examples 
#' df <- data.frame("year" = 2014:2016,
#'                  "a" = c(NA, 1, 3),
#'                  "b" = c("g", "e", "f")
#'       )
#' 
#' summary_row(fun = sum, na.rm = TRUE, df = df, cols = 2)
#' summary_row(fun = sum, na.rm = TRUE, df = df, cols = 2, label_col = 1, 
#'             label = "Totals")
#' summary_row(fun = sum, na.rm = TRUE, df = df, cols = 2, fill = "HI")
#' 
#' df$d <- 5:7
#' 
#' # add new row
#' df <- summary_row(fun = sum, na.rm = TRUE, df = df, cols = c(2, 4), 
#'                   label_col = 1, label = "Totals")
#' 
#' # adjust newest row
#' df <- summary_row(fun = mean, na.rm = TRUE, df = df, cols = c(2, 4), 
#'                   label_col = 1, label = "Averages")
#' 
#' # I didn't want the mean in column 4, I actually wanted the product
#' df <- summary_row(fun = prod, na.rm = TRUE, df = df, cols = 4, label_col = 1, 
#'                   label = "Averages/Products", new_row = FALSE)
#'                   
#' # new cummary row with the average of the last 2 years
#' summary_row(fun = mean, df = df, cols = c(2, 4), rows = 2:3, label_col = 1, 
#'             label = "2 Yr AVG")
summary_row <- function(df,
                        cols,
                        fun,
                        ...,
                        rows = NA,
                        label_col = NA,
                        label = "Summary",
                        new_row = TRUE,
                        fill = NA) {
  # if new_row is false, remove the last row from df before creating the
  # new summary row
  if (new_row == FALSE) {
    last_row <- df[nrow(df), ]
    df <- df[-nrow(df), ]
  }
  
  if (!inherits(df, "summary_table")) {
    df <- summary_table(df)
  }
  
  # find rows in original data before any summary rows
  # were added
  if (is.na(rows[1])) {
    rows <- attr(df, "original_rows")
  }
  
  # calculate summary values
  s_row <- rep(list(fill), length(df))
  s_row[cols] <- lapply(df[rows, cols, drop = FALSE], fun, ...)
  
  if (new_row == FALSE) {
    s_row[-cols] <- last_row[1, -cols]
  } 
  
  # convert factor columns to character for fill bind
  factors <- unlist(lapply(df, is.factor))
  df[, factors] <- lapply(df[, factors, drop = FALSE], as.character)
  
  names(s_row) <- names(df)
  df <- rbind(df, s_row)
  
  if (!is.na(label_col)) {
    df[nrow(df), label_col] <- label
  }
  
  df
}

#' totals_row
#' 
#' add a totals summary row to a data frame.  This is a wrapper around the \code{\link{summary_row}}
#' function.
#' 
#' @inheritParams summary_row
#' @param label summary row label. defaults to "Totals"
#' 
#' @export
#' 
#' @examples 
#' df <- data.frame("year" = 2014:2016,
#'                  "a" = c(NA, 1, 3),
#'                  "b" = c("g", "e", "f")
#'       )
#' 
#' totals_row(df = df, cols = 2)
#' totals_row(df = df, cols = 2, label_col = 1, label = "Totals")
#' 
#' df$d <- 5:7
#' 
#' # add new row
#' totals_row(df = df, cols = c(2, 4), label_col = 1, label = "Totals")
totals_row <- function(df,
                        cols,
                        rows = NA, 
                        label_col = NA,
                        label = "Totals",
                        new_row = TRUE,
                        fill = NA) {
  summary_row(df = df, cols = cols, fun = sum, na.rm = TRUE, rows = rows, 
              label_col = label_col, label = label, new_row = new_row, fill = fill)
}


#' averages_row
#' 
#' add a averages summary row to a data frame.  This is a wrapper around the \code{\link{summary_row}}
#' function.
#' 
#' @inheritParams summary_row
#' @param label summary row label. defaults to "Averages"
#' 
#' @export
#' 
#' @examples 
#' df <- data.frame("year" = 2014:2016,
#'                  "a" = c(NA, 1, 3),
#'                  "b" = c("g", "e", "f")
#'       )
#' 
#' averages_row(df = df, cols = 2)
#' averages_row(df = df, cols = 2, label_col = 1, label = "Totals")
#' 
#' df$d <- 5:7
#' 
#' # add new row
#' averages_row(df = df, cols = c(2, 4), label_col = 1, label = "Totals")
averages_row <- function(df,
                         cols,
                         rows = NA,
                         label_col = NA,
                         label = "Averages",
                         new_row = TRUE,
                         fill = NA) {
  summary_row(df = df, cols = cols, fun = mean, na.rm = TRUE, rows = rows,
              label_col = label_col, label = label, new_row = new_row, fill = fill)
}

#' blank_row
#' 
#' add a row of NA to a data frame.  This is a wrapper around the \code{\link{summary_row}}
#' function.
#' 
#' @inheritParams summary_row
#' 
#' @export
#' 
#' @examples 
#' df <- data.frame("year" = 2014:2016,
#'                  "a" = c(NA, 1, 3),
#'                  "b" = c("g", "e", "f")
#'       )
#' 
#' averages_row(df = df, cols = 2)
#' averages_row(df = df, cols = 2, label_col = 1, label = "Totals")
#' 
#' df$d <- 5:7
#' 
#' # add new row
#' averages_row(df = df, cols = c(2, 4), label_col = 1, label = "Totals")
blank_row <- function(df) {
  summary_row(df = df, cols = 1:length(df), fun = function(x) NA)
}