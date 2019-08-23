function [ r, mod ] = Update_lambdas( F_T, D_T, lambdas, F_U, D_U, lambdaks)
%UNTITLED12 此处显示有关此函数的摘要
%   此处显示详细说明
     r = zeros(size(D_T,1)+size(D_U,1),1);
     mod = zeros(size(D_T,1)+size(D_U,1),1);
     for i=1:size(D_T,1)
         lambda = lambdas(i);
         for j = 1:size(D_U,1)
             tmp = Theta_L(R(F_T(i,:),F_U(j,:)),0);
             if tmp < lambda
                lambda = tmp;
                mod(i) = 1;
             end
         end
         r(i) = lambda;
     end
     
     fpx = size(D_T,1);
     for i=1:size(D_U,1)
         lambda = lambdaks(i);
         for j = 1:size(D_T,1)
             tmp = Theta_L(R(F_U(i,:),F_T(j,:)),0);
             if tmp < lambda
                lambda = tmp;
                mod(i) = 1;
             end
         end
         r(fpx+i) = lambda;
     end

end