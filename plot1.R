plot1 <- function()
{
test.txt <- read.table("C:/Rtools/wd/household_power_consumption.txt", na.strings = "?", header=T, sep = ";", stringsAsFactors=FALSE)
test.txt[,1] = as.Date(test.txt[,1], format="%d/%m/%Y")

library(dplyr)

newdata <- filter(test.txt, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02")& Global_active_power != "?")

png(file = "plot1.png")
par(las=0)
hist(x = newdata$Global_active_power,yaxt = "n", main ="Global active power", col = "Red", xlab="Global active power (kilowatts)", ylab = "Frequency")
axis(2,labels=c(seq(from=0,to=1200,by=200)), at = c(seq(from=0,to=1200,by=200)))
dev.off()
}
