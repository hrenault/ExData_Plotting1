## ExData_Plot4
## Preparing data
zipped_data <-"./data/household_power_consumption.zip"
raw_data <- unzip(zipped_data)    ##unzip local file
fulltable <- read.table(raw_data, sep = ";", header = T,  na.string = "?") ##read full file into table 
fulltable$Date <- as.Date(as.character(fulltable$Date),format="%d/%m/%Y")  ##convert dates
febtable <- fulltable[fulltable$Date >= "2007-02-01" & fulltable$Date <= "2007-02-02", ] ##filter on 2 days
febtable$DateTime <- strptime(paste(febtable$Date, febtable$Time), format="%Y-%m-%d %H:%M:%S") ##create a datetime column

## plot 4
par(mfcol= c(2,2), mar = c(2,5,1,1))
## reuse plot 2 in (1,1)
plot(febtable$DateTime, febtable$Global_active_power, type ="n", xlab = "" , ylab = "Global active power")
lines(febtable$DateTime, febtable$Global_active_power,lwd=1)
## reuse plot 3 in (2,1)
plot (febtable$DateTime,febtable$Sub_metering_1,type = "n", xlab = "", ylab="Energy sub metering")
lines(febtable$DateTime, febtable$Sub_metering_1,lwd=1)
lines(febtable$DateTime, febtable$Sub_metering_2,lwd=1, col = "red")
lines(febtable$DateTime,febtable$Sub_metering_3, lwd =1, col = "blue")
legend("topright", pch =1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## new plot in (1,2)
plot(febtable$DateTime, febtable$Voltage, type ="n", xlab = "datetime", ylab = "Voltage" )
lines(febtable$DateTime, febtable$Voltage,lwd=1)
## new plot in (2,2)
plot(febtable$DateTime, febtable$Global_reactive_power, type ="n", xlab = "datetime", ylab = "Global reactive power")
lines(febtable$DateTime, febtable$Global_reactive_power,lwd=1)
## convert to png.
dev.copy(png, "plot4.png", width = 480, height = 480, units = "px")
dev.off()
