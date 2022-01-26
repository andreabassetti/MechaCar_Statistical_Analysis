#Deliverable 1

library(dplyr)
car_mpg<- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=car_mpg)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=car_mpg))

#---------
#Deliverable 2
susp_coil<- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F)
total_summary<- susp_coil %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI),Var_PSI=var(PSI),SD_PSI=sd(PSI),.groups = 'keep')
lot_summary<- susp_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI),Var_PSI=var(PSI),SD_PSI=sd(PSI),.groups = 'keep')

#-------
#Deliv 3 
t.test(susp_coil$PSI,mu=1500)

lot1 <- subset(susp_coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(susp_coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(susp_coil, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)
