# Coursera Data Science: Exploratory Data Analysis
# Course project 2: Plot4
# Student name: Bui Thi Thien Trang
################################################################################
rm(list = ls())
#data
NEI <- readRDS('/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/exdata-data-NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/exdata-data-NEI_data/Source_Classification_Code.rds')

#mix data
NEISCC <- merge(NEI, SCC, by="SCC")

library(ggplot2)

# Question: Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all NEIxSCC records with Short.Name (SCC) Coal
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)

#Plot and save Plot4
png(filename="/Users/thientrangbui/Dropbox/Cousera Machine learning/Exploratory data analysis/project 2/plot4.png",width = 480, height = 480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()
