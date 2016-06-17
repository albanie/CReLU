function [pairFilter, cosDist] = findPairFilter(filter, filterSet)
% FINDPAIRFILTER finds the pair of filter in filterSet
%   FINDPAIRFILTER returns the filter, `pairFilter` in 
%   `filterSet` that has the lowest cosine similarity 
%   with `filter`, together with the cosine similarity.
%   Both `filter` and all members of `filterSet` must 
%   have an L2-norm of 1.
%
%   Args:
%       `filter` is an H x W x D array with L2-norm 1 
%             where H is height, W is width, D is depth 
%       `filterSet` is an H x W x D x N array where 
%           H is height, W is width, D is depth and N 
%           is the number of filters in the set, each of
%           which has L2-norm of 1


numFilters = size(filterSet, 4);

% compute cosine distances
cosineDistances = zeros(numFilters, 1);
for i = 1:numFilters
    candidate = filterSet(:,:,:,i);
    cosineDistances(i) = dot(filter(:), candidate(:));
end

% find pairing filter
[cosDist, idx] = min(cosineDistances);
pairFilter = filterSet(:,:,:,idx);