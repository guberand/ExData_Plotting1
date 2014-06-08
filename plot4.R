##Course4-Exploratory Data Analysis ##plot4

##Reading the txt file and tranforming it prior to plotting
electric<-read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors=F)
electric1<-electric[complete.cases(electric),]
##Faced issue narrowing down to date as 02/01/2007 was not working, worked when 2/1/2007 is used instead
electric2<-subset(electric1,Date=="1/2/2007" | Date=="2/2/2007",row.names=NULL)
electric2$Date1<-paste(electric2$Date,electric2$Time,sep=" ")#combine Date and time to a single column
electric2$Date1<-strptime(electric2$Date1,"%d/%m/%Y %H:%M:%S")# convert Date/time from character to Date-Time



##plot4
png(file="plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
##ROW1/COLUMN1
electric2$Date1<-paste(electric2$Date,electric2$Time,sep=" ")#combine Date and time to a single column
electric2$Date1<-strptime(electric2$Date1,"%d/%m/%Y %H:%M:%S")# convert Date/time from character to Date-Time
with(electric2,plot(Date1,as.double(Global_active_power),type="l",ylab="Global Active Power",xlab=""))

##ROW1/COLUMN2
with(electric2,plot(Date1,as.double(Voltage),type="l",ylab="Voltage",xlab="datetime"))

##ROW2/COLUMN1
with(electric2,plot(Date1, as.double(Sub_metering_1),type="n",ylab="Energy sub metering",xlab=""))
with(electric2,lines(Date1, as.double(Sub_metering_1),col="black"))
with(electric2,lines(Date1, as.double(Sub_metering_2),col="red"))
with(electric2,lines(Date1, as.double(Sub_metering_3),col="blue"))
legend("topright",pch="_", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##ROW2/COLUMN2

with(electric2,plot(Date1,as.double(Global_reactive_power),type="l",ylab="Global_reactive_power",xlab="datetime"))
dev.off()