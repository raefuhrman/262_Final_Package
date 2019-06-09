#' Plant Growth
#' This function calculates plant growth for an imaginary plant that grows only when sunshine hours for a certain timeframe is bigger than one.
#' @param Sun.  A dataframe, multidimensional array, or other input that contains sunshine hours.  The default is sunshine_hours, a multidimensional array with sunshine hours by months and years for three different locations.
#' @author Cristina
#' @example plant_growth(sun = sunshine_hours)
#' @return The plant growth of an imaginary plant based on hours of sunshine.  Assume this growth is in mm.

plant_growth = function(sun = sunshine_hours) {

  growth = ifelse (sunshine_hours > 1, sunshine_hours^2 + 3, 0)
  return(growth)

}
