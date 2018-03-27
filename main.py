import requests
import re
from lxml import html
from lxml.cssselect import CSSSelector

urlinit = 'http://www.schooldays.ie'

def regionurl():

#Collect the content of each schooldays.ie urls for region Dublin-1, Dublin-2 ....Dublin-18 and calls schollurl() function

    for i in range(1,19):

        urlregioninitial = urlinit+'/secondary-schools-in-ireland/Dublin-' + str(i)
        urlregion = requests.get(urlregioninitial) #do a request on url page
        contenturlregion = urlregion.content #collect the page content
        contenturlregion = contenturlregion.decode('utf-8') #convert bytes to string
        schoolurl(contenturlregion) #send the page content to schoolurl function
        break


def schoolurl(contenturlregion):

#Collect the schooldays.ie urls for each school in a region. input: region url, output: school url
    urlschool = re.findall(r'\/school\/[\w+-]*\w+', contenturlregion) # use regular expression to findall the school urls

    for surl in urlschool:
        schoolsummary(surl)
        schoolprog(surl)# for each school url on urlschool list, call schoolprog funtion
        break

def schoolsummary(surl):

    urlschoolsumm = urlinit+surl
    urlschoolsummget = requests.get(urlschoolsumm)
    urlschoolsummcontent = urlschoolsummget.content
    htmlschsummcontent= html.document_fromstring(urlschoolsummcontent)


def schoolprog(surl):

#Collect the content about the each school progression. input: School url, output: school progression data
    surl=surl.lstrip('/school')
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
    splitcontentyear.remove(splitcontentyear[len(splitcontentyear)-1]) #removing a content on the last element not needed

    for i in splitcontentyear:
    # this loop will send each line by year to the next function. each line has the year, total leaving and total colleges.
        extractprog(i)


def extractprog(i):

#extract the year, total sitting leaving and total of main colleges from each year/each college/each region

    year = re.findall(r'(\b2\w+):', i)
    print(year)
    totalsitleave = re.findall(r':\W+(\w+)', i)
    print(totalsitleave)
    totalmaincolleges = re.findall(r'Total of main colleges\s(\w+)', i)
    print(totalmaincolleges)


regionurl()
