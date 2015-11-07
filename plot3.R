plot3 <- function(){
    library(data.table)
    library(dplyr)
    library(lubridate)

    hpc <- fread("household_power_consumption.txt", na.strings = "?")
    fhpc <- hpc %>% 
        filter(Date == "1/2/2007" | Date == "2/2/2007") %>% 
        mutate(datetime = dmy(Date) + hms(Time))
    rm(hpc)
    
    png(file = "plot3.png")
    plot(fhpc$Sub_metering_1~fhpc$datetime, 
         type = "l", 
         ylab = "Global Active Power (kilowatts)", 
         xlab = "")
    lines(fhpc$Sub_metering_2~fhpc$datetime, col = "orange")
    lines(fhpc$Sub_metering_3~fhpc$datetime, col = "blue")
    legend("topright", 
           bty = "n", 
           lwd = 2, 
           pch = NA, 
           cex = 0.8, 
           col = c("black", "orange", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
}
