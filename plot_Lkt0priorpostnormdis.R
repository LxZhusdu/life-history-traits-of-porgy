# Plotting a similar figure to Fig 3 using statistics
setwd("E:/fishr/cardinalisGN4")
rm(list=ls())
databf00s<-read.csv("grow_bf2000_statistics.csv")
data6s<-read.csv("grow_2006_statistics.csv")
data7s<-read.csv("grow_2007_statistics.csv")
data8s<-read.csv("grow_2008_statistics.csv")
data14s<-read.csv("grow_2014_statistics.csv")
data18s<-read.csv("grow_2018_statistics.csv")

mnbf00l<-databf00s$Mean[10]
mnbf00k<-databf00s$Mean[11]
mnbf00t<-databf00s$Mean[12]
sdbf00l<-databf00s$SD[10]
sdbf00k<-databf00s$SD[11]
sdbf00t<-databf00s$SD[12]
mn6l<-data6s$Mean[4]
mn6k<-data6s$Mean[5]
mn6t<-data6s$Mean[6]
sd6l<-data6s$SD[4]
sd6k<-data6s$SD[5]
sd6t<-data6s$SD[6]
mn7l<-data7s$Mean[4]
mn7k<-data7s$Mean[5]
mn7t<-data7s$Mean[6]
sd7l<-data7s$SD[4]
sd7k<-data7s$SD[5]
sd7t<-data7s$SD[6]
mn8l<-data8s$Mean[4]
mn8k<-data8s$Mean[5]
mn8t<-data8s$Mean[6]
sd8l<-data8s$SD[4]
sd8k<-data8s$SD[5]
sd8t<-data8s$SD[6]
mn14l<-data14s$Mean[4]
mn14k<-data14s$Mean[5]
mn14t<-data14s$Mean[6]
sd14l<-data14s$SD[4]
sd14k<-data14s$SD[5]
sd14t<-data14s$SD[6]
mn18l<-data18s$Mean[4]
mn18k<-data18s$Mean[5]
mn18t<-data18s$Mean[6]
sd18l<-data18s$SD[4]
sd18k<-data18s$SD[5]
sd18t<-data18s$SD[6]
 
# priors
Linf<-seq(21.92,29.35,0.01); den_Linfp<-dgamma(Linf,4.9171,0.1107)
k<-seq(0,0.6,0.01); den_kp<-dgamma(k,3.6615,16.2822)
t0<-seq(-1.11,0.11,.01); den_t0p<-dnorm(t0,-1.2,0.9604)  

pdf("Lkt0distnorm.pdf",width = 18/2.54, height = 12.4/2.54 )
layout(matrix(c(1,2,3,4,4,4),byrow=TRUE,ncol=3)) 
par(oma=c(0,0,0,0),mar=c(4,4,0.5,1),cex=0.8,las=1,mgp=c(2.5,1,0))

plot(Linf,den_Linfp,type="l",lty=3,main="",col="black",tck=-0.03,
 xlim=c(22,29),ylim=c(0,0.79),
      xlab=bquote(italic(L[infinity])~(cm)),ylab="Density") 
lines(Linf,dnorm(Linf,mnbf00l,sdbf00l),lty=2)      
lines(Linf,dnorm(Linf,mn6l,sd6l),lty=2,col="blue")     #2006
lines(Linf,dnorm(Linf,mn7l,sd7l),lty=4,col="green")    #2007
lines(Linf,dnorm(Linf,mn8l,sd8l),lty=5,col="magenta")  #2008
lines(Linf,dnorm(Linf,mn14l,sd14l),lty=6,col="cyan")   #2014
lines(Linf,dnorm(Linf,mn18l,sd18l),lty=1,col="red")    #2018

plot(k,den_kp,type="l",lty=3,main="",col="black",tck=-0.03,
 ,ylim=c(0,7.5),xlab=bquote(italic(K)~(year^{-1})),ylab="Density") 
lines(k,dnorm(k,mnbf00k,sdbf00k),lty=2)      
lines(k,dnorm(k,mn6k,sd6k),lty=2,col="blue")
lines(k,dnorm(k,mn7k,sd7k),lty=4,col="green")
lines(k,dnorm(k,mn8k,sd8k),lty=5,col="magenta")
lines(k,dnorm(k,mn14k,sd14k),lty=6,col="cyan")
lines(k,dnorm(k,mn18k,sd18k),lty=1,col="red")

plot(t0,den_t0p,type="l",lty=3,main="",col="black",tck=-0.03, xlim=c(-1.05,0.05), ylim=c(0,6.3),
      xlab=bquote(italic(t)[0] ~ (year)),ylab="Density") #solid
lines(t0,dnorm(t0,mnbf00t,sdbf00t),lty=2)      
lines(t0,dnorm(t0,mn6t,sd6t),lty=2,col="blue")
lines(t0,dnorm(t0,mn7t,sd7t),lty=4,col="green")
lines(t0,dnorm(t0,mn8t,sd8t),lty=5,col="magenta")
lines(t0,dnorm(t0,mn14t,sd14t),lty=6,col="cyan")
lines(t0,dnorm(t0,mn18t,sd18t),lty=1,col="red")

plot(0,0, type="n", axes=FALSE,bty="n",xlab="",ylab="")
legend("top",c("Prior", "1999","2006","2007","2008","2014","2018"),lty=c(3,2,2,3,5,6,1),
       col=c("black","black","blue","green","magenta","cyan","red"), bty="n",horiz=TRUE)

dev.off()