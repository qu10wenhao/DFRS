function [ r ] = Cal_lambdas( F, D )
%UNTITLED12 此处显示有关此函数的摘要
%   此处显示详细说明
     r = zeros(size(D));
     for i=1:size(D,1)
         r(i) = Lambda(i,F,D);
     end

end

