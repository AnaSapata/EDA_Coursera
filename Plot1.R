# Project 2 from EDA Coursera
# AnaSapata
# 08/Nov/2019^


NEI <- readRDS('/home/anasapata/Personal/datasciencecoursera/Exploratory Data Analysis/exdata_data_NEI_data/summarySCC_PM25.rds')
SCC <- readRDS('/home/anasapata/Personal/datasciencecoursera/Exploratory Data Analysis/exdata_data_NEI_data/Source_Classification_Code.rds')

head(NEI)
head(SCC)

library(dplyr)
# Q1 - Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing 
# the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

total_by_year <- NEI %>% group_by(year) %>% summarize(Emissions = sum(Emissions))

plot(total_by_year$year, total_by_year$Emissions, xlab = "Year", ylab = "Emissions", main = "Total of emissions by year")


# Q2 - Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510"\color{red}{\verb|fips == "24510"|}fips=="24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

Maryland_data <- subset(NEI, NEI$fips=="24510" & (NEI$year == 1999 | NEI$year == 2008 ))
Maryland_data_by_year <- Maryland_data %>% group_by(year) %>% summarize(Emissions = sum(Emissions))
plot(Maryland_data_by_year$year, Maryland_data_by_year$Emissions, xlab = "Year", ylab = "Emissions", main = "Total of emissions by year in Maryland")
