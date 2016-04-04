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

#' format_origin_vec
#' 
#' format origin period vector
#' 
#' @param x a vector of dates.  Each date indicates the first day
#' of the origin period
#' @param eval Most recent evaluation time. This will be used as the second
#' date in the last element in the vector \code{x}
#' @param sep character string to place between dates
#' 
#' @export
#' 
#' @examples
#' x <- c("2014-01-01", "2015-01-01", "2016-01-01")
#' 
#' format_origin_vec(x, eval = "2015-03-31")
#' format_origin_vec(x, eval = "2015-03-31", sep = " - ")
format_origin_vec <- function(x, eval, sep = " to ") {
  
  len <- length(x)
  
  for (i in 1:(len - 1)) {
    x[i] <- paste(x[i], x[i + 1], sep = sep)
  }
  
  x[len] <- paste(x[len], eval, sep = sep)
  
  x
}
