## read table 
d <-read.table ("household_power_consumption.txt" , sep =";", header = TRUE , colClasses = c( "Date" = "character" , Time ="character"))
## select required records
xy <- subset(d, as.Date(d$Date, format = "%d/%m/%Y") == '2007-2-1' | 
               as.Date(d$Date, format = "%d/%m/%Y") == '2007-2-2')
## Add field with date and time
xy <- transform (xy, timestamp= as.character(paste(Date,Time)))
plot (as.POSIXct(strptime(xy$timestamp , "%d/%m/%Y %H:%M:%S")) , as.numeric(as.character(xy$Global_active_power)) 
      , type = "l" , ylab = "Global Active Power (kilowatts)", xlab = "" )

## Save to png
dev.copy(png, file = "plot2.png" , width = 480, height = 480)
dev.off()
      