function [ r ] = Cal_DISas_withbeta( F, D, lambdas, betas, total_size, fpx)
%UNTITLED12 此处显示有关此函数的摘要
%   此处显示详细说明
    if ~exist('total_size', 'var')
        total_size = size(D,1);
    end
    if ~exist('fpx', 'var')
        fpx=0;
    end
    r = cell(size(F,2),1);
    for i=1:size(F,2)
        beta = betas{i};
        r{i} = DIS_a_withbeta(i,F, D, lambdas, beta, total_size, fpx);
    end

end

