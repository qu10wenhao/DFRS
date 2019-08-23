function [ r ] = ReCal_lambdas( F, D, lambdas)
%UNTITLED12 此处显示有关此函数的摘要
%   此处显示详细说明
     r = lambdas;
     for i=1:size(r,1)
         r(i) = min(r(i),Lambda(i,F,D));
     end

end

