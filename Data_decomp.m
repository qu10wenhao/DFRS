function [ d_index ] = Data_decomp( D,node_num )
%D: all decisions
%node_num: node number of cluster
%   Data Decompostion Algorithm
    info = tabulate(D);
    class = info(:,1);
    F_c = cell(size(class));
    c_num = zeros(size(class));
    for i=1:length(class)
        c_num(i) = length(find(D == class(i)));
    end
    [cc,c_num_s] = sort(c_num,'descend');
    %disp([cc,c_num_s]);
    for i=1:length(class)
        c = c_num_s(i);
        F_c{i} = find(D == class(c));
    end
    
    ird_num = 0;
    for i=1:length(class)
        for j=i+1:length(class)
            ird_num = ird_num + c_num(i)*c_num(j);
        end
    end
    
    %Suppose the capacities of all nodes are same and can satisfy the needs
    capacities = ceil(1.1*ird_num/(node_num)) * ones(node_num, 1);
    d_index = cell(node_num,1);
    
    suba = [];
    subb = [];
    sizea = 0;
    sizeb = 0;
    c_i = 1;
    waitlist = [];
    k = 1;
    cap = 0;
    F_c_tmp = F_c;
    full_t = false;
    tmp = [];
    while k <= node_num
        if cap <= 0
            cap = capacities(k);
        end
        if c_i == length(class)
            c_i = 1;
            F_c_tmp = F_c;
            full_t = true;
        end
        if isempty(suba)
            sizea = ceil(sqrt(cap));
            Fca = F_c_tmp{c_i};
            for i = c_i+1:length(class)
                %reversed order could reduce unexpected interrelation when
                %one node is considered in two iterations.
                waitlist = [flipud(F_c{i});waitlist];
                %waitlist = [waitlist;F_c{i}];
            end
            %Whenever reset SubA, we add a multiplier r=0.75 to avoid that 
            %the rest of Fca only contains very little elements, which 
            %makes next SubA far smaller than expected. If SubA is too
            %small, SubB will become larger to fulfill the capacity, which
            %greatly enlarge the total data size and increase chance to
            %invovle more unexpected interrelation.
            %
            %For example, the capacity is 10000:
            %         |         node i          |        node i+1           
            %         | cap | Fca | SubA | SubB | cap | Fca | SubA | SubB 
            %without r|10000| 125 | 100  | 100  |10000| 25  | 25   | 400
            % with r  |10000| 125 | 125  | 80   | new decision class (Fca)
            r = 0.75;
            if sizea >= length(Fca)*r
                suba = Fca;
                F_c_tmp{c_i} = [];
                c_i = c_i + 1;
            else
                suba = Fca(1:sizea);
                F_c_tmp{c_i} = Fca(sizea+1:length(Fca));
            end
        end
        %disp(length(suba))
        sizeb = ceil(cap/length(suba));
        if sizeb <= length(waitlist)
            %Enough elements could be found in waitlist to fulfill SubB in
            %order to satisfy the capacity of current node k. Then, data
            %decomposition for node k is complete and we will consider node
            %k+1 in next iteration.
            subb = waitlist(1:sizeb);
            waitlist = waitlist(sizeb+1:length(waitlist));
            tmp = unique([tmp;suba;subb]);
            d_index{k} = sort(unique(tmp));
            tmp = [];
            k = k + 1;
            cap = 0;
            if sizeb == length(waitlist)
                suba = [];
            end
        else
            %the rest elements in waitlist can not satisfy the needs of
            %SubB. Thus, next iteration will still work on node k to
            %fulfill the remaining capacity.
            %It make sure that all the interrelation will be considered.
            %However, it may leed to more unexpected interrelation.
            subb = waitlist;
            waitlist = [];
            cap = cap - length(suba)*length(subb);
            tmp = unique([tmp;suba;subb]);
            suba = [];
            if cap <= 0
                d_index{k} = sort(unique(tmp));
                tmp = [];
                k = k + 1;
            end
        end
    end 
    if c_i == length(class)
        full_t = true;
    end
    
    if full_t
        fprintf('Interrelation has been fullly traversed!\n');
    else
        c_i
        F_c_tmp
    end

end

