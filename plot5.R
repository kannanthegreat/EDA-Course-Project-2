# Exploratory Data Analysis - Assignment 2 - Q. #5
# Load ggplot2 library
library(ggplot2)

# Loading provided datasets - loading from local machine
NEI <- readRDS("C:/Users/kannanthegreat/Documents/EDA/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/kannanthegreat/Documents/EDA/Source_Classification_Code.rds")

subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)



png("C:/Users/kannanthegreat/Documents/EDA/plot5.png", width=840, height=480)
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()