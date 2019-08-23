function [ result,t, t0, t1, t2, max_sample, avg_sample ] = DFS_FRS( F,D,node_num )
%UNTITLED17 此处显示有关此函数的摘要
%   此处显示详细说明
    t = 0;
    tic;
    [~,fnum] = size(F);
    lambdas = ones(size(D));
    
    d_index = Data_decomp(D,node_num);
    t0 = toc;
    t = t + t0;
    fprintf('Data decomposition time: %f\n',t);
    t1 = 0;
    for i=1:node_num
        tic;
        index = d_index{i};
        t_t = length(index)*fnum*8/(12.5*1024*1024); %100Mbps
        F_B = F(index, :);
        D_B = D(index, :);
        L_B = lambdas(index, :);
        L_B = ReCal_lambdas(F_B, D_B, L_B);
        lambdas(index, :) = L_B;
        t1 = max(t1, toc+t_t);
    end
    fprintf('Calculate lambda time: %f\n',t1);
    t = t + t1;
    
    result = [];
    t2 = 0;
    total_sample = 0;
    max_sample = 0;
    for i=1:node_num
        tic;
        index = d_index{i};
        F_B = F(index, :);
        D_B = D(index, :);
        L_B = lambdas(index, :);
        DISas = Cal_DISas(F_B, D_B, L_B);
        DISR = DIS(1:fnum,DISas);
        RED = Get_Core(DISas);
        DISred = DIS(RED,DISas);
        while size(DISR,1) ~= size(DISred,1)
            [DISred, RED] = Add_feature( DISas, DISred, RED, fnum);
        end
        if isempty(result)
            result = RED;
        else
            result = union(result,RED);
        end
        tt = toc;
        fprintf('node %d calculate %d samples: %f s\n',i,length(index),tt);
        t2 = max(t2,tt);
        max_sample = max(max_sample, length(index));
        total_sample = total_sample + length(index);
    end
    avg_sample = total_sample / node_num;
    
    
    fprintf('Calculate Red time: %f\n',t2);
    t = t + t2;
    fprintf('Total time: %f\n',t);

end

