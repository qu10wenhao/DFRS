function [ r ] = DIS( R , DISs)
%R: set of selected feature index
%   �˴���ʾ��ϸ˵��
    r = [];
    for i=R
        r = union(r,DISs{i});
    end
end

