% experiment plots the graphs shown in figure 2 of the paper
% "Visualization of conv 1 filters from Alexnet"

startup;

% select model
model = 'alexnet';
net = loadModel(model);


% generate the histograms for each of the first five layers
for layerNum = 1:5
    
    % get the filters from the first layer of alexnet and l2 normalize
    paramIdx = net.getParamIndex(sprintf('conv%df', layerNum));
    netFilters = net.params(paramIdx).value;
    netFilters = l2normalize(netFilters);
    alexDists = getPairDists(netFilters);
    
    % randomly generate (gaussian) equivalents
    randFilters = normrnd(0, 1, size(netFilters));
    randFilters = l2normalize(randFilters);
    randDists = getPairDists(randFilters);
    
    figure(layerNum);
    
    h1 = histogram(alexDists);
    hold on
    h2 = histogram(randDists);
    legend('alexnet', 'random', 'Location', 'northwest');
    title('Histograms of cosine distances');
    figPath = sprintf('figs/fig2/%s-layer%d.png', model, layerNum);
    
    % save the figure
    print(figPath, '-dpng');
end
