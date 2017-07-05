#Imports
library(ggplot2)
library(readr)
library(dplyr)
#Load all files from Erin's computer
all_files_la_selva_log <- read_csv("~/Desktop/bioinformatic_work/log_parse_files/sorted_by_habitat/all_trap/all_files_la_selva_log.csv")
ridge_la_selva_log <- read_csv("~/Desktop/bioinformatic_work/log_parse_files/sorted_by_habitat/ridge/ridge_la_selva_log.csv")
edge_la_selva_log <- read_csv("~/Desktop/bioinformatic_work/log_parse_files/sorted_by_habitat/edge/edge_la_selva_log.csv")
valley_la_selva_log <- read_csv("~/Desktop/bioinformatic_work/log_parse_files/sorted_by_habitat/valley/valley_la_selva_log.csv")
#
#Eliminate bad data and capture in separate dataframe- "bad" data contained within all_files_la_selva_log_bad
#
all_files_la_selva_log_bad<-subset(all_files_la_selva_log,all_files_la_selva_log$temp<10|all_files_la_selva_log$temp>50)
all_files_la_selva_log <-subset(all_files_la_selva_log,all_files_la_selva_log$temp>10&all_files_la_selva_log$temp<50)
edge_la_selva_log_bad <- subset(edge_la_selva_log,edge_la_selva_log$temp<10|edge_la_selva_log$temp>50)
edge_la_selva_log <- subset(edge_la_selva_log,edge_la_selva_log$temp>10&edge_la_selva_log$temp<50)
valley_la_selva_log_bad <- subset(valley_la_selva_log,valley_la_selva_log$temp<10|valley_la_selva_log$temp>50)
valley_la_selva_log <- subset(valley_la_selva_log,valley_la_selva_log$temp>10&valley_la_selva_log$temp<50)
ridge_la_selva_log_bad <- subset(ridge_la_selva_log,ridge_la_selva_log$temp<10|ridge_la_selva_log$temp>50)
ridge_la_selva_log <- subset(ridge_la_selva_log,ridge_la_selva_log$temp>10&ridge_la_selva_log$temp<50)

# convert our character data to date data- then change to POSIXct data type.
# all_dates <- strptime(all_files_la_selva_log$date,format="%m/%d/%Y")
# Data needs to be put into a cosnistant format of %m/%d/%Y before you can coerce it
# into POSIXct, or any other, data otherwise it will spit out errors.

all_files_la_selva_log$date <- strptime(all_files_la_selva_log$date,format="%m/%d/%Y")
all_files_la_selva_log$date <- as.POSIXct(all_files_la_selva_log$date)
ridge_la_selva_log$date <- strptime(ridge_la_selva_log$date,format="%m/%d/%Y")
ridge_la_selva_log$date <- as.POSIXct(ridge_la_selva_log$date)
edge_la_selva_log$date <- strptime(edge_la_selva_log$date,format="%m/%d/%Y")
edge_la_selva_log$date <- as.POSIXct(edge_la_selva_log$date)
valley_la_selva_log$date <- strptime(valley_la_selva_log$date,format="%m/%d/%Y")
valley_la_selva_log$date <- as.POSIXct(valley_la_selva_log$date)


# Create wet and dry season data sets.
all_files_la_selva_log_winter <- subset(all_files_la_selva_log,date>="2015-05-01"&date<="2015-12-31"|date>="2016-05-01"&date<="2016-12-31")
all_files_la_selva_log_summer <- subset(all_files_la_selva_log,date>="2015-01-01"&date<="2015-4-30"|date>="2016-01-01"&date<="2016-04-30")

ridge_la_selva_log_winter <- subset(ridge_la_selva_log,date>="2015-05-01"&date<="2015-12-31"|date>="2016-05-01"&date<="2016-12-31")
ridge_la_selva_log_summer <- subset(ridge_la_selva_log,date>="2015-01-01"&date<="2015-4-30"|date>="2016-01-01"&date<="2016-04-30")

edge_la_selva_log_winter <- subset(edge_la_selva_log,date>="2015-05-01"&date<="2015-12-31"|date>="2016-05-28"&date<="2016-12-31")
edge_la_selva_log_summer <- subset(edge_la_selva_log,date>="2015-01-01"&date<="2015-4-30"|date>="2016-01-01"&date<="2016-04-30")

valley_la_selva_log_winter <- subset(valley_la_selva_log,date>="2015-05-01"&date<="2015-12-31"|date>="2016-05-28"&date<="2016-12-31")
valley_la_selva_log_summer <- subset(valley_la_selva_log,date>="2015-01-01"&date<="2015-4-30"|date>="2016-01-01"&date<="2016-04-30")

# Subset into canopy and understory dataframes, as well as into wet and dry, along with canopy and understory
# categories.

all_files_la_selva_log_c <- subset(all_files_la_selva_log,canopy_understory=="c"|canopy_understory=="C")
all_files_la_selva_log_u <- subset(all_files_la_selva_log,canopy_understory=="u"|canopy_understory=="U")
all_files_la_selva_log_bad_u  <- subset(all_files_la_selva_log_bad,canopy_understory=="u"|canopy_understory=="U")
all_files_la_selva_log_bad_c <-  subset(all_files_la_selva_log_bad,canopy_understory=="c"|canopy_understory=="C")

edge_c <- subset(edge_la_selva_log,canopy_understory=="c"|canopy_understory=="C")
edge_u <- subset(edge_la_selva_log,canopy_understory=="u"|canopy_understory=="U")
edge_c_bad <- subset(edge_la_selva_log_bad,canopy_understory=="c"|canopy_understory=="C")
edge_u_bad <- subset(edge_la_selva_log_bad,canopy_understory=="u"|canopy_understory=="U")

edge_la_selva_log_summer_u <- subset(edge_la_selva_log_summer,canopy_understory=="u"|canopy_understory=="U")
edge_la_selva_log_summer_c <- subset(edge_la_selva_log_summer,canopy_understory=="c"|canopy_understory=="C")

edge_la_selva_log_winter_u <- subset(edge_la_selva_log_winter,canopy_understory=="u"|canopy_understory=="U")
edge_la_selva_log_winter_c <- subset(edge_la_selva_log_winter,canopy_understory=="c"|canopy_understory=="C")

#Ridge canopy understory
ridge_c_bad <- subset(ridge_la_selva_log_bad,canopy_understory=="c"|canopy_understory=="C")
ridge_u_bad <- subset(ridge_la_selva_log_bad,canopy_understory=="u"|canopy_understory=="U")

ridge_c <- subset(ridge_la_selva_log,canopy_understory=="c"|canopy_understory=="C")
ridge_u <- subset(ridge_la_selva_log,canopy_understory=="u"|canopy_understory=="U")

ridge_la_selva_log_winter_u <- subset(ridge_la_selva_log_winter,canopy_understory=="u"|canopy_understory=="U")
ridge_la_selva_log_winter_c <- subset(ridge_la_selva_log_winter,canopy_understory=="c"|canopy_understory=="C")

ridge_la_selva_log_summer_u <- subset(ridge_la_selva_log_summer,canopy_understory=="u"|canopy_understory=="U")
ridge_la_selva_log_summer_c <- subset(ridge_la_selva_log_summer,canopy_understory=="c"|canopy_understory=="C")

#Valley canopy understory
# Issues with valley_u_bad - it doesn't seem to be
# reading in properly.

 valley_c <- subset( valley_la_selva_log,canopy_understory=="c"|canopy_understory=="C")
 valley_u <- subset( valley_la_selva_log,canopy_understory=="u"|canopy_understory=="U")

valley_c_bad <- subset(valley_la_selva_log_bad,canopy_understory=="c"|canopy_understory=="C")
valley_u_bad <- subset(valley_la_selva_log_bad,canopy_understory=="u"|canopy_understory=="U")

valley_la_selva_log_winter_u <- subset(valley_la_selva_log_winter,canopy_understory=="u"|canopy_understory=="U")
valley_la_selva_log_winter_c <- subset(valley_la_selva_log_winter,canopy_understory=="c"|canopy_understory=="C")

valley_la_selva_log_summer_u <- subset(valley_la_selva_log_summer,canopy_understory=="u"|canopy_understory=="U")
valley_la_selva_log_summer_c <- subset(valley_la_selva_log_summer,canopy_understory=="c"|canopy_understory=="C")

# valley_c <- subset(valley_la_selva_log,canopy_understory=="c"|canopy_understory=="C")
# valley_u <- subset(valley_la_selva_log,canopy_understory=="u"|canopy_understory=="U")




#Create summary data for each of the regions.
#Persistant issues with ridge_c_bad_summary- it won't load.
#As well as with edge_u_bad_summary. Also doesn't work.
# Create dataframes containing means and standard deviations for every time point. 
#Valley split into canopy and understory
valley_c_summary <- valley_la_selva_log %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
valley_u_summary <- valley_u  %>%group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))  
#valley split into winter and summer as well as canopy/understory
valley_la_selva_log_summer_c_summary <- valley_la_selva_log_summer_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
valley_la_selva_log_summer_u_summary <- valley_la_selva_log_summer_u %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
valley_la_selva_log_winter_c_summary <- valley_la_selva_log_winter_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
valley_la_selva_log_winter_u_summary <- valley_la_selva_log_winter_u %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))

# The data called erroneous from valley
valley_c_bad_summary <-valley_c_bad %>%group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
valley_u_bad_summary <- valley_u_bad %>%group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
# Ridge data split into canopy and understory
ridge_c_summary <- ridge_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),average = mean(temp,na.rm=TRUE))
ridge_u_summary <- ridge_u %>% group_by(time)%>%summarise(standard_deviation = sd(temp,na.rm=TRUE),average=mean(temp,na.rm=TRUE)) 
#
edge_la_selva_log_summer_c_summary <- edge_la_selva_log_summer_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
edge_la_selva_log_summer_u_summary <- edge_la_selva_log_summer_u %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
edge_la_selva_log_winter_c_summary <- edge_la_selva_log_winter_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
edge_la_selva_log_winter_u_summary <- edge_la_selva_log_winter_u %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
# The data called erroneous from ridge
ridge_u_bad_summary <- ridge_u_bad %>% group_by(time)%>%summarise(standard_deviation = sd(temp,na.rm=TRUE),average=mean(temp,na.rm=TRUE)) 
ridge_c_bad_summary <- ridge_c_bad %>% group_by(time)%>%summarise(standard_deviation = sd(temp,na.rm=TRUE),average=mean(temp,na.rm=TRUE)) 
#Data from edge split into canopy and understory
edge_c_summary <- edge_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),average = mean(temp,na.rm=TRUE))
edge_u_summary <- edge_u %>% group_by(time)%>%summarise(standard_deviation = sd(temp,na.rm=TRUE),average=mean(temp,na.rm=TRUE)) 
# Wet and dry season data
ridge_la_selva_log_summer_c_summary <- ridge_la_selva_log_summer_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
ridge_la_selva_log_summer_u_summary <- ridge_la_selva_log_summer_u %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
ridge_la_selva_log_winter_c_summary <- ridge_la_selva_log_winter_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
ridge_la_selva_log_winter_u_summary <- ridge_la_selva_log_winter_u %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
# Data called erroneous from ridge
edge_u_bad_summary <- edge_u_bad %>% group_by(time)%>%summarise(standard_deviation = sd(temp,na.rm=TRUE),average=mean(temp,na.rm=TRUE)) 
edge_c_bad_summary <- edge_c_bad %>% group_by(time)%>%summarise(standard_deviation = sd(temp,na.rm=TRUE),average=mean(temp,na.rm=TRUE)) 

# All data split into canopy/understory.
all_files_la_selva_log_c_summary <- all_files_la_selva_log_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),average = mean(temp,na.rm=TRUE))
all_files_la_selva_log_u_summary <- all_files_la_selva_log_u %>% group_by(time)%>%summarise(standard_deviation = sd(temp,na.rm=TRUE),average=mean(temp,na.rm=TRUE)) 
# Data called erroneous split into canopy/understory
all_files_la_selva_log_u_bad_summary <- all_files_la_selva_log_bad_u %>% group_by(time)%>%summarise(standard_deviation = sd(temp,na.rm=TRUE),average=mean(temp,na.rm=TRUE)) 
all_files_la_selva_log_bad_c_summary <- all_files_la_selva_log_bad_c %>% group_by(time)%>%summarise(standard_deviation = sd(temp,na.rm=TRUE),average=mean(temp,na.rm=TRUE)) 
#
all_files_la_selva_log_summer_c_summary <- all_files_la_selva_log_summer_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
all_files_la_selva_log_summer_u_summary <- all_files_la_selva_log_summer_u %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
all_files_la_selva_log_winter_c_summary <- all_files_la_selva_log_winter_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
all_files_la_selva_log_winter_u_summary <- all_files_la_selva_log_winter_u %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
# GGplot
###########
ggplot(data=all_files_la_selva_log_summer_c_summary,aes(x = times,y=means))+
  geom_errorbar(data=all_files_la_selva_log_summer_c_summary,aes(ymin=means-sd,ymax=means+sd),colour="red")+
  geom_line(aes(y=means),colour="red")+
  theme_classic()+
  geom_line(data = valley_c_s_summary,aes(x=times,y=means))+
  geom_errorbar(data=valley_c_s_summary,aes(ymin=means-sd,ymax=means+sd))+
  geom_line(data = edge_c_s_summary,aes(x=times,y=means),colour="blue")+
  geom_errorbar(data=edge_c_s_summary,aes(ymin=means-sd,ymax=means+sd),colour="blue")+
  labs(x="Time",y="Temperature in canopy during January to April")

ggplot(data=ridge_la_selva_log_summer_c_summary,aes(x = time,y=mean))+
  geom_errorbar(data=ridge_la_selva_log_summer_c_summary,aes(ymin=mean- standard_deviation,ymax=mean+ standard_deviation),colour="red")+
  geom_line(aes(y= mean),colour="red")+
  theme_classic()+
  geom_line(data = valley_la_selva_log_summer_c_summary,aes(x=time,y=mean))+
  geom_errorbar(data=valley_la_selva_log_summer_c_summary,aes(ymin=mean- standard_deviation,ymax=mean+ standard_deviation))+
  geom_line(data = edge_la_selva_log_summer_c_summary,aes(x=time,y=mean),colour="blue")+
  geom_errorbar(data=edge_la_selva_log_summer_c_summary,aes(ymin=mean- standard_deviation,ymax=mean+ standard_deviation),colour="blue")+
  labs(x="Time",y="Temperature in canopy during January to April")


