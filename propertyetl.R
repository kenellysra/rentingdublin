#Extraction of daft csv file

library(RCurl)

url <- "https://raw.githubusercontent.com/kenellysra/rentingdublin/master/outputpropertyfile.csv"

propertyfile<-read.csv(url, header = F, na.strings = c(""))

write.csv(propertyfile, file = "propertyfile.csv")
