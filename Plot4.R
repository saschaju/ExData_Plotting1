library(dplyr)

# set working directory
setwd("~/Desktop/coursera/4_Exploratory_Data_Analysis/Week_1")

# read .txt file
dat <- read.delim("household_power_consumption.txt",
                  header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

dat <- dat %>%  filter(Date == "2007-02-01" | Date == "2007-02-02")
png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot.ts(dat$Global_active_power,
        xlab = NA, ylab = "Global Active Power (kilowatts)")
plot.ts(dat$Voltage,
        xlab = "datetime", ylab = "Voltage")

plot.ts(dat$Sub_metering_1, type = "n",
        xlab = NA, ylab = "Energy Sub Metering")
lines(dat$Sub_metering_1)
lines(dat$Sub_metering_2, col = "red")
lines(dat$Sub_metering_3, col = "blue")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot.ts(dat$Global_reactive_power,
        xlab = "datetime")

dev.off()
