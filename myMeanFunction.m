%ÖZGÜR KAN
%15011702
%13.05.2020

%Benim yazdýðým Mean Fonksiyonu 
function [M] = myMeanFunction(incomingSamples)
    sum1=0;
    for i=1:length(incomingSamples)
      sum1=sum1+incomingSamples(i);
    end
    M=sum1/length(incomingSamples); %Mean
end