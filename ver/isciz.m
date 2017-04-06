function z=isciz(T1,T2,l,z0,tol)
%ISCIZ funkcija, ki resi enacbo z=asinh(ro*z) za
%zvezno veriznico
%z=ISCIZ(T1,T2,l,z0,tol) vrne priblizek za resitev z
%T1 in T2 sta krajisci veriznice oblike T1(a,A) in
%T2(b,B), l dolzina veriznice
%z0 zacetni priblizek, tol toleranca pri ustavitvi iteracije

if nargin < 5; tol = 1e-10;end
if nargin < 4; z0 = 1;end
if nargin < 3; l = 15;end
if nargin < 2; T2=[5;3];end
if nargin < 1; T1=[0;5];end

ro = l/(T2(1) - T1(1))*sqrt(1-(T2(2)-T1(2))^2/l^2);

raz = inf;
while raz > tol
    z = asinh(ro*z0);
    raz = abs(z-z0);
    z0 = z;
end



end