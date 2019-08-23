function [ DISred, red ] = Add_feature( DISas, DISred, red, total)
%UNTITLED16 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    a = 0;
    maxsize = 0;
    for i=1:total
        if ismember(i,red)
            continue
        end
        extra = setdiff(DISas{i},DISred);
        if length(extra) > maxsize
            maxsize = length(extra);
            a = i;
        end
    end
    DISred = union(DISred, DISas{a});
    red = [red,a];
end

