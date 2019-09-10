function [ r ] = Lambda( x_i, F, D )
%x_i: index of x
%F: attributes of all samples
%D: all decisions
%   Canculate lambda
     r = 1;
     for i=1:size(D,1)
         if i == x_i
             continue
         end
         if D(i) == D(x_i)
             continue
         end
         r = min(r, Theta_M(R(F(i,:),F(x_i,:)),0));
     end
end

