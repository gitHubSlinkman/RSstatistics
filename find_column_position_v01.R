# find_column_position.R

#' find_column_position
#' 
#' This function find the column position of a variable in a data.frame or
#' tibble.
#'
#' @param data      - a data frame ot tibble.
#' @param variable  - a qouted sring that is the name of a variable.
#'
#' @return
#' @export
#'
#' @examples
find_column_position <- 
  function( data, variable )
  {
    #######################################################################
    # Get the variable names of the data object.
    #######################################################################
    
    vnames <- names( data )
    
    #######################################################################
    # Find position column position.  If it does not match throw an error
    #######################################################################
    
    position <-match( variable, 
                      vnames,
                      nomatch = 0 )
    
    if( position == 0)
      stop(  paste( "Column position for variable",
                    variable, 
                    "not found." ))
    
    position
  }