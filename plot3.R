## read table 
d <-read.table ("household_power_consumption.txt" , sep =";", header = TRUE , 
                colClasses = c( "Date" = "character" , Time ="character"))
               
## select required records
xy <- subset(d, as.Date(d$Date, format = "%d/%m/%Y") == '2007-2-1' | 
               as.Date(d$Date, format = "%d/%m/%Y") == '2007-2-2')
## Add field with date and time
xy <- transform (xy, timestamp= as.character(paste(Date,Time)))
## add plots
plot (as.POSIXct(strptime(xy$timestamp , "%d/%m/%Y %H:%M:%S")) , as.numeric(as.character(xy$Sub_metering_1 )) 
      , type = "l" , ylab = "Energy sub metering", xlab = "" , col = "black" , cex.lab = 0.8)

lines (as.POSIXct(strptime(xy$timestamp , "%d/%m/%Y %H:%M:%S")) , as.numeric(as.character(xy$Sub_metering_2 )) 
      , type = "l" , ylab = "Energy sub metering", xlab = "" , col = "red" )
lines (as.POSIXct(strptime(xy$timestamp , "%d/%m/%Y %H:%M:%S")) , as.numeric(as.character(xy$Sub_metering_3 )) 
      , type = "l" , ylab = "Energy sub metering", xlab = "", col = "blue" )
## add legend
legend ("topright",  pch = "------" , pt.cex=1, cex=0.5 ,col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3"))
## Save to png
dev.copy(png, file = "plot3.png" , width = 480, height = 480)
dev.off()
      