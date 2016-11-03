##Download the source data file from internet
##if it does not already exist

DataFilePath = 'C://RProjects//CaseStudy1//Analysis//Data'
EDUDataFile = 'EducationData.csv'
GDPDataFile = 'GDP.csv'
CleanGDPFile = 'NewGDP.csv'

setwd(DataFilePath)

GDPURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"  
EDUURL1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

##get GDP data
if (!file.exists(GDPDataFile)) {
  #setInternet2(TRUE)
  download.file(GDPURL ,GDPDataFile,method="auto") 
}else{
    print('data already there')
  }

##get education data
if (!file.exists(EDUDataFile)) {
  #setInternet2(TRUE)
  download.file(EDUURL1 ,EDUDataFile,method="auto") 
}else{
  print('data already there')
}

#perform initial clean up of GDP data so data is at least useable.
gdp = read.csv(GDPDataFile, sep = ',')



#get rid of empty columns
gdp = gdp[-c(3,6,7,8,9,10)]
#get rid of emptyp rows
gdp = subset(gdp, gdp$X!='')

#rename columns
names(gdp)[1]='CountryCode'
names(gdp)[2]='Ranking'
names(gdp)[3]='Economy'
names(gdp)[4]='GDP'


#Write File out

write.csv(gdp, file = CleanGDPFile)




