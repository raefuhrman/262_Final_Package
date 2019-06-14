#' @author Rae Fuhrman
#' @title Total yearly precipitation
#' @example Total_yearly_precipitation(climate_data)
#' @return Total precipitation in 2018 at the station USC00047902

Total_yearly_precipitation = function(climate_data) {
  ##parse date to use group by and summarize functions later
  climate_data$DATE <- lubridate::parse_date_time(x = climate_data$DATE,
                                       orders = c("d m y", "d B Y", "mdy"))
  climate_data$DATE <- as.Date(climate_data$DATE, format = "%m/%d/%y")

  ##pick one station
  station_1 <- climate_data %>%
    dplyr::filter(STATION == "USC00047902") %>%
    dplyr::select(STATION, PRCP, TMAX, TMIN, TOBS, DATE)

  ##sum the precipitation at station 1
  yearly_precip <- as.data.frame(sum(station_1$PRCP))
  colnames(yearly_precip) <- "Total Rain (2018) at Station 1"

  ## output from function
  return(yearly_precip)
}
