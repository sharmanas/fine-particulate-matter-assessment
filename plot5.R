## 5.How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

## Read data files into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Get motor vehicle emissions from motor vehicles in Baltimore City
baltimore.motor <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"), ]
baltimore.motor.emissions <- aggregate(Emissions ~ year, baltimore.motor, sum)

## Plot 5
library(ggplot2)
png("plot5.png")
ggplot(baltimore.motor.emissions, aes(x=year, y=Emissions)) +
    geom_point() + geom_smooth() + xlab("Year") +
    ylab(expression('Total PM'[2.5]*' emissions (tons)')) +
    ggtitle("Emissions from motor vehicle sources in Baltimore City")
dev.off()
