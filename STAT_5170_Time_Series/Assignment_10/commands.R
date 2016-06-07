labour<-scan("labour.dat")
labour<-labour[1:144]
tlabour<-diff(diff(log(labour)),12)

####################
##raw perdiodogram##
####################

lab.per<-spec.pgram(tlabour,taper=0, log="no")

i<-which.max(lab.per$spec)

lower<-qchisq(0.975,2)
upper<-qchisq(0.025,2)
CI<-c(2*lab.per$spec[i]/lower,2*lab.per$spec[i]/upper)

##lab.per<-spec.pgram(tlabour,taper=0, log="no")
abline(h=CI[1], lty=2, col="blue")

#########################
##Symmetric MA, Daniell##
#########################

k<-kernel("daniell",3)
lab.smooth<-spec.pgram(tlabour,k,taper=0,log="no")
lab.smooth$kernel

####################
##modified Daniell##
####################

k.mod<-kernel("modified.daniell",c(2,2))
lab.mod<-spec.pgram(tlabour, k.mod, taper=0, log="no")
lab.mod$kernel

i<-which.max(lab.mod$spec)

Lh<-1/sum(k.mod[-k.mod$m:k.mod$m]^2)

lower.mod<-qchisq(0.95,2*Lh)

CI.mod<-2*Lh*lab.mod$spec[i]/lower.mod

##lab.mod<-spec.pgram(tlabour, k.mod, taper=0, log="no")
abline(h=CI.mod, lty=2, col="blue")

lab.mod$kernel

#####
##2##
#####

source("armasim.R")

x<-armasim(c(0.8),0,1,200)

source("A10function.R")

specplot(spec.pgram(x,taper=0, log="no"),phi=c(0.8))

k.mod<-kernel("modified.daniell",c(1,1))

specplot(spec.pgram(x, k.mod ,taper=0, log="no"), phi=c(0.8))

