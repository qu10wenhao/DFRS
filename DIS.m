function [ r ] = DIS( R , DISs)
%R: set of selected attribute index
%DISs: DIS of each attribute
%   Merge DIS of selected attribute set
    r = [];
    for i=R
        r = union(r,DISs{i});
    end
end

