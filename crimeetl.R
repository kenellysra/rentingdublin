# Title     : TODO
# Objective : TODO
# Created by: kenelly
# Created on: 04/04/18

library(RCurl)

url <- "http://airo.maynoothuniversity.ie/files/dDATASTORE/crime/garda%20stations/garda_stations.csv"

crimefile<-read.csv(url)


#Removing stations different of Dublin

dublinstations<-c(' D.M.R. Northern Division', ' D.M.R. Western Division',
    ' D.M.R. Southern Division', ' D.M.R. North Central Division', ' D.M.R. Eastern Division',' D.M.R. South Central Division')

crimesdataorig<-crimefile[crimefile$Divisions %in% dublinstations,]
crimesdatatrans<-crimefile[crimefile$Divisions %in% dublinstations,]


crimesdataorig[,6:172]<-NULL


crimesdata12004<-crimesdataorig
crimesdata12004$type <-'Attempts or threats to murder, assaults, harassments and related offences'
crimesdata12004$year<-'2004'
crimesdata12004$quant<- crimesdatatrans$Attempts.or.threats.to.murder..assaults..harassments.and.related.offences.2004

crimesdata12005<-crimesdataorig
crimesdata12005$type<-'Attempts or threats to murder, assaults, harassments and related offences'
crimesdata12005$year<-'2005'
crimesdata12005$quant<-crimesdatatrans$Attempts.or.threats.to.murder..assaults..harassments.and.related.offences.2005

crimesdata12006<-crimesdataorig
crimesdata12006$type <-'Attempts or threats to murder, assaults, harassments and related offences'
crimesdata12006$year <-'2006'
crimesdata12006$quant<- crimesdatatrans$Attempts.or.threats.to.murder..assaults..harassments.and.related.offences.2006

crimesdata12007<-crimesdataorig
crimesdata12007$type <-'Attempts or threats to murder, assaults, harassments and related offences'
crimesdata12007$year <- '2007'
crimesdata12007$quant<- crimesdatatrans$Attempts.or.threats.to.murder..assaults..harassments.and.related.offences.2007

crimesdata12008<-crimesdataorig
crimesdata12008$type <-'Attempts or threats to murder, assaults, harassments and related offences'
crimesdata12008$year <-'2008'
crimesdata12008$quant<- crimesdatatrans$Attempts.or.threats.to.murder..assaults..harassments.and.related.offences.2008

crimesdata12009<-crimesdataorig
crimesdata12009$type <-'Attempts or threats to murder, assaults, harassments and related offences'
crimesdata12009$year <-'2009'
crimesdata12009$quant<- crimesdatatrans$Attempts.or.threats.to.murder..assaults..harassments.and.related.offences.2009

crimesdata12010<-crimesdataorig
crimesdata12010$type <-'Attempts or threats to murder, assaults, harassments and related offences'
crimesdata12010$year <-'2010'
crimesdata12010$quant<- crimesdatatrans$Attempts.or.threats.to.murder..assaults..harassments.and.related.offences.2010

crimesdata12011<-crimesdataorig
crimesdata12011$type <-'Attempts or threats to murder, assaults, harassments and related offences'
crimesdata12011$year <-'2011'
crimesdata12011$quant<- crimesdatatrans$Attempts.or.threats.to.murder..assaults..harassments.and.related.offences.2011

crimesdata12012<-crimesdataorig
crimesdata12012$type <-'Attempts or threats to murder, assaults, harassments and related offences'
crimesdata12012$year <- '2012'
crimesdata12012$quant<- crimesdatatrans$Attempts.or.threats.to.murder..assaults..harassments.and.related.offences.2012

crimesdata12013<-crimesdataorig
crimesdata12013$type <-'Attempts or threats to murder, assaults, harassments and related offences'
crimesdata12013$year <- '2013'
crimesdata12013$quant<- crimesdatatrans$Attempts.or.threats.to.murder..assaults..harassments.and.related.offences.2013

crimesdata12014<-crimesdataorig
crimesdata12014$type <-'Attempts or threats to murder, assaults, harassments and related offences'
crimesdata12014$year <- '2014'
crimesdata12014$quant<- crimesdatatrans$Attempts.or.threats.to.murder..assaults..harassments.and.related.offences.2014

crimesdata12015<-crimesdataorig
crimesdata12015$type <-'Attempts or threats to murder, assaults, harassments and related offences'
crimesdata12015$year <- '2015'
crimesdata12015$quant<- crimesdatatrans$Attempts.or.threats.to.murder..assaults..harassments.and.related.offences.2015

crimeAttempts <- rbind(crimesdata12004, crimesdata12005, crimesdata12006, crimesdata12007, crimesdata12008, crimesdata12009, crimesdata12010, crimesdata12011, crimesdata12012, crimesdata12013, crimesdata12014, crimesdata12015)
crimeAttempts$level <-'high crime'


#Dangerous or negligent acts

crimesdata22003<-crimesdataorig
crimesdata22003$type <-'Dangerous or negligent acts'
crimesdata22003$year <- '2003'
crimesdata22003$quant<- crimesdatatrans$Dangerous.or.negligent.acts.2003

crimesdata22004<-crimesdataorig
crimesdata22004$type <-'Dangerous or negligent acts'
crimesdata22004$year <- '2004'
crimesdata22004$quant<- crimesdatatrans$Dangerous.or.negligent.acts.2004

crimesdata22005<-crimesdataorig
crimesdata22005$type <-'Dangerous or negligent acts'
crimesdata22005$year <-'2005'
crimesdata22005$quant<- crimesdatatrans$Dangerous.or.negligent.acts.2005

crimesdata22006<-crimesdataorig
crimesdata22006$type <-'Dangerous or negligent acts'
crimesdata22006$year <-'2006'
crimesdata22006$quant<- crimesdatatrans$Dangerous.or.negligent.acts.2006

crimesdata22007<-crimesdataorig
crimesdata22007$type <-'Dangerous or negligent acts'
crimesdata22007$year <-'2007'
crimesdata22007$quant<- crimesdatatrans$Dangerous.or.negligent.acts.2007

crimesdata22008<-crimesdataorig
crimesdata22008$type <-'Dangerous or negligent acts'
crimesdata22008$year <- '2008'
crimesdata22008$quant<- crimesdatatrans$Dangerous.or.negligent.acts.2008

crimesdata22009<-crimesdataorig
crimesdata22009$type <-'Dangerous or negligent acts'
crimesdata22009$year <- '2009'
crimesdata22009$quant<- crimesdatatrans$Dangerous.or.negligent.acts.2009

crimesdata22010<-crimesdataorig
crimesdata22010$type <-'Dangerous or negligent acts'
crimesdata22010$year <- '2010'
crimesdata22010$quant<- crimesdatatrans$Dangerous.or.negligent.acts.2010

crimesdata22011<-crimesdataorig
crimesdata22011$type <-'Dangerous or negligent acts'
crimesdata22011$year <-'2011'
crimesdata22011$quant<- crimesdatatrans$Dangerous.or.negligent.acts.2011

crimesdata22012<-crimesdataorig
crimesdata22012$type <-'Dangerous or negligent acts'
crimesdata22012$year <-'2012'
crimesdata22012$quant<- crimesdatatrans$Dangerous.or.negligent.acts.2012

crimesdata22013<-crimesdataorig
crimesdata22013$type <-'Dangerous or negligent acts'
crimesdata22013$year <-'2013'
crimesdata22013$quant<- crimesdatatrans$Dangerous.or.negligent.acts.2013

crimesdata22014<-crimesdataorig
crimesdata22014$type <-'Dangerous or negligent acts'
crimesdata22014$year <-'2014'
crimesdata22014$quant<- crimesdatatrans$Dangerous.or.negligent.acts.2014

crimesdata22015<-crimesdataorig
crimesdata22015$type <-'Dangerous or negligent acts'
crimesdata22015$year <-'2015'
crimesdata22015$quant<- crimesdatatrans$Dangerous.or.negligent.acts.2015

crimeDangerous <- rbind(crimesdata22003, crimesdata22004, crimesdata22005, crimesdata22006, crimesdata22007, crimesdata22008, crimesdata22009,
                        crimesdata22010, crimesdata22011, crimesdata22012, crimesdata22013, crimesdata22014, crimesdata22015)

crimeDangerous$level<-'minor crime'


# Kidnapping and related offences
crimesdata32003<-crimesdataorig
crimesdata32003$type <-'Kidnapping and related offences'
crimesdata32003$year <-'2003'
crimesdata32003$quant<- crimesdatatrans$Kidnapping.and.related.offences.2003

crimesdata32004<-crimesdataorig
crimesdata32004$type <-'Kidnapping and related offences'
crimesdata32004$year <- '2004'
crimesdata32004$quant<- crimesdatatrans$Kidnapping.and.related.offences.2004

crimesdata32005<-crimesdataorig
crimesdata32005$type <-'Kidnapping and related offences'
crimesdata32005$year <-'2005'
crimesdata32005$quant<- crimesdatatrans$Kidnapping.and.related.offences.2005

crimesdata32006<-crimesdataorig
crimesdata32006$type <-'Kidnapping and related offences'
crimesdata32006$year <-'2006'
crimesdata32006$quant<- crimesdatatrans$Kidnapping.and.related.offences.2006

crimesdata32007<-crimesdataorig
crimesdata32007$type <-'Kidnapping and related offences'
crimesdata32007$year <-'2007'
crimesdata32007$quant<- crimesdatatrans$Kidnapping.and.related.offences.2007

crimesdata32008<-crimesdataorig
crimesdata32008$type <-'Kidnapping and related offences'
crimesdata32008$year <- '2008'
crimesdata32008$quant<- crimesdatatrans$Kidnapping.and.related.offences.2008

crimesdata32009<-crimesdataorig
crimesdata32009$type <-'Kidnapping and related offences'
crimesdata32009$year <-'2009'
crimesdata32009$quant<- crimesdatatrans$Kidnapping.and.related.offences.2009

crimesdata32010<-crimesdataorig
crimesdata32010$type <-'Kidnapping and related offences'
crimesdata32010$year <- '2010'
crimesdata32010$quant<- crimesdatatrans$Kidnapping.and.related.offences.2010

crimesdata32011<-crimesdataorig
crimesdata32011$type <-'Kidnapping and related offences'
crimesdata32011$year <-'2011'
crimesdata32011$quant<- crimesdatatrans$Kidnapping.and.related.offences.2011

crimesdata32012<-crimesdataorig
crimesdata32012$type <-'Kidnapping and related offences'
crimesdata32012$year <-'2012'
crimesdata32012$quant<- crimesdatatrans$Kidnapping.and.related.offences.2012

crimesdata32013<-crimesdataorig
crimesdata32013$type <-'Kidnapping and related offences'
crimesdata32013$year <-'2013'
crimesdata32013$quant<- crimesdatatrans$Kidnapping.and.related.offences.2013

crimesdata32014<-crimesdataorig
crimesdata32014$type <-'Kidnapping and related offences'
crimesdata32014$year<-'2014'
crimesdata32014$quant<- crimesdatatrans$Kidnapping.and.related.offences.2014

crimesdata32015<-crimesdataorig
crimesdata32015$type <-'Kidnapping and related offences'
crimesdata32015$year <-'2015'
crimesdata32015$quant<- crimesdatatrans$Kidnapping.and.related.offences.2015

crimeKidnapping <- rbind(crimesdata32003, crimesdata32004, crimesdata32005, crimesdata32006, crimesdata32007, crimesdata32008, crimesdata32009,
                         crimesdata32010, crimesdata32011, crimesdata32012, crimesdata32013, crimesdata32014, crimesdata32015)
crimeKidnapping$level<-'high crime'


#Robbery, extortion and hijacking offences

crimesdata42003<-crimesdataorig
crimesdata42003$type <-'Robbery, extortion and hijacking offences'
crimesdata42003$year <- '2003'
crimesdata42003$quant<- crimesdatatrans$Robbery..extortion.and.hijacking.offences.2003

crimesdata42004<-crimesdataorig
crimesdata42004$type <-'Robbery, extortion and hijacking offences'
crimesdata42004$year <- '2004'
crimesdata42004$quant<- crimesdatatrans$Robbery..extortion.and.hijacking.offences.2004

crimesdata42005<-crimesdataorig
crimesdata42005$type <-'Robbery, extortion and hijacking offences'
crimesdata42005$year<- '2005'
crimesdata42005$quant<- crimesdatatrans$Robbery..extortion.and.hijacking.offences.2005

crimesdata42006<-crimesdataorig
crimesdata42006$type <-'Robbery, extortion and hijacking offences'
crimesdata42006$year <-'2006'
crimesdata42006$quant<- crimesdatatrans$Robbery..extortion.and.hijacking.offences.2006

crimesdata42007<-crimesdataorig
crimesdata42007$type <-'Robbery, extortion and hijacking offences'
crimesdata42007$year <-'2007'
crimesdata42007$quant<- crimesdatatrans$Robbery..extortion.and.hijacking.offences.2007

crimesdata42008<-crimesdataorig
crimesdata42008$type <-'Robbery, extortion and hijacking offences'
crimesdata42008$year<-'2008'
crimesdata42008$quant<- crimesdatatrans$Robbery..extortion.and.hijacking.offences.2008

crimesdata42009<-crimesdataorig
crimesdata42009$type <-'Robbery, extortion and hijacking offences'
crimesdata42009$year <-'2009'
crimesdata42009$quant<- crimesdatatrans$Robbery..extortion.and.hijacking.offences.2009

crimesdata42010<-crimesdataorig
crimesdata42010$type <-'Robbery, extortion and hijacking offences'
crimesdata42010$year <-'2010'
crimesdata42010$quant<- crimesdatatrans$Robbery..extortion.and.hijacking.offences.2010

crimesdata42011<-crimesdataorig
crimesdata42011$type <-'Robbery, extortion and hijacking offences'
crimesdata42011$year <-'2011'
crimesdata42011$quant<- crimesdatatrans$Robbery..extortion.and.hijacking.offences.2011

crimesdata42012<-crimesdataorig
crimesdata42012$type <-'Robbery, extortion and hijacking offences'
crimesdata42012$year <- '2012'
crimesdata42012$quant<- crimesdatatrans$Robbery..extortion.and.hijacking.offences.2012

crimesdata42013<-crimesdataorig
crimesdata42013$type <-'Robbery, extortion and hijacking offences'
crimesdata42013$year <- '2013'
crimesdata42013$quant<- crimesdatatrans$Robbery..extortion.and.hijacking.offences.2013

crimesdata42014<-crimesdataorig
crimesdata42014$type <-'Robbery, extortion and hijacking offences'
crimesdata42014$year<- '2014'
crimesdata42014$quant<- crimesdatatrans$Robbery..extortion.and.hijacking.offences.2014

crimesdata42015<-crimesdataorig
crimesdata42015$type <-'Robbery, extortion and hijacking offences'
crimesdata42015$year<-'2015'
crimesdata42015$quant<- crimesdatatrans$Robbery..extortion.and.hijacking.offences.2015

crimeRobbery<- rbind(crimesdata42003, crimesdata42004, crimesdata42005, crimesdata42006, crimesdata42007, crimesdata42008, crimesdata42009,
                     crimesdata42010, crimesdata42011, crimesdata42012, crimesdata42013, crimesdata42014, crimesdata42015)

crimeRobbery$level<- 'high crime'



#Burglary and related offences

crimesdata52003<-crimesdataorig
crimesdata52003$type <-'Burglary and related offences'
crimesdata52003$year <-'2003'
crimesdata52003$quant<- crimesdatatrans$Burglary.and.related.offences.2003

crimesdata52004<-crimesdataorig
crimesdata52004$type <-'Burglary and related offences'
crimesdata52004$year<-'2004'
crimesdata52004$quant<- crimesdatatrans$Burglary.and.related.offences.2004

crimesdata52005<-crimesdataorig
crimesdata52005$type <-'Burglary and related offences'
crimesdata52005$year <-'2005'
crimesdata52005$quant<- crimesdatatrans$Burglary.and.related.offences.2005

crimesdata52006<-crimesdataorig
crimesdata52006$type <-'Burglary and related offences'
crimesdata52006$year <-'2006'
crimesdata52006$quant<- crimesdatatrans$Burglary.and.related.offences.2006

crimesdata52007<-crimesdataorig
crimesdata52007$type <-'Burglary and related offences'
crimesdata52007$year <-'2007'
crimesdata52007$quant<- crimesdatatrans$Burglary.and.related.offences.2007

crimesdata52008<-crimesdataorig
crimesdata52008$type <-'Burglary and related offences'
crimesdata52008$year <-'2008'
crimesdata52008$quant<- crimesdatatrans$Burglary.and.related.offences.2008

crimesdata52009<-crimesdataorig
crimesdata52009$type <-'Burglary and related offences'
crimesdata52009$year <- '2009'
crimesdata52009$quant<- crimesdatatrans$Burglary.and.related.offences.2009

crimesdata52010<-crimesdataorig
crimesdata52010$type <-'Burglary and related offences'
crimesdata52010$year<-'2010'
crimesdata52010$quant<- crimesdatatrans$Burglary.and.related.offences.2010

crimesdata52011<-crimesdataorig
crimesdata52011$type <-'Burglary and related offences'
crimesdata52011$year <-'2011'
crimesdata52011$quant<- crimesdatatrans$Burglary.and.related.offences.2011

crimesdata52012<-crimesdataorig
crimesdata52012$type <-'Burglary and related offences'
crimesdata52012$year<-'2012'
crimesdata52012$quant<- crimesdatatrans$Burglary.and.related.offences.2012

crimesdata52013<-crimesdataorig
crimesdata52013$type <-'Burglary and related offences'
crimesdata52013$year <-'2013'
crimesdata52013$quant<- crimesdatatrans$Burglary.and.related.offences.2013

crimesdata52014<-crimesdataorig
crimesdata52014$type <-'Burglary and related offences'
crimesdata52014$year <-'2014'
crimesdata52014$quant<- crimesdatatrans$Burglary.and.related.offences.2014

crimesdata52015<-crimesdataorig
crimesdata52015$type <-'Burglary and related offences'
crimesdata52015$year <-'2015'
crimesdata52015$quant<- crimesdatatrans$Burglary.and.related.offences.2015

crimeBurglary <- rbind(crimesdata52003, crimesdata52004, crimesdata52005, crimesdata52006, crimesdata52007, crimesdata52008, crimesdata52009,
                       crimesdata52010, crimesdata52011, crimesdata52012, crimesdata52013, crimesdata52014, crimesdata52015)
crimeBurglary$level<-'minor crime'


#Theft and related offences

crimesdata62003<-crimesdataorig
crimesdata62003$type <-'Theft and related offences'
crimesdata62003$year <-'2003'
crimesdata62003$quant<- crimesdatatrans$Theft.and.related.offences.2003

crimesdata62004<-crimesdataorig
crimesdata62004$type <-'Theft and related offences'
crimesdata62004$year <-'2004'
crimesdata62004$quant<- crimesdatatrans$Theft.and.related.offences.2004

crimesdata62005<-crimesdataorig
crimesdata62005$type <-'Theft and related offences'
crimesdata62005$year <-'2005'
crimesdata62005$quant<- crimesdatatrans$Theft.and.related.offences.2005

crimesdata62006<-crimesdataorig
crimesdata62006$type <-'Theft and related offences'
crimesdata62006$year <-'2006'
crimesdata62006$quant<- crimesdatatrans$Theft.and.related.offences.2006

crimesdata62007<-crimesdataorig
crimesdata62007$type <-'Theft and related offences'
crimesdata62007$year <-'2007'
crimesdata62007$quant<- crimesdatatrans$Theft.and.related.offences.2007

crimesdata62008<-crimesdataorig
crimesdata62008$type <-'Theft and related offences'
crimesdata62008$year <-'2008'
crimesdata62008$quant<- crimesdatatrans$Theft.and.related.offences.2008

crimesdata62009<-crimesdataorig
crimesdata62009$type <-'Theft and related offences'
crimesdata62009$year <-'2009'
crimesdata62009$quant<- crimesdatatrans$Theft.and.related.offences.2009

crimesdata62010<-crimesdataorig
crimesdata62010$type <-'Theft and related offences'
crimesdata62010$year <-'2010'
crimesdata62010$quant<- crimesdatatrans$Theft.and.related.offences.2010

crimesdata62011<-crimesdataorig
crimesdata62011$type <-'Theft and related offences'
crimesdata62011$year <-'2011'
crimesdata62011$quant<- crimesdatatrans$Theft.and.related.offences.2011

crimesdata62012<-crimesdataorig
crimesdata62012$type <-'Theft and related offences'
crimesdata62012$year <-'2012'
crimesdata62012$quant<- crimesdatatrans$Theft.and.related.offences.2012

crimesdata62013<-crimesdataorig
crimesdata62013$type <-'Theft and related offences'
crimesdata62013$year <-'2013'
crimesdata62013$quant<- crimesdatatrans$Theft.and.related.offences.2013

crimesdata62014<-crimesdataorig
crimesdata62014$type <-'Theft and related offences'
crimesdata62014$year <-'2014'
crimesdata62014$quant<- crimesdatatrans$Theft.and.related.offences.2014

crimesdata62015<-crimesdataorig
crimesdata62015$type <-'Theft and related offences'
crimesdata62015$year <-'2015'
crimesdata62015$quant<- crimesdatatrans$Theft.and.related.offences.2015

crimeTheft<- rbind(crimesdata62003, crimesdata62004, crimesdata62005, crimesdata62006, crimesdata62007, crimesdata62008, crimesdata62009,
                   crimesdata62010, crimesdata62011, crimesdata62012, crimesdata62013, crimesdata62014, crimesdata62015)
crimeTheft$level<-'minor crime'


#Fraud, deception and related offences

crimesdata72003<-crimesdataorig
crimesdata72003$type <-'Fraud, deception and related offences'
crimesdata72003$year <-'2003'
crimesdata72003$quant<- crimesdatatrans$Fraud..deception.and.related.offences.2003

crimesdata72004<-crimesdataorig
crimesdata72004$type <-'Fraud, deception and related offences'
crimesdata72004$year <-'2004'
crimesdata72004$quant<- crimesdatatrans$Fraud..deception.and.related.offences.2004

crimesdata72005<-crimesdataorig
crimesdata72005$type <-'Fraud, deception and related offences'
crimesdata72005$year <-'2005'
crimesdata72005$quant<- crimesdatatrans$Fraud..deception.and.related.offences.2005

crimesdata72006<-crimesdataorig
crimesdata72006$type <-'Fraud, deception and related offences'
crimesdata72006$year <-'2006'
crimesdata72006$quant<- crimesdatatrans$Fraud..deception.and.related.offences.2006

crimesdata72007<-crimesdataorig
crimesdata72007$type <-'Fraud, deception and related offences'
crimesdata72007$year <-'2007'
crimesdata72007$quant<- crimesdatatrans$Fraud..deception.and.related.offences.2007

crimesdata72008<-crimesdataorig
crimesdata72008$type <-'Fraud, deception and related offences'
crimesdata72008$year <-'2008'
crimesdata72008$quant<- crimesdatatrans$Fraud..deception.and.related.offences.2008

crimesdata72009<-crimesdataorig
crimesdata72009$type <-'Fraud, deception and related offences'
crimesdata72009$year <-'2009'
crimesdata72009$quant<- crimesdatatrans$Fraud..deception.and.related.offences.2009

crimesdata72010<-crimesdataorig
crimesdata72010$type <-'Fraud, deception and related offences'
crimesdata72010$year <-'2010'
crimesdata72010$quant<- crimesdatatrans$Fraud..deception.and.related.offences.2010

crimesdata72011<-crimesdataorig
crimesdata72011$type <-'Fraud, deception and related offences'
crimesdata72011$year <-'2011'
crimesdata72011$quant<- crimesdatatrans$Fraud..deception.and.related.offences.2011

crimesdata72012<-crimesdataorig
crimesdata72012$type <-'Fraud, deception and related offences'
crimesdata72012$year <-'2012'
crimesdata72012$quant<- crimesdatatrans$Fraud..deception.and.related.offences.2012

crimesdata72013<-crimesdataorig
crimesdata72013$type <-'Fraud, deception and related offences'
crimesdata72013$year <-'2013'
crimesdata72013$quant<- crimesdatatrans$Fraud..deception.and.related.offences.2013

crimesdata72014<-crimesdataorig
crimesdata72014$type <-'Fraud, deception and related offences'
crimesdata72014$year <-'2014'
crimesdata72014$quant<- crimesdatatrans$Fraud..deception.and.related.offences.2014

crimesdata72015<-crimesdataorig
crimesdata72015$type <-'Fraud, deception and related offences'
crimesdata72015$year <-'2015'
crimesdata72015$quant<- crimesdatatrans$Fraud..deception.and.related.offences.2015

crimeFraud<- rbind(crimesdata72003, crimesdata72004, crimesdata72005, crimesdata72006, crimesdata72007, crimesdata72008, crimesdata72009,
                   crimesdata72010, crimesdata72011, crimesdata72012, crimesdata72013, crimesdata72014, crimesdata72015)
crimeFraud$level<-'minor crime'


#Controlled drug offences

crimesdata82003<-crimesdataorig
crimesdata82003$type <-'Controlled drug offences'
crimesdata82003$year <-'2003'
crimesdata82003$quant<- crimesdatatrans$Controlled.drug.offences.2003

crimesdata82004<-crimesdataorig
crimesdata82004$type <-'Controlled drug offences'
crimesdata82004$year <-'2004'
crimesdata82004$quant<- crimesdatatrans$Controlled.drug.offences.2004

crimesdata82005<-crimesdataorig
crimesdata82005$type <-'Controlled drug offences'
crimesdata82005$year <-'2005'
crimesdata82005$quant<- crimesdatatrans$Controlled.drug.offences.2005

crimesdata82006<-crimesdataorig
crimesdata82006$type <-'Controlled drug offences'
crimesdata82006$year <-'2006'
crimesdata82006$quant<- crimesdatatrans$Controlled.drug.offences.2006

crimesdata82007<-crimesdataorig
crimesdata82007$type <-'Controlled drug offences'
crimesdata82007$year <-'2007'
crimesdata82007$quant<- crimesdatatrans$Controlled.drug.offences.2007

crimesdata82008<-crimesdataorig
crimesdata82008$type <-'Controlled drug offences'
crimesdata82008$year <-'2008'
crimesdata82008$quant<- crimesdatatrans$Controlled.drug.offences.2008

crimesdata82009<-crimesdataorig
crimesdata82009$type <-'Controlled drug offences'
crimesdata82009$year <-'2009'
crimesdata82009$quant<- crimesdatatrans$Controlled.drug.offences.2009

crimesdata82010<-crimesdataorig
crimesdata82010$type <-'Controlled drug offences'
crimesdata82010$year <-'2010'
crimesdata82010$quant<- crimesdatatrans$Controlled.drug.offences.2010

crimesdata82011<-crimesdataorig
crimesdata82011$type <-'Controlled drug offences'
crimesdata82011$year <-'2011'
crimesdata82011$quant<- crimesdatatrans$Controlled.drug.offences.2011

crimesdata82012<-crimesdataorig
crimesdata82012$type <-'Controlled drug offences'
crimesdata82012$year <-'2012'
crimesdata82012$quant<- crimesdatatrans$Controlled.drug.offences.2012

crimesdata82013<-crimesdataorig
crimesdata82013$type <-'Controlled drug offences'
crimesdata82013$year <-'2013'
crimesdata82013$quant<- crimesdatatrans$Controlled.drug.offences.2013

crimesdata82014<-crimesdataorig
crimesdata82014$type <-'Controlled drug offences'
crimesdata82014$year <-'2014'
crimesdata82014$quant<- crimesdatatrans$Controlled.drug.offences.2014

crimesdata82015<-crimesdataorig
crimesdata82015$type <-'Controlled drug offences'
crimesdata82015$year <-'2015'
crimesdata82015$quant<- crimesdatatrans$Controlled.drug.offences.2015

crimeDrugs <- rbind(crimesdata82003, crimesdata82004, crimesdata82005, crimesdata82006, crimesdata82007, crimesdata82008, crimesdata82009,
                    crimesdata82010, crimesdata82011, crimesdata82012, crimesdata82013, crimesdata82014, crimesdata82015)

crimeDrugs$level<-'minor crime'


#Weapons and Explosives Offences

crimesdata92003<-crimesdataorig
crimesdata92003$type <-'Weapons and Explosives Offences'
crimesdata92003$year <-'2003'
crimesdata92003$quant<- crimesdatatrans$Weapons.and.Explosives.Offences.2003

crimesdata92004<-crimesdataorig
crimesdata92004$type <-'Weapons and Explosives Offences'
crimesdata92004$year <-'2004'
crimesdata92004$quant<- crimesdatatrans$Weapons.and.Explosives.Offences.2004

crimesdata92005<-crimesdataorig
crimesdata92005$type <-'Weapons and Explosives Offences'
crimesdata92005$year <-'2005'
crimesdata92005$quant<- crimesdatatrans$Weapons.and.Explosives.Offences.2005

crimesdata92006<-crimesdataorig
crimesdata92006$type <-'Weapons and Explosives Offences'
crimesdata92006$year <-'2006'
crimesdata92006$quant<- crimesdatatrans$Weapons.and.Explosives.Offences.2006

crimesdata92007<-crimesdataorig
crimesdata92007$type <-'Weapons and Explosives Offences'
crimesdata92007$year <-'2007'
crimesdata92007$quant<- crimesdatatrans$Weapons.and.Explosives.Offences.2007

crimesdata92008<-crimesdataorig
crimesdata92008$type <-'Weapons and Explosives Offences'
crimesdata92008$year <-'2008'
crimesdata92008$quant<- crimesdatatrans$Weapons.and.Explosives.Offences.2008

crimesdata92009<-crimesdataorig
crimesdata92009$type <-'Weapons and Explosives Offences'
crimesdata92009$year <-'2009'
crimesdata92009$quant<- crimesdatatrans$Weapons.and.Explosives.Offences.2009

crimesdata92010<-crimesdataorig
crimesdata92010$type <-'Weapons and Explosives Offences'
crimesdata92010$year <-'2010'
crimesdata92010$quant<- crimesdatatrans$Weapons.and.Explosives.Offences.2010

crimesdata92011<-crimesdataorig
crimesdata92011$type <-'Weapons and Explosives Offences'
crimesdata92011$year <-'2011'
crimesdata92011$quant<- crimesdatatrans$Weapons.and.Explosives.Offences.2011

crimesdata92012<-crimesdataorig
crimesdata92012$type <-'Weapons and Explosives Offences'
crimesdata92012$year <-'2012'
crimesdata92012$quant<- crimesdatatrans$Weapons.and.Explosives.Offences.2012

crimesdata92013<-crimesdataorig
crimesdata92013$type <-'Weapons and Explosives Offences'
crimesdata92013$year <-'2013'
crimesdata92013$quant<- crimesdatatrans$Weapons.and.Explosives.Offences.2013

crimesdata92014<-crimesdataorig
crimesdata92014$type <-'Weapons and Explosives Offences'
crimesdata92014$year <-'2014'
crimesdata92014$quant<- crimesdatatrans$Weapons.and.Explosives.Offences.2014

crimesdata92015<-crimesdataorig
crimesdata92015$type <-'Weapons and Explosives Offences'
crimesdata92015$year <-'2015'
crimesdata92015$quant<- crimesdatatrans$Weapons.and.Explosives.Offences.2015

crimeWeapons <- rbind(crimesdata92003, crimesdata92004, crimesdata92005, crimesdata92006, crimesdata92007, crimesdata92008, crimesdata92009,
                      crimesdata92010, crimesdata92011, crimesdata92012, crimesdata92013, crimesdata92014, crimesdata92015)
crimeWeapons$level<-'high crime'


#Damage to property and to the environment

crimesdata102003<-crimesdataorig
crimesdata102003$type <-'Damage to property and to the environment'
crimesdata102003$year <-'2003'
crimesdata102003$quant<- crimesdatatrans$Damage.to.property.and.to.the.environment.2003

crimesdata102004<-crimesdataorig
crimesdata102004$type <-'Damage to property and to the environment'
crimesdata102004$year <-'2004'
crimesdata102004$quant<- crimesdatatrans$Damage.to.property.and.to.the.environment.2004

crimesdata102005<-crimesdataorig
crimesdata102005$type <-'Damage to property and to the environment'
crimesdata102005$year <-'2005'
crimesdata102005$quant<- crimesdatatrans$Damage.to.property.and.to.the.environment.2005

crimesdata102006<-crimesdataorig
crimesdata102006$type <-'Damage to property and to the environment'
crimesdata102006$year <-'2006'
crimesdata102006$quant<- crimesdatatrans$Damage.to.property.and.to.the.environment.2006

crimesdata102007<-crimesdataorig
crimesdata102007$type <-'Damage to property and to the environment'
crimesdata102007$year <-'2007'
crimesdata102007$quant<- crimesdatatrans$Damage.to.property.and.to.the.environment.2007

crimesdata102008<-crimesdataorig
crimesdata102008$type <-'Damage to property and to the environment'
crimesdata102008$year <-'2008'
crimesdata102008$quant<- crimesdatatrans$Damage.to.property.and.to.the.environment.2008

crimesdata102009<-crimesdataorig
crimesdata102009$type <-'Damage to property and to the environment'
crimesdata102009$year <-'2009'
crimesdata102009$quant<- crimesdatatrans$Damage.to.property.and.to.the.environment.2009

crimesdata102010<-crimesdataorig
crimesdata102010$type <-'Damage to property and to the environment'
crimesdata102010$year <-'2010'
crimesdata102010$quant<- crimesdatatrans$Damage.to.property.and.to.the.environment.2010

crimesdata102011<-crimesdataorig
crimesdata102011$type <-'Damage to property and to the environment'
crimesdata102011$year <-'2011'
crimesdata102011$quant<- crimesdatatrans$Damage.to.property.and.to.the.environment.2011

crimesdata102012<-crimesdataorig
crimesdata102012$type <-'Damage to property and to the environment'
crimesdata102012$year <-'2012'
crimesdata102012$quant<- crimesdatatrans$Damage.to.property.and.to.the.environment.2012

crimesdata102013<-crimesdataorig
crimesdata102013$type <-'Damage to property and to the environment'
crimesdata102013$year <-'2013'
crimesdata102013$quant<- crimesdatatrans$Damage.to.property.and.to.the.environment.2013

crimesdata102014<-crimesdataorig
crimesdata102014$type <-'Damage to property and to the environment'
crimesdata102014$year <-'2014'
crimesdata102014$quant<- crimesdatatrans$Damage.to.property.and.to.the.environment.2014

crimesdata102015<-crimesdataorig
crimesdata102015$type <-'Damage to property and to the environment'
crimesdata102015$year <-'2015'
crimesdata102015$quant<- crimesdatatrans$Damage.to.property.and.to.the.environment.2015

crimeDamage<- rbind(crimesdata102003, crimesdata102004, crimesdata102005, crimesdata102006, crimesdata102007, crimesdata102008, crimesdata102009,
                    crimesdata102010, crimesdata102011, crimesdata102012, crimesdata102013, crimesdata102014, crimesdata102015)
crimeDamage$level<-'minor crime'


#Public order and other social code offences

crimesdata112003<-crimesdataorig
crimesdata112003$type <-'Public order and other social code offences'
crimesdata112003$year <-'2003'
crimesdata112003$quant<- crimesdatatrans$Public.order.and.other.social.code.offences.2003

crimesdata112004<-crimesdataorig
crimesdata112004$type <-'Public order and other social code offences'
crimesdata112004$year <-'2004'
crimesdata112004$quant<- crimesdatatrans$Public.order.and.other.social.code.offences.2004

crimesdata112005<-crimesdataorig
crimesdata112005$type <-'Public order and other social code offences'
crimesdata112005$year <-'2005'
crimesdata112005$quant<- crimesdatatrans$Public.order.and.other.social.code.offences.2005

crimesdata112006<-crimesdataorig
crimesdata112006$type <-'Public order and other social code offences'
crimesdata112006$year <-'2006'
crimesdata112006$quant<- crimesdatatrans$Public.order.and.other.social.code.offences.2006

crimesdata112007<-crimesdataorig
crimesdata112007$type <-'Public order and other social code offences'
crimesdata112007$year <-'2007'
crimesdata112007$quant<- crimesdatatrans$Public.order.and.other.social.code.offences.2007

crimesdata112008<-crimesdataorig
crimesdata112008$type <-'Public order and other social code offences'
crimesdata112008$year <-'2008'
crimesdata112008$quant<- crimesdatatrans$Public.order.and.other.social.code.offences.2008

crimesdata112009<-crimesdataorig
crimesdata112009$type <-'Public order and other social code offences'
crimesdata112009$year <-'2009'
crimesdata112009$quant<- crimesdatatrans$Public.order.and.other.social.code.offences.2009

crimesdata112010<-crimesdataorig
crimesdata112010$type <-'Public order and other social code offences'
crimesdata112010$year <-'2010'
crimesdata112010$quant<- crimesdatatrans$Public.order.and.other.social.code.offences.2010

crimesdata112011<-crimesdataorig
crimesdata112011$type <-'Public order and other social code offences'
crimesdata112011$year <-'2011'
crimesdata112011$quant<- crimesdatatrans$Public.order.and.other.social.code.offences.2011

crimesdata112012<-crimesdataorig
crimesdata112012$type <-'Public order and other social code offences'
crimesdata112012$year <-'2012'
crimesdata112012$quant<- crimesdatatrans$Public.order.and.other.social.code.offences.2012

crimesdata112013<-crimesdataorig
crimesdata112013$type <-'Public order and other social code offences'
crimesdata112013$year <-'2013'
crimesdata112013$quant<- crimesdatatrans$Public.order.and.other.social.code.offences.2013

crimesdata112014<-crimesdataorig
crimesdata112014$type <-'Public order and other social code offences'
crimesdata112014$year <-'2014'
crimesdata112014$quant<- crimesdatatrans$Public.order.and.other.social.code.offences.2014

crimesdata112015<-crimesdataorig
crimesdata112015$type <-'Public order and other social code offences'
crimesdata112015$year <-'2015'
crimesdata112015$quant<- crimesdatatrans$Public.order.and.other.social.code.offences.2015

crimePublic<-rbind(crimesdata112003, crimesdata112004, crimesdata112005, crimesdata112006, crimesdata112007, crimesdata112008, crimesdata112009,
                   crimesdata112010, crimesdata112011, crimesdata112012, crimesdata112013, crimesdata112014, crimesdata112015)
crimePublic$level<-'minor crime'


#Offences against government, justice procedures and organisation of crime

crimesdata122003<-crimesdataorig
crimesdata122003$type <-'Offences against government, justice procedures and organisation of crime'
crimesdata122003$year <-'2003'
crimesdata122003$quant<- crimesdatatrans$Offences.against.government..justice.procedures.and.organisation.of.crime.2003

crimesdata122004<-crimesdataorig
crimesdata122004$type <-'Offences against government, justice procedures and organisation of crime'
crimesdata122004$year <-'2004'
crimesdata122004$quant<- crimesdatatrans$Offences.against.government..justice.procedures.and.organisation.of.crime.2004

crimesdata122005<-crimesdataorig
crimesdata122005$type <-'Offences against government, justice procedures and organisation of crime'
crimesdata122005$year <-'2005'
crimesdata122005$quant<- crimesdatatrans$Offences.against.government..justice.procedures.and.organisation.of.crime.2005

crimesdata122006<-crimesdataorig
crimesdata122006$type <-'Offences against government, justice procedures and organisation of crime'
crimesdata122006$year <-'2006'
crimesdata122006$quant<- crimesdatatrans$Offences.against.government..justice.procedures.and.organisation.of.crime.2006

crimesdata122007<-crimesdataorig
crimesdata122007$type <-'Offences against government, justice procedures and organisation of crime'
crimesdata122007$year <-'2007'
crimesdata122007$quant<- crimesdatatrans$Offences.against.government..justice.procedures.and.organisation.of.crime.2007

crimesdata122008<-crimesdataorig
crimesdata122008$type <-'Offences against government, justice procedures and organisation of crime'
crimesdata122008$year <-'2008'
crimesdata122008$quant<- crimesdatatrans$Offences.against.government..justice.procedures.and.organisation.of.crime.2008

crimesdata122009<-crimesdataorig
crimesdata122009$type <-'Offences against government, justice procedures and organisation of crime'
crimesdata122009$year <-'2009'
crimesdata122009$quant<- crimesdatatrans$Offences.against.government..justice.procedures.and.organisation.of.crime.2009

crimesdata122010<-crimesdataorig
crimesdata122010$type <-'Offences against government, justice procedures and organisation of crime'
crimesdata122010$year <-'2010'
crimesdata122010$quant<- crimesdatatrans$Offences.against.government..justice.procedures.and.organisation.of.crime.2010

crimesdata122011<-crimesdataorig
crimesdata122011$type <-'Offences against government, justice procedures and organisation of crime'
crimesdata122011$year <-'2011'
crimesdata122011$quant<- crimesdatatrans$Offences.against.government..justice.procedures.and.organisation.of.crime.2011

crimesdata122012<-crimesdataorig
crimesdata122012$type <-'Offences against government, justice procedures and organisation of crime'
crimesdata122012$year <-'2012'
crimesdata122012$quant<- crimesdatatrans$Offences.against.government..justice.procedures.and.organisation.of.crime.2012

crimesdata122013<-crimesdataorig
crimesdata122013$type <-'Offences against government, justice procedures and organisation of crime'
crimesdata122013$year <-'2013'
crimesdata122013$quant<- crimesdatatrans$Offences.against.government..justice.procedures.and.organisation.of.crime.2013

crimesdata122014<-crimesdataorig
crimesdata122014$type <-'Offences against government, justice procedures and organisation of crime'
crimesdata122014$year <-'2014'
crimesdata122014$quant<- crimesdatatrans$Offences.against.government..justice.procedures.and.organisation.of.crime.2014

crimesdata122015<-crimesdataorig
crimesdata122015$type <-'Offences against government, justice procedures and organisation of crime'
crimesdata122015$year <-'2015'
crimesdata122015$quant<- crimesdatatrans$Offences.against.government..justice.procedures.and.organisation.of.crime.2015

crimeGovernment<-rbind(crimesdata122003, crimesdata122004, crimesdata122005, crimesdata122006, crimesdata122007, crimesdata122008, crimesdata122009,
                       crimesdata122010, crimesdata122011, crimesdata122012, crimesdata122013, crimesdata122014, crimesdata122015)
crimeGovernment$level<-'high crime'


crimedf<- rbind(crimeAttempts, crimeDangerous, crimeKidnapping, crimeRobbery,
                crimeBurglary, crimeTheft, crimeFraud, crimeDrugs, crimeWeapons,
                crimeDamage, crimePublic, crimeGovernment)

colnames(crimedf)[colnames(crimedf)=='id']<-'id station'
colnames(crimedf)[colnames(crimedf)=='quant']<-'quantity'
rownames(crimedf)<-1:nrow(crimedf)

Dublin1<-c('Store Street', 'Mountjoy', 'Fitzgibbon Street')
Dublinnorth<-c('Swords', 'Skerries', 'Malahide',  'Lusk', 'Garristown', 'Dublin Airport', 
               'Balbriggan', 'Ballymun')
Dublinsouth<-c('Dun Laoghaire', 'Blackrock Co Dublin')
Dublinwest<-c('Rathcoole', 'Lucan')
crimedf$PostalDistrict[crimedf$Station %in% Dublin1]<- 'Dublin 1'
crimedf$PostalDistrict[crimedf$Station == 'Pearse Street']<- 'Dublin 2'
crimedf$PostalDistrict[crimedf$Station == 'Clontarf']<- 'Dublin 3'
crimedf$PostalDistrict[crimedf$Station == 'Donnybrook'| crimedf$Station =='Irishtown']<- 'Dublin 4'
crimedf$PostalDistrict[crimedf$Station == 'Raheny']<- 'Dublin 5'
crimedf$PostalDistrict[crimedf$Station == 'Terenure']<- 'Dublin 6w'
crimedf$PostalDistrict[crimedf$Station == 'Rathmines']<- 'Dublin 6'
crimedf$PostalDistrict[crimedf$Station == 'Cabra' | crimedf$Station == 'Bridewell Dublin']<- 'Dublin 7'
crimedf$PostalDistrict[crimedf$Station == 'Kilmainham' | crimedf$Station == 'Kevin Street']<- 'Dublin 8'
crimedf$PostalDistrict[crimedf$Station == 'Santry']<- 'Dublin 9'
crimedf$PostalDistrict[crimedf$Station == 'Ballyfermot']<- 'Dublin 10'
crimedf$PostalDistrict[crimedf$Station == 'Finglas']<- 'Dublin 11'
crimedf$PostalDistrict[crimedf$Station == 'Sundrive Road' | crimedf$Station == 'Crumlin']<- 'Dublin 12'
crimedf$PostalDistrict[crimedf$Station == 'Howth']<- 'Dublin 13'
crimedf$PostalDistrict[crimedf$Station == 'Rathfarnham' | crimedf$Station == 'Dundrum']<- 'Dublin 14'
crimedf$PostalDistrict[crimedf$Station == 'Blanchardstown']<- 'Dublin 15'
crimedf$PostalDistrict[crimedf$Station == 'Coolock']<- 'Dublin 17'
crimedf$PostalDistrict[crimedf$Station == 'Shankill' | crimedf$Station == 'Cabinteely']<- 'Dublin 18'
crimedf$PostalDistrict[crimedf$Station == 'Ronanstown' | crimedf$Station == 'Clondalkin']<- 'Dublin 22'
crimedf$PostalDistrict[crimedf$Station == 'Tallaght']<- 'Dublin 24'
crimedf$PostalDistrict[crimedf$Station %in% Dublinnorth]<- 'Dublin north-county-dublin'
crimedf$PostalDistrict[crimedf$Station %in% Dublinsouth]<- 'Dublin south-county-dublin'
crimedf$PostalDistrict[crimedf$Station %in% Dublinwest]<- 'Dublin west-county-dublin'

northside<- c('Dublin 1', 'Dublin 3', 'Dublin 5', 'Dublin 7', 'Dublin 9',
              'Dublin 11', 'Dublin 13', 'Dublin 15', 'Dublin 17', 'Dublin north-county-dublin')
southside<-c('Dublin 2', 'Dublin 4', 'Dublin 6', 'Dublin 6w', 'Dublin 8',
             'Dublin 10', 'Dublin 12', 'Dublin 14', 'Dublin 16','Dublin 18','Dublin 20',
             'Dublin 22', 'Dublin 24', 'Dublin south-county-dublin')

crimedf$side[crimedf$PostalDistrict %in% northside]<- 'northside'
crimedf$side[crimedf$PostalDistrict %in% southside]<- 'southside'
crimedf$side[crimedf$PostalDistrict == 'Dublin west-county-dublin']<- 'westside'


print(sapply(crimedf, function(x) sum(is.na(x))))

write.csv(crimedf, file = "crimetrans.csv")

