##Load and format the data into R
pow_cons<-read.table("household_power_consumption.txt", header=F, sep = ";", skip = 66240, nrows = 4320, colClasses = "character")
pow_cons_names<-read.table("household_power_consumption.txt", header=F, sep = ";", nrows = 1, colClasses = "character")
colnames(pow_cons)<-pow_cons_names
pow_cons[,3:9]<-sapply(pow_cons[,3:9], as.numeric)
pow_cons[,1]<-as.Date(pow_cons[,1], "%d/%m/%Y")
pow_cons<-pow_cons[pow_cons$Date!="2007-02-03",]
pow_cons<-pow_cons[pow_cons$Date!="2007-01-31",]
pow_cons$Date_Time<-paste(pow_cons[,1], pow_cons[,2])
strptime(pow_cons$Date_Time, "%Y-%m-%d %H:%M:%S") -> pow_cons$Date_Time

##Plot1
png(filename = "plot1.png")
hist(pow_cons$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main = "Global Active Power")
dev.off()
