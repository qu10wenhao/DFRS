function [ r ] = Cal_DISas( F, D, lambdas, total_size)
%F: attributes of all samples
%D: all decisions
%lambdas: all lambdas
%total_size: sample number
%   Calculate DIS of each attributes
    if ~exist('total_size', 'var')
        total_size = size(D,1);
    end
    r = cell(size(F,2),1);
    for i=1:size(F,2)
        r{i} = DIS_a(i,F, D, lambdas, total_size);
    end

end

