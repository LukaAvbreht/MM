function [r,u]=poves_opne(f,R,n)
%POVES_OPNE racuna obliko prereza opne, napete
%na krozno zanko
%[r,u]=OPNA(f,R,n)
%OUTPUT:
%r je delitev v r-smeri
%u je vektor priblizkov za resitev
%INPUT:
%f je desna stran enacbe u''+1/r u'=f(r)
%R je radij krozne zanke
%n je stevilo notranjih delilnih tock
%uporabimo kompakten zapis matrike (resi3.m)

r = linspace(0,R,n+2);
h = r(3)- r(2);
%pripravimo si matriko in vektor
b = h^2*feval(f,r(1:end-1));
M = zeros(n+2,3);
M(1,2) = -2;
M(1,3) = 2;
for i = 2:n+2
    M(i,1) = 1- h/(2*r(i));
    M(i,2) = -2;
    M(i,3) = 1 + h/(2*r(i));
end
M(n+2,3) = 0;

u = resi3Uradna(M,b);
u = [u;0];
end
