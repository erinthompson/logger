#Imports
library(ggplot2)
library(readr)
library(dplyr)
#Load all files from Erin's computer
all_ibutton <- read_csv("~/Desktop/Ohlone logger data/ibuttons/all ibutton/all_files_ohlone_log_2.CSV")
all_ibutton[9:53]<- NULL
#
#Eliminate bad data and capture in separate dataframe- "bad" data contained within all_ibutton_bad
#
upper_temp <- 60
lower_temp <- -10
all_ibutton_bad<-subset(all_ibutton,all_ibutton$temp<lower_temp|all_ibutton$temp>upper_temp)
all_ibutton <-subset(all_ibutton,all_ibutton$temp>lower_temp&all_ibutton$temp<upper_temp)

# convert our character data to date data- then change to POSIXct data type.
# all_dates <- strptime(all_ibutton$date,format="%m/%d/%Y")
# Data needs to be put into a cosnistant format of %m/%d/%Y before you can coerce it
# into POSIXct, or any other, data otherwise it will spit out errors.

all_ibutton$date <- strptime(all_ibutton$date,format="%m/%d/%Y")
all_ibutton$date <- as.POSIXct(all_ibutton$date)

#Add month category
all_ibutton$month <- format(all_ibutton$date, "%B")

# Create wet and dry season data sets.
# all_ibutton_winter <- subset(all_ibutton,date>="2015-05-01"&date<="2015-12-31"|date>="2016-05-01"&date<="2016-12-31")
# all_ibutton_summer <- subset(all_ibutton,date>="2015-01-01"&date<="2015-4-30"|date>="2016-01-01"&date<="2016-04-30")
# Subset into canopy and understory dataframes, as well as into wet and dry, along with canopy and understory
# categories.
# all_ibutton_c <- subset(all_ibutton,canopy_understory=="c"|canopy_understory=="C")
# all_ibutton_u <- subset(all_ibutton,canopy_understory=="u"|canopy_understory=="U")
# all_ibutton_bad_u  <- subset(all_ibutton_bad,canopy_understory=="u"|canopy_understory=="U")
# all_ibutton_bad_c <-  subset(all_ibutton_bad,canopy_understory=="c"|canopy_understory=="C")
#Ridge canopy understory
#Valley canopy understory
# Issues with valley_u_bad - it doesn't seem to be
# reading in properly.
# valley_c <- subset(valley_la_selva_log,canopy_understory=="c"|canopy_understory=="C")
# valley_u <- subset(valley_la_selva_log,canopy_understory=="u"|canopy_understory=="U")

#Create summary data for each of the regions.
#Persistant issues with ridge_c_bad_summary- it won't load.
#As well as with edge_u_bad_summary. Also doesn't work.
# Create dataframes containing means and standard deviations for every time point. 
#Valley split into canopy and understory
#valley split into winter and summer as well as canopy/understory
# The data called erroneous from valley
# Ridge data split into canopy and understory
#
# The data called erroneous from ridge
#Data from edge split into canopy and understory
# Wet and dry season data
# Data called erroneous from ridge
# All data split into canopy/understory.
# all_ibutton_c_summary <- all_ibutton_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),average = mean(temp,na.rm=TRUE))
# all_ibutton_u_summary <- all_ibutton_u %>% group_by(time)%>%summarise(standard_deviation = sd(temp,na.rm=TRUE),average=mean(temp,na.rm=TRUE)) 
# # Data called erroneous split into canopy/understory
# all_ibutton_u_bad_summary <- all_ibutton_bad_u %>% group_by(time)%>%summarise(standard_deviation = sd(temp,na.rm=TRUE),average=mean(temp,na.rm=TRUE)) 
# all_ibutton_bad_c_summary <- all_ibutton_bad_c %>% group_by(time)%>%summarise(standard_deviation = sd(temp,na.rm=TRUE),average=mean(temp,na.rm=TRUE)) 
# #
# all_ibutton_summer_c_summary <- all_ibutton_summer_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
# all_ibutton_summer_u_summary <- all_ibutton_summer_u %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
# all_ibutton_winter_c_summary <- all_ibutton_winter_c %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
# all_ibutton_winter_u_summary <- all_ibutton_winter_u %>% group_by(time)%>% summarise(standard_deviation = sd(temp,na.rm=TRUE),mean = mean(temp,na.rm=TRUE))
# GGplot
###########
# ggplot(data=all_ibutton_summer_c_summary,aes(x = times,y=means))+
#   geom_errorbar(data=all_ibutton_summer_c_summary,aes(ymin=means-sd,ymax=means+sd),colour="red")+
#   geom_line(aes(y=means),colour="red")+
#   theme_classic()+
#   geom_line(data = valley_c_s_summary,aes(x=times,y=means))+
#   geom_errorbar(data=valley_c_s_summary,aes(ymin=means-sd,ymax=means+sd))+
#   geom_line(data = edge_c_s_summary,aes(x=times,y=means),colour="blue")+
#   geom_errorbar(data=edge_c_s_summary,aes(ymin=means-sd,ymax=means+sd),colour="blue")+
#   labs(x="Time",y="Temperature in canopy during January to April")

#Loopy important bits.
days <- seq(from=as.Date("2016-01-01"), to=as.Date("2016-01-31"),by='days' )
for ( i in seq_along(days) )
{
  print(days[i])
  all_files_i_button_hold <- subset(all_ibutton, all_ibutton$date==days[i] & all_ibutton$canopy_understory=="u")
  all_files_i_button_hold <-all_files_i_button_hold %>% group_by(date,canopy_understory, month,season = ifelse(lubridate::month(date) < 5, 'dry', 'wet'), hour = cut(time, seq(0, 2400, 100), include.lowest = TRUE)) %>% summarise(temp_mean = mean(temp), temp_sd = sd(temp), humidity =mean(humidity), humidity_sd = sd(humidity))
  all_files_i_button_hold$hour <- as.numeric(all_files_i_button_hold$hour)
  
  ### Temp plots
  ggplot(data=(all_files_i_button_hold),aes(x = hour,y=temp_mean))+
    geom_errorbar(aes(ymin=temp_mean-temp_sd,ymax=temp_mean+temp_sd),colour="black")+
    geom_line(aes(y=temp_mean),colour="black",size=1)+
    theme_classic()+coord_cartesian(xlim = c(0, 23),ylim = c(0,50))+
    labs(x="Time",y=paste("Temperature in canopy traps Ohlone", days[i]))
  temp_file_name <- paste(days[i],"temp_all_ohlone.png")
  
  ggsave(temp_file_name, plot = last_plot(), device = "png", path = paste("Desktop/Ohlone logger data/graphs/understory/"), scale = 1, width = NA, height = NA, units = c("in", "cm", "mm"), dpi = 200, limitsize = TRUE)
  # ### Humidity graph
  # # ggplot(data=na.omit(all_files_i_button_hold),aes(x = hour,y=temp_mean))+
  # #   geom_errorbar(aes(ymin=light_mean-light_sd,ymax=light_mean+light_sd),colour="black")+
  # #   geom_line(aes(y=light_mean),colour="black",size=1)+
  # #   theme_classic()+coord_cartesian(xlim = c(0, 23),ylim = c(0,100000))+ 
  # #   labs(x="Time",y=paste("Light in canopy", days[i]))
  # #setup file name to make unique file name for ggsave.
  # light_file_name <- paste(days[i],"light_all_ohline_2016.png")
  # ggsave(light_file_name, device = "png", path = paste("Desktop/Ohlone logger data/graphs"), scale = 1, width = NA, height = NA, units = c("in", "cm", "mm"), dpi = 200, limitsize = TRUE)
}


