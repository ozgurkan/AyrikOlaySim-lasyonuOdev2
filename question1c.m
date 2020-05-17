%ÖZGÜR KAN
%15011702
%13.05.2020

clear all;
clc;

noSamples=10000;
noBins=15;
%MY GENERATE POÝSSON DÝSTRÝBUTÝON HÝSTOGRAM,PDF AND CDF
samples=poissonGenerate(6,noSamples);
samples1=poissonGenerate(4.5,noSamples);

[freqs, interval, delta]=histogram(samples, noBins);
[freqs1, interval1, delta1]=histogram(samples1, noBins);

[empricalPDF, interval] = hist2pdf(freqs, interval, delta);
[empricalCDF, interval] = hist2cdf(freqs, interval, delta);

[empricalPDF1, interval1] = hist2pdf(freqs1, interval1, delta1);
[empricalCDF1, interval1] = hist2cdf(freqs1, interval1, delta1);

formulaGenerated = poissonGenerateFormula(6);
formulaGenerated1 = poissonGenerateFormula(4.5);

%------------------------------------------------------
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
legend('LAMDA = 6  MY CREATED  POÝSSON DÝSTRÝBUTÝON PMF ', 'LAMDA = 6 ANALYTÝCAL RESULTS WÝTH DÝSTRÝBUTÝON FORMULAS ','LAMDA = 4.5  MY CREATED  POÝSSON DÝSTRÝBUTÝON PMF ', 'LAMDA = 4.5 ANALYTÝCAL RESULTS WÝTH DÝSTRÝBUTÝON FORMULAS')
set(gcf,'Position', get(gcf,'Position') + [0,0,150,0]); 
pos1 = get(gcf,'Position'); 
set(gcf,'Position', pos1 - [pos1(3)/1.5,0,0,0])
%-------------------------------------------------------
figure(2)
stem(interval,empricalCDF,'fill','LineStyle','none');
hold on
stem(interval1,empricalCDF1,'fill','LineStyle','none');
xlabel('x '); 
ylabel('Emprical CDF - $\mid f_X(x) \mid$ ', 'interpreter', 'latex');
legend('LAMDA = 6  MY CREATED  POÝSSON DÝSTRÝBUTÝON CDF ',' LAMDA = 4.5  MY CREATED  POÝSSON DÝSTRÝBUTÝON CDF','Location','Northeast')
set(gcf,'Position', get(gcf,'Position') + [0,0,250,0]); 
pos2 = get(gcf,'Position');  
set(gcf,'Position', pos2 + [pos1(3)/3,0,0,0])
%--------------------------------------------------------

clc
%Mean ve variance hesaplari
fprintf("Hesapladigimiz LAMDA = 6 daki mean = %f\n",myMeanFunction(samples)); 
fprintf("Hesapladigimiz LAMDA = 6 daki variance = %f\n",myVarianceFunction(samples)); 
fprintf("\n");
fprintf("Hesapladigimiz LAMDA = 4.5 daki mean = %f\n",myMeanFunction(samples1)); 
fprintf("Hesapladigimiz LAMDA = 4.5 daki variance = %f\n",myVarianceFunction(samples1));

%Poisson Distribution ureten fonksiyon
function generated = poissonGenerate(lambda,samplesize)
    for i =1:samplesize
        counter = 0;
        k = 1;
        total = 0;
        while k == 1
            counter = counter + 1;
            b = rand(1,1);
            c = log(b)/(-1);
            total = total + c;
            if total >lambda 
                k = 0;
                generated(i) = counter-1;
            end
        end
    end
end
 
%formul ile Poisson Distribution ureten fonksiyon
function generated = poissonGenerateFormula(lambda)
    for i = 1:40
        generated(i) = (power(exp(1),-lambda)*power(lambda,i))/factorial(i);
    end
end
