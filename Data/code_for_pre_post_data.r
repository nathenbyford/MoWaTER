library(tidyverse)


data <- read.csv("allfilter_data.csv")
data <- data[ ,-1]

for (i in 1:16) {
  assign(paste("f", i, "_pre", sep = ""), data %>%
           filter(filter == i) %>% filter(year(date.time) == 2019) %>% 
           filter(month(date.time) < 11) %>% drop_na())
  assign(paste("f", i, "_post", sep = ""), data %>% 
           filter(filter == i) %>% filter(year(date.time) == 2020) %>%
           filter(month(date.time) > 3) %>% drop_na())
}