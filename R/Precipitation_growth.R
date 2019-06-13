#' Plant growth based on precipitation
#'
#' This function calculates plant growth for an imaginary plant that grows only when sunshine hours for a certain timeframe is bigger than one.
#'
#' @param Sun.  A dataframe, multidimensional array, or other input that contains sunshine hours.  The default is sunshine_hours, a multidimensional array with sunshine hours by months and years for three different locations.
#' @author Rae Fuhrman
#' @example plant_growth(sun = sunshine_hours)
#' @return The plant growth of an imaginary plant based on hours of sunshine.  Assume this growth is in mm.

precipitation_plant_growth = function(climate_data) {

  ##parse date to use group by and summarize functions later
  climate_data$DATE <- parse_date_time(x = climate_data$DATE,
                                       orders = c("d m y", "d B Y", "mdy"))
  climate_data$DATE <- as.Date(climate_data$DATE, format = "%m/%d/%y")

  ##pick one station
  station_1 <- climate_data %>%
    dplyr::filter(STATION == "USC00047902") %>%
    dplyr::select(STATION, PRCP, TMAX, TMIN, TOBS, DATE)

  life = ifelse (climate_data$PRCP > 0.05, climate_data$PRCP^2 * 2, 0)

  ## output from function
  return(life)
}

