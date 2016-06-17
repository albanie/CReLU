% experiment1 generates the image shown in figure 1 of the paper
% "Visualization of conv 1 filters from Alexnet"

% select model
model = 'vgg-vd-16';
net = loadModel(model);
figPath = sprintf('figs/fig1/%s.png', model);

% L2 normalize filters in the first layer
filters = net.params(1).value;
filters = l2normalize(filters);

% find the pair corresponding to each filter
pairFilters = zeros(size(filters));
for i = 1:size(filters,4)
    filter = filters(:,:,:,i);
    pairFilter = findPairFilter(filter, filters);
    pairFilters(:,:,:,i) = pairFilter;
end

% attach the pairs together for easy visualization
[H, W, D, N] = size(filters);
combinedPairs = zeros(H, W * 2, D, N);
for i = 1:N
    filter = filters(:,:,:,i);
    pairFilter = pairFilters(:,:,:,i);
    combinedPairs(:,:,:,i) = cat(2, filter, pairFilter); 
end

% Create a figure to visualize the filters 
clf;
hFig = figure(1);
height=400 ;
width=800;
set(hFig, 'Position', [0 0 width height])
numPairs = size(combinedPairs, 4);
numCols = numPairs / 8;

% plot the filters arranged as a grid
vl_imarraysc(combinedPairs);
title(sprintf('First layer filter pairs in %s', model), 'fontSize', 18);
set(gca,'ytick',[])
set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'yticklabel',[]) 

% save the figure
print(figPath, '-dpng');