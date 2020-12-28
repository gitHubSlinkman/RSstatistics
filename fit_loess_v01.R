# fit_lowess.R

library( tidyverse )                    # I live in the R tidyverse environment.

fit_loess <- 
  function( formula,                    # R formula specification
            data,                       # Data source must be data.frame or tibble.
           alpha = 2/3 )                # Specifies length of smoothing window. 
    
  {
     fit <- loess( formula, data,
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
     tibble( smooth, residual )
  }
  