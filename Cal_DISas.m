function [ r ] = Cal_DISas( F, D, lambdas, total_size, fpx)
%UNTITLED12 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    if ~exist('total_size', 'var')
        total_size = size(D,1);
    end
    if ~exist('fpx', 'var')
        fpx=0;
    end
    r = cell(size(F,2),1);
    for i=1:size(F,2)
        r{i} = DIS_a(i,F, D, lambdas, total_size, fpx);
    end

end

