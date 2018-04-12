library(Amelia)
library(dplyr)
library(ggplot2)
library(ggthemes)
library(scales)
library(mice)


schooldata<-read.csv("schoolfile", header = T, na.strings = c(""))
schooldata$Address <- as.character(schooldata$Address)
schooldata$School.Name <-as.character(schooldata$School.Name)

print(sapply(schooldata, function(x) sum(is.na(x))))

str(schooldata)

missmap(schooldata, main = "Missing Values vs Observed") # plot missing values

#GENRE
print(schooldata[is.na(schooldata$Genre),])

schooldata<- schooldata[-c(1190), ] #excluding this line,  because this is school is not open yet

#This graph shows the school genre by postal district
ggplot(schooldata, aes(x= schooldata$Postal.District, fill=factor(schooldata$Genre))) +
    geom_bar(stat = 'count', position = 'dodge') +
    labs(x = 'Postal District') +
    theme_few()

#Analysing the graph, we could see, almost all regions have the 3 kinds of enrolment Girls, Boys and Mixed.
#As the school missing genre value in D18 is boy, we will supose the school is for boys only.

schooldata$Genre[881]<-'Boys'

#As in D2 there is all kinds of genre school, I will suppose the missing one is Mixed,
#because almost all the regions has more mixed school than other types.

schooldata$Genre[41:48]<- 'Mixed'

#FEES

#This graph shows the school fees by postal district
ggplot(schooldata, aes(x= schooldata$Postal.District , fill=factor(schooldata$Fees))) +
    geom_bar(stat = 'count', position = 'dodge') +
    labs(x = 'Postal District') +
    theme_few()

#MICE because its a categorical variable

mice_mode<-mice(schooldata[ , !names(schooldata) %in%
                c('Year', 'Total.Sitting.Leaving', 'Total.Main.Colleges' )], method = 'rf')
mice_output<-complete(mice_mode)
schooldata$Fees<-mice_output$Fees
sum(is.na(schooldata$Fees))

#Year

#14 schools doesnt have any information on progression page. To create a ranking
#from these schools its necessary at least 1 year with the progression information
#So, We are going to input the year 2017 for all 14 schools.

ggplot(schooldata, aes(x= schooldata$Postal.District , fill=factor(schooldata$Year))) +
    geom_bar(stat = 'count', position = 'dodge') +
    labs(x = 'Postal District') +
    theme_few()

print(schooldata[is.na(schooldata$Year),])
schooldata$Year[is.na(schooldata$Year)]<-'2017'

#Total Main Colleges

print(schooldata[is.na(schooldata$Total.Main.Colleges),])
#All the total main collefes missing values doesnt have the Total Sitting Leaving
#as well. So, to predict the total main values its necessary predict first
#the Total Sitting Leaving

mice_mod <- mice(schooldata[ , !names(schooldata) %in% c('School.Name', 'Address')], method = 'rf')
mice_output<- complete(mice_mod)

schooldatamice<-schooldata
schooldatamice$Total.Sitting.Leaving<-mice_output$Total.Sitting.Leaving
schooldatamice$Total.Main.Colleges<-mice_output$Total.Main.Colleges
sum(is.na(schooldata))

#Plots
par(mfrow=c(2,2))
hist(schooldata$Total.Sitting.Leaving, freq = F, main = 'Total Sitting Leaving: Original', col = 'blue', ylim = c(0,0.04))
hist(schooldata$Total.Main.Colleges, freq = F, main = 'Total Main Leaving: Original', col = 'blue', ylim = c(0,0.04))
hist(schooldatamice$Total.Sitting.Leaving, freq = F, main = 'Total Sitting Leaving: Mice', col = 'red', ylim = c(0,0.04))
hist(schooldatamice$Total.Main.Colleges, freq = F, main = 'Total Main Leaving: Mice', col = 'red', ylim = c(0,0.04))

schooldata$Total.Sitting.Leaving<-mice_output$Total.Sitting.Leaving
schooldata$Total.Main.Colleges<-mice_output$Total.Main.Colleges
sum(is.na(schooldata))
print(sapply(schooldata, function(x) sum(is.na(x))))

write.csv(schooldata, file = "schoolfilemissval.csv")