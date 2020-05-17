function [empricalCDF, interval] = cdf2pdf(empricalPDF, interval)

delta = interval(2)-interval(1);
empricalPDF = [0 diff(empricalCDF)]/delta;