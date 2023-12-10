# Estimate growth performance index and growth parameter k using values of Linf from LBB
# Values of Linf from LBB were estimated by Wang et al.(2020)
# phi_com and k_com are common growth performance index and common growth parameter k between 2006 and 2018
#          for the data of Wang et al. (2020)
# phi and k include growth performance index and growth parameter k in each year between 2006 and 2018.
setwd("E:/fishr/cardinalisGN4")
rm(list=ls())
library(rjags)
library(LaplacesDemon)
wangdata<-read.csv("wangxh.csv")
lgL<-log10(wangdata$Linf)
n<-length(lgL)
data<-list(lgL=lgL,N=n)
parameters<-c("k_com","k","phi","phi_com","sigma","sigma2","sigma3")
n.adapt=  50000
n.update=50000
n.iter=  50000

jm<-jags.model("k_fromLinf_model.R",
              data=data,n.chains=3,n.adapt=n.adapt) #inits=inits
update(jm,n.update)

zm<-coda.samples(jm,variable.names=parameters,n.iter=n.iter,n.thin=10) # conduct repeatly if not converge
print(gelman.diag(zm))
print(heidel.diag(zm))

sta_wang<-summary(zm)               
mu_sd<-sta_wang$stat[,1:2]          
q_CI<-sta_wang$quantile[,c(3,1,5)] 
df<-as.data.frame(rbind(zm[[1]],zm[[2]],zm[[3]]))    # put N chains results together
HDI<-p.interval(df,HPD=TRUE,MM=FALSE,plot=FALSE)
table<-cbind(mu_sd,q_CI[,1],HDI)
#write.csv(signif(table,digits=9),file="k_wang_statistics.csv") 
#write.csv(df,file="k_wang_mcmc.csv")