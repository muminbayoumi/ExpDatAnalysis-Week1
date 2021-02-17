if(!exists('dat')){source('load_data.R')
} ## Avoiding redundancy - this should load the data  in 'dat' object


png(filename = 'plot2.png',width = 900,height = 500)


plot(dat$Global_active_power~dat$Date,type = 'l',main='Global Active Power Across 2 days',xlab='Date',ylab = 'Global Active Power')
dev.off()




