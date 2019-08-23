function [ r ] = Get_Core( DISas )
%UNTITLED15 此处显示有关此函数的摘要
%   此处显示详细说明
    r = [];
    for i=1:size(DISas,1)
        s = DISas{i};
        for j=1:size(DISas,1)
            if i == j
                continue
            end
            tmp = DISas{j};
            s = setdiff(s,tmp);
            if isempty(s)
                break;
            end
        end
        if ~isempty(s)
            r = [r,i];
        end
    end

end

