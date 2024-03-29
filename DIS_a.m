function [ result ] = DIS_a( a , F, D, lambdas, total_size)
%a: selected attribute index
%F: attributes of all samples
%D: all decisions
%lambdas: all lambdas
%total_size: number of samples
%   Calculate DIS of selected attribute.
    if ~exist('total_size', 'var')
        total_size = size(D,1);
    end
    s = size(D,1);
    
    info = tabulate(D);
    class = info(:,1);
    c_num = zeros(size(class));
    for i=1:length(class)
        c_num(i) = length(find(D == class(i)));
    end
    ird_num = 0;
    for i=1:length(class)
        for j=i+1:length(class)
            ird_num = ird_num + c_num(i)*c_num(j);
        end
    end
    
    
    r = zeros(1,ird_num);
    index = 1;
    for i=1:s
        for j=1:s
            if D(i) == D(j)
                continue
            end
            if T_M(R_a(F(i,a),F(j,a)),max(lambdas(i),lambdas(j))) == 0
                r(index) = i*10^(floor(log10(total_size))+1)+j;
                index = index + 1;
            end
        end
    end
    result = r(1:index-1);
    clear r;
end

