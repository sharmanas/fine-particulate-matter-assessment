## 3.Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999-2008 for 
## Baltimore City? Which have seen increases in emissions from 1999-2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

## Read data files into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Create subset of data based on U.S. County Baltimore
baltimore <- NEI[NEI$fips=="24510", ]

## Group emissions in Baltimore by year and type
baltimore.emi <- aggregate(Emissions ~ year + type, baltimore, sum)

## Plot 3
library(ggplot2)
png("plot3.png", height=480, width=720)
ggplot(baltimore.emi, aes(x=factor(year), y=Emissions, fill=type)) +
    geom_bar(stat="identity") + facet_grid(. ~ type) + xlab("Year") +
    ylab(expression('Total PM'[2.5]*' emissions (tons)')) +
    ggtitle(expression("PM"[2.5]*" emissions in Baltimore City across different sources"))
dev.off()
