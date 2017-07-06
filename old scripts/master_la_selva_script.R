#Can't use boxplot on data with different variable lengths. 
# Edge and valley don't work for some reason.
#> twentyone_edge <- subset(edge_la_selva_log,time>2031&time<2130)
#library(readr)
#valley_la_selva_log <- read_csv("~/Desktop/bioinformatic_work/sorted_by_habitat/valley/valley_la_selva_log.csv")
#View(valley_la_selva_log)

#import  from Erin's computer.
library(readr)
all_files_la_selva_log <- read_csv("Desktop/Ohlone logger data/ibuttons/2015-IX-26 offload/files_to_r/r_OHL_13c_150926.csv")
all_files_la_selva_log <- read_csv("~/Desktop/bioinformatic_work/sorted_by_habitat/ridge/ridge_la_selva_log.csv")
all_files_la_selva_log <- read_csv("~/Desktop/bioinformatic_work/sorted_by_habitat/edge/edge_la_selva_log.csv")
all_files_la_selva_log <- read_csv("~/Desktop/bioinformatic_work/sorted_by_habitat/valley/valley_la_selva_log.csv")




#Convert time to be numeric. 
all_files_la_selva_log$time <- as.numeric(as.character(all_files_la_selva_log$time))
#Remove erroneous temperatures- below 10 or above 50
edge_la_selva_log <- subset(edge_la_selva_log,edge_la_selva_log$temp>10&edge_la_selva_log$temp<50)
valley_la_selva_log <- subset(valley_la_selva_log,valley_la_selva_log$temp>10&valley_la_selva_log$temp<50)
ridge_la_selva_log <- subset(ridge_la_selva_log,ridge_la_selva_log$temp>10&ridge_la_selva_log$temp<50)

#Subset all times such that you have rows for each time.
zero <- subset(all_files_la_selva_log,time>=0&time<30)
zero_c <- subset(zero,canopy_understory=="c"|canopy_understory=="C")
zero_u <- subset(zero,canopy_understory=="u"|canopy_understory=="U")


one <- subset(all_files_la_selva_log,time>31&time<130)
one_c <- subset(one,canopy_understory=="c"|canopy_understory=="C")
one_u <- subset(one,canopy_understory=="u"|canopy_understory=="U")

two <- subset(all_files_la_selva_log,time>131&time<230)
two_c <- subset(two,canopy_understory=="c"|canopy_understory=="C")
two_u <- subset(two,canopy_understory=="u"|canopy_understory=="U")

three <- subset(all_files_la_selva_log,time>231&time<330)
three_c <- subset(three,canopy_understory=="c"|canopy_understory=="C")
three_u <- subset(three,canopy_understory=="u"|canopy_understory=="U")

four <- subset(all_files_la_selva_log,time>331&time<430)
four_c <- subset(four,canopy_understory=="c"|canopy_understory=="C")
four_u <- subset(four,canopy_understory=="u"|canopy_understory=="U")

five <- subset(all_files_la_selva_log,time>431&time<530)
five_c <- subset(five,canopy_understory=="c"|canopy_understory=="C")
five_u <- subset(five,canopy_understory=="u"|canopy_understory=="U")

six <- subset(all_files_la_selva_log,time>531&time<630)
six_c <- subset(six,canopy_understory=="c"|canopy_understory=="C")
six_u <- subset(six,canopy_understory=="u"|canopy_understory=="U")

seven <- subset(all_files_la_selva_log,time>631&time<730)
seven_c <- subset(seven,canopy_understory=="c"|canopy_understory=="C")
seven_u <- subset(seven,canopy_understory=="u"|canopy_understory=="U")

eight <- subset(all_files_la_selva_log,time>731&time<830)
eight_c <- subset(eight,canopy_understory=="c"|canopy_understory=="C")
eight_u <- subset(eight,canopy_understory=="u"|canopy_understory=="U")

nine <- subset(all_files_la_selva_log,time>831&time<930)
nine_c <- subset(nine,canopy_understory=="c"|canopy_understory=="C")
nine_u <- subset(nine,canopy_understory=="u"|canopy_understory=="U")

ten <- subset(all_files_la_selva_log,time>931&time<1030)
ten_c <- subset(ten,canopy_understory=="c"|canopy_understory=="C")
ten_u <- subset(ten,canopy_understory=="u"|canopy_understory=="U")

eleven <- subset(all_files_la_selva_log,time>1031&time<1130)
eleven_c <- subset(eleven,canopy_understory=="c"|canopy_understory=="C")
eleven_u <- subset(eleven,canopy_understory=="u"|canopy_understory=="U")

twelve <- subset(all_files_la_selva_log,time>1131&time<1230)
twelve_c <- subset(twelve,canopy_understory=="c"|canopy_understory=="C")
twelve_u <- subset(twelve,canopy_understory=="u"|canopy_understory=="U")

thirteen <- subset(all_files_la_selva_log,time>1231&time<1330)
thirteen_c <- subset(thirteen,canopy_understory=="c"|canopy_understory=="C")
thirteen_u <- subset(thirteen,canopy_understory=="u"|canopy_understory=="U")

fourteen <- subset(all_files_la_selva_log,time>1331&time<1430)
fourteen_c <- subset(fourteen,canopy_understory=="c"|canopy_understory=="C")
fourteen_u <- subset(fourteen,canopy_understory=="u"|canopy_understory=="U")

fifteen <- subset(all_files_la_selva_log,time>1431&time<1530)
fifteen_c <- subset(fifteen,canopy_understory=="c"|canopy_understory=="C")
fifteen_u <- subset(fifteen,canopy_understory=="u"|canopy_understory=="U")

sixteen <- subset(all_files_la_selva_log,time>1531&time<1630)
sixteen_c <- subset(sixteen,canopy_understory=="c"|canopy_understory=="C")
sixteen_u <- subset(sixteen,canopy_understory=="u"|canopy_understory=="U")

seventeen <- subset(all_files_la_selva_log,time>1631&time<1730)
seventeen_c <- subset(seventeen,canopy_understory=="c"|canopy_understory=="C")
seventeen_u <- subset(seventeen,canopy_understory=="u"|canopy_understory=="U")

eighteen <- subset(all_files_la_selva_log,time>1731&time<1830)
eighteen_c <- subset(eighteen,canopy_understory=="c"|canopy_understory=="C")
eighteen_u <- subset(eighteen,canopy_understory=="u"|canopy_understory=="U")

nineteen <- subset(all_files_la_selva_log,time>1831&time<1930)
nineteen_c <- subset(nineteen,canopy_understory=="c"|canopy_understory=="C")
nineteen_u <- subset(nineteen,canopy_understory=="u"|canopy_understory=="U")

twenty <- subset(all_files_la_selva_log,time>1931&time<2030)
twenty_c <- subset(twenty,canopy_understory=="c"|canopy_understory=="C")
twenty_u <- subset(twenty,canopy_understory=="u"|canopy_understory=="U")

twentyone <- subset(all_files_la_selva_log,time>2031&time<2130)
twentyone_c <- subset(twentyone,canopy_understory=="c"|canopy_understory=="C")
twentyone_u <- subset(twentyone,canopy_understory=="u"|canopy_understory=="U")

twentytwo <- subset(all_files_la_selva_log,time>2130&time<2230)
twentytwo_c <- subset(twentytwo,canopy_understory=="c"|canopy_understory=="C")
twentytwo_u <- subset(twentytwo,canopy_understory=="u"|canopy_understory=="U")

twentythree <- subset(all_files_la_selva_log,time>2231&time<2330)
twentythree_c <- subset(twentythree,canopy_understory=="c"|canopy_understory=="C")
twentythree_u <- subset(twentythree,canopy_understory=="u"|canopy_understory=="U")

twentyfour <- subset(all_files_la_selva_log,time>2331&time<2400)
twentyfour_c <- subset(twentyfour,canopy_understory=="c"|canopy_understory=="C")
twentyfour_u <- subset(twentyfour,canopy_understory=="u"|canopy_understory=="U")


#Convert time to numeric. 
edge_la_selva_log$time <- as.numeric(as.character(edge_la_selva_log$time))
#Subset all times
zero_edge <- subset(edge_la_selva_log,time>=0&time<30)
zero_c_edge <- subset(zero_edge,canopy_understory=="c"|canopy_understory=="C")
zero_u_edge<- subset(zero_edge,canopy_understory=="u"|canopy_understory=="U")


one_edge <- subset(edge_la_selva_log,time>31&time<130)
one_c_edge <- subset(one_edge,canopy_understory=="c"|canopy_understory=="C")
one_u_edge<- subset(one_edge,canopy_understory=="u"|canopy_understory=="U")

two_edge <- subset(edge_la_selva_log,time>131&time<230)
two_c_edge <- subset(two_edge,canopy_understory=="c"|canopy_understory=="C")
two_u_edge<- subset(two_edge,canopy_understory=="u"|canopy_understory=="U")

three_edge <- subset(edge_la_selva_log,time>231&time<330)
three_c_edge <- subset(three_edge,canopy_understory=="c"|canopy_understory=="C")
three_u_edge<- subset(three_edge,canopy_understory=="u"|canopy_understory=="U")

four_edge <- subset(edge_la_selva_log,time>331&time<430)
four_c_edge <- subset(four_edge,canopy_understory=="c"|canopy_understory=="C")
four_u_edge<- subset(four_edge,canopy_understory=="u"|canopy_understory=="U")

five_edge <- subset(edge_la_selva_log,time>431&time<530)
five_c_edge <- subset(five_edge,canopy_understory=="c"|canopy_understory=="C")
five_u_edge<- subset(five_edge,canopy_understory=="u"|canopy_understory=="U")

six_edge <- subset(edge_la_selva_log,time>531&time<630)
six_c_edge <- subset(six_edge,canopy_understory=="c"|canopy_understory=="C")
six_u_edge<- subset(six_edge,canopy_understory=="u"|canopy_understory=="U")

seven_edge <- subset(edge_la_selva_log,time>631&time<730)
seven_c_edge <- subset(seven_edge,canopy_understory=="c"|canopy_understory=="C")
seven_u_edge<- subset(seven_edge,canopy_understory=="u"|canopy_understory=="U")

eight_edge <- subset(edge_la_selva_log,time>731&time<830)
eight_c_edge <- subset(eight_edge,canopy_understory=="c"|canopy_understory=="C")
eight_u_edge<- subset(eight_edge,canopy_understory=="u"|canopy_understory=="U")

nine_edge <- subset(edge_la_selva_log,time>831&time<930)
nine_c_edge <- subset(nine_edge,canopy_understory=="c"|canopy_understory=="C")
nine_u_edge<- subset(nine_edge,canopy_understory=="u"|canopy_understory=="U")

ten_edge <- subset(edge_la_selva_log,time>931&time<1030)
ten_c_edge <- subset(ten_edge,canopy_understory=="c"|canopy_understory=="C")
ten_u_edge<- subset(ten_edge,canopy_understory=="u"|canopy_understory=="U")

eleven_edge <- subset(edge_la_selva_log,time>1031&time<1130)
eleven_c_edge <- subset(eleven_edge,canopy_understory=="c"|canopy_understory=="C")
eleven_u_edge<- subset(eleven_edge,canopy_understory=="u"|canopy_understory=="U")

twelve_edge <- subset(edge_la_selva_log,time>1131&time<1230)
twelve_c_edge <- subset(twelve_edge,canopy_understory=="c"|canopy_understory=="C")
twelve_u_edge<- subset(twelve_edge,canopy_understory=="u"|canopy_understory=="U")

thirteen_edge <- subset(edge_la_selva_log,time>1231&time<1330)
thirteen_c_edge <- subset(thirteen_edge,canopy_understory=="c"|canopy_understory=="C")
thirteen_u_edge<- subset(thirteen_edge,canopy_understory=="u"|canopy_understory=="U")

fourteen_edge <- subset(edge_la_selva_log,time>1331&time<1430)
fourteen_c_edge <- subset(fourteen_edge,canopy_understory=="c"|canopy_understory=="C")
fourteen_u_edge<- subset(fourteen_edge,canopy_understory=="u"|canopy_understory=="U")

fifteen_edge <- subset(edge_la_selva_log,time>1431&time<1530)
fifteen_c_edge <- subset(fifteen_edge,canopy_understory=="c"|canopy_understory=="C")
fifteen_u_edge<- subset(fifteen_edge,canopy_understory=="u"|canopy_understory=="U")

sixteen_edge <- subset(edge_la_selva_log,time>1531&time<1630)
sixteen_c_edge <- subset(sixteen_edge,canopy_understory=="c"|canopy_understory=="C")
sixteen_u_edge<- subset(sixteen_edge,canopy_understory=="u"|canopy_understory=="U")

seventeen_edge <- subset(edge_la_selva_log,time>1631&time<1730)
seventeen_c_edge <- subset(seventeen_edge,canopy_understory=="c"|canopy_understory=="C")
seventeen_u_edge<- subset(seventeen_edge,canopy_understory=="u"|canopy_understory=="U")

eighteen_edge <- subset(edge_la_selva_log,time>1731&time<1830)
eighteen_c_edge <- subset(eighteen_edge,canopy_understory=="c"|canopy_understory=="C")
eighteen_u_edge<- subset(eighteen_edge,canopy_understory=="u"|canopy_understory=="U")

nineteen_edge <- subset(edge_la_selva_log,time>1831&time<1930)
nineteen_c_edge <- subset(nineteen_edge,canopy_understory=="c"|canopy_understory=="C")
nineteen_u_edge<- subset(nineteen_edge,canopy_understory=="u"|canopy_understory=="U")

twenty_edge <- subset(edge_la_selva_log,time>1931&time<2030)
twenty_c_edge <- subset(twenty_edge,canopy_understory=="c"|canopy_understory=="C")
twenty_u_edge<- subset(twenty_edge,canopy_understory=="u"|canopy_understory=="U")

twentyone_edge <- subset(edge_la_selva_log,time>2031&time<2130)
twentyone_c_edge <- subset(twentyone_edge,canopy_understory=="c"|canopy_understory=="C")
twentyone_u_edge<- subset(twentyone_edge,canopy_understory=="u"|canopy_understory=="U")

twentytwo_edge <- subset(edge_la_selva_log,time>2130&time<2230)
twentytwo_c_edge <- subset(twentytwo_edge,canopy_understory=="c"|canopy_understory=="C")
twentytwo_u_edge<- subset(twentytwo_edge,canopy_understory=="u"|canopy_understory=="U")

twentythree_edge <- subset(edge_la_selva_log,time>2231&time<2330)
twentythree_c_edge <- subset(twentythree_edge,canopy_understory=="c"|canopy_understory=="C")
twentythree_u_edge<- subset(twentythree_edge,canopy_understory=="u"|canopy_understory=="U")

twentyfour_edge <- subset(edge_la_selva_log,time>2331&time<2400)
twentyfour_c_edge <- subset(twentyfour_edge,canopy_understory=="c"|canopy_understory=="C")
twentyfour_u_edge<- subset(twentyfour_edge,canopy_understory=="u"|canopy_understory=="U")



#Convert time to numeric. 
ridge_la_selva_log$time <- as.numeric(as.character(ridge_la_selva_log$time))
#Subset all times
zero_ridge <- subset(ridge_la_selva_log,time>=0&time<30)
zero_c_ridge <- subset(zero_ridge,canopy_understory=="c"|canopy_understory=="C")
zero_u_ridge<- subset(zero_ridge,canopy_understory=="u"|canopy_understory=="U")


one_ridge <- subset(ridge_la_selva_log,time>31&time<130)
one_c_ridge <- subset(one_ridge,canopy_understory=="c"|canopy_understory=="C")
one_u_ridge<- subset(one_ridge,canopy_understory=="u"|canopy_understory=="U")

two_ridge <- subset(ridge_la_selva_log,time>131&time<230)
two_c_ridge <- subset(two_ridge,canopy_understory=="c"|canopy_understory=="C")
two_u_ridge<- subset(two_ridge,canopy_understory=="u"|canopy_understory=="U")

three_ridge <- subset(ridge_la_selva_log,time>231&time<330)
three_c_ridge <- subset(three_ridge,canopy_understory=="c"|canopy_understory=="C")
three_u_ridge<- subset(three_ridge,canopy_understory=="u"|canopy_understory=="U")

four_ridge <- subset(ridge_la_selva_log,time>331&time<430)
four_c_ridge <- subset(four_ridge,canopy_understory=="c"|canopy_understory=="C")
four_u_ridge<- subset(four_ridge,canopy_understory=="u"|canopy_understory=="U")

five_ridge <- subset(ridge_la_selva_log,time>431&time<530)
five_c_ridge <- subset(five_ridge,canopy_understory=="c"|canopy_understory=="C")
five_u_ridge<- subset(five_ridge,canopy_understory=="u"|canopy_understory=="U")

six_ridge <- subset(ridge_la_selva_log,time>531&time<630)
six_c_ridge <- subset(six_ridge,canopy_understory=="c"|canopy_understory=="C")
six_u_ridge<- subset(six_ridge,canopy_understory=="u"|canopy_understory=="U")

seven_ridge <- subset(ridge_la_selva_log,time>631&time<730)
seven_c_ridge <- subset(seven_ridge,canopy_understory=="c"|canopy_understory=="C")
seven_u_ridge<- subset(seven_ridge,canopy_understory=="u"|canopy_understory=="U")

eight_ridge <- subset(ridge_la_selva_log,time>731&time<830)
eight_c_ridge <- subset(eight_ridge,canopy_understory=="c"|canopy_understory=="C")
eight_u_ridge<- subset(eight_ridge,canopy_understory=="u"|canopy_understory=="U")

nine_ridge <- subset(ridge_la_selva_log,time>831&time<930)
nine_c_ridge <- subset(nine_ridge,canopy_understory=="c"|canopy_understory=="C")
nine_u_ridge<- subset(nine_ridge,canopy_understory=="u"|canopy_understory=="U")

ten_ridge <- subset(ridge_la_selva_log,time>931&time<1030)
ten_c_ridge <- subset(ten_ridge,canopy_understory=="c"|canopy_understory=="C")
ten_u_ridge<- subset(ten_ridge,canopy_understory=="u"|canopy_understory=="U")

eleven_ridge <- subset(ridge_la_selva_log,time>1031&time<1130)
eleven_c_ridge <- subset(eleven_ridge,canopy_understory=="c"|canopy_understory=="C")
eleven_u_ridge<- subset(eleven_ridge,canopy_understory=="u"|canopy_understory=="U")

twelve_ridge <- subset(ridge_la_selva_log,time>1131&time<1230)
twelve_c_ridge <- subset(twelve_ridge,canopy_understory=="c"|canopy_understory=="C")
twelve_u_ridge<- subset(twelve_ridge,canopy_understory=="u"|canopy_understory=="U")

thirteen_ridge <- subset(ridge_la_selva_log,time>1231&time<1330)
thirteen_c_ridge <- subset(thirteen_ridge,canopy_understory=="c"|canopy_understory=="C")
thirteen_u_ridge<- subset(thirteen_ridge,canopy_understory=="u"|canopy_understory=="U")

fourteen_ridge <- subset(ridge_la_selva_log,time>1331&time<1430)
fourteen_c_ridge <- subset(fourteen_ridge,canopy_understory=="c"|canopy_understory=="C")
fourteen_u_ridge<- subset(fourteen_ridge,canopy_understory=="u"|canopy_understory=="U")

fifteen_ridge <- subset(ridge_la_selva_log,time>1431&time<1530)
fifteen_c_ridge <- subset(fifteen_ridge,canopy_understory=="c"|canopy_understory=="C")
fifteen_u_ridge<- subset(fifteen_ridge,canopy_understory=="u"|canopy_understory=="U")

sixteen_ridge <- subset(ridge_la_selva_log,time>1531&time<1630)
sixteen_c_ridge <- subset(sixteen_ridge,canopy_understory=="c"|canopy_understory=="C")
sixteen_u_ridge<- subset(sixteen_ridge,canopy_understory=="u"|canopy_understory=="U")

seventeen_ridge <- subset(ridge_la_selva_log,time>1631&time<1730)
seventeen_c_ridge <- subset(seventeen_ridge,canopy_understory=="c"|canopy_understory=="C")
seventeen_u_ridge<- subset(seventeen_ridge,canopy_understory=="u"|canopy_understory=="U")

eighteen_ridge <- subset(ridge_la_selva_log,time>1731&time<1830)
eighteen_c_ridge <- subset(eighteen_ridge,canopy_understory=="c"|canopy_understory=="C")
eighteen_u_ridge<- subset(eighteen_ridge,canopy_understory=="u"|canopy_understory=="U")

nineteen_ridge <- subset(ridge_la_selva_log,time>1831&time<1930)
nineteen_c_ridge <- subset(nineteen_ridge,canopy_understory=="c"|canopy_understory=="C")
nineteen_u_ridge<- subset(nineteen_ridge,canopy_understory=="u"|canopy_understory=="U")

twenty_ridge <- subset(ridge_la_selva_log,time>1931&time<2030)
twenty_c_ridge <- subset(twenty_ridge,canopy_understory=="c"|canopy_understory=="C")
twenty_u_ridge<- subset(twenty_ridge,canopy_understory=="u"|canopy_understory=="U")

twentyone_ridge <- subset(ridge_la_selva_log,time>2031&time<2130)
twentyone_c_ridge <- subset(twentyone_ridge,canopy_understory=="c"|canopy_understory=="C")
twentyone_u_ridge<- subset(twentyone_ridge,canopy_understory=="u"|canopy_understory=="U")

twentytwo_ridge <- subset(ridge_la_selva_log,time>2130&time<2230)
twentytwo_c_ridge <- subset(twentytwo_ridge,canopy_understory=="c"|canopy_understory=="C")
twentytwo_u_ridge<- subset(twentytwo_ridge,canopy_understory=="u"|canopy_understory=="U")

twentythree_ridge <- subset(ridge_la_selva_log,time>2231&time<2330)
twentythree_c_ridge <- subset(twentythree_ridge,canopy_understory=="c"|canopy_understory=="C")
twentythree_u_ridge<- subset(twentythree_ridge,canopy_understory=="u"|canopy_understory=="U")

twentyfour_ridge <- subset(ridge_la_selva_log,time>2331&time<2400)
twentyfour_c_ridge <- subset(twentyfour_ridge,canopy_understory=="c"|canopy_understory=="C")
twentyfour_u_ridge<- subset(twentyfour_ridge,canopy_understory=="u"|canopy_understory=="U")

#Convert time to numeric. 
valley_la_selva_log$time <- as.numeric(as.character(valley_la_selva_log$time))
#Subset all times
zero_valley <- subset(valley_la_selva_log,time>=0&time<30)
zero_c_valley <- subset(zero_valley,canopy_understory=="c"|canopy_understory=="C")
zero_u_valley<- subset(zero_valley,canopy_understory=="u"|canopy_understory=="U")


one_valley <- subset(valley_la_selva_log,time>31&time<130)
one_c_valley <- subset(one_valley,canopy_understory=="c"|canopy_understory=="C")
one_u_valley<- subset(one_valley,canopy_understory=="u"|canopy_understory=="U")

two_valley <- subset(valley_la_selva_log,time>131&time<230)
two_c_valley <- subset(two_valley,canopy_understory=="c"|canopy_understory=="C")
two_u_valley<- subset(two_valley,canopy_understory=="u"|canopy_understory=="U")

three_valley <- subset(valley_la_selva_log,time>231&time<330)
three_c_valley <- subset(three_valley,canopy_understory=="c"|canopy_understory=="C")
three_u_valley<- subset(three_valley,canopy_understory=="u"|canopy_understory=="U")

four_valley <- subset(valley_la_selva_log,time>331&time<430)
four_c_valley <- subset(four_valley,canopy_understory=="c"|canopy_understory=="C")
four_u_valley<- subset(four_valley,canopy_understory=="u"|canopy_understory=="U")

five_valley <- subset(valley_la_selva_log,time>431&time<530)
five_c_valley <- subset(five_valley,canopy_understory=="c"|canopy_understory=="C")
five_u_valley<- subset(five_valley,canopy_understory=="u"|canopy_understory=="U")

six_valley <- subset(valley_la_selva_log,time>531&time<630)
six_c_valley <- subset(six_valley,canopy_understory=="c"|canopy_understory=="C")
six_u_valley<- subset(six_valley,canopy_understory=="u"|canopy_understory=="U")

seven_valley <- subset(valley_la_selva_log,time>631&time<730)
seven_c_valley <- subset(seven_valley,canopy_understory=="c"|canopy_understory=="C")
seven_u_valley<- subset(seven_valley,canopy_understory=="u"|canopy_understory=="U")

eight_valley <- subset(valley_la_selva_log,time>731&time<830)
eight_c_valley <- subset(eight_valley,canopy_understory=="c"|canopy_understory=="C")
eight_u_valley<- subset(eight_valley,canopy_understory=="u"|canopy_understory=="U")

nine_valley <- subset(valley_la_selva_log,time>831&time<930)
nine_c_valley <- subset(nine_valley,canopy_understory=="c"|canopy_understory=="C")
nine_u_valley<- subset(nine_valley,canopy_understory=="u"|canopy_understory=="U")

ten_valley <- subset(valley_la_selva_log,time>931&time<1030)
ten_c_valley <- subset(ten_valley,canopy_understory=="c"|canopy_understory=="C")
ten_u_valley<- subset(ten_valley,canopy_understory=="u"|canopy_understory=="U")

eleven_valley <- subset(valley_la_selva_log,time>1031&time<1130)
eleven_c_valley <- subset(eleven_valley,canopy_understory=="c"|canopy_understory=="C")
eleven_u_valley<- subset(eleven_valley,canopy_understory=="u"|canopy_understory=="U")

twelve_valley <- subset(valley_la_selva_log,time>1131&time<1230)
twelve_c_valley <- subset(twelve_valley,canopy_understory=="c"|canopy_understory=="C")
twelve_u_valley<- subset(twelve_valley,canopy_understory=="u"|canopy_understory=="U")

thirteen_valley <- subset(valley_la_selva_log,time>1231&time<1330)
thirteen_c_valley <- subset(thirteen_valley,canopy_understory=="c"|canopy_understory=="C")
thirteen_u_valley<- subset(thirteen_valley,canopy_understory=="u"|canopy_understory=="U")

fourteen_valley <- subset(valley_la_selva_log,time>1331&time<1430)
fourteen_c_valley <- subset(fourteen_valley,canopy_understory=="c"|canopy_understory=="C")
fourteen_u_valley<- subset(fourteen_valley,canopy_understory=="u"|canopy_understory=="U")

fifteen_valley <- subset(valley_la_selva_log,time>1431&time<1530)
fifteen_c_valley <- subset(fifteen_valley,canopy_understory=="c"|canopy_understory=="C")
fifteen_u_valley<- subset(fifteen_valley,canopy_understory=="u"|canopy_understory=="U")

sixteen_valley <- subset(valley_la_selva_log,time>1531&time<1630)
sixteen_c_valley <- subset(sixteen_valley,canopy_understory=="c"|canopy_understory=="C")
sixteen_u_valley<- subset(sixteen_valley,canopy_understory=="u"|canopy_understory=="U")

seventeen_valley <- subset(valley_la_selva_log,time>1631&time<1730)
seventeen_c_valley <- subset(seventeen_valley,canopy_understory=="c"|canopy_understory=="C")
seventeen_u_valley<- subset(seventeen_valley,canopy_understory=="u"|canopy_understory=="U")

eighteen_valley <- subset(valley_la_selva_log,time>1731&time<1830)
eighteen_c_valley <- subset(eighteen_valley,canopy_understory=="c"|canopy_understory=="C")
eighteen_u_valley<- subset(eighteen_valley,canopy_understory=="u"|canopy_understory=="U")

nineteen_valley <- subset(valley_la_selva_log,time>1831&time<1930)
nineteen_c_valley <- subset(nineteen_valley,canopy_understory=="c"|canopy_understory=="C")
nineteen_u_valley<- subset(nineteen_valley,canopy_understory=="u"|canopy_understory=="U")

twenty_valley <- subset(valley_la_selva_log,time>1931&time<2030)
twenty_c_valley <- subset(twenty_valley,canopy_understory=="c"|canopy_understory=="C")
twenty_u_valley<- subset(twenty_valley,canopy_understory=="u"|canopy_understory=="U")

twentyone_valley <- subset(valley_la_selva_log,time>2031&time<2130)
twentyone_c_valley <- subset(twentyone_valley,canopy_understory=="c"|canopy_understory=="C")
twentyone_u_valley<- subset(twentyone_valley,canopy_understory=="u"|canopy_understory=="U")

twentytwo_valley <- subset(valley_la_selva_log,time>2130&time<2230)
twentytwo_c_valley <- subset(twentytwo_valley,canopy_understory=="c"|canopy_understory=="C")
twentytwo_u_valley<- subset(twentytwo_valley,canopy_understory=="u"|canopy_understory=="U")

twentythree_valley <- subset(valley_la_selva_log,time>2231&time<2330)
twentythree_c_valley <- subset(twentythree_valley,canopy_understory=="c"|canopy_understory=="C")
twentythree_u_valley<- subset(twentythree_valley,canopy_understory=="u"|canopy_understory=="U")

twentyfour_valley <- subset(valley_la_selva_log,time>2331&time<2400)
twentyfour_c_valley <- subset(twentyfour_valley,canopy_understory=="c"|canopy_understory=="C")
twentyfour_u_valley<- subset(twentyfour_valley,canopy_understory=="u"|canopy_understory=="U")

#Get average of each time into appropirate dataframe.
edge_c_mean <- c(mean(zero_c_edge$temp),mean(one_c_edge$temp),mean(two_c_edge$temp),mean(three_c_edge$temp),mean(four_c_edge$temp),mean(five_c_edge$temp),mean(six_c_edge$temp),mean(seven_c_edge$temp),mean(eight_c_edge$temp),mean(nine_c_edge$temp),mean(ten_c_edge$temp),mean(eleven_c_edge$temp),mean(twelve_c_edge$temp),mean(thirteen_c_edge$temp),mean(fourteen_c_edge$temp),mean(fifteen_c_edge$temp),mean(sixteen_c_edge$temp),mean(seventeen_c_edge$temp),mean(eighteen_c_edge$temp),mean(nineteen_c_edge$temp),mean(twenty_c_edge$temp),mean(twentyone_c_edge$temp),mean(twentytwo_c_edge$temp),mean(twentythree_c_edge$temp),mean(twentyfour_c_edge$temp))
valley_c_mean <- c(mean(zero_c_valley$temp),mean(one_c_valley$temp),mean(two_c_valley$temp),mean(three_c_valley$temp),mean(four_c_valley$temp),mean(five_c_valley$temp),mean(six_c_valley$temp),mean(seven_c_valley$temp),mean(eight_c_valley$temp),mean(nine_c_valley$temp),mean(ten_c_valley$temp),mean(eleven_c_valley$temp),mean(twelve_c_valley$temp),mean(thirteen_c_valley$temp),mean(fourteen_c_valley$temp),mean(fifteen_c_valley$temp),mean(sixteen_c_valley$temp),mean(seventeen_c_valley$temp),mean(eighteen_c_valley$temp),mean(nineteen_c_valley$temp),mean(twenty_c_valley$temp),mean(twentyone_c_valley$temp),mean(twentytwo_c_valley$temp),mean(twentythree_c_valley$temp),mean(twentyfour_c_valley$temp))
ridge_c_mean <- c(mean(zero_c_ridge$temp),mean(one_c_ridge$temp),mean(two_c_ridge$temp),mean(three_c_ridge$temp),mean(four_c_ridge$temp),mean(five_c_ridge$temp),mean(six_c_ridge$temp),mean(seven_c_ridge$temp),mean(eight_c_ridge$temp),mean(nine_c_ridge$temp),mean(ten_c_ridge$temp),mean(eleven_c_ridge$temp),mean(twelve_c_ridge$temp),mean(thirteen_c_ridge$temp),mean(fourteen_c_ridge$temp),mean(fifteen_c_ridge$temp),mean(sixteen_c_ridge$temp),mean(seventeen_c_ridge$temp),mean(eighteen_c_ridge$temp),mean(nineteen_c_ridge$temp),mean(twenty_c_ridge$temp),mean(twentyone_c_ridge$temp),mean(twentytwo_c_ridge$temp),mean(twentythree_c_ridge$temp),mean(twentyfour_c_ridge$temp))
c_mean <- c(mean(zero_c$temp),mean(one_c$temp),mean(two_c$temp),mean(three_c$temp),mean(four_c$temp),mean(five_c$temp),mean(six_c$temp),mean(seven_c$temp),mean(eight_c$temp),mean(nine_c$temp),mean(ten_c$temp),mean(eleven_c$temp),mean(twelve_c$temp),mean(thirteen_c$temp),mean(fourteen_c$temp),mean(fifteen_c$temp),mean(sixteen_c$temp),mean(seventeen_c$temp),mean(eighteen_c$temp),mean(nineteen_c$temp),mean(twenty_c$temp),mean(twentyone_c$temp),mean(twentytwo_c$temp),mean(twentythree_c$temp),mean(twentyfour_c$temp))

edge_u_mean <- c(mean(zero_u_edge$temp),mean(one_u_edge$temp),mean(two_u_edge$temp),mean(three_u_edge$temp),mean(four_u_edge$temp),mean(five_u_edge$temp),mean(six_u_edge$temp),mean(seven_u_edge$temp),mean(eight_u_edge$temp),mean(nine_u_edge$temp),mean(ten_u_edge$temp),mean(eleven_u_edge$temp),mean(twelve_u_edge$temp),mean(thirteen_u_edge$temp),mean(fourteen_u_edge$temp),mean(fifteen_u_edge$temp),mean(sixteen_u_edge$temp),mean(seventeen_u_edge$temp),mean(eighteen_u_edge$temp),mean(nineteen_u_edge$temp),mean(twenty_u_edge$temp),mean(twentyone_u_edge$temp),mean(twentytwo_u_edge$temp),mean(twentythree_u_edge$temp),mean(twentyfour_u_edge$temp))
valley_u_mean <- c(mean(zero_u_valley$temp),mean(one_u_valley$temp),mean(two_u_valley$temp),mean(three_u_valley$temp),mean(four_u_valley$temp),mean(five_u_valley$temp),mean(six_u_valley$temp),mean(seven_u_valley$temp),mean(eight_u_valley$temp),mean(nine_u_valley$temp),mean(ten_u_valley$temp),mean(eleven_u_valley$temp),mean(twelve_u_valley$temp),mean(thirteen_u_valley$temp),mean(fourteen_u_valley$temp),mean(fifteen_u_valley$temp),mean(sixteen_u_valley$temp),mean(seventeen_u_valley$temp),mean(eighteen_u_valley$temp),mean(nineteen_u_valley$temp),mean(twenty_u_valley$temp),mean(twentyone_u_valley$temp),mean(twentytwo_u_valley$temp),mean(twentythree_u_valley$temp),mean(twentyfour_u_valley$temp))
ridge_u_mean <- c(mean(zero_u_ridge$temp),mean(one_u_ridge$temp),mean(two_u_ridge$temp),mean(three_u_ridge$temp),mean(four_u_ridge$temp),mean(five_u_ridge$temp),mean(six_u_ridge$temp),mean(seven_u_ridge$temp),mean(eight_u_ridge$temp),mean(nine_u_ridge$temp),mean(ten_u_ridge$temp),mean(eleven_u_ridge$temp),mean(twelve_u_ridge$temp),mean(thirteen_u_ridge$temp),mean(fourteen_u_ridge$temp),mean(fifteen_u_ridge$temp),mean(sixteen_u_ridge$temp),mean(seventeen_u_ridge$temp),mean(eighteen_u_ridge$temp),mean(nineteen_u_ridge$temp),mean(twenty_u_ridge$temp),mean(twentyone_u_ridge$temp),mean(twentytwo_u_ridge$temp),mean(twentythree_u_ridge$temp),mean(twentyfour_u_ridge$temp))
u_mean <- c(mean(zero_u$temp),mean(one_u$temp),mean(two_u$temp),mean(three_u$temp),mean(four_u$temp),mean(five_u$temp),mean(six_u$temp),mean(seven_u$temp),mean(eight_u$temp),mean(nine_u$temp),mean(ten_u$temp),mean(eleven_u$temp),mean(twelve_u$temp),mean(thirteen_u$temp),mean(fourteen_u$temp),mean(fifteen_u$temp),mean(sixteen_u$temp),mean(seventeen_u$temp),mean(eighteen_u$temp),mean(nineteen_u$temp),mean(twenty_u$temp),mean(twentyone_u$temp),mean(twentytwo_u$temp),mean(twentythree_u$temp),mean(twentyfour_u$temp))

edge_c_summary <- merge(edge_c_mean,edge_c_sd,by=0)
valley_c_summary <- merge(valley_c_mean,valley_c_sd,by=0)
ridge_c_summary <- merge(ridge_c_mean,ridge_c_sd,by=0)
c_summary <- merge(c_mean,c_summary,by=0)


edge_u_summary <- merge(edge_u_mean,edge_u_sd,by=0)
valley_u_summary <- merge(valley_u_mean,valley_u_sd,by=0)
ridge_u_summary <- merge(ridge_u_mean,ridge_u_sd,by=0)
u_summary <- merge(u_mean,u_sd,by=0)





#Plot the data. 
x <- c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24)
#x <- c(0)
y1 <- edge_u_mean
y2 <- ridge_u_mean
y3 <- valley_u_mean
y4 <- u_mean
sdev <- edge_c_summary

plot(x,y1,type="p",col="red",xlab = "Understory conditions in edge, ridge, and valley habitats",ylab="Average temperature")
lines(x,y2,col="green",type="p")
lines(x,y3,col="black",type="p")

#Attempt to plot using error bars
avg <- edge_c_summary[2]
sdev <- edge_c_summary[3]
#View(avg)
avg.length
plot(x, avg,
     ylim=range(c(avg-sdev, avg+sdev)),
     pch=19, xlab="Measurements", ylab="Mean +/- SD",
     main="Scatter plot with std.dev error bars"
)
# hack: we draw arrows but with very special "arrowheads"
arrows(x, avg-sdev, x, avg+sdev, length=0.05, angle=90, code=3)

#lines(x,y4,col="blue",type="p")
x <- c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24)
y5 <- edge_c_mean
y6 <- ridge_c_mean
y7 <- valley_c_mean
y8 <- c_mean
plot(x,y5,type="l",col="red",xlab="Canopy conditions in edge, ridge, and valley habitats",ylab="Average temperature")
lines(x,y6,col="green")
lines(x,y7,col="black")
lines(x,y8,col="yellow")

