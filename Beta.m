function [ r ] = Beta( a_i,x_i,F,D )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
     r = 1;
     for i=1:size(D,1)
         if i == x_i
             continue
         end
         if D(i) == D(x_i)
             r = min(r, R_a(F(x_i,a_i),F(i,a_i)));
         end
     end

end

