#' format_numeric
#' 
#' @param df a data frame
#' @param cols columns to format
#' @param digits
#' 
#' @export
#' 
#' @examples 
#' 
#' 
#' 
format_numeric <- function(df, cols, digits = 0) {
  df[, cols] <- lapply(df[, cols], FUN = format_numeric_vec, digits = digits)
  df
}

#' format_percent
#' 
#' @param df a data frame
#' @param cols columns to format
#' @param digits
#' 
#' @export
#' 
#' @examples 
#' 
format_percent <- function(df, cols, digits = 0) {
  df[, cols] <- lapply(df[, cols], FUN = format_percent_vec, digits = digits)
  df
}