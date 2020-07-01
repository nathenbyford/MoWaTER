setwd("~/Dropbox/Home/Projects/DenverWater/Filters")
library( lubridate)
library( scales)
library( viridis)

DWFilter<- read.csv("allfilter_data.csv")
DWFilter$time<- ymd_hms( DWFilter$date.time)
# time is a date object

# some strange dates
for (  k in 1:13){
  tmp<- DWFilter$time[DWFilter$filter ==k]
ind<- which(diff( tmp) >5)
 
cat ( k, ind, diff( tmp)[ind],  as.character(tmp[ind]), fill=TRUE)
}
# I see two times when the difference weas 65 minutes instead of 5
# 2019-11-03 01:55:00  and  2020-03-08 01:55:00


# this only works if the times are equally spaced. 
# and the backwash period is a block of contiguous zeroes.

# find  zeroes
#inBackwash<- (filter1$NTU ==0 | is.na(filter1$NTU ) )
inBackwash<- (DWFilter$NTU ==0 )
indexZero<- which(inBackwash)
# time differences between indices where there are zeroes. 
# units are minutes
diffZero<- as.numeric(diff( DWFilter$time[indexZero]) )
tableStats<- table( diffZero)
print( tableStats)
hist( as.numeric(diffZero) )

# find indices where there is a big jump in time 
# use table( diffZero )  to see the sizes of the differences
# note many that are just 5 in the backwash period
indexStart<- which( diffZero > 60 ) 
# now map this back to the orignal indices where there are zeroes
startFilter<- indexZero[ indexStart ]
# end is the next zero occurence after the start
# subtract one so that is the first nonzero value
endFilter <- indexZero[ indexStart + 1 ] - 1
#  startFilter is the row index of the last zero so add 1 to it to 
# be part of the filtering period
startFilter<- startFilter + 1
# startFilter and endFilter are row numbers of filter cycles. 

DWBackwash<- data.frame( 
    start = startFilter,
      end = endFilter,
startTime = (DWFilter$time)[startFilter],
  endTime = (DWFilter$time)[endFilter],
       filter = DWFilter$filter[startFilter] 
                         )
DWBackwash$deltaTime<- as.numeric( 
          DWBackwash$endTime - DWBackwash$startTime
          )

save( DWBackwash, file="DWBackwash.rda")

# Add times since backwash to filter cycles.
cycleTime<- rep( NA, nrow( DWFilter))
for( k in 1 : nrow( DWBackwash)){
  i1<- DWBackwash$start[k]
  i2<- DWBackwash$end[k]
  cycleTime[i1:i2] <-  as.numeric(
          DWFilter$time[i1:i2] -  DWFilter$time[i1]
           )/60
}

DWFilter$cycleTime<- cycleTime

save( DWFilter, file="DWFilter.rda")






