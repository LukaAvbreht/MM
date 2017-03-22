function x=resi3Uradna(M,b);
%RESI3 resevanje tridiagonalnega sistema, predstavljenega
%samo s tremi vektorji in desno stranjo
%x=RESI3(M,b)
%x je resitev sistema, M je matrika diagonal dim. nx3, v prvem
%stolpcu je spodnja obdiagonala (nicla na mestu (1,1)),
% v drugem diagonala, v tretjem pa zgornja obdiagonala (nicla
%na mestu (n,3)
%b je desna stran sistema

if nargin < 2
   M = [0 1 3;4 5 2;2 1 6;1 2 0];
   b = [1;1;1;1];
end

n = length(b);
x = zeros(n,1);
% eliminacije
for i = 2:n
   M(i,1) = M(i,1) / M(i-1,2);
   M(i,2) = M(i,2) - M(i,1)*M(i-1,3);
   %to je del preme substitucije
   b(i) = b(i) - M(i,1)*b(i-1);
end
% del obratne susbstitucije (resevanje LU)
x(n) = b(n)/M(n,2);
for i = n-1:-1:1
   x(i) = (b(i)- M(i,3)*x(i+1))/M(i,2);
end
end