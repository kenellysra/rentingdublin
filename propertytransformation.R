#Crime transformation 

#set directory
setwd("C:\\Users\\MOLAP\\Documents\\RentingDublin\\")

#read the csv file
propertydata<-read.csv("propertycleaned.csv", na.strings = c(""))
str(propertydata)

#To this analysis it will be considered the fields id, price month, postal code, number of bedrooms, and dwelling type
propertytransf<-propertydata
propertytransf<-propertytransf[,-c(1)]
propertytransf<-propertytransf[,-c(2:4)]
propertytransf<-propertytransf[,-c(3)]
propertytransf<-propertytransf[,-c(4:7)]
propertytransf<-propertytransf[,-c(5:7)]
propertytransf<-propertytransf[,-c(6:10)]
str(propertytransf)

#checking missing values

#creating the property_size attribute
propertytransf$size[propertytransf$num_bedrooms<=1]<-'Small'
propertytransf$size[propertytransf$num_bedrooms>=2 & propertytransf$num_bedrooms<4]<-'Medium'
propertytransf$size[propertytransf$num_bedrooms>=4]<-'Large'

sum(is.na(propertytransf$size))

propertytransf$size<-as.factor(propertytransf$size)
str(propertytransf)
print(sapply(propertytransf, function(x) sum(is.na(x))))

propertytransf<-propertytransf[,-c(1)]
rownames(propertytransf)<-c(1:nrow(propertytransf))

#write on csv
write.csv(propertytransf, file = "propertytransformed.csv")

