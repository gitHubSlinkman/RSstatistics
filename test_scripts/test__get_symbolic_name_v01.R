# test__get_symbolic_name_v01.R

library( tidyverse )          # I live in the tidyverse ...
library( stringr )            # For tidyverse consistent string operations ...   


###############################################################################
# Load function to test.
###############################################################################

source('D:/R-Projects/RStatistics/get_symbolic_name_v01.R')


###############################################################################
# Load test data
###############################################################################

data( mtcars )                          # Get data
mtcars                                  # Verify data frame


df_name <- get_symbolic_name( mtcars )
df_name


attach( mtcars )

mpg_name <- get_symbolic_name( mpg )
mpg_name

detach( mtcars )

 


