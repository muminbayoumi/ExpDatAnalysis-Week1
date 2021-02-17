if(!exists('dat')){

        source('load_data.R')
} ## Avoiding redundancy - this should load the data  in 'dat' object






png(filename = 'plot4.png',width = 900,height = 500)

par(mfrow=c(2,2))
hist(dat$Global_active_power,col = 'red',xlab = 'Global Active Power(kilowatts)',main ='Global Active Power')
plot(dat$Global_active_power~dat$Date,type = 'l',main='Global Active Power Across 2 days',xlab='Date',ylab = 'Global Active Power')

plot(dat$Sub_metering_1~dat$Date ,type = 'l',ylab='Energy Submetering',xlab='Date',main='Submetering Acorss 2 days')
lines(dat$Sub_metering_2~dat$Date ,type = 'l',col='red')
lines(dat$Sub_metering_3~dat$Date ,type = 'l',col='blue')
legend('topright',legend = c(names(dat[7:9])),col = c('black','red','blue'),lty = 1)

plot(dat$Voltage~dat$Date,ylab='Voltage',type='l',main='Voltage Acorss 2 days')
dev.off()
