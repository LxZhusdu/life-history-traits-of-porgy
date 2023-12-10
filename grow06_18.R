setwd("E:/fishr/cardinalisGN4") # set your own working directory when using this code
rm(list=ls())
library(rjags)
library(LaplacesDemon)
year<-2006
file1<-paste("growth",as.character(year),".csv",sep="") # put data files in the same working directory; otherwise, working directory must be specified
file2<-paste("growth_",as.character(year),"_statistics.csv",sep="")
file3<-paste("growth_",as.character(year),"_mcmc.csv",sep="")
growdata<-read.csv(file1)
inits1<-list(theta=c(25,0.4,-0.7))               
inits2<-list(theta=c(26,0.3,-0.6))
inits3<-list(theta=c(27,0.2,-0.5))
inits<-list(inits1,inits2,inits3)
B<-cbind(growdata$Linf,growdata$K,growdata$t0)
n<-nrow(B)
data<-list(B=B,N=n)
n.adapt<-50000
n.update<-50000
n.iter<-50000
jm<-jags.model("growmodel06_18.R",
              data=data,n.chains=3,n.adapt=n.adapt,inits=inits)
update(jm,n.update)

zm<-coda.samples(jm, variable.names=c("theta","rho"),n.iter=n.iter,n.thin=10) # conduct repeatly if not converge
gelman<-gelman.diag(zm)
print(heidel.diag(zm))

sta_grow<-summary(zm)              
mu_sd<-sta_grow$stat[,1:2]          
q_CI<-sta_grow$quantile[,c(3,1,5)]  
df<-as.data.frame(rbind(zm[[1]],zm[[2]],zm[[3]]))    # put N chains results together
HDI<-p.interval(df,HPD=TRUE,MM=FALSE,plot=FALSE)
table<-cbind(mu_sd,q_CI[,1],HDI)
# write.csv(data.frame(signif(table,digits=9)),file=file2)  
# write.csv(df,file=file3,row.names=F)
