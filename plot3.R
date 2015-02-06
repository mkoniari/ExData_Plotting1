source("loadData.R")

# Plot 3
getPlot3 <- function(gdata) {
  
  data3 <- gdata %>%
    gather( class, grade, Sub_metering_1:Sub_metering_3, na.rm = TRUE) %>%
    select(mydate, class, grade) 
  
  cbPalette <- c("#000000", "red", "blue")
  p <- ggplot(data=data3, aes(x=mydate, y=grade, group=class, color = class)) + geom_line()
  p <- p + theme_bw() +  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
  p <- p + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
  p <- p + theme(axis.title.x = element_blank()) + ylab("Energy sub metering")
  p <- p + theme(legend.justification=c(1,1), legend.position=c(1,1)) 
  p <- p + scale_x_datetime(breaks = date_breaks("1 day"), labels=timeD_formatter)
  p <- p + scale_colour_manual(values=cbPalette)  
  p <- p + theme(legend.title=element_blank())
}

png("plot3.png", height=480, width=480)
print(getPlot3(PCdata))
dev.off()

cat(" ALL DONE")