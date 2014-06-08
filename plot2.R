##Course4-Exploratory Data Analysis ##plot2

##Reading the txt file and tranforming it prior to plotting
electric<-read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors=F)
electric1<-electric[complete.cases(electric),]
##Faced issue narrowing down to date as 02/01/2007 was not working, worked when 2/1/2007 is used instead
electric2<-subset(electric1,Date=="1/2/2007" | Date=="2/2/2007",row.names=NULL)
electric2$Date1<-paste(electric2$Date,electric2$Time,sep=" ")#combine Date and time to a single column
electric2$Date1<-strptime(electric2$Date1,"%d/%m/%Y %H:%M:%S")# convert Date/time from character to Date-Time


## plot 2
par(mfrow=c(1,1))
##png(file="plot2.png")
with(electric2,plot(Date1,as.double(Global_active_power),type="l",ylab="Global Active Power(kilowatts)",xlab=""))
dev.copy(png,file="plot2.png",width=480,height=480,units="px")
dev.off()