##############
##Queensland##
##############

shop<-scan("souvenir.csv")
sales<-ts(shop)

pdf("shop.pdf")
plot(sales)
dev.off()

plot(shop)

time<-seq(1,84,1)

result<-lm(shop~time)

pdf("regress.pdf")
plot(shop~time, ylab="sales", main="Regress sales on time index")
abline(result, col="red")
dev.off()

#################
##Munich summer##
#################

summer<-scan("summer.dat", skip=1) ##skip the first line which is some description
summer<-ts(summer, start=1781) ##start tells what is the starting point

pdf("summer.pdf")
plot(summer)
dev.off()

pdf("summeracf.pdf")
acf(summer)
dev.off()

#######################
##Dubuque temperature##
#######################

dubuque<-scan("dubuque.dat", skip=2)

dubuque<-ts(dubuque, start=1964, frequency=12)

pdf("dubuque.pdf")
plot(dubuque,ylab="Temp (F)")
dev.off()

############
##Marriage##
############

marriage<-scan("yule2.dat",skip=12)
marriage<-ts(marriage, start=1866)


pdf("marriage.pdf")
plot(marriage, ylab="Percent")
dev.off()

time<-1866:(1865+length(marriage))

fit<-lm(marriage ~ time)

pdf("marriageacf.pdf")
acf(fit$resid)
dev.off()

#############
##IBM stock##
#############

ibm<-scan("dailyibm.dat", skip=1)
ibm<-ts(ibm)

pdf("ibm.pdf")
par(mfrow=c(1,2))
plot(ibm, main="Daily closing price", ylab="Price in dollars")
ibmreturn<-diff(log(ibm))
plot(ibmreturn, main="Daily returns", ylab="Returns")
dev.off()


