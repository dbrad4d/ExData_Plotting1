# first read in data
hpc_data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", as.is=TRUE)

# and then format the date
hpc_data$Date<-as.Date(hpc_data$Date, format = "%d/%m/%Y")

# subset for the two days in Feb 2007
hpc_sub<-subset(hpc_data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# next add new date-time column
hpc_sub$datetime<-as.POSIXct(paste(hpc_sub$Date, hpc_sub$Time), format="%Y-%m-%d %H:%M:%S")

# then create png with the appropriate dimensions
png("plot1.png", width=480, height=480, units="px", bg="transparent")


# now create plot
with (hpc_sub, {plot(datetime, Global_active_power, type="n", ylab="Global Average Power (kilowatts)", xlab="")
    lines(datetime,Global_active_power)
})

# don't forget to turn off png device
dev.off()