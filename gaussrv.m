function [samples] = gaussrv(noSamples, mu, sigma2)

%chapter 8 - page 15
%mean(Z)=0
%var(Z)=1
%Z = sqrt(-2*log(U1)).*cos(2*pi*U2);

U1=rand(1, noSamples);
U2=rand(1, noSamples);
Z = sqrt(-2*log(U1)).*cos(2*pi*U2);

samples=sqrt(sigma2)*Z+mu;
