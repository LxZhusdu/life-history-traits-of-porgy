setwd("E:/fishr/cardinalisW") #set your working directory
rm(list=ls())
library(rjags)
library(LaplacesDemon)
lwdata<-read.csv("lwbf2000.csv") # put data file in working directory
Score<-lwdata$score
ab<-cbind(log10(lwdata$a),lwdata$b)
N<-nrow(ab)
data<-list(ab=ab,weight=Score,N=N)
parameters<-c("beta","a","sigma1","sigma2","ro")
n.adapt<-50000
n.update<-50000 
n.iter<-50000
n.thin<-10
jm<-jags.model("lwmodelbf2000.R",data=data,n.chains=3,n.adapt=n.adapt)
update(jm,n.update)
zm<-coda.samples(jm,variable.names=parameters,n.iter=n.iter,n.thin=n.thin) # conduct repeatly if not converge
print(gelman.diag(zm))
print(heidel.diag(zm))

sta_lw<-summary(zm)               
mu_sd<-sta_lw$stat[,1:2]          # mean and SD
q_CI<-sta_lw$quantile[,c(3,1,5)]  # median,lower and upper
df<-as.data.frame(rbind(zm[[1]],zm[[2]],zm[[3]]))    # put N chains results together
HDI<-p.interval(df,HPD=TRUE,MM=FALSE,plot=FALSE)
table<-cbind(mu_sd,q_CI[,1],HDI)  
#write.csv(data.frame(signif(table,digits=9)),file="lw_bf2000_statistics.csv") 
#write.csv(df,file="lw_bf2000_mcmc.csv",row.names=F)