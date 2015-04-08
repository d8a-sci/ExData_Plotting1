require(lubridate)        # convenient for dates 


loadnplot <- function(directory, dev="screen") {
	data	<- load_data(directory)
	plot_data(data)

	return(data)
}


plot_data <- function(data, dev="screen") {
	# Take subset
	workdata<-subset(data, Date=="1/2/2007"| Date=="2/2/2007")
    
	if ( dev == "png" ) {
        	## Plot it in png file
		png(file = "plot3.png", bg = "transparent", width = 480, height = 480, units = "px")
	}

        ## Create plot
	with(	workdata, {
		plot(DateTime,	Sub_metering_1, type="l", col="black",	xlab="", ylab="Energy sub metering")
	})
	with(	workdata, {
		lines(DateTime, Sub_metering_2, type="l", col="red",	xlab="")
	})
	with(	workdata, {
		lines(DateTime, Sub_metering_3, type="l", col="blue",	xlab="")
	})
	legend(	"topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

	if ( dev != "screen" ) {
		# Close png device
		dev.off()
	}
}


load_data <- function(directory) {
	## Variables/Columns
	##	Date
	##	Time
	##	Global_active_power
	##	Global_reactive_power
	##	Voltage
	##	Global_intensity
	##	Sub_metering_1
	##	Sub_metering_2
	##	Sub_metering_3

        ## Read data
  	file_spec	<- paste(directory,"household_power_consumption.txt",sep="/")
	data		<- read.csv(file_spec, header=TRUE,na.strings="?",sep=";")
	data		<- cbind(data, DateTime= dmy(data$Date) + hms(data$Time) )

	return(data)
}
