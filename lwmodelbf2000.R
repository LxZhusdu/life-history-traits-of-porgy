# The following codes were adapted from Froese et al. (2014).
# Froese, R, Thorson, JT, Reyes Jr RB. A Bayesian approach for estimating
# length-weight relationships in fishes. Journal of AppliedIchthyology, 2014, 30: 78-85.
model{
   for (i in 1:N){
      ab[i,1:2]~dmnorm(beta[1:2],TauObs[1:2,1:2]*weight[i]^2)
     } 
   beta[1]~dnorm(-1.5933,24.9464)
   beta[2]~dnorm(3.0391,59.9972)
   a<-10^beta[1]
   TauObs[1:2,1:2]<-inverse(covobs[1:2,1:2])
   covobs[1,1]<-sigma1^2
   covobs[2,2]<-sigma2^2
   covobs[1,2]<-ro*sigma1*sigma2
   covobs[2,1]<-covobs[1,2]
   ro~dunif(-0.99,0)
   sigma1~dgamma(6520,25076)
   sigma2~dgamma(6808,37001)
 } 