library('pracma')
# Sample signal -- 'One' is represented by sine wave s1, 'Zero' is represented by sine wave s0
Tb = 1e-3 # bit time is 1ms
t = seq(0,Tb, by=1e-5)
s1 = sin(pi*10^3*t)
s0 = -sin(pi*10^3*t)
zero_bit = rep(c(0), length(t))
one_bit  = rep(c(1), length(t))
png('./graphics/basic-bit-waveform.png')
par(mfrow=c(2,1))
plot(t, s1, type="l", xlim=c(0, 4*Tb), ylim=c(-1.1,1.1), main="Basic BPSK signal",
   xlab="Time in seconds", ylab="Signal")
abline(v=Tb)
abline(v=3*Tb)
lines(t+Tb, s0, type="l")
lines(t+2*Tb, s0, type="l")
lines(t+3*Tb, s1, type="l")
plot(t, one_bit, type="l", xlim=c(0, 4*Tb), ylim=c(-0.1,1.1), main="Transmitted data",
   xlab="Time in seconds", ylab="Data")
lines(t+Tb, zero_bit, type="l")
lines(t+2*Tb, zero_bit, type="l")
lines(t+3*Tb, one_bit, type="l") 

# Building the Eb/No plot for AWGN simulation
EbNo = seq(0,10, by=1)
PE   = 0.5*erfc(sqrt(10^((EbNo)/10)))
png('./graphics/bpsk-ber.png')
plot(EbNo, PE, type="b", log="y", main="Bit-Error Rate", xlab="Eb/No in dB", ylab="Bit-error probability")
