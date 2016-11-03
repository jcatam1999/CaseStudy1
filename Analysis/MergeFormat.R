##The purpose of this script is to merge the data and perform
##some final clean up and formatting
##create final merged data file for analysis

##Variable
GDPFile = 'C://RProjects//CaseStudy1//Analysis//Data//NewGDP.csv'
EduFile = 'EducationData.csv'
GdpEduFile = 'GDPEDUFinal.csv'

##Set working direcotry
setwd('C:\\RProjects\\CaseStudy1\\Analysis\\Data')

##load the data
gdp = read.csv(GDPFile, sep = ',')
edu = read.csv(EduFile, sep = ',')

##Merge the data
gdpedu = merge(gdp, edu, by='CountryCode', sort = TRUE)


##Question 1 How many ID's Matched
print('Number of Matching country codes')
print(nrow(gdpedu))

##format GDP 
gdpedu$GDP = as.numeric(gsub("[^[:digit:]]","",gdpedu$GDP))

##order the data by GDP
gdpedu = gdpedu[order(gdpedu$GDP),]

##remove any non-country country codes. only interested is countries, not regions
##count first
print('Number of rows removed during clean up')
print(sum(is.na(gdpedu$Ranking)))
##now remove them
gdpedu = subset(gdpedu, gdpedu$Ranking !='NA')

##Break down into quantile groups
gdpedu$Quantile = ntile(gdpedu$Ranking, 5)

##write out final data file
write.csv(gdpedu, file=GdpEduFile)