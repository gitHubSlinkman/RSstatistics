# fit_loess_v01.R

library( tidyverse )                    # I live in the R tidyverse environment.

source('D:/R-Projects/RStatistics/find_column_position_v01.R')

fit_loess <- 
  function( data,                     # Data.frame or tibble
            response_vname,           # Quoted response variable name
            predictor_vname,          # Quoted predictor variable name
            alpha = 2/3 )               # Specifies length of smoothing window. 
    
  {  
    ############################################################################
    # Pull the data values from the input source.  We will create an augmented
    # data set with these values.
    ############################################################################
    
    position <- find_column_position( data, predictor_vname )
    
     predictor <- 
        data %>% 
          pull( position )
     
     position <- find_column_position( data, response_vname )
     
     response <- 
       data %>% 
        pull( position )
     
     augmented_fit <- tibble( predictor, response )
    
     formula <- response ~ predictor
    
     fit <- loess( formula, 
                   augmented_fit,
                   span = alpha,
                   parametric = FALSE, 
                   drop.square = FALSE, 
                   normalize = TRUE,
                   family = "symmetric",
                   method = "loess" )
     
     smoothed <- fitted( fit )
     residual <- residuals( fit )
     
     augmented_fit <- 
       augmented_fit %>% 
          add_column( smoothed ) %>%  
          add_column( residual )
     
     names( augmented_fit )[1] <- predictor_vname
     names( augmented_fit )[2] <- response_vname
        
     augmented_fit    
  }
  