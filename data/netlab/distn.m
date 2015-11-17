function [dist_mat]=distn(y,syn,sk,cent)
[R_c,C_c]=size(cent);
[R,C]=size(y);
for i=1:R_c
    v=y-repmat(cent(i,:),R,1);
    dist_mat(i,:)=sum(syn.*(v.^2),2)';
end