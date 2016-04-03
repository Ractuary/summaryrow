#' summary_table
#' 
#' \code{summary_table} class constructor
#' 
#' @param df a data frame
#' 
#' @export
summary_table <- function(df) {
  stopifnot(inherits(df, "data.frame"))
  
  attr(df, "original_rows") <- 1:nrow(df)
  
  class(df) <- c("summary_table", class(df))
  
  df
}