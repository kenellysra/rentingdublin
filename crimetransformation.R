#Crime Transformation data set

#Setting directory
setwd("C:\\Users\\MOLAP\\Documents\\RentingDublin\\")

#Reading csv
crimetransf<-read.csv("crimecleaned.csv", header = T, na.strings = c(""))


#creating the postal district column based on the garda station
Dublin1<-c('Store Street', 'Mountjoy', 'Fitzgibbon Street')
Dublinnorth<-c('Swords', 'Skerries', 'Malahide',  'Lusk', 'Garristown', 'Dublin Airport', 
               'Balbriggan', 'Ballymun')
Dublinsouth<-c('Dun Laoghaire', 'Blackrock Co Dublin')
Dublinwest<-c('Rathcoole', 'Lucan')


crimetransf$PostalDistrict[crimetransf$Station %in% Dublin1]<- 'Dublin 1'
crimetransf$PostalDistrict[crimetransf$Station == 'Pearse Street']<- 'Dublin 2'
crimetransf$PostalDistrict[crimetransf$Station == 'Clontarf']<- 'Dublin 3'
crimetransf$PostalDistrict[crimetransf$Station == 'Donnybrook'| crimetransf$Station =='Irishtown']<- 'Dublin 4'
crimetransf$PostalDistrict[crimetransf$Station == 'Raheny']<- 'Dublin 5'
crimetransf$PostalDistrict[crimetransf$Station == 'Terenure']<- 'Dublin 6w'
crimetransf$PostalDistrict[crimetransf$Station == 'Rathmines']<- 'Dublin 6'
crimetransf$PostalDistrict[crimetransf$Station == 'Cabra' | crimetransf$Station == 'Bridewell Dublin']<- 'Dublin 7'
crimetransf$PostalDistrict[crimetransf$Station == 'Kilmainham' | crimetransf$Station == 'Kevin Street']<- 'Dublin 8'
crimetransf$PostalDistrict[crimetransf$Station == 'Santry']<- 'Dublin 9'
crimetransf$PostalDistrict[crimetransf$Station == 'Ballyfermot']<- 'Dublin 10'
crimetransf$PostalDistrict[crimetransf$Station == 'Finglas']<- 'Dublin 11'
crimetransf$PostalDistrict[crimetransf$Station == 'Sundrive Road' | crimetransf$Station == 'Crumlin']<- 'Dublin 12'
crimetransf$PostalDistrict[crimetransf$Station == 'Howth']<- 'Dublin 13'
crimetransf$PostalDistrict[crimetransf$Station == 'Rathfarnham' | crimetransf$Station == 'Dundrum']<- 'Dublin 14'
crimetransf$PostalDistrict[crimetransf$Station == 'Blanchardstown']<- 'Dublin 15'
crimetransf$PostalDistrict[crimetransf$Station == 'Coolock']<- 'Dublin 17'
crimetransf$PostalDistrict[crimetransf$Station == 'Shankill' | crimetransf$Station == 'Cabinteely']<- 'Dublin 18'
crimetransf$PostalDistrict[crimetransf$Station == 'Ronanstown' | crimetransf$Station == 'Clondalkin']<- 'Dublin 22'
crimetransf$PostalDistrict[crimetransf$Station == 'Tallaght']<- 'Dublin 24'
crimetransf$PostalDistrict[crimetransf$Station %in% Dublinnorth]<- 'Dublin north-county-dublin'
crimetransf$PostalDistrict[crimetransf$Station %in% Dublinsouth]<- 'Dublin south-county-dublin'
crimetransf$PostalDistrict[crimetransf$Station %in% Dublinwest]<- 'Dublin west-county-dublin'


for (postal in crimetransf$PostalDistrict){
  meanscrime<-tapply(crimetransf$quantity,crimetransf$PostalDistrict == postal, mean)
  crimetransf$crime_avg[crimetransf$PostalDistrict == postal]<-meanscrime[2]
  
}

crimetransf$level[crimetransf$crime_avg<=100]<-"Low"
crimetransf$level[crimetransf$crime_avg>100 & crimetransf$crime_avg<300]<-"Regular"
crimetransf$level[crimetransf$crime_avg>=300]<-"High"

crimetransf[is.na(crimetransf$PostalDistrict),"Station"]
print(sapply(crimetransf, function(x) sum(is.na(x))))

str(crimetransf)

#To build the dimension table for this data source, we only need: id, crime type
#crime level, garda station and garda division, postal district, side, and city

crimetransf<-crimetransf[,-c(1:3)]
crimetransf<-crimetransf[,-c(9)]
rownames(crimetransf)<-c(1:nrow(crimetransf))



str(crimetransf)

write.csv(crimetransf, file = "crimetransformed.csv")
