# get_symbolic_name_v01.R


#get_symbolic_name
#`
#' This function return the symbolic name of the argument.
#' @param variable 
#'
#' @return - The name of the variable as a string.
#' @export
#'
#' @examples
#' 

require( tidyverse )                   # I live in the tidyverse ...
require( stringr )                     # Tidyverse consistent string operations ...


get_symbolic_name <- function (variable ) 
  {
  
    string <- deparse(substitute( variable ))
  
}



