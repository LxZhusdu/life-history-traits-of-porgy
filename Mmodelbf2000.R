model{
   for (i in 1:N){
     B[i,1:3]~dmnorm(theta[1:3],R[,])
     }

   theta[1]~dgamma(4.9171,0.1107)
   theta[2]~dgamma(3.6615,16.2822)
   theta[3]~dgamma(4.1878,9.5290)
   R[1:3,1:3]~dwish(omega[1:3,1:3],3)  
   covar[1:3,1:3]<-inverse(R[,])
   rho[1]<-covar[1,2]/sqrt(covar[1,1]*covar[2,2])
   rho[2]<-covar[1,3]/sqrt(covar[1,1]*covar[3,3])
   rho[3]<-covar[2,3]/sqrt(covar[2,2]*covar[3,3])
  } 