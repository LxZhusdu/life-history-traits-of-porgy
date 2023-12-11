# plotting a figure using statistics of data files in plot_ab_priorpost.R that is similar to Figure 6
setwd("E:/fishr/cardinalisW")
rm(list=ls())
databf0s<-read.csv("lw_bf2000_statistics.csv")
data6s<-read.csv("lw_2006_statistics.csv")
data7s<-read.csv("lw_2007_statistics.csv")
data8s<-read.csv("lw_2008_statistics.csv")
data15s<-read.csv("lw_2015_statistics.csv")

prior_mn_loga<--1.5933;
prior_sd_loga<-sqrt(1/24.9464)
prior_mn_b<-3.0391
prior_sd_b<-sqrt(1/59.9972)
loga0<-seq(prior_mn_loga-3*prior_sd_loga,prior_mn_loga+3*prior_sd_loga,0.01)
den_loga0<-dnorm(loga0,prior_mn_loga,prior_sd_loga)
b0<-seq(prior_mn_b-3*prior_sd_b,prior_mn_b+3*prior_sd_b,0.01);
den_b0<-dnorm(b0,prior_mn_b,prior_sd_b)

loga_bf0<-seq(databf0s$Mean[2]-4*databf0s$SD[2],databf0s$Mean[2]+4*databf0s$SD[2],0.01)
loga_6<-seq(data6s$Mean[2]-4*data6s$SD[2],data6s$Mean[2]+4*data6s$SD[2],0.01)
loga_7<-seq(data7s$Mean[2]-4*data7s$SD[2],data7s$Mean[2]+4*data7s$SD[2],0.01)
loga_8<-seq(data8s$Mean[2]-4*data8s$SD[2],data8s$Mean[2]+4*data8s$SD[2],0.01)
loga_15<-seq(data15s$Mean[2]-4*data15s$SD[2],data15s$Mean[2]+4*data15s$SD[2],0.01)

den_loga_bf0<-dnorm(loga_bf0,databf0s$Mean[2],databf0s$SD[2])
den_loga_6<-dnorm(loga_6,data6s$Mean[2],data6s$SD[2])
den_loga_7<-dnorm(loga_7,data7s$Mean[2],data7s$SD[2])
den_loga_8<-dnorm(loga_8,data8s$Mean[2],data8s$SD[2])
den_loga_15<-dnorm(loga_15,data15s$Mean[2],data15s$SD[2])

b_bf0<-seq(databf0s$Mean[3]-4*databf0s$SD[3],databf0s$Mean[3]+4*databf0s$SD[3],0.01)
b_6<-seq(data6s$Mean[3]-4*data6s$SD[3],data6s$Mean[3]+4*data6s$SD[3],0.01)
b_7<-seq(data7s$Mean[3]-4*data7s$SD[3],data7s$Mean[3]+4*data7s$SD[3],0.01)
b_8<-seq(data8s$Mean[3]-4*data8s$SD[3],data8s$Mean[3]+4*data8s$SD[3],0.01)
b_15<-seq(data15s$Mean[3]-4*data15s$SD[3],data15s$Mean[3]+4*data15s$SD[3],0.01)

den_b_bf0<-dnorm(b_bf0,databf0s$Mean[3],databf0s$SD[3])
den_b_6<-dnorm(b_6,data6s$Mean[3],data6s$SD[3])
den_b_7<-dnorm(b_7,data7s$Mean[3],data7s$SD[3])
den_b_8<-dnorm(b_8,data8s$Mean[3],data8s$SD[3])
den_b_15<-dnorm(b_15,data15s$Mean[3],data15s$SD[3])  

pdf("den_logab_statistics.pdf",width = 15/2.54, height = 12.4/2.54 )
layout(matrix(c(1,2,3,3),byrow=TRUE,ncol=2)) 
par(oma=c(0,0,0,0),mar=c(4,4,0.5,1),cex=0.8,las=1,mgp=c(2.5,1,0))

plot(loga0,den_loga0,type="l",lty=3,main="",col="black",tck=-0.03, xlim=c(-2.12,-0.99),ylim=c(0,6.5),
      xlab=expression("log"[10]*"("*italic(a)*")"),ylab="Density")  
lines(loga_bf0,den_loga_bf0,lty=2) 
lines(loga_6,den_loga_6,lty=4,col="blue") 
lines(loga_7,den_loga_7,lty=5,col="green") 
lines(loga_8,den_loga_8,lty=6,col="cyan") 
lines(loga_15,den_loga_15,lty=1,col="red") 

plot(b0,den_b0,type="l",lty=3,main="",col="black",tck=-0.03, xlim=c(2.7,3.4),ylim=c(0,9.2),
      xlab=expression(italic(b)),ylab="Density"   )
lines(b_bf0,den_b_bf0,lty=2) 
lines(b_6,den_b_6,lty=4,col="blue") 
lines(b_7,den_b_7,lty=5,col="green") 
lines(b_8,den_b_8,lty=6,col="cyan") 
lines(b_15,den_b_15,lty=1,col="red") 

plot(0,0, type="n", axes=FALSE,bty="n",xlab="",ylab="")
legend("top",c("Prior", "1999","2006","2007","2008","2015"),lty=c(3,2,4,5,6,1),
        col=c("black","black","blue","green","cyan","red"),bty="n",horiz=TRUE)

dev.off()