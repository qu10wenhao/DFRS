function [ DISred, red ] = Add_feature( DISas, DISred, red, total)
%DISas: DIS of each attributes
%DISred: DIS of current reduct
%red: reduct
%total: number of total attributes
%   Add one attribute to maximize DIS
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

