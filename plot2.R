# Note: This script uses sqldf package

library(sqldf)


df <- read.csv.sql("household_power_consumption.txt", 
                   sql = "select * from file where Date='1/2/2007' or Date='2/2/2007' ", 
                   sep=";")

numrows = nrow(df)
days = weekdays(as.Date(c('1/2/2007', '2/2/2007', '3/2/2007'), format("%d/%m/%Y")),
                abbreviate = TRUE)
mrow = which(df$Date == '2/2/2007')[1]

plot(df$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
lines(df$Global_active_power)
axis(1, at=c(1,mrow, numrows), labels=days)
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
