## packages
library(tidyverse)
library(lubridate)


## code to make the csv out of all filter data

load("DenverWater_Filtration.rda")

a <- filter_01 %>% rename(totaleff_flow = FOTFT01_GV_FT01_TotalEff_Flow, NTU = FOTFT01_AI_FT01_NTU, 
                          headloss = FOTFT01_AI_FT01_Headloss, runtime = FOTFT01_GV_FT01_Effluent_Runtime) %>%
  add_column(filter = 1) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
b <- filter_02 %>% rename(totaleff_flow = FOTFT02_GV_FT02_TotalEff_Flow, NTU = FOTFT02_AI_FT02_NTU, 
                          headloss = FOTFT02_AI_FT02_Headloss, runtime = FOTFT02_GV_FT02_Effluent_Runtime) %>%
  add_column(filter = 2) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
c <- filter_03 %>% rename(totaleff_flow = FOTFT03_GV_FT03_TotalEff_Flow, NTU = FOTFT03_AI_FT03_NTU, 
                          headloss = FOTFT03_AI_FT03_Headloss, runtime = FOTFT03_GV_FT03_Effluent_Runtime) %>%
  add_column(filter = 3) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
d <- filter_04 %>% rename(totaleff_flow = FOTFT04_GV_FT04_TotalEff_Flow, NTU = FOTFT04_AI_FT04_NTU, 
                          headloss = FOTFT04_AI_FT04_Headloss, runtime = FOTFT04_GV_FT04_Effluent_Runtime) %>%
  add_column(filter = 4) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
e <- filter_05 %>% rename(totaleff_flow = FOTFT05_GV_FT05_TotalEff_Flow, NTU = FOTFT05_AI_FT05_NTU, 
                          headloss = FOTFT05_AI_FT05_Headloss, runtime = FOTFT05_GV_FT05_Effluent_Runtime) %>%
  add_column(filter = 5) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
f <- filter_06 %>% rename(totaleff_flow = FOTFT06_GV_FT06_TotalEff_Flow, NTU = FOTFT06_AI_FT06_NTU, 
                          headloss = FOTFT06_AI_FT06_Headloss, runtime = FOTFT06_GV_FT06_Effluent_Runtime) %>%
  add_column(filter = 6) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
g <- filter_07 %>% rename(totaleff_flow = FOTFT07_GV_FT07_TotalEff_Flow, NTU = FOTFT07_AI_FT07_NTU, 
                          headloss = FOTFT07_AI_FT07_Headloss, runtime = FOTFT07_GV_FT07_Effluent_Runtime) %>%
  add_column(filter = 7) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
h <- filter_08 %>% rename(totaleff_flow = FOTFT08_GV_FT08_TotalEff_Flow, NTU = FOTFT08_AI_FT08_NTU, 
                          headloss = FOTFT08_AI_FT08_Headloss, runtime = FOTFT08_GV_FT08_Effluent_Runtime) %>%
  add_column(filter = 8) %>%add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
i <- filter_09 %>% rename(totaleff_flow = FOTFT09_GV_FT09_TotalEff_Flow, NTU = FOTFT09_AI_FT09_NTU, 
                          headloss = FOTFT09_AI_FT09_Headloss, runtime = FOTFT09_GV_FT09_Effluent_Runtime) %>%
  add_column(filter = 9) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
j <- filter_10 %>% rename(totaleff_flow = FOTFT10_GV_FT10_TotalEff_Flow, NTU = FOTFT10_AI_FT10_NTU,
                          headloss = FOTFT10_AI_FT10_Headloss, runtime = FOTFT10_GV_FT10_Effluent_Runtime) %>%
  add_column(filter = 10) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
k <- filter_11 %>% rename(totaleff_flow = FOTFT11_GV_FT11_TotalEff_Flow, NTU = FOTFT11_AI_FT11_NTU, 
                          headloss = FOTFT11_AI_FT11_Headloss, runtime = FOTFT11_GV_FT11_Effluent_Runtime) %>%
  add_column(filter = 11) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
l <- filter_12 %>% rename(totaleff_flow = FOTFT12_GV_FT12_TotalEff_Flow, NTU = FOTFT12_AI_FT12_NTU, 
                          headloss = FOTFT12_AI_FT12_Headloss, runtime = FOTFT12_GV_FT12_Effluent_Runtime) %>%
  add_column(filter = 12) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
m <- filter_13 %>% rename(totaleff_flow = FOTFT13_GV_FT13_TotalEff_Flow, NTU = FOTFT13_AI_FT13_NTU, 
                          headloss = FOTFT13_AI_FT13_Headloss, runtime = FOTFT13_GV_FT13_Effluent_Runtime) %>%
  add_column(filter = 13) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
n <- filter_14 %>% rename(totaleff_flow = FOTFT14_GV_FT14_TotalEff_Flow, NTU = FOTFT14_AI_FT14_NTU, 
                          headloss = FOTFT14_AI_FT14_Headloss, runtime = FOTFT14_GV_FT14_Effluent_Runtime) %>%
  add_column(filter = 14) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
o <- filter_15 %>% rename(totaleff_flow = FOTFT15_GV_FT15_TotalEff_Flow, NTU = FOTFT15_AI_FT15_NTU, 
                          headloss = FOTFT15_AI_FT15_Headloss, runtime = FOTFT15_GV_FT15_Effluent_Runtime) %>%
  add_column(filter = 15) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))
p <- filter_16 %>% rename(totaleff_flow = FOTFT16_GV_FT16_TotalEff_Flow, NTU = FOTFT16_AI_FT16_NTU,
                          headloss = FOTFT16_AI_FT16_Headloss, runtime = FOTFT16_GV_FT16_Effluent_Runtime) %>%
  add_column(filter = 16) %>% add_column(date.time = as.POSIXct(paste(.$date, .$time), format="%Y-%m-%d %H:%M:%S"))

complete <- rbind(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p)

write.csv(complete, file = "allfilter_data.csv", row.names = TRUE)
