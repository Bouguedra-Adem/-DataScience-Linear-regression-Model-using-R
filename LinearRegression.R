#importing the dataset

data <- read.csv("Linear regression/Salary_Data.csv")
library(caTools)
library(ggplot2)
set.seed(123)
split=sample.split(data$Salary,,SplitRatio = 2/3)
training_set=subset(data,split==TRUE)
test_set=subset(data,split==FALSE)
#fitting simple linear regression to the dataset

regressor=lm(formula =Salary ~ YearsExperience,data = training_set)
summary(regressor)

#predact salary

y_pred=predict(regressor,newdata =test_set)

#Visualising the training set result
ggplot()+geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary))+
         geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata =training_set)),colour='Blue')+
         ggtitle("Salary Vs YearsExperience")+
         xlab("YearsExperience")+
         ylab("Salary")
