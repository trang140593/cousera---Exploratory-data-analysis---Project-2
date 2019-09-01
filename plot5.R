# Coursera Data Science: Exploratory Data Analysis
# Course project 2: Plot5
# Student name: Bui Thi Thien Trang
################################################################################
rm(list = ls())
#data
NEI <- readRDS('/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/exdata-data-NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/exdata-data-NEI_data/Source_Classification_Code.rds')

#mix data
NEISCC <- merge(NEI, SCC, by="SCC")

library(ggplot2)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Searching for ON-ROAD type in NEI
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

#Plot and save Plot5
png(filename="/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/plot5.png",width = 480, height = 480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()
