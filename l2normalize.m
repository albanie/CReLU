function filters = l2normalize(filters)
% L2NORMALIZE L2-normalizes each filter
%   L2NORMALIZE normalizes an array of filters so
%   that each filter has an L2-norm of 1
%
%   Args:
%       `filters` is an H x W x D x N array where 
%           H is height, W is width, D is depth and N 
%           is the number of filters in the set

for i = 1:size(filters, 4)
    filter = filters(:,:,:,i);
    filter = filter ./ sqrt(sum(filter(:).^2));
    filters(:,:,:,i) = filter;
end