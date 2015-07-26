## 6.Compare emissions from motor vehicle sources in Baltimore City with emissions 
## from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

## Read data files into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Get motor vehicle emissions from motor vehicles in Baltimore City
baltimore.motor <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"), ]
baltimore.motor.emissions <- aggregate(Emissions ~ year, baltimore.motor, sum)

## Get motor vehicle emissions from motor vehicles in Los Angeles County
losangeles.motor <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"), ]
losangeles.motor.emissions <- aggregate(Emissions ~ year, losangeles.motor, sum)

## Bind the data together
baltimore.motor.emissions$county <- "Baltimore City"
losangeles.motor.emissions$county <- "Los Angeles County"
emissions.data <- rbind(baltimore.motor.emissions, losangeles.motor.emissions)

## Plot 6
library(ggplot2)
png("plot6.png", width=600)
ggplot(emissions.data, aes(x=year, y=Emissions, fill=county)) +
    geom_point(shape=1) + scale_colour_hue(l=50) + geom_smooth() +
    facet_grid(county~., scales="free") + xlab("Year") + ylab("Total Emissions (tons)") +
    ggtitle("Motor vehicle emissions variation between Baltimore and Los Angeles")
dev.off()
