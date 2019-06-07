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

#HOW do you convert dataframe into multidimensional? Example was just populating a blank thing


