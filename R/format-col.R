#' format_
#' 
#' generalized function for formatting a data frame column
#' 
#' @param df data frame containing the column to be formatted
#' @param cols numeric vector of column indices
#' @param include_summary whether or not to format the summary rows
#' @param fun formatting function
#' @param ... additional arguments to pass to \code{fun}
#' 
#' @export
format_ <- function(df, cols, include_summary, fun, ...) {
  
  if (!inherits(df, "summary_table")) {
    df <- summary_table(df)
  }
  
  # whether or not to format the summary rows
  if (include_summary) {
    rows <- 1:nrow(df)
  } else {
    rows <- attr(df, "original_rows")
  }
  
  df[rows, cols] <- apply(df[rows, cols, drop = FALSE], 
                      2, 
                      FUN = fun, ...)
  df
}

#' format_numeric
#' 
#' @param df a data frame
#' @param cols columns to format
#' @param digits number of digits after the decimal point
#' 
#' @export
#' 
#' @examples 
#' 
#' format_numeric(insurance_data, cols = 2, digits = 0)
#' 
format_numeric <- function(df, cols, digits = 0) {
  format_(df = df, 
          cols = cols,
          include_summary = TRUE,
          fun = format_numeric_vec, 
          digits = digits)
}

#' format_percent
#' 
#' @param df a data frame
#' @param cols columns to format
#' @param digits number of digits after the decimal point
#' 
#' @export
#' 
#' @examples 
#' 
format_percent <- function(df, cols, digits = 0) {
  format_(df = df, 
          cols = cols, 
          include_summary = TRUE,
          fun = format_percent_vec, 
          digits = digits)
}

#' format_currency
#' 
#' @param df a data frame
#' @param cols columns to format
#' @param digits number of digits after the decimal point
#' 
#' @export
#' 
#' @examples 
#' 
format_currency <- function(df, cols, digits = 0) {
  format_(df = df, 
          cols = cols, 
          include_summary = TRUE,
          fun = format_currency_vec, 
          digits = digits)
}

#' format_origin
#' 
#' @param df a data frame
#' @param cols columns to format
#' @param eval Most recent evaluation time. This will be used as the second
#' date in the last element in the vector \code{x}
#' @param sep character string to place between dates
#' 
#' @export
#' 
#' @examples 
#' format_origin(insurance_data, cols = 1, eval = "2017")
format_origin <- function(df, cols, eval, sep = " to ") {
  format_(df = df, 
          cols = cols, 
          include_summary = FALSE,
          fun = format_origin_vec, 
          eval = eval,
          sep = sep)
}
