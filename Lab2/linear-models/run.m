% You can use this skeleton or write your own.
% You are __STRONGLY__ suggest to run this script section-by-section using Ctrl+Enter.
% See http://www.mathworks.cn/cn/help/matlab/matlab_prog/run-sections-of-programs.html for more details.

%% Part1: Preceptron
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
trainCount = 0;
testCount = 0;
avgIter = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    [w_g, iter, E_train, E_test] = perceptron(X, y);
    % Compute training, testing error
    % Sum up number of iterations
    trainCount = trainCount + E_train;
    testCount = testCount + E_test;
    avgIter = avgIter + iter;
end
trainCount = trainCount / nRep;
testCount = testCount / nRep;
avgIter = avgIter / nRep;
fprintf('E_train is %f, E_test is %f.\n', trainCount, testCount);
fprintf('Average number of iterations is %d.\n', avgIter);
plotdata(X, y, w_f, w_g, 'Pecertron');

%% Part2: Preceptron: Non-linearly separable case
nRep = 100; % number of replicates
nTrain = 100; % number of training data
trainCount = 0;
testCount = 0;
avgIter = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain, 'noisy');
    [w_g, iter, E_train, E_test] = perceptron(X, y);
    % Compute training, testing error
    % Sum up number of iterations
    trainCount = trainCount + E_train;
    testCount = testCount + E_test;
    avgIter = avgIter + iter;
end
trainCount = trainCount / nRep;
testCount = testCount / nRep;
avgIter = avgIter / nRep;
fprintf('E_train is %f, E_test is %f.\n', trainCount, testCount);
fprintf('Average number of iterations is %d.\n', avgIter);
plotdata(X, y, w_f, w_g, 'Pecertron');

%% Part3: Linear Regression
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
E_train = 0;
E_test = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    [train, test, w_g] = linear_regression(X, y);
    % Compute training, testing error
    E_train = E_train + train;
    E_test = E_test + test;
end
E_train = E_train / nRep;
E_test = E_test /nRep;
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Linear Regression');

%% Part4: Linear Regression: noisy
nRep = 1000; % number of replicates
nTrain = 100; % number of training data
E_train = 0;
E_test = 0;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain, 'noisy');
    [train, test, w_g] = linear_regression(X, y);
    % Compute training, testing error
    E_train = E_train + train;
    E_test = E_test + test;
end
E_train = E_train / nRep;
E_test = E_test /nRep;
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Linear Regression: noisy');

%% Part5: Linear Regression: poly_fit
load('poly_train', 'X', 'y');
load('poly_test', 'X_test', 'y_test');
% training
X = [ones(1,size(X, 2));X];
w = inv(X*X')*X*y';
% compute training error
E_train = 0;
for i = 1:1:size(X, 2)
    if sign(X(:,i)' * w) ~= y(1, i)
        E_train = E_train + 1;
    end
end
% testing
E_test = 0;
X_test = [ones(1,size(X_test, 2));X_test];
for i = 1:1:size(X_test, 2)
    if sign(X_test(:,i)' * w) ~= y_test(1, i)
        E_test = E_test + 1;
    end
end
% Compute training, testing error
E_train = E_train / size(X, 2);
E_test = E_test / size(X_test, 2);
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);

% ====================================================
% poly_fit with transform
%X_t = X; % CHANGE THIS LINE TO DO TRANSFORMATION
for i = 1:1:size(X, 2)
    X(5, i) = X(2, i) ^ 2;
    X(4, i) = X(1, i) ^ 2;
    X(3, i) = X(1, i) * X(2, i);
end
% X_test_t = X_test; % CHANGE THIS LINE TO DO TRANSFORMATION
for i = 1:1:size(X_test, 2)
    X_test(5, i) = X_test(2, i) ^ 2;
    X_test(4, i) = X_test(1, i) ^ 2;
    X_test(3, i) = X_test(1, i) * X_test(2, i);
end
% w = linear_regression(X_t, y);
w = inv(X*X')*X*y';
E_train = 0;
for i = 1:1:size(X, 2)
    if sign(X(:,i)' * w) ~= y(1, i)
        E_train = E_train + 1;
    end
end
% testing
E_tset = 0;
for i = 1:1:size(X_test, 2)
    if sign(X_test(:,i)' * w) ~= y_test(1, i)
        E_test = E_test + 1;
    end
end
% Compute training, testing error
E_train = E_train / size(X, 2);
E_test = E_test / size(X_test, 2);
% Compute training, testing error
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);


%% Part6: Logistic Regression
nRep = 100; % number of replicates
nTrain = 100; % number of training data

for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    w_g = logistic(X, y);
    % Compute training, testing error
end

%fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Logistic Regression');

%% Part7: Logistic Regression: noisy
nRep = 100; % number of replicates
nTrain = 100; % number of training data
nTest = 10000; % number of training data

for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain, 'noisy');
    w_g = logistic(X, y);
    % Compute training, testing error
end

%fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Logistic Regression: noisy');

%% Part8: SVM
nRep = 100; % number of replicates
nTrain = 50; % number of training data

for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    [w_g] = svm(X, y);
    % Compute training, testing error
    % Sum up number of support vectors
end

p = -sign(w_g' * [ones(1,size(X, 2));X]);
fprintf('Error rate is %f.\n', length(find(p ~= y))/length(p));

% fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'SVM');
