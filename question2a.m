%ÖZGÜR KAN
%15011702
%13.05.2020

clear all;
clc;

noSamples=10000;
noBins=80;
%MY GENERATE EXPONENTÝAL DÝSTRÝBUTÝON HÝSTOGRAM,PDF AND CDF
samples=exponentialGenerate(1.2,noSamples);
samples1=exponentialGenerate(2.1,noSamples);

[freqs, interval, delta]=histogram(samples, noBins);
[freqs1, interval1, delta1]=histogram(samples1, noBins);

[empricalPDF, interval] = hist2pdf(freqs, interval, delta);
[empricalCDF, interval] = hist2cdf(freqs, interval, delta);

[empricalPDF1, interval1] = hist2pdf(freqs1, interval1, delta1);
[empricalCDF1, interval1] = hist2cdf(freqs1, interval1, delta1);

%FORMULA GENERATE EXPONENTÝAL DÝSTRÝBUTÝON HÝSTOGRAM,PDF AND CDF
formulaGenerated = exponentialGenerateFormula(1.2,noSamples, samples);
formulaGenerated1 = exponentialGenerateFormula(2.1,noSamples, samples1);

[freqs2, interval2, delta2]=histogram(formulaGenerated, noBins);
[freqs3, interval3, delta3]=histogram(formulaGenerated1, noBins);

[empricalPDF2, interval2] = hist2pdf(freqs2, interval2, delta2);
[empricalCDF2, interval2] = hist2cdf(freqs2, interval2, delta2);

[empricalPDF3, interval3] = hist2pdf(freqs3, interval3, delta3);
[empricalCDF3, interval3] = hist2cdf(freqs3, interval3, delta3);

%---------------------------------
figure(1)
stem(interval,empricalPDF,'fill','LineStyle','none');
hold on
%plot(formulaGenerated)
hold on
stem(interval1,empricalPDF1,'fill','LineStyle','none');
hold on
%plot(formulaGenerated1)
xlabel('x '); 
ylabel('Emprical PDF - $\mid f_X(x) \mid$ ', 'interpreter', 'latex');
legend('LAMDA = 1.2  MY CREATED  EXPONENTÝAL DÝSTRÝBUTÝON PDF ','LAMDA = 2.1  MY CREATED  EXPONENTÝAL DÝSTRÝBUTÝON PDF')
set(gcf,'Position', get(gcf,'Position') + [0,0,150,0]); 
pos1 = get(gcf,'Position'); 
set(gcf,'Position', pos1 - [pos1(3)/1.5,0,0,0])
%---------------------------------
figure(2)
stem(interval,empricalCDF,'fill','LineStyle','none');
hold on
%stem(samples,formulaGenerated,'fill','LineStyle','none');
plot(samples,formulaGenerated,'.');
hold on
stem(interval1,empricalCDF1,'fill','LineStyle','none');
hold on
%stem(samples1,formulaGenerated1,'fill','LineStyle','none');
plot(samples1,formulaGenerated1,'.');
xlabel('x '); 
ylabel('Emprical CDF - $\mid f_X(x) \mid$ ', 'interpreter', 'latex');
legend('LAMDA = 1.2 MY CREATED  EXPONENTÝAL DÝSTRÝBUTÝON CDF ','LAMDA = 1.2 ANALYTÝCAL RESULTS WÝTH DÝSTRÝBUTÝON FORMULAS CDF','LAMDA = 2.1  MY CREATED  EXPONENTÝAL DÝSTRÝBUTÝON CDF','LAMDA = 2.1 ANALYTÝCAL RESULTS WÝTH DÝSTRÝBUTÝON FORMULAS CDF')
set(gcf,'Position', get(gcf,'Position') + [0,0,250,0]); 
pos2 = get(gcf,'Position');  
set(gcf,'Position', pos2 + [pos1(3)/3,0,0,0])
%---------------------------------
clc

%Mean ve variance hesaplari
fprintf("Hesapladigimiz LAMDA = 1.2 daki mean = %f\n",myMeanFunction(samples)); 
fprintf("Hesapladigimiz LAMDA = 1.2 daki variance = %f\n",myVarianceFunction(samples)); 
fprintf("\n");
fprintf("Hesapladigimiz LAMDA = 2.1 daki mean = %f\n",myMeanFunction(samples1)); 
fprintf("Hesapladigimiz LAMDA = 2.1 daki variance = %f\n",myVarianceFunction(samples1)); 
 
%Bu fonksiyon kendi random sayý ureterek exponential distribution uretir.
function generitical = exponentialGenerate(lambda,samplesize)
    for i = 1:samplesize
        generitical(i) = -log(rand(1))/lambda;
    end
end

%Formul ile Exponential distribution cdf ureten fonksiyon
function analitycal = exponentialGenerateFormula(lambda,samplesize, generated1)    
    for i = 1:samplesize
        analitycal(i)=1-exp(-generated1(i)*lambda);
    end
end
