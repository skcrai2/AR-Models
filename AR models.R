
library(stats)
# Simulate AR process
#NOTE: "acf" function in "TSA" package drops acf at lag 0.

                                         #AR(1) model:
sim.ar1<-arima.sim(model=list(ar=2.5,-1.5),n=1000)  #Simulate AR(1) model with coefficient 0.5
ts.plot(sim.ar1) #plot the process
#Plot sample auto-correlation function
acf(sim.ar1) # exponential decay
pacf(sim.ar1) #All pacf after lag 1 are not significant (equal to zero).

#To plot theoritical auto-correlation function
lagmax=10 #set maximum lag for plot acf
ACF=ARMAacf(ar = 2.5,-1.5, lag.max = lagmax, pacf = FALSE)
plot(seq(0,lagmax,1),ACF,type="h",xlab="lag")
abline(h=0) # acfs after lage 1 are all 0.

#To plot theoritical partial auto-correlation function
lagmax=10 #set maximum lag for plot acf
PACF=ARMAacf(ar = 2.5,-1.5, lag.max = lagmax, pacf = TRUE)
plot(seq(1,lagmax,1),PACF,type="h",xlab="lag")
abline(h=0) # acfs after lage 1 are all 0.

                                          #AR(2) model:
sim.ar2<-arima.sim(model=list(ar=c(-1/6,-1/6)),n=1000)  #Simulate AR(2) model with coefficients -1/6 and -1/6
ts.plot(sim.ar2) #plot the process
#Plot sample auto-correlation function
acf(sim.ar2) #exponential decay
pacf(sim.ar2)# All acf after lag 2 are not significant (equal to zero).

#To plot theoritical auto-correlation function
lagmax=10 #set maximum lag for  acf plot
ACF=ARMAacf(ar = c(-1/6,-1/6), lag.max = lagmax, pacf = FALSE)
plot(seq(0,lagmax,1),ACF,type="h",xlab="lag")
abline(h=0) # acfs after lags 1 are all 0.

#To plot theoritical partial auto-correlation function
lagmax=10 #set maximum lag for  acf plot
ACF=ARMAacf(ar = c(-1/6,-1/6), lag.max = lagmax, pacf = TRUE)
plot(seq(1,lagmax,1),ACF,type="h",xlab="lag")
abline(h=0) # pacfs after lag 2 are all 0.

#Explosive AR(1) model
start=0
x=c()
for(i in 1:1000){
    x[i]=1.02*start + rnorm(1,mean=0,sd=9)
    start=x[i]
}
ts.plot(x)
