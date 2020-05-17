%ÖZGÜR KAN
%15011702
%13.05.2020

clear all;
clc;

noSamples=10000;
noBins=14;
%MY GENERATE BÝNOMÝAL DÝSTRÝBUTÝON HÝSTOGRAM,PDF AND CDF
samples=binomGenerate(noSamples,6/40,40);
samples1=binomGenerate(noSamples,4.5/50,50);

[freqs, interval, delta]=histogram(samples, noBins);
[freqs1, interval1, delta1]=histogram(samples1, noBins);

[empricalPDF, interval] = hist2pdf(freqs, interval, delta);
[empricalCDF, interval] = hist2cdf(freqs, interval, delta);

[empricalPDF1, interval1] = hist2pdf(freqs1, interval1, delta1);
[empricalCDF1, interval1] = hist2cdf(freqs1, interval1, delta1);

%FORMULA GENERATE BÝNOMÝAL DÝSTRÝBUTÝON HÝSTOGRAM,PDF AND CDF
formulaGenerated = binomGenerateFormula(40, 6/40);
formulaGenerated1 = binomGenerateFormula(50, 4.5/50);

%--------------------------------------------------
figure(1)
stem(interval,empricalPDF,'fill','LineStyle','none');
hold on
plot(formulaGenerated)
hold on
stem(interval1,empricalPDF1,'fill','LineStyle','none');
hold on
plot(formulaGenerated1)
xlabel('x '); 
ylabel('Emprical PMF - $\mid f_X(x) \mid$ ', 'interpreter', 'latex');
legend('n = 40 p = 6/40  MY CREATED  BÝNOMÝAL DÝSTRÝBUTÝON PMF ', 'n = 40 p = 6/40 ANALYTÝCAL RESULTS WÝTH DÝSTRÝBUTÝON FORMULAS ','n = 50 p = 4.5/50  MY CREATED  BÝNOMÝAL DÝSTRÝBUTÝON PMF ', 'n = 50 p = 4.5/50 ANALYTÝCAL RESULTS WÝTH DÝSTRÝBUTÝON FORMULAS')
set(gcf,'Position', get(gcf,'Position') + [0,0,150,0]); 
pos1 = get(gcf,'Position'); 
set(gcf,'Position', pos1 - [pos1(3)/1.5,0,0,0])
%-----------------------------------------------------
figure(2)
stem(interval,empricalCDF,'fill','LineStyle','none');
hold on
stem(interval1,empricalCDF1,'fill','LineStyle','none');
xlabel('x '); 
ylabel('Emprical CDF - $\mid f_X(x) \mid$ ', 'interpreter', 'latex');
legend('n = 40   p = 6/40  MY CREATED  BÝNOMÝAL DÝSTRÝBUTÝON CDF ','n = 50   p = 4.5/50  MY CREATED  BÝNOMÝAL DÝSTRÝBUTÝON CDF','Location','northwest')
set(gcf,'Position', get(gcf,'Position') + [0,0,250,0]); 
pos2 = get(gcf,'Position');  
set(gcf,'Position', pos2 + [pos1(3)/3,0,0,0])
%---------------------------------------------------------

clc
fprintf("Hesapladigimiz n=40 p=0,7 deki mean = %f\n",myMeanFunction(samples)); 
fprintf("Hesapladigimiz n=40 p=0,7 deki variance = %f\n",myVarianceFunction(samples)); 
fprintf("\n");
fprintf("Hesapladigimiz n=50 p=0,5 deki mean = %f\n",myMeanFunction(samples1)); 
fprintf("Hesapladigimiz n=50 p=0,5 deki variance = %f\n",myVarianceFunction(samples1));

%Bu fonksiyon bernouilli random variable kullanarak binomial distribution
%uretir.
function generated = binomGenerate(samplenum,p,n)
    for i = 1:samplenum
        [samples3,succeed]=bernouillirv(n,p);
        x(i) = succeed;
    end
    generated = x;
end

%Bu fonksiyon binomial distribution formulune gore binomial distribution
%uretir.
function generated = binomGenerateFormula(n, p)
    for i = 1:n
      generated(i) = ((factorial(n)) / (factorial(n-i) * factorial(i))) * power(p,i) * power((1-p), (n-i));
    end    
end