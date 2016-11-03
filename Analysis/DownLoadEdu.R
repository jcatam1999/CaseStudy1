##download education file and clean up a bit so will be useful
DataFilePath = 'C://RProjects//CaseStudy1//Analysis//Data'
EDUDataFile = 'EducationData.csv'
EDUURL1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
CleanEDUFile = 'NewEdu.csv'

setwd(DataFilePath)


##get education data
if (!file.exists(EDUDataFile)) {

  download.file(EDUURL1 ,EDUDataFile,method="auto") 
}else{
  print('data already there')
}

