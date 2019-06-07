#' @author Rae Fuhrman
#' @title average temperature
#' @param
#' @return

###function
Average_Monthly_Temperature = function(climate_data){

  ##parse date to use group by and summarize functions later
  climate_data$DATE <- parse_date_time(x = climate_data$DATE,
                                       orders = c("d m y", "d B Y", "mdy"))
  climate_data$DATE <- as.Date(climate_data$DATE, format = "%m/%d/%y")

  ##pick one station
  station_1 <- climate_data %>%
    filter(STATION == "USC00047902") %>%
    select(STATION, PRCP, TMAX, TMIN, TOBS, DATE)

  ##average observed temperature by month
  average_temp <- station_1 %>%
    mutate(Month = format(station_1$DATE, "%m")) %>%
    group_by(Month) %>%
    summarize(Average_Monthly_Temp = mean(TOBS))

  ## output from function
  return(average_temp)
}


