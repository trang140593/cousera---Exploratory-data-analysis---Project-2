# Coursera Data Science: Exploratory Data Analysis
# Course project 2: Plot1
# Student name: Bui Thi Thien Trang
################################################################################
rm(list = ls())
#data
NEI <- readRDS('/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/exdata-data-NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/exdata-data-NEI_data/Source_Classification_Code.rds')

# Question: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

#Plot and save Plot1
png(filename="/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/plot1.png",width = 480, height = 480)
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()
