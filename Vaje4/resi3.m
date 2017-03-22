function x=resi3(M,b);
%RESI3 resevanje tridiagonalnega sistema, predstavljenega
%samo s tremi vektorji in desno stranjo
%x=RESI3(M,b)
%x je resitev sistema, M je matrika diagonal dim. nx3, v prvem
%stolpcu je spodnja obdiagonala (nicla na mestu (1,1)),
% v drugem diagonala, v tretjem pa zgornja obdiagonala (nicla
%na mestu (n,3)
%      |0**|
% M  = |***|  Kar predstavla glavno pddiagonalo , diagonalo in 
%      |**0|  prvo superdiagonalo
%b je desna stran sistema
% Mx = b
if nargin < 2
   M = [0 1 3;4 5 2;2 1 6;1 2 0];
   b = [1;1;1;1];
end

n = length(b);
A = M(:,2);
C = M(:,1);
B = M(:,3);

U = zeros(n,1);
L = zeros(n,1);
V = zeros(n,1);
U(1) = A(1);
V(1) = B(1);
for i = 2:n
   V(i) = B(i);
   L(i) = C(i)/U(i-1);
   U(i) = A(i) - (L(i)*V(i-1));
end

x = zeros(n,1);
Y = zeros(n,1);

Y(1) = b(1);
for i = 2:n
   Y(i) = b(i) - (L(i)*Y(i-1)); 
end

x(n) = Y(n)/U(n);
for i = n-1:-1:1
   x(i) = (Y(i)-(V(i)*x(i+1)))/U(i); 
end
end