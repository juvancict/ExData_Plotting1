plot2 <- function(){
    library(data.table)
    library(dplyr)
    library(lubridate)

    hpc <- fread("household_power_consumption.txt", na.strings = "?")
    fhpc <- hpc %>% 
        filter(Date == "1/2/2007" | Date == "2/2/2007") %>% 
        mutate(datetime = dmy(Date) + hms(Time))
    rm(hpc)
    
    png(file = "plot2.png")
    plot(fhpc$Global_active_power~fhpc$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    dev.off()
}
