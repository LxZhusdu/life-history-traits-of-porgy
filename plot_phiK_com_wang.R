# Plotting Fig 4
# grow_bf2000_mcmc.csv outputted from growbf2000.R is too large
# values of R were removed from grow_bf2000_mcmc.csv and the left was put in grow_bf2000S_mcmc.csv
# Similarly,k_wangS1_mcmc.csv only includes k_com and phi_com in k_wang_mcmc.csv to reduce the size of data file
setwd("E:/fishr/cardinalisG")
rm(list=ls())
data1999<-read.csv("grow_bf2000S_mcmc.csv")
datawang<-read.csv("k_wang_mcmc.csv")
datawangs<-read.csv("k_wang_statistics.csv")

phi1999<-log10(data1999$'theta.2.')+2*log10(data1999$'theta.1.')
den_phi1999<-density(phi1999)
den_k1999<-density(data1999$'theta.2.')
mnphi_wang<-datawangs$Mean[24]
sdphi_wang<-datawangs$SD[24]
mnk_wang<-datawangs$Mean[12]
sdk_wang<-datawangs$SD[12]
den_k_com<-density(datawang$k_com)
den_phi_com<-density(datawang$phi_com)

pdf("phykcommon.pdf",width = 15/2.54, height = 12.4/2.54 )
layout(matrix(c(1,2,3,3),byrow=TRUE,ncol=2)) 
par(oma=c(0,0,0,0),mar=c(4,4,0.5,1),cex=0.8,las=1,mgp=c(2.5,1,0) )
plot(den_phi_com$x,den_phi_com$y,type="l",lty=1,main="",col="black",tck=-0.03,
 xlim=c(mnphi_wang-5*sdphi_wang,mnphi_wang+5*sdphi_wang),ylim=c(0,2.8),
      xlab=bquote(italic(phi[LBB] ^{","})),ylab="Density") #solid
lines(den_phi1999$x[den_phi1999$x>1.25],den_phi1999$y[den_phi1999$x>1.25],lty=2)
legend("topright",c("1999","Posterior"),lty=c(2,1),bty="n")
plot(den_k1999$x[den_k1999$x>0&den_k1999$x<0.81],den_k1999$y[den_k1999$x>0&den_k1999$x<0.81],
type="l",lty=2,main="",col="black",tck=-0.03,
 xlim=c(mnk_wang-3.5*sdk_wang,mnk_wang+4*sdk_wang),ylim=c(0,4.5),
      xlab=bquote(italic(K[LBB])~(year^{-1})),ylab="Density") 
lines(den_k_com$x[den_k_com$x>0&den_k_com$x<0.81],den_k_com$y[den_k_com$x>0&den_k_com$x<0.81],lty=1)
legend("topright",c("1999","Posterior"),lty=c(2,1),bty="n")
dev.off()
