tab_full <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE);
#subset data to only keep 2007-02-01 ~ 2007-02-02 data
tab_subset <- tab_full[tab_full$Date == "1/2/2007" | tab_full$Date == "2/2/2007", ];
#convert time information string to DateAndTime
tab_subset$DateTime <- paste(tab_subset$Date, tab_subset$Time);
tab_subset$DateTime <- strptime(tab_subset$DateTime,  "%d/%m/%Y %H:%M:%S");
tab_subset$Sub_metering_1 <- as.numeric(tab_subset$Sub_metering_1);
tab_subset$Sub_metering_2 <- as.numeric(tab_subset$Sub_metering_2);
tab_subset$Sub_metering_3 <- as.numeric(tab_subset$Sub_metering_3);

#plotting
png(file="plot3.png", width=480, height = 480);
plot(tab_subset$DateTime, tab_subset$Sub_metering_1, type = "l", col = "black", xlab= "", ylab = "Energy sub metering");
lines(tab_subset$DateTime, tab_subset$Sub_metering_2, type = "l", col = "red");
lines(tab_subset$DateTime, tab_subset$Sub_metering_3, type = "l", col = "blue");
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=1);
dev.off();
