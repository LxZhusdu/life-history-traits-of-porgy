# estimate natural mortality rate using values calculated with the ratio of M to K derived from LBB for the data of Wang et al.(2020)
setwd("E:/fishr/cardinalisM")
rm(list=ls())
library(rjags)
library(LaplacesDemon)
year<-2006
file1<-paste("E:/fishr/cardinalisG/growth",as.character(year),".csv",sep="")#notice the working directory
file2<-paste("M2_",as.character(year),"_statistics.csv",sep="")
file3<-paste("M2_",as.character(year),"_mcmc.csv",sep="")
mydata<-read.csv(file1)
inits1<-list(theta=c(24, 0.4, 0.7))               
inits2<-list(theta=c(25, 0.3, 0.6))
inits3<-list(theta=c(26, 0.2, 0.5))
inits<-list(inits1,inits2,inits3)
B=cbind(mydata$Linf,mydata$K,mydata$M2)
n<-nrow(B)
data<-list(B=B,N=n)
n.adapt<-50000
n.update<-50000
n.iter<-50000
jm<-jags.model("Mmodel06_18.R",data=data,n.chains=3,n.adapt=n.adapt,inits=inits)
update(jm,n.update)

zm<-coda.samples(jm, variable.names=c("theta","rho"),n.iter=n.iter,n.thin=10)# conduct repeatly if not converge
print(gelman.diag(zm))
print(heidel.diag(zm))

sta_M<-summary(zm)               
mu_sd<-sta_M$stat[,1:2]          
q_CI<-sta_M$quantile[,c(3,1,5)]  
df<-as.data.frame(rbind(zm[[1]],zm[[2]],zm[[3]]))    # put N chains results together
HDI<-p.interval(df,HPD=TRUE,MM=FALSE,plot=FALSE)
table<-cbind(mu_sd,q_CI[,1],HDI)
# write.xlsx(data.frame(signif(table,digits=9)),file=file2,rowNames=T)  
# write.xlsx(df,file=file3)