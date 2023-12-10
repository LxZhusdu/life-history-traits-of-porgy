#priors from results derived from growbf2000.R
model{
 for (j in 1:N){
   lgL[j]~dnorm(beta[j],tau)
   beta[j]<-0.5*phi[j]-0.5*logk[j]
      }
   for (i in 1:N){
       logk[i]~dnorm(logk_com,tau2)
       k[i]<-10^logk[i]
       phi[i]~dnorm(phi_com,tau3)      
       }  
   tau<-pow(sigma,-2)
   tau2<-pow(sigma2,-2)
   tau3<-pow(sigma2,-2)
   phi_com~dnorm(2.2123,21.9943)
   logk_com~dnorm(-0.6171,22.2010)
   k_com<-10^logk_com
   sigma~dunif(0,100)
   sigma2~dunif(0,100)
   sigma3~dunif(0,100)
   }