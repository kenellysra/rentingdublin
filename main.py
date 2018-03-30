import requests
import re
from lxml import html
from lxml.cssselect import CSSSelector
import csv

urlinit = 'http://www.schooldays.ie'

def regionurl():

#Collect the content of each schooldays.ie urls for region Dublin-1, Dublin-2 ....Dublin-18 and calls schollurl() function,
#Create the CSV file with the header

    header = ['School Name', 'Address', 'Postal District', 'Year', 'Total Sitting Leaving', #csv reader
          'Total Main Colleges']
    with open('./schoolfile', 'a') as myfile: #write the csv reader
        wr = csv.writer(myfile, quoting=csv.QUOTE_ALL)
        wr.writerow(header)

    dublinregions = list(range(1,19))
    otherdublinregions = ['6w', '20', '22', '24', 'north-county-dublin', 'south-county-dublin', 'west-county-dublin']
    allregions = dublinregions+otherdublinregions # all the dublin postal codes /regions

    for i in allregions:

        urlregioninitial = urlinit+'/secondary-schools-in-ireland/Dublin-' + str(i)
        urlregion = requests.get(urlregioninitial) #do a request on url page
        contenturlregion = urlregion.content #collect the page content
        contenturlregion = contenturlregion.decode('utf-8') #convert bytes to string
        schoolpostaldistrict = 'Dublin '+ str(i)
        schoolurl(contenturlregion, schoolpostaldistrict) #send the page content to schoolurl function


def schoolurl(contenturlregion, schoolpostaldistrict):

#Collect the schooldays.ie urls for each school in a region, and call the schoolsummary function and schoolprog function

    urlschool = re.findall(r'(\/school\/[\w+\-|.]*)\">', contenturlregion) # use regular expression to findall the school urls

    for surl in urlschool: #for each school extract the school summary and school progression
        schoolsummarylist = schoolsummary(surl, schoolpostaldistrict)
        schoolprog(surl, schoolsummarylist)


def schoolsummary(surl, schoolpostaldistrict):

#Extract the school name and address, concatenate with the postal district to compound the school summary information

    urlschoolsumm = urlinit+surl #creating the school summary url
    urlschoolsummget = requests.get(urlschoolsumm) # request the web page
    urlschoolsummcontent = urlschoolsummget.content #extract the content of the web page in bytes
    htmlschsummcontent= html.document_fromstring(urlschoolsummcontent) # HTML parsing

    schoolname = htmlschsummcontent.xpath('//*[@id="area1"]/h1/text()') #extract school name
    schooladdress = htmlschsummcontent.xpath('//*[@id="area1"]/p/text()[2]') #extract completed school address
    #schoolenrollm = htmlschsummcontent.xpath('//*[@id="area1"]/p/text()[15]') #extract the school enrollment
    #schoolfees = htmlschsummcontent.xpath('//*[@id="area1"]/p/text()[20]') #extract the scholl fee : private/public


    #schoolgenre = re.findall(r'([A-Z]\w+):',schoolenrollm[0]) # Extract only words : Boys, Girls or Boys and Girls
    #schooltype = re.findall(r'(Yes|No)\s',schoolfees[0]) # Extract only Yes or No
    schooladdress[0] = schooladdress[0].strip() # Remove \n

    schoolsummarylist = [schoolname[0], schooladdress[0], schoolpostaldistrict] #schoolgenre[0], schooltype[0]] #list of summary school

    return schoolsummarylist


def schoolprog(surl,schoolsummarylist):

#Collect the content about each school progression.

    surl=surl.replace('/school', '')
    urlschoolproginit = urlinit+'/sch/'+surl+'/college-progression' #creating the college progression url
    urlschoolprog = requests.get(urlschoolproginit) # request the web page
    contenturlschoolprog = urlschoolprog.content # extract the content of the web page in bytes
    htmlcontent = html.document_fromstring(contenturlschoolprog) #HMTL parsing
    htmlelemprog = htmlcontent.cssselect("[valign=top]") # select all the block of data with the tag valign = top.


    for elem in htmlelemprog: #collect the items on htmlelem list and transform to a list of strings
        contentprog = elem.text_content()

    splitcontentyear = contentprog.split('\n') #dividing the content into lines by year
    splitcontentyear[0] = splitcontentyear[0].lstrip('Leaving Cert & College Numbers') # removing this text from the first line
    splitcontentyear.remove(splitcontentyear[len(splitcontentyear)-1]) #removing the blank line

    if len(splitcontentyear) == 0: # if there isnt school progression available for a school, fill with " ".
        schoolproglist = [' ', ' ', ' ']
        writecsv(schoolsummarylist, schoolproglist)
    else:
        splitcontentyear.remove(splitcontentyear[len(splitcontentyear)-1]) #removing a content on the last element not needed

        for i in splitcontentyear:
        #extract the year, total sitting leaving and total of main colleges from each year/each college/each region

            year = re.findall(r'(\b2\w+):', i)
            totalsitleave = re.findall(r':\W+([0-9]+)', i)

            if len(totalsitleave)==0: #If the total sitting leave is '?' fill with  " "
                totalsitleave = [' ']

            totalmaincolleges = re.findall(r'Total of main colleges\s([0-9]+)', i)

            if len(totalmaincolleges) == 0: # If the total main colleges is '?' fill with " "
                totalsitleave = [' ']

            schoolproglist = [year[0], totalsitleave[0], totalmaincolleges[0]] # fazer uma lista de lista, elemento dessa lista vai ser uma lista com year, etc etc

            writecsv(schoolsummarylist, schoolproglist) # call the function writecsv

def writecsv(schoolsummarylist, schoolproglist):

    #This function write the school name, address, postal district, year, total sitting leaving and total colege in CSV file
    #header = ['School Name', 'Address', 'Postal District' ,'Genre', 'Fees', 'Year', 'Total Sitting Leaving', 'Total Main Colleges']

    with open('./schoolfile', 'a') as myfile:
        wr=csv.writer(myfile, quoting=csv.QUOTE_ALL)
        wr.writerow(schoolsummarylist + schoolproglist)



regionurl()

