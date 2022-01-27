# MechaCar_Statistical_Analysis

## Purpose:

## Deliverables:
Deliverable 1: Linear Regression to Predict MPG
Deliverable 2: Summary Statistics on Suspension Coils
Deliverable 3: T-Test on Suspension Coils
Deliverable 4: Design a Study Comparing the MechaCar to the Competition


## Deliverable 1:
The MechaCar_mpg.csv dataset contains mpg test results for 50 prototype MechaCars. The MechaCar prototypes were produced using multiple design specifications to identify ideal vehicle performance. Multiple metrics, such as vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance, were collected for each vehicle. The purpose of this deliverable is to design a linear model that predicts the mpg of MechaCar prototypes using several variables from the MechaCar_mpg.csv file. 

### Linear Regression to Predict MPG

Using RStudio, I ran the following code: 
- `library(dplyr)`
- `car_mpg<- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)`
- `lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=car_mpg)`
- `summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=car_mpg))`

Statistical summary:
![deliv1summary](https://github.com/andreabassetti/MechaCar_Statistical_Analysis/blob/main/png/deliv1summary.png)

Resulting model: mpg = (6.267)vehicle_length + (0.0012)vehicle_weight + (0.0688)spoiler_angle + (3.546)ground_clearance + (-3.411)AWD + (-104.0)

After looking at the output listed above, I can see that:
- Looking at the p-values of the variables we can see that the veichle length and the ground clearance have a very high level of significance, meaning that they most likely are providing a non-random variance. This shows that both of these variables have a significant impact on the miles per gallon in this prototype. On the other hand, veichle wieght, spoiler angle, and AWD have a low level of significance, indicating that there is most likely a random amount of variance with the data set. This shows that these most likely do not have an impact on the miles per callon in thie prototype. 
- The slope of the linear model is not considered to be zero. The p-value is showing an extremel level of significance, especially against the assumer level of significance of 0.05%. 
- The r-squared value for this model is 0.7149, which indicates that 71% of the predictions can be explained by the linear model. The adjusted r-square value is 0.6825, which means that if you adjust for the variables that are not significant only 68% of the predictions can be explained by the linear model. This is moderately effective.

## Deliverable 2
The MechaCar Suspension_Coil.csv dataset contains the results from multiple production lots. In this dataset, the weight capacities of multiple suspension coils were tested to determine if the manufacturing process is consistent across production lots. The purpose of this delivarable is to create a summary statistics table to show:
- The suspension coil’s PSI continuous variable across all manufacturing lots
- The following PSI metrics for each lot: mean, median, variance, and standard deviation.

### Summary Statistics on Suspension Coils
Using RStudio, I ran the following code: 
- `susp_coil<- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F)`
- `total_summary<- susp_coil %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI),Var_PSI=var(PSI),SD_PSI=sd(PSI),.groups = 'keep')`
- `lot_summary<- susp_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI),Var_PSI=var(PSI),SD_PSI=sd(PSI),.groups = 'keep')`

Total summary:

![totalsummary](https://github.com/andreabassetti/MechaCar_Statistical_Analysis/blob/main/png/totalsummary.png)

Lot summary:

![lotsummary](https://github.com/andreabassetti/MechaCar_Statistical_Analysis/blob/main/png/lotsummary.png)

Looking at the total summary table we can see that the variance of the suspension coils is at 62.29 PSI, which is within the desired 100 PSI. When this is broken down by lots, we can see that the variance PSI for lot 1 and 2 is very low and definitely within the the desired 100 PSI. However, lot 3 has a variance of 170.28 PSI which is not within the desired 100 PSI. 

## Deliverable 3
the purpose of this deliverable is to perform t-tests to determine if all manufacturing lots and each lot individually are statistically different from the population mean of 1,500 pounds per square inch.

### T-Tests on Suspension Coils

Using RStudio, I ran the following code: 
- `t.test(susp_coil$PSI,mu=1500)`
- `lot1 <- subset(susp_coil, Manufacturing_Lot=="Lot1")`
- `lot2 <- subset(susp_coil, Manufacturing_Lot=="Lot2")`
- `lot3 <- subset(susp_coil, Manufacturing_Lot=="Lot3")`
- `t.test(lot1$PSI,mu=1500)`
- `t.test(lot2$PSI,mu=1500)`
- `t.test(lot3$PSI,mu=1500)`

Suspension Coil T-test:

![suspcoilttest](https://github.com/andreabassetti/MechaCar_Statistical_Analysis/blob/main/png/suspsoilttest.png)
Lot 1 T-test:

![lot1ttest](https://github.com/andreabassetti/MechaCar_Statistical_Analysis/blob/main/png/lot1ttest.png)
Lot 2 T-test:

![lot2ttest](https://github.com/andreabassetti/MechaCar_Statistical_Analysis/blob/main/png/lot2ttest.png)
Lot 3 T-test:

![lot3ttest](https://github.com/andreabassetti/MechaCar_Statistical_Analysis/blob/main/png/lot3ttest.png)

The t-test is meant to test wheter there is a statistical difference between the mean of two groups. Using the assumed population of 1500, the results of all the t-test can be seen above. The true mean of the sample of all the three lots was 1498.78 with a p-value of 0.06. This is not a statisticlaly significant value, which means we cannot reject the null hypothesis. The three lots therfore have a statistically similar to the presumed populatuion of 1500. The t-test for lot 1 and 2 were a mean of 1550 and p-value of 1 & 1500.02 and p-value of 0.61 respectively. This brings to the same conclusion of the first t-test. The t-test for lot 3 has a sample mean of 1496.14 and a p-value of 0.04. The p-value is showing significance which means we can reject the null hypothesis. 
