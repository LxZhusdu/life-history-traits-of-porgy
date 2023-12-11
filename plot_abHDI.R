# plotting Figure 7
setwd("E:/fishr/cardinalisW")
rm(list=ls())
library(gplots)
hdi<-read.csv("plot_abHDI.csv")
orivalue<-read.csv("plot_aboriginal.csv")
Mean<-hdi$Mean
Lower<-hdi$Lower
Upper<-hdi$Upper
Mean2<-hdi$Mean2
Lower2<-hdi$Lower2
Upper2<-hdi$Upper2
b<-orivalue$b
a<-orivalue$a
group<-orivalue$group
x<-c(1999,2006:2008,2015)               

pdf("abhdi.pdf",width = 14/2.54, height = 6.2/2.54 )
layout(matrix(c(1,2),byrow=TRUE,ncol=2)) 
par(oma=c(0,0,0,0),mar=c(4,4,0.5,1),cex=0.8,las=1,mgp=c(2.5,1,0))

plotCI(x,Mean2,ui=Upper2,li=Lower2,xlim=c(1993,2015),ylim=c(0,0.06), gap=0.02,
    pch=20,cex=1,xlab="Year",ylab=bquote(italic(a)),col="red",bty="l",tck=-0.03)
points(rep(1993,1),a[1],pch=1,col="black",cex=0.8)    
points(rep(1995,1),a[2],pch=5,col="cyan",cex=0.8)     
points(rep(1997,1),a[3],pch=1,col="black",cex=0.8)    
points(rep(1999,1),a[4],pch=5,col="cyan",cex=0.8)     
points(rep(2006,1),a[5],pch=5, col="cyan",cex=0.8)            
points(rep(2006,1),a[6],pch=6, col="blue",cex=0.8)            
points(rep(2007,1),a[7],pch=6, col="blue",cex=0.8)             
points(2008,a[8],pch=0,col="black",cex=0.8)                
points(rep(2008,1),a[9],pch=17,col="green",cex=0.8)         
points(2015,a[10],pch=5,col="cyan",cex=0.8)

plotCI(x,Mean,ui=Upper,li=Lower,xlim=c(1993,2015),ylim=c(2.6,3.3), gap=0.02,
    pch=20,cex=1,xlab="Year",ylab=bquote(italic(b)),col="red",bty="l",tck=-0.03) 
points(rep(1993,1),b[1],pch=1,col="black",cex=0.8)   
points(rep(1995,1),b[2],pch=5,col="cyan",cex=0.8)  
points(rep(1997,1),b[3],pch=1,col="black",cex=0.8)  
points(rep(1999,1),b[4],pch=5,col="cyan",cex=0.8)   
points(rep(2006,1),b[5],pch=5, col="cyan",cex=0.8)            
points(rep(2006,1),b[6],pch=6, col="blue",cex=0.8)             
points(rep(2007,1),b[7],pch=6, col="blue",cex=0.8)             
points(2008,b[8],pch=0,col="black",cex=0.8)              
points(2008,b[9],pch=17,col="green",cex=0.8)             
points(2015,b[10],pch=5,col="cyan",cex=0.8)
dev.off()