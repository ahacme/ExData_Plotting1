#Fast loading the data by performing following:

#Read the first 5 rows and capture column classes in a vector
dt5<-fread("household_power_consumption.txt",header=TRUE, sep=";",na.string=c("?",""),nrow=5)
classes<-sapply(dt5,class)

#Read the table by setting the colClasses
dt<-read.table("household_power_consumption.txt",header=TRUE, sep=";",colClasses=classes,na.string=c("?",""))

#Filter the results in a new data frame
dt4<-dt[dt$Date=="1/2/2007"|dt$Date=="2/2/2007",]
#Added a new POSIXlt converted Date.Time variable
dt4$Date.Time1<-as.POSIXlt(strptime(paste(dt4$Date,dt4$Time),format="%d/%m/%Y %H:%M:%S"))


#Opening the PNG device
png(filename="plot3.png",width=600,height=480,restoreConsole=TRUE)

#----Plot3
par(mfrow=c(1,1),mar=c(2,2,1,1))
plot(dt4$Date.Time1,dt4$Sub_metering_1,type="l",col="dark grey",ylab="Energy sub metering",xlab="")
points(dt4$Date.Time1,dt4$Sub_metering_2,type="l",col="red")
points(dt4$Date.Time1,dt4$Sub_metering_3,type="l",col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("dark grey","red","blue"),lty=c(1.5,1.5,1.5),lwd=c(2.5,2.5,2.5))

#Closing the device
dev.off()