## 4.Across the United States, how have emissions from coal combustion-related sources 
## changed from 1999-2008?

## Read data files into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Get coal combustion sources from SCC
coal.combustion <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
coal.combustion.sources <- SCC[coal.combustion, ]

## Find emissions from coal combustion sources in NEI
sources.emissions <- NEI[(NEI$SCC %in% coal.combustion.sources$SCC), ]

## Aggregate by year
by.year <- aggregate(Emissions ~ year, sources.emissions, sum)

## Plot 4
library(ggplot2)
png("plot4.png")
ggplot(by.year, aes(x=year, y=Emissions)) +
    geom_point() + geom_smooth() + xlab("Year") +
    ylab(expression('Total PM'[2.5]*' emissions (tons)')) +
    ggtitle("Emissions from coal-combustion related sources")
dev.off()
