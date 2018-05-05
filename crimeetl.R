library(RCurl)

url <- "http://airo.maynoothuniversity.ie/files/dDATASTORE/crime/garda%20stations/garda_stations.csv"

crimefile<-read.csv(url)

write.csv(crimefile, file = "crimesfile.csv")
