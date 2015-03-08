loadnplot <- function(directory) {
        ## Read data
  	file_spec<-paste(directory,"household_power_consumption.txt",sep="/")
	data <- read.csv(file_spec, header=TRUE,na.strings="?",sep=";")

        ## Create histogram
	workdata<-subset(data,Date=="1/2/2007"| Date=="2/2/2007")
	hist(workdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

	dev.copy(png, file="plot1.png")
	dev.off()
}
