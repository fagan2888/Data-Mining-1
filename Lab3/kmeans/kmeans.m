function [idx, ctrs, iter_ctrs] = kmeans(X, K)
%KMEANS K-Means clustering algorithm
%
%   Input: X - data point features, n-by-p maxtirx.
%          K - the number of clusters
%
%   OUTPUT: idx  - cluster label
%           ctrs - cluster centers, K-by-p matrix.
%           iter_ctrs - cluster centers of each iteration, K-by-p-by-iter
%                       3D matrix.

% YOUR CODE HERE
n = size(X, 1);
p = size(X, 2);
ctrs = zeros(K, p);
idx = zeros(n, 1);
iter_ctrs = zeros(K, p, 1);
% initialize centers
for i=1:1:K
    ctrs(K,:) = X(randi([1, n]),:);
end
iter_ctrs(:,:,1) = ctrs;
% start iterations
while (true)
    D = EuDist2(X, ctrs);
    for i=1:1:size(D, 1)
        [val index] = min(D(i,:));
        idx(i, 1) = index;
    end
    tempCtrs = zeros(K, p);
    countIdx = zeros(K, 1);
    for i=1:1:n
        tempCtrs(idx(i,1),:) = tempCtrs(idx(i,1),:) + X(i,:);
        countIdx(idx(i,1)) = countIdx(idx(i,1)) + 1;
    end
    for i=1:1:K
       if countIdx(i,1) ~= 0
        tempCtrs(i,:) = tempCtrs(i,:)./countIdx(i,1);
       else
           tempCtrs(i,:) = X(randi([1, n]),:);
       end
    end
    iter_ctrs = cat(3, iter_ctrs, ctrs);
    if tempCtrs == ctrs
        break;
    else
        ctrs = tempCtrs;
    end
end

end
