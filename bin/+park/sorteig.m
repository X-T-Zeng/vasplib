function [Asort,Usort] = sorteig(U,A)
if nargin <2
    mode = 'eigenval';
    NUM_WAN = length(U);
else
    mode = 'whole';
    NUM_WAN = length(A);
end
NBANDS = length(U);

if strcmp(mode,'whole')
    % %--step9--:���Ӵ�С������ֵ˳������������϶�Ӧ����������
    Asort=zeros(NUM_WAN ,NBANDS );
    SortTmp=diag(U);%��ȡ����ֵ   
    [Usort,IJ]=sort(SortTmp,1,'ComparisonMethod','real');
    for jj=1:NBANDS 
        Asort(:,jj)=A(:,IJ(jj));%ȡ����������������        
    end
    Usort = diag(Usort);
elseif strcmp(mode,'eigenval')
    % %--step9--:���Ӵ�С������ֵ˳������������϶�Ӧ����������
    SortTmp=diag(U);%��ȡ����ֵ        
    [Usort,~]=sort(SortTmp,1);
    Usort = diag(Usort);
    Asort = [];
end