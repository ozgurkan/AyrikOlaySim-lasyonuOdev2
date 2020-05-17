%ÖZGÜR KAN
%15011702
%13.05.2020

%Benim yazdýðým Variance Fonksiyonu
function [V] = myVarianceFunction(incomingSamples)
    sum2=0;
    M=myMeanFunction(incomingSamples);
    for i=1:length(incomingSamples)
        sum2=sum2+ power((incomingSamples(i)-M),2);
    end
    V=sum2/length(incomingSamples); %Varaince    
end