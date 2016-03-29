#' format_numeric_vec
#' 
#' format numeric vectors for reports
#' 
#' @param x numeric vector
#' @param digits number of digits after the decimal point
#' 
#' @export
#' 
#' @examples
#' x <- seq(1000, 3000, by = 1000)
#' 
#' format_numeric_vec(x)
#' format_numeric_vec(x, digits = 2)
format_numeric_vec <- function(x, digits = 0) {
  stopifnot(is.numeric(x))
  
  formatC(
    x = x,
    digits = digits,
    format = "f",
    big.mark = ","
  )
}

#' format_percent_vec
#' 
#' format numeric vectors for reports
#' 
#' @param x numeric vector
#' @param digits number of digits afer the decimal point
#' @param multiple value to multiply \code{x} by to get proper percentage.  Default is 100.
#' 
#' @export
#' 
#' @examples
#' x <- seq(1000, 3000, by = 1000)
#' 
#' format_percent_vec(x)
#' format_percent_vec(x, digits = 2)
format_percent_vec <- function(x, digits = 2, multiple = 100) {
  x <- x * multiple
  x <- format_numeric_vec(x, digits = digits)
  
  paste0(x, "%")
}

#' format_currency_vec
#' 
#' format numeric vectors with a currency symbol for reports
#' 
#' @param x numeric vector
#' @param digits number of digits afer the decimal point
#' 
#' @export
#' 
#' @examples
#' x <- seq(1000, 3000, by = 1000)
#' 
#' format_currency_vec(x)
#' format_currency_vec(x, digits = 2)
format_currency_vec <- function(x, digits = 2) {
  x <- format_numeric_vec(x, digits = digits)
  
  paste0("$", x)
}