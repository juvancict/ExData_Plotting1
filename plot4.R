plot4 <- function(){
    library(data.table)
    library(dplyr)
    library(lubridate)

    hpc <- fread("household_power_consumption.txt", na.strings = "?")
    fhpc <- hpc %>% 
        filter(Date == "1/2/2007" | Date == "2/2/2007") %>% 
        mutate(datetime = dmy(Date) + hms(Time))
    rm(hpc)
    
    par(mfrow = c(2,2), mar = c(4,4,3,3))
    png(file = "plot4.png")
    plot(fhpc$Global_active_power~fhpc$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", cex.lab = 0.7)
    plot(fhpc$Voltage~fhpc$datetime, type = "l", ylab = "Voltage", xlab = "", cex.lab = 0.7)
    plot(fhpc$Sub_metering_1~fhpc$datetime, 
         type = "l", 
         ylab = "Global Active Power (kilowatts)", 
         xlab = "",
         cex.lab = 0.7)
    lines(fhpc$Sub_metering_2~fhpc$datetime, col = "orange")
    lines(fhpc$Sub_metering_3~fhpc$datetime, col = "blue")
    legend("topright", 
           bty = "n", 
           lwd = 2, 
           pch = NA, 
           cex = 0.7, 
           col = c("black", "orange", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(fhpc$Global_reactive_power~fhpc$datetime, type = "l", ylab = "Global Reactive Power (kilowatts)", xlab = "", cex.lab = 0.7)
    dev.off()
}


