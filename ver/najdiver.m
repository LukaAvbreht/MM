function T_min=najdiver(T1,T2,l,tol)
%RISIVER narise diskretno veriznico in poisce minimum
%T_min=RISIVER(T1,T2,l,ro,tol,nt,barva)
%T_min je tocka, kjer je veriznica najnizje
%T1 in T2 sta krajisci veriznice oblike
%T1=[a,A], T2=[b,B], l je dolzina,
%tol toleranca pri iteraciji,
%nt stevilo tock risanja in barva barva izrisa

if nargin < 4; tol = 1e-10;end
if nargin < 3; l = 20;end
if nargin < 2; T2=[5;3];end
if nargin < 1; T1=[0;5];end

z0 = 1;

z = isciz(T1, T2, l, z0, tol);

a = T1(1);
A = T1(2);
b = T2(1);
B = T2(2);

arg = (B-A)/l;

v = atanh(arg) + z;
u = atanh(arg) - z;

C = (b-a)/(v-u);
D = (a*v - b*u)/(v-u);

lambda = A - C*cosh((a-D)/C);

TT = [D;lambda+C];

disp(D);

T_min = D;

end