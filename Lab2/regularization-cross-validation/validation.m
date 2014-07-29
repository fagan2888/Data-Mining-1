%% Ridge Regression
load('digit_train', 'X', 'y');

% Do feature normalization
% ...
% X = zscore(X);
show_digit(X);
% Do LOOCV
lambdas = [1e-3, 1e-2, 1e-1, 0, 1, 1e1, 1e2, 1e3];
min_E_val = size(X, 2);
afterX = [ones(1,size(X, 2));X];
% find the optimal lambda
% for i = 1:length(lambdas)
%     E_val = 0;
%     for j = 1:size(X, 2)
%         X_ = X;
%         y_ = y;
%         X_(:,j) = []; y_(:,j) = []; % take point j out of X
%         w = ridge(X_, y_, lambdas(i));
%         if sign(w' * afterX(:, j)) ~= y(1, j)
%             E_val = E_val + 1;
%         end
%     end
%     % Update lambda according validation error
%     fprintf('lambda = %d, error count = %d\n', lambdas(i), E_val);
%     if E_val < min_E_val
%        min_E_val =  E_val;
%        lambda = lambdas(i);
%     end
% end
% disp(lambda);
% 2.(ii)
% lambda = 0;
% w = ridge(X, y, 100);
% sum = w' * w;
% disp(sum);
% Compute testing and training error
lambda = 100;
w = ridge(X, y, 100);
% training
train_error_val = 0;
for i = 1:size(X, 2)
    if sign(w' * afterX(:, i)) ~= y(1, i)
        train_error_val = train_error_val + 1;
    end
end
train_error_val = train_error_val / size(X, 2)
% testing
test_error_val = 0;
load('digit_test', 'X_test', 'y_test');
afterX_test = [ones(1,size(X_test, 2));X_test];
% Do feature normalization
X_test = zscore(X_test);
% Compute test error
for i = 1:size(X_test, 2)
    if sign(w' * afterX_test(:, i)) ~= y_test(1, i)
        test_error_val = test_error_val + 1;
    end
end
test_error_val = test_error_val / size(X_test, 2)
% %% Logistic
% 
% %% SVM with slack variable
