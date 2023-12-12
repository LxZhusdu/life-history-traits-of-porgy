model{
   for (i in 1:N){
     B[i,1:3]~dmnorm(theta[1:3],R[,])
     }

   theta[1]~dnorm(26.0694,1.6111)
   theta[2]~dgamma(4.8862,19.6134)
   theta[3]~dnorm(0.6602,26.9663)

   R[1,1]~dgamma(3.4839,5.1107)
   R[2,1]~dnorm(0.0944,1.4874)
   R[3,1]~dnorm(0.1578,1.5224)
   R[1,2]~dnorm(0.0944,1.4874)
   R[2,2]~dgamma(3.9679,0.5475)
   R[3,2]~dnorm(-0.5791,0.1627)
   R[1,3]~dnorm(0.1578,1.5224)
   R[2,3]~dnorm(-0.5791,0.1627)
   R[3,3]~dgamma(3.4075,0.5403)
   
   covar[1:3,1:3]<-inverse(R[,])
   rho[1]<-covar[1,2]/sqrt(covar[1,1]*covar[2,2])
   rho[2]<-covar[1,3]/sqrt(covar[1,1]*covar[3,3])
   rho[3]<-covar[2,3]/sqrt(covar[2,2]*covar[3,3])
  } 