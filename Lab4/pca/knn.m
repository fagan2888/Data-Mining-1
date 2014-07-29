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

[p,n]=size(X);

D = EuDist2(X', X_train');

y1=zeros(1,K);

for i=1:n
   [b,index]=sort(D(i,:));
   for j=1:K
       y1(j) = y_train(index(j));
   end
   table=tabulate(y1);
   [F,I]=max(table(:,2));
   I=find(table(:,2)==F);
   result=table(I,1);
   y(i)=result(1,1);
end

end

