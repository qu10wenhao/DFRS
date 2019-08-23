function [ d_index ] = Data_decomp( D,node_num )
%UNTITLED17 此处显示有关此函数的摘要
%   此处显示详细说明
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
    
    capacities = ceil(ird_num/(node_num)) * ones(node_num, 1);
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
                waitlist = [waitlist;F_c{i}];
            end
            if sizea >= length(Fca)*0.75
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
            subb = waitlist(1:sizeb);
            waitlist = waitlist(sizeb+1:length(waitlist));
            tmp = [tmp;suba;subb];
            d_index{k} = sort(unique(tmp));
            tmp = [];
            k = k + 1;
            cap = 0;
            if sizeb == length(waitlist)
                suba = [];
            end
        else
            subb = waitlist;
            waitlist = [];
            cap = cap - length(suba)*length(subb);
            tmp = [tmp;suba;subb];
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

