## 2.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Read data files into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Create subset of data based on U.S. County Baltimore
baltimore <- NEI[NEI$fips=="24510", ]

## Aggregate emissions by year
baltimore.emi <- aggregate(Emissions ~ year, baltimore, sum)

## Plot 2
png('plot2.png')
barplot(height=baltimore.emi$Emissions, names.arg=baltimore.emi$year, 
        xlab="Year", ylab=expression('Total PM'[2.5]*' emissions (tons)'), 
        main=expression('Total PM'[2.5]*' emissions in Baltimore City from all sources'))
dev.off()
