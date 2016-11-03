##The purpose of this script is to merge the data and perform
##some final clean up and formatting
##create final merged data file for analysis

##Variable
GDPFile = 'C://RCode//CaseStudy1//Analysis//Data//NewGDP.csv'
EduFile = 'EducationData.csv'
GdpEduFile = 'GDPEDUFinal.csv'

##Set working direcotry
setwd('C:\\RCode\\CaseStudy1\\Analysis\\Data')

##load the data
gdp = read.csv(GDPFile, sep = ',')
edu = read.csv(EduFile, sep = ',')

##Merge the data
gdpedu = merge(gdp, edu, by='CountryCode', sort = TRUE)


##Question 1 How many ID's Matched
print(nrow(gdpedu))

##format GDP 
gdpedu$GDP = as.numeric(gsub("[^[:digit:]]","",gdpedu$GDP))

##order the data by GDP
gdpedu = gdpedu[order(gdpedu$GDP),]

##remove any non-country country codes. only interested is countries, not regions
##count first
print(sum(is.na(gdpedu$Ranking)))
##now remove them
gdpedu = subset(gdpedu, gdpedu$Ranking !='NA')

##write out final data file
write.csv(gdpedu, file=GdpEduFile)