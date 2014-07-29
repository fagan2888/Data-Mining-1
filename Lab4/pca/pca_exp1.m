load('ORL_data', 'fea_Train', 'gnd_Train', 'fea_Test', 'gnd_Test');

% YOUR CODE HERE
dim=128;
% 1. Feature preprocessing
% 2. Run PCA
[eigvector,eigvalue] = pca(fea_Train);
% 3. Visualize eigenface
%show_face(eigvector');
% 4. Project data on to low dimensional space
train = fea_Train*eigvector(:,1:dim);
test = fea_Test*eigvector(:,1:dim);
% 5. Run KNN in low dimensional space
y = knn(test', train', gnd_Train', 1);
error = length(find(y'~=gnd_Test)) / size(test, 1);
disp(error);
% 6. Recover face images form low dimensional space, visualize them