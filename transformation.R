# Title     : TODO
# Objective : TODO
# Created by: kenelly
# Created on: 02/04/18


#School Transformation

schooldatat<-read.csv("schoolfilemissval.csv", header = T, na.strings = c(""))
schooldatat$School.Name <- as.character(schooldatat$School.Name)
schooldatat$Address <- as.character(schooldatat$Address)

#Create a ranking from each school based on % of students sent to main colleges

#schoolranking<- (schooldatat$Total.Main.Colleges/schooldatat$Total.Sitting.Leaving)* 100
schooldatat$Rankingyear <-as.integer((schooldatat$Total.Main.Colleges/schooldatat$Total.Sitting.Leaving)* 100)
str(schooldatat)
head(schooldatat)

#How to do THAT - 1 ranking by school (mean of ranking by years by school) create a new field on data frame and
#  fill with the ranking mean?

#meantotal <- aggregate(schooldatat[ , c('Rankingyear')], list(schooldatat$School.Name), mean)

#schooldatat$test[schooldatat$School.Name %in% meantotal$Group.1]<- meantotal$x[meantotal$Group.1]
#str(meantotal)

#creating a new field called ranking category, this field classiy the school in Excellent, Good and Reasonable according to ranking
schooldatat$rankingcateg[schooldatat$Rankingyear>70] <- 'Excellent'
schooldatat$rankingcateg[schooldatat$Rankingyear>=50 & schooldatat$Rankingyear<=70] <-'Good'
schooldatat$rankingcateg[schooldatat$Rankingyear<50]<- 'Reasonable'
schooldatat$rankingcateg<-as.factor(schooldatat$rankingcateg)

northside<- c('Dublin 1', 'Dublin 3', 'Dublin 5', 'Dublin 7', 'Dublin 9',
              'Dublin 11', 'Dublin 13', 'Dublin 15', 'Dublin 17', 'Dublin north-county-dublin')
southside<-c('Dublin 2', 'Dublin 4', 'Dublin 6', 'Dublin 6w', 'Dublin 8',
             'Dublin 10', 'Dublin 12', 'Dublin 14', 'Dublin 16','Dublin 18','Dublin 20',
             'Dublin 22', 'Dublin 24', 'Dublin south-county-dublin')

schooldatat$side[schooldatat$Postal.District %in% northside]<- 'northside'
schooldatat$side[schooldatat$Postal.District %in% southside]<- 'southside'
schooldatat$side[schooldatat$Postal.District == 'Dublin west-county-dublin']<- 'westside'

print(sapply(schooldatat, function(x) sum(is.na(x))))
print(schooldatat[is.na(schooldatat$Rankingyear),])

write.csv(schooldatat, file = "schoolfiletrans.csv")

