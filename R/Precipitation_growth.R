#' Plant growth based on precipitation
#'
#' This function calculates plant growth for an imaginary plant that grows only when precipitation values are above a threshold (0.5 cm)
#' @param PRCP  A variable in dataframe called climate_data. The default is climate_data, a dataframe with sunshine hours by months and years for one station in Santa Barbara.
#' @author Rae Fuhrman
#' @example precipitation_plant_growth(climate_data)
#' @return A list of the plant growth of an imaginary plant based on cm of precipitation for each value of precipitation associated with a date. Assume this growth is in mm.

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

