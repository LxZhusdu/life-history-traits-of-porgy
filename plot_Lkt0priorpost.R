# plotting Fig 3 using MCMC estimates in the manuscript
setwd("E:/fishr/cardinalisGN4")
rm(list=ls())
databf00<-read.csv("grow_bf2000_mcmc.csv")
data6<-read.csv("grow_2006_mcmc.csv")
data7<-read.csv("grow_2007_mcmc.csv")
data8<-read.csv("grow_2008_mcmc.csv")
data14<-read.csv("grow_2014_mcmc.csv")
data18<-read.csv("grow_2018_mcmc.csv")

den_bf00l<-density(databf00$'theta.1.')
den_bf00k<-density(databf00$'theta.2.')
den_bf00t<-density(databf00$'theta.3.')
den_6l<-density(data6$'theta.1.')     #2006
den_6k<-density(data6$'theta.2.')
den_6t<-density(data6$'theta.3.') 
den_7l<-density(data7$'theta.1.')      #2007
den_7k<-density(data7$'theta.2.')
den_7t<-density(data7$'theta.3.') 
den_8l<-density(data8$'theta.1.')     #2008
den_8k<-density(data8$'theta.2.')
den_8t<-density(data8$'theta.3.') 
den_14l<-density(data14$'theta.1.')   #2014
den_14k<-density(data14$'theta.2.')
den_14t<-density(data14$'theta.3.') 
den_18l<-density(data18$'theta.1.')   #2018
den_18k<-density(data18$'theta.2.')
den_18t<-density(data18$'theta.3.')   
# priors
Linf<-seq(21.92,29.35,0.01); den_Linfp<-dgamma(Linf,4.9171,0.1107)
k<-seq(0,0.6,0.01); den_kp<-dgamma(k,3.6615,16.2822)
t0<-seq(-1.11,0.11,.01); den_t0p<-dnorm(t0,-1.2,0.9604)  

pdf("Lkt0distreal.pdf",width = 18/2.54, height = 12.4/2.54 )
layout(matrix(c(1,2,3,4,4,4),byrow=TRUE,ncol=3)) 
par(oma=c(0,0,0,0),mar=c(4,4,0.5,1),cex=0.8,las=1,mgp=c(2.5,1,0))

plot(Linf,den_Linfp,type="l",lty=3,main="",col="black",tck=-0.03,
 xlim=c(22,29),ylim=c(0,0.79),
      xlab=bquote(italic(L[infinity])~(cm)),ylab="Density") 
lines(den_bf00l$x[den_bf00l$x>=22&den_bf00l$x<=29],den_bf00l$y[den_bf00l$x>=22&den_bf00l$x<=29],lty=2)      
lines(den_6l$x,den_6l$y,lty=2,col="blue")#2006
lines(den_7l$x,den_7l$y,lty=4,col="green")#2007
lines(den_8l$x,den_8l$y,lty=5,col="magenta")#2008
lines(den_14l$x,den_14l$y,lty=6,col="cyan")#2014
lines(den_18l$x[den_18l$x>=22&den_18l$x<=29],den_18l$y[den_18l$x>=22&den_18l$x<=29],lty=1,col="red")#2018

plot(k,den_kp,type="l",lty=3,main="",col="black",tck=-0.03,
 ,ylim=c(0,7.5),xlab=bquote(italic(K)~(year^{-1})),ylab="Density") 
lines(den_bf00k$x[den_bf00k$x>0&den_bf00k$x<0.62],den_bf00k$y[den_bf00k$x>0&den_bf00k$x<0.62],lty=2)      
lines(den_6k$x[den_6k$x>0&den_6k$x<0.62],den_6k$y[den_6k$x>0&den_6k$x<0.62],lty=2,col="blue")
lines(den_7k$x[den_7k$x>0&den_7k$x<0.62],den_7k$y[den_7k$x>0&den_7k$x<0.62],lty=4,col="green")
lines(den_8k$x[den_8k$x>0&den_8k$x<0.62],den_8k$y[den_8k$x>0&den_8k$x<0.62],lty=5,col="magenta")
lines(den_14k$x,den_14k$y,lty=6,col="cyan")
lines(den_18k$x[den_18k$x>0&den_18k$x<0.53],den_18k$y[den_18k$x>0&den_18k$x<0.53],lty=1,col="red")

plot(t0,den_t0p,type="l",lty=3,main="",col="black",tck=-0.03, xlim=c(-1.05,0.05), ylim=c(0,6.3),
      xlab=bquote(italic(t)[0] ~ (year)),ylab="Density") #solid
lines(den_bf00t$x[den_bf00t$x>-1.12&den_bf00t$x<0.11],den_bf00t$y[den_bf00t$x>-1.12&den_bf00t$x<0.11],lty=2) 
lines(den_6t$x[den_6t$x>-1.12&den_6t$x<0.11],den_6t$y[den_6t$x>-1.12&den_6t$x<0.11],lty=2,col="blue")#2006
lines(den_7t$x[den_7t$x>-1.12&den_7t$x<0.11],den_7t$y[den_7t$x>-1.12&den_7t$x<0.11],lty=4,col="green")#2009
lines(den_8t$x[den_8t$x>-1.12&den_8t$x<0.11],den_8t$y[den_8t$x>-1.12&den_8t$x<0.11],lty=5,col="magenta")#2012
lines(den_14t$x,den_14t$y,lty=6,col="cyan")#2015
lines(den_18t$x,den_18t$y,lty=1,col="red")

plot(0,0, type="n", axes=FALSE,bty="n",xlab="",ylab="")
legend("top",c("Prior", "1999","2006","2007","2008","2014","2018"),lty=c(3,2,2,3,5,6,1),
       col=c("black","black","blue","green","magenta","cyan","red"), bty="n",horiz=TRUE)

dev.off()
