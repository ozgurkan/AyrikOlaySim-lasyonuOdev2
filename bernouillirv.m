function [samples,succeed] = bernouillirv(noSamples, p)
%p: probability of true (i.e,one)
%1-p: probabilty of false (i.e,zero)
%Bernouilli kullanarak Binomialrv fonksiyonunu �retmek i�in bu fonksiyon
%kullan�lm��t�r.

samples=zeros(1,noSamples);
indices = find(rand(1,noSamples)<=p);
samples(indices) = 1;
succeed=sum(samples);
%fprintf("%d \n",succeed);
end


