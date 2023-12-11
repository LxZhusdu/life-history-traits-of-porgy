setwd("E:/fishr/cardinalisW") # set your working directory
rm(list=ls())
library(rjags)
library(LaplacesDemon)
year<-2006  # 2006,2007,2008,2015
file1<-paste("lw",as.character(year),".csv",sep="")
file2<-paste("lw_",as.character(year),"_statistics.csv",sep="")
file3<-paste("lw_",as.character(year),"_mcmc.csv",sep="")
lwdata<-read.csv(file1)
Score<-lwdata$score
ab<-cbind(log10(lwdata$a),lwdata$b)
N<-nrow(ab)
data<-list(ab=ab,weight=Score,N=N)
inits1<-list(beta=c(-1.3,2.9),sigma1=0.24,sigma2=0.17,ro=-0.9)
inits2<-list(beta=c(-1.4,3.0),sigma1=0.25,sigma2=0.18,ro=-0.8)
inits3<-list(beta=c(-1.5,3.1),sigma1=0.26,sigma2=0.19,ro=-0.7)
inits<-list(inits1,inits2,inits3)
parameters<-c("a1","beta","sigma1","sigma2","ro")
n.adapt<-5000
n.update<-50000
n.iter<-50000
n.thin<-10
jm<-jags.model("lwmodel06_15.R",data=data,n.chains=3,n.adapt=n.adapt,inits=inits)
update(jm,n.update)

zm<-coda.samples(jm,variable.names=parameters,n.iter=n.iter,n.thin=n.thin) # conduct repeatly if not converge
print(gelman.diag(zm))
print(heidel.diag(zm))

sta_lw<-summary(zm)               
mu_sd<-sta_lw$stat[,1:2]          
q_CI<-sta_lw$quantile[,c(3,1,5)]  
df<-as.data.frame(rbind(zm[[1]],zm[[2]],zm[[3]]))    # put N chains results together
HDI<-p.interval(df,HPD=TRUE,MM=FALSE,plot=FALSE)
table<-cbind(mu_sd,q_CI[,1],HDI)
#write.csv(data.frame(signif(table,digits=9)),file=file2) 
#write.csv(df,file=file3,row.names=F)
