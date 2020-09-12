#########################
## Denver Water
## Methods
#########################

#Load packages
library(tidyverse)
library(lubridate)
library(tidymodels)


#Import data

data <- read_csv("allfilter_data.csv")
data <- data[ ,-1]

#sebset by filter and before and after replacment of filter medium
for (i in 1:16) {
  assign(paste("f", i, "_pre", sep = ""), data %>%
           filter(filter == i) %>% filter(year(date.time) == 2019) %>% 
           filter(month(date.time) < 11) %>% drop_na())
  assign(paste("f", i, "_post", sep = ""), data %>% 
           filter(filter == i) %>% filter(year(date.time) == 2020) %>%
           filter(month(date.time) > 3) %>% drop_na())
}


  ### Anova Test ###

# ANOVA between filters 1-3

group_1 <- c(f1_pre$NTU, f2_pre$NTU, f3_pre$NTU)
group_2 <- c(f1_post$NTU, f2_post$NTU, f3_post$NTU)
combine_groups <- data.frame(cbind(group_1, group_2))
stack_groups <- stack(combine_groups)

anova_res <- aov(values~ind, data = stack_groups)
summary(anova_res)
TukeyHSD(anova_res)


# ANOVA within filter 1 

fgroup1 <- f1_pre$NTU
fgroup2 <- f1_post$NTU
combine_fgroups <- data.frame(cbind(fgroup1, fgroup2))
stack_fgroups <- stack(combine_fgroups)
anova_f1 <- aov(values~ind, data =  stack_fgroups)
summary(anova_f1)
TukeyHSD(anova_f1)


# ANOVA filter 2 

f2_group1 <- f2_pre$NTU
f2_group2 <- f2_post$NTU
combine_f2groups <- data.frame(cbind(f2_group1, f2_group2))
anova_f2 <- aov(values~ind, data = stack(combine_f2groups))
summary(anova_f2)
TukeyHSD(anova_f2)


# ANOVA filter 3

f3_group1 <- f3_pre$NTU
f3_group2 <- f3_post$NTU
combine_f3groups <- data.frame(cbind(f3_group1, f3_group2))
anova_f3 <- aov(values~ind, data = stack(combine_f3groups))
summary(anova_f3)
TukeyHSD(anova_f3) 


  ### Permutation Test ###

# Make a function to remove the zeros because they represent the backwash

rem_zero <- function(data){
  
  # remove the zeros from the data frame
  data_no_zero <- data[ which(data$NTU != 0), ]
  
  return(data_no_zero)
}


# function to take mean

take_mean <- function(data){
  
  #take the mean of the NTU without zeros
  data_mean_no_zero <- mean(data$NTU)
  
  # return the mean
  return(data_mean_no_zero)
}


# filter 1

f1_pre_no_zero <- rem_zero(f1_pre)
f1_post_no_zero <- rem_zero(f1_post)


f1_pre_no_zero$group <- "pre"
f1_post_no_zero$group <- "post"
head(f1_pre_no_zero)
head(f1_post_no_zero)

f1_full_no_zero <- rbind(f1_pre_no_zero, f1_post_no_zero)

f1_perm <- replicate( 1000, one.test(f1_full_no_zero$group, f1_full_no_zero$NTU))
hist(f1_perm, xlim = c(-.0025, .003))
abline( v = mean(f1_pre_no_zero$NTU) - mean(f1_post_no_zero$NTU), 
        lwd=2, col="purple")

par(mfrow= c(1,1))
plot.ts(f1_pre_no_zero$NTU, col = "darkorange")
lines( f1_post_no_zero$NTU, col = "grey")


# filter 2


f2_pre_no_zero <- rem_zero(f2_pre)
f2_post_no_zero <- rem_zero(f2_post)


f2_pre_no_zero$group <- "pre"
f2_post_no_zero$group <- "post"
head(f2_pre_no_zero)
head(f2_post_no_zero)

f2_full_no_zero <- rbind(f2_pre_no_zero, f2_post_no_zero)

f2_perm <- replicate( 1000, one.test(f2_full_no_zero$group, f2_full_no_zero$NTU))
hist(f2_perm, xlim = c(-.0025, .003))
abline( v = mean(f2_pre_no_zero$NTU) - mean(f2_post_no_zero$NTU), 
        lwd=2, col="purple")

par(mfrow= c(1,1))
plot.ts(f2_pre_no_zero$NTU, col = "darkorange")
lines( f2_post_no_zero$NTU, col = "grey")


  ### Outlier Analysis ###

# Make a list of the outliers

outliers_0.75 <- as.numeric(which(data$NTU > .75))
outliers_1.0 <- as.numeric(which(data$NTU > 1.0))


# Make function to determint the previous NTU value by a number of y rows

previous_val <- function(x, y, data) {
  results <- data[x - y]
  return(results)
}


# Make function to find the percentage of previous values are 0.
# Once again there is a variable to change how many rows back we are looking

perc_zero <- function(x, num, data) {
  z <- previous_val(x, num, data)
  zero <- (as.numeric(which(z == 0)))
  length(zero) / length(z)
  
}


# Run the function with our outliers to see the percentage
# num = 12 because that would make it look back 1 hour

perc_zero(outliers_1.0, 12, data$NTU)
perc_zero(outliers_0.75, 12, data$NTU)
