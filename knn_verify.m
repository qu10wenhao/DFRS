function [ acc ] = knn_verify( F, D, k )
%F: attributes of all samples
%D: all decisions
%k: k of KNN
%   KNN verification
    datanum = size(F,1);
    p = ceil(datanum/10);
    cor = 0;
    for step=1:10
        Test_F = F(step*p-p+1:min(step*p,datanum),:);
        Test_D = D(step*p-p+1:min(step*p,datanum),:);
        Train_F = F([1:step*p-p,step*p:datanum],:);
        Train_D = D([1:step*p-p,step*p:datanum],:);
        for i=1:size(Test_F,1)
            distances = zeros(size(Train_D));
            for j=1:size(Train_F,1)
                d = sqrt(sum((Test_F(i,:)-Train_F(j,:)).^2));
                distances(j) = d;
            end
            [~,s_i] = sort(distances);
            classes = zeros(k,1);
            for j=1:k
                classes(j) = Train_D(s_i(j));
            end
            cc = tabulate(classes);
            [~,c_i] = sort(cc(:,2),'descend');
            class = cc(c_i(1),1);
            if class == Test_D(i)
                cor = cor + 1;
            end
        end
    end
    %size(Train_F)
    acc = cor/datanum;
        
        
end

