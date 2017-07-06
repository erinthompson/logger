# As of 6/12/17 I am working on a previously working version of a script. 
# You might want to consider reinstalling these packages if you are having
# issues, as they can sometimes update/things can become depricated
# For some reason resinstalling them will take a few minutes to go from
# start to finish. 
# install.packages("lubridate")
# install.packages("dplyr")
# install.packages("reshape2")
# install.packages("readr")

# If you encounter issues, they are likely in the edge folder. Erin edited this file in
# excel so it would be useable, but this edited version is not perfect and will have
# row issues if you try to use the filname or the # rows.
# This initial cheat has led to cheating in your scripts in a few places. Use caution
# -ET 6/15/17
# Load the libraries needed to run 
library(lubridate)
library(dplyr)
library(reshape2)
library(readr)
library(ggplot2)
#Read in the files- You'll need to change the files locations to your system
all_files_hobo <- read_csv("Desktop/hobo/all/all.csv")
edge_ls_hobo <- read_csv("Desktop/hobo/edge/edge.csv")
ridge_ls_hobo <-read_csv("Desktop/hobo/ridge/ridge.csv")
valley_ls_hobo <- read_csv("Desktop/hobo/valley/valley.csv")
#/home/erin/Desktop/bioinformatic_work/HOBO_files_complete/hobo_files/sorted_by_habitat/all
names(all_files_hobo)<-c("canopy_understory","trap_no","file_name","#","date","time","temp","intensity","coupler_attached","host_connected","stopped","end_of_file")
names(edge_ls_hobo)<-c("canopy_understory","trap_no","file_name","#","date","time","temp","intensity","coupler_attached","host_connected","stopped","end_of_file")
names(ridge_ls_hobo)<-c("canopy_understory","trap_no","file_name","#","date","time","temp","intensity","coupler_attached","host_connected","stopped","end_of_file")
names(valley_ls_hobo)<-c("canopy_understory","trap_no","file_name","#","date","time","temp","intensity","coupler_attached","host_connected","stopped","end_of_file")

#Eliminate bad data and capture in separate dataframe- "bad" data contained within all_files_hobo_bad
# The rule is data points less than 10 or more than 50 are eliminated.
all_files_hobo_bad<-subset(all_files_hobo,all_files_hobo$temp<10|all_files_hobo$temp>50)
all_files_hobo <-subset(all_files_hobo,all_files_hobo$temp>10&all_files_hobo$temp<50)

valley_ls_hobo_bad<-subset(valley_ls_hobo,valley_ls_hobo$temp<10|valley_ls_hobo$temp>50)
valley_ls_hobo <-subset(valley_ls_hobo,valley_ls_hobo$temp>10&valley_ls_hobo$temp<50)

ridge_ls_hobo_bad<-subset(ridge_ls_hobo,ridge_ls_hobo$temp<10|ridge_ls_hobo$temp>50)
ridge_ls_hobo <-subset(ridge_ls_hobo,ridge_ls_hobo$temp>10&ridge_ls_hobo$temp<50)

edge_ls_hobo_bad<-subset(edge_ls_hobo,edge_ls_hobo$temp<10|edge_ls_hobo$temp>50)
edge_ls_hobo <-subset(edge_ls_hobo,edge_ls_hobo$temp>10&edge_ls_hobo$temp<50)

# convert our character data to date data- then change to POSIXct data type.
# all_dates <- strptime(all_files_hobo$date,format="%m/%d/%Y")
# Data needs to be put into a cosnistant format of %m/%d/%Y before you can coerce it
# into POSIXct, or any other, data otherwise it will spit out errors.
#all_files_hobo$date <- strptime(all_files_hobo$date,format="%m/%d/%Y")
#all_files_hobo$date <- as.POSIXct(all_files_hobo$date)
##all_files_hobo$time <- as.numeric(all_files_hobo$time)
all_files_hobo$date <- strptime(all_files_hobo$date,format="%m/%d/%Y")
all_files_hobo$date <- as.POSIXct(all_files_hobo$date)

edge_ls_hobo$date <- strptime(edge_ls_hobo$date,format="%m/%d/%Y")
edge_ls_hobo$date <- as.POSIXct(edge_ls_hobo$date)

ridge_ls_hobo$date <- strptime(ridge_ls_hobo$date,format="%m/%d/%Y")
ridge_ls_hobo$date <- as.POSIXct(ridge_ls_hobo$date)
#ridge_ls_hobo$time <- as.numeric(ridge_ls_hobo$time)

valley_ls_hobo$date <- strptime(valley_ls_hobo$date,format="%m/%d/%Y")
valley_ls_hobo$date <- as.POSIXct(valley_ls_hobo$date)
#valley_ls_hobo$time <- as.numeric(valley_ls_hobo$time)

all_files_hobo_bad$date <- strptime(all_files_hobo_bad$date,format="%m/%d/%Y")
all_files_hobo_bad$date <- as.POSIXct(all_files_hobo_bad$date)
#all_files_hobo_bad$time <- as.numeric(all_files_hobo_bad$time)

edge_ls_hobo_bad$date <- strptime(edge_ls_hobo_bad$date,format="%m/%d/%Y")
edge_ls_hobo_bad$date <- as.POSIXct(edge_ls_hobo_bad$date)
#edge_ls_hobo_bad$time <- as.numeric(edge_ls_hobo_bad$time)

ridge_ls_hobo_bad$date <- strptime(ridge_ls_hobo_bad$date,format="%m/%d/%Y")
ridge_ls_hobo_bad$date <- as.POSIXct(ridge_ls_hobo_bad$date)
#ridge_ls_hobo_bad$time <- as.numeric(ridge_ls_hobo_bad$time)

valley_ls_hobo_bad$date <- strptime(valley_ls_hobo_bad$date,format="%m/%d/%Y")
valley_ls_hobo_bad$date <- as.POSIXct(valley_ls_hobo_bad$date)
#valley_ls_hobo_bad$time <- as.numeric(valley_ls_hobo_bad$time)

# Eliminate seconds from time and convert time to numeric for later "cuting" and categorization
all_files_hobo$time <- strftime(all_files_hobo$time, format = "%H:%M", tz = "UTC")
edge_ls_hobo$time <- strftime(edge_ls_hobo$time, format = "%H:%M", tz = "UTC")
ridge_ls_hobo$time <- strftime(ridge_ls_hobo$time, format = "%H:%M", tz = "UTC")
valley_ls_hobo$time <- strftime(valley_ls_hobo$time, format = "%H:%M", tz = "UTC")

all_files_hobo_bad$time <- strftime(all_files_hobo_bad$time, format = "%H:%M", tz = "UTC")
edge_ls_hobo_bad$time <- strftime(edge_ls_hobo_bad$time, format = "%H:%M", tz = "UTC")
ridge_ls_hobo_bad$time <- strftime(ridge_ls_hobo_bad$time, format = "%H:%M", tz = "UTC")
valley_ls_hobo_bad$time <- strftime(valley_ls_hobo_bad$time, format = "%H:%M", tz = "UTC")
###############################################
#Remove colons from time data
#data1$c <- gsub('_', '-', data1$c)
all_files_hobo$time <- gsub(':','',all_files_hobo$time)
edge_ls_hobo$time <- gsub(':','',edge_ls_hobo$time)
ridge_ls_hobo$time <- gsub(':','',ridge_ls_hobo$time)
valley_ls_hobo$time <- gsub(':','',valley_ls_hobo$time)

all_files_hobo_bad$time <- gsub(':','',all_files_hobo_bad$time)
edge_ls_hobo_bad$time <- gsub(':','',edge_ls_hobo_bad$time)
ridge_ls_hobo_bad$time <- gsub(':','',ridge_ls_hobo_bad$time)
valley_ls_hobo_bad$time <- gsub(':','',valley_ls_hobo_bad$time)

#Convert times to numeric for cutting and grouping.
 all_files_hobo$time <- as.numeric(all_files_hobo$time)
 edge_ls_hobo$time <- as.numeric(edge_ls_hobo$time)
 ridge_ls_hobo$time <- as.numeric(ridge_ls_hobo$time)
 valley_ls_hobo$time <- as.numeric(valley_ls_hobo$time)

 all_files_hobo_bad$time <- as.numeric(all_files_hobo_bad$time)
 edge_ls_hobo_bad$time <- as.numeric(edge_ls_hobo_bad$time)
 ridge_ls_hobo_bad$time <- as.numeric(ridge_ls_hobo_bad$time)
 valley_ls_hobo_bad$time <- as.numeric(valley_ls_hobo_bad$time)

 # Summarize and cut data into appropriate groups
#Groups by "canopy_understory" then makes appropirate dry/wet season calls 
# based on the month, using lubridate library.
 
 #############################
 # Changing the names of edge_ls_hobo columns to trick R into being able to group them.
 #############################
 names(edge_ls_hobo)<-c("canopy_understory","trap_no","file_name","#","date","time","temp","intensity","coupler_attached","host_connected","stopped","end_of_file","a","b","c")
 names(edge_ls_hobo_bad)<-c("canopy_understory","trap_no","file_name","#","date","time","temp","intensity","coupler_attached","host_connected","stopped","end_of_file","a","b","c")
 
all_files_hobo <-all_files_hobo %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
ridge_ls_hobo <-ridge_ls_hobo %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
edge_ls_hobo <-edge_ls_hobo %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
valley_ls_hobo <-valley_ls_hobo %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))

all_files_hobo_bad <-all_files_hobo_bad %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
ridge_ls_hobo_bad <-ridge_ls_hobo_bad %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
edge_ls_hobo_bad <-edge_ls_hobo_bad %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
valley_ls_hobo_bad <-valley_ls_hobo_bad %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))

#Force our time from a factor to a number so it can be plotted properly
all_files_hobo$hour <- as.numeric(all_files_hobo$hour)
valley_ls_hobo$hour <- as.numeric(valley_ls_hobo$hour)
ridge_ls_hobo$hour <- as.numeric(ridge_ls_hobo$hour)
edge_ls_hobo$hour <- as.numeric(edge_ls_hobo$hour)
#Subset into proper season/canopy_understory conditions:
valley_dry_canopy_subset <-subset(valley_ls_hobo,season=="dry"&canopy_understory=="c")
valley_wet_canopy_subset <-subset(valley_ls_hobo,season=="wet"&canopy_understory=="c")
valley_dry_understory_subset <-subset(valley_ls_hobo,season=="dry"&canopy_understory=="u")
valley_wet_understory_subset <-subset(valley_ls_hobo,season=="wet"&canopy_understory=="u")

ridge_dry_canopy_subset <-subset(ridge_ls_hobo,season=="dry"&canopy_understory=="c")
ridge_wet_canopy_subset <-subset(ridge_ls_hobo,season=="dry"&canopy_understory=="c")
ridge_dry_understory_subset <-subset(ridge_ls_hobo,season=="dry"&canopy_understory=="u")
ridge_wet_understory_subset <-subset(ridge_ls_hobo,season=="dry"&canopy_understory=="u")

edge_dry_canopy_subset <-subset(edge_ls_hobo,season=="dry"&canopy_understory=="c")
edge_wet_canopy_subset <-subset(edge_ls_hobo,season=="dry"&canopy_understory=="c")
edge_dry_understory_subset <-subset(edge_ls_hobo,season=="dry"&canopy_understory=="u")
edge_wet_understory_subset <-subset(edge_ls_hobo,season=="dry"&canopy_understory=="u")

all_dry_understory_subset <- subset(all_files_hobo,season=="dry"&canopy_understory=="u")
all_dry_canopy_subset <- subset(all_files_hobo,season=="dry"&canopy_understory=="c")
all_wet_understory_subset <- subset(all_files_hobo,season=="wet"&canopy_understory=="u")
all_wet_canopy_subset <- subset(all_files_hobo,season=="wet"&canopy_understory=="c")
#Dry season in canopy plot
ggplot(data=na.omit(valley_dry_canopy_subset),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_errorbar(data=ridge_dry_canopy_subset,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  geom_line(aes(y=temp_mean),colour="red")+
  theme_classic()+
  geom_line(data = edge_dry_canopy_subset,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_dry_canopy_subset,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy May to December")
# Dry season in unerstory plot
ggplot(data=na.omit(valley_dry_understory_subset),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_errorbar(data=ridge_dry_understory_subset,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  geom_line(aes(y=temp_mean),colour="red")+
  theme_classic()+
  geom_line(data = edge_dry_understory_subset,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_dry_understory_subset,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory January to April")
# Wet season in understory plot
ggplot(data=na.omit(valley_wet_understory_subset),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_errorbar(data=ridge_wet_understory_subset,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  geom_line(aes(y=temp_mean),colour="red")+
  theme_classic()+
  geom_line(data = edge_wet_understory_subset,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_wet_understory_subset,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory May to December")
# Wet season in canopy plot
ggplot(data=na.omit(valley_dry_canopy_subset),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_errorbar(data=ridge_dry_canopy_subset,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  geom_line(aes(y=temp_mean),colour="red")+
  theme_classic()+
  geom_line(data = edge_dry_canopy_subset,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_dry_canopy_subset,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy May to December")
#### Graph of light intensity dry season
ggplot(data=na.omit(valley_dry_canopy_subset),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_errorbar(data=ridge_dry_canopy_subset,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  geom_line(aes(y=light_mean),colour="red")+
  theme_classic()+
  geom_line(data = edge_dry_canopy_subset,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_dry_canopy_subset,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  theme_classic()+
  labs(x="Time",y="light in canopy May to December")
####
ggplot(data=na.omit(valley_wet_canopy_subset),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_errorbar(data=ridge_wet_canopy_subset,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  geom_line(aes(y=light_mean),colour="red")+
  theme_classic()+
  geom_line(data = edge_wet_canopy_subset,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_wet_canopy_subset,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  theme_classic()+
  labs(x="Time",y="light in canopy January to April")
