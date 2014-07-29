load('TDT2_data', 'fea', 'gnd');

% YOUR CODE HERE
options = [];
options.NeighborMode = 'KNN';
options.k = 5;
options.WeightMode = 'HeatKernel';
options.t = 1;
W = constructW(fea,options);
idx = spectral(W, 2);
