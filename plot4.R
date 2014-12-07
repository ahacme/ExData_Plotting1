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
png(filename="plot4.png",width=700,height=600,restoreConsole=TRUE)

#----Plot4 
par(mfrow=c(2,2),mar=c(4,4,2,2), oma=c(1,1,2,1))
with(dt4,{
        #Q1
        plot(Date.Time1,Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")
        #Q2
        plot(Date.Time1,Voltage,ylab="Voltage",xlab="datetime",type="l")
        #Q3
        plot(Date.Time1,Sub_metering_1,type="l",col="dark grey",ylab="Energy sub metering",xlab="")
        points(Date.Time1,Sub_metering_2,type="l",col="red")
        points(Date.Time1,Sub_metering_3,type="l",col="blue")
        legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("dark grey","red","blue"),bty="n",lty=c(1.5,1.5,1.5),lwd=c(2.5,2.5,2.5))
        #Q4
        plot(Date.Time1,Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")
})
#Closing the device
dev.off()
