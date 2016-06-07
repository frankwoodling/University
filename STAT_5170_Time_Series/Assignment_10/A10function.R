spectraldensity<-function(omega, phi=0, theta=0, sigsq=1){
	expomega<-exp(-2*pi*(1i)*omega)
	fomega<-rep(0,length(omega))
	for (i in 1:length(fomega)){
		fomega[i]=sigsq*Mod(1+sum(theta*expomega[i]^(1:length(theta))))^2/Mod(1-sum(phi*expomega[i]^(1:length(phi))))^2
	}
	fomega
}

specplot=function(pgram,phi=0,theta=0,sigsq=1){
	#plot(pgram[[1]],pgram[[2]],type="l", xlab="freq", ylab="var", main = "Unsmoothed plot with spectral density line")
	lines(pgram[[1]],spectraldensity(pgram[[1]],phi,theta,sigsq),col="red")
}

specplot2=function(pgram,phi=0,theta=0,sigsq=1){
  #plot(pgram[[1]],pgram[[2]],type="l", xlab="freq", ylab="var", main = "Smoothed plot with kernel = 4")
  lines(pgram[[1]],spectraldensity(pgram[[1]],phi,theta,sigsq),col="red")
}

specplot10=function(pgram,phi=0,theta=0,sigsq=1){
  #plot(pgram[[1]],pgram[[2]],type="l", xlab="freq", ylab="var", main = "Smoothed plot with kernel = 10")
  lines(pgram[[1]],spectraldensity(pgram[[1]],phi,theta,sigsq),col="red")
}

