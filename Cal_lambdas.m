function [ r ] = Cal_lambdas( F, D )
%F: attributes of all samples
%D: all decisions
%   Canculate lambda of each samples
     r = zeros(size(D));
     for i=1:size(D,1)
         r(i) = Lambda(i,F,D);
     end

end

