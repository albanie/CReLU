function net = loadModel(model)
% LOADMODEL loads a matconvnet model from disk
%   Args: `model` is a string representing the
%   name of the model

% load paths object
startup;

switch model
    case 'alexnet'
        modelPath = 'imagenet-matconvnet-alex.mat';
    case 'resnet-50'
        modelPath = 'imagenet-resnet-50-dag.mat';
    case 'resnet-101'
        modelPath = 'imagenet-resnet-101-dag.mat';
    case 'resnet-152'
        modelPath = 'imagenet-resnet-152-dag.mat';
    case 'vgg-vd-16'
        modelPath = 'imagenet-vgg-verydeep-16.mat';
end

net = load(fullfile(MODELS_DIR, modelPath));

% note: unlike the other models, vgg-vd-16 is stored as a
% simpleNN, so is loaded differently
if ~strcmp(model, 'vgg-vd-16')
    net = dagnn.DagNN.loadobj(net);
else
    net = dagnn.DagNN.fromSimpleNN(net);
end

