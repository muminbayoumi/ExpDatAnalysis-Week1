if(!exists('dat')){
        source('load_data.R')
} ## Avoiding redundancy - this should load the data  in 'dat' object




png(filename = 'plot1.png',width = 900,height = 500)
hist(dat$Global_active_power,col = 'red',xlab = 'Global Active Power(kilowatts)',main ='Global Active Power')
dev.off()




