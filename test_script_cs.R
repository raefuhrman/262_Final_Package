library(here)
library(tidyverse)
library(reshape2)
library(lubridate) # Can this be in function R file

climate_data <- read.csv(("Climate_Data_SB_2018.csv"))
climate_data$DATE <- parse_date_time(x = climate_data$DATE,
                orders = c("d m y", "d B Y", "mdy"))
climate_data$DATE <- as.Date(climate_sb_2018$DATE, format = "%m/%d/%y")


climate_sb_2018_modified <- climate_sb_2018 %>%
  mutate(month = format(climate_sb_2018_modified$DATE, "%m"), year = format(climate_sb_2018_modified$DATE, "%Y")) %>%
  filter(STATION == "US1CASB0009")

avg_precip <- climate_sb_2018_modified %>%
  filter(STATION == "US1CASB0009") %>%
  select(month,year, PRCP) %>%
  group_by(month, year) %>%
  summarize(average = mean(PRCP))

avg_month_precip = function(climate = climate_sb_2018_modified) {
  month_precip <- climate %>%
    select(month, year, PRCP) %>%
    group_by(month, year) %>%
    summarize(average = mean(PRCP))

  return(month_precip)

}

avg_month_precip()

sunshine_hours = array(dim=c(6,12,3)) # Years, Months, Locations

for (i in 1:6) {
  for (j in 1:12) {
    value = runif(min=0,max=10,n=3)
    sunshine_hours[i,j,]=value
  }
}

dimnames(sunshine_hours) = list(c("2001","2002","2003","2004","2005", "2006"),
                       c("Jan","Feb","Mar","Apr", "May", "Jun", "Jul", "Aug",
                         "Sep", "Oct", "Nov", "Dec"),
                       c("Loc1","Loc2", "Loc3"))

plant_growth = function(sun = sunshine_hours) {

    growth = ifelse (sunshine_hours > 1, sunshine_hours^2 + 3, 0)
    return(growth)

}
