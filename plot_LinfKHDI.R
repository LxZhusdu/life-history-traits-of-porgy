setwd("E:/fishr/cardinalisG")
rm(list=ls())
library(gplots)
mydata<-read.csv("plot_LinfHDI.csv")
mydata2<-read.csv("plot_groworiginal.csv")
Mean<-mydata$Mean
Lower<-mydata$Lower
Upper<-mydata$Upper
b<-mydata2$Linf
group<-mydata2$group
Mean2<-mydata$Mean2
Lower2<-mydata$Lower2
Upper2<-mydata$Upper2
a<-mydata2$k
x<-c(1999,2006:2016,2018)              
pdf("LinfKHDI3.pdf",width = 16/2.54, height = 6.2/2.54 )

layout(matrix(c(1,2),byrow=F,ncol=2)) 
par(oma=c(0,0,0,0),mar=c(4,4,0.5,1),cex=0.8,las=1,mgp=c(2.5,1,0))

plotCI(x,Mean,ui=Upper,li=Lower,ylim=c(16,32), xlim=c(1993,2018),gap=0.02,
    pch=20,cex=1,xlab="Year",ylab=bquote(italic(L[infinity])~(cm)),col="red",bty="l",tck=-0.03)
     
points(rep(1993,1),b[1],pch=1,col="black",cex=0.8)   #chenzuozhi
points(rep(1995,1),b[2],pch=5,col="cyan",cex=0.8)   #ZHANGKUI
points(rep(1997,1),b[3],pch=4,col="blue",cex=0.8)   #yuan weiwen
points(rep(1998,1),b[4],pch=5,col="cyan",cex=0.8)    #ZHANGKUI
points(rep(1999,1),b[5],pch=1,col="black",cex=0.8)   #chenzuozhi
points(2006,b[6],pch=5,col="cyan",cex=0.8)  # zhangkui
points(2006,b[7],pch=6,col="blue",cex=0.8)  # wangxuehui
points(2007,b[8],pch=6,col="black",cex=0.8)  # Wangxuehui------
points(2007,b[9],pch=6,col="blue",cex=0.8)  
points(2008,b[10],pch=17,col="green",cex=0.8)  #hougang
points(2008,b[11],pch=0,col="black",cex=0.8)   # Yanyunrong
points(2009,b[12],pch=6,col="blue",cex=0.8)  # wang
points(2010,b[13],pch=6,col="blue",cex=0.8)  # wang
points(2011,b[14],pch=6,col="blue",cex=0.8)
points(2012,b[15],pch=6,col="blue",cex=0.8)  # wang
points(2013,b[16],pch=6,col="blue",cex=0.8)
points(2014,b[17],pch=6,col="blue",cex=0.8)  # wang
points(2015,b[18],pch=6,col="blue",cex=0.8)  # wang
points(2015,b[19],pch=5,col="cyan",cex=0.8)  # zhangkui
points(2016,b[20],pch=6,col="blue",cex=0.8)
points(2018,b[21],pch=6,col="blue",cex=0.8)
text(1993.1,28,"1961",cex=0.6)
text(1995.2,29,"1962",cex=0.6)
text(1997,22.4,"1992-1993",cex=0.6)
plotCI(x,Mean2,ui=Upper2,li=Lower2,ylim=c(0,1), xlim=c(1993,2018),gap=0.02,
    pch=20,cex=1,xlab="Year",ylab=bquote(italic(K)~(year^{-1})),col="red",bty="l",tck=-0.03)

points(rep(1993,1),a[1],pch=1,col="black",cex=0.8)   #chenzuozhi
points(rep(1995,1),a[2],pch=5,col="cyan",cex=0.8)   #ZHANGKUI
points(rep(1997,1),a[3],pch=4,col="blue",cex=0.8)   #yuan weiwen
points(rep(1998,1),a[4],pch=5,col="cyan",cex=0.8)    #ZHANGKUI
points(rep(1999,1),a[5],pch=1,col="black",cex=0.8)   #chenzuozhi
points(2006,a[6],pch=5,col="cyan",cex=0.8)  # zhangkui
points(2006,a[7],pch=6,col="blue",cex=0.8)  # wangxuehui
points(2007,a[8],pch=6,col="black",cex=0.8)  # Wangxuehui------
points(2007,a[9],pch=6,col="blue",cex=0.8)  
points(2008,a[10],pch=17,col="green",cex=0.8)  #hougang
points(2008,a[11],pch=0,col="black",cex=0.8)   # Yanyunrong
points(2009,a[12],pch=6,col="blue",cex=0.8)  # wang
points(2010,a[13],pch=6,col="blue",cex=0.8)  # wang
points(2011,a[14],pch=6,col="blue",cex=0.8)
points(2012,a[15],pch=6,col="blue",cex=0.8)  # wang
points(2013,a[16],pch=6,col="blue",cex=0.8)
points(2014,a[17],pch=6,col="blue",cex=0.8)  # wang
points(2015,a[18],pch=6,col="blue",cex=0.8)  # wang
points(2015,a[19],pch=5,col="cyan",cex=0.8)  # zhangkui
points(2016,a[20],pch=6,col="blue",cex=0.8)
points(2018,a[21],pch=6,col="blue",cex=0.8)
lines(c(1961,seq(1999,2018,1)),rep(0.267,times=21),col="gray",lty=3)
text(1993.1,0.5,"1961",cex=0.6)
text(1995,0.26,"1962",cex=0.6)
text(1997,0.54,"1992-1993",cex=0.6)
dev.off()
