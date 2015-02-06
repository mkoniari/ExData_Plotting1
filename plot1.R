source("loadData.R")


# Plot 1
getPlot1 <- function(gdata) {
  p <- hist(gdata$Global_active_power, breaks=8, col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)")
}

png("plot1.png", height=480, width=480)
getPlot1(PCdata)
dev.off()

cat(" ALL DONE")