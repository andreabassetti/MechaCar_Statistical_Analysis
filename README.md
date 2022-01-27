# MechaCar_Statistical_Analysis

##Purpose:

##Deliverables:
Deliverable 1: Linear Regression to Predict MPG
Deliverable 2: Summary Statistics on Suspension Coils
Deliverable 3: T-Test on Suspension Coils
Deliverable 4: Design a Study Comparing the MechaCar to the Competition


##Deliverable 1:
The MechaCar_mpg.csv dataset contains mpg test results for 50 prototype MechaCars. The MechaCar prototypes were produced using multiple design specifications to identify ideal vehicle performance. Multiple metrics, such as vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance, were collected for each vehicle. The purpose of this deliverable is to design a linear model that predicts the mpg of MechaCar prototypes using several variables from the MechaCar_mpg.csv file. 

### Linear Regression to Predict MPG

Using RStudio, I ran the following code: 
- `library(dplyr)`
- `car_mpg<- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)`
- `lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=car_mpg)`
- `summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=car_mpg))`

Statistical summary:
IMAGE

Resulting model: mpg = (6.267)vehicle_length + (0.0012)vehicle_weight + (0.0688)spoiler_angle + (3.546)ground_clearance + (-3.411)AWD + (-104.0)

After looking at the output listed above, I can see that:
- Looking at the p-values of the variables we can see that the veichle length and the ground clearance have a very high level of significance, meaning that they most likely are providing a non-random variance. This shows that both of these variables have a significant impact on the miles per gallon in this prototype. 
- Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
- Is the slope of the linear model considered to be zero? Why or why not?
- Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
