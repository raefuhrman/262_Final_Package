library(here)
library(tidyverse)
library(reshape2)
library(lubridate) # Can this be in function R file

climate_sb_2018 <- read.csv(("Climate_Data_SB_2018.csv"))
climate_sb_2018$DATE <- parse_date_time(x = climate_sb_2018$DATE,
                orders = c("d m y", "d B Y", "mdy"))
climate_sb_2018$DATE <- as.Date(climate_sb_2018$DATE, format = "%m/%d/%y")


climate_sb_2018_modified <- climate_sb_2018 %>% 
  mutate(month = format(climate_sb_2018_modified$DATE, "%m"), year = format(climate_sb_2018_modified$DATE, "%Y"))

avg_precip <- climate_sb_2018_modified %>% 
  filter(STATION == "US1CASB0009") %>% 
  select(month,year, PRCP) %>% 
  group_by(month, year) %>% 
  summarize(average = mean(PRCP))

plant_growth = function(PRCP) {
  pg = (PRCP) ** 3 + 5
  
  if (PRCP <= 0) {
    pg = 0
  }
  
  if(PRCP > 1) {
    pg = (PRCP) ** 2 + 1
  }
  
  return (pg)
  
}


leafgrowth = function(t) {
  lf = (t)**2 + 20
  
  if (t > 30) {
    lf = lf / 10
  }
  
  if (t < 0) {
    lf = 0
  }
  
  return(lf)
}


#HOW do you convert dataframe into multidimensional? Example was just populating a blank thing


