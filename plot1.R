##Course4-Exploratory Data Analysis ##plot1
  
##Reading the txt file and tranforming it prior to plotting
  electric<-read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors=F)
electric1<-electric[complete.cases(electric),]
electric2<-subset(electric1,Date=="1/2/2007" | Date=="2/2/2007",row.names=NULL)
electric2$Date1<-paste(electric2$Date,electric2$Time,sep=" ")#combining Date and time to a single column
electric2$Date1<-strptime(electric2$Date1,"%d/%m/%Y %H:%M:%S")# convert Date/time from character to Date-Time

##plot1
  par(mfrow=c(1,1))
  ##png(file="plot1.png")
  with(electric2, hist(as.double(Global_active_power),
            xlab="Global Active Power(kilowatts)",ylab="Frequency", main="Global Active Power",col="red"))
  dev.copy(png,file="plot1.png",width=480,height=480,units="px")
  dev.off()
  
