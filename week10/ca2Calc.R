results= "C:\\College\\Epa-Fedora\\week10\\results.dat"
read.table(results, header = TRUE)
df <- read.delim(results,header = TRUE, sep = "\t")

C0 <- (df$C0)
N<- (df$N)
Idle<- (df$idle)
TimeSecs <- (5)


utilisation<- (100 - Idle)/100

SystemThroughput<-(C0/TimeSecs)
ServiceDemand<- (utilisation/SystemThroughput)
responseAvgTime<-(N/SystemThroughput)

plot(N,utilisation, main="Ui vs N", ylab = "Utilisation", xlab="Users")
plot(N,ServiceDemand, main="Di vs N", ylab = "Service Demand", xlab="Users")
plot(N,SystemThroughput, main="X0 vs N", ylab = "System Throughput", xlab="Users")
plot(N,responseAvgTime, main="R vs N", ylab = "ResponseAvgTime", xlab="Users")
