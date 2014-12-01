tab_full <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE);
#subset data to only keep 2007-02-01 ~ 2007-02-02 data
tab_subset <- tab_full[tab_full$Date == "1/2/2007" | tab_full$Date == "2/2/2007", ];
#convert time information string to DateAndTime
tab_subset$DateTime <- paste(tab_subset$Date, tab_subset$Time);
tab_subset$DateTime <- strptime(tab_subset$DateTime,  "%d/%m/%Y %H:%M:%S");

#plotting
tab_subset$Global_active_power <- as.numeric(tab_subset$Global_active_power);
png(file="plot2.png", width=480, height = 480);
plot(tab_subset$DateTime, tab_subset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)");
dev.off();