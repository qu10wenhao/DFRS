function [ lambdas, new_DISas, F, D ] = Update_RDR( F_T, D_T, lambdas, DISas, F_U, D_U, total_size )
%UNTITLED18 此处显示有关此函数的摘要
%   此处显示详细说明
    [fpx, fnum] = size(F_T);
    lambdaks = Cal_lambdas(F_U,D_U);
    DISkas = Cal_DISas(F_U, D_U, lambdaks);
    [lambdas, modifies] = Update_lambdas( F_T, D_T, lambdas, F_U, D_U, lambdaks);
    %DISR = union(DISR,DIS(1:fnum,DISkas));
    new_DISas = cell(fnum,1);
    F = [F_T;F_U];
    D = [D_T;D_U];
    step = 10^(floor(log10(total_size))+1);
    for a=1:fnum
        %tic;
        DISa = union(DISas{a},DISkas{a});
        if size(DISa,1) ~= 1
            DISa = DISa';
        end
        for i=1:fpx
            for j=fpx+1:fpx+size(F_U,1)
                if D(i) == D(j)
                    continue
                end
                if T_L(R_a(F(i,a),F(j,a)),lambdas(i)) == 0
                    pair = i*step+j;
                    DISa = [DISa, pair];
                end
            end
            if modifies(i) == 0
                continue
            end
            
            for j=1:fpx
                if D(i) == D(j)
                    continue
                end
                if T_L(R_a(F(i,a),F(j,a)),lambdas(i)) == 0
                    pair = i*step+j;
                    if ~ismember(pair, DISa)
                        DISa = [DISa, pair];
                        %DISR = union(DISR, pair);
                    end
                end
            end
        end
        
        for i=fpx+1:fpx+size(F_U,1)
            for j=1:fpx
                if D(i) == D(j)
                    continue
                end
                if T_L(R_a(F(i,a),F(j,a)),lambdas(i)) == 0
                    pair = i*step+j;
                    DISa = [DISa, pair];
                end
            end
            if modifies(i) == 0
                continue
            end
            for j=fpx+1:fpx+size(F_U,1)
                if D(i) == D(j)
                    continue
                end
                if T_L(R_a(F(i,a),F(j,a)),lambdas(i)) == 0
                    pair = i*step+j;
                    if ~ismember(pair, DISa)
                        DISa = [DISa, pair];
                        %DISR = union(DISR, pair);
                    end
                end
            end
        end
        
        new_DISas{a} = DISa;
        %toc
    end

end

