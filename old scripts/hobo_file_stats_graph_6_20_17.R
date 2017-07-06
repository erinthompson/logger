# As of 6/12/17 I am working on a previously working version of a script. 
# You might want to consider reinstalling these packages if you are having
# issues, as they can sometimes update/things can become depricated
# For some reason resinstalli','',valley_ls_hobo$time)

#all_files_hobo_bad$time <- gsubng them will take a few minutes to go from
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
# Here is an idea instead of creating new dataframes, 
# just use with() to graph the data you want
# Plot with conditions:
# with(dfr[(dfr$var3 < 155) & (dfr$var4 > 27),], plot(var1, var2))
# Plot with one condition
# with(dfr[dfr$var3 < 155,], plot(var1, var2))
# Load the libraries needed to run 
library(lubridate)
library(dplyr)
library(reshape2)
library(readr)
library(ggplot2)
edge_trap_nos <- c(1,2,3,4,5,6,7,8,9,10)
ridge_trap_nos <- c(11,12,17,21,22,23,24,25,26,28,29,30)
valley_trap_nos <- c(13,14,15,16,18,19,20,27,31,32)
#Read in the files- You'll need to change the files locations to your system
all_files_hobo <- read_tsv("Desktop/hobo_sorted_by_habitat/all/all_process.csv")
edge_ls_hobo <- read_tsv("Desktop/hobo_sorted_by_habitat/edge/all_process.csv")
ridge_ls_hobo <-read_tsv("Desktop/hobo_sorted_by_habitat/ridge/all_process.csv")
valley_ls_hobo <- read_tsv("Desktop/hobo_sorted_by_habitat/valley/all_process.csv")

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
# all_dates <- strptime(all_files_hobo$date,format="%m/%d/%y")
# Data needs to be put into a cosnistant format of %m/%d/%ybefore you can coerce it
# into POSIXct, or any other, data otherwise it will spit out errors.
#all_files_hobo$date <- strptime(all_files_hobo$date,format="%m/%d/%y")
#all_files_hobo$date <- as.POSIXct(all_files_hobo$date)
##all_files_hobo$time <- as.numeric(all_files_hobo$time)
#df$JoiningDate <- as.Date(df$JoiningDate , "%m/%d/%y")
all_files_hobo$date <-as.Date(all_files_hobo$date, "%m/%d/%y")
edge_ls_hobo$date <- as.Date(edge_ls_hobo$date,format="%m/%d/%y")
#edge_ls_hobo$date <- as.POSIXct(edge_ls_hobo$date)
ridge_ls_hobo$date <- as.Date(ridge_ls_hobo$date,format="%m/%d/%y")
#ridge_ls_hobo$date <- as.POSIXct(ridge_ls_hobo$date)
#ridge_ls_hobo$time <- as.numeric(ridge_ls_hobo$time)
valley_ls_hobo$date <- as.Date(valley_ls_hobo$date,format="%m/%d/%y")
#valley_ls_hobo$date <- as.POSIXct(valley_ls_hobo$date)
#valley_ls_hobo$time <- as.numeric(valley_ls_hobo$time)

all_files_hobo_bad$date <-as.Date(all_files_hobo_bad$date, "%m/%d/%y")
edge_ls_hobo_bad$date <- as.Date(edge_ls_hobo_bad$date,format="%m/%d/%y")
ridge_ls_hobo_bad$date <- as.Date(ridge_ls_hobo_bad$date,format="%m/%d/%y")
valley_ls_hobo_bad$date <- as.Date(valley_ls_hobo_bad$date,format="%m/%d/%y")

# all_files_hobo_bad$date <-as.Date(all_files_hobo_bad$date, "%m/%d/%y")
# edge_ls_hobo_bad$date <- strptime(edge_ls_hobo_bad$date,format="%m/%d/%y")
# ridge_ls_hobo_bad$date <- strptime(ridge_ls_hobo_bad$date,format="%m/%d/%y")
# valley_ls_hobo_bad$date <- strptime(valley_ls_hobo_bad$date,format="%m/%d/%y")

#all_files_hobo_bad$date <- strptime(all_files_hobo_bad$date,format="%m/%d/%y")
#all_files_hobo_bad$date <- as.POSIXct(all_files_hobo_bad$date)
#all_files_hobo_bad$time <- as.numeric(all_files_hobo_bad$time)
#str(all_files_hobo)
#str(edge_ls_)

edge_ls_hobo_bad$date <- strptime(edge_ls_hobo_bad$date,format="%m/%d/%y")
#edge_ls_hobo_bad$date <- as.POSIXct(edge_ls_hobo_bad$date)
#edge_ls_hobo_bad$time <- as.numeric(edge_ls_hobo_bad$time)

ridge_ls_hobo_bad$date <- strptime(ridge_ls_hobo_bad$date,format="%m/%d/%y")
#ridge_ls_hobo_bad$date <- as.POSIXct(ridge_ls_hobo_bad$date)
#ridge_ls_hobo_bad$time <- as.numeric(ridge_ls_hobo_bad$time)

valley_ls_hobo_bad$date <- strptime(valley_ls_hobo_bad$date,format="%m/%d/%y")
#valley_ls_hobo_bad$date <- as.POSIXct(valley_ls_hobo_bad$date)
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
# format(range(all_files_hobo$date), "%D")
 #10377
 
 #############################
 # Changing the names of edge_ls_hobo columns to trick R into being able to group them.
 #############################
 #Month by month graphs of light/temp 
 #Add column that specifies the month for later grouping.
  all_files_hobo$month <- format(all_files_hobo$date, "%B")
  edge_ls_hobo$month <- format(edge_ls_hobo$date, "%B")
  ridge_ls_hobo$month <- format(ridge_ls_hobo$date, "%B")
  valley_ls_hobo$month <- format(valley_ls_hobo$date, "%B")
  
  all_files_hobo_bad$month <- format(all_files_hobo_bad$date, "%B")
  edge_ls_hobo_bad$month <- format(edge_ls_hobo_bad$date, "%B")
  ridge_ls_hobo_bad$month <- format(ridge_ls_hobo_bad$date, "%B")
  valley_ls_hobo_bad$month <- format(valley_ls_hobo_bad$date, "%B")
  
  # #
 #format(my_df$date, "%B")
 #####
 
 ####
  all_files_hobo_trap_sort <-all_files_hobo %>% group_by(trap_no,canopy_understory, month,season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
  all_files_hobo <-all_files_hobo %>% group_by(trap_no,canopy_understory, month,season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
  ridge_ls_hobo <-ridge_ls_hobo %>% group_by(canopy_understory, month, hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
  edge_ls_hobo <-edge_ls_hobo %>% group_by(canopy_understory, month,season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
  valley_ls_hobo <-valley_ls_hobo %>% group_by(canopy_understory, month,season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
  
 
 # all_files_hobo <-all_files_hobo %>% group_by(canopy_understory, month,season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
 # ridge_ls_hobo <-ridge_ls_hobo %>% group_by(canopy_understory, month, hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
 # edge_ls_hobo <-edge_ls_hobo %>% group_by(canopy_understory, month,season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
 # valley_ls_hobo <-valley_ls_hobo %>% group_by(canopy_understory, month,season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
 # 
  #ridge_ls_hobo <-ridge_ls_hobo %>% group_by(canopy_understory, month,season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
 
 #all_files_hobo_bad <-all_files_hobo_bad %>% group_by(canopy_understory, month,season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
 #ridge_ls_hobo_bad <-ridge_ls_hobo_bad %>% group_by(canopy_understory, month,season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
 #edge_ls_hobo_bad <-edge_ls_hobo_bad %>% group_by(canopy_understory, month,season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
 #valley_ls_hobo_bad <-valley_ls_hobo_bad %>% group_by(canopy_understory, month,season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
 
 
 
#  ridge_ls_hobo <-ridge_ls_hobo %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
# edge_ls_hobo <-edge_ls_hobo %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
# valley_ls_hobo <-valley_ls_hobo %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
# 
# all_files_hobo_bad <-all_files_hobo_bad %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
# ridge_ls_hobo_bad <-ridge_ls_hobo_bad %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
# edge_ls_hobo_bad <-edge_ls_hobo_bad %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))
# valley_ls_hobo_bad <-valley_ls_hobo_bad %>% group_by(canopy_understory, season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), light_mean =mean(intensity), light_sd = sd(intensity))

#Force our time from a factor to a number so it can be plotted properly
all_files_hobo_trap_sort$hour <- as.numeric(all_files_hobo_trap_sort$hour)
all_files_hobo$hour <- as.numeric(all_files_hobo$hour)
valley_ls_hobo$hour <- as.numeric(valley_ls_hobo$hour)
ridge_ls_hobo$hour <- as.numeric(ridge_ls_hobo$hour)
edge_ls_hobo$hour <- as.numeric(edge_ls_hobo$hour)
#Subset into proper season/canopy_understory conditions:
# valley_dry_canopy_subset <-subset(valley_ls_hobo,season=="dry"&canopy_understory=="c")
# valley_wet_canopy_subset <-subset(valley_ls_hobo,season=="wet"&canopy_understory=="c")
# valley_dry_understory_subset <-subset(valley_ls_hobo,season=="dry"&canopy_understory=="u")
# valley_wet_understory_subset <-subset(valley_ls_hobo,season=="wet"&canopy_understory=="u")
# 
# ridge_dry_canopy_subset <-subset(ridge_ls_hobo,season=="dry"&canopy_understory=="c")
# ridge_wet_canopy_subset <-subset(ridge_ls_hobo,season=="dry"&canopy_understory=="c")
# ridge_dry_understory_subset <-subset(ridge_ls_hobo,season=="dry"&canopy_understory=="u")
# ridge_wet_understory_subset <-subset(ridge_ls_hobo,season=="dry"&canopy_understory=="u")
# 
# edge_dry_canopy_subset <-subset(edge_ls_hobo,season=="dry"&canopy_understory=="c")
# edge_wet_canopy_subset <-subset(edge_ls_hobo,season=="dry"&canopy_understory=="c")
# edge_dry_understory_subset <-subset(edge_ls_hobo,season=="dry"&canopy_understory=="u")
# edge_wet_understory_subset <-subset(edge_ls_hobo,season=="dry"&canopy_understory=="u")
# 
# all_dry_understory_subset <- subset(all_files_hobo,season=="dry"&canopy_understory=="u")
# all_dry_canopy_subset <- subset(all_files_hobo,season=="dry"&canopy_understory=="c")
# all_wet_understory_subset <- subset(all_files_hobo,season=="wet"&canopy_understory=="u")
# all_wet_canopy_subset <- subset(all_files_hobo,season=="wet"&canopy_understory=="c")
##########
#with(dfr[(dfr$var3 < 155) & (dfr$var4 > 27),], plot(var1, var2))
# 
# with(all_files_hobo_trap_sort[(all_files_hobo_trap_sort$canopy_understory == "c") & (all_files_hobo_trap_sort$month == "January") & (all_files_hobo_trap_sort$trap_no==2),], 
#      ggplot(data=na.omit(all_files_hobo_trap_sort),aes(x = hour,y=temp_mean))+
#        geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
#        geom_line(aes(y=temp_mean),colour="blue",size=1)+theme_classic())
#      #First line.
# +
# with(all_files_hobo_trap_sort[(all_files_hobo_trap_sort$canopy_understory=="c") & all_files_hobo_trap_sort$month=="Februrary"])
#        geom_errorbar(data=all_files_hobo_trap_sort,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
#        geom_line(aes(y=temp_mean),colour="red")+
#        theme_classic()+
#        labs(x="Time",y="Temperature in canopy May to December")
# # 
#  with(edge_ls_hobo[(edge_ls_hobo$canopy_understory == "c") & (edge_ls_hobo$month == "January"),], 
#      ggplot(data=na.omit(edge_ls_hobo),aes(x = hour,y=temp_mean))+
#        geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
#        geom_line(aes(y=temp_mean),colour="black",size=1)+
#        geom_errorbar(data=ridge_dry_canopy_subset,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
#        geom_line(aes(y=temp_mean),colour="red")+
#        theme_classic()+
#        geom_line(data = edge_dry_canopy_subset,aes(x=hour,y=temp_mean),colour="blue")+
#        geom_errorbar(data=edge_dry_canopy_subset,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
#        theme_classic()+
#        labs(x="Time",y="Temperature in canopy May to December")
# )
#
#Create subsets of each habitat, per month in each condition. 
#
edge_sub_u_jan<- subset(edge_ls_hobo, edge_ls_hobo$month=="January" & edge_ls_hobo$canopy_understory=="u")
edge_sub_u_feb<- subset(edge_ls_hobo, edge_ls_hobo$month=="February" & edge_ls_hobo$canopy_understory=="u")
edge_sub_u_mar<- subset(edge_ls_hobo, edge_ls_hobo$month=="March"& edge_ls_hobo$canopy_understory=="u")
edge_sub_u_apr<- subset(edge_ls_hobo, edge_ls_hobo$month=="April"& edge_ls_hobo$canopy_understory=="u")
edge_sub_u_may<- subset(edge_ls_hobo, edge_ls_hobo$month=="May"& edge_ls_hobo$canopy_understory=="u")
edge_sub_u_jun<- subset(edge_ls_hobo, edge_ls_hobo$month=="June"& edge_ls_hobo$canopy_understory=="u")
edge_sub_u_jul<- subset(edge_ls_hobo, edge_ls_hobo$month=="July"& edge_ls_hobo$canopy_understory=="u")
edge_sub_u_aug<- subset(edge_ls_hobo, edge_ls_hobo$month=="August"& edge_ls_hobo$canopy_understory=="u")
edge_sub_u_sep<- subset(edge_ls_hobo, edge_ls_hobo$month=="September"& edge_ls_hobo$canopy_understory=="u")
edge_sub_u_oct<- subset(edge_ls_hobo, edge_ls_hobo$month=="October"& edge_ls_hobo$canopy_understory=="u")
edge_sub_u_nov<- subset(edge_ls_hobo, edge_ls_hobo$month=="November"& edge_ls_hobo$canopy_understory=="u")
edge_sub_u_dec<- subset(edge_ls_hobo, edge_ls_hobo$month=="December"& edge_ls_hobo$canopy_understory=="u")

edge_sub_c_jan<- subset(edge_ls_hobo, edge_ls_hobo$month=="January" & edge_ls_hobo$canopy_understory=="c")
edge_sub_c_feb<- subset(edge_ls_hobo, edge_ls_hobo$month=="February" & edge_ls_hobo$canopy_understory=="c")
edge_sub_c_mar<- subset(edge_ls_hobo, edge_ls_hobo$month=="March"& edge_ls_hobo$canopy_understory=="c")
edge_sub_c_apr<- subset(edge_ls_hobo, edge_ls_hobo$month=="April"& edge_ls_hobo$canopy_understory=="c")
edge_sub_c_may<- subset(edge_ls_hobo, edge_ls_hobo$month=="May"& edge_ls_hobo$canopy_understory=="c")
edge_sub_c_jun<- subset(edge_ls_hobo, edge_ls_hobo$month=="June"& edge_ls_hobo$canopy_understory=="c")
edge_sub_c_jul<- subset(edge_ls_hobo, edge_ls_hobo$month=="July"& edge_ls_hobo$canopy_understory=="c")
edge_sub_c_aug<- subset(edge_ls_hobo, edge_ls_hobo$month=="August"& edge_ls_hobo$canopy_understory=="c")
edge_sub_c_sep<- subset(edge_ls_hobo, edge_ls_hobo$month=="September"& edge_ls_hobo$canopy_understory=="c")
edge_sub_c_oct<- subset(edge_ls_hobo, edge_ls_hobo$month=="October"& edge_ls_hobo$canopy_understory=="c")
edge_sub_c_nov<- subset(edge_ls_hobo, edge_ls_hobo$month=="November"& edge_ls_hobo$canopy_understory=="c")
edge_sub_c_dec<- subset(edge_ls_hobo, edge_ls_hobo$month=="December"& edge_ls_hobo$canopy_understory=="c")
##################
ridge_sub_u_jan<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="January" & ridge_ls_hobo$canopy_understory=="u")
ridge_sub_u_feb<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="February" & ridge_ls_hobo$canopy_understory=="u")
ridge_sub_u_mar<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="March"& ridge_ls_hobo$canopy_understory=="u")
ridge_sub_u_apr<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="April"& ridge_ls_hobo$canopy_understory=="u")
ridge_sub_u_may<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="May"& ridge_ls_hobo$canopy_understory=="u")
ridge_sub_u_jun<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="June"& ridge_ls_hobo$canopy_understory=="u")
ridge_sub_u_jul<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="July"& ridge_ls_hobo$canopy_understory=="u")
ridge_sub_u_aug<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="August"& ridge_ls_hobo$canopy_understory=="u")
ridge_sub_u_sep<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="September"& ridge_ls_hobo$canopy_understory=="u")
ridge_sub_u_oct<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="October"& ridge_ls_hobo$canopy_understory=="u")
ridge_sub_u_nov<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="November"& ridge_ls_hobo$canopy_understory=="u")
ridge_sub_u_dec<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="December"& ridge_ls_hobo$canopy_understory=="u")

ridge_sub_c_jan<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="January" & ridge_ls_hobo$canopy_understory=="c")
ridge_sub_c_feb<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="February" & ridge_ls_hobo$canopy_understory=="c")
ridge_sub_c_mar<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="March"& ridge_ls_hobo$canopy_understory=="c")
ridge_sub_c_apr<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="April"& ridge_ls_hobo$canopy_understory=="c")
ridge_sub_c_may<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="May"& ridge_ls_hobo$canopy_understory=="c")
ridge_sub_c_jun<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="June"& ridge_ls_hobo$canopy_understory=="c")
ridge_sub_c_jul<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="July"& ridge_ls_hobo$canopy_understory=="c")
ridge_sub_c_aug<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="August"& ridge_ls_hobo$canopy_understory=="c")
ridge_sub_c_sep<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="September"& ridge_ls_hobo$canopy_understory=="c")
ridge_sub_c_oct<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="October"& ridge_ls_hobo$canopy_understory=="c")
ridge_sub_c_nov<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="November"& ridge_ls_hobo$canopy_understory=="c")
ridge_sub_c_dec<- subset(ridge_ls_hobo, ridge_ls_hobo$month=="December"& ridge_ls_hobo$canopy_understory=="c")
##############
valley_sub_u_jan<- subset(valley_ls_hobo, valley_ls_hobo$month=="January" & valley_ls_hobo$canopy_understory=="u")
valley_sub_u_feb<- subset(valley_ls_hobo, valley_ls_hobo$month=="February" & valley_ls_hobo$canopy_understory=="u")
valley_sub_u_mar<- subset(valley_ls_hobo, valley_ls_hobo$month=="March"& valley_ls_hobo$canopy_understory=="u")
valley_sub_u_apr<- subset(valley_ls_hobo, valley_ls_hobo$month=="April"& valley_ls_hobo$canopy_understory=="u")
valley_sub_u_may<- subset(valley_ls_hobo, valley_ls_hobo$month=="May"& valley_ls_hobo$canopy_understory=="u")
valley_sub_u_jun<- subset(valley_ls_hobo, valley_ls_hobo$month=="June"& valley_ls_hobo$canopy_understory=="u")
valley_sub_u_jul<- subset(valley_ls_hobo, valley_ls_hobo$month=="July"& valley_ls_hobo$canopy_understory=="u")
valley_sub_u_aug<- subset(valley_ls_hobo, valley_ls_hobo$month=="August"& valley_ls_hobo$canopy_understory=="u")
valley_sub_u_sep<- subset(valley_ls_hobo, valley_ls_hobo$month=="September"& valley_ls_hobo$canopy_understory=="u")
valley_sub_u_oct<- subset(valley_ls_hobo, valley_ls_hobo$month=="October"& valley_ls_hobo$canopy_understory=="u")
valley_sub_u_nov<- subset(valley_ls_hobo, valley_ls_hobo$month=="November"& valley_ls_hobo$canopy_understory=="u")
valley_sub_u_dec<- subset(valley_ls_hobo, valley_ls_hobo$month=="December"& valley_ls_hobo$canopy_understory=="u")

valley_sub_c_jan<- subset(valley_ls_hobo, valley_ls_hobo$month=="January" & valley_ls_hobo$canopy_understory=="c")
valley_sub_c_feb<- subset(valley_ls_hobo, valley_ls_hobo$month=="February" & valley_ls_hobo$canopy_understory=="c")
valley_sub_c_mar<- subset(valley_ls_hobo, valley_ls_hobo$month=="March"& valley_ls_hobo$canopy_understory=="c")
valley_sub_c_apr<- subset(valley_ls_hobo, valley_ls_hobo$month=="April"& valley_ls_hobo$canopy_understory=="c")
valley_sub_c_may<- subset(valley_ls_hobo, valley_ls_hobo$month=="May"& valley_ls_hobo$canopy_understory=="c")
valley_sub_c_jun<- subset(valley_ls_hobo, valley_ls_hobo$month=="June"& valley_ls_hobo$canopy_understory=="c")
valley_sub_c_jul<- subset(valley_ls_hobo, valley_ls_hobo$month=="July"& valley_ls_hobo$canopy_understory=="c")
valley_sub_c_aug<- subset(valley_ls_hobo, valley_ls_hobo$month=="August"& valley_ls_hobo$canopy_understory=="c")
valley_sub_c_sep<- subset(valley_ls_hobo, valley_ls_hobo$month=="September"& valley_ls_hobo$canopy_understory=="c")
valley_sub_c_oct<- subset(valley_ls_hobo, valley_ls_hobo$month=="October"& valley_ls_hobo$canopy_understory=="c")
valley_sub_c_nov<- subset(valley_ls_hobo, valley_ls_hobo$month=="November"& valley_ls_hobo$canopy_understory=="c")
valley_sub_c_dec<- subset(valley_ls_hobo, valley_ls_hobo$month=="December"& valley_ls_hobo$canopy_understory=="c")
#############################################################
#########33
#######working 6/21/17

##jan
ggplot(data=na.omit(valley_sub_u_jan),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_jan,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_jan,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_u_jan,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_jan,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory January")
####
ggplot(data=na.omit(valley_sub_c_jan),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_jan,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_jan,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_c_jan,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_jan,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy January")
##Light
ggplot(data=na.omit(valley_sub_u_jan),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_jan,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_jan,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_u_jan,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_jan,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in understory January")
####
ggplot(data=na.omit(valley_sub_c_jan),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_jan,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_jan,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_c_jan,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_jan,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in canopy January")
##feb
ggplot(data=na.omit(valley_sub_u_feb),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_feb,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_feb,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_u_feb,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_feb,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory February")
####
ggplot(data=na.omit(valley_sub_c_feb),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_feb,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_feb,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_c_feb,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_feb,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy February")
##Light
ggplot(data=na.omit(valley_sub_u_feb),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_feb,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_feb,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_u_feb,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_feb,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in understory February")
####
ggplot(data=na.omit(valley_sub_c_feb),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_feb,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_feb,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_c_feb,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_feb,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in canopy February")
##mar
ggplot(data=na.omit(valley_sub_u_mar),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_mar,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_mar,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_u_mar,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_mar,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory march")
####
ggplot(data=na.omit(valley_sub_c_mar),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_mar,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_mar,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_c_mar,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_mar,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy march")
##Light
ggplot(data=na.omit(valley_sub_u_mar),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_mar,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_mar,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_u_mar,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_mar,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in understory march")
####
ggplot(data=na.omit(valley_sub_c_mar),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_mar,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_mar,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_c_mar,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_mar,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in canopy march")
##apr
ggplot(data=na.omit(valley_sub_u_apr),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_apr,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_apr,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_u_apr,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_apr,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory April")
####
ggplot(data=na.omit(valley_sub_c_apr),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_apr,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_apr,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_c_apr,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_apr,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy April")
##Light
ggplot(data=na.omit(valley_sub_u_apr),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_apr,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_apr,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_u_apr,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_apr,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in understory April")
####
ggplot(data=na.omit(valley_sub_c_apr),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_apr,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_apr,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_c_apr,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_apr,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in canopy April")
##may
ggplot(data=na.omit(valley_sub_u_may),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_may,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_may,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_u_may,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_may,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory May")
####
ggplot(data=na.omit(valley_sub_c_may),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_may,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_may,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_c_may,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_may,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy May")
##Light
ggplot(data=na.omit(valley_sub_u_may),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_may,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_may,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_u_may,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_may,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in understory May")
####
ggplot(data=na.omit(valley_sub_c_may),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_may,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_may,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_c_may,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_may,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in canopy May")
##jun
ggplot(data=na.omit(valley_sub_u_jun),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_jun,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_jun,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_u_jun,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_jun,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory jun")
####
ggplot(data=na.omit(valley_sub_c_jun),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_jun,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_jun,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_c_jun,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_jun,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy jun")
##Light
ggplot(data=na.omit(valley_sub_u_jun),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_jun,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_jun,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_u_jun,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_jun,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in understory jun")
####
ggplot(data=na.omit(valley_sub_c_jun),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_jun,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_jun,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_c_jun,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_jun,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in canopy jun")
##jul
ggplot(data=na.omit(valley_sub_u_jul),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_jul,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_jul,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_u_jul,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_jul,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory jul")
####
ggplot(data=na.omit(valley_sub_c_jul),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_jul,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_jul,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_c_jul,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_jul,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy jul")
##Light
ggplot(data=na.omit(valley_sub_u_jul),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_jul,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_jul,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_u_jul,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_jul,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in understory jul")
####
ggplot(data=na.omit(valley_sub_c_jul),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_jul,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_jul,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_c_jul,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_jul,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in canopy jul")
##aug
ggplot(data=na.omit(valley_sub_u_aug),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_aug,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_aug,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_u_aug,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_aug,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory aug")
####
ggplot(data=na.omit(valley_sub_c_aug),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_aug,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_aug,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_c_aug,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_aug,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy aug")
##Light
ggplot(data=na.omit(valley_sub_u_aug),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_aug,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_aug,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_u_aug,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_aug,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in understory aug")
####
ggplot(data=na.omit(valley_sub_c_aug),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_aug,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_aug,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_c_aug,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_aug,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in canopy aug")
##sep
ggplot(data=na.omit(valley_sub_u_sep),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_sep,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_sep,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_u_sep,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_sep,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory sep")
####
ggplot(data=na.omit(valley_sub_c_sep),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_sep,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_sep,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_c_sep,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_sep,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy sep")
##Light
ggplot(data=na.omit(valley_sub_u_sep),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_sep,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_sep,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_u_sep,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_sep,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in understory sep")
####
ggplot(data=na.omit(valley_sub_c_sep),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_sep,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_sep,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_c_sep,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_sep,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in canopy sep")
##oct
ggplot(data=na.omit(valley_sub_u_oct),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_oct,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_oct,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_u_oct,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_oct,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory oct")
####
ggplot(data=na.omit(valley_sub_c_oct),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_oct,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_oct,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_c_oct,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_oct,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy oct")
##Light
ggplot(data=na.omit(valley_sub_u_oct),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_oct,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_oct,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_u_oct,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_oct,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in understory oct")
####
ggplot(data=na.omit(valley_sub_c_oct),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_oct,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_oct,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_c_oct,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_oct,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in canopy oct")
##nov
ggplot(data=na.omit(valley_sub_u_nov),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_nov,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_nov,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_u_nov,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_nov,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory nov")
####
ggplot(data=na.omit(valley_sub_c_nov),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_nov,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_nov,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_c_nov,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_nov,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy nov")
##Light
ggplot(data=na.omit(valley_sub_u_nov),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_nov,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_nov,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_u_nov,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_nov,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in understory nov")
####
ggplot(data=na.omit(valley_sub_c_nov),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_nov,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_nov,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_c_nov,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_nov,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in canopy nov")
##dec
ggplot(data=na.omit(valley_sub_u_dec),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_dec,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_dec,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_u_dec,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_dec,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in understory dec")
####
ggplot(data=na.omit(valley_sub_c_dec),aes(x = hour,y=temp_mean))+
  geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
  geom_line(aes(y=temp_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_dec,aes(x=hour,y=temp_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_dec,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="blue")+
  geom_line(data = ridge_sub_c_dec,aes(x=hour,y=temp_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_dec,aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Temperature in canopy dec")
##Light
ggplot(data=na.omit(valley_sub_u_dec),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_u_dec,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_u_dec,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_u_dec,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_u_dec,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in understory dec")
####
ggplot(data=na.omit(valley_sub_c_dec),aes(x = hour,y=light_mean))+
  geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  geom_line(aes(y=light_mean),colour="black",size=1)+
  geom_line(data = edge_sub_c_dec,aes(x=hour,y=light_mean),colour="blue")+
  geom_errorbar(data=edge_sub_c_dec,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="blue")+
  geom_line(data = ridge_sub_c_dec,aes(x=hour,y=light_mean),colour="red")+
  geom_errorbar(data=ridge_sub_c_dec,aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="red")+
  theme_classic()+
  labs(x="Time",y="Light in canopy dec")
