#' format_
#' 
#' generalized function for formatting a data frame column
#' 
#' @param df data frame containing the column to be formatted
#' @param cols numeric vector of column indices
#' @param fun formatting function
#' @param ... additional arguments to pass to \code{fun}
#' 
#' @export
format_ <- function(df, cols, fun, ...) {
  df[, cols] <- apply(df[, cols, drop = FALSE], 
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
#' 
#' 
format_numeric <- function(df, cols, digits = 0) {
  format_(df = df, 
          cols = cols, 
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
          fun = format_currency_vec, 
          digits = digits)
}