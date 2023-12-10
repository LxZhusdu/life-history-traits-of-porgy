model{
   for (i in 1:N){
     B[i,1:3]~dmnorm(theta[1:3],R[,])
     }
   theta[1]~dgamma(4.9171,0.1107)
   theta[2]~dgamma(3.6615,16.2822)
   theta[3]~dnorm(-1.2,0.9604)
   R[1:3,1:3]~dwish(omega[1:3,1:3],3)
  }
