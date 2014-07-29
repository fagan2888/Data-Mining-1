load('digit_data', 'X', 'y');
load('weights', 'Theta1', 'Theta2');

p = feedforward(Theta1, Theta2, X);
% calculate error rate
fprintf('Error rate for NN is %f.\n', length(find(p ~= y))/length(p));

train_X = X(:, 1:2500);
train_y = y(1:2500);
test_X = X(:, 2501:end);
test_y = y(2501:end);

% YOUR CODE HERE
% Trainning and testing using one-vs-all with LIBLINEAR
for i=1:10
    for j=1:2500
        if train_y(j) == i
            thisOne(j) = 1;
        else
            thisOne(j) = -1;
        end
    end
    model = train(thisOne', sparse(train_X'), 'liblinear_options');
    w(:,i)=model.w;
end

result = w'*test_X;
[val, p] = max(result);

fprintf('Error rate for SVM is %f.\n', length(find(p ~= test_y))/length(p));