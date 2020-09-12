#########################
## Denver Water
## Plots
#########################


#Load packages
library(tidyverse)
library(lubridate)
library(corrplot)
library(ggplot2) 
theme_set(theme_minimal())


#Import data

data <- read_csv("allfilter_data.csv")
data <- data[ ,-1]


#Split data into clean pre and post filter data

for (i in 1:16) {
  
  assign(paste("f", i, "_pre", sep = ""), data %>%
           filter(filter == i) %>% filter(year(date.time) == 2019) %>% 
           filter(month(date.time) < 11) %>% drop_na())
  
  assign(paste("f", i, "_post", sep = ""), data %>% 
           filter(filter == i) %>% filter(year(date.time) == 2020) %>%
           filter(month(date.time) > 3) %>% drop_na())
}


  ### EDA Plots ###


#NTU plot for filter 1-16

data %>% ggplot(aes(date.time, NTU)) +
  geom_point() + 
  facet_grid(filter ~ .)


#NTU plot for filters 1-3

data %>% filter(between(filter, 1, 3)) %>%
  ggplot(aes(date.time, NTU)) +
  geom_point() + 
  facet_grid(filter ~ .)


#Runtime Plot for 16

data %>% ggplot(aes(date.time, runtime)) +
  geom_point() +
  facet_grid(filter ~ .)


#Total flow plot for all 16

data %>% ggplot(aes(date.time, totaleff_flow)) +
  geom_point() +
  facet_grid(filter ~ .)


#Headloss plot for all 16

data %>% ggplot(aes(date.time, headloss)) +
  geom_grid(filter ~ .)


  ### correlation plots ###

#Make lists to use in for loops

pre_filter <- list(f1_pre, f2_pre, f3_pre, f4_pre, f5_pre, f6_pre, f7_pre, f8_pre, f9_pre,
                   f10_pre, f11_pre, f12_pre, f13_pre, f14_pre, f15_pre, f16_pre)

post_filter <- list(f1_post, f2_post, f3_post, f4_post, f5_post, f6_post, f7_post, f8_post, 
                    f9_post, f10_post, f11_post, f12_post, f13_post, f14_post, f15_post, f16_post)


#filter combination

for (i in 1:16) {
  
  assign(paste("filter", i, sep = ""), 
         
         rbind(pre_filter[i], post_filter[i]) %>% 
           
           select(NTU, totaleff_flow, runtime, headloss))
}


#list of filters

filter_list <- list(filter1, filter2, filter3, filter4, filter5, filter6, filter7, filter8, filter9,
                    filter10, filter11, filter12, filter13, filter14, filter15, filter16)


#corr for every filter

for (i in 1:16) {
  
  assign(paste("cor_", i, sep = ""), cor(filter_list[i]))
}

cor_list <- list(cor_1, cor_2, cor_3, cor_4, cor_5, cor_6, cor_7, cor_8, cor_9, cor_10,
                 cor_11, cor_12, cor_13, cor_13, cor_14, cor_15, cor_16)


#4x4 correlation plot for each filter

col <- colorRampPalette(c("steelblue", "white", "seagreen2"))(10) #set color for pie charts

par(mfrow = c( 4, 4))

for (i in 1:16) {
  
  corrplot(cor_list[i], method = "pie", col = col, type = "lower")
  
}

#reset par

par(mfrow = c( 1, 1))
