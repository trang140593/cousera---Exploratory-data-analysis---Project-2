# Coursera Data Science: Exploratory Data Analysis
# Course project 2: Plot6
# Student name: Bui Thi Thien Trang
################################################################################
rm(list = ls())
#data
NEI <- readRDS('/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/exdata-data-NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/exdata-data-NEI_data/Source_Classification_Code.rds')

#mix data
NEISCC <- merge(NEI, SCC, by="SCC")

library(ggplot2)

# Question: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

#Plot and save Plot4
png(filename="/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/plot6.png",width = 480, height = 480)
g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()
