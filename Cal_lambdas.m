function [ r ] = Cal_lambdas( F, D )
%UNTITLED12 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
     r = zeros(size(D));
     for i=1:size(D,1)
         r(i) = Lambda(i,F,D);
     end

end

