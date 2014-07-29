function W = knn_graph(X, k, threshold)
%KNN_GRAPH Construct W using KNN graph
%   Input: X - data point features, n-by-p maxtirx.
%          k - number of nn.
%          threshold - distance threshold.

% YOUR CODE HERE
n = size(X, 1);
p = size(X, 2);
W = zeros(n, n);
D = EuDist2(X, X);

for i=1:1:n
    [Dsort, Didx] = getNElements(D(i,:), k);
    for j=1:1:size(Didx,2)
        if(i ~= Didx(j) && D(i,Didx(j)) < threshold)
            W(i,Didx(j)) = 1;
            W(Didx(j),i) = 1;
        end
    end
end
end


function [smallestNElements smallestNIdx] = getNElements(A, n)
     [ASorted AIdx] = sort(A);
     smallestNElements = ASorted(1:n);
     smallestNIdx = AIdx(1:n);
end