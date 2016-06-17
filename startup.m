% create a paths struct (holds locations
% of data directories and useful libraries)

% NOTE: replace with your own library paths
MATCONVNET_PATH = '~/coding/libs/matconvnets/matconvnet';
VLFEAT_PATH = '~/coding/libs/vlfeat';

% NOTE: replace with path to directory containing
% your matconvnet models
MODELS_DIR = '~/data/models/matconvnet/';

% load libraries
run(fullfile(MATCONVNET_PATH, 'matlab', 'vl_setupnn'));
run(fullfile(VLFEAT_PATH, 'toolbox', 'vl_setup'));