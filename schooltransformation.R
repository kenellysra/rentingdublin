#School Transformation

setwd("C:\\Users\\MOLAP\\Documents\\RentingDublin\\")

schooldatat<-read.csv("schoolcleaned.csv", header = T, na.strings = c(""))

schooldatat$School.Name <- as.character(schooldatat$School.Name)

schooldatat$Address <- as.character(schooldatat$Address)


#Create a ranking from each school based on % of students sent to main colleges
schooldatat$Total.Main.Colleges<-as.numeric(schooldatat$Total.Main.Colleges)
schooldatat$Total.Sitting.Leaving<-as.numeric(schooldatat$Total.Sitting.Leaving)
str(schooldatat)
#Three schools had he sitting leaving equals to zero, for this reason the rows was excluded, because it is understood
#that any student leave the school foar a particular reason.
schooldatat<-(schooldatat[!schooldatat$Total.Sitting.Leaving==0,])
schooldatat$Rankingyear<- as.integer((schooldatat$Total.Main.Colleges/schooldatat$Total.Sitting.Leaving)* 100)

schooldatat$School.Name<-as.factor(schooldatat$School.Name)

#mean of each school ranking

for (school in schooldatat$School.Name){
  meanschool<-tapply(schooldatat$Rankingyear,schooldatat$School.Name == school, mean)
  #meanschool<-as.data.frame(meanschool)
 
  schooldatat$school_ranking[schooldatat$School.Name==school]<-meanschool[2]
  
  }
#removing year and ranking year, as the school should be a unique row with the final ranking
schooldatat$Year<-NULL
schooldatat$Rankingyear<-NULL
schooldatat$Total.Sitting.Leaving<-NULL
schooldatat$Total.Main.Colleges<-NULL

#removing the duplicated rows of schools
schooldatat<-schooldatat[!duplicated(schooldatat$School.Name),]

str(schooldatat)
#creating a new field called ranking category, this field classiy the school in Excellent, Good and Reasonable according to ranking

schooldatat$rankingcateg[schooldatat$school_ranking>70] <- 'Excellent'

schooldatat$rankingcateg[schooldatat$school_ranking>=50 & schooldatat$school_ranking<=70] <-'Good'

schooldatat$rankingcateg[schooldatat$school_ranking<50]<- 'Reasonable'

schooldatat$rankingcateg<-as.factor(schooldatat$rankingcateg)


str(schooldatat)


schooldatat<-schooldatat[,-c(1)]
str(schooldatat)
rownames(schooldatat)<-c(1:nrow(schooldatat))
schooldatat$Address<-NULL

write.csv(schooldatat, file = "schooltransformed.csv")

