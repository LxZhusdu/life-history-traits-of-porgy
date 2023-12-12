# plotting a similar figure as Figure 8 using statistics of MCMC estimates in data files required by plot_Mpriorpost.R
setwd("E:/fishr/cardinalisM")
rm(list=ls())
databf06<-read.csv("M_bf2000_statistics.csv")
data6<-read.csv("M_2006_statistics.csv")
data7<-read.csv("M_2007_statistics.csv")
data8<-read.csv("M_2008_statistics.csv")
data14<-read.csv("M_2014_statistics.csv")
data18<-read.csv("M_2018_statistics.csv")

datar6<-read.csv("M2_2006_statistics.csv")
datar7<-read.csv("M2_2007_statistics.csv")
datar8<-read.csv("M2_2008_statistics.csv")
datar14<-read.csv("M2_2014_statistics.csv")
datar18<-read.csv("M2_2018_statistics.csv")

mnbf06<-databf06$Mean[15]
mn6<-data6$Mean[6]
mn7<-data7$Mean[6]
mn8<-data8$Mean[6]
mn14<-data14$Mean[6]
mn18<-data18$Mean[6]
mnr6<-datar6$Mean[6]
mnr7<-datar7$Mean[6]
mnr8<-datar8$Mean[6]
mnr14<-datar14$Mean[6]
mnr18<-datar18$Mean[6]

sdbf06<-databf06$SD[15]
sd6<-data6$SD[6]
sd7<-data7$SD[6]
sd8<-data8$SD[6]
sd14<-data14$SD[6]
sd18<-data18$SD[6]
sdr6<-datar6$SD[6]
sdr7<-datar7$SD[6]
sdr8<-datar8$SD[6]
sdr14<-datar14$SD[6]
sdr18<-datar18$SD[6]
   
#prior
M<-seq(0,1.3,0.01); den_p<-dgamma(M,4.1878,9.5290);
pdf("Mpriorpostnormdist.pdf",width = 15/2.54, height = 12.4/2.54 )
layout(matrix(c(1,2,3,3),byrow=TRUE,ncol=2)) 
par(oma=c(0,0,0,0),mar=c(4,4,0.5,1),cex=0.8,las=1,mgp=c(2.5,1,0))

plot(M,den_p,type="l",lty=3,main="",col="black",tck=-0.03,
     xlim=c(0,1.4),  ylim=c(0,6.5),
      xlab=bquote(italic(M)~(year^{-1})),ylab="Density") #solid 
lines(M,dnorm(M,mnbf06,sdbf06),lty=2)
lines(M,dnorm(M,mn6,sd6),lty=2,col="blue")#2006
lines(M,dnorm(M,mn7,sd7),lty=4,col="green")#2007
lines(M,dnorm(M,mn8,sd8),lty=5,col="magenta")#2008
lines(M,dnorm(M,mn14,sd14),lty=6,col="cyan")#2014
lines(M,dnorm(M,mn18,sd18),lty=1,col="red")#2018
  
plot(M,den_p,type="l",lty=3,main="",col="black",tck=-0.03,
      xlim=c(0,1.4), ylim=c(0,6.5),
      xlab=bquote(italic(M)~(year^{-1})),ylab="Density") #solid 
lines(M,dnorm(M,mnbf06,sdbf06),lty=2)
lines(M,dnorm(M,mnr6,sdr6),lty=2,col="blue")#2006
lines(M,dnorm(M,mnr7,sdr7),lty=4,col="green")#2007
lines(M,dnorm(M,mnr8,sdr8),lty=5,col="magenta")#2008
lines(M,dnorm(M,mnr14,sdr14),lty=6,col="cyan")#2014
lines(M,dnorm(M,mnr18,sdr18),lty=1,col="red")#2018         

plot(0,0, type="n", axes=FALSE,bty="n",xlab="",ylab="")
legend("top",c("Prior", "1999","2006","2007","2008","2014","2018"),lty=c(3,2,2,4,5,6,1),
       col=c("black","black","blue","green","magenta","cyan","red"), bty="n",horiz=TRUE)

dev.off()
