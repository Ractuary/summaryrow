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
  df[, cols] <- apply(df[, cols, drop = FALSE], 2, FUN = format_numeric_vec, digits = digits)
  df
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
  df[, cols] <- apply(df[, cols, drop = FALSE], 2, FUN = format_percent_vec, digits = digits)
  df
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
  df[, cols] <- apply(df[, cols, drop = FALSE], 2, FUN = format_currency_vec, digits = digits)
  df
}