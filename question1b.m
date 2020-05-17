%ÖZGÜR KAN
%15011702
%13.05.2020

clear all;
clc;

noSamples=10000;
noBins=12;
%MY GENERATE GEOMETRÝC DÝSTRÝBUTÝON HÝSTOGRAM,PDF AND CDF
samples=geometricGenerate(0.5,noSamples);
samples1=geometricGenerate(0.3,noSamples);

[freqs, interval, delta]=histogram(samples, noBins);
[freqs1, interval1, delta1]=histogram(samples1, noBins);

[empricalPDF, interval] = hist2pdf(freqs, interval, delta);
[empricalPDF1, interval1] = hist2pdf(freqs1, interval1, delta1);


noBins=50;
[freqs2, interval2, delta2]=histogram(samples, noBins);
[freqs3, interval3, delta3]=histogram(samples1, noBins);

[empricalCDF, interval2] = hist2cdf(freqs2, interval2, delta2);
[empricalCDF1, interval3] = hist2cdf(freqs3, interval3, delta3);

formulaGenerated = geometricGenerateFormula(0.5);
formulaGenerated1 = geometricGenerateFormula(0.3);

%-------------------------------------------------------
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
legend('p = 0.5  MY CREATED  GEOMETRÝC DÝSTRÝBUTÝON PMF ', 'p = 0.5 ANALYTÝCAL RESULTS WÝTH DÝSTRÝBUTÝON FORMULAS ','p = 0.3  MY CREATED  GEOMETRÝC DÝSTRÝBUTÝON PMF ', 'p = 0.3 ANALYTÝCAL RESULTS WÝTH DÝSTRÝBUTÝON FORMULAS')
set(gcf,'Position', get(gcf,'Position') + [0,0,150,0]); 
pos1 = get(gcf,'Position'); 
set(gcf,'Position', pos1 - [pos1(3)/1.5,0,0,0])
%-----------------------------------------------------
figure(2)
stem(interval2,empricalCDF,'fill','LineStyle','none');
hold on
stem(interval3,empricalCDF1,'fill','LineStyle','none');
xlabel('x '); 
ylabel('Emprical CDF - $\mid f_X(x) \mid$ ', 'interpreter', 'latex');
legend(' p = 0.5  MY CREATED  GEOMETRÝC DÝSTRÝBUTÝON CDF ',' p = 0.3  MY CREATED  GEOMETRÝC DÝSTRÝBUTÝON CDF','Location','Northeast')
set(gcf,'Position', get(gcf,'Position') + [0,0,250,0]); 
pos2 = get(gcf,'Position');  
set(gcf,'Position', pos2 + [pos1(3)/3,0,0,0])
%-----------------------------------------------------

clc
%Mean ve variance hesaplari
fprintf("Hesapladigimiz p=0,5 deki mean = %f\n",myMeanFunction(samples)); 
fprintf("Hesapladigimiz p=0,5 deki variance = %f\n",myVarianceFunction(samples)); 
fprintf("\n");
fprintf("Hesapladigimiz p=0,5 deki mean = %f\n",myMeanFunction(samples1)); 
fprintf("Hesapladigimiz p=0,3 deki variance = %f\n",myVarianceFunction(samples1));

%BERNOUÝLLÝ RANDOM VARÝABLE ÝLE GEOMETRÝC DÝSTRÝBUTÝON URETEN FONKSÝYON 
function generated = geometricGenerate(p,samplesize)
   for i = 1:samplesize
        samples = 0;
        counter = 0;
        while samples < p
             [samples,succeed] = bernouillirv(1, p);
             counter = counter + 1;
        end
        generated(i) = counter-1;
   end
end
 
%FORMUL ÝLE GEOMETRÝC DÝSTRÝBUTÝON URETEN FONKSÝYON
function generated = geometricGenerateFormula(p)
    for i = 1:10 
       generated(i) = p * power(1-p,i-1); 
    end
end
