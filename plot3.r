if(!exists('dat')){

        source('load_data.R')
        } ## Avoiding redundancy - this should load the data  in 'dat' object






png(filename = 'plot3.png',width = 900,height = 500)


plot(dat$Sub_metering_1~dat$Date ,type = 'l',ylab='Energy Submetering',xlab='Date')
lines(dat$Sub_metering_2~dat$Date ,type = 'l',col='red')
lines(dat$Sub_metering_3~dat$Date ,type = 'l',col='blue')
legend('topright',legend = c(names(dat[7:9])),col = c('black','red','blue'),lty = 1)

dev.off()
