%Select dataset
load small-data.mat
dataset = libras;

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

%Using DFRS with 1,5,10 nodes
[result,t, t0, t1, t2, max_sample, avg_sample] = DFRS(F,D,1);
acc1 = knn_verify(vF(:,result), vD, 3);
f1 = [length(result),t, t0, t1, t2, max_sample, avg_sample,acc1];

[result,t, t0, t1, t2, max_sample, avg_sample] = DFRS(F,D,5);
acc2 = knn_verify(vF(:,result), vD, 3);
f2 = [length(result),t, t0, t1, t2, max_sample, avg_sample,acc2];

[result,t, t0, t1, t2, max_sample, avg_sample] = DFRS(F,D,10);
acc1 = knn_verify(vF(:,result), vD, 3);
f3 = [length(result),t, t0, t1, t2, max_sample, avg_sample,acc3];