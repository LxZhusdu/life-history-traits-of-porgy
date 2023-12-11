# The following codes were adapted from Froese et al. (2014).
# Froese, R, Thorson, JT, Reyes Jr RB. A Bayesian approach for estimating
# length-weight relationships in fishes. Journal of AppliedIchthyology, 2014, 30: 78-85.
model{
   for (j in 1:N){
      ab[j,1:2]~dmnorm(beta[1:2],TauObs[1:2,1:2]*weight[j]^2)
     }
  pr_mean_log10a = -1.4819
  pr_sd_log10a = 0.1001
  pr_tau_log10a = 1 / (pr_sd_log10a)^2    
  
  pr_mean_b = 3.0756
  pr_sd_b = 0.0703
  pr_tau_b = 1 / (pr_sd_b)^2     
  
  pr_mean_ro = -0.8595
  pr_sd_ro = 0.2133
  pr_tau_ro = 1 / (pr_sd_ro)^2    
  
  pr_mean_sigma_log10a = 0.2598             
  pr_sd_sigma_log10a = 0.00323              
  pr_mean_sigma_b = 0.1839               
  pr_sd_sigma_b = 0.00222                
  
  pr_r_sigma_log10a <- pr_mean_sigma_log10a^2 / pr_sd_sigma_log10a^2                  
  pr_mu_sigma_log10a <- pr_mean_sigma_log10a / pr_sd_sigma_log10a^2                  
  pr_r_sigma_b <- pr_mean_sigma_b^2 / pr_sd_sigma_b^2                  
  pr_mu_sigma_b <- pr_mean_sigma_b / pr_sd_sigma_b^2     
       
   beta[1] ~ dnorm(pr_mean_log10a,pr_tau_log10a)  # SL prior
   beta[2] ~ dnorm(pr_mean_b,pr_tau_b)
   ro ~ dnorm(pr_mean_ro,pr_tau_ro)T(-1,0)
   a1<-pow(10,beta[1])
   sigma1 ~ dgamma(pr_r_sigma_log10a, pr_mu_sigma_log10a)
   sigma2 ~ dgamma(pr_r_sigma_b, pr_mu_sigma_b)
   
   TauObs[1:2,1:2]<-inverse(covobs[1:2,1:2])
   covobs[1,1]<-sigma1^2
   covobs[2,2]<-sigma2^2
   covobs[1,2]<-ro*sigma1*sigma2
   covobs[2,1]<-covobs[1,2]
  } 