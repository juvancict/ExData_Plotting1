plot1 <- function(){
    library(data.table)
    library(dplyr)
    library(lubridate)

    hpc <- fread("household_power_consumption.txt", na.strings = "?")
    fhpc <- hpc %>% 
        filter(Date == "1/2/2007" | Date == "2/2/2007") %>% 
        mutate(datetime = dmy(Date) + hms(Time))
    rm(hpc)
    
    png(file = "plot1.png")
    hist(fhpc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "darkorange")
    dev.off()

}
