randomwalk<-function(sigsq,T){
x<-rep(0,T)
w<-rnorm(T,sd=sqrt(sigsq))
for ( i in 2:T){
x[i]<-x[i-1]+w[i]
}
x
}

r1<-randomwalk(1,20)
r2<-randomwalk(1,20)
r3<-randomwalk(1,20)
r4<-randomwalk(1,20)
r5<-randomwalk(1,20)

r1<-ts(r1)
r2<-ts(r2)
r3<-ts(r3)
r4<-ts(r4)
r5<-ts(r5)

pdf("randomwalk.pdf")
plot.ts(r1,ylab="values",ylim=c(-4,10),main="Five Random Walks")
lines(r2,col="red")
lines(r3,col="blue")
lines(r4,col="green")
lines(r5,col="purple")
dev.off()