## read table 
d <-read.table ("household_power_consumption.txt" , sep =";", header = TRUE , 
                colClasses = c( "Date" = "character" , Time ="character"))
                ## as.is = TRUE, stringAsFactors = FA
## select required records
xy <- subset(d, as.Date(d$Date, format = "%d/%m/%Y") == '2007-2-1' | 
               as.Date(d$Date, format = "%d/%m/%Y") == '2007-2-2')
## Add field with date and time
xy <- transform (xy, timestamp= as.character(paste(Date,Time)))
## add plots
cexlab <- 0.7 
par (mfrow=c(2,2))
## first plot

plot (as.POSIXct(strptime(xy$timestamp , "%d/%m/%Y %H:%M:%S")) , as.numeric(as.character(xy$Global_active_power)) 
      , type = "l" , ylab = "Global Active Power ", xlab = "" ,  cex.lab = cexlab)
## second plot

plot (as.POSIXct(strptime(xy$timestamp , "%d/%m/%Y %H:%M:%S")) , as.numeric(as.character(xy$Voltage)) 
      , type = "l" , ylab = "Voltage ", xlab = "datetime" ,  cex.lab = cexlab)

## third plot

plot (as.POSIXct(strptime(xy$timestamp , "%d/%m/%Y %H:%M:%S")) , as.numeric(as.character(xy$Sub_metering_1 )) 
      , type = "l" , ylab = "Energy sub metering", xlab = "" , col = "black" , cex.lab = cexlab)

lines (as.POSIXct(strptime(xy$timestamp , "%d/%m/%Y %H:%M:%S")) , as.numeric(as.character(xy$Sub_metering_2 )) 
      , type = "l" , ylab = "Energy sub metering", xlab = "" , col = "red" , cex.lab = cexlab)
lines (as.POSIXct(strptime(xy$timestamp , "%d/%m/%Y %H:%M:%S")) , as.numeric(as.character(xy$Sub_metering_3 )) 
      , type = "l" , ylab = "Energy sub metering", xlab = "", col = "blue" , cex.lab = cexlab )
## add legend
legend ("topright", bty = "n", cex = 0.5, pch = "------" , col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3"))




## fourth plot

plot (as.POSIXct(strptime(xy$timestamp , "%d/%m/%Y %H:%M:%S")) , as.numeric(as.character(xy$Global_reactive_power)) 
      , type = "l" , ylab = "Global_reactive_power", xlab = "datetime" , cex.lab = cexlab, yaxt = "n")
axis(2 , at = c(0.0 , 0.1, 0.2, 0.3, 0.4, 0.5) , cex.axis=0.8)
## Save to png
dev.copy(png, file = "plot4.png" , width = 480, height = 480)
dev.off()
      