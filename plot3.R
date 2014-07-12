##Course4-Exploratory Data Analysis plot3

##Reading the txt file and tranforming it prior to plotting
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("household_power_consumption.txt")){
  download.file(url,destfile="powerconsumptiondata.zip") 
  unzip("powerconsumptiondata.zip")
}
electric<-read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors=F)
electric1<-electric[complete.cases(electric),]
##Use 2/1/2007 and not 02/01/2007 
electric2<-subset(electric1,Date=="1/2/2007" | Date=="2/2/2007",row.names=NULL)
electric2$Date1<-paste(electric2$Date,electric2$Time,sep=" ")#combine Date and time to a single column
electric2$Date1<-strptime(electric2$Date1,"%d/%m/%Y %H:%M:%S")# convert Date/time from character to Date-Time

## plot3
par(mfrow=c(1,1))
png(file="plot3.png",width=480,height=480,units="px")
with(electric2,plot(Date1, as.double(Sub_metering_1),type="n",ylab="Energy sub metering",xlab=""))
with(electric2,lines(Date1, as.double(Sub_metering_1),col="black"))
with(electric2,lines(Date1, as.double(Sub_metering_2),col="red"))
with(electric2,lines(Date1, as.double(Sub_metering_3),col="blue"))
legend("topright",pch="_", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##dev.copy(png,file="plot3.png",width=480,height=480,units="px")
dev.off()