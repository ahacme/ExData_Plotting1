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


#----Plot2
par(mfrow=c(1,1),mar=c(4,4,2,2))
plot(dt4$Date.Time1,dt4$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")

#Write to a png device
dev.copy(png,file="plot2.png")
dev.off()
