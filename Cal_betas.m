function [ r ] = Cal_betas( F, D )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
    fnum = size(F,2);
    r = cell(fnum,1);
    for i=1:fnum
        r{i} = zeros(1,size(F,1));
        for j=1:size(F,1)
            r{i}(j) = Beta(i,j,F,D);
        end
    end
end

