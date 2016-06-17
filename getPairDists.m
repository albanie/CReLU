function pairDists = getPairDists(filters)
% GETPAIRDISTS computes the cosine distance for filter pairs
%   GETPAIRDISTS computes, for each filter in the set, 
%   the cosine distance of its "pairing", defined to be 
%   the filter in the set which has the lowest cosine 
%   similarity
%
%   Args:
%       `filters` is an H x W x D x N array where 
%           H is height, W is width, D is depth and N 
%           is the number of filters in the set, each of
%           which has L2-norm of 1


% find the cosine distances for each filter pair
pairDists = zeros(size(filters, 4), 1);
for i = 1:size(filters,4)
    filter = filters(:,:,:,i);
    [~, cosDist] = findPairFilter(filter, filters);
    pairDists(i) = cosDist;
end
