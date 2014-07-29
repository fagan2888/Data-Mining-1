%% 1
load('kmeans_data.mat');
for i=1:1:1000
    disp(i);
    [idx, ctrs, iter_ctrs] = kmeans(X, 2);
    kmeans_plot(X, idx, ctrs, iter_ctrs);
end

%% 2
load('digit_data.mat')
[idx, ctrs, iter_ctrs] = kmeans(X, 50);
show_digit(ctrs);