function [ r ] = Cal_betas( F, D )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    fnum = size(F,2);
    r = cell(fnum,1);
    for i=1:fnum
        r{i} = zeros(1,size(F,1));
        for j=1:size(F,1)
            r{i}(j) = Beta(i,j,F,D);
        end
    end
end

