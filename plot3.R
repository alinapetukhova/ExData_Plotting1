plot3 <- function()
{
  test.txt <- read.table("C:/Rtools/wd/household_power_consumption.txt", na.strings = "?", header=T, sep = ";", stringsAsFactors=FALSE)
  test.txt[,1] = as.Date(test.txt[,1], format="%d/%m/%Y")
  
  library(dplyr)
  
  newdata <- filter(test.txt, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02")& Global_active_power != "?")
  newdata <- mutate(newdata, Time=format(as.POSIXct(paste(Date, Time)), "%Y-%m-%d %H:%M:%S"))
  
  png(file = "plot3.png")
  par(mar=c(2.1,4.1,2.1,2.1), las=0)
  plot(x= strptime(newdata$Time, "%Y-%m-%d %H:%M:%S"), y = newdata$Sub_metering_1, type="l", xlab=NA, ylab = "Energy sub metering")
  lines(x= strptime(newdata$Time, "%Y-%m-%d %H:%M:%S"), y = newdata$Sub_metering_2,col="Red")
  lines(x= strptime(newdata$Time, "%Y-%m-%d %H:%M:%S"), y = newdata$Sub_metering_3,col="Blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("Black", "Red", "Blue"))
  dev.off()
}
