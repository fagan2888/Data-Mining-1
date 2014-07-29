% YOUR (TWO LINE) CODE HERE
%% 8
img = imread('sample0.jpg');
fea = double(reshape(img, size(img, 1)*size(img, 2), 3));
[idx, ctrs, iter_ctrs] = kmeans(fea, 64);
for i=1:1:size(fea, 1)
    fea(i,:) = ctrs(idx(i,1));
end
imshow(uint8(reshape(fea, size(img))));
%% 16
img = imread('sample1.jpg');
fea = double(reshape(img, size(img, 1)*size(img, 2), 3));
[idx, ctrs, iter_ctrs] = kmeans(fea, 16);
disp('return');
for i=1:1:size(fea, 1)
    fea(i,:) = ctrs(idx(i,1));
end
imshow(uint8(reshape(fea, size(img))));