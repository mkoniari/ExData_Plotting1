source("loadData.R")
source("plot2.R")
source("plot3.R")


# Plot 4

getPlot4_1 <- function(gdata) {
  p <- ggplot(data=gdata, aes(x=mydate, y=Voltage)) + geom_line()
  p <- p + theme_bw() +  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
  p <- p + xlab("datetime") + ylab("Voltage")
  p <- p + scale_x_datetime(breaks = date_breaks("1 day"), labels=timeD_formatter)    
}

getPlot4_2 <- function(gdata) {
  p <- ggplot(data=gdata, aes(x=mydate, y=Global_reactive_power)) + geom_line()
  p <- p + theme_bw() +  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
  p <- p + xlab("datetime") + ylab("Global_reactive_power")
  p <- p + scale_x_datetime(breaks = date_breaks("1 day"), labels=timeD_formatter)    
}


getPlot4 <- function(gdata) {
  p2 = getPlot2(gdata)
  p3 = getPlot3(gdata)
  p4_1 = getPlot4_1(gdata)
  p4_2 = getPlot4_2(gdata)    
  grid.arrange(p2, p4_1, p3, p4_2, ncol = 2)
}


png("plot4.png", height=480, width=480)
getPlot4(PCdata)
dev.off()


cat(" ALL DONE")