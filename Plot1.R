## ExData_Plot1
## Preparing data
zipped_data <-"./data/household_power_consumption.zip"
raw_data <- unzip(zipped_data)    ##unzip local file
fulltable <- read.table(raw_data, sep = ";", header = T,  na.string = "?") ##read full file into table 
fulltable$Date <- as.Date(as.character(fulltable$Date),format="%d/%m/%Y")  ##convert dates
febtable <- fulltable[fulltable$Date >= "2007-02-01" & fulltable$Date <= "2007-02-02", ] ##filter on 2 days
febtable$DateTime <- strptime(paste(febtable$Date, febtable$Time), format="%Y-%m-%d %H:%M:%S") ##create a datetime column

## plot 1
par(mar = c(4,3,3,1))
hist(febtable$Global_active_power, col = "red", xlab= "Global Active Power (Kilowatts)", ylab = "frequency", main = "Global Active Power")
dev.copy(png, "plot1.png", width = 480, height = 480, units = "px")
dev.off()
