# Note: This script uses sqldf package

library(sqldf)


df <- read.csv.sql("household_power_consumption.txt", 
                   sql = "select * from file where Date='1/2/2007' or Date='2/2/2007' ", 
                   sep=";")

numrows = nrow(df)
days = weekdays(as.Date(c('1/2/2007', '2/2/2007', '3/2/2007'), format("%d/%m/%Y")),
                abbreviate = TRUE)
mrow = which(df$Date == '2/2/2007')[1]

plot(df$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="", xaxt="n",
     cex.lab=0.8, cex.axis=0.8)
lines(df$Sub_metering_1, col='black')
lines(df$Sub_metering_2, col='red')
lines(df$Sub_metering_3, col='blue')
legend("topright", lty=1, col=c('black','red','blue'), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex=0.8, text.width=strwidth("Sub_metering_1")+100)

axis(1, at=c(1,mrow, numrows), labels=days)
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
