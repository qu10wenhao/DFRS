load small-data.mat
dataset = libras;
F = dataset(:,1:size(dataset,2)-1);
D = dataset(:,size(dataset,2));
%F = Xtrain;
%D = ytrain;
[y,~] = mapminmax(F',0,1);
F = y';
datanum = size(dataset,1);
%RandIndex = randperm(datanum);
%F = F(RandIndex, :);
%D = D(RandIndex, :);
%tic;
%lambdas = Cal_lambdas(F,D);
%toc

%d_index= Data_decomp(D,5);
RandIndex = randperm(datanum);
vF = F(RandIndex, :);
vD = D(RandIndex, :);
acc0 = knn_verify(vF, vD, 3);
save data.mat acc0;
%tic;

%result = zeros(4,8);
%j = [5000,2000,1500,1200];
%for i=3:4
%    dindex = Data_decomp(D,j(i))
%    [red,t, t0, t1, t2, max_sample, avg_sample] = DFS_FRS_TEST(F,D,j(i));
%    %acc = knn_verify(vF(:,red), vD, 3);
%    result(i,:) = [length(red),t, t0, t1, t2, max_sample, avg_sample,0];
%end


[result,t, t0, t1, t2, max_sample, avg_sample] = DFS_FRS(F,D,100);
acc1 = knn_verify(vF(:,result), vD, 3);
f1 = [length(result),t, t0, t1, t2, max_sample, avg_sample,acc1];
save data.mat acc0 f1;
[result,t, t0, t1, t2, max_sample, avg_sample] = DFS_FRS(F,D,50);
acc2 = knn_verify(vF(:,result), vD, 3);
f2 = [length(result),t, t0, t1, t2, max_sample, avg_sample,acc2];
save data.mat acc0 f1 f2;
[result,t, t0, t1, t2, max_sample, avg_sample] = DFS_FRS(F,D,20);
acc3 = knn_verify(vF(:,result), vD, 3);
f3 = [length(result),t, t0, t1, t2, max_sample, avg_sample,acc3];
save data.mat acc0 f1 f2 f3;
[result,t, t0, t1, t2, max_sample, avg_sample] = DFS_FRS(F,D,10);
acc4 = knn_verify(vF(:,result), vD, 3);
f4 = [length(result),t, t0, t1, t2, max_sample, avg_sample,acc4];
save data.mat acc0 f4;
save data.mat acc0 f1 f2 f3 f4;
[result,t, t0, t1, t2, max_sample, avg_sample] = DFS_FRS(F,D,5);
acc5 = knn_verify(vF(:,result), vD, 3);
f5 = [length(result),t, t0, t1, t2, max_sample, avg_sample,acc5];
save data.mat acc0 f4 f5;
save data.mat acc0 f1 f2 f3 f4 f5;
[result,t, t0, t1, t2, max_sample, avg_sample] = DFS_FRS(F,D,1);
acc6 = knn_verify(vF(:,result), vD, 3);
f6 = [length(result),t, t0, t1, t2, max_sample, avg_sample,acc6];
save data.mat acc0 f4 f5 f6;
[result,t] = FS_FRS(F,D);
f7 = [length(result),t];
save data.mat acc0 f1 f2 f3 f4 f5 f6;
%toc

%tic;
%[red2,concurve2] = MY_FS_FRS(F,D,1000);
%toc

%hold on;
%plot(1:length(concurve1),concurve1);
%plot(1:length(concurve2),concurve2);

%tic;
%red = FS_FRS(F,D);
%toc

%tic;
%red3 = IV_FS_FRS(F,D,10);
%toc

%RandIndex = randperm(datanum);
%vF = F(RandIndex, :);
%vD = D(RandIndex, :);
%acc0 = knn_verify(vF, vD, 3);
%acc1 = knn_verify(vF(:,red1), vD, 3);
%acc2 = knn_verify(vF(:,red2), vD, 3);
%acc3 = knn_verify(vF(:,red3), vD, 3);
%acc4 = knn_verify(vF(:,red4), vD, 3);

%f0 = acc0;
%f1 = [t1,length(red1),acc1];
%f2 = [t2,length(red2),acc2];
%f3 = [t3,length(red3),acc3];
%f4 = [t4,length(red4),acc4];
