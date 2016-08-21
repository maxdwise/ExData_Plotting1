
setwd("D:/coursera/Data Science Specialization/Exploratory Data Analysis/Week 1/project/household_power_consumption")
power_cons = read.table("household_power_consumption.txt",header=TRUE,sep=";",
na.strings="?")

#learn about the data
#dim(power_cons)
#head(power_cons)
#summary(power_cons)

#limit to these two dates: 2007-02-01 and 2007-02-02
#dataset dates are in DD/MM/YYYY format
power_cons_12 = subset(power_cons,Date=="1/2/2007" | Date=="2/2/2007")
power_cons_12$Day_of_week = weekdays(as.Date(power_cons_12$Date,'%d/%m/%Y'))
power_cons_12$DateTime = strptime(paste(power_cons_12$Date,power_cons_12$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
#dim(power_cons_12)

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(power_cons_12$DateTime,power_cons_12$Global_active_power,type='l',
     ylab="Global Active Power",xlab="")
plot(power_cons_12$DateTime,power_cons_12$Voltage,type='l',
     ylab="Voltage",xlab="datetime")
plot(power_cons_12$DateTime,power_cons_12$Sub_metering_1,type='l',
     ylab="Energy sub metering",xlab="")
lines(power_cons_12$DateTime,power_cons_12$Sub_metering_2,type='l',
      col='red')
lines(power_cons_12$DateTime,power_cons_12$Sub_metering_3,type='l',
      col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1,1),bty="n")
plot(power_cons_12$DateTime,power_cons_12$Global_reactive_power,type='l',
     ylab="Global_reactive_power",xlab="datetime")
par(mfrow=c(1,1))
dev.off()
