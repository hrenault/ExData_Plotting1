## ExData_Plot2
## Preparing data
zipped_data <-"./data/household_power_consumption.zip"
raw_data <- unzip(zipped_data)    ##unzip local file
fulltable <- read.table(raw_data, sep = ";", header = T,  na.string = "?") ##read full file into table 
fulltable$Date <- as.Date(as.character(fulltable$Date),format="%d/%m/%Y")  ##convert dates
febtable <- fulltable[fulltable$Date >= "2007-02-01" & fulltable$Date <= "2007-02-02", ] ##filter on 2 days
febtable$DateTime <- strptime(paste(febtable$Date, febtable$Time), format="%Y-%m-%d %H:%M:%S") ##create a datetime column

## plot 2
par(mar = c(2,5,1,1))
plot(febtable$DateTime, febtable$Global_active_power, type ="n", ylab = "Global Active Power(kilowatts)")
lines(febtable$DateTime, febtable$Global_active_power,lwd=1)
dev.copy(png, "plot2.png", width = 480, height = 480, units = "px")
dev.off()
