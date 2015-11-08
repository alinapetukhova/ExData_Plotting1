plot4 <- function()
{
  test.txt <- read.table("C:/Rtools/wd/household_power_consumption.txt", na.strings = "?", header=T, sep = ";", stringsAsFactors=FALSE)
  test.txt[,1] = as.Date(test.txt[,1], format="%d/%m/%Y")
  
  library(dplyr)
  
  newdata <- filter(test.txt, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02")& Global_active_power != "?")
  newdata <- mutate(newdata, Time=format(as.POSIXct(paste(Date, Time)), "%Y-%m-%d %H:%M:%S"))
  
  png(file = "plot4.png")
  par(mfrow = c(2,2), mar=c(4.1,4.1,1.1,2.1), las=0)
  plot(x= strptime(newdata$Time, "%Y-%m-%d %H:%M:%S"), y = newdata$Global_active_power, type="l", xlab=NA, ylab = "Global active power")
  
  plot(x= strptime(newdata$Time, "%Y-%m-%d %H:%M:%S"), y = newdata$Voltage,yaxt = "n", type="l", xlab="datetime", ylab = "Voltage")
  axis(2,labels=c("234", "", "238" , "", "242", "", "246" ), at = c(seq(from=234,to=246,by=2)))
  
  plot(x= strptime(newdata$Time, "%Y-%m-%d %H:%M:%S"), y = newdata$Sub_metering_1, type="l", xlab=NA, ylab = "Energy sub metering")
  lines(x= strptime(newdata$Time, "%Y-%m-%d %H:%M:%S"), y = newdata$Sub_metering_2,col="Red")
  lines(x= strptime(newdata$Time, "%Y-%m-%d %H:%M:%S"), y = newdata$Sub_metering_3,col="Blue")
  legend("topright", inset=c(0,0), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),bty = "n", lty=c(1,1,1), col=c("Black", "Red", "Blue"), cex = 0.75)
  
  plot(x= strptime(newdata$Time, "%Y-%m-%d %H:%M:%S"), y = newdata$Global_reactive_power, type="l", xlab="datetime", ylab = "Global reactive power")
  dev.off()
}
