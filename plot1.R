## Read data
d <-read.table ("household_power_consumption.txt" , sep =";", header = TRUE)
## Create data frame with required records
xy <- subset(d, as.Date(d$Date, format = "%d/%m/%Y") == '2007-2-1' | 
               as.Date(d$Date, format = "%d/%m/%Y") == '2007-2-2')
cexlab <- 0.7 
## generate histogram
hist (as.numeric(as.character(xy$Global_active_power)) , col = "red" , main = "Global Active Power"
      , xlab = "Global Active Power (kilowatts)", ylab = "Frequency" ,  
      breaks = 12,  cex.lab = 0.8)
## save to png file
dev.copy(png, file = "plot1.png" , width = 480, height = 480)
dev.off()

