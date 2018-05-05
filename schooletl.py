import requests
import re
from lxml import html
from lxml.cssselect import CSSSelector
import csv
import time
import codecs

urlinit = 'http://www.schooldays.ie'

def regionurl():

    '''Collect the content of each schooldays.ie urls for region Dublin-1, Dublin-2 ....Dublin-18
    and calls schollurl() function. Create the CSV file with the header'''

    header = ['School Name', 'Address', 'Postal District', 'Genre', 'Fees','Year', 'Total Sitting Leaving',
          'Total Main Colleges']
    #write the csv reader
    with open('./schoolfile', 'a') as myfile:
        wr = csv.writer(myfile, quoting = csv.QUOTE_ALL)
        wr.writerow(header)

    dublinregions = list(range(1,19))
    otherdublinregions = ['6w', '20', '22', '24', 'north-county-dublin', 'south-county-dublin', 'west-county-dublin']
    # all the dublin postal codes /regions
    allregions = dublinregions + otherdublinregions

    for code in allregions:

        urlregioninitial = urlinit + '/secondary-schools-in-ireland/Dublin-' + str(code)
        # do a request on url page
        urlregion = requests.get(urlregioninitial)
        # collect the page content
        contenturlregion = urlregion.content
        # convert bytes to string
        contenturlregion = contenturlregion.decode('utf-8')
        schoolpostaldistrict = 'Dublin ' + str(code)
        # send the page content to schoolurl function
        schoolurl(contenturlregion, schoolpostaldistrict)


def schoolurl(contenturlregion, schoolpostaldistrict):

    '''Collect the schooldays.ie urls for each school in a region,
    and call the schoolsummary function and schoolprog function'''

    # use regular expression to findall the school urls
    urlschool = re.findall(r'(\/school\/[\w+\-|.]*)\">', contenturlregion)

    #for each school extract the school summary and school progression
    for surl in urlschool:
        schoolsummarylist = schoolsummary(surl, schoolpostaldistrict)
        schoolprog(surl, schoolsummarylist)


def schoolsummary(surl, schoolpostaldistrict):

    '''Extract the school name and address,
     concatenate with the postal district to compound the school summary information'''

    #creating the school summary url
    urlschoolsumm = urlinit + surl
    # request the web page
    urlschoolsummget = requests.get(urlschoolsumm)
    #extract the content of the web page in bytes
    urlschoolsummcontent = urlschoolsummget.content
    # HTML parsing
    htmlschsummcontent = html.document_fromstring(urlschoolsummcontent)

    #extract school name
    schoolname = htmlschsummcontent.xpath('//*[@id="area1"]/h1/text()')
    #extract completed school address
    schooladdress = htmlschsummcontent.xpath('//*[@id="area1"]/p/text()[2]')
    #extract the school enrollment
    schoolenrollm = htmlschsummcontent.xpath('//*[@id="area1"]/p/text()')
    #extract the scholl fee : private/public
    schoolfees = htmlschsummcontent.xpath('//*[@id="area1"]/p/text()')

    # Extract only words : Boys, Girls or Boys and Girls
    schoolgenre = re.findall(r'(Boys|Girls):',str(schoolenrollm))
    if not schoolgenre:
        schoolgenre = [""]
    elif len(schoolgenre) == 2:
        schoolgenre = ['Mixed']
    # Extract only Yes or No
    schooltype = re.findall(r'(Yes|No)\s',str(schoolfees))
    if not schooltype:
        schooltype = [""]
    # Remove \n
    schooladdress[0] = schooladdress[0].strip()
    #list of summary school
    schoolsummarylist = [schoolname[0], schooladdress[0], schoolpostaldistrict, schoolgenre[0], schooltype[0]]

    return schoolsummarylist


def schoolprog(surl,schoolsummarylist):

    '''Collect the content about each school progression.'''

    surl = surl.replace('/school', '')
    #creating the college progression url
    urlschoolproginit = urlinit + '/sch/' + surl + '/college-progression'
    # request the web page
    urlschoolprog = requests.get(urlschoolproginit)
    # extract the content of the web page in bytes
    contenturlschoolprog = urlschoolprog.content
    #HMTL parsing
    htmlcontent = html.document_fromstring(contenturlschoolprog)
    # select all the block of data with the tag valign = top.
    htmlelemprog = htmlcontent.cssselect("[valign=top]")


    #for elem in htmlelemprog: #collect the items on htmlelem list and transform to a list of strings
    contentprog = htmlelemprog[0].text_content()

    #dividing the content into lines by year
    splitcontentyear = contentprog.split('\n')
    # removing this text from the first line
    splitcontentyear[0] = splitcontentyear[0].lstrip('Leaving Cert & College Numbers')
    #removing the blank line
    splitcontentyear = splitcontentyear[:-1]

    # if there isnt school progression available for a school, fill with " ".
    if not splitcontentyear:
        schoolproglist = ['', '', '']
        writecsv(schoolsummarylist, schoolproglist)
    else:
        # removing a content on the last element not needed
        splitcontentyear = splitcontentyear[:-1]

        for line in splitcontentyear:
        #extract the year, total sitting leaving and total of main colleges from each year/each college/each region

            year = re.findall(r'(\b2\w+):', line)
            totalsitleave = re.findall(r':\W+([0-9]+)', line)
            # If the total sitting leave is '?' fill with  " "
            if not totalsitleave:
                totalsitleave = ['']

            totalmaincolleges = re.findall(r'Total of main colleges\s([0-9]+)', line)
            # If the total main colleges is '?' fill with " "
            if not totalmaincolleges:
                totalsitleave = ['']
            # fazer uma lista de lista, elemento dessa lista vai ser uma lista com year, etc etc
            schoolproglist = [year[0], totalsitleave[0], totalmaincolleges[0]]
            # call the function writecsv
            writecsv(schoolsummarylist, schoolproglist)
    time.sleep(1)

def writecsv(schoolsummarylist, schoolproglist):

    '''This function write the school name, address, postal district,
     year, total sitting leaving and total colege in CSV file'''
    filename = './schoolfile'
    with codecs.open(filename, 'a', encoding = 'utf-8') as myfile:
        wr = csv.writer(myfile, quoting=csv.QUOTE_ALL)
        wr.writerow(schoolsummarylist + schoolproglist)


def main():
    regionurl()

if __name__ == "__main__":
    main()

