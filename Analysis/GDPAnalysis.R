##the purpose of this script to perform some analysis of the data

##load data
GdpEduFile = 'GDPEDUFinal.csv'

##Set working direcotry
setwd('C:\\RProjects\\CaseStudy1\\Analysis\\Data')
gdpedu = read.csv(GdpEduFile)


#print 13th country
print(gdpedu$Long.Name[13])

##Question 3 average ranking of High income OECD and nonOECD
print(mean(gdpedu$Ranking[gdpedu$Income.Group =='High income: nonOECD']))
print(mean(gdpedu$Ranking[gdpedu$Income.Group =='High income: OECD']))

##plot data
##gdpplot = ggplot(gdpedu, aes(gdpedu$Income.Group, gdpedu$GDP))+geom_point(color='firebrick')


gdpplot = ggplot(gdpedu, aes(gdpedu$Region, gdpedu$GDP, color=factor(gdpedu$Income.Group)))+geom_point()
gdpplot = gdpplot+theme(axis.text.x=element_text(angle = 35, size=10, vjust=.25))
gdpplot = gdpplot+ggtitle('GDP By Region')
gdpplot = gdpplot+labs(x='Income Group', y='GDP (Millions')
gdpplot = gdpplot+theme(legend.title = element_blank())
print(gdpplot)

##Break down into quantile groups
gdpedu$Quantile = ntile(gdpedu$Ranking, 5)

##question 4:
print(nrow(gdpedu[(gdpedu$Quantile==1) & (gdpedu$Income.Group =='Lower middle income'),]))











