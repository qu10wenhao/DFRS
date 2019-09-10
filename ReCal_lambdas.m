function [ r ] = ReCal_lambdas( F, D, lambdas)
%F: attributes of all samples
%D: all decisions
%lambdas: global lambda list
%   Update lambda list based on result calculated on each node
     r = lambdas;
     for i=1:size(r,1)
         r(i) = min(r(i),Lambda(i,F,D));
     end

end

