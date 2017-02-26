library(dplyr)

# set working directory
setwd("~/Desktop/coursera/4_Exploratory_Data_Analysis/Week_1")

# read .txt file
dat <- read.delim("household_power_consumption.txt",
                  header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

dat <- dat %>%  filter(Date == "2007-02-01" | Date == "2007-02-02")
png(filename = "Plot1.png", width = 480, height = 480)
hist(dat$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power",
     col = 'red')
dev.off()
