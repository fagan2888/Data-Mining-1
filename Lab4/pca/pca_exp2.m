load('ORL_data', 'fea_Train', 'gnd_Train', 'fea_Test', 'gnd_Test');
% YOUR CODE HERE
dim=128;
show_face(fea_Test);
[eigvector,eigvalue] = pca(fea_Train);
test = fea_Test*eigvector(:,1:dim)*eigvector(:,1:dim)';
show_face(test);