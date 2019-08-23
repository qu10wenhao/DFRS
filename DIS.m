function [ r ] = DIS( R , DISs)
%R: set of selected feature index
%   此处显示详细说明
    r = [];
    for i=R
        r = union(r,DISs{i});
    end
end

