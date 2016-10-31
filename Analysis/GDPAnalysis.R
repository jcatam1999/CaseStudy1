##Variable
GDPFile = 'GDP.csv'
EduFile = 'EducationData.csv'

##Set working direcotry
setwd('C:\\RProjects\\CaseStudy1\\Analysis\\Data')

##load the data
gdp = read.csv(GDPFile, sep = ',')
edu = read.csv(EduFile, sep = ',')

##Merge the data
gdpedu = merge(gdp, edu, by='CountryCode', sort = TRUE)
gdpedu = subset(gdpedu, gdpedu$CountryCode !='')