function [ r ] = ReCal_lambdas( F, D, lambdas)
%UNTITLED12 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
     r = lambdas;
     for i=1:size(r,1)
         r(i) = min(r(i),Lambda(i,F,D));
     end

end

