function [Green_00,Green_00s1,Green_00s2]= Tmatrix2Green00(Tmatrix,H00,H01,w,eta,n)
if nargin < 6
    n=2;
end
    Dimi = length(H00);
    wc = w + 1i*eta;    
    %disp(Tmatrix);
    [A,U] = eig(Tmatrix^n);
    U_abs =abs(U);
    [Asort,Usort] = sorteig(U_abs,A);
    Lambda= diag(Usort);
    S = Asort(:,Lambda<1);
    SS = Asort(:,Lambda>1);
    S2 = S(1:Dimi,:);
    S1 = S(Dimi+1:2*Dimi,:);
    S3 = SS(Dimi+1:2*Dimi,:);
    S4 = SS(1:Dimi,:);
    phi1 = H01*S2/S1;
    phi2 = H01'*S3/S4;
    Green_00 = inv(wc*eye(Dimi)-H00-phi1-phi2);
    Green_00s2 = inv(wc*eye(Dimi)-H00-phi1);
    Green_00s1 = inv(wc*eye(Dimi)-H00-phi2);
%     Green00.Green_00 =Green_00;
%     Green00.Green_00s1 =Green_00s1;
%     Green00.Green_00s2 =Green_00s2;
end

% function [Asort,Usort] = sorteig_abs(U,A)
% if nargin <2
%     mode = 'eigenval';
%     NUM_WAN = length(U);
% else
%     mode = 'whole';
%     NUM_WAN = length(A);
% end
% NBANDS = length(U);
% SortTmp=abs(diag(U));%��ȡ����ֵ  
% if strcmp(mode,'whole')
%     % %--step9--:���Ӵ�С������ֵ˳������������϶�Ӧ����������
%     Asort=zeros(NUM_WAN ,NBANDS );
%  
%     [Usort,IJ]=sort(SortTmp,1);
%     for jj=1:NBANDS 
%         Asort(:,jj)=A(:,IJ(jj));%ȡ����������������        
%     end
%     Usort = diag(Usort);
% elseif strcmp(mode,'eigenval')
%     % %--step9--:���Ӵ�С������ֵ˳������������϶�Ӧ����������%��ȡ����ֵ        
%     [Usort,~]=sort(SortTmp,1);
%     Usort = diag(Usort);
%     Asort = [];
% end
% end