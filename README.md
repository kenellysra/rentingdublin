# Renting Dublin

This project contain the following files:

schooletl.py: it is an scraper of SchoolDays.ie to extract data from secondary schools in Dublin (http://www.schooldays.ie/articles/secondary-Schools-in-Ireland-by-County)
schoolcleaning.R: perform some cleaning on data collect from schooletl.py script
schooltransformation.R: perform some transformation and add new fields to the output file from schoolcleaning.R script

crimeetl.R: extract a csv file with criminal offences by station level reported in Dublin from http://airo.maynoothuniversity.ie/datastore/criminal-offences-station-level
crimecleaning.R: Perfotm some cleaning on data collected from crimeetl.R script
crimetransformation: perform some transformation and add some fields to the output file from crimecleaning.R

propertyetl.R: extract a csv file generated from https://github.com/montenegrodr/findinghome
propertycleaning.R: perform some cleaning on data collected from propertyetl.R
propertytransformation: perform some transformation and add new fields to the output file from propertycleaning.R


