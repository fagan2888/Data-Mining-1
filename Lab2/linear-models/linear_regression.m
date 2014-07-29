function [train_error, test_error, w] = linear_regression(X, y)
%LINEAR_REGRESSION Linear Regression.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%
%   OUTPUT: w:    learned perceptron parameters, (P+1)-by-1 column vector.
%

% YOUR CODE HERE
% training
train_X = X(:,1:size(X,2)/2);
train_y = y(:,1:size(X,2)/2);
train_X = [ones(1,size(train_X, 2));train_X];
w = inv(train_X*train_X')*train_X*train_y';
% compute training error
train_error = 0;
for i = 1:1:size(train_X, 2)
    if sign(train_X(:,i)' * w) ~= train_y(1, i)
		train_error = train_error + 1;
    end
end
% compute testing error
test_error = 0;
test_X = X(:,size(X,2)/2+1:size(X,2));
test_y = y(:,size(X,2)/2+1:size(X,2));
test_X = [ones(1,size(test_X, 2));test_X];
for i = 1:1:size(test_X, 2)
    if sign(test_X(:,i)' * w) ~= test_y(1, i)
		test_error = test_error + 1;
    end
end
% percentage error rate
train_error = train_error / size(train_X, 2);
test_error = test_error / size(test_X, 2);
end