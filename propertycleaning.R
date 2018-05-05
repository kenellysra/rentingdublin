#Property Data Cleaning script
library(dplyr)
library(Amelia)

#set the directory
setwd("C:\\Users\\MOLAP\\Documents\\RentingDublin\\")

#read the csv file
propertydata<-read.csv("propertyfile.csv", na.strings = c(""))

str(propertydata)

# change the column names
names(propertydata)<- c("id","ad_id", "address_line_1", "address_line_2", "area_size","contact_number",
                        "postal_district", "daft_link", "dwelling_type", "facilities","formalised_address",
                        "listing_image", "num_bathrooms","num_bedrooms", "price", "price_change",
                        "price_number", "price_month", "timestamp","town","viewings", "features","agent",
                        "agent_url", "posted_since", "lat", "long", "hash")

head(propertydata)

#remove the column ad_id
propertydata$ad_id<-NULL


#Changing values from NULL to NA 

propertydata[propertydata$address_line_2=="NULL", "address_line_2"] <-c("")

propertydata[propertydata$address_line_1=="NULL", "address_line_1"] <-c("")

propertydata[propertydata$area_size=="NULL", "area_size"] <-c("")

propertydata[propertydata$contact_number=="NULL", "contact_number"] <-c("")

propertydata[propertydata$postal_district=="NULL", "postal_district"] <-c("")

propertydata[propertydata$daft_link=="NULL", "daft_link"] <-c("")

propertydata[propertydata$dwelling_type=="NULL", "dwelling_type"] <-c("")

propertydata[propertydata$facilities=="NULL", "facilities"] <-c("")

propertydata[propertydata$formalised_address=="NULL", "formalised_address"] <-c("")

propertydata[propertydata$listing_image=="NULL", "listing_image"] <-c("")

propertydata[propertydata$num_bathrooms=="NULL", "num_bathrooms"] <-c("")

propertydata[propertydata$num_bedrooms=="NULL", "num_bedrooms"] <-c("")

propertydata[propertydata$price=="NULL", "price"] <-c("")

propertydata[propertydata$price_change=="NULL", "price_change"] <-c("")

propertydata[propertydata$price_number=="NULL", "price_number"] <-c("")

propertydata[propertydata$price_month=="NULL", "price_month"] <-c("")

propertydata[propertydata$timestamp=="NULL", "timestamp"] <-c("")

propertydata[propertydata$town=="NULL", "town"] <-c("")

propertydata[propertydata$viewings=="NULL", "viewings"] <-c("")

propertydata[propertydata$features=="NULL", "features"] <-c("")

propertydata[propertydata$agent=="NULL", "agent"] <-c("")

propertydata[propertydata$agent_url=="NULL", "agent_url"] <-c("")

propertydata[propertydata$posted_since=="NULL", "posted_since"] <-c("")

propertydata[propertydata$lat=="NULL", "lat"] <-c("")

propertydata[propertydata$long=="NULL", "long"] <-c("")

propertydata[propertydata$hash=="NULL", "hash"] <-c("")

#checking the number of missing value for each column
missmap(propertydata, main = "Missing Values vs Observed - Before", y.cex = 0.5, x.cex = 0.7 )


#The columns lat, long, posted_since,features, and contact number is NA for all the rows,
#for this reason, these columns are goint to be removed. Also, the column hash is filed only with brackets
#for this reason, as it not a useful information, is goint to be deleted as well.

propertydata$lat<-NULL
propertydata$long<-NULL
propertydata$hash<-NULL
propertydata$contact_number<-NULL
propertydata$features<-NULL
propertydata$posted_since<-NULL

#For this analysis, the important fields are postal district, number of bedrooms, dwelling_type and price month

#Some postal districts are with wrong values


print(sapply(propertydata, function(x) sum(is.na(x))))

barplot(table(propertydata$postal_district), xlab = "Postal Districts", ylab = "Properties Quantity")

postaldist<-c('Dublin 1', 'Dublin 3', 'Dublin 5', 'Dublin 7', 'Dublin 9',
              
              'Dublin 11', 'Dublin 13', 'Dublin 15', 'Dublin 17',
              'Dublin 2', 'Dublin 4', 'Dublin 6', 'Dublin 6W', 'Dublin 6w', 'Dublin 8',
              
              'Dublin 10', 'Dublin 12', 'Dublin 14', 'Dublin 16','Dublin 18','Dublin 20',
              
              'Dublin 22', 'Dublin 24', 'Co. Dublin')

#postal districts with wrong values
propertydata[!(propertydata$postal_district%in% postaldist),"postal_district"]
str(propertydata)
#checking the town, we cant infer the postal district
propertydata[!(propertydata$postal_district%in% postaldist), "town"]

#checking the address line 1, we can make some assumptions about the postal district
propertydata[!(propertydata$postal_district%in% postaldist), "address_line_1"]

#Then, some postal districts can be filled as following

propertydata[propertydata$postal_district=="Anglesea Road","postal_district"]<-"Dublin 4"

propertydata[propertydata$address_line_1=="Liv Dublin","postal_district"]<-"Dublin 2"

propertydata[propertydata$address_line_1=="Jervis Place","postal_district"]<-"Dublin 1"

propertydata[propertydata$address_line_1=="Nutley Ln" | propertydata$address_line_1== "Finsbury House 79","postal_district"]<-"Dublin 4"

#The lines that we can't infer the region, will be removed

propertydata <- propertydata[(propertydata$postal_district%in% postaldist),]

#checking the outliers
propertydata$price_month <- as.numeric(propertydata$price_month)
min(propertydata$price_month)
max(propertydata$price_month)
str(propertydata)

#Some postal district are with Co. Dublin. (478 records)  We need to split this to the right postal code, north, south or west side.

propertydata[propertydata$postal_district=="Co. Dublin","town"]

dublinwest <- c("Adamstown","Garristown" ,"Lucan", "Rathcoole", "Saggart", "Citywest", "Rush")
dublinnorth <- c("Balbriggan", "Donabate","Kinsealy", "Lusk", "Naul", "Portmarnock", "Skerries")
dublinsouth <- c("Ballybrack", "Blackrock", "Booterstown","Brittas","Cherrywood",  
                 "Dalkey", "Deans Grange","Dun Laoghaire","Glenageary","Killiney", "Kilmacud", 
                 "Monkstown" , "Mount Merrion","Newcastle", "Rathmichael", "Old Connaught",
                 "Sandycove","Sallynoggin", "Stillorgan" )
dublin24 <- c("Balrothery" )
dublin20 <- c("Chapelizod" )
dublin4<-c("Dublin 4" )
dublin8 <- c("Kilmainham")
dublin18 <-c("Loughlinstown")
dublin3<-c("Malahide")
dublin9 <- c("St Margaret'S", "Swords")
dublin11<-c("Ward", "The Ward")
propertydata$postal_district<-as.character(propertydata$postal_district)
propertydata$postal_district[propertydata$town %in% dublinwest]<-"Dublin west-county-dublin"
propertydata$postal_district[propertydata$town %in% dublinnorth]<-"Dublin north-county-dublin"
propertydata$postal_district[propertydata$town %in% dublinsouth]<-"Dublin south-county-dublin"
propertydata$postal_district[propertydata$town %in% dublin24]<-"Dublin 24"
propertydata$postal_district[propertydata$town %in% dublin20]<-"Dublin 20"
propertydata$postal_district[propertydata$town %in% dublin4]<-"Dublin 4"
propertydata$postal_district[propertydata$town %in% dublin8]<-"Dublin 8"
propertydata$postal_district[propertydata$town %in% dublin18]<-"Dublin 18"
propertydata$postal_district[propertydata$town %in% dublin3]<-"Dublin 3"
propertydata$postal_district[propertydata$town %in% dublin9]<-"Dublin 9"
propertydata$postal_district[propertydata$town %in% dublin11]<-"Dublin 11"

#Dublin 6W to Dublin 6w 

propertydata$postal_district<-as.character(propertydata$postal_district)
propertydata$postal_district[propertydata$postal_district=="Dublin 6W"]<-"Dublin 6w"

#the number of bedrooms is NA for some homes, all of them are studios. This way its going to be classified as NA bedrooms, as we
#can assume a studio only have one room, the bedroom is not separeted from the main room.


propertydata[is.na(propertydata$num_bedrooms),"dwelling_type"]
propertydata[is.na(propertydata$num_bedrooms),"num_bedrooms"] <-0
summary(propertydata$num_bedrooms)

#Changing the dwelling type to remove the "to rent" and leave only the property type
propertydata$dwelling_type<-as.character(propertydata$dwelling_type)
propertydata[propertydata$dwelling_type=="Apartment to Rent", "dwelling_type"] <- "Apartment"
propertydata[propertydata$dwelling_type=="Flat to Rent", "dwelling_type"] <- "Flat"
propertydata[propertydata$dwelling_type=="Studio apartment to Rent", "dwelling_type"] <- "Studio"
propertydata[propertydata$dwelling_type=="House to Rent", "dwelling_type"] <- "House"


missmap(propertydata, main = "Missing Values vs Observed - After", y.cex = 0.5, x.cex = 0.7 )
print(sapply(propertydata, function(x) sum(is.na(x))))
barplot(table(propertydata$postal_district), xlab = "Postal Districts", ylab = "Properties Quantity")

write.csv(propertydata, file = "propertycleaned.csv")
