source("loadData.R")

# Plot 2
getPlot2 <- function(gdata) {
  p <- ggplot(data=gdata, aes(x=mydate, y=Global_active_power, group=1)) + geom_line()
  p <- p + theme_bw() +  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
  p <- p + theme(axis.title.x = element_blank()) + ylab("Global Active Power (kilowatts)")
  p <- p + scale_x_datetime(breaks = date_breaks("1 day"), labels=timeD_formatter)    
}

png("plot2.png", height=480, width=480)
print(getPlot2(PCdata))
dev.off()


cat(" ALL DONE")