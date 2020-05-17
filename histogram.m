function [freqs, interval, delta] = histogram(samples, noBins)
% Herein finding the max and min values of random samples 
minSample = min(samples);
maxSample = max(samples);

% Herein using the max and min values to find the parameter "delta", which
% is the width of each bin. 
delta = (maxSample-minSample)/ noBins;

% Herein we find the indices of the samples and also we determine the
% interval where the samples are distributed.  
intervalIndices = ceil((samples - minSample+eps)/delta);
%fprintf("%f\n",intervalIndices);
%fprintf("%f \n",samples,);
interval = minSample + (1:noBins)*delta - delta/2;

% Herein we find howmany samples fall in each bins. 
freqs = zeros(1, max(intervalIndices));
for index = 1:max(intervalIndices)
    freqs(index) = numel(find(intervalIndices == index));
end
end
