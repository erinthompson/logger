#install.packages("lubridate")
#install.packages("dplyr")
library(readr)
library(lubridate)
library(dplyr)
library(reshape2)
library(ggplot2)
#Read in the files- You'll need to change the files locations to your system
all_files_ls <- read_csv("~/Desktop/La Selva ibutton files /hill_lab_trap_files/all_trap/all_files_la_selva_log.csv")
edge_ls <- read_csv("~/Desktop/La Selva ibutton files /hill_lab_trap_files/edge/edge_la_selva_log.csv")
ridge_ls <-read_csv("~/Desktop/La Selva ibutton files /hill_lab_trap_files/ridge/ridge_la_selva_log.csv")
valley_ls <- read_csv("~/Desktop/La Selva ibutton files /hill_lab_trap_files/valley/valley_la_selva_log.csv")

#Eliminate bad data and capture in separate dataframe- "bad" data contained within all_files_ls_bad
# The rule is data points less than 10 or more than 50 are eliminated.
all_files_ls_bad<-subset(all_files_ls,all_files_ls$temp<10|all_files_ls$temp>50)
all_files_ls <-subset(all_files_ls,all_files_ls$temp>10&all_files_ls$temp<50)

valley_ls_bad<-subset(valley_ls,valley_ls$temp<10|valley_ls$temp>50)
valley_ls <-subset(valley_ls,valley_ls$temp>10&valley_ls$temp<50)

ridge_ls_bad<-subset(ridge_ls,ridge_ls$temp<10|ridge_ls$temp>50)
ridge_ls <-subset(ridge_ls,ridge_ls$temp>10&ridge_ls$temp<50)

edge_ls_bad<-subset(edge_ls,edge_ls$temp<10|edge_ls$temp>50)
edge_ls <-subset(edge_ls,edge_ls$temp>10&edge_ls$temp<50)

# convert our character data to date data- then change to POSIXct data type.
# all_dates <- strptime(all_files_ls$date,format="%m/%d/%Y")
# Data needs to be put into a cosnistant format of %m/%d/%Y before you can coerce it
# into POSIXct, or any other, data otherwise it will spit out errors.
all_files_ls$date <- strptime(all_files_ls$date,format="%m/%d/%Y")
all_files_ls$date <- as.POSIXct(all_files_ls$date)
all_files_ls$time <- as.numeric(all_files_ls$time)

edge_ls$date <- strptime(edge_ls$date,format="%m/%d/%Y")
edge_ls$date <- as.POSIXct(edge_ls$date)
edge_ls$time <- as.numeric(edge_ls$time)

ridge_ls$date <- strptime(ridge_ls$date,format="%m/%d/%Y")
ridge_ls$date <- as.POSIXct(ridge_ls$date)
ridge_ls$time <- as.numeric(ridge_ls$time)

valley_ls$date <- strptime(valley_ls$date,format="%m/%d/%Y")
valley_ls$date <- as.POSIXct(valley_ls$date)
valley_ls$time <- as.numeric(valley_ls$time)

all_files_ls_bad$date <- strptime(all_files_ls_bad$date,format="%m/%d/%Y")
all_files_ls_bad$date <- as.POSIXct(all_files_ls_bad$date)
all_files_ls_bad$time <- as.numeric(all_files_ls_bad$time)

edge_ls_bad$date <- strptime(edge_ls_bad$date,format="%m/%d/%Y")
edge_ls_bad$date <- as.POSIXct(edge_ls_bad$date)
edge_ls_bad$time <- as.numeric(edge_ls_bad$time)

ridge_ls_bad$date <- strptime(ridge_ls_bad$date,format="%m/%d/%Y")
ridge_ls_bad$date <- as.POSIXct(ridge_ls_bad$date)
ridge_ls_bad$time <- as.numeric(ridge_ls_bad$time)

valley_ls_bad$date <- strptime(valley_ls_bad$date,format="%m/%d/%Y")
valley_ls_bad$date <- as.POSIXct(valley_ls_bad$date)
valley_ls_bad$time <- as.numeric(valley_ls_bad$time)

# Summarize and cut data into appropriate groups
#Groups by "canopy_understory" then makes appropirate dry/wet season calls 
# based on the month, using lubridate library.
all_files <-all_files_ls %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp))
ridge_ls <-ridge_ls %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp))
edge_ls <-edge_ls %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp))
valley_ls <-valley_ls %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp))

all_files_bad <-all_files_ls_bad %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp))
ridge_ls_bad <-ridge_ls_bad %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp))
edge_ls_bad <-edge_ls_bad %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp))
valley_ls_bad <-valley_ls_bad %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp))

#Force our time from a factor to a number so it can be plotted properly
all_files$hour <- as.numeric(all_files$hour)
valley_ls$hour <- as.numeric(valley_ls$hour)
ridge_ls$hour <- as.numeric(ridge_ls$hour)
edge_ls$hour <- as.numeric(edge_ls$hour)
#Subset into proper season/canopy_understory conditions:
valley_dry_canopy_subset <-subset(valley_ls,season=="dry"&canopy_understory=="c")
valley_wet_canopy_subset <-subset(valley_ls,season=="wet"&canopy_understory=="c")
valley_dry_understory_subset <-subset(valley_ls,season=="dry"&canopy_understory=="u")
valley_wet_understory_subset <-subset(valley_ls,season=="wet"&canopy_understory=="u")

ridge_dry_canopy_subset <-subset(ridge_ls,season=="dry"&canopy_understory=="c")
ridge_wet_canopy_subset <-subset(ridge_ls,season=="dry"&canopy_understory=="c")
ridge_dry_understory_subset <-subset(ridge_ls,season=="dry"&canopy_understory=="u")
ridge_wet_understory_subset <-subset(ridge_ls,season=="dry"&canopy_understory=="u")

edge_dry_canopy_subset <-subset(edge_ls,season=="dry"&canopy_understory=="c")
edge_wet_canopy_subset <-subset(edge_ls,season=="dry"&canopy_understory=="c")
edge_dry_understory_subset <-subset(edge_ls,season=="dry"&canopy_understory=="u")
edge_wet_understory_subset <-subset(edge_ls,season=="dry"&canopy_understory=="u")

all_dry_understory_subset <- subset(all_files,season=="dry"&canopy_understory=="u")
all_dry_canopy_subset <- subset(all_files,season=="dry"&canopy_understory=="c")
all_wet_understory_subset <- subset(all_files,season=="wet"&canopy_understory=="u")
all_wet_canopy_subset <- subset(all_files,season=="wet"&canopy_understory=="c")
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
