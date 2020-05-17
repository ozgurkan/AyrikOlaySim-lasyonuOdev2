%ÖZGÜR KAN
%15011702
%13.05.2020

clear all;
clc;

noSamples=10000;
noBins=30;

%MY GENERATE NORMAL DÝSTRÝBUTÝON,HÝSTOGRAM,PDF AND CDF
samples=normalGenerate(3.1,5);
samples1=normalGenerate(1,2);

[freqs, interval, delta]=histogram(samples, noBins);
[freqs1, interval1, delta1]=histogram(samples1, noBins);

[empricalPDF, interval] = hist2pdf(freqs, interval, delta);
[empricalCDF, interval] = hist2cdf(freqs, interval, delta);

[empricalPDF1, interval1] = hist2pdf(freqs1, interval1, delta1);
[empricalCDF1, interval1] = hist2cdf(freqs1, interval1, delta1);

%FORMULA GENERATE NORMAL DÝSTRÝBUTÝON,HÝSTOGRAM,PDF AND CDF
formulaGenerated = normalGenerateFormula(3.1,5);
formulaGenerated1 = normalGenerateFormula(1,2);

[freqs2, interval2, delta2]=histogram(formulaGenerated, noBins);
[freqs3, interval3, delta3]=histogram(formulaGenerated1, noBins);

[empricalPDF2, interval2] = hist2pdf(freqs2, interval2, delta2);
[empricalCDF2, interval2] = hist2cdf(freqs2, interval2, delta2);

[empricalPDF3, interval3] = hist2pdf(freqs3, interval3, delta3);
[empricalCDF3, interval3] = hist2cdf(freqs3, interval3, delta3);

%---------------------------------
figure(1)
plot(empricalPDF);
%stem(interval,empricalPDF,'fill','LineStyle','none');
hold on
plot(empricalPDF2)
hold on
plot(empricalPDF1)
%stem(interval1,empricalPDF1,'fill','LineStyle','none');
hold on
plot(empricalPDF3)
%plot(formulaGenerated1)
xlabel('x '); 
ylabel('Emprical PDF - $\mid f_X(x) \mid$ ', 'interpreter', 'latex');
legend('MEAN=3.1 VARÝANCE=5 MY CREADTED  NORMAL DÝSTRÝBUTÝON PDF ','MEAN=3.1 VARÝANCE=5 ANALYTÝCAL RESULTS WÝTH DÝSTRÝBUTÝON FORMULAS PDF','MEAN=1 VARÝANCE=2  MY CREADTED  NORMAL DÝSTRÝBUTÝON PDF','MEAN=1 VARÝANCE=2 ANALYTÝCAL RESULTS WÝTH DÝSTRÝBUTÝON FORMULAS PDF')
set(gcf,'Position', get(gcf,'Position') + [0,0,150,0]); 
pos1 = get(gcf,'Position'); 
set(gcf,'Position', pos1 - [pos1(3)/1.5,0,0,0])
%---------------------------------
figure(2)
stem(interval,empricalCDF,'fill','LineStyle','none');
hold on
stem(interval2,empricalCDF2,'fill','LineStyle','none');
hold on
stem(interval1,empricalCDF1,'fill','LineStyle','none');
hold on
stem(interval3,empricalCDF3,'fill','LineStyle','none');
xlabel('x '); 
ylabel('Emprical CDF - $\mid f_X(x) \mid$ ', 'interpreter', 'latex');
legend('MEAN=3.1 VARÝANCE=5 MY CREADTED  NORMAL DÝSTRÝBUTÝON CDF ','MEAN=3.1 VARÝANCE=5 ANALYTÝCAL RESULTS WÝTH DÝSTRÝBUTÝON FORMULAS CDF','MEAN=1 VARÝANCE=2  MY CREADTED  NORMAL DÝSTRÝBUTÝON CDF','MEAN=1 VARÝANCE=2 ANALYTÝCAL RESULTS WÝTH DÝSTRÝBUTÝON FORMULAS CDF','Location','northwest')
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

%Bu fonksiyon random sayý ureterek Normal distribution uretir.
function generitical = normalGenerate(mean,variance)
     for i=1:1:1000
      generitical(i)=sqrt(-2*log(rand()))*cos(2*pi()*rand())*sqrt(variance)+mean;
     end    
end

%Formul ile Normal distribution cdf ureten fonksiyon
function analitycal = normalGenerateFormula(mean,variance)      
    for i=1:1:1000
           analitycal(i)= sqrt(-2*log(rand()))*sin(2*pi()*rand())*sqrt(variance)+mean;
    end    
end

