function y = knn(X, X_train, y_train, K)
%KNN k-Nearest Neighbors Algorithm.
%
%   INPUT:  X:         testing sample features, P-by-N_test matrix.
%           X_train:   training sample features, P-by-N matrix.
%           y_train:   training sample labels, 1-by-N row vector.
%           K:         the k in k-Nearest Neighbors
%
%   OUTPUT: y    : predicted labels, 1-by-N_test row vector.
%
% YOUR CODE HERE
y = zeros(1, size(X, 2));
for i = 1:1:size(X, 2)
    D = EuDist2(X(:,i)', X_train');
    [Bsort Bidx] = getNElements(D, K);
    thisLabel = 0;
    for j = 1:1:K
        thisLabel = thisLabel + y_train(1, Bidx(j));
    end
    y(1, i) = round(thisLabel / K);
end

end

function [smallestNElements smallestNIdx] = getNElements(A, n)
     [ASorted AIdx] = sort(A);
     smallestNElements = ASorted(1:n);
     smallestNIdx = AIdx(1:n);
end