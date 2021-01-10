
# Exploring lists to keep loees analysis

library(tidyverse)

source('D:/R-Projects/RStatistics/find_column_position_v01.R')

id <- "test"
span <- 0.10
str_predictor = "eruption_length"
str_response  = "waiting_interval"


data(faithful)

names(faithful) <- c( "eruption_length",
                      "waiting_interval" )
faithful <- as_tibble( faithful )
data <- faithful  
data

position <-  
  find_column_position( data =faithful,
                        str_variable = "eruption_length" )
predictor <- 
  data %>%
    pull( position )

position <-  
  find_column_position( data =faithful,
                        str_variable = "waiting_interval" )

response <- 
  data %>% 
    pull( position )

augmented <- tibble( predictor, response )

fit <- 
  loess( formula = response ~ predictor,
         augmented,
         span = 2/3 )

fitted <- fitted( fit )
residual <- residuals( fit )

augmented <- 
  tibble( predictor, 
          response,
          fitted,
          residual )

names( augmented)[1]   <- str_predictor
names( augmented )[2]  <- str_response


augmented

model_list <- 
  list( id, span, fit, augmented )

model_list[[1]]
model_list[[2]]
model_list[[3]]
model_list[[4]]

names( model_list ) <- 
  c( "id", "span", "fit", "augmented" )

model_list$id
model_list$span
this_fit <- model_list$fit
model_list$augmented

