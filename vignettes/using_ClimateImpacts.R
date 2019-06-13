## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(ClimateImpacts)

## ----example_plantgrowth-------------------------------------------------

#Get sunshine_hours data.  This represents (imaginary) average daily hours of sunshine for a given month between 2001 and 2006, for three different locations.  It is a multidimension array (12 months as columns, 6 years as rows, and 3 locations in the 3rd dimension)
data(sunshine_hours)

#If you want to use the standard data in multidimensional array format, you can simply run the function.  This gives the (imaginary) growth in mm of a plant in that month.

plant_growth_result <- plant_growth()
plant_growth_result

#This should give the same results as plant_growth_mda, which was created by applying the plant_growth function to the sunshine_hours multidimensional array.
data(plant_growth_mda)
plant_growth_mda

#You could also run the function with other data in other formats, such as a single vector.  For instance:

madeup_vector <- c(3,4,8,23) # This vector represents 3 hours of sun on Monday, 4 hours of sun on Tuesday, 8 on Wednesday, and 23 on Thursday.
madeup_example <- plant_growth(madeup_vector)
madeup_example


## ----example_plantrevenue------------------------------------------------

# Get growth data.  This was created by applying the plant_growth function to the sunshine_hours multidimensional array, and is also a multidimensional array.
data(plant_growth_mda)

# To apply the revenue function to the default plant_growth_mda, simply run the function:

plant_growth_revenue <- plant_revenue()
plant_growth_revenue

#Assuming each mm of growth is worth $3.75 (imaginary plants are worth a lot of money), this function will provide the total revenue per timestep per location of the input data - in this example, it shows the revenue for each month between 2001 and 2006 of the three locations.

#Other data can also be used as an input.

madeup_growth_vector <- c(2,18,15,4,9) # This plant grew 2mm on Monday, 18 on Tuesday, and so on.
madeup_growth_example <- plant_revenue(madeup_growth_vector)
madeup_growth_example


