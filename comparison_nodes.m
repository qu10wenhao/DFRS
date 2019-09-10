%Select dataset
load gamma.mat
dataset = gamma;

%Normalization
F = dataset(:,1:size(dataset,2)-1);
D = dataset(:,size(dataset,2));
[y,~] = mapminmax(F',0,1);
F = y';
datanum = size(dataset,1);

%KNN result using Original Arttibutes
RandIndex = randperm(datanum);
vF = F(RandIndex, :);
vD = D(RandIndex, :);
acc0 = knn_verify(vF, vD, 3);

%Using DFRS with 1,5,10...100 nodes
fs = zeros(21,8);
[result,t, t0, t1, t2, max_sample, avg_sample] = DFRS(F,D,1);
acc = knn_verify(vF(:,result), vD, 3);
fs(1,:) = [length(result),t, t0, t1, t2, max_sample, avg_sample,acc];
j = 5:5:100;
for i=1:20
    [result,t, t0, t1, t2, max_sample, avg_sample] = DFRS(F,D,j(i));
    acc = knn_verify(vF(:,result), vD, 3);
    fs(i+1,:) = [length(result),t, t0, t1, t2, max_sample, avg_sample,acc];
end