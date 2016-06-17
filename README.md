This directory contains some short experiments to reproduce some of the figures/results
described in the paper:

**Understanding and Improving Convolutional Neural Networks via 
Concatenated Rectified Linear Units**  
*Wenling Shang, Kihyuk Sohn, Diogo Almeida and Honglak Lee* ([https://arxiv.org/abs/1603.05201](https://arxiv.org/abs/1603.05201))

###Instructions

**Dependencies:**  [matconvnet](https://github.com/vlfeat/matconvnet) and [vlfeat](https://github.com/vlfeat/vlfeat) 

Once the dependencies are installed, all that remains is to modify the paths to these libraries in `setup.m`.  Then simply run the experiment scripts.

--


###Figure 1 

The first figure in the paper visualizes filter pairings from the first layer in alexnet.  The code in `experiment1.m` can be used to generate similar images for other matconvnet pretrained models. Some examples are shown below:

<img src="figs/fig1/alexnet.png" width="500">
<img src="figs/fig1/resnet-50.png" width="500">
<img src="figs/fig1/resnet-101.png" width="500">
<img src="figs/fig1/resnet-152.png" width="500">
<img src="figs/fig1/vgg-vd-16.png" width="500">  

**Notes:**

* The alexnet model used here is slightly different to the original (it was trained with batch normalization).
* The first layer filters in `vgg-vd-16` are much smaller than the other architectures - only `3 x 3`

###Figure 2 

The second figure in the paper illustrates how the distribution of cosine distances between filter pairings evolves through different layers of the network.  The example images shown below are computed for alexnet:

<img src="figs/fig2/alexnet-layer1.png" width="300"><img src="figs/fig2/alexnet-layer2.png" width="300"><img src="figs/fig2/alexnet-layer3.png" width="300"><img src="figs/fig2/alexnet-layer4.png" width="300"><img src="figs/fig2/alexnet-layer5.png" width="300">