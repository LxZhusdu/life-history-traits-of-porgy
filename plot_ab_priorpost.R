# Plotting Figure 6 using MCMC estimates
# lengthweightbf2000.R generates lw_bf2000_mcmc.csv
# lengthweight06_15.R generates other four data files
# Users can plot Figure 6 when conducting all the calculation.
# Data files are not uploaded due to the limit of space size.
# plot_ab_priorpostnormdis.R plots a similar figure as Figure 6.
setwd("E:/fishr/cardinalisW")
rm(list=ls())
databf0<-read.csv("lw_bf2000_mcmc.csv")
data6<-read.csv("lw_2006_mcmc.csv")
data7<-read.csv("lw_2007_mcmc.csv")
data8<-read.csv("lw_2008_mcmc.csv")
data15<-read.csv("lw_2015_mcmc.csv")

denloga_bf0<-density(databf0$'beta.1.')
denb_bf0<-density(databf0$'beta.2.')
denloga_6<-density(data6$'beta.1.')
denb_6<-density(data6$'beta.2.')
denloga_7<-density(data7$'beta.1.')
denb_7<-density(data7$'beta.2.')
denloga_8<-density(data8$'beta.1.')
denb_8<-density(data8$'beta.2.')
denloga_15<-density(data15$'beta.1.')
denb_15<-density(data15$'beta.2.')

prior_mn_loga<--1.5933;
prior_sd_loga<-sqrt(1/24.9464)
prior_mn_b<-3.0391
prior_sd_b<-sqrt(1/59.9972)
loga0<-seq(prior_mn_loga-3*prior_sd_loga,prior_mn_loga+3*prior_sd_loga,0.01)
den_loga0<-dnorm(loga0,prior_mn_loga,prior_sd_loga)
b0<-seq(prior_mn_b-3*prior_sd_b,prior_mn_b+3*prior_sd_b,0.01);
den_b0<-dnorm(b0,prior_mn_b,prior_sd_b)

pdf("den_logab_mcmc.pdf",width = 15/2.54, height = 12.4/2.54 )
layout(matrix(c(1,2,3,3),byrow=TRUE,ncol=2)) 
par(oma=c(0,0,0,0),mar=c(4,4,0.5,1),cex=0.8,las=1,mgp=c(2.5,1,0))

plot(loga0,den_loga0,type="l",lty=3,main="",col="black",tck=-0.03, xlim=c(-2.12,-0.99),ylim=c(0,6.5),
      xlab=expression("log"[10]*"("*italic(a)*")"),ylab="Density")  
lines(denloga_bf0$x,denloga_bf0$y,lty=2) 
lines(denloga_6$x,denloga_6$y,lty=4,col="blue") 
lines(denloga_7$x,denloga_7$y,lty=5,col="green") 
lines(denloga_8$x,denloga_8$y,lty=6,col="cyan") 
lines(denloga_15$x,denloga_15$y,lty=1,col="red") 

plot(b0,den_b0,type="l",lty=3,main="",col="black",tck=-0.03, xlim=c(2.7,3.4),ylim=c(0,9.2),
      xlab=expression(italic(b)),ylab="Density"   )
lines(denb_bf0$x,denb_bf0$y,lty=2) 
lines(denb_6$x,denb_6$y,lty=4,col="blue") 
lines(denb_7$x,denb_7$y,lty=5,col="green") 
lines(denb_8$x,denb_8$y,lty=6,col="cyan") 
lines(denb_15$x,denb_15$y,lty=1,col="red") 

plot(0,0, type="n", axes=FALSE,bty="n",xlab="",ylab="")
legend("top",c("Prior", "1999","2006","2007","2008","2015"),lty=c(3,2,4,5,6,1),
        col=c("black","black","blue","green","cyan","red"),bty="n",horiz=TRUE)

dev.off()
