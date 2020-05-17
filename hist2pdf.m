function [empricalPDF, interval] = hist2pdf(freqs, interval, delta)


delta = interval(2)-interval(1);
empricalPDF=freqs/sum(freqs)/delta;