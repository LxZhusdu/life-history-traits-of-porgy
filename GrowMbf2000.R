setwd("E:/fishr/cardinalisM")
rm(list=ls())
library(rjags)
library(LaplacesDemon)
mydata<-read.csv("E:/fishr/cardinalisG/growthbf2000.csv")
omega<-structure(.Data=c(1,0.001,0.001,0.001,1,0.001,0.001,0.001,1),.Dim=c(3,3))
B<-cbind(mydata$Linf,mydata$K,mydata$M)
n<-nrow(B)
data<-list(B=B,N=n,omega=omega)
parameters<-c("theta","rho","R")
n.adapt<-5000
n.update<-5000
n.iter<-50000
jm<-jags.model("Mmodelbf2000.R", data=data,n.chains=3,n.adapt=n.adapt)
update(jm,n.update)

zm<-coda.samples(jm, variable.names=parameters,n.iter=n.iter,n.thin=10)#conduct repeatly if not converge
print(heidel.diag(zm))

sta_M<-summary(zm)               
mu_sd<-sta_M$stat[,1:2]          
q_CI<-sta_M$quantile[,c(3)]  
df<-as.data.frame(rbind(zm[[1]],zm[[2]],zm[[3]]))  # put N chains results together
HDI<-p.interval(df,HPD=TRUE,MM=FALSE,plot=FALSE)
table<-cbind(mu_sd,q_CI,HDI)
#write.csv(signif(table,digits=9),file="M_bf2000_statistic.csv") 
#write.csv(df,file="M_bf2000_mcmc.csv")