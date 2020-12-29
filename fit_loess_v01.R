# fit_lowess.R

library( tidyverse )                    # I live in the R tidyverse environment.

fit_loess <- 
  function( data,                       # Data.frame or tibble
            response,                   # Quoted response variable name
            predictor,                  # Quoted predictor variable name
            alpha = 2/3 )               # Specifies length of smoothing window. 
    
  {
    formula <- 
      as.formula(  paste( response,
                   "~",
                   predictor ) )
    
    
     fit <- loess( formula, 
                   data,
                   span = alpha,
                   parametric = FALSE, 
                   drop.square = FALSE, 
                   normalize = TRUE,
                   family = "symmetric",
                   method = "loess" )
     
     fit <- loess( waiting_time ~ eruption_length,
                   old_faithful)
     
     smooth <- predict( fit )
     residual <- residuals( fit )
  }
  