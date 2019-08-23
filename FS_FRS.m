function [ red, t ] = FS_FRS( F,D )
%UNTITLED17 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    tic;
    fnum = size(F,2);
    lambdas = Cal_lambdas(F,D);
    DISas = Cal_DISas(F, D, lambdas);
    DISR = DIS(1:fnum,DISas);
    red = Get_Core(DISas);
    DISred = DIS(red,DISas);
    while size(DISR,1) ~= size(DISred,1)
        [DISred, red] = Add_feature( DISas, DISred, red, fnum);
    end
    t = toc;
end

