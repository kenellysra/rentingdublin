library(Amelia)

library(dplyr)

library(ggplot2)

library(ggthemes)

library(scales)

library(mice)

setwd("C:\\Users\\MOLAP\\Documents\\RentingDublin\\")

schooldata<-read.csv("schoolfile", header = T, na.strings = c(""))

schooldata$Address <- as.character(schooldata$Address)

schooldata$School.Name <-as.character(schooldata$School.Name)


print(sapply(schooldata, function(x) sum(is.na(x))))



str(schooldata)



missmap(schooldata, main = "Missing Values vs Observed - Before") # plot missing values



#GENRE

print(schooldata[is.na(schooldata$Genre),])
#GENRE


schooldata<- schooldata[-c(1190), ] #excluding this line,  because this is school is not open yet



#Analysing the graph, we could see, almost all regions have the 3 kinds of enrolment Girls, Boys and Mixed.

#As the school missing genre value in D18 is boy, we will supose the school is for boys only.

ggplot(schooldata, aes(x= schooldata$Postal.District, fill=factor(schooldata$Genre))) +
  
  geom_bar(stat = 'count', position = 'dodge') +
  
  labs(x = 'Postal District') +
  
  theme_few()

schooldata$Genre[881]<-'Boys'


#As in D2 there is all kinds of genre school, I will suppose the missing one is Mixed,

#because almost all the regions has more mixed school than other types.



schooldata$Genre[41:48]<- 'Mixed'



#FEES


#MICE because its a categorical variable



mice_mode<-mice(schooldata[ , !names(schooldata) %in%
                              
                              c('Year', 'Total.Sitting.Leaving', 'Total.Main.Colleges' )], method = 'rf')

mice_output<-complete(mice_mode)

schooldata$Fees<-mice_output$Fees


#Year



#14 schools doesnt have any information on progression page. To create a ranking

#from these schools its necessary at least 1 year with the progression information

#So, We are going to input the year 2017 for all 14 schools.


schooldata$Year[is.na(schooldata$Year)]<-'2017'

#Total Main Colleges

#All the total main collefes missing values doesnt have the Total Sitting Leaving

#as well. So, to predict the total main values its necessary predict first

#the Total Sitting Leaving

mice_mod <- mice(schooldata[ , !names(schooldata) %in% c('School.Name', 'Address')], method = 'rf')

mice_output<- complete(mice_mod)

schooldatamice<-schooldata

schooldatamice$Total.Sitting.Leaving<-mice_output$Total.Sitting.Leaving

schooldatamice$Total.Main.Colleges<-mice_output$Total.Main.Colleges

schooldata$Total.Sitting.Leaving<-mice_output$Total.Sitting.Leaving

schooldata$Total.Main.Colleges<-mice_output$Total.Main.Colleges
#print(schooldata[schooldata$Total.Sitting.Leaving==0,]$Total.Sitting.Leaving)<-schooldata[schooldata$Total.Main.Colleges

print(sapply(schooldata, function(x) sum(is.na(x))))
str(schooldata)
missmap(schooldata, main = "Missing Values vs Observed - After")
write.csv(schooldata, file = "schoolcleaned.csv")

