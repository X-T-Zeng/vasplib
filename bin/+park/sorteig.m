function [Asort,Usort] = sorteig(U,A)
if nargin <2
    mode = 'eigenval';
    NUM_WAN = length(U);
else
    mode = 'whole';
    NUM_WAN = length(A);
end
NBANDS = length(U);
if ~isvector(U)
    SortTmp=diag(U);%��ȡ����ֵ
    vec = false;
else
    SortTmp = U;
    vec = true;
end
if strcmp(mode,'whole')
    % ���Ӵ�С������ֵ˳������������϶�Ӧ����������
    Asort=zeros(NUM_WAN ,NBANDS );
    [Usort,IJ]=sort(SortTmp,1,'ComparisonMethod','real');
    for jj=1:NBANDS
        Asort(:,jj)=A(:,IJ(jj));%ȡ����������������
    end
    if ~vec
        Usort = diag(Usort);
    end
elseif strcmp(mode,'eigenval')
    % ���Ӵ�С������ֵ˳������������϶�Ӧ����������
    SortTmp=diag(U);%��ȡ����ֵ
    [Usort,~]=sort(SortTmp,1,'ComparisonMethod','real');
    if ~vec
        Usort = diag(Usort);
    end
    Asort = [];
end
end