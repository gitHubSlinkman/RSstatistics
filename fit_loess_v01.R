# fit_loess.r

require( tidyverse)                     # I live in the tidyverse environment.



################################################################################
# Load required functions.
################################################################################

source('D:/R-Projects/RStatistics/find_column_position_v01.R')

fit_loess <- 
  function( id = "Model",
            data = NULL,
            str_response,
            str_predictor,
            span = 2/3 )
  {  
    ############################################################################
    # We check to ensure that a data.frame or tibble is given.
    ############################################################################
    
    if( is.null( data))
      stop( "Script is stoped because data sourcee is null." )
    
    
    ############################################################################
    # Determine the data source size.
    ############################################################################
    
    n <- dim( data )[1]     

    #####################economics##############################################
    # We extract variables from the input parameters so we can build a results
    # tibble later.
    ############################################################################
    
    position <- find_column_position( data, str_predictor )
    
    predictor <- 
      data %>% 
        pull( position )
    
    names( predictor ) <- names( data )[position]
    
    position <- find_column_position( data, str_predictor ) 
    
    response <- 
      data %>% 
        pull( position )
    
    names( response ) <- names( data )[position]
   