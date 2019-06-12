#' Plant Revenue
#' 
#' This function calculates plant revenue for a very valuable, imaginary plant based on its growth in mm, where each mm growth generates $3.75 in revenue.
#' 
#' @param growth.  A dataframe, multidimensional array, or other input that contains plant growth in mm.  The default is plant_growth_mda, a multidimensional array with plant growth by months and years for three different locations.
#' @author Cristina
#' @example plant_revenue(growth = plant_growth_mda)
#' @return The revenue in $ from an imaginary plant for each timeframe.  The default data in multidimensional array also returns a multidimensional array.

plant_revenue = function(growth = plant_growth_mda) {

  revenue = growth * 3.75
  return(revenue)
  
}
