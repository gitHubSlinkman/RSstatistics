# fit_lowess.R

library( tidyverse )                    # I live in the tidyverse eco system ...

fit_lowess <- 
  function( x,                          # Predictor variable
            y,                          # Response variable
            fraction = 2/3 )            # Species filter window percentage
    
  {
     fit <- lowess( x, y, f = fraction )
     
     x    <- fit[[1]]
     yhat <- fit[[2]]
     ehat <- y - yhat 
     
     tibble( x, y, yhat, ehat )
  }
  