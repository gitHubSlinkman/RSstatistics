# Using R-function loess.R

library( tidyverse )

data( faithful  )                       # Prepare data

waiting_time    <- faithful$waiting
eruption_length <- faithful$eruptions

old_faithful <- 
  tibble( eruption_length,
          waiting_time )
