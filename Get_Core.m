function [ r ] = Get_Core( DISas )
%DISas: DIS of each attributes
%   Calculate Core set based on all DIS
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

