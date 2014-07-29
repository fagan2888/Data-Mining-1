function [w, iter, E_train, E_test] = perceptron(X, y)
%PERCEPTRON Perceptron Learning Algorithm.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%
%   OUTPUT: w:    learned perceptron parameters, (P+1)-by-1 column vector.
%           iter: number of iterations
%

% YOUR CODE HERE
input = [ones(size(X', 1), 1), X'];
w = ones(size(input, 2), 1);
m = 1; % learning rate
flag = 1;
iter = 0;
%   train
while flag == 1
    train_errorCount = 0;
    iter = iter + 1;
%     for each training pattern
    for i=1:1:size(input, 1)/2
%         compute output activation
        net = input(i,:) * w;
        if net >= 0
            out = 1;
        else
            out = -1;
        end;
%         whether we change the weight
        if out == y(1, i)
%             nothing happen
        else
            w = w + (2* m * y(1, i) * input(i,:))';
            train_errorCount = train_errorCount + 1;
        end
    end
    %disp(errorCount);
    if train_errorCount == 0 || iter > 5000
        flag = 0;
    end
end
%   calculate error
test_errorCount = 0;
for i=size(input, 1)/2 + 1:1:size(input, 1)
   %         compute output activation
    net = input(i,:) * w;
    if net >= 0
        out = 1;
    else
        out = -1;
    end;
%         whether we change the weight
    if out == y(1, i)
%             nothing happen
    else
       test_errorCount = test_errorCount + 1;
    end
end
E_train = train_errorCount / (size(input, 1)/2);
E_test = test_errorCount / (size(input, 1)/2);
w = w';
end
