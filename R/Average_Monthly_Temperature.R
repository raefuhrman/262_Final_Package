#' This function gives the average monthly temperatures at a specific station in Santa Barbara in 2018 based on a climate dataset from NOAA.
#'
#' @author Rae Fuhrman
#' @title Average temperature
#' @return The average temperature for each month in 2018 at the station USC00047902
#' @example Average_Monthly_Temperature(climate_data)

###function
Average_Monthly_Temperature = function(climate_data){

  ##parse date to use group by and summarize functions later
  climate_data$DATE <- lubridate::parse_date_time(x = climate_data$DATE,
                                       orders = c("d m y", "d B Y", "mdy"))
  climate_data$DATE <- as.Date(climate_data$DATE, format = "%m/%d/%y")

  ##pick one station
  station_1 <- climate_data %>%
    dplyr::filter(STATION == "USC00047902") %>%
    dplyr::select(STATION, PRCP, TMAX, TMIN, TOBS, DATE)

  ##average observed temperature by month
  average_temp <- station_1 %>%
    dplyr::mutate(Month = format(station_1$DATE, "%m")) %>%
    dplyr::group_by(Month) %>%
    dplyr::summarize(Average_Monthly_Temp = mean(TOBS))

  ## output from function
  return(average_temp)
}


