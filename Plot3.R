## ExData_Plot3
## Preparing data
zipped_data <-"./data/household_power_consumption.zip"
raw_data <- unzip(zipped_data)    ##unzip local file
fulltable <- read.table(raw_data, sep = ";", header = T,  na.string = "?") ##read full file into table 
fulltable$Date <- as.Date(as.character(fulltable$Date),format="%d/%m/%Y")  ##convert dates
febtable <- fulltable[fulltable$Date >= "2007-02-01" & fulltable$Date <= "2007-02-02", ] ##filter on 2 days
febtable$DateTime <- strptime(paste(febtable$Date, febtable$Time), format="%Y-%m-%d %H:%M:%S") ##create a datetime column

## plot 3
par(mar = c(1,4,1,1))
plot (febtable$DateTime,febtable$Sub_metering_1,type = "n", ylab="Energy sub metering")
lines(febtable$DateTime, febtable$Sub_metering_1,lwd=1)
lines(febtable$DateTime, febtable$Sub_metering_2,lwd=1, col = "red")
lines(febtable$DateTime,febtable$Sub_metering_3, lwd =1, col = "blue")
legend("topright", pch =1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png", width = 480, height = 480, units = "px")
dev.off()