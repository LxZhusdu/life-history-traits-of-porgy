# Calculate growth parameters using the priors and data sets between 1961 and 1999. 
setwd("E:/fishr/cardinalisG") # set your own working directory when using this code
rm(list=ls())
library(rjags)
library(LaplacesDemon)
growdata<-read.csv("growthbf2000.csv") # Put file growthbf2000 in your working directory
omega<-structure(.Data=c(1,0.001,0.001,0.001,1,0.001,0.001,0.001,1),.Dim=c(3,3))
B<-cbind(growdata$Linf,growdata$K,growdata$t0)
n<-nrow(B)
data<-list(B=B,N=n,omega=omega)
parameters=c("theta","R")
n.adapt<-  50000
n.update<-50000
n.iter<-  50000
jm<-jags.model("growmodelbf2000.R",data=data,n.chains=3,n.adapt=n.adapt) 
update(jm,n.update)
zm<-coda.samples(jm,variable.names=parameters,n.iter=n.iter,n.thin=10) #conduct repeatly if not converge
print(heidel.diag(zm))
sta_grow<-summary(zm)               
mu_sd<-sta_grow$stat[,1:2]         
q_CI<-sta_grow$quantile[,c(3,1,5)]  
df<-as.data.frame(rbind(zm[[1]],zm[[2]],zm[[3]]))    # put N chains results together
HDI<-p.interval(df,HPD=TRUE,MM=FALSE,plot=FALSE)
table<-cbind(mu_sd,q_CI,HDI)
#write.csv(signif(table,digits=9),file="grow_bf2000_statistics.csv") 
#write.csv(df,file="grow_bf2000_mcmc.csv")

k<-df[,11]
linf<-df[,10]
id<-k>0 & k<1
k2<-k[id]
linf2<-linf[id]
# distribution of phy in 1999 served as priors to derive phy and k for data of Wang et al.(2020)
phi<-cbind(log10(k2)+2*log10(linf2),log10(k2)) 
mn<-apply(phi,2,mean) 
s<-apply(phi,2,sd) 
md<-apply(phi,2,median)             
HDI<-p.interval(phi,HPD=TRUE,MM=FALSE,plot=FALSE)
table<-cbind(mn,s,md,HDI)
#write.csv(data.frame(signif(table,digits=9)),file="PHY_statistics.csv")  
