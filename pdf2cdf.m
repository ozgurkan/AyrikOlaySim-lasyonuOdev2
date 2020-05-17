function [empricalCDF, interval] = pdf2cdf(empricalPDF, interval)

delta = interval(2)-interval(1);
empricalCDF = cumsum(empricalPDF*delta);