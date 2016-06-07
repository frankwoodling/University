########################
##Gaussian white noise##
########################

wn<-rnorm(1000)

wn<-ts(wn)

pdf("acf_wn.pdf")
acf(wn, main="ACF for White Noise")
dev.off()

############
##Marriage##
############

marriage<-scan("yule2.dat",skip=12)
marriage<-ts(marriage, start=1866)

pdf("acf_marriage.pdf")
par(mfrow=c(1,2))
plot(marriage, ylab="Percent", main="% marriages in Church of England")
acf(marriage, main="ACF for Marriage")
dev.off()

#######################
##Dubuque temperature##
#######################

dubuque<-scan("dubuque.dat", skip=2)

dubuque<-ts(dubuque, start=1964)

pdf("acf_dubuque.pdf")
par(mfrow=c(1,2))
plot(dubuque,ylab="Temp (F)", main="Avg monthly temp in Dubuque, IA")
acf(dubuque, main="ACF for avg temp")
dev.off()


