function [empricalCDF, interval] = hist2cdf(freqs, interval, delta)

delta = interval(2)-interval(1);

[empricalPDF, interval] = hist2pdf(freqs, interval, delta)

empricalCDF = cumsum(empricalPDF*delta);