## 1.Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.

## Read data files into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Split the data into subsets of Emissions aggregated by year
sum.emissions <- aggregate(Emissions ~ year, NEI, sum)

## Plot 1
png('plot1.png')
barplot(height=sum.emissions$Emissions, names.arg=sum.emissions$year, xlab="Year",
        ylab=expression('Total PM'[2.5]*' emissions (tons)'), 
        main=expression('Total PM'[2.5]*' emissions from all sources'))
dev.off()
