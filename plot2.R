plot2 <- function()
{
test.txt <- read.table("C:/Rtools/wd/household_power_consumption.txt", na.strings = "?", header=T, sep = ";", stringsAsFactors=FALSE)
test.txt[,1] = as.Date(test.txt[,1], format="%d/%m/%Y")

library(dplyr)

newdata <- filter(test.txt, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02")& Global_active_power != "?")
newdata <- mutate(newdata, Time=format(as.POSIXct(paste(Date, Time)), "%Y-%m-%d %H:%M:%S"))

png(file = "plot2.png")
par(las=0)
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")
par(mar=c(2.1,4.1,2.1,2.1), las=0)
plot(x= strptime(newdata$Time, "%Y-%m-%d %H:%M:%S"), y = newdata$Global_active_power, type="l", xlab=NA, ylab = "Global active power (kilowatts)")
dev.off()
}
