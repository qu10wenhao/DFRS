function [ red ] = Del_feature( DISas, red)
%UNTITLED16 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    for i=red
        for j=red
            if i==j
                continue
            end
            rmd = setdiff(DISas{i},DISas{j});
            if isempty(rmd)
                red = setdiff(red,i);
                return
            end
        end
    end
end

