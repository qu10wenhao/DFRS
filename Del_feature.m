function [ red ] = Del_feature( DISas, red)
%UNTITLED16 此处显示有关此函数的摘要
%   此处显示详细说明
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

