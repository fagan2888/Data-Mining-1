function digits = hack(img_name)
%HACK Recognize a CAPTCHA image
%   Inputs:
%       img_name: filename of image
%   Outputs:
%       digits: 1x5 matrix, 5 digits in the input CAPTCHA image.

load('hack_data.mat');
% YOUR CODE HERE
K = 1;
y_train = X(1,:);
X_train = double(X(2:end,:));
X = double(extract_image('test.jpg'));
X_train = X_train./255.0;
X = X./255.0;
y = zeros(1, size(X, 2));
for i = 1:1:size(X, 2)
    D = EuDist2(X(:,i)', X_train');
    [Bsort Bidx] = getNElements(D, K);
    thisLabel = 0;
    for j = 1:1:K
        thisLabel = thisLabel + y_train(1, Bidx(j));
    end
    y(1, i) = round(thisLabel / K)
end
end

function [smallestNElements smallestNIdx] = getNElements(A, n)
     [ASorted AIdx] = sort(A);
     smallestNElements = ASorted(1:n);
     smallestNIdx = AIdx(1:n);
end