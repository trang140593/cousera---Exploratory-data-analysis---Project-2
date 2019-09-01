# Coursera Data Science: Exploratory Data Analysis
# Course project 2: Plot2
# Student name: Bui Thi Thien Trang
################################################################################
rm(list = ls())
#data
NEI <- readRDS('/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/exdata-data-NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/exdata-data-NEI_data/Source_Classification_Code.rds')

#filter data by the fips of the Baltimore City, Maryland
subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

#Plot and save Plot2
png(filename="/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/plot2.png",width = 480, height = 480)
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()
