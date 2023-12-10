#priors from results derived from growbf2000.R
model{
   for (i in 1:N){
     B[i,1:3]~dmnorm(theta[1:3],R[,])
     }
   theta[1]~dnorm(25.9953,1.7710)
   theta[2]~dgamma(4.8607,19.2395)
   theta[3]~dnorm(-0.5598,18.4898)
   R[1,1]~dgamma(3.5024,5.0366)
   R[2,1]~dnorm(0.1001,1.4652)
   R[3,1]~dnorm(-0.2942,1.4492)
   R[1,2]~dnorm(0.1001,1.4652)
   R[2,2]~dgamma(3.8892,0.5388)
   R[3,2]~dnorm(-0.1981,0.1511)
   R[1,3]~dnorm(-0.2942,1.4492)
   R[2,3]~dnorm(-0.1981,0.1511)
   R[3,3]~dgamma(3.5363,0.5199)
   covar[1:3,1:3]<-inverse(R[,])
   rho[1]<-covar[1,2]/sqrt(covar[1,1]*covar[2,2])
   rho[2]<-covar[1,3]/sqrt(covar[1,1]*covar[3,3])
   rho[3]<-covar[2,3]/sqrt(covar[2,2]*covar[3,3])
   } 